<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="content_list_1">
    <div class="content_title conttitlePrev">
        <h2><spring:message code='sal.label.scancar.mob' /><!--  스캔차량 --></h2>
        <div class="title_btn">
            <%-- <span class="tbtn01" id="stockCreate"><spring:message code='sal.btn.stockCreate' /></span> --%>
            <dms:access viewId="VIEW-D-12625" hasPermission="${dms:getPermissionMask('READ')}">
                <span class="tbtn01" id="selAll"><spring:message code='par.lbl.selectAll' /></span>
            </dms:access>
        </div>
    </div>
    <div class="listarea">
        <div class="listhead checkitem">
            <span style="width:20%;"><spring:message code='mob.lbl.barcode' /></span>
            <span style="width:40%; text-align: center;"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
            <span style="width:25%;"><spring:message code='sal.lbl.remark' /><!-- 비고 --></span>
            <span style="width:15%;"><spring:message code='global.title.result' /><!-- 결과 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
    <div class="btnfixed">
        <div class="con_btnarea btncount2">
            <dms:access viewId="VIEW-D-12624" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btn_scan"><spring:message code='mob.lbl.scan' /></span></div><!-- 스캔 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12623" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btn_delete"><spring:message code='global.btn.del' /><!-- 삭제--></span></div>
            </dms:access>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12622" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1"><span class="search" id="btn_wearingSearch"><spring:message code='par.menu.inInvest' /><spring:message code='global.lbl.target' /><spring:message code='mob.title.search' /><!-- 실사대상조회  --></span></span></div>
            </dms:access>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="checkitem bgNone" id="listContentRow">
    <span class="check">
        <input id="isSave_#:rowIdx #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rowIdx #"></label>
    </span>
    <span style="width:20%;" class="spanNormal">#:vehicleCd.substring(2,vehicleCd.length) #</span>
    <span style="width:40%;" class="spanNormal carlineNm">#:chgBarcodeToCarlineNm(vehicleCd) #</span>
    <span style="width:25%;" id="remark_#:vehicleCd #" class="remark"><button class="remarkBtn" style="font-size:10px">#:remarkBtn #</button></span>
    <input type="hidden" id="text_remark_#:vehicleCd #" name="remarkText" value="#:trimNull(remark) #" />
    <span style="width:15%;" class="spanNormal">#:chgRET(RET) #</span>
    <input type="hidden" name="barcodeNo" value="#:trimNull(barcodeNo) #" />
</div>
</script>

<script>
var isSelAll=false;
function getItemList(resultList){

    var result = JSON.parse(resultList);
    var listView = $("#listView").data("kendoListView");
    var rowCount = result.data.length;
    var remarkBtnLabel="<spring:message code='global.btn.add' />";
    $.each(result.data , function(i , row){
        if(trimNull(row.REMARK).length>0){remarkBtnLabel="<spring:message code='sal.lbl.Print' />";}else{remarkBtnLabel="<spring:message code='global.btn.add' />";}
        listView.dataSource.insert({
            rowIdx:rowCount,
            createDate:row.CREATE_DATE,
            insertDate:row.INSERT_DATE,
            vehicleCd:row.VEHICLE_CD,
            barcodeNo:row.VEHICLE_CD,
            remark:row.REMARK,
            remarkBtn:remarkBtnLabel,
            RET:row.RET
        });
        rowCount --;
    });
}


function resetDataSource(){
    var ListView1 = $("#listView").data("kendoMobileListView");
    ListView1.dataSource.data([]);
}
$(document).ready(function() {
      setTimeout(function(){getItemListInit(true);},200);
      currentContent_list=1;
      $("#listView").kendoListView({
          template: kendo.template($("#template").html())
          ,autoBind: false
          ,dataBinding: function(e) {
              if(e.items.length == 0){
                  $("#listView").css(
                          {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                              ,"background-repeat":"no-repeat"
                              ,"background-position":"center"});
              }else{
                  $("#listView").css({"background-image":"none"});
              }
          }
      });
      $("#listView").height($(window).height()-($("#header").outerHeight()+$("#content_list_1 > div").outerHeight()+$(".listhead").outerHeight()+$(".btnfixed").outerHeight()));
});


function trimNull(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = val;
    }
    return returnVal;
}

function chgBarcodeToCarlineNm(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.carNameMap[val];
    }
    return returnVal;
}
function chgRET(val){
    var returnVal = "";
    if(val == "9"){
        returnVal = "<spring:message code='global.btn.failed'/>";
    }else{
        returnVal ="";
    }
    return returnVal;
}
$(document).on("click", ".remarkBtn", function(e){
    contentRemark($(this).parent().attr("id"), $(this).parent().siblings(".carlineNm").text(), $(this).parent().siblings("input[name=remarkText]").val());
});
//버튼 - 전체선택
$("#selAll").bind("click", function()
{
    if(isSelAll){
        $("input[name='isSaveName']").each(function(cnt){
            $("input[name='isSaveName']")[cnt].checked = false;
        });
        isSelAll=false;
    }else{
        $("input[name='isSaveName']").each(function(cnt){
            $("input[name='isSaveName']")[cnt].checked = true;
        });
        isSelAll=true;
    }
});
</script>

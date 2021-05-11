<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list_3" style="display:none;">
    <div class="content_title conttitlePrev">
        <h2><spring:message code='global.lbl.stock' /><spring:message code='sal.label.invlist.mob' /><!-- 실사대상 --></h2>
        <div class="title_btn">
             <span class="tbtn01" id="selAll2"><spring:message code='par.lbl.selectAll' /></span>
        </div>
    </div>

    <div class="listarea">
        <div class="listhead checkitem" id="secondHeader">
            <span style="width:65%;"><spring:message code='global.lbl.vinNum' /></span>
            <span style="width:35%;"><spring:message code='mob.lbl.barcode' /><!-- 바코드 --></span>
            <span style="width:65%"><spring:message code="global.lbl.ocn" /><!-- OCN -->/<spring:message code="global.lbl.model" /><!-- 차관 --></span>
            <span style="width:35%;"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
            <span style="width:65%;"><spring:message code='global.lbl.extColor' />/<spring:message code='global.lbl.intColor' /><!-- 외장색/내장색 --></span>
            <span style="width:35%;"><spring:message code="par.lbl.inInvestYn" /><!-- 실사여부 --></span>
            <span style="width:100%;"><spring:message code="sal.lbl.remark" /><!-- 비고 --></span>
        </div>
        <div>
            <div id="listView2" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
     <div class="con_btnarea btncount2">
        <div><span id="btnClose2" class="btnd1"><span><spring:message code="global.btn.close" /><!-- 닫기 --></span></span></div>
        <dms:access viewId="VIEW-D-12620" hasPermission="${dms:getPermissionMask('READ')}">
            <div><span class="btnd1" id="btnReceiveCnfrm"><spring:message code="mob.sal.btn.doStock" /><!-- 실사 --></span></div>
        </dms:access>
    </div>
</section>
<script type="text/x-kendo-template" id="template2">
    <div class="checkitem bgNone">
        <span class="check">
            <input type="checkbox" id="check_confirm_#:rnum#" name="check_confirm" class="f_check"/><label for="check_confirm_#:rnum#"></label>
            <input type="hidden" name="hidden_confirm" value="#:rnum#"/>
            <input type="hidden" name="hidden_confirm_vinNo" value="#:vinNo#"/>
            <input type="hidden" name="hidden_confirm_confirmYn" value="#:confirmYn#"/>
            <input type="hidden" name="hidden_confirm_carStatCd" value="#:carStatCd#"/>
            <input type="hidden" name="hidden_confirm_carId" value="#:carId#"/>
            <input type="hidden" name="hidden_confirm_stockDt" value="#:stockDt#"/>
            <input type="hidden" name="hidden_confirm_remark" value="#:chgRemarkIdToRemark(barcodeNo)#"/>
        </span>
        <span style="width:65%;">#:vinNo#</span>
        <span style="width:35%;">#:barcodeNo#</span>
        <span class="clboth" style="width:65%;">#:ocnCd#/#:modelNm#</span>
        <span style="width:35%">[#:carlineCd #]#:carlineNm #</span>
        <span class="clboth" style="width:65%;">#:extColorNm#/#:intColorCd#</span>
        <span style="width:35%;">#:chgYn2Nm(confirmYn)#</span>
        <span class="clboth" style="width:100%;">#:chgRemarkIdToRemark(barcodeNo)#</span>
    </div>
</script>

<script>
var isSelAll2=false;
//버튼 - 전체선택2
$("#selAll2").bind("click", function()
{
    if(isSelAll2){
        $("input[name='check_confirm']").each(function(cnt){
            $("input[name='check_confirm']")[cnt].checked = false;
        });
        isSelAll2=false;
    }else{
        $("input[name='check_confirm']").each(function(cnt){
            $("input[name='check_confirm']")[cnt].checked = true;
        });
        isSelAll2=true;
    }
});
var listData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailMobSearch.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var searchData = {sDlrCd:dlrCd,barcodeList:selList};
                return kendo.stringify(searchData);
            }
        }
    }
    ,batch:true
    //,pageSize:pageSize
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
             ,fields:{
                rnum:{type:"number"}
            }
        }
    }
    ,change :function(e){
        lastInventoryData=e.items;
    }
    ,error:function(e){
        console.log(e);
    }
});


function getConfirmWearingArr(){
    var confirmWearingArr = [];
    var obj = {};
    // 입고확정 대상 데이터 arr로 담기
    $(":checkbox[name ^='check_confirm']").each(function(index){
        if($("input[name ^='check_confirm']")[index].checked == true){
            obj = {};
            obj["carStatCd"] = $("input[name='hidden_confirm_carStatCd']")[index].value;
            obj["vinNo"] = $("input[name='hidden_confirm_vinNo']")[index].value;
            obj["confirmYn"] = $("input[name='hidden_confirm_confirmYn']")[index].value;
            obj["carId"] = $("input[name='hidden_confirm_carId']")[index].value;
            obj["stockDt"] = chgDate($("input[name='hidden_confirm_stockDt']")[index].value);
            obj["remark"] = $("input[name='hidden_confirm_remark']")[index].value;
            confirmWearingArr.push(obj);
         }
    });
    return confirmWearingArr;
}
function chgYn2Nm(obj){
    if(obj=="Y"){
        return "<spring:message code='global.btn.completion' />";
    }else{
        return "<spring:message code='global.lbl.incomplete' />";
    }
}
function chgRemarkIdToRemark(obj){
    var returnVal;
    if(obj!=null||obj != "undefined"){
        returnVal=parent.remarkMap["remark_"+obj];
    }

    if(returnVal == "undefined"){
        returnVal="";
    }
    return returnVal;
}
$(document).ready(function() {
    $("#listView2").kendoListView({
        dataSource:listData2
        ,template: kendo.template($("#template2").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView2").css({"background-image":"none"});
            }
        }
    });
    //$("#listView").height($(window).height()-($("#header").outerHeight()+$("#content_list_1 > div").outerHeight()+$(".listhead").outerHeight()+$(".btnfixed").outerHeight()));
});
</script>

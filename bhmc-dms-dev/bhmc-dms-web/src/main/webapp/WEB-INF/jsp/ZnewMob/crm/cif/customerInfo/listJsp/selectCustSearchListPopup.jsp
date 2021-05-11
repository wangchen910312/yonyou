<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<div class="dlistitem listhead">
    <span style="width:45%"><spring:message code='global.lbl.custNm' /></span>
    <span style="width:55%"><spring:message code='global.lbl.sex' /></span>
    <span style="width:45%" class="clboth"><spring:message code="global.lbl.hpNo" /></span>
    <span style="width:55%"><spring:message code="crm.lbl.potenCust" />/<spring:message code="crm.lbl.haveCust" /></span>
</div>
<div>
    <div id="_listView" style="height:300px; overflow:scroll"></div>
</div>


<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:45%">#:custNm #</span>
    <span style="width:55%">#:chgSexCdMap(sexCd) #</span>
    <span style="width:45%" class="clboth">#:trimNull(hpNo) #</span>
    <span style="width:55%">#:chgCustCdMap(custCd) #</span>
</div>
</script>

<script>
var viewRow =10;
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
      transport:{
          read:{
              url:"<c:url value='/crm/cif/customerRegistPresent/customerListSearch.do' />"
              ,type:"POST"
              ,dataType:"json"
              ,contentType:"application/json"
          }
        ,parameterMap:function(options, operation) {
            var params = {};

            params["firstIndex"] = pageIndex;
            params["lastIndex"] = pageSize;

            if(document.location.href.indexOf("/mob/crm/cif/customerInfo/selectCustomerInfoMain.do") > -1){
                params["sCustNm"]  = $("#psCustNm").val();
                params["sCustTp"]  = $("#psCustTp").data("kendoExtDropDownList").value();;
                params["sMngScId"] = $("#psMngScId").data("kendoExtDropDownList").value();
                params["sCustCd"]  = $("#psCustCd").data("kendoExtDropDownList").value();
                params["sHpNo"]    = $("#psHpNo").val();
                params["sSaleDtFrom"]= chgDate($("#psSaleDtFrom").val());
                params["sSaleDtTo"]= chgDate($("#psSaleDtTo").val());
                params["sCustNo"]    = $("#custNo").val();
            }else{
                params["sCustNm"]               =  $("#custNm").val();
                params["sCustTp"]               =  $("#custTp").data("kendoExtDropDownList").value();
                params["sHpNo"]                 =  $("#hpNo").val();
                params["sTelNo"]                =  $("#telNo").val();
                params["sCustNo"]               =  $("#custNo").val();
            }
            return kendo.stringify(params);
        }
    }
    ,batch:true
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
    ,change:function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_detail").css("display","none");
        $("#content_search").css("display","block");
        $("#content_pop_search").css("display","none");
        $("#content_pop_list").css("display","block");
        $("#header_title span").attr("class", "search_open");
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

changeCustTp = function(val){

    var returnVal = "";
    if(val != null && val != ""){
        returnVal = custTpMap[val];
    }
    return returnVal;
};

function listViewClick(dataItem)
{
    if(document.location.href.indexOf("/mob/crm/cif/customerInfo/selectCustomerInfoMain.do") > -1){
        //고객정보관리 메뉴에서 호출시와 구분
        contentDetail(dataItem);
    }else{

        contentCommonDetail(dataItem);

        var curRow = dataItem.rnum-1;
        $('#_listView .dlistitem').each(function(i){
            if(i == curRow){
                $(this).addClass("liston"); // 리스트 선택시 class추가
            } else {
                $(this).removeClass("liston"); // 리스트  해제시 class제거
            }
        });
    }

}

chgCustCdMap = function(val){
    var returnVal = "";

    if(val != null && val != ""){
        if(custCdMap != undefined)
        returnVal = custCdMap[val];
    }
    return returnVal;
};

chgSexCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(sexCdMap != undefined)
        returnVal = sexCdMap[val];
    }
    return returnVal;
};

$(document).ready(function(){
    $("#_listView").kendoListView({
        dataSource:listData
        ,template:kendo.template($("#template").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#_listView").css(
                    {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                        ,"background-repeat":"no-repeat"
                        ,"background-position":"center"});
            }else{
                $("#_listView").css(
                        {"background-image":"none"});
            }
            var gap = 10;
            $("#_listView").height($(window).height()-($("#header").outerHeight()
                                                        +$(".content_title").outerHeight()
                                                        +$("#content_pop_list .listhead").outerHeight()
                                                        +($("#content_pop_list .btnfixed").is(":visible")?$("#content_pop_list .btnfixed").outerHeight():0)
                                                        +($("#content_pop_list .con_btnarea").is(":visible")?$("#content_pop_list .con_btnarea").outerHeight():0)
                                                        +gap));
        }
    });

    $("#_listView").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal>pageSize){
            pageSize+=viewRow;
            pageIndex+=viewRow;
            $(this).data('kendoListView').dataSource.read();
        }
    });

    var gap = 10;
    $("#_listView").height($(window).height()-($("#header").outerHeight()
                                                +$(".content_title").outerHeight()
                                                +$("#content_pop_list .listhead").outerHeight()
                                                +$("#content_pop_list .btnfixed").outerHeight()
                                                +$("#content_pop_list .con_btnarea").outerHeight()
                                                +gap));
});

</script>

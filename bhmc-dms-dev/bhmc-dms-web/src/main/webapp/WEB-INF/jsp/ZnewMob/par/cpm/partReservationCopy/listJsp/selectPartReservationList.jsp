<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='ser.menu.partReserveStatus' /><!-- 부품예약현황 --></h2>
    </div>

    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>

            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.partResveNm" /><!-- 부품예약자 --></span>

            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.partResvTp" /><!-- 부품예약유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.partResvStat" /><!-- 부품예약상태 --></span>

            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.preResvPartHm" /><!-- 부품예약시간 --></span>
            <span style="width:50%"><spring:message code='ser.lbl.preAmt' /><!-- 부품선수금 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll"></div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%">#:carRegNo #</span>
        <span style="width:50%">#:trimNull(vinNo) #</span>
        <span class="clboth" style="width:50%">#:trimNull(parResvDocNo) #</span>
        <span style="width:50%">#:trimNull(regUsrNm) #</span>
        <span class="clboth" style="width:50%">#:changePartResvTpCdList(parResvTp) #</span>
        <span style="width:50%">#:trimNull(parResvStatNm) #</span>
        <span class="clboth" class="clboth" style="width:50%">#:trimNull(chgCustDateTime2Str2(regDt)) #</span>
        <span style="width:50%">#:trimNull(preAmt) #</span>
    </div>
</script>

<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var viewRow = 10;
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];

var listData = new kendo.data.DataSource({
      transport:{
            read:{
                url:"<c:url value='/mob/ser/rev/partReservation/selectPartReservations.do' />"
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation){
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;
                params["sCarRegNo"]       = $("#sCarRegNo").val();
                params["sPartNm"]     = $("#sPartNm").val();
                params["sRegUsrNm"]       = $("#sRegUsrNm").val();
                params["sVinNo"]          = $("#sVinNo").val();
                params["sParResvDocNo"]   = $("#sParResvDocNo").val();
                params["sParResvTp"]      = $("#sParResvTp").data("kendoExtDropDownList").value();
                params["sParResvStartDt"] = chgDate($("#sParResvStartDt").val());
                params["sParResvEndDt"]   = chgDate($("#sParResvEndDt").val());
                params["sParResvStatCd"]  = $("#sParResvStatCd").data("kendoExtDropDownList").value();
                params["sPreFixId"]       = preFixId;
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
    ,change :function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
        makeDetailHtml(e.items, keyMapArr, "#defaultHtml", "#hiddenHtml");
    }
});





changeResvStatCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = resvStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

changePartResvTpCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = partResvTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

chgCustDateTime2Str2 = function(val) {
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = val.substring(0,16);
    }
    return returnVal;
};


function listViewClick(dataItem)
{
    contentDetail(dataItem);
}

</script>

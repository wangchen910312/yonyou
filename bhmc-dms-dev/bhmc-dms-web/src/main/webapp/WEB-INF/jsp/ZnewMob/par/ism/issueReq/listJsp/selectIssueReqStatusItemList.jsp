<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.lbl.infoData" /><!-- 정비수령현황 등록정보 --></h2>
    </div>
    <div class="co_view">
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:40%"><spring:message code='par.lbl.itemCd'/><!-- 부품번호 --></span>
            <span style="width:60%"><spring:message code='par.lbl.itemNm'/><!-- 부품명 --></span>
            <span style="width:40%"><spring:message code='par.lbl.qty'/><!-- 수량 --></span>
            <span style="width:30%"><spring:message code='par.lbl.prc'/><!-- 단가 --></span>
            <span style="width:30%"><spring:message code='par.lbl.amt'/><!-- 금액 --></span>
        </div>
        <div id="subListView" style="height:200px; overflow:scroll"></div>
    </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
        <div class="dlistitem" onclick="javascript:subListViewClick(subListData._view[#:rnum-1 #]);">
            <span style="width:40%">#:itemCd #</span>
            <span style="width:60%">#:itemNm #</span>
            <span style="width:40%">#:resvQty #</span>
            <span style="width:30%">#:kendo.toString(itemPrc, 'n2') #</span>
            <span style="width:30%">#:kendo.toString(itemAmt, 'n2') #</span>
        </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var subListData = new kendo.data.DataSource({
      transport:{
        read:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation){
            var params = {};
            var sParGiTp = $("#sSerReceiveType").val();
            if(sParGiTp == "RO" || sParGiTp == ""){
                sParGiTp = "PG01";//RO or IN or Borrow
            }else if(sParGiTp == "BR" ){
                sParGiTp = "PG02";//Borrow
            }

            params["sParGiTp"] = sParGiTp;
            params["sParReqStatCd"] = $("#sPartsInOutStatus").val();
            params["sRoDocNo"] = $("#sInvRoDocNo").val();
            params["sRoStatCd"] = $("#sParGiStatCd").val();
            params["sGiDocReqStartDt"] = chgDate($("#sGiTimeStartDt").val());
            params["sGiDocReqEndDt"] = chgDate($("#sGiTimeEndDt").val());
            params["sGiDocNo"] = giDocNo;
            params["sCustNm"] = $("#sVisitNm").val();
            params["sSerPrsnId"] = $("#sParGiMan").val();
            params["sCarNo"] = $("#sCarNo").val();
            params["sVinNo"] = $("#sVin").val();
            params["sReceiveNm"] = $("#sGetPrsnNm").val();
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
        if(e.items.length == 1) {
            $("#upBtn").data("kendoButton").enable(false);
            $("#downBtn").data("kendoButton").enable(false);
        }else {
            gData = e.items;
            $("#upBtn").data("kendoButton").enable(true);
            $("#downBtn").data("kendoButton").enable(true);
        }
    }
});

function subListViewClick(dataItem)
{
    contentDetail(dataItem);
}

$(document).ready(function(){
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template:kendo.template($("#subTemplate").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });
});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="par.lbl.repairReptCdt" />&nbsp;<spring:message code="global.title.list" /><!-- 정비수령현황 목록 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
            <span style="width:50%"><spring:message code="par.lbl.serReceiveType" /><!-- 부품수령유형 --></span>
            <span style="width:50%"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></span>
            <span style="width:50%"><spring:message code="par.lbl.partsInOutStatus" /><!-- 부품수령상태 --></span>
            <span style="width:50%"><spring:message code="par.lbl.giTime" /><!-- 출고시간 --></span>
            <span style="width:50%"><spring:message code="par.lbl.receiveMan" /><!-- 수령인 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll;"></div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%">#:roDocNo #</span>
        <span style="width:50%">#:"[" + parGiTp + "]" + changeParGiTp(parGiTp) #</span>
        <span style="width:50%">#:giDocNo #</span>
        <span style="width:50%">#:changeParReqStatCd(parReqStatCd) #</span>
        <span style="width:50%">#:chgDate2DateTimeStr(regDt) #</span>
        <span style="width:50%">#:trimNull(receiveNm) #</span>
    </div>
</script>



<script type="text/javascript">
    var vDateTimeFormat = "${_dateTimeFormat}";
    var vDtyyyyMMdd = "${_dateFormat}";

    var dlrCd  = "${dlrCd}";    // 딜러코드
    var dlrNm  = "${dlrNm}";    // 딜러
    var userId = "${userId}";   // 사용자코드
    var userNm = "${userNm}";   // 사용자
    var toDay = "${toDay}";     // 현재일자
    var oneDay = "${oneDay}";   // 해당월 1일

    var viewRow=10;
    var pageIndex=0, pageSize = viewRow, rowTotal = 0;
    var tempData=[];
    var listData = new kendo.data.DataSource({
        transport:{
            read:{
                url:"<c:url value='/par/ism/issueReserve/selectIssueReqReserveStatus.do' />"
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {
                    var params = {};
                    params["firstIndex"] = pageIndex;
                    params["lastIndex"] = pageSize;

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
                    params["sGiDocNo"] = $("#sGiDocNo").val();
                    params["sCustNm"] = $("#sVisitNm").val();
                    params["sCarNo"] = $("#sCarNo").val();
                    params["sVinNo"] = $("#sVin").val();
                    params["sReceiveNm"] = $("#sGetPrsnNm").val();
                    params["sInvRoManNm"] = $("#sParGiMan").val();
                    return kendo.stringify(params);
                }
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
            contentList();
        }
    });

    changeParGiTp = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = parGiTpMap[val];
        }
        return returnVal;
    };

    changeParReqStatCd = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = partsParReqStatCdMap[val];
        }
        return returnVal;
    };

    changeReceiveId = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = tecCdMap[val];
        }
        return returnVal;
    };

    function listViewClick(dataItem) {
        contentItemListFromList(dataItem);
    }

</script>
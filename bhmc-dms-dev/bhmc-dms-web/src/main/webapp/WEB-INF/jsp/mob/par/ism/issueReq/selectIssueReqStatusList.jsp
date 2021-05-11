<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem">
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

    var pageIndex = 0, pageSize = 100;
    var rowIndex = 0, rowTotal = 1000;

    var listData = new kendo.data.DataSource({
        transport:{
            read:function(options) {
                if (rowIndex >= rowTotal) {
                    return;
                }

                app.showLoading();
                pageIndex++;

                var params = {};
                params["recordCountPerPage"] = pageSize;
                params["pageIndex"] = pageIndex;
                params["firstIndex"] = (pageIndex - 1) * pageSize;
                params["lastIndex"] = pageIndex * pageSize;
                params["sort"] = null;


                var sParGiTp = parent.$("#sSerReceiveType").val();
                if(sParGiTp == "RO" || sParGiTp == ""){
                    sParGiTp = "PG01";//RO or IN or Borrow
                }else if(sParGiTp == "BR" ){
                    sParGiTp = "PG02";//Borrow
                }

                params["sParGiTp"] = sParGiTp;
                params["sParReqStatCd"] = parent.$("#sPartsInOutStatus").val();
                params["sRoDocNo"] = parent.$("#sInvRoDocNo").val();
                params["sRoStatCd"] = parent.$("#sParGiStatCd").val();
                params["sGiDocReqStartDt"] = chgDate(parent.$("#sGiTimeStartDt").val());
                params["sGiDocReqEndDt"] = chgDate(parent.$("#sGiTimeEndDt").val());
                params["sGiDocNo"] = parent.$("#sGiDocNo").val();
                params["sCustNm"] = parent.$("#sVisitNm").val();
                //params["sSerPrsnId"] = parent.$("#sParGiMan").val();
                params["sCarNo"] = parent.$("#sCarNo").val();
                params["sVinNo"] = parent.$("#sVin").val();
                params["sReceiveNm"] = parent.$("#sGetPrsnNm").val();

                params["sInvRoManNm"] = parent.$("#sParGiMan").val();

                console.log("params",params);

                $.ajax({
                    url:"<c:url value='/par/ism/issueReserve/selectIssueReqReserveStatus.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        app.hideLoading();
                    }
                    ,success:function(result) {
                        checklistCnt("listarea_noData",result.total,noDatamsg);
                        if(result.data!=null && result.data != ""){
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;
                                data.push({
                                    parReqDocNo:row.parReqDocNo,
                                    parGiTp:row.parGiTp,
                                    giDocNo:row.giDocNo,
                                    parReqStatCd:row.parReqStatCd,
                                    regDt:row.regDt,
                                    receiveId:row.receiveId,
                                    receiveNm:row.receiveNm,
                                    carNo:row.carNo,
                                    vinNo:row.vinNo,
                                    roDocNo:row.roDocNo

                                });
                            });

                            options.success(data);
                            app.hideLoading();
                        }
                        else {
                            app.hideLoading();
                        }
                    }
                });
            }
        },
        pageSize:pageSize,
        serverPaging:true,
        schema:{
            total:function(){ return rowTotal; }
        }
    });

    changeParGiTp = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = parent.parGiTpMap[val];
        }
        return returnVal;
    };

    changeParReqStatCd = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = parent.partsParReqStatCdMap[val];
        }
        return returnVal;
    };

    changeReceiveId = function(val) {
        var returnVal = "";
        if (val != null && val != "") {
            returnVal = parent.tecCdMap[val];
        }
        return returnVal;
    };

    function listViewClick(e) {
        parent.contentItemListFromList(e.dataItem);
    }

    var app = setKendoMobApp();
</script>
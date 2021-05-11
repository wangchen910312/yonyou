<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:70%">#:trimNull(ocarVinNo) #</span>
    <span style="width:30%">#:trimNull(ocarNo) #</span>
    <span class="clboth" style="width:70%">#:chgDate2Str(uploadDt) #</span>
    <span style="width:30%">#:trimNull(exchTp) #</span>
    <span style="width:30%">#:trimNull(payAmt) #</span>
    <span style="width:30%">#:trimNull(payYyMmDt) #</span>
</div>
</script>

<script type="text/javascript">
    //시스템 날짜 정보 가져오기
    var pageIndex = 0;
    var pageSize = 100;
    var rowIndex = 0;
    var rowTotal = 1000;

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
                params["sort"] = options.sort;

                params["sDlrCd"] = parent.$("#sDlrCd").data("kendoExtDropDownList").value();//parent.$("#sDlrCd").val();
                //params["sSdptCd"] = parent.$("#sSdptCd").val();
                //params["sOfficeCd"] = parent.$("#sOffCd").val();
                params["sUploadStartDt"] = new Date(parent.$("#sUploadStartDt").val());
                params["sUploadEndDt"] = new Date(parent.$("#sUploadEndDt").val());
                params["sPayYyMmDt"] = parent.$("#sPayYyMmDt").val().replace(/-/gi,'');
                params["sVinNo"] = $("#sVinNo").val();


                $.ajax({
                    url:"<c:url value='/mob/sal/usc/exchRslt/selectExchResultList.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        checklistCnt("listarea_noData", result.total, noDatamsg);
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;

                                data.push({pageIdx:pageIndex,
                                    rowIdx:rowIndex,
                                    uploadDt:row.uploadDt,
                                    exchTp:row.exchTp,
                                    dlrCd:row.dlrCd,
                                    dlrNm:row.dlrNm,
                                    cityCd:row.cityCd,
                                    sungCd:row.sungCd,
                                    officeCd:row.officeCd,
                                    sdptCd:row.sdptCd,
                                    ocarMakerTp:row.ocarMakerTp,
                                    ocarOwnerNm:row.ocarOwnerNm,
                                    ocarMakerNm:row.ocarMakerNm,
                                    ocarVinNo:row.ocarVinNo,
                                    ocarRcptNo:row.ocarRcptNo,
                                    ocarRcptPliblDt:row.ocarRcptPliblDt,
                                    ocarNo:row.ocarNo,
                                    ocarDlrCd:row.ocarDlrCd,
                                    ncarOwnerNm:row.ncarOwnerNm,
                                    ssnCrnNo:row.ssnCrnNo,
                                    ncarVinNo:row.ncarVinNo,
                                    ncarCarlineCd:row.ncarCarlineCd,
                                    ncarGradeCd:row.ncarGradeCd,
                                    tmrCd:row.tmrCd,
                                    tmrMm:row.tmrMm,
                                    tmrYy:row.tmrYy,
                                    evalRsltCd:row.evalRsltCd,
                                    payAmt:row.payAmt,
                                    matYyMmDt:row.matYyMmDt,
                                    payYyMmDt:row.payYyMmDt
                                });
                            });

                            options.success(data);
                            app.hideLoading();
                            //checkResultForChrom(rowIndex);
                        }
                        else {
                            app.hideLoading();
                            //checkResultForChrom(0);
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

    listViewClick = function(e) {
        parent.fnContentDetail(e.dataItem);
    }

    var app = setKendoMobApp();
</script>
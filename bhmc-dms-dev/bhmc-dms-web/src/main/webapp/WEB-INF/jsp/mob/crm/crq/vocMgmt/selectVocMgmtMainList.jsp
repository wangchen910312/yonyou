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
    <span style="width:70%">#:trimNull(vocNo) #</span>
    <span style="width:30%">#:trimNull(vocTpCdNm) #</span>
    <span class="clboth" style="width:30%">#:trimNull(custNm) #</span>
    <span style="width:40%">#:trimNull(custPrefCommNo) #</span>
    <span style="width:30%">#:trimNull(vocStatCdNm) #</span>
    <span class="clboth" style="width:30%">#:chgDate2Str(procDt) #</span>
    <span style="width:40%">#:trimNull(pprocDeptNm) #</span>
    <span style="width:30%">#:trimNull(pprocNm) #</span>
</div>
</script>

<script type="text/javascript">
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
                //params["sort"] = null;
                params["sort"] = options.sort;//[{"dir":"desc","field":"vocNo"}];


                //params["sCust"]          = $("#sCust").val();
                //params["sRegStartDt"]    = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                //params["sRegEndDt"]      = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
                //params["sVocTpCd"]       = $("#sVocTpCd").val();
                //params["sVocStatCd"]     = $("#sVocStatCd").val();
                //params["sCmplCauCd"]     = $("#sCmplCauCd").val();
                //params["sMngScId"]       = $("#sMngScId").val();
               // params["sPprocIdNm"]     = $("#sPprocIdNm").val();


                params["sRegStartDt"] = new Date(parent.$("#sRegStartDt").val());
                params["sRegEndDt"] = new Date(parent.$("#sRegEndDt").val());
                params["sVocTpCd"] = parent.$("#sVocTpCd").val();
                params["sVocStatCd"] = parent.$("#sVocStatCd").val();
                params["sCmplCauCd"] = parent.$("#sCmplCauCd").val();
                params["sCust"] = parent.$("#sCust").val();
                params["sMngScId"]= parent.$("#sMngScId").val();
                params["sPprocIdNm"]= parent.$("#sPprocIdNm").val();
                params["sBhmcYn"]= parent.$("#sBhmcYn").val();

                $.ajax({
                    url:"<c:url value='/mob/crm/crq/vocMgmt/selectVocMgmts.do' />"
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
                                    vocNo:row.vocNo,
                                    pltCd:row.pltCd,
                                    vocTpCd:row.vocTpCd,
                                    vocTpCdNm:row.vocTpCdNm,
                                    custNm:row.custNm,
                                    custNo:row.custNo,
                                    custPrefCommNo:row.custPrefCommNo,
                                    vocStatCdNm:row.vocStatCdNm,
                                    procDt:row.procDt,
                                    pprocDeptNm:row.pprocDeptNm,
                                    pprocNm:row.pprocNm,
                                    pprocId:row.pprocId,
                                    tendCd:row.tendCd,
                                    vocTpSub1Cd:row.vocTpSub1Cd,
                                    vocTpSub2Cd:row.vocTpSub2Cd,
                                    vocTpSub3Cd:row.vocTpSub3Cd,
                                    acptSrcCd:row.acptSrcCd,
                                    activeGainPathCd:row.activeGainPathCd,
                                    cmplCauCd:row.cmplCauCd,
                                    prorCd:row.prorCd,
                                    procLmtCd:row.procLmtCd,
                                    vocEndDt:row.vocEndDt,
                                    receiveTelNo:row.receiveTelNo,
                                    custNm:row.custNm,
                                    pconCustNm:row.pconCustNm,
                                    custPrefCommNo:row.custPrefCommNo,
                                    hpNo:row.hpNo,
                                    homeTelNo:row.homeTelNo,
                                    officeTelNo:row.officeTelNo,
                                    pconCustMjrTelNo:row.pconCustMjrTelNo,
                                    pconCustHomeTelNo:row.pconCustHomeTelNo,
                                    pconCustOfficeTelNo:row.pconCustOfficeTelNo,
                                    resvDt:row.resvDt,
                                    repairBookId:row.repairBookId,
                                    sendTelNo:row.sendTelNo,
                                    pconRelCd:row.pconRelCd,
                                    pprocDeptNm:row.pprocDeptNm,
                                    pprocNm:row.pprocNm,
                                    coopDeptNm:row.coopDeptNm,
                                    bizDeptNm:row.bizDeptNm,
                                    officeNm:row.officeNm,
                                    sungCd:row.sungCd,
                                    sungNm:row.sungNm,
                                    cityNm:row.cityNm,
                                    vinNo:row.vinNo,
                                    carRegNo:row.carRegNo,
                                    carlineNm:row.carlineNm,
                                    modelNm:row.modelNm,
                                    ocnNm:row.ocnNm,
                                    runDistVal:row.runDistVal,
                                    acptDeptNm:row.acptDeptNm,
                                    pacptNm:row.pacptNm,
                                    pacptId:row.pacptId,
                                    acptDt:row.acptDt,
                                    manufacturer:row.manufacturer,
                                    custReqCont:row.custReqCont,
                                    custRescLocCont:row.custRescLocCont,
                                    pevalNm:row.pevalNm,
                                    evalAllocDt:row.evalAllocDt,
                                    returnCauCont:row.returnCauCont,
                                    dataShipStatCd:row.dataShipStatCd,
                                    pmoCauCd:row.pmoCauCd,
                                    pmoDt:row.pmoDt,
                                    realPprocNm:row.realPprocNm,
                                    procDt:row.procDt,
                                    pprocTelNo:row.pprocTelNo,
                                    pprocEmailNm:row.pprocEmailNm,
                                    stsfIvstEmpNm:row.stsfIvstEmpNm,
                                    stsfIvstDt:row.stsfIvstDt,
                                    mthAchvHm:row.mthAchvHm,
                                    callCenOpnCont:row.callCenOpnCont,
                                    revMthCont:row.revMthCont,
                                    procRsltCont:row.procRsltCont,
                                    cmplStsfCd:row.cmplStsfCd,
                                    cmplReAcptYn:row.cmplReAcptYn,
                                    cmplReAcptCnt:row.cmplReAcptCnt,
                                    serReqNo:row.serReqNo,
                                    cmplDlDeptNm:row.cmplDlDeptNm,
                                    cmplDlEmpNm:row.cmplDlEmpNm,
                                    saleDt:row.saleDt,
                                    dstbNo:row.dstbNo,
                                    parOrdYn:row.parOrdYn,
                                    parOrdDt:row.parOrdDt,
                                    parArrvDt:row.parArrvDt,
                                    itemCd:row.itemCd,
                                    bhmcVocNo:row.bhmcVocNo,
                                    bhmcYn:row.bhmcYn
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

    fnChangehostTeamCd = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.hostTeamList[val];
        }

        return returnVal;
    };

    fnChangeStat = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.statCdObj[val];
        }

        return returnVal;
    };

    fnChangeMakTpCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = parent.makTpCdObj[val];
        }

        return returnVal;
    };

    listViewClick = function(e) {
        parent.fnContentDetail(e.dataItem);
    };

    var app = setKendoMobApp();
    //var app = setKendoMobAppForNativeScroll();
</script>
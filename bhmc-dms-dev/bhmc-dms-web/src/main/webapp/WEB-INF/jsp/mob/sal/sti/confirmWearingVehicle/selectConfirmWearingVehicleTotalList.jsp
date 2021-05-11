<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <!-- <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
    </ul> -->
    <ul data-role="listview" id="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%;">#:vinNo#</span>
    <span style="width:50%;">#:'['+carlineCd+']'##:carlineNm#</span>
    <span style="width:50%;">#:modelNm#</span>
    <span style="width:50%;">#:'['+ocnCd+']'##:ocnNm#</span>
    <span style="width:50%;">#:extColorNm#/#:intColorNm#</span>
    <span style="width:50%;">#:trimNull(grDt)#</span>
</div>
</script>

<script type="text/javascript">
    var pageIndex = 0;
    var pageSize = 100;
    var rowIndex = 0;
    var rowTotal = 1000;
    parent.currentContent_list=5;
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
                params["sort"] = options.sort;//[{"dir":"desc","field":"vocNo"}];

                params["sOrdTp"] = parent.$("#sOrdTp").data('kendoExtDropDownList').value();
                params["sVinNo"] = parent.$("#sVinNo").val();
                params["sCarlineCd"] = parent.$("#sCarlineCd").data('kendoExtDropDownList').value();
                params["sModelCd"] = parent.$("#sModelCd").data('kendoExtDropDownList').value();
                var scrhStartDt = chgDate(parent.$("#sOrdDtS").val());
                var scrhEndDt   = chgDate(parent.$("#sOrdDtE").val());

                if(parent.$("#sVinmStatus").data('kendoExtDropDownList').value()=="50"){
                    params["sGrDtStart"]  = scrhStartDt;
                    params["sGrDtEnd"]    = scrhEndDt;
                    params["sCarStatCd"]   = '60';
                }else{
                    params["sOrdDtStart"]  = scrhStartDt;
                    params["sOrdDtEnd"]    = scrhEndDt;
                    params["sCarStatCd"]  = '50';
                }


                $.ajax({
                    url:"<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicle.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        checklistCnt("listarea_noData5", result.total, noDatamsg);
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;

                                data.push({pageIdx:pageIndex,
                                    rowIdx:rowIndex,
                                    dstbCmpNm:row.dstbCmpNm,
                                    barcodeNo:row.barcodeNo,
                                    carId:row.carId,
                                    carStatCd:row.carStatCd,
                                    carTot:row.carTot,
                                    carlineCd:row.carlineCd,
                                    carlineNm:row.carlineNm,
                                    conN:row.conN,
                                    conY:row.conY,
                                    confirmYn:row.confirmYn,
                                    dlrCd:row.dlrCd,
                                    extColorCd:row.extColorCd,
                                    extColorNm:row.extColorNm,
                                    fileDocNo:row.fileDocNo,
                                    fileNo:row.fileNo,
                                    grDt:chgDate2Str(row.grDt),
                                    intColorCd:row.intColorCd,
                                    intColorNm:row.intColorNm,
                                    locCd:row.locCd,
                                    manufactYyMmDt:row.manufactYyMmDt,
                                    modelCd:row.modelCd,
                                    modelNm:row.modelNm,
                                    ocnCd:row.ocnCd,
                                    ocnNm:row.ocnNm,
                                    ordNo:row.ordNo,
                                    photoFilePathNm:row.photoFilePathNm,
                                    regDt:row.regDt,
                                    regUsrId:row.regUsrId,
                                    remark:row.remark,
                                    rnum:row.rnum,
                                    stockAgingCnt:row.stockAgingCnt,
                                    stockDt:row.stockDt,
                                    stockStatCd:row.stockStatCd,
                                    strgeCd:row.strgeCd,
                                    updtDt:row.updtDt,
                                    updtUsrId:row.updtUsrId,
                                    vinNo:row.vinNo,
                                    carStatCd:row.carStatCd,

                                    carDumpCd:parent.carDumpCdArr[row.carDumpCd].cmmCdNm,
                                    carRegNo:row.carRegNo,
                                    rfidNo:row.rfidNo,
                                    ordTp:parent.ordTpArr[row.ordTp].cmmCdNm,
                                    asdy:chgDate2Str(row.asdy),
                                    enginNo:row.enginNo,
                                    certNo:row.certNo,
                                    usedAmtTp:parent.usedAmtTypeObj[row.usedAmtTp].cmmCdNm,
                                    bankNm:row.bankNm,
                                    regNm:row.regNm,
                                    asdy2:chgDate2Str(row.asdy)
                                });
                            });

                            options.success(data);
                            app.hideLoading();
                        }
                        else {
                            parent.$("#listarea_noData").height(400);
                            parent.$("#content_list_5 .listarea").height(500);
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

fnChangeCarStatCdObj = function(val){
    var returnVal = "";

    if(val != null && val != ""){
        returnVal = parent.vinmStatusObj[val];
    }

    return returnVal;
};


function listViewClick(e)
{
    parent.contentDetail(e);
}

var app = setKendoMobApp();
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- vender master -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.venderCstSelect" /> --%></h1>
        <div class="btn_right">
            <button id="btnInit" name="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>
            <button id="btnSearch" name="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr class="hidden">
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /><!-- dlrCd --></span></th>
                    <td>
                        <input id="dlrCd" name="dlrCd" value="" readonly="readonly" class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.bpCstCd" /><!-- bpCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sBpCd" name="sBpCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpCstNm" /><!-- bpNm --></th>
                    <td>
                        <input id="sBpNm" name="sBpNm" class="form_input" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpCstTp" /><!-- bpTp --></th>
                    <td>
                        <input id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="grid" ></div>
    </div>
</section>
<!-- // vender master -->

<!-- vender info -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.venderCstInfo" /><!-- venderCstInfo --></h2>
        <div class="btn_right">
            <button id="btnSave" name="btnSave" class="btn_s"><spring:message code="par.btn.save" /></button>
            <button id="btnAdd" name="btnInsert" class="btn_s" ><spring:message code="par.btn.request" /></button>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstTp" /><!-- bpTp --></th>
                    <td>
                        <input id="bpTp" name="bpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpCstCd" /><!-- bpCd --></th>
                    <td>
                        <input id="bpCd" name="bpCd" value="" readonly="readonly" class="form_input form_readonly"  maxlength="15" />
                        <input type="hidden" id="InsertUpdateFlag" value="" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.prcTp" /><!-- prcTp --></th>
                    <td>
                        <input id="prcTp" name="prcTp" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.crnNo" /><!-- crnNo --></th>
                    <td>
                        <input id="crnNo" name="crnNo" value="" class="k-textbox form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.ownRgstNm" /><!-- ownRgstNm --></th>
                    <td>
                        <input id="ownRgstNm" name="ownRgstNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="15" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.prcDcRate" /><!-- prcDcRate --></th>
                    <td>
                        <input id="dcRate" name="dcRate" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.bpFullCstNm" /><!-- bpFullCstNm --></th>
                    <td>
                        <input id="bpFullNm" name="bpFullNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpEnCstNm" /><!-- bpEnCstNm --></th>
                    <td>
                        <input id="bpEnNm" name="bpEnNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstNm" /><!-- bpNm --></th>
                    <td>
                        <input id="bpNm" name="bpNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.homepageUrl" /><!-- homepageUrl --></th>
                    <td colspan="3">
                        <input type="url" id="homepageUrl" name="homepageUrl" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.taxRate" /><!-- taxRate --></th>
                    <td>
                        <input id="taxRate" name="taxRate" style="width:100%" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.zipCd" /><!-- zipCd --></th>
                    <td>
                        <div id="zipCdSearch" class="form_search form_readonly">
                            <input id="zipCd" name="zipCd" value="" readonly="readonly" class="k-textbox form_input form_readonly" />
                            <a href="#" onclick="javascript:zipCodeSearchPopup()"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sung" />/<spring:message code="par.lbl.city" /></th>
                    <td>
                        <input type="hidden" id="sungCd" name="sungCd" value="" />
                        <input id="sungNm" name="sungNm" value="" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" /><!-- addr --></th>
                    <td>
                        <input id="addr" name="addr" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.cofDt" /><!-- cofDt --></th>
                    <td>
                        <input id="cofDt" name="cofDt" disabled="disabled" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.venderEndYn" /><!-- venderEndYn --></th>
                    <td>
                        <input id="endYn" name="endCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.cntryCd" /><!-- cntryCd --></th>
                    <td>
                        <input id="distCd" name="distCd" class="hidden" />
                        <input id="cntryCd" name="cntryCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // vender info -->

<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.venderTel" /><%-- venderTel --%></h2>
        <div class="btn_right">
            <button id="btnTelAdd" name="btnTelAdd" class="btn_s"><spring:message code="par.btn.telAdd" /><!-- telAdd --></button>
            <button id="btnTelDel" name="btnTelDel" class="btn_s"><spring:message code="par.btn.telDel" /><!-- telDel --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="gridTel" ></div>
    </div>
</section>

<section class="group hidden">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.venderFiInfo" /><!-- venderFiInfo --></h2>
    </div>
    <div class="table_form form_width_70per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.payTp" /><!-- payTp --></th>
                    <td>
                        <input id="payTp" name="payTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.payTermCd" /><!-- payTermCd --></th>
                    <td>
                        <input id="payTermCd" name="payTermCd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.bankAcNo" /><!--bankAcNo --></th>
                    <td>
                        <input id="bankAcNo" name="bankAcNo" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bankNm" /><!-- bankNm --></th>
                    <td>
                        <input id="bankNm" name="bankNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.acOwnerNm" /><!-- acOwnerNm --></th>
                    <td>
                        <input id="acOwnerNm" name="acOwnerNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- script -->
<script type="text/javascript">
//bpTpList
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//bpTpMap
var bpTpMap = [];
$.each(bpTpList, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//TODO:[InBoShim] common code changed
var cntryCdDs = [];
<c:forEach var="obj" items="${cntryCdDs}">
cntryCdDs.push({
    "cntryCd":"${obj.cntryCd}"
    ,"cntryNm":"${obj.cntryNm}"
});
</c:forEach>
var cntryCdMap = [];
$.each(cntryCdDs, function(idx, obj){
    cntryCdMap[obj.cntryCd] = obj.cntryNm;
});
//TODO:[InBoShim] common code changed
var distCdDs = [];
<c:forEach var="obj" items="${distCdDs}">
distCdDs.push({
    "usrCd":"${obj.usrCd}"
    ,"usrNm":"${obj.usrNm}"
});
</c:forEach>
//payTpList
var payTpList = [];
<c:forEach var="obj" items="${payTpList}">
payTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//payTermCdList
var payTermCdList = [];
<c:forEach var="obj" items="${payTermCdList}">
payTermCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//payTermCd Map
var payTermCdMap = [];
$.each(payTermCdList, function(idx, obj){
    payTermCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//useYn Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//useYnCd Map
var useYnCdMap = [];
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//prcTpList Array
var prcTpList = [];
<c:forEach var="obj" items="${prcTpList}">
prcTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//prcTp Map
var prcTpMap = [];
$.each(prcTpList, function(idx, obj){
    prcTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//customer Popup Func
var customerSearchPopupWin;
function selectVenderMasterPopupWindow(){
    customerSearchPopupWin = dms.window.popup({
        windowId:"customerSearchPopupWin"
        ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // customer select
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"bpTp":$("#sBpTp").val()
                ,"selectable":"row"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sBpCd").val(data[0].bpCd);
                        $("#sBpNm").val(data[0].bpNm);
                        $("#sBpTp").data("kendoExtDropDownList").value(data[0].bpTp);
                        customerSearchPopupWin.close();
                    }
                }
            }
        }
    });
}

// zipcode Popup
var zipCodeSearchPopupWin;
function zipCodeSearchPopup() {
    if($("#InsertUpdateFlag").val() != ""){
        zipCodeSearchPopupWin = dms.window.popup({
            windowId:"zipCodeSearchPopupWin"
            ,title:"<spring:message code='par.title.zipCd'/>"   // zipcode
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"selectable":"row"
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#zipCd").val(data[0].zipCd);
                            $("#sungNm").val(data[0].sungNm+" "+data[0].cityNm);
                            $("#sungCd").val(data[0].sungCd);
                        }
                    }
                }
            }
        });
    }
}
//selectVenderMasters Func
function selectVenderMasters(){
    $("#grid").data("kendoExtGrid").dataSource.read();
}
//selectVenderMasterByKey Func
function selectVenderMasterByKey(selectedItem){
    $("#InsertUpdateFlag").val("UPDATE");
    $("#bpCd").val(selectedItem.bpCd);
    $("#bpNm").val(selectedItem.bpNm);
    $("#bpFullNm").val(selectedItem.bpFullNm);
    $("#bpEnNm").val(selectedItem.bpEnNm);
    $("#bpTp").data("kendoExtDropDownList").value(selectedItem.bpTp);
    $("#cntryCd").data("kendoExtDropDownList").value(selectedItem.cntryCd);
    $("#distCd").data("kendoExtDropDownList").value(selectedItem.distCd);
    $("#ownRgstNm").val(selectedItem.ownRgstNm);
    $("#crnNo").val(selectedItem.crnNo);
    $("#cofDt").data("kendoExtMaskedDatePicker").value(selectedItem.cofDt);
    $("#zipCd").val(selectedItem.zipCd);
    $("#sungCd").val(selectedItem.sungCd);
    $("#sungNm").val(selectedItem.sungNm);
    $("#addr").val(selectedItem.addr);
    $("#prcTp").data("kendoExtDropDownList").value(selectedItem.prcTp);
    $("#dcRate").data("kendoExtNumericTextBox").value(selectedItem.dcRate);
    $("#homepageUrl").val(selectedItem.homepageUrl);
    $("#taxRate").data("kendoExtNumericTextBox").value(selectedItem.taxRate);
    $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);
    $("#payTermCd").data("kendoExtDropDownList").value(selectedItem.payTermCd);
    $("#bankNm").val(selectedItem.bankNm);
    $("#bankAcNo").val(selectedItem.bankAcNo);
    $("#acOwnerNm").val(selectedItem.acOwnerNm);
    $("#prcTp").data("kendoExtDropDownList").value(selectedItem.prcTp);
    $("#endYn").data("kendoExtDropDownList").value(selectedItem.endYn);
}
//saveVenderMaster(insert/update) Func
function saveVenderMaster(){
    var insertFlag = $("#InsertUpdateFlag").val();
    var vBpTp = $("#bpTp").val();
    if(vBpTp == ""){
        // bpTp check message
        dms.notification.info("<spring:message code='par.lbl.bpTp' var='bpTpMsg' /><spring:message code='global.info.required.field' arguments='${bpTpMsg}' />");
        return false;
    }
    var vBpCd = $("#bpCd").val();
    if(vBpCd == ""){
        // bpCd check message
        dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCdMsg' /><spring:message code='global.info.required.field' arguments='${bpCdMsg}' />");
        return false;
    }
    var vBpNm = $("#bpNm").val();
    if(vBpNm == ""){
        // bpNm check message
        dms.notification.info("<spring:message code='par.lbl.bpNm' var='bpNmMsg' /><spring:message code='global.info.required.field' arguments='${bpNmMsg}' />");
        return false;
    }
    var VenderMasterVO = {
        "dlrCd":"${dlrCd}"                                                    //dlrCd
        ,"bpCd":vBpCd                                                         //bpCd
        ,"bpNm":vBpNm                                                         //bpNm
        ,"bpFullNm" :$("#bpFullNm").val()                                       //bpFullNm
        ,"bpEnNm":$("#bpEnNm").val()                                          //bpEnNm
        ,"bpTp":$("#bpTp").data("kendoExtDropDownList").value()                  //bpTp
        ,"cntryCd":$("#cntryCd").data("kendoExtDropDownList").value()            //cntryCd
        ,"distCd":$("#distCd").data("kendoExtDropDownList").value()              //distCd
        ,"ownRgstNm":$("#ownRgstNm").val()                                    //ownRgstNm
        ,"crnNo":$("#crnNo").val()                                            //crnNo
        ,"dealCurrUnitCd":""                                                  //dealCurrUnitCd
        ,"cofDt":$("#cofDt").data("kendoExtMaskedDatePicker").value()         //cofDt
        ,"zipCd":$("#zipCd").val()                                            //zipCd
        ,"sungCd":$("#sungCd").val()                                          //sungCd
        ,"sungNm":$("#sungNm").val()                                          //sungNm
        ,"addr":$("#addr").val()                                              //addr
        ,"homepageUrl":$("#homepageUrl").val()                                //homepageUrl
        ,"telNo":""                                                           //telNo
        ,"faxNo":""                                                           //faxNo
        ,"prsnNm":""                                                          //prsnNm
        ,"prsnTelNo":""                                                       //prsnTelNo
        ,"prsnHpNo":""                                                        //prsnHpNo
        ,"prsnEmailNm":""                                                     //prsnEmailNm
        ,"payTp":$("#payTp").data("kendoExtDropDownList").value()                //payTp
        ,"payTermCd" :$("#payTermCd").data("kendoExtDropDownList").value()         //payTermCd
        ,"bankNm" :$("#bankNm").val()                                           //bankNm
        ,"bankAcNo" :$("#bankAcNo").val()                                       //bankAcNo
        ,"acOwnerNm" :$("#acOwnerNm").val()                                     //acOwnerNm
        ,"endYn":$("#endYn").val()                                            //endYn
        ,"remark":""                                                          //remark
        ,"dcRate":$("#dcRate").val()                                          //dcRate
        ,"prcTp":$("#prcTp").data("kendoExtDropDownList").value()                //prcTp
        ,"taxRate":$("#taxRate").val()                                        //taxRate
        ,"bpDstinCd":"N"                                                      //bpDstinCd
        ,"regDt":null                                                         //regDt
        ,"regUsrId":null                                                      //regUsrId
        ,"updtDt":null                                                        //updtDt
        ,"updtUsrId":null                                                     //updtUsrId
    }

    var VenderMasterSaveVO = {
        "venderMasterVO":VenderMasterVO
        ,"venderTelSaveVO":$('#gridTel').data('kendoExtGrid').getCUDData("insertList", "updateList", "deleteList")
    }

    if (insertFlag == "INSERT"){
        paramUrl = "<c:url value='/par/pmm/venderMaster/insertVenderMaster.do' />";
    }
    else{
        paramUrl = "<c:url value='/par/pmm/venderMaster/updateVenderMaster.do' />";
    }
    // vender save send
    sendSaveVenderMaster(paramUrl, VenderMasterSaveVO);
}
// vender save send
function sendSaveVenderMaster(paramUrl, saveVO){

    $.ajax({
        url:paramUrl
        ,data:JSON.stringify(saveVO)
        ,type:"POST"
        ,dataType:"json"
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            // vendet list select
            selectVenderMasters();
            $('#gridTel').data('kendoExtGrid').dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }

    });
}
//editPageVenderMaster Func
function editPageVenderMaster(processFlag){

    $("#bpTp").data("kendoExtDropDownList").enable(false);

    $("#bpCd").prop("readOnly", true).addClass("form_readonly");
    $("#bpNm").prop("readOnly", true).addClass("form_readonly");

    $("#crnNo").prop("readOnly", true).addClass("form_readonly");
    $("#ownRgstNm").prop("readOnly", true).addClass("form_readonly");

    $("#cntryCd").data("kendoExtDropDownList").enable(false);
    $("#distCd").data("kendoExtDropDownList").enable(false);
    $("#sungNm").prop("readOnly", true).addClass("form_readonly");

    $("#bpFullNm").prop("readOnly", true).addClass("form_readonly");
    $("#bpEnNm").prop("readOnly", true).addClass("form_readonly");
    $("#homepageUrl").prop("readOnly", true).addClass("form_readonly");

    $("#cofDt").data("kendoExtMaskedDatePicker").enable(false);

    $("#zipCdSearch").prop("readOnly", true).addClass("form_readonly");
    $("#zipCd").prop("readOnly", true).addClass("form_readonly");
    $("#addr").prop("readOnly", true).addClass("form_readonly");

    $("#prcTp").data("kendoExtDropDownList").enable(false);

    $("#dcRate").data("kendoExtNumericTextBox").enable(false);
    $("#taxRate").data("kendoExtNumericTextBox").enable(false);
    $("#endYn").data("kendoExtDropDownList").enable(false);

    $("#payTp").data("kendoExtDropDownList").enable(false);
    $("#payTermCd").data("kendoExtDropDownList").enable(false);

    $("#bankAcNo").prop("readOnly", true).addClass("form_readonly");
    $("#bankNm").prop("readOnly", true).addClass("form_readonly");
    $("#acOwnerNm").prop("readOnly", true).addClass("form_readonly");

    $("#btnTelAdd").data("kendoButton").enable(false);
    $("#btnTelDel").data("kendoButton").enable(false);

    switch(processFlag)
    {
        case "insert" :

            $("#InsertUpdateFlag").val("INSERT");

            $("#bpTp").data("kendoExtDropDownList").enable(true);

            $("#bpCd").prop("readOnly", false).removeClass("form_readonly");
            $("#bpNm").prop("readOnly", false).removeClass("form_readonly");

            $("#crnNo").prop("readOnly", false).removeClass("form_readonly");
            $("#ownRgstNm").prop("readOnly", false).removeClass("form_readonly");

            $("#cntryCd").data("kendoExtDropDownList").enable(true);
            $("#cntryCd").data("kendoExtDropDownList").select(1);
            $("#distCd").data("kendoExtDropDownList").enable(true);
            $("#sungNm").prop("readOnly", false).removeClass("form_readonly");

            $("#bpFullNm").prop("readOnly", false).removeClass("form_readonly");
            $("#bpEnNm").prop("readOnly", false).removeClass("form_readonly");
            $("#homepageUrl").prop("readOnly", false).removeClass("form_readonly");

            $("#cofDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#zipCdSearch").prop("readOnly", false).removeClass("form_readonly");
            $("#zipCd").prop("readOnly", false).removeClass("form_readonly");
            $("#addr").prop("readOnly", false).removeClass("form_readonly");

            $("#prcTp").data("kendoExtDropDownList").enable(true);

            $("#dcRate").data("kendoExtNumericTextBox").enable(true);
            $("#taxRate").data("kendoExtNumericTextBox").enable(true);
            $("#endYn").data("kendoExtDropDownList").enable(true);

            $("#payTp").data("kendoExtDropDownList").enable(true);
            $("#payTermCd").data("kendoExtDropDownList").enable(true);

            $("#bankAcNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankNm").prop("readOnly", false).removeClass("form_readonly");
            $("#acOwnerNm").prop("readOnly", false).removeClass("form_readonly");

            $("#btnTelAdd").data("kendoButton").enable(true);
            $("#btnTelDel").data("kendoButton").enable(true);

        break;

        case "update" :

            $("#bpTp").data("kendoExtDropDownList").enable(true);

            $("#bpNm").prop("readOnly", false).removeClass("form_readonly");

            $("#crnNo").prop("readOnly", false).removeClass("form_readonly");
            $("#ownRgstNm").prop("readOnly", false).removeClass("form_readonly");

            $("#cntryCd").data("kendoExtDropDownList").enable(true);
            $("#distCd").data("kendoExtDropDownList").enable(true);
            $("#sungNm").prop("readOnly", false).removeClass("form_readonly");

            $("#bpFullNm").prop("readOnly", false).removeClass("form_readonly");
            $("#bpEnNm").prop("readOnly", false).removeClass("form_readonly");
            $("#homepageUrl").prop("readOnly", false).removeClass("form_readonly");

            $("#cofDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#zipCdSearch").prop("readOnly", false).removeClass("form_readonly");
            $("#zipCd").prop("readOnly", false).removeClass("form_readonly");
            $("#addr").prop("readOnly", false).removeClass("form_readonly");

            $("#prcTp").data("kendoExtDropDownList").enable(true);

            $("#dcRate").data("kendoExtNumericTextBox").enable(true);
            $("#taxRate").data("kendoExtNumericTextBox").enable(true);
            $("#endYn").data("kendoExtDropDownList").enable(true);

            $("#payTp").data("kendoExtDropDownList").enable(true);
            $("#payTermCd").data("kendoExtDropDownList").enable(true);

            $("#bankAcNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankNm").prop("readOnly", false).removeClass("form_readonly");
            $("#acOwnerNm").prop("readOnly", false).removeClass("form_readonly");

            $("#btnTelAdd").data("kendoButton").enable(true);
            $("#btnTelDel").data("kendoButton").enable(true);

        break;

        case "cancel" :
        case "init" :

            $("#InsertUpdateFlag").val("INSERT");

            $("#bpTp").data("kendoExtDropDownList").enable(false);
            $("#bpTp").data("kendoExtDropDownList").select(0);

            $("#bpCd").val("");
            $("#bpNm").val("");

            $("#crnNo").val("");
            $("#ownRgstNm").val("");

            $("#cntryCd").data("kendoExtDropDownList").enable(false);
            $("#cntryCd").data("kendoExtDropDownList").select(0);
            $("#distCd").data("kendoExtDropDownList").enable(false);
            $("#distCd").data("kendoExtDropDownList").select(0);

            $("#sungCd").val("");
            $("#sungNm").val("");

            $("#bpFullNm").val("");
            $("#bpEnNm").val("");
            $("#homepageUrl").val("");

            $("#cofDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#zipCd").val("");
            $("#addr").val("");

            $("#prcTp").data("kendoExtDropDownList").enable(false);
            $("#prcTp").data("kendoExtDropDownList").select(0);

            $("#dcRate").val("");
            $("#taxRate").val("");

            $("#endYn").data("kendoExtDropDownList").enable(false);
            $("#endYn").data("kendoExtDropDownList").select(0);

            $("#payTp").data("kendoExtDropDownList").enable(false);
            $("#payTp").data("kendoExtDropDownList").select(0);
            $("#payTermCd").data("kendoExtDropDownList").enable(false);
            $("#payTermCd").data("kendoExtDropDownList").select(0);

            $("#bankAcNo").val("");
            $("#bankNm").val("");
            $("#acOwnerNm").val("");

            $("#btnTelAdd").data("kendoButton").enable(false);
            $("#btnTelDel").data("kendoButton").enable(false);

        break;

        default :
            break;
    }
}

//gridTel add row Func
function gridTellAddRow(){
    // bpCd not empty
    if($("#bpCd").val() !== ""){
        // gridTell row add start
        var iRowCnt = $('#gridTel').data('kendoExtGrid').dataSource.total();

        var sRnum = 1;
        var grid = $("#gridTel").data("kendoExtGrid");
        grid.tbody.find('>tr').each(function(){
            var dataItem = grid.dataItem(this);
            var vLineNoFr = dataItem.lineNo;
            if(sRnum < vLineNoFr){
                sRnum = vLineNoFr;
            }
            sRnum = sRnum + 1;
        });

        $('#gridTel').data('kendoExtGrid').dataSource.insert(0, {
            "bpCd":$("#bpCd").val()
            ,"lineNo":sRnum
            ,"prsnNm":""
            ,"prsnHpNo":""
            ,"prsnEmailNm":""
            ,"prsnTelNo":""
            ,"dbYn":"N"
            ,"regUsrId":null
            ,"regDt":null
            ,"updtUsrId":null
            ,"updtDt":null
        });
        // gridTell row add end
    }
}

$(document).ready(function() {

    // window keydown gridTell add Row
    window.onkeydown = function(event){
        if(event.keyCode == 13){
            //gridTellAddRow call.
            gridTellAddRow();
        }
    }

    //dlrCd
    $("#dlrCd").val("${dlrCd}");
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            //vender master select
            selectVenderMasters();
        }
    });
    //btnAdd
    $("#btnAdd").kendoButton({
        click:function(e){
            //vendet input area enable
            editPageVenderMaster("init");
            editPageVenderMaster("insert");
            $("#bpCd").focus();
        }
    });
    //btnSave
    $("#btnSave").kendoButton({
         enable:true
         ,click:function(e){
             //vender master save
             saveVenderMaster();
        }
    });
    //btnInit
    $("#btnInit").kendoButton({
        enable:true
        ,click:function(e){
            //vender input area init
            editPageVenderMaster("init");
        }
    });
    //btnTelAdd
    $("#btnTelAdd").kendoButton({
        enable:false
        ,click:function(e){
            //gridTellAddRow call.
            gridTellAddRow();
        }
    });
    //btnTelDel
    $("#btnTelDel").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#gridTel").data("kendoExtGrid");
            var rows = grid.select();
            var rowCnt = rows.length;

            if(rowCnt > 0){
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
            else{
                // delete item check message
                dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
            }
        }
    });
    //sBpTp
    $("#sBpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:bpTpList
        ,optionLabel:" "
        ,index:0
    });
    //bpTp
    $("#bpTp").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:bpTpList
        ,optionLabel:" "
        ,change:function(){
            if(this.dataItem().cmmCd != ""){
                if($("#InsertUpdateFlag").val() == "INSERT"){
                    var venderMasterSearchVO = { sBpTp:this.dataItem().cmmCd }
                    $.ajax({
                        url:paramUrl = "<c:url value='/par/pmm/venderMaster/selectVenderMasterBpTpByKey.do' />"
                        ,data:JSON.stringify(venderMasterSearchVO)
                        ,type:"POST"
                        ,dataType:"json"
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(jqXHR, textStatus){
                            $("#bpCd").val(jqXHR.bpCd);
                        }
                    });
                }
            }
        }
        ,index:0
    });
    //cntryCd
    $("#cntryCd").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cntryNm"
        ,dataValueField:"cntryCd"
        ,optionLabel:" "
        ,dataSource:cntryCdDs
        ,index:0
    });
    //distCd
    $("#distCd").kendoExtDropDownList({
        enable:false
        ,dataTextField:"usrNm"
        ,dataValueField:"usrCd"
        ,optionLabel:" "
        ,dataSource:distCdDs
        ,index:0
    });
    //cofDt
    $("#cofDt").kendoExtMaskedDatePicker({
        value:new Date("${sysDate}")
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //dcRate
    $("#dcRate").kendoExtNumericTextBox({
        format:"## \\%"
        ,decimals:0
        ,min:0
        ,max:100
        ,spinners:false
    });
    $("#dcRate").data("kendoExtNumericTextBox").enable(false);
    //taxRate
    $("#taxRate").kendoExtNumericTextBox({
        format:"## \\%"
        ,decimals:0
        ,min:0
        ,max:100
        ,spinners:false
    });
    $("#taxRate").data("kendoExtNumericTextBox").enable(false);
    //prcTp
    $("#prcTp").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:prcTpList
        ,index:0
    });
    //endYn
    $("#endYn").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnCdList
        ,index:0
    });
    //payTp
    $("#payTp").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:payTpList
        ,index:0
    });
    //payTermCd
    $("#payTermCd").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:payTermCdList
        ,index:0
    });
    //zipCd
    $("#zipCd").kendoMaskedTextBox({
        mask:"000000"
        ,promptChar:" "
    });
    //crnNo
    $("#crnNo").kendoMaskedTextBox({
        mask:"00000000000000"
        ,promptChar:" "
    });
    //tab
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
    //grid
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpCd"] = $("#sBpCd").val();
                        params["sBpNm"] = $("#sBpNm").val();
                        params["sBpTp"] = $("#sBpTp").val();
                        params["sBpDstinCd"] = "N";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"bpCd"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,bpCd:{ type:"string" , validation:{required:true} }
                        ,bpNm:{ type:"string" , validation:{required:true} }
                        ,bpFullNm:{ type:"string" , validation:{required:true} }
                        ,bpEnNm:{ type:"string" }
                        ,bpTp:{ type:"string" }
                        ,cntryCd:{ type:"string" }
                        ,distCd:{ type:"string" }
                        ,ownRgstNm:{ type:"string" }
                        ,crnNo:{ type:"string" }
                        ,dealCurrUnitCd:{ type:"string" }
                        ,cofDt:{ type:"string" }
                        ,zipCd:{ type:"string" }
                        ,sungCd:{ type:"string" }
                        ,sungNm:{ type:"string" }
                        ,addr:{ type:"string" }
                        ,homepageUrl:{ type:"string" }
                        ,telNo:{ type:"string" }
                        ,faxNo:{ type:"string" }
                        ,prsnNm:{ type:"string" }
                        ,prsnTelNo:{ type:"string" }
                        ,prsnHpNo:{ type:"string" }
                        ,prsnEmailNm:{ type:"string" }
                        ,payTp:{ type:"string" }
                        ,payTermCd:{ type:"string" }
                        ,bankNm:{ type:"string" }
                        ,bankAcNo:{ type:"string" }
                        ,acOwnerNm:{ type:"string" }
                        ,endYn:{ type:"string" }
                        ,remark:{ type:"string" }
                        ,dcRate:{ type:"number" }
                        ,prcTp:{ type:"string" }
                        ,taxRaTE:{ type:"number" }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,height:173
        ,selectable:"row"
        ,editable:false
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());

            if( selectedItem != null && selectedItem != 'undefined'){
                //selectVenderMasterByKey Func call
                selectVenderMasterByKey(selectedItem);
                //vender Tell datasource read
                $('#gridTel').data('kendoExtGrid').dataSource.read();
                //vender mode update changed
                editPageVenderMaster("update");
                $("#bpNm").focus();
            }
        }
        ,columns:[
            { field:"bpTp", title:"<spring:message code='par.lbl.bpCstTp' />"
                ,width:80
                ,template:'#if(bpTp != null){# #= bpTpMap[bpTp]# #}#'
            }//bpTp
            ,{ field:"bpCd", title:"<spring:message code='par.lbl.bpCstCd' />", width:120 }//bpCd
            ,{ field:"bpNm", title:"<spring:message code='par.lbl.bpCstNm' />", width:80 }//bpNm
            ,{ field:"prcTp", title:"<spring:message code='par.lbl.prcTp' />"
                ,width:80
                ,attributes:{"class":"ac"}
                ,template:'#if(prcTp != null){# #= prcTpMap[prcTp]# #}#'
            }//prcTp
            ,{ field:"dcRate", title:"<spring:message code='par.lbl.prcDcRate' />", width:80, attributes:{"class":"ar"}, format:"{0:n0} \\%"
            }//dcRate
            ,{ field:"prsnNm", title:"<spring:message code='par.lbl.prsnNm' />", width:80 }//prsnNm
            ,{ field:"prsnHpNo", title:"<spring:message code='par.lbl.prsnHpNo' />", width:80 }//prsnHpNo
            ,{ field:"prsnTelNo", title:"<spring:message code='par.lbl.prsnTelNo' />", width:80 }//prsnTelNo
        ]
    });
    //gridTel
    $("#gridTel").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderTels.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpCd"] = $("#bpCd").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"bpCd"
                    ,fields:{
                        dlrCd:{ type:"string" , validation:{required:true} }
                        ,bpCd:{ type:"string" , validation:{required:true} }
                        ,lineNo:{ type:"number" , validation:{required:true} }
                        ,prsnNm:{ type:"string" }
                        ,prsnTelNo:{ type:"string" }
                        ,prsnHpNo:{ type:"string" }
                        ,prsnEmailNm:{ type:"string" }
                        ,dbYn:{ type:"string" }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            if(rows.length > 0){
                var row = $(rows[0]);
                var dataItem = e.sender.dataItem(row);

                // row add after cell focus
                var sender = e.sender;
                var cellToEdit = sender.content.find("td:eq(0)");
                sender.editCell(cellToEdit);

            }
        }
        ,height:173
        ,autoBind:false
        ,pageable:false
        ,sortable:false
        ,columns:[
            {field:"prsnNm", title:"<spring:message code='par.lbl.prsnNm' />", width:120
                ,editor:function(container, options){
                    $('<input name="prsnNm" data-bind="value:' + options.field + '" type="text" maxlength="30" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                    });
                }
            }//prsnNm
            ,{field:"prsnHpNo", title:"<spring:message code='par.lbl.prsnHpNo' />", width:80
                ,editor:function(container, options){
                    $('<input name="prsnHpNo" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:"000-0000-0000"
                        ,promptChar:" "
                    });
                }
            }//prsnHpNo
            ,{field:"prsnEmailNm", title:"<spring:message code='par.lbl.prsnEmailNm' />", width:80
                ,editor:function(container, options){
                    $('<input name="prsnEmailNm" data-bind="value:' + options.field + '" type="email" required maxlength="50" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnEmailNm
            ,{field:"prsnTelNo", title:"<spring:message code='par.lbl.prsnTelNo' />", width:80
                ,editor:function(container, options){
                    $('<input name="prsnTelNo" data-bind="value:' + options.field + '" type="text" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        mask:"000-0000-0000"
                        ,promptChar:" "
                    });
                }
            }//prsnTelNo
        ]
    });
});

</script>
<!-- //script -->


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- vender master -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.venderCstSelect" /></h1> --%>
        <div class="btn_left">
            <button id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /></button>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11458" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnAdd" name="btnInsert" class="btn_m btn_m_min" ><spring:message code="par.btn.new" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11457" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" name="btnSave" class="btn_m btn_m_min"><spring:message code="par.btn.confirm" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11456" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnDelete" name="btnDelete" class="btn_m btn_m_min"><spring:message code="par.btn.del" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11455" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnExcelImport" name="btnExcelImport" class="btn_m btn_m_min"><spring:message code="par.btn.excelUpload" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11454" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min"><spring:message code="par.btn.excelDownload" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11453" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" name="btnSearch" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button>
        </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr class="hidden">
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></span></th>
                    <td>
                        <input id="dlrCd" name="dlrCd" value="" readonly="readonly" class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.bpCstTp" /></th>
                    <td>
                        <input id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpCstCd" /></th>
                    <td>
                        <div class="form_search">
                            <input id="sBpCd" name="sBpCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpCstNm" /></th>
                    <td>
                        <input id="sBpNm" name="sBpNm" class="form_input" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpFullCstNm" /></th>
                    <td>
                        <input id="sBpFullNm" name="sBpFullNm" value="" class="form_input" maxlength="200" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt5">
        <div id="grid" ></div>
    </div>
</section>
<!-- // vender master -->

<section class="group">
    <div class="header_area">
        <%-- <h2 class="title_basic"><spring:message code="par.title.venderTel" /></h2> --%>
        <div class="btn_right">
            <button id="btnTelAdd" name="btnTelAdd" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.telAdd" /><!-- telAdd --></button>
            <button id="btnTelDel" name="btnTelDel" class="btn_s btn_s_min5 hidden"><spring:message code="par.btn.telDel" /><!-- telDel --></button>
        </div>
    </div>
    <div class="table_grid">
        <div id="gridTel" ></div>
    </div>
</section>

<!-- vender info -->
<section class="group">
    <div class="header_area">
        <%-- <h2 class="title_basic"><spring:message code="par.title.venderInfo" /></h2> --%>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstTp" /></th>
                    <td>
                        <input id="bpTp" name="bpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstCd" /></th>
                    <td>
                        <input id="bpCd" name="bpCd" value="" readonly="readonly" class="form_input form_readonly"  maxlength="15" />
                        <input type="hidden" id="InsertUpdateFlag" value="" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpFullCstNm" /></th>
                    <td>
                        <input id="bpFullNm" name="bpFullNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.crnNo" /><!-- crnNo --></th>
                    <td>
                        <input id="crnNo" name="crnNo" value="" class="k-textbox form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.ownRgstNm" /><!-- ownRgstNm --></th>
                    <td>
                        <input id="ownRgstNm" name="ownRgstNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="15" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.contractNo" /></th>
                    <td>
                        <input id="contractNo" name="contractNo" value="" readonly="readonly" class="form_input form_readonly" maxlength="20" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.contractStartDt" /></th>
                    <td>
                        <input id="contractStartDt" name="contractStartDt" disabled="disabled" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.contractEndDt" /></th>
                    <td>
                        <input id="contractEndDt" name="contractEndDt" disabled="disabled" class="form_datepicker" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstNm" /></th>
                    <td colspan="3">
                        <input id="bpNm" name="bpNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.cstCstNm" /></th>
                    <td colspan="3">
                        <input id="bpEnNm" name="bpEnNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.homepageUrl" /><!-- homepageUrl --></th>
                    <td colspan="3">
                        <input type="url" id="homepageUrl" name="homepageUrl" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.cntryCd" /><!-- cntryCd --></th>
                    <td>
                        <input id="cntryCd" name="cntryCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.city" /></th>
                    <td>
                        <input type="hidden" id="sungCd" name="sungCd" value="" />
                        <input id="sungNm" name="sungNm" value="" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.distNm" /></th>
                    <td>
                        <input type="hidden" id="distCd" name="distCd" value="" />
                        <input id="distNm" name="distNm" value="" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.zipCd" /><!-- zipCd --></th>
                    <td>
                        <div id="zipCdSearch" class="form_search form_readonly">
                            <input id="zipCd" name="zipCd" value="" readonly="readonly" class="k-textbox form_input form_readonly" />
                            <a href="#" onclick="javascript:zipCodeSearchPopup()"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.addr" /><!-- addr --></th>
                    <td colspan="7">
                        <input id="addr" name="addr" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.cofDt" /><!-- cofDt --></th>
                    <td>
                        <input id="cofDt" name="cofDt" disabled="disabled" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.venderEndYn" /><!-- venderEndYn --></th>
                    <td>
                        <input id="endYn" name="endYn" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // vender info -->

<section class="group">
    <div class="header_area">
        <%-- <h2 class="title_basic"><spring:message code="par.title.venderFiInfo" /></h2> --%>
    </div>
    <div class="table_form form_width_70per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.payTp" /><!-- payTp --></th>
                    <td>
                        <input id="payTp" name="payTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bankNm" /><!-- bankNm --></th>
                    <td>
                        <input id="bankNm" name="bankNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bankAcNo" /><!--bankAcNo --></th>
                    <td>
                        <input id="bankAcNo" name="bankAcNo" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.acOwnerNm" /><!-- acOwnerNm --></th>
                    <td>
                        <input id="acOwnerNm" name="acOwnerNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.payTermCd" /><!-- payTermCd --></th>
                    <td>
                        <input id="payTermCd" name="payTermCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bankCardNo" /></th>
                    <td>
                        <input id="bankCardNo" name="bankCardNo" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePrcBaseTp" /><!-- 판매가기준 --></th>
                    <td>
                        <input id="prcTp" name="prcTp" class="form_comboBox" />
                        <input id="taxRate" name="taxRate" style="width:100%" class="hidden"/>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.partsDcRate" /></th>
                    <td>
                        <input id="dcRate" name="dcRate" style="width:100%" />
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
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//bpTpMap
var bpTpMap = {};
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
var cntryCdMap = {};
$.each(cntryCdDs, function(idx, obj){
    cntryCdMap[obj.cntryCd] = obj.cntryNm;
});
//payTpList
var payTpList = [];
<c:forEach var="obj" items="${payTpList}">
payTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//payTermCdList
var payTermCdList = [];
<c:forEach var="obj" items="${payTermCdList}">
payTermCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//payTermCd Map
var payTermCdMap = {};
$.each(payTermCdList, function(idx, obj){
    payTermCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//useYn Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//useYnCd Map
var useYnCdMap = {};
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//sexCdList Array
var sexCdList = [];
<c:forEach var="obj" items="${sexCdList}">
sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//sexCdList Map
var sexCdMap = {};
$.each(sexCdList, function(idx, obj){
    sexCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//prcTpList Array
var prcTpList = [];
<c:forEach var="obj" items="${prcTpList}">
    if(3 > Number("${obj.cmmCd}")){
        prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>
//prcTp Map
var prcTpMap = {};
$.each(prcTpList, function(idx, obj){
    prcTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//customer Popup Func
var customerSearchPopupWin;
function selectVenderMasterPopupWindow(){
    customerSearchPopupWin = dms.window.popup({
        windowId:"customerSearchPopupWin"
        ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // customer select
        ,width:840
        ,height:400
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
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"selectable":"row"
                    ,"addrDetlUsingYn":"N"
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#zipCd").val(data[0].zipCd);
                            $("#sungNm").val(data[0].sungNm+" "+data[0].cityNm);
                            $("#sungCd").val(data[0].sungCd);
                            $("#sungCd").val(data[0].sungCd);
                            $("#distNm").val(data[0].distNm);
                            $("#distCd").val(data[0].distCd);
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
    $("#contractNo").val(selectedItem.contractNo);
    $("#contractStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractStartDt);
    $("#contractEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractEndDt);
    $("#bpFullNm").val(selectedItem.bpFullNm);
    $("#bpEnNm").val(selectedItem.bpEnNm);
    $("#bpTp").data("kendoExtDropDownList").value(selectedItem.bpTp);
    $("#cntryCd").data("kendoExtDropDownList").value(selectedItem.cntryCd);
    $("#ownRgstNm").val(selectedItem.ownRgstNm);
    $("#crnNo").val(selectedItem.crnNo);
    $("#cofDt").data("kendoExtMaskedDatePicker").value(selectedItem.cofDt);
    $("#zipCd").val(selectedItem.zipCd);
    $("#sungCd").val(selectedItem.sungCd);
    $("#sungNm").val(selectedItem.sungNm);
    $("#distCd").val(selectedItem.distCd);
    $("#distNm").val(selectedItem.distNm);
    $("#addr").val(selectedItem.addr);
    $("#homepageUrl").val(selectedItem.homepageUrl);
    $("#taxRate").data("kendoExtNumericTextBox").value(selectedItem.taxRate);
    $("#dcRate").data("kendoExtNumericTextBox").value(selectedItem.dcRate);
    $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);
    $("#payTermCd").data("kendoExtDropDownList").value(selectedItem.payTermCd);
    $("#bankNm").val(selectedItem.bankNm);
    $("#bankAcNo").val(selectedItem.bankAcNo);
    $("#acOwnerNm").val(selectedItem.acOwnerNm);
    $("#bankCardNo").val(selectedItem.bankCardNo);
    $("#prcTp").data("kendoExtDropDownList").value(selectedItem.prcTp);
    $("#endYn").data("kendoExtDropDownList").value(selectedItem.endYn);
}

//get VenderMasterVO Func
function getVenderMasterVO(){
    var VenderMasterVO = {
        "dlrCd":"${dlrCd}"                                                    //dlrCd
        ,"bpCd":$("#bpCd").val()                                              //bpCd
        ,"bpNm":$("#bpNm").val()                                              //bpNm
        ,"contractNo" :$("#contractNo").val()                                   //contractNo
        ,"contractStartDt":$("#contractStartDt").data("kendoExtMaskedDatePicker").value()     //contractStartDt
        ,"contractEndDt":$("#contractEndDt").data("kendoExtMaskedDatePicker").value()         //contractEndDt
        ,"bpFullNm" :$("#bpFullNm").val()                                       //bpFullNm
        ,"bpEnNm":$("#bpEnNm").val()                                          //bpEnNm
        ,"bpTp":$("#bpTp").data("kendoExtDropDownList").value()                  //bpTp
        ,"cntryCd":$("#cntryCd").data("kendoExtDropDownList").value()            //cntryCd
        ,"distCd":$("#distCd").val()                                          //distCd
        ,"distNm":$("#distNm").val()                                          //distNm
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
        ,"dcRate":$("#dcRate").data("kendoExtNumericTextBox").value()            //dcRate
        ,"prcTp":$("#prcTp").data("kendoExtDropDownList").value()                //prcTp
        ,"taxRate":$("#taxRate").val()                                        //taxRate
        ,"bpDstinCd":"N"                                                      //bpDstinCd
        ,"regDt":null                                                         //regDt
        ,"regUsrId":null                                                      //regUsrId
        ,"updtDt":null                                                        //updtDt
        ,"updtUsrId":null                                                     //updtUsrId
    }

    return VenderMasterVO;
}

//deleteVenderMaster Func
function deleteVenderMaster(){

    //삭제 팝업 호출.
    $("#messageId").html("<spring:message code='par.info.delYn' />");
        conformKendoWindow.content( $(".msgDiv").html());
        conformKendoWindow.open();
        $(".yes, .no").click(function(){
            if($(this).hasClass("yes")){
                conformKendoWindow.close();

                var VenderMasterVO = getVenderMasterVO();

                if(VenderMasterVO.bpCd == ""){
                    // bpCd check message
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCdMsg' /><spring:message code='global.info.required.field' arguments='${bpCdMsg}' />");
                    return false;
                }

                // vender delete send
                $.ajax({
                    url:"<c:url value='/par/pmm/venderMaster/deleteVenderMaster.do' />"
                    ,data:JSON.stringify(VenderMasterVO)
                    ,type:"POST"
                    ,dataType:"json"
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){
                        // vendet list select
                        selectVenderMasters();
                        editPageVenderMaster("init");
                        // success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });

        }
        conformKendoWindow.close();
    }).end();
}
//saveVenderMaster(insert/update) Func
function saveVenderMaster(){
    var insertFlag = $("#InsertUpdateFlag").val();
    var vBpTp = $("#bpTp").val();
    if(vBpTp == ""){
        //bpTp check message
        dms.notification.info("<spring:message code='par.lbl.bpTp' var='bpTpMsg' /><spring:message code='global.info.required.field' arguments='${bpTpMsg}' />");
        return false;
    }
    var vBpCd = $("#bpCd").val();
    if(vBpCd == ""){
        //bpCd check message
        dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCdMsg' /><spring:message code='global.info.required.field' arguments='${bpCdMsg}' />");
        return false;
    }
    var vBpNm = $("#bpNm").val();
    if(vBpNm == ""){
        //bpCstNm check message
        dms.notification.info("<spring:message code='par.lbl.bpCstNm' var='bpCstNmMsg' /><spring:message code='global.info.required.field' arguments='${bpCstNmMsg}' />");
        return false;
    }

    var VenderMasterVO = getVenderMasterVO();

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

    $("#contractNo").prop("readOnly", true).addClass("form_readonly");
    $("#contractStartDt").data("kendoExtMaskedDatePicker").enable(false);
    $("#contractEndDt").data("kendoExtMaskedDatePicker").enable(false);

    $("#crnNo").prop("readOnly", true).addClass("form_readonly");
    $("#ownRgstNm").prop("readOnly", true).addClass("form_readonly");

    $("#cntryCd").data("kendoExtDropDownList").enable(false);
    $("#sungNm").prop("readOnly", true).addClass("form_readonly");
    $("#distNm").prop("readOnly", true).addClass("form_readonly");

    $("#bpFullNm").prop("readOnly", true).addClass("form_readonly");
    $("#bpEnNm").prop("readOnly", true).addClass("form_readonly");
    $("#homepageUrl").prop("readOnly", true).addClass("form_readonly");

    $("#cofDt").data("kendoExtMaskedDatePicker").enable(false);

    $("#zipCdSearch").prop("readOnly", true).addClass("form_readonly");
    $("#zipCd").prop("readOnly", true).addClass("form_readonly");
    $("#addr").prop("readOnly", true).addClass("form_readonly");

    $("#taxRate").data("kendoExtNumericTextBox").enable(false);
    $("#dcRate").data("kendoExtNumericTextBox").enable(false);
    $("#endYn").data("kendoExtDropDownList").enable(false);

    $("#payTp").data("kendoExtDropDownList").enable(false);
    $("#payTermCd").data("kendoExtDropDownList").enable(false);
    $("#prcTp").data("kendoExtDropDownList").enable(false);

    $("#bankAcNo").prop("readOnly", true).addClass("form_readonly");
    $("#bankCardNo").prop("readOnly", true).addClass("form_readonly");
    $("#bankNm").prop("readOnly", true).addClass("form_readonly");
    $("#acOwnerNm").prop("readOnly", true).addClass("form_readonly");

    $("#btnTelAdd").data("kendoButton").enable(false);
    $("#btnTelDel").data("kendoButton").enable(false);

    switch(processFlag)
    {
        case "insert" :

            $("#InsertUpdateFlag").val("INSERT");

            $("#bpTp").data("kendoExtDropDownList").enable(true);

            $("#bpNm").prop("readOnly", false).removeClass("form_readonly");

            $("#contractNo").prop("readOnly", false).removeClass("form_readonly");
            $("#contractStartDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#contractEndDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#crnNo").prop("readOnly", false).removeClass("form_readonly");
            $("#ownRgstNm").prop("readOnly", false).removeClass("form_readonly");

            $("#cntryCd").data("kendoExtDropDownList").enable(true);
            $("#cntryCd").data("kendoExtDropDownList").value("CN");//default china
            $("#sungNm").prop("readOnly", false).removeClass("form_readonly");
            $("#distNm").prop("readOnly", false).removeClass("form_readonly");

            $("#bpFullNm").prop("readOnly", false).removeClass("form_readonly");
            $("#bpEnNm").prop("readOnly", false).removeClass("form_readonly");
            $("#homepageUrl").prop("readOnly", false).removeClass("form_readonly");

            $("#cofDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#zipCdSearch").prop("readOnly", false).removeClass("form_readonly");
            $("#zipCd").prop("readOnly", false).removeClass("form_readonly");
            $("#addr").prop("readOnly", false).removeClass("form_readonly");

            $("#taxRate").data("kendoExtNumericTextBox").enable(true);
            $("#dcRate").data("kendoExtNumericTextBox").enable(true);
            $("#endYn").data("kendoExtDropDownList").enable(true);

            $("#payTp").data("kendoExtDropDownList").enable(true);
            $("#payTermCd").data("kendoExtDropDownList").enable(true);
            $("#prcTp").data("kendoExtDropDownList").enable(true);

            $("#bankAcNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankCardNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankNm").prop("readOnly", false).removeClass("form_readonly");
            $("#acOwnerNm").prop("readOnly", false).removeClass("form_readonly");

            $("#btnTelAdd").data("kendoButton").enable(true);
            $("#btnTelDel").data("kendoButton").enable(true);

        break;

        case "update" :

            $("#bpTp").data("kendoExtDropDownList").enable(true);

            $("#bpNm").prop("readOnly", false).removeClass("form_readonly");

            $("#contractNo").prop("readOnly", false).removeClass("form_readonly");
            $("#contractStartDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#contractEndDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#crnNo").prop("readOnly", false).removeClass("form_readonly");
            $("#ownRgstNm").prop("readOnly", false).removeClass("form_readonly");

            $("#cntryCd").data("kendoExtDropDownList").enable(true);
            $("#sungNm").prop("readOnly", false).removeClass("form_readonly");
            $("#distNm").prop("readOnly", false).removeClass("form_readonly");

            $("#bpFullNm").prop("readOnly", false).removeClass("form_readonly");
            $("#bpEnNm").prop("readOnly", false).removeClass("form_readonly");
            $("#homepageUrl").prop("readOnly", false).removeClass("form_readonly");

            $("#cofDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#zipCdSearch").prop("readOnly", false).removeClass("form_readonly");
            $("#zipCd").prop("readOnly", false).removeClass("form_readonly");
            $("#addr").prop("readOnly", false).removeClass("form_readonly");

            $("#taxRate").data("kendoExtNumericTextBox").enable(true);
            $("#dcRate").data("kendoExtNumericTextBox").enable(true);
            $("#endYn").data("kendoExtDropDownList").enable(true);

            $("#payTp").data("kendoExtDropDownList").enable(true);
            $("#payTermCd").data("kendoExtDropDownList").enable(true);
            $("#prcTp").data("kendoExtDropDownList").enable(true);

            $("#bankAcNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankCardNo").prop("readOnly", false).removeClass("form_readonly");
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

            $("#contractNo").val("");
            $("#contractStartDt").data("kendoExtMaskedDatePicker").enable(false);
            $("#contractEndDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#crnNo").val("");
            $("#ownRgstNm").val("");

            $("#cntryCd").data("kendoExtDropDownList").enable(false);
            $("#cntryCd").data("kendoExtDropDownList").select(0);

            $("#sungCd").val("");
            $("#sungNm").val("");

            $("#distCd").val("");
            $("#distNm").val("");

            $("#bpFullNm").val("");
            $("#bpEnNm").val("");
            $("#homepageUrl").val("");

            $("#cofDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#zipCd").val("");
            $("#addr").val("");

            $("#taxRate").val("");
            $("#dcRate").val("");

            $("#endYn").data("kendoExtDropDownList").enable(false);
            $("#endYn").data("kendoExtDropDownList").select(1);

            $("#payTp").data("kendoExtDropDownList").enable(false);
            $("#payTp").data("kendoExtDropDownList").select(0);
            $("#payTermCd").data("kendoExtDropDownList").enable(false);
            $("#payTermCd").data("kendoExtDropDownList").select(0);
            $("#prcTp").data("kendoExtDropDownList").enable(false);
            $("#prcTp").data("kendoExtDropDownList").select(0);

            $("#bankAcNo").val("");
            $("#bankCardNo").val("");
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
            ,"sexCd":""
            ,"prsnHpNo":""
            ,"prsnEmailNm":""
            ,"prsnTelNo":""
            ,"etcCommMthCd":""
            ,"etcCommNo":""
            ,"dbYn":"N"
            ,"regUsrId":null
            ,"regDt":null
            ,"updtUsrId":null
            ,"updtDt":null
        });
        // gridTell row add end
    }
}

//venderMaster item excel file upload Popup Func
var venderCustomerMasterExcelUploadPopupWin;
function selectVenderMasterExcelUploadPopupWindow(){

    venderCustomerMasterExcelUploadPopupWin = dms.window.popup({
        windowId:"venderCustomerMasterExcelUploadPopupWin"
        ,title:""
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectVenderCustomerMasterInfoExcelUploadPopup.do'/>"
            ,data:{
                "autoClose":true
                ,"callbackFunc":function(data){
                    $("#grid").data("kendoExtGrid").dataSource.read();
                }
            }
        }
    });
}

function pageInit(){
    $("#sBpTp").data("kendoExtDropDownList").select(0);
    $("#sBpCd").val("");
    $("#sBpNm").val("");
    $("#sBpFullNm").val("");
    $("#gridTel").data("kendoExtGrid").dataSource.data([]);
}

$(document).ready(function() {
    //dlrCd
    $("#dlrCd").val("${dlrCd}");

    //btnInit
    $("#btnInit").kendoButton({
        enable:true
        ,click:function(e){
            //vender input area init
            pageInit();
            editPageVenderMaster("init");
        }
    });

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
            pageInit();
            editPageVenderMaster("init");
            editPageVenderMaster("insert");
            $("#bpNm").focus();
        }
    });
    //btnDelete
    $("#btnDelete").kendoButton({
        click:function(e){
            //deleteVenderMaster Func
            deleteVenderMaster();
            pageInit();
        }
    });
    //btnExcelImport
    $("#btnExcelImport").kendoButton({
        click:function(e){
            //selectVenderMasterExcelUploadPopupWindow Func call
            selectVenderMasterExcelUploadPopupWindow();
        }
    });
    //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){

            dms.ajax.excelExport({
                "beanName":"venderMasterService"
                ,"templateFile":"PartCustomerInfoTarget_Tpl.xlsx"
                ,"fileName":"PartCustomerInfoDownload_Tpl.xlsx"
                ,"sBpTp":$("#sBpTp").val()
                ,"sBpCd":$("#sBpCd").val()
                ,"sBpNm":$("#sBpNm").val()
                ,"sBpDstinCd":"N"
            });
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
    //contractStartDt
    $("#contractStartDt").kendoExtMaskedDatePicker({
        value:null
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //contractEndDt
    $("#contractEndDt").kendoExtMaskedDatePicker({
        value:null
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //cofDt
    $("#cofDt").kendoExtMaskedDatePicker({
        value:new Date("${sysDate}")
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //dcRate
    $("#dcRate").kendoExtNumericTextBox({
        //format:"## \\%"
         format:"n2"
        //,decimals:0
        //,min:0
        //,max:100
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
        ,index:1
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
        gridId:"G-PAR-0722-000003"
        ,dataSource:{
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
                        params["sBpFullNm"] = $("#sBpFullNm").val();
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
                        ,contractNo:{ type:"string" , validation:{required:true} }
                        ,contractStartDt:{ type:"date" , validation:{required:true} }
                        ,contractEndDt:{ type:"date" , validation:{required:true} }
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
                        ,distCd:{ type:"string" }
                        ,distNm:{ type:"string" }
                        ,addr:{ type:"string" }
                        ,homepageUrl:{ type:"string" }
                        ,telNo:{ type:"string" }
                        ,faxNo:{ type:"string" }
                        ,prsnNm:{ type:"string" }
                        ,sexCd:{ type:"string" , editable:true}
                        ,prsnTelNo:{ type:"string" }
                        ,prsnHpNo:{ type:"string" }
                        ,prsnEmailNm:{ type:"string" }
                        ,payTp:{ type:"string" }
                        ,payTermCd:{ type:"string" }
                        ,bankNm:{ type:"string" }
                        ,bankAcNo:{ type:"string" }
                        ,bankCardNo:{ type:"string" }
                        ,acOwnerNm:{ type:"string" }
                        ,endYn:{ type:"string" }
                        ,remark:{ type:"string" }
                        ,dcRate:{ type:"number" }
                        ,dcRateView:{ type:"number" }
                        ,prcTp:{ type:"string" }
                        ,taxRate:{ type:"number" }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,height:265
        ,selectable:"row"
        ,editable:false
        ,filterable:false
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
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    //update row reselect.
                    if(dataItem.bpCd === $("#bpCd").val()){
                        var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        $("#InsertUpdateFlag").val("UPDATE");
                    }
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                }
            });
        }
        ,columns:[
            { field:"bpTp", title:"<spring:message code='par.lbl.bpCstTp' />"
                ,width:80
                ,template:'#if(bpTpMap[bpTp] !== undefined){# #= bpTpMap[bpTp]# #}#'
            }//bpTp
            ,{ field:"bpCd", title:"<spring:message code='par.lbl.bpCstCd' />", width:100 }//bpCd
            ,{ field:"bpNm", title:"<spring:message code='par.lbl.bpCstNm' />", width:200 }//bpNm
            ,{ field:"bpFullNm", title:"<spring:message code='par.lbl.bpFullCstNm' />", width:100 }//bpFullNm
            ,{ field:"contractNo", title:"<spring:message code='par.lbl.contractNo' />", width:100 }//contractNo
            ,{ field:"contractStartDt", title:"<spring:message code='par.lbl.contractStartDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}//contractStartDt
            ,{ field:"contractEndDt", title:"<spring:message code='par.lbl.contractEndDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}//contractEndDt
            ,{ field:"prcTp", title:"<spring:message code='par.lbl.salePrcBaseTp' />"
                ,width:80
                ,attributes:{"class":"ac"}
                ,template:'#if(prcTpMap[prcTp] !== undefined){# #= prcTpMap[prcTp]# #}#'
            }//prcTp
            ,{ field:"prsnNm", title:"<spring:message code='par.lbl.prsnNm' />", width:80 }//prsnNm
            ,{ field:"sexCd", title:"<spring:message code='par.lbl.sex' />", width:80
                ,template:'#if(sexCdMap[sexCd] !== undefined ){# #= sexCdMap[sexCd]# #}#'
            }//sexCd
            ,{ field:"prsnHpNo", title:"<spring:message code='par.lbl.prsnHpNo' />", width:100 }//prsnHpNo
            ,{ field:"prsnTelNo", title:"<spring:message code='par.lbl.prsnTelNo' />", width:100 }//prsnTelNo
            ,{ field:"prsnEmailNm", title:"<spring:message code='par.lbl.prsnEmailNm' />", width:100 }//prsnEmailNm
            ,{ field:"prsnFaxNo", title:"<spring:message code='par.lbl.prsnFaxNo' />", width:100 }//prsnFaxNo
            ,{ field:"addr", title:"<spring:message code='par.lbl.addr' />", width:300 }// addr
            ,{ field:"dcRate", title:"<spring:message code='par.lbl.partsDcRate' />", width:80, attributes:{"class":"ar"}, format:"{0:n2}"}//dcRate

        ]
    });
    //gridTel
    $("#gridTel").kendoExtGrid({
        gridId:"G-PAR-0722-000004"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderTelsMaxRow.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

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
                        ,sexCd:{ type:"string" }
                        ,prsnTelNo:{ type:"string" }
                        ,prsnHpNo:{ type:"string" }
                        ,prsnEmailNm:{ type:"string" }
                        ,prsnFaxNo:{ type:"string" }
                        ,etcCommMthCd:{ type:"string" }
                        ,etcCommNo:{ type:"string" }
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
        }
        ,height:73
        ,autoBind:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"prsnNm", title:"<spring:message code='par.lbl.prsnNm' />", width:120, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnNm" data-bind="value:' + options.field + '" type="text" maxlength="30" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                    });
                }
            }//prsnNm
            ,{field:"sexCd", title:"<spring:message code='par.lbl.sex' />" ,width:120, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                        ,valuePrimitive:true
                        ,dataSource:sexCdList
                    });
                }
                ,template:'#if(sexCdMap[sexCd] !== undefined ){# #= sexCdMap[sexCd]# #}#'
            }//sexCd
            ,{field:"prsnTelNo", title:"<spring:message code='par.lbl.prsnTelNo' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnTelNo" data-bind="value:' + options.field + '" type="text" maxlength="20" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnTelNo
            ,{field:"prsnHpNo", title:"<spring:message code='par.lbl.prsnHpNo' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnHpNo" data-bind="value:' + options.field + '" type="text" maxlength="20" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnHpNo
            ,{field:"prsnEmailNm", title:"<spring:message code='par.lbl.prsnEmailNm' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnEmailNm" data-bind="value:' + options.field + '" type="text" maxlength="20" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnEmailNm
            ,{field:"prsnFaxNo", title:"<spring:message code='par.lbl.prsnFaxNo' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnFaxNo" data-bind="value:' + options.field + '" type="text" maxlength="20" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnFax
            ,{field:"etcCommMthCd", title:"<spring:message code='par.lbl.etcCommMthCd' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="etcCommMthCd" data-bind="value:' + options.field + '" type="text" maxlength="5" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                    });
                }
            }//etcCommMthCd
            ,{field:"etcCommNo", title:"<spring:message code='par.lbl.etcCommNo' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnHpNo" data-bind="value:' + options.field + '" type="text" maxlength="20" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnHpNo
        ]
    });
});

</script>
<!-- //script -->


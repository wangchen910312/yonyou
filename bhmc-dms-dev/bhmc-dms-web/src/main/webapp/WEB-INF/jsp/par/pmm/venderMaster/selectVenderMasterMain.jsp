<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">

<!-- vender master -->
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.venderSelect" /></h1> --%>
        <div class="btn_left">
            <button id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="par.btn.init" /></button>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11452" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnAdd" name="btnAdd" class="btn_m btn_m_min" ><spring:message code="par.btn.new" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11451" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" name="btnSave" class="btn_m btn_m_min"><spring:message code="par.btn.confirm" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11450" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnDelete" name="btnDelete" class="btn_m btn_m_min"><spring:message code="par.btn.del" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11449" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnExcelImport" name="btnExcelImport" class="btn_m btn_m_min"><spring:message code="par.btn.excelUpload" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11448" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min"><spring:message code="par.btn.excelDownload" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11447" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /></button>
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /><!-- dlrCd -->
                    </span></th>
                    <td>
                        <input id="dlrCd" name="dlrCd" value="" readonly="readonly" class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.sBpTp" /><!-- sBpTp --></th>
                    <td>
                        <input id="sBpTp" name="sBpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sBpCd" /><!-- sBpCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sBpCd" name="sBpCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- sBpNm --></th>
                    <td>
                        <input id="sBpNm" name="sBpNm" class="form_input" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sBpFullNm" /><!-- sBpFullNm --></th>
                    <td>
                        <input id="sEndYn" name="sEndYn" class="form_comboBox hidden" />
                        <input id="sBpFullNm" name="sBpFullNm" class="form_input" maxlength="100" />
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.sBpTp" /><!-- bpTp --></th>
                    <td>
                        <input id="bpTp" name="bpTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.sBpCd" /><!-- bpCd --></th>
                    <td>
                        <input id="bpCd" name="bpCd" value="" readonly="readonly" class="form_input form_readonly"  maxlength="15" />
                        <input type="hidden" id="bpTpCnt" value="0" />
                        <input type="hidden" id="InsertUpdateFlag" value="" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sBpFullNm" /><!-- bpFullNm --></th>
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.sBpNm" /><!-- bpNm --></th>
                    <td colspan="3">
                        <input id="bpNm" name="bpNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpEnNm" /><!-- bpEnNm --></th>
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
                    <th scope="row"><spring:message code="par.lbl.taxRate" /><!-- taxRate --></th>
                    <td>
                        <input id="taxRate" name="taxRate" style="width:100%" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.dcRate" /><!-- dcRate --></th>
                    <td>
                        <input id="dcRate" name="dcRate" style="width:100%" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

</div>

<!-- script -->
<script type="text/javascript">
//bpTpList
var bpTpList = [],
    bpTpList02 = [],
    gVatCd = Number("${vatCd}");
<c:forEach var="obj" items="${bpTpList}">
if("01" !== "${obj.cmmCd}"){
    bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
bpTpList02.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//bpTpMap
var bpTpMap = {};
$.each(bpTpList02, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
   // gVatCd = .16;
    gVatCd = .13;
}
console.log('gVatCd:',gVatCd);

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
//payTp Map
var payTpMap = {};
$.each(payTpList, function(idx, obj){
    payTpMap[obj.cmmCd] = obj.cmmCdNm;
});
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
//숫자
var onlyNum = new RegExp("[^0-9]","i");
// vender Popup Func
var venderSearchPopupWin;
function selectVenderMasterPopupWindow(){
    venderSearchPopupWin = dms.window.popup({
        windowId:"venderSearchPopupWin"
        ,title:"<spring:message code = 'par.title.venderSelect'/>"   // vender select
        ,width:840
        ,height:400
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
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
                    }

                    venderSearchPopupWin.close();
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
    //$("#prcTp").data("kendoExtDropDownList").value(selectedItem.prcTp);
    $("#endYn").data("kendoExtDropDownList").value(selectedItem.endYn);
}
// get VenderMasterVO Func
function getVenderMasterVO(){

    var VenderMasterVO = {
        "dlrCd":"${dlrCd}"                                                    //dlrCd
        ,"bpCd":$("#bpCd").val()                                              //bpCd
        ,"bpNm":$("#bpNm").val()                                              //bpNm
        ,"contractNo" :$("#contractNo").val()                                 //contractNo
        ,"contractStartDt":$("#contractStartDt").data("kendoExtMaskedDatePicker").value()     //contractStartDt
        ,"contractEndDt":$("#contractEndDt").data("kendoExtMaskedDatePicker").value()         //contractEndDt
        ,"bpFullNm" :$("#bpFullNm").val()                                     //bpFullNm
        ,"bpEnNm":$("#bpEnNm").val()                                          //bpEnNm
        ,"bpTp":$("#bpTp").data("kendoExtDropDownList").value()                  //bpTp
        ,"bpTpCnt":$("#bpTpCnt").val()                                        //bpTpCnt
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
        ,"bankCardNo" :$("#bankCardNo").val()                                   //bankCardNo
        ,"acOwnerNm" :$("#acOwnerNm").val()                                     //acOwnerNm
        ,"endYn":$("#endYn").val()                                            //endYn
        ,"remark":""                                                          //remark
        ,"dcRate":$("#dcRate").val()                                          //dcRate
        ,"prcTp":null                                                         //prcTp
        ,"taxRate":$("#taxRate").val()                                        //taxRate
        ,"bpDstinCd":"Y"                                                      //bpDstinCd
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

                var VenderMasterVO = getVenderMasterVO();

                if(VenderMasterVO.bpTp === "01"){
                    //bmpVender.
                    dms.notification.warning("<spring:message code='par.lbl.bmpVender' var='bmpVender' /><spring:message code='par.info.noVenderToDel' arguments='${bmpVender}' />");
                    return false;
                }

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
                        editPageVenderMaster("init", null);
                        // success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }

            conformKendoWindow.close();
        }).end();
}

//saveVenderMaster(insert/update) Func
function saveVenderMaster(){
    var insertFlag = $("#InsertUpdateFlag").val(),
    vBpTp = $("#bpTp").val(),
    vBpTpCnt = $("#bpTpCnt").val(),
    vBpCd = $("#bpCd").val();

    if(vBpTp == ""){
        // bpTp check message
        dms.notification.info("<spring:message code='par.lbl.bpTp' var='bpTpMsg' /><spring:message code='global.info.required.field' arguments='${bpTpMsg}' />");
        return false;
    }

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

    var venderMasterVO = getVenderMasterVO();

    var venderMasterSaveVO = {
        "venderMasterVO":venderMasterVO
        ,"venderTelSaveVO":$("#gridTel").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
    }

    if(insertFlag == "INSERT" && vBpTp == "01" && vBpTp > 0){
        // one bmp vender check message
        dms.notification.info("<spring:message code='par.info.checkBmpVenderInsertMsg' />");
        return false;
    }else{
        if (insertFlag == "INSERT" && vBpCd !== ""){
            paramUrl = "<c:url value='/par/pmm/venderMaster/insertVenderMaster.do' />";
        }
        else{
            paramUrl = "<c:url value='/par/pmm/venderMaster/updateVenderMaster.do' />";
        }
        // vender save send
        sendSaveVenderMaster(paramUrl, venderMasterSaveVO);
    }
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
            $("#gridTel").data("kendoExtGrid").dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
        ,beforeSend:function(xhr){
            dms.loading.show($("#resizableContainer"));
        }
        ,complete:function(xhr,status){
            dms.loading.hide($("#resizableContainer"));
        }

    });
}
//editPageVenderMaster Func
function editPageVenderMaster(processFlag, bpTp){

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

            $("#bpTp").data("kendoExtDropDownList").setDataSource(bpTpList);
            $("#bpTp").data("kendoExtDropDownList").select(0);
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

            $("#bankAcNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankCardNo").prop("readOnly", false).removeClass("form_readonly");
            $("#bankNm").prop("readOnly", false).removeClass("form_readonly");
            $("#acOwnerNm").prop("readOnly", false).removeClass("form_readonly");

            $("#btnTelAdd").data("kendoButton").enable(true);
            $("#btnTelDel").data("kendoButton").enable(true);

        break;

        case "update" :

            if(bpTp === "01"){
                $("#bpTp").data("kendoExtDropDownList").setDataSource(bpTpList02);
                $("#bpTp").data("kendoExtDropDownList").value(bpTp);
                $("#bpTp").data("kendoExtDropDownList").enable(false);
            }else{
                $("#bpTp").data("kendoExtDropDownList").setDataSource(bpTpList);
                $("#bpTp").data("kendoExtDropDownList").select(0);
                $("#bpTp").data("kendoExtDropDownList").enable(true);
            }

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
function gridTelAddRow(){
    // bpCd not empty
    if($("#bpCd").val() !== ""){
        // gridTell row add start
        var iRowCnt = $("#gridTel").data("kendoExtGrid").dataSource.total();

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

        $("#gridTel").data("kendoExtGrid").dataSource.insert(0, {
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
        // gridTel row add end
    }
}

//venderMaster item excel file upload Popup Func
var venderMasterExcelUploadPopupWin;
function selectVenderMasterExcelUploadPopupWindow(){

    venderMasterExcelUploadPopupWin = dms.window.popup({
        windowId:"venderMasterExcelUploadPopupWin"
        ,title:""
        ,width:850
        ,height:480
        ,content:{
            url:"<c:url value='/par/cmm/selectVenderMasterInfoExcelUploadPopup.do'/>"
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

function getBpCd(){

    var bpTp = $("#bpTp").val();

    if(bpTp != ""){
        if($("#InsertUpdateFlag").val() == "INSERT"){
            var venderMasterSearchVO = { sBpTp:bpTp }
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
                    $("#bpTpCnt").val(jqXHR.bpTpCnt);
                }
            });
        }
    }
}

function fnChangeDcRate(pDcRate){
    var lDcRate = 0;

    try{
        if(pDcRate >= 50 ){
            dms.notification.warning("<spring:message code='par.lbl.taxRate' var='taxRate' /><spring:message code='global.err.chkGreateParam' arguments='${taxRate},50'/>");
            pDcRate = ( gVatCd * 100 );

            $("#taxRate").data("kendoExtNumericTextBox").value(( gVatCd * 100 ));
        }else if(pDcRate < 0){
            dms.notification.warning("<spring:message code='par.lbl.taxRate' var='taxRate' /><spring:message code='global.err.chkMinusParam' arguments='${taxRate}'/>");
            pDcRate = ( gVatCd * 100 );

            $("#taxRate").data("kendoExtNumericTextBox").value(( gVatCd * 100 ));
        }

        if(pDcRate !== 0){
            lDcRate = (Number(pDcRate)/100) + 1;
        }else{
            lDcRate = 1;
        }
    }catch(e){
        console.log('fnChangeDcRate_catch:',e);
    }
}

$(document).ready(function() {

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
            pageInit();
            editPageVenderMaster("init", null);
            editPageVenderMaster("insert", null);
            getBpCd();
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
                ,"templateFile":"PartSupplierInfoTarget_Tpl.xlsx"
                ,"fileName":"PartSupplierInfoDownload_Tpl.xlsx"
                ,"sBpTp":$("#sBpTp").val()
                ,"sBpCd":$("#sBpCd").val()
                ,"sBpNm":$("#sBpNm").val()
                ,"sBpDstinCd":"Y"
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
    //btnInit
    $("#btnInit").kendoButton({
        enable:true
        ,click:function(e){
            //vender input area init
            pageInit();
            editPageVenderMaster("init", null);
        }
    });
    //btnTelAdd
    $("#btnTelAdd").kendoButton({
        enable:false
        ,click:function(e){
            //gridTelAddRow Func call.
            gridTelAddRow();
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
        ,dataSource:bpTpList02
        ,optionLabel:" "
        ,index:0
    });
    //sEndYn
    $("#sEndYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnCdList
        ,optionLabel:" "
        ,index:0
    });
    //bpTp
    $("#bpTp").kendoExtDropDownList({
        enable:false
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:bpTpList
        ,change:function(){
            getBpCd();
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
        ,index : 0
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
    //taxRate
    $("#taxRate").kendoExtNumericTextBox({
        format:"## \\%"
        ,decimals:0
        ,spinners:false
        ,change: function() {
            var value = this.value();
            fnChangeDcRate(value);
        }
    });
    $("#taxRate").data("kendoExtNumericTextBox").enable(false);
    //dcRate
    $("#dcRate").kendoExtNumericTextBox({
        format:"## \\%"
        ,min:0
        ,max:100
        ,decimals:0
        ,spinners:false
    });
    $("#dcRate").data("kendoExtNumericTextBox").enable(false);
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
        mask:"0000000000000000000"
        ,promptChar:" "
    });
    //tab
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
    //grid
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0722-000001"
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
                        params["sEndYn"] = $("#sEndYn").val();
                        params["sBpDstinCd"] = "Y";

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
                        ,sexCd:{ type:"string", editable:true}
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
                        ,taxRate:{ type:"number" }
                        ,dcRate:{ type:"number" }
                        ,prcTp:{ type:"string" }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"string" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"string" }
                    }
                }
            }
        }
        ,editable:false
        ,selectable:"row"
        ,autoBind:false
        ,height:265
        ,filterable:false
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());

            if( selectedItem != null && selectedItem != 'undefined'){
                //selectVenderMasterByKey Func call
                selectVenderMasterByKey(selectedItem);
                //vender Tell datasource read
                $("#gridTel").data("kendoExtGrid").dataSource.read();
                //vender mode update changed
                editPageVenderMaster("update", selectedItem.bpTp);
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
            { field:"bpTp", title:"<spring:message code='par.lbl.sBpTp' />", width:100
                ,template:'#if(bpTpMap[bpTp] != undefined){# #= bpTpMap[bpTp]# #}#'
            }//bpTp
            ,{ field:"bpCd", title:"<spring:message code='par.lbl.sBpCd' />", width:100 }//bpCd
            ,{ field:"bpNm", title:"<spring:message code='par.lbl.sBpNm' />", width:200 }//bpNm
            ,{ field:"bpFullNm", title:"<spring:message code='par.lbl.sBpFullNm' />", width:100 }//bpFullNm
            ,{ field:"contractNo", title:"<spring:message code='par.lbl.contractNo' />", width:120 }//contractNo
            ,{ field:"contractStartDt", title:"<spring:message code='par.lbl.contractStartDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}"}//contractStartDt
            ,{ field:"contractEndDt", title:"<spring:message code='par.lbl.contractEndDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}//contractEndDt
            ,{ field:"crnNo", title:"<spring:message code='par.lbl.crnNo' />", width:100 }//crnNo
            ,{ field:"ownRgstNm", title:"<spring:message code='par.lbl.ownRgstNm' />", width:80 }//ownRgstNm
            ,{ field:"prsnNm", title:"<spring:message code='par.lbl.prsnNm' />", width:80 }//prsnNm
            ,{ field:"sexCd", title:"<spring:message code='par.lbl.sex' />", width:80
                ,template:'#if(sexCdMap[sexCd] !== undefined ){# #= sexCdMap[sexCd]# #}#'
            }//sexCd
            ,{ field:"prsnTelNo", title:"<spring:message code='par.lbl.prsnTelNo' />", width:120 }//prsnTelNo
            ,{ field:"prsnHpNo", title:"<spring:message code='par.lbl.prsnHpNo' />", width:120 }//prsnHpNo
            ,{ field:"prsnEmailNm", title:"<spring:message code='par.lbl.prsnEmailNm' />", width:200 }//prsnEmailNm
            ,{ field:"prsnFaxNo", title:"<spring:message code='par.lbl.prsnFaxNo' />", width:120 }//prsnFaxNo
            ,{ field:"addr", title:"<spring:message code='par.lbl.addr' />", width:300 }// addr
            ,{ field:"payTp", title:"<spring:message code='par.lbl.payTp' />", width:100
                ,template:'#if(payTp != null){# #= payTpMap[payTp]# #}#'
            }//payTp
            ,{ field:"payTermCd", title:"<spring:message code='par.lbl.payTermCd' />", width:100
                ,template:'#if(payTermCd != null){# #= payTermCdMap[payTermCd]# #}#'
            }//payTermCd
            ,{ field:"bankNm", title:"<spring:message code='par.lbl.bankNm' />", width:100 }// bankNm
            ,{ field:"bankAcNo", title:"<spring:message code='par.lbl.bankAcNo' />", width:100 }// bankAcNo
            ,{ field:"acOwnerNm", title:"<spring:message code='par.lbl.acOwnerNm' />", width:100 }// acOwnerNm
            ,{ field:"bankCardNo", title:"<spring:message code='par.lbl.bankCardNo' />", width:100 }// bankCardNo
            ,{ field:"taxRate", title:"<spring:message code='par.lbl.taxRate' />", width:80, attributes:{"class":"ar"} ,format:"{0:n0} \\%"}//taxRate
            ,{ field:"dcRate", title:"<spring:message code='par.lbl.dcRate' />", width:80, attributes:{"class":"ar"} ,format:"{0:n0} \\%"}//dcRate
        ]
    });
    //gridTel
    $("#gridTel").kendoExtGrid({
        gridId:"G-PAR-0722-000002"
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
                        ,lineNo:{ type:"number"}
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
        ,editable:true
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
                    //숫자 입력만 받고 싶을 때 사용
                    /* .keyup(function(e)
                    {
                        var content = $(this).val();
                        if(content.match(onlyNum)){
                            $(this).val('');
                        }
                    }); */
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
                    $('<input name="prsnEmailNm" data-bind="value:' + options.field + '" type="text" maxlength="50" />')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                        promptChar:" "
                    });
                }
            }//prsnEmailNm
            ,{field:"prsnFaxNo", title:"<spring:message code='par.lbl.prsnFaxNo' />", width:80, attributes:{"class":"bg_white"}
                ,editor:function(container, options){
                    $('<input name="prsnFaxNo" data-bind="value:' + options.field + '" type="text" maxlength="20"  />')
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




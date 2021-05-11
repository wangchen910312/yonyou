<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- vender master -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.venderSelect" /> --%><!-- venderSelect --></h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
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
                    <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- bpCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sBpCd" name="sBpCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- bpNm --></th>
                    <td>
                        <input id="sBpNm" name="sBpNm" class="form_input" maxlength="100" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpTp" /><!-- bpTp --></th>
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
        <h2 class="title_basic"><spring:message code="par.title.venderInfo" /><!-- venderInfo --></h2>
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
                    <th scope="row"><spring:message code="par.lbl.bpTp" /><!-- bpTp --></th>
                    <td>
                        <input id="bpTp" name="bpTp" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- bpCd --></th>
                    <td>
                        <input id="bpCd" name="bpCd" value="" readonly="readonly" class="form_input form_readonly"  maxlength="15" />
                        <input type="hidden" id="InsertUpdateFlag" value="" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- bpNm --></th>
                    <td>
                        <input id="bpNm" name="bpNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
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
                    <th scope="row"><spring:message code="par.lbl.cntryCd" /><!-- cntryCd --></th>
                    <td>
                        <input id="distCd" name="distCd" class="hidden" />
                        <input id="cntryCd" name="cntryCd" readonly="readonly" class="form_input form_readonly" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form mt10">
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
                    <th scope="row"><spring:message code="par.lbl.bpFullNm" /><!-- bpFullNm --></th>
                    <td>
                        <input id="bpFullNm" name="bpFullNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bpEnNm" /><!-- bpEnNm --></th>
                    <td>
                        <input id="bpEnNm" name="bpEnNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="200" />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.homepageUrl" /><!-- homepageUrl --></th>
                    <td colspan="5">
                        <input type="url" id="homepageUrl" name="homepageUrl" value="" readonly="readonly" class="form_input form_readonly" maxlength="100" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.zipCd" /><!-- zipCd --></th>
                    <td>
                        <input id="zipCd" name="zipCd" value="" readonly="readonly" class="k-textbox form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sung" /></th>
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
                        <label for="endYn1" class="label_check">
                            <input id="endYn1" name="endYn" type="radio" value="Y" class="form_check" disabled="disabled" />
                            <spring:message code="par.lbl.yes" /><!-- yes -->
                        </label>
                        <label for="endYn2" class="label_check">
                            <input id="endYn2" name="endYn" type="radio" value="N" checked="checked" class="form_check" disabled="disabled" />
                            <spring:message code="par.lbl.n" /><!-- no -->
                        </label>
                    </td>
                    <th scope="row"></th>
                    <td></td>
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
        </div>
    </div>
    <div class="table_grid">
        <div id="gridTel" ></div>
    </div>
</section>

<section class="group">
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
                        <input id="payTp" name="payTp" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.payTermCd" /><!-- payTermCd --></th>
                    <td>
                        <input id="payTermCd" name="payTermCd" readonly="readonly" class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.bankAcNo" /><!--bankAcNo --></th>
                    <td>
                        <input id="bankAcNo" name="bankAcNo" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.bankNm" /><!-- bankNm --></th>
                    <td>
                        <input id="bankNm" name="bankNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.acOwnerNm" /><!-- acOwnerNm --></th>
                    <td>
                        <input id="acOwnerNm" name="acOwnerNm" value="" readonly="readonly" class="form_input form_readonly" maxlength="50" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
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
    , "cmmCdNm":"${obj.cmmCdNm}"
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
var payTpMap = [];
$.each(payTpList, function(idx, obj){
    payTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//payTermCdList
var payTermCdList = [];
<c:forEach var="obj" items="${payTermCdList}">
payTermCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var payTermCdMap = [];
$.each(payTermCdList, function(idx, obj){
    payTermCdMap[obj.cmmCd] = obj.cmmCdNm;
});
// vender Popup Func
var venderSearchPopupWin;
function selectVenderMasterPopupWindow(){
    venderSearchPopupWin = dms.window.popup({
        windowId:"venderSearchPopupWin"
        ,title:"<spring:message code = 'par.title.venderSelect'/>"   // vender select
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"bpTp":$("#sBpTp").val()
                ,"callbackFunc":function(data){
                    $("#sBpCd").val(data[0].bpCd);
                    $("#sBpNm").val(data[0].bpNm);
                    $("#sBpTp").data("kendoExtDropDownList").value(data[0].bpTp);
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
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#zipCd").val(data[0].zipCd);
                            $("#sungNm").val(data[0].sungNm);
                            $("#sungCd").val(data[0].sungCd);
                            $("#addr").val(data[0].cityNm+" "+data[0].distNm);
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

    $("#bpTp").val(bpTpMap[selectedItem.bpTp]);

    $("#cntryCd").val(cntryCdMap[selectedItem.cntryCd]);
    $("#distCd").val(selectedItem.distCd);
    $("#ownRgstNm").val(selectedItem.ownRgstNm);
    $("#crnNo").val(selectedItem.crnNo);
    $("#cofDt").data("kendoExtMaskedDatePicker").value(selectedItem.cofDt);
    $("#zipCd").val(selectedItem.zipCd);
    $("#sungCd").val(selectedItem.sungCd);
    $("#sungNm").val(selectedItem.sungNm);
    $("#addr").val(selectedItem.addr);
    $("#homepageUrl").val(selectedItem.homepageUrl);
    $("#payTp").val(payTpMap[selectedItem.payTp]);
    $("#payTermCd").val(payTermCdMap[selectedItem.payTermCd]);
    $("#bankNm").val(selectedItem.bankNm);
    $("#bankAcNo").val(selectedItem.bankAcNo);
    $("#acOwnerNm").val(selectedItem.acOwnerNm);
    if(selectedItem.endYn == "Y"){
        $("#endYn1").prop("checked", true);
    }
    else{
        $("#endYn2").prop("checked", true);
    }
}

//editPageVenderMaster Func
function editPageVenderMaster(processFlag){

    $("#bpTp").prop("readOnly", true).addClass("form_readonly");

    $("#bpCd").prop("readOnly", true).addClass("form_readonly");
    $("#bpNm").prop("readOnly", true).addClass("form_readonly");

    $("#crnNo").prop("readOnly", true).addClass("form_readonly");
    $("#ownRgstNm").prop("readOnly", true).addClass("form_readonly");

    $("#cntryCd").prop("readOnly", true).addClass("form_readonly");
    $("#distCd").prop("readOnly", true).addClass("form_readonly");
    $("#sungNm").prop("readOnly", true).addClass("form_readonly");

    $("#bpFullNm").prop("readOnly", true).addClass("form_readonly");
    $("#bpEnNm").prop("readOnly", true).addClass("form_readonly");
    $("#homepageUrl").prop("readOnly", true).addClass("form_readonly");

    $("#cofDt").data("kendoExtMaskedDatePicker").enable(false);

    $("#zipCdSearch").prop("readOnly", true).addClass("form_readonly");
    $("#zipCd").prop("readOnly", true).addClass("form_readonly");
    $("#addr").prop("readOnly", true).addClass("form_readonly");

    $("#payTp").prop("readOnly", true).addClass("form_readonly");
    $("#payTermCd").prop("readOnly", true).addClass("form_readonly");

    $("#bankAcNo").prop("readOnly", true).addClass("form_readonly");
    $("#bankNm").prop("readOnly", true).addClass("form_readonly");
    $("#acOwnerNm").prop("readOnly", true).addClass("form_readonly");

    switch(processFlag)
    {
        case "insert" :
            $("#InsertUpdateFlag").val("INSERT");
        break;

        case "update" :
        break;

        case "cancel" :
        case "init" :
            $("#InsertUpdateFlag").val("INSERT");
        break;

        default :
            break;
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
    //sBpTp
    $("#sBpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:bpTpList
        ,index:0
    });
    //cofDt
    $("#cofDt").kendoExtMaskedDatePicker({
        value:new Date("${sysDate}")
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
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
            { field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:120 }    //bpCd
            ,{ field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:80 }    //bpNm
            ,{ field:"bpTp", title:"<spring:message code='par.lbl.bpTp' />", width:80
                , template:'#if(bpTp != null){# #= bpTpMap[bpTp]# #}#'
            }//bpTp
            ,{ field:"crnNo", title:"<spring:message code='par.lbl.crnNo' />", width:80 }  //crnNo
            ,{ field:"zipCd", title:"<spring:message code='par.lbl.zipCd' />", width:80 }  //zipCd
            ,{ field:"sungNm", title:"<spring:message code='par.lbl.sung' />", width:80 }  //sungNm
            ,{ field:"addr", title:"<spring:message code='par.lbl.addr' />", width:80 }    //addr
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
        ,height:80
        ,editable:false
        ,autoBind:false
        ,pageable:false
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




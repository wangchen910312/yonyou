<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectAdvanceReceivedInfoMain -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.advanceReceived" /></h1> --%>
        <div class="btn_left">
			<dms:access viewId="VIEW-D-11577" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
			</dms:access>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11576" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSuggest" class="btn_m btn_m_min"><spring:message code="par.btn.suggestCost" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11575" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
        </dms:access>        </div>
    </div>
    <div id="tableForm" class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.ownDlrCd" /></th>
                    <td class="required_area">
                        <input id="sDlrCd" class="form_input form_readonly form_required" readonly="readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.preAmtTp" /></th>
                    <td>
                        <input id="sPreAmtTp" name="sPreAmtTp" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.advanceReceivedStartDt" /></th>
                    <td>
                        <input id="impStartDt" value="" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.advanceReceivedEndDt" /></th>
                    <td>
                        <input id="impEndDt" value="" class="form_datepicker" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<section class="group mt10">
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
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.acAmt" /></th>
                    <td>
                        <input id="dpstAmt" class="form_numeric form_readonly ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.calcAmt" /></th>
                    <td>
                        <input id="calcAmt" class="form_numeric form_readonly ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.balAmt" /></th>
                    <td>
                        <input id="balAmt" name="balAmt" class="form_numeric form_readonly ar hidden" />
                        <input id="useAmt" name="useAmt" class="form_numeric form_readonly ar" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.suggestAmt" /></th>
                    <td>
                        <input id="lmtAmt" class="form_numeric ar" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="advanceReceiveGrid" class="resizable_grid" ></div>
    </div>

</section>

</div>
<!-- // selectAdvanceReceivedInfoMain -->

<!-- script -->
<script type="text/javascript">
//preAmtTpList
var preAmtTpList = [];
<c:forEach var="obj" items="${preAmtTpList}">
preAmtTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var preAmtTpMap = {};
$.each(preAmtTpList, function(idx, obj){
    preAmtTpMap[obj.cmmCd] = obj.cmmCdNm;
});

function buttonEnableDisable(bFlag){
    //button list
    $("#btnSuggest").data("kendoButton").enable(bFlag);
    //kendoExtNumericTextBox
    if(bFlag){
        $("#lmtAmt").closest(".k-numerictextbox").removeClass("form_readonly");
        $("#lmtAmt").data("kendoExtNumericTextBox").enable(bFlag);
    }else{
        $("#lmtAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#lmtAmt").data("kendoExtNumericTextBox").enable(bFlag);
    }
}

//page init Func
function pageInit(){

    //$("#sDlrCd").val("");
    $("#sDlrCd").val("${dlrCd}");
    $("#sPreAmtTp").data("kendoExtDropDownList").select(0);

    $("#impStartDt").data("kendoExtMaskedDatePicker").value(null);
    $("#impEndDt").data("kendoExtMaskedDatePicker").value(null);

    $("#balAmt").data("kendoExtNumericTextBox").value(0);
    $("#dpstAmt").data("kendoExtNumericTextBox").value(0);
    $("#calcAmt").data("kendoExtNumericTextBox").value(0);
    $("#lmtAmt").data("kendoExtNumericTextBox").value(0);

    buttonEnableDisable(false);

    $("#advanceReceiveGrid").data("kendoExtGrid").dataSource.data([]);
}

//validator
var validator = $("#tableForm").kendoValidator().data("kendoValidator");

$(document).ready(function() {

    $("#sDlrCd").val("${dlrCd}");

    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call
            pageInit();
        }
    });
    //btnSuggest
    $("#btnSuggest").kendoButton({
        enable : false
        ,click:function(e){

            var AdvanceReceivedInfoHeaderVO = {
                dlrCd:"${dlrCd}"
                ,lmtAmt:$("#lmtAmt").data("kendoExtNumericTextBox").value()
            };

            $.ajax({
                url:"<c:url value='/par/cpm/advanceReceivedInfo/updateAdvanceReceivedInfoHeader.do' />"
                ,data:JSON.stringify(AdvanceReceivedInfoHeaderVO)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){

            //dlrCd message
            if($("#sDlrCd").val() === ""){
                dms.notification.info("<spring:message code='par.lbl.dlrCd' var='dlrCd' /><spring:message code='par.info.issueCheckMsg' arguments='${dlrCd}' />");
                return false;
            }

            if(validator.validate()){
                $.ajax({
                    url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoHeaderByKey.do' />"
                    ,data:JSON.stringify({ sDlrCd:$("#sDlrCd").val(), sPreAmtTp:$("#sPreAmtTp").val() })
                    ,type:"POST"
                    ,dataType:"json"
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){



                        if(jqXHR !== null){
                            $("#balAmt").data("kendoExtNumericTextBox").value(jqXHR.balAmt);
                            $("#dpstAmt").data("kendoExtNumericTextBox").value(jqXHR.dpstAmt);
                            $("#calcAmt").data("kendoExtNumericTextBox").value(jqXHR.calcAmt);
                            $("#useAmt").data("kendoExtNumericTextBox").value(jqXHR.useAmt);
                            $("#lmtAmt").data("kendoExtNumericTextBox").value(jqXHR.lmtAmt);

                            $("#advanceReceiveGrid").data("kendoExtGrid").dataSource.read();

                            buttonEnableDisable(true);
                        }


                    }

                });
            }
        }
    });

    //balAmt
    $("#balAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#balAmt").data("kendoExtNumericTextBox").readonly();
    //dpstAmt
    $("#dpstAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#dpstAmt").data("kendoExtNumericTextBox").readonly();
    //calcAmt
    $("#calcAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#calcAmt").data("kendoExtNumericTextBox").readonly();
    //useAmt
    $("#useAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#useAmt").data("kendoExtNumericTextBox").readonly();
    //lmtAmt
    $("#lmtAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#lmtAmt").data("kendoExtNumericTextBox").enable(false);

    //sPreAmtTp
    $("#sPreAmtTp").kendoExtDropDownList({
        dataSource:preAmtTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //impStartDt
    $("#impStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //impEndDt
    $("#impEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //advanceReceiveGrid
    $("#advanceReceiveGrid").kendoExtGrid({
        gridId:"G-PAR-0808-150101"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"] = options.sort;

                        var sDlrCd = $("#sDlrCd").val() == "" ? "X":$("#sDlrCd").val();
                        params["sDlrCd"] = sDlrCd;
                        params["sPreAmtTp"] = $("#sPreAmtTp").val();
                        params["sImpStartDt"] = $("#impStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sImpEndDt"] = $("#impEndDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mvtTp"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,preAmtAddDt:{ type:"string" , validation:{required:true} }
                        ,preAmtAddHm:{ type:"string" , validation:{required:true} }
                        ,preAmtUpdtDt:{ type:"string" , validation:{required:true} }
                        ,preAmtUpdtHm:{ type:"string" , validation:{required:true} }
                        ,preAmtTp:{ type:"string" , validation:{required:true}, editable:false }
                        ,totAmt:{ type:"number" , editable:false}
                        ,dpstAmt:{ type:"number" , editable:false}
                        ,balAmt:{ type:"number" , editable:false}
                        ,invcNo:{ type:"string" , validation:{required:true}, editable:false }
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true           //empty column. default:false
        ,multiSelectWithCheckbox:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.no'/>", attributes:{"class":"ar"}, width:50 }
            ,{field:"preAmtAddDt", title:"<spring:message code='par.lbl.advanceReceivedActStartDt'/>", width:100 }
            ,{field:"preAmtAddHm", title:"<spring:message code='par.lbl.advanceReceivedActEndDt'/>", width:100 }
            ,{field:"preAmtTp", title:"<spring:message code='par.lbl.preAmtTp'/>", width:100
                ,template:'#if(preAmtTpMap[preAmtTp] !== undefined){# #= preAmtTpMap[preAmtTp]# #}#'
            }
            ,{field:"totAmt", title:"<spring:message code='par.lbl.totAmtCol'/>", width:100, format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"dpstAmt", title:"<spring:message code='par.lbl.dpstAmtCol'/>", width:100, format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"balAmt", title:"<spring:message code='par.lbl.balAmtCol'/>", width:100, format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"invcNo", title:"<spring:message code='par.lbl.advanceReceivedNum'/>", width:120 }
            ,{field:"remark", title:"<spring:message code='par.lbl.remark'/>", width:120 }
        ]
    });
});
</script>
<!-- //script -->
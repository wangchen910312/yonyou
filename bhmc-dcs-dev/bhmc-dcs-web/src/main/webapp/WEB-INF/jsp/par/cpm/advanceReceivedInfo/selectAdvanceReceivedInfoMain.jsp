<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectAdvanceReceivedInfoMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.advanceReceived" /> --%></h1>
        <div class="btn_right">
            <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
        </div>
    </div>
    <div id="tableForm" class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></th>
                    <td class="required_area">
                        <input id="sDlrCd" class="form_input form_required">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.preAmtTp" /></th>
                    <td>
                        <input id="sPreAmtTp" name="sPreAmtTp" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.impDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="impStartDt" value="" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="impEndDt" value="" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="left_area">
            <ul class="txt_input">
                <li>
                    <span class="span_bg"><spring:message code="par.lbl.balAmt" /></span>
                    <input id="balAmt" class="form_readonly ar" style="width:120px">
                </li>
                <li>
                    <span class="span_bg"><spring:message code="par.lbl.acAmt" /></span>
                    <input id="acAmt" class="form_readonly ar" style="width:120px">
                </li>
                <li>
                    <span class="span_bg"><spring:message code="par.lbl.calcAmt" /></span>
                    <input id="calcAmt" class="form_readonly ar" style="width:120px">
                </li>
            </ul>
        </div>
    </div>


    <div class="table_grid">
        <div id="advanceReceiveGrid" ></div>
    </div>

</section>
<!-- // selectAdvanceReceivedInfoMain -->

<!-- script -->
<script type="text/javascript">
//preAmtTpList
var preAmtTpList = [];
<c:forEach var="obj" items="${preAmtTpList}">
preAmtTpList.push({
    "cmmCdNm":"${obj.cmmCdNm}"
    ,"cmmCd":"${obj.cmmCd}"
});
</c:forEach>
var preAmtTpMap = [];
$.each(preAmtTpList, function(idx, obj){
    preAmtTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//page init Func
function pageInit(){
    $("#sDlrCd").val("");
    $("#sPreAmtTp").data("kendoExtDropDownList").select(0);

    $("#impStartDt").data("kendoExtMaskedDatePicker").value(null);
    $("#impEndDt").data("kendoExtMaskedDatePicker").value(null);

    $("#balAmt").data("kendoExtNumericTextBox").value(0);
    $("#acAmt").data("kendoExtNumericTextBox").value(0);
    $("#calcAmt").data("kendoExtNumericTextBox").value(0);

    $("#advanceReceiveGrid").data("kendoExtGrid").dataSource.data([]);
}

//validator
var validator = $("#tableForm").kendoValidator().data("kendoValidator");

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            //pageInit Func call
            pageInit();
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
                            $("#acAmt").data("kendoExtNumericTextBox").value(jqXHR.acAmt);
                            $("#calcAmt").data("kendoExtNumericTextBox").value(jqXHR.calcAmt);

                            $("#advanceReceiveGrid").data("kendoExtGrid").dataSource.read();
                        }

                        dms.notification.success("<spring:message code='global.info.success'/>");
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
    //acAmt
    $("#acAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#acAmt").data("kendoExtNumericTextBox").readonly();
    //calcAmt
    $("#calcAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });
    $("#calcAmt").data("kendoExtNumericTextBox").readonly();
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
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
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
        ,multiSelectWithCheckbox:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.no'/>", width:50 }
            ,{field:"preAmtAddDt", title:"<spring:message code='par.lbl.impDt'/>", width:100 }
            ,{field:"preAmtAddHm", title:"<spring:message code='par.lbl.impTime'/>", width:100 }
            ,{field:"preAmtTp", title:"<spring:message code='par.lbl.preAmtTp'/>", width:100
                ,template:'#if(preAmtTp !== ""){# #= preAmtTpMap[preAmtTp]# #}#'
            }
            ,{field:"totAmt", title:"<spring:message code='par.lbl.totAmtCol'/>", width:100, format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"dpstAmt", title:"<spring:message code='par.lbl.dpstAmtCol'/>", width:100, format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"balAmt", title:"<spring:message code='par.lbl.balAmtCol'/>", width:100, format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"invcNo", title:"<spring:message code='par.lbl.refDocNo'/>", width:100 }
        ]
    });
});
</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- purcCostCalcuate -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.purcCostCal" /> --%><!-- purcCostCal --></h1>
        <div class="btn_right">
            <button class="btn_m" id="btnCalcualte" type="button"><spring:message code="par.btn.purcCostCal" /><!-- btnCalcualte --></button>
        </div>
    </div>
    <div id="tableForm" class="table_form" role="search" data-btnid="btnCalcualte">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.stdDt" /><!-- stdDt --></span></th>
                    <td class="required_area">
                        <input data-type="date" id="sStdDt" name="sStdDt" required class="form_datepicker" style="width:130px" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="" />
                        <div class="form_search" style="width:130px">
                            <input data-type="text" type="text" id="sBpNm" name="sBpNm" required class="form_input" readonly="readonly" value="" />
                            <a href="#" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.grplInfoYn" /><!-- grplInfoYn --></th>
                    <td>
                        <input type="checkbox" id="sStockInYn" checked="checked" value="N" class="form_check" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.giplInfoYn" /><!-- giplInfoYn --></th>
                    <td>
                        <input type="checkbox" id="sStockOutYn" checked="checked" value="N" class="form_check" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.avlbInfoYn" /><!-- avlbInfoYn --></th>
                    <td>
                        <input type="checkbox" id="sStockNowYn" checked="checked" value="N" class="form_check" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //purcCostCalcuate -->

<!-- script -->
<script>
//supply search popup Func
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code = 'par.title.supplyInfo'/>"   //supplyInfo
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"callbackFunc":function(data){
                    $("#sBpCd").val(data[0].bpCd);
                    $("#sBpNm").val(data[0].bpNm);
                }
            }
        }
    });
}
//vendet item add Func
function insertVenderMasterItemAdd(data){
    $("#sBpCd").val(data[0].bpCd);
    $("#sBpNm").val(data[0].bpNm);
}
    //validator
    var validator = $("#tableForm").kendoValidator().data("kendoValidator");

    $(document).ready(function() {
        //btnCalcualte
        $("#btnCalcualte").kendoButton({
            click:function(e){

                if(validator.validate()){
                    //get bpCd,bpNm
                    var vBpCd = $("#sBpCd").val();
                    var vBpNm = $("#sBpNm").val();

                    if(vBpCd === ""){
                       // bpNm not empty message
                        dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}' />");
                        $("#sBpNm").focus();

                        return false;
                    }

                    var searchVO = { sDlrCd:""
                                   ,sStdDt:$("#sStdDt").data("kendoExtMaskedDatePicker").value()
                                   ,sPurcCqtyCalcYn:"Y"
                                   ,sEndYn:"N"
                                   ,sBpCd:vBpCd
                                   ,sPltCd:""
                                   ,sStockInYn:$("#sStockInYn").prop("checked") == true ? "Y":"N"
                                   ,sStockOutYn:$("#sStockOutYn").prop("checked") == true ? "Y":"N"
                                   ,sStockNowYn:$("#sStockNowYn").prop("checked") == true ? "Y":"N"
                    }

                    $.ajax({
                        url:"<c:url value='/par/pcm/purcCost/multiPurcCostes.do' />"
                        ,type:"POST"
                        ,data:JSON.stringify(searchVO)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result) {
                            //success message
                            dms.notification.success("<spring:message code='global.info.success'/>");
                            //calcuate after purcCostManageMain page move
                            document.location.href = "<c:url value='/par/pcm/purcCost/selectPurcCostManageMain.do?bpCd="+encodeURIComponent(vBpCd)+"&bpNm="+encodeURIComponent(vBpNm)+"' />";
                        }
                    });
                }
            }
        });
        //sStdDt
        $("#sStdDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

    });
</script>
<!-- //script -->



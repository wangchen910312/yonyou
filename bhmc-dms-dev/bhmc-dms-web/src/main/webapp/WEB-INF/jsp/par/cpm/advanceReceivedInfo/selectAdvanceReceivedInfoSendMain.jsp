<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectAdvanceReceivedInfoSendMain -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.advanceReceived" /> --%></h1>
        <div class="btn_right">
            <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
            <button class="btn_m" id="btnItemSend"><spring:message code="par.btn.transmission" /></button>
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
        <div id="advanceDealerGrid" ></div>
    </div>

</section>
<!-- // selectAdvanceReceivedInfoSendMain -->

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
//page init Func
function pageInit(){
    $("#sDlrCd").val("");
    $("#sPreAmtTp").data("kendoExtDropDownList").select(0);

    $("#impStartDt").data("kendoExtMaskedDatePicker").value(null);
    $("#impEndDt").data("kendoExtMaskedDatePicker").value(null);

    $("#balAmt").data("kendoExtNumericTextBox").value(0);
    $("#acAmt").data("kendoExtNumericTextBox").value(0);
    $("#calcAmt").data("kendoExtNumericTextBox").value(0);

    $("#advanceDealerGrid").data("kendoExtGrid").dataSource.data([]);
}

//validator
var validator = $("#tableForm").kendoValidator().data("kendoValidator");

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        enable:false
        ,click:function(e){
            //pageInit Func call
            pageInit();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        enable:false
        ,click:function(e){

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

    //부품전송
    $("#btnItemSend").kendoButton({
        click:function(e){

            var grid = $("#advanceDealerGrid").data("kendoExtGrid");
            var dateItems = [ ];
            var itemSendCnt = 0;
            var rows = grid.select();
            $.each(rows, function(idx, row){
                //전송안된것만 가능
                var item = grid.dataItem(row);
                dateItems.push(item);
                itemSendCnt++;
            });

            if (itemSendCnt === 0) {
                dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                return;
            }

            var multiAdvancedDealerSends = { "insertList":[], "updateList" :dateItems, "deleteList":[]};

            $.ajax({
                url:"<c:url value='/par/cpm/advanceReceivedInfo/multiAdvanceReceivedInfoSends.do' />",
                data:JSON.stringify(multiAdvancedDealerSends),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    grid.dataSource.read();
                    //success message
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
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

    //advanceDealerGrid
    $("#advanceDealerGrid").kendoExtGrid({
        gridId:"G-PAR-0808-150301"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/cmp/dealer/selectDealers.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" , validation:{required:true} }
                        ,corpCd:{ type:"string" , validation:{required:true} }
                        ,cmpCd:{ type:"string" , validation:{required:true} }
                        ,dlrNm:{ type:"string" , validation:{required:true} }
                        ,dlrShtNm:{ type:"string" , validation:{required:true} }
                        ,mainDlrYn:{ type:"string" , validation:{required:true} }
                    }
                }
            }
        }
        ,editable:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,selectable:"row"
        ,multiSelectWithCheckbox:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.no'/>", width:50 }
            ,{field:"dlrCd", title:"딜러코드", width:100 }
            ,{field:"corpCd", title:"법인코드", width:100 }
            ,{field:"cmpCd", title:"회사코드", width:100 }
            ,{field:"dlrNm", title:"딜러명", width:100 }
            ,{field:"dlrShtNm", title:"딜러축소명", width:100 }
            ,{field:"mainDlrYn", title:"메인딜러여부", width:100 }
        ]
    });
});
</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 동종업계참조 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic title_basic_v1"><spring:message code="mis.title.targetrefersamebsns" /></h1>
        <div class="btn_right">
            <!-- <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  -->
        <dms:access viewId="VIEW-D-10752" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
        </dms:access>
            <!-- <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>  -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!--
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><span class="bu_required"><spring:message code="mis.lbl.regyearmonth" /></span></th>
                    <td><input type="text" id="sReferYearMonth" name="sReferYearMonth" class="form_datepicker" maxlength="6"></td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
     -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <!-- <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>  -->
            <!-- <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>  -->
            <!-- <button type="button" class="btn_s" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>  -->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->
    <div class="table_info table_info_v2 mt10">
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid"></div>
        </div>
        <!-- 그리드 종료 -->
    </div>
</section>

<script>
    $(document).ready(function() {

        //등록년도
        $("#sReferYearMonth").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sReferYearMonth").kendoMaskedTextBox({
            mask:"######"
        });

        var now = new Date();

        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }

        $("#sReferYearMonth").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

        $(".form_comboBox").kendoExtDropDownList();

        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                 });
            }
        });

        //버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#grid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/mis/tmp/targetReferSameBsnsSave.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });

        //취소
        $("#btnCancel").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').cancelChanges();
            }
        });

        //버튼 - 엑셀저장
        $("#btnExcelExport").kendoButton({
            click:function(e) {
                dms.ajax.excelExport({
                    "beanName":"targetReferSameBsnsService"
                    ,"templateFile":"ReferSameBsns_Tpl.xlsx"
                    ,"fileName":"ReferSameBsns_Tpl.xlsx"
                    ,"sReferYearMonth":$("#sReferYearMonth").val()
                });
            }
        });

        //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0802-150459"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tmp/selectTargetReferSameBsnsMainSearch.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sReferYearMonth"] = $("#sReferYearMonth").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"referDt"
                        ,fields:{
                             referDt:{type:"string", validation:{required:true}}
                            ,referYearDt:{type:"string"}
                            ,referMonthDt:{type:"string"}
                            ,referDayDt:{type:"string"}
                            ,visitReqVal:{type:"number"}
                            ,visitDealVal:{type:"number"}
                            ,totDealVal:{type:"number"}
                            ,perOfterVal:{type:"number"}
                            ,successVal:{type:"number"}
                            ,targetAchVal:{type:"number"}
                            ,goodsCarQty:{type:"number"}
                            ,insApplyRate:{type:"number"}
                            ,fincApplyRate:{type:"number"}
                        }
                    }
                }
            }
            ,height:650
            ,filterable:{
                mode:"row"
            }
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                 //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true            //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,columns:[{
                title:"<spring:message code='mis.lbl.idcc' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"visitReqVal", title:"<spring:message code='mis.lbl.visitReqVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="visitReqVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="visitReqVal"></span>').appendTo(container);
                        }
                },{
                    field:"visitDealVal", title:"<spring:message code='mis.lbl.visitDealVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="visitDealVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="visitDealVal"></span>').appendTo(container);
                        }
                },{
                    field:"totDealVal", title:"<spring:message code='mis.lbl.totDealVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="totDealVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="totDealVal"></span>').appendTo(container);
                        }
                }]
                },{
                title:"<spring:message code='mis.lbl.market' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"perOfterVal", title:"<spring:message code='mis.lbl.perOfterVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="perOfterVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="perOfterVal"></span>').appendTo(container);
                        }
                },{
                    field:"successVal", title:"<spring:message code='mis.lbl.successVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="successVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="successVal"></span>').appendTo(container);
                        }
                }]
                },{
                    title:"<spring:message code='mis.lbl.predictionoptional' />",
                    headerAttributes:{ "class":"hasBob" },
                    columns: [ {
                        field:"goodsCarQty", title: "<spring:message code='mis.lbl.localOption' /><spring:message code='mis.lbl.goodscarqty' />",
                        width: 150, attributes:{"class":"ac"}
                            ,editor:function(container, options){
                                $('<input required name="goodsCarQty" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                     format:"n0"                // n0:###,###, n2:###,###.##
                                    ,decimals:1                 // 소숫점
                                    ,min:0
                                    ,value:0
                                    ,spinners:false
                                });
                                $('<span class="k-invalid-msg" data-for="goodsCarQty"></span>').appendTo(container);
                            }
                    },{
                        field:"insApplyRate", title:"<spring:message code='mis.lbl.inspassesrate' />",
                        width:150, attributes:{"class":"ac"}
                            ,editor:function(container, options){
                                $('<input required name="insApplyRate" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                     format:"n0"                // n0:###,###, n2:###,###.##
                                    ,decimals:1                 // 소숫점
                                    ,min:0
                                    ,value:0
                                    ,spinners:false
                                });
                                $('<span class="k-invalid-msg" data-for="insApplyRate"></span>').appendTo(container);
                            }
                    },{
                        field:"fincApplyRate", title:"<spring:message code='mis.lbl.fncpassesrate' />",
                        width:150, attributes:{"class":"ac"}
                            ,editor:function(container, options){
                                $('<input required name="fincApplyRate" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                     format:"n0"                // n0:###,###, n2:###,###.##
                                    ,decimals:1                 // 소숫점
                                    ,min:0
                                    ,value:0
                                    ,spinners:false
                                });
                                $('<span class="k-invalid-msg" data-for="fincApplyRate"></span>').appendTo(container);
                            }
                    }]
                }]
        });
    });
</script>
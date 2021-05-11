<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


    <!-- 판매기회 팝업 -->
    <section id="window" class="pop_wrap">


        <!-- 내방 상세정보 form -->
        <div id="visitCustMgmtInputForm">

            <!-- 내방 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.visitDetlInfo" />111<!-- 내방 상세 정보 --></h2>
                    <div class="left_area" id="reVisitLabel">
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span></th>
                                <td>
                                    <input type="hidden" id="vsitNo" name="vsitNo" data-json-obj="true" />
                                    <input type="hidden" id="leadNo" name="leadNo" data-json-obj="true" />
                                <div class="form_search" >
                                    <input type="text" id="custNm" name="custNm" class="form_input" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                    <a href="javascript:;" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="hpNo" name="hpNo" class="form_input numberic" maxlength="14" data-json-obj="true" data-name="<spring:message code="global.lbl.hpNo" />" data-bind="value:hpNo" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <input type="text" id="custNo" name="custNo" data-json-obj="true" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                            <tr>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //내방 상세 정보 -->

            <!-- 내방 상세 정보 -->
            <section class="group mt10">
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.visitDt' /><!-- 내방일 --></span></th>
                                <td class="required_area">
                                    <input id="vsitDt" name="vsitDt" class="form_datetimepicker" data-json-obj="true" style="width:100%" required type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.vsitDt" />" data-bind="value:vsitDt" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.visitEndDt' /><!-- 내방종료일 --></th>
                                <td>
                                    <input id="vsitEndDt" name="vsitEndDt" class="form_datetimepicker" data-json-obj="true" style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.visitEndDt" />" data-bind="value:visitEndDt" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.withPrsCnt" /><!-- 동행자수 --></span></th>
                                <td class="required_area">
                                    <input id="withPrsnCnt" name="withPrsnCnt" class="form_numeric" data-json-obj="true" style="width:100%" required data-name="<spring:message code="global.lbl.withPrsCnt" />" data-bind="value:withPrsCnt" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.visitPathCd" /><!-- 내방출처 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <input id="vsitSrcCd" name="vsitSrcCd" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="global.lbl.visitPathCd" />" data-bind="value:vsitSrcCd" />
                                        </div>
                                        <div class="form_right">
                                            <input id="vsitSrcDetlCont" name="vsitSrcDetlCont" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.visitPpsCd" /><!-- 내방 목적 --></th>
                                <td>
                                    <input id="vsitGoalCd" name="vsitGoalCd" class="form_comboBox" data-json-obj="true" style="width:100%" data-name="<spring:message code="global.lbl.visitPpsCd" />" data-bind="value:vsitGoalCd" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.visitStatCd" /><!-- 내방상태 --></th>
                                <td>
                                    <input id="vsitStatCd" name="vsitStatCd" class="form_comboBox" data-json-obj="true" style="width:100%" data-name="<spring:message code="global.lbl.visitStatCd" />" data-bind="value:visitStatCd" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.resvDt" /><!-- 예약일시 --></th>
                                <td>
                                    <input id="resvDt" name="resvDt" class="form_datetimepicker form_readonly" data-json-obj="true" style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.resvDt" />" data-bind="value:resvDt" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptYn' /><!-- 판매기회여부 --></th>
                                <td>
                                    <input type="text" id="saleOpptYn" name="saleOpptYn" class="form_input form_readonly" style="width:100%" disabled/>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></th>
                                <td>
                                    <input type="text" id="saleOpptStepCd" name="saleOpptStepCd" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                <td>
                                    <input id="scId" name="scId" class="form_comboBox" data-json-obj="true" style="width:57%" data-name="<spring:message code="sal.lbl.salesAdvisor" />" data-bind="value:scId" />
                                    <button id="btnScSchduler" class="btn_s"><spring:message code="global.btn.viewScheduler" /><!-- 스케줄보기 --></button>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                                <td colspan="5">
                                    <textarea rows="4" cols="" id="remark" name="remark" class="form_textarea" style="width:100%;" maxlength="1000" data-json-obj="true" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                <td>
                                    <input id="regUsrId" name="regUsrId" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <input id="regDt" name="regDt" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //내방 상세 정보 -->

        </div>
        <!-- // 내방 상세정보 form -->




    </section>
    <!-- //판매기회 팝업 -->



<script type="text/javascript">

    $(document).ready(function() {

        // 팝업 form 데이터 set
        //var options = parent.opptPopupWindow.options.content.data;

        $("#openButton").click(function(){
            var win = $("#window").data("kendoWindow");
            win.center();
            win.open();
        });
        $("#closeButton").click(function(){
            var win = $("#window").data("kendoWindow");
            win.close();
        });
        /*
        $("#window").kendoWindow({
            modal:true,
            resizable:false,
            //visible:false,
            title:"",
            width:"800px"
        }).data("kendoWindow");
         */
        $(".grid").kendoGrid({
            height:142
        });
        $(".form_comboBox").kendoExtDropDownList();
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });


        // 휴대전화
        $("#hpNo").kendoMaskedTextBox({
            mask:"00000000000000"
            , promptChar:" "
        });

        // 방문 일시
        $("#vsitDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            //,value:sysDate
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 내방종료일
        $("#vsitEndDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 내방 예약 일시
        $("#resvDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });


        // 동행자수
        $("#withPrsnCnt").kendoExtNumericTextBox({
             format:"#"
            ,min:0
            ,value:0
        });



    });
</script>

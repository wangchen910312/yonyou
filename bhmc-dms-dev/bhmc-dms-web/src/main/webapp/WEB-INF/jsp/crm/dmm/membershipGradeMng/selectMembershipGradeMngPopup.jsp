<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:600px;top:150px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

    <section id="windows" class="pop_wrap">
        <section class="group" id="gradeForm">
            <div class="header_area">
                <h2 class="title_basic"> <spring:message code="global.lbl.gradeCd" /> </h2><!-- 등급 -->
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11346" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnDelete" class="btn_m btn_del" style="display:none;"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11347" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                </dms:access>
                </div>
            </div>

            <div class="table_form" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.gradeOrderNo'/></th><!-- 등급순서 -->
                            <td>
                                <input type="number" id="gradeOrderNo" name="gradeOrderNo" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.gradeNm'/></th><!-- 등급명 -->
                            <td>
                                <input id="gradeNm" name="gradeNm" class="form_input" maxlength="33" data-json-obj='true'>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="global.title.membershipGradeMng" /> </h2><!-- 멤버십 등급조건 설정 -->
                <div class="btn_right">
                </div>
            </div>

            <div class="table_form" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.rchgAmt'/></th><!-- 충전금액 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <!-- <input id="rchgStartAmt" name="rchgStartAmt" class="form_input" maxlength="10" data-json-obj='true'> -->
                                        <input type="number" id="rchgStartAmt" name="rchgStartAmt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <!-- <input id="rchgEndAmt" name="rchgEndAmt" class="form_input" maxlength="10" data-json-obj='true'> -->
                                        <input type="number" id="rchgEndAmt" name="rchgEndAmt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                    </div>
                                </div>
                                <input type="hidden" id="stdPridMonth" name="stdPridMonth" value="${stdPridMonth}" data-json-obj='true'/> <!-- 기준최근 -->
                                <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj='true'/> <!-- 기준최근 -->
                                <input type="hidden" id="gradeSeq" name="gradeSeq" data-json-obj='true'/> <!-- 기준최근 -->
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.purcCnt'/></th><!-- 구매횟수 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <!-- <input id="purcStartCnt" name="purcStartCnt" class="form_input" maxlength="10" data-json-obj='true'> -->
                                        <input type="number" id="purcStartCnt" name="purcStartCnt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <!-- <input id="purcEndCnt" name="purcEndCnt" class="form_input" maxlength="10" data-json-obj='true'> -->
                                        <input type="number" id="purcEndCnt" name="purcEndCnt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                    </div>
                                </div>
                                <input type="hidden" id="purcTermCd" name="purcTermCd" value="OR" data-json-obj='true' /> <!-- //구매횟수조건코드 -->
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.gradePurcAmt'/></th><!-- 구매금액 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <!-- <input id="purcStartAmt" name="purcStartAmt" class="form_input" maxlength="10" data-json-obj='true'> -->
                                        <input type="number" id="purcStartAmt" name="purcStartAmt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <!-- <input id="purcEndAmt" name="purcEndAmt" class="form_input" maxlength="10" data-json-obj='true'> -->
                                        <input type="number" id="purcEndAmt" name="purcEndAmt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                    </div>
                                </div>
                                <input type="hidden" id="purcTermAmtCd" name="purcTermAmtCd" value="OR" data-json-obj='true'/> <!-- // 구매조건금액코드 -->
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.saleDt'/></th><!-- 판매구매기간 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="saleStartDt" name="saleStartDt" class="form_datepicker" data-json-obj='true'>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="saleEndDt" name="saleEndDt" value="${dataInfo.saleEndDt}" class="form_datepicker" data-json-obj='true'>
                                    </div>
                                </div>
                                <input type="hidden" id="saleEndDtCd" name="saleEndDtCd" value="OR" data-json-obj='true'/> <!-- //판매구매기간조건코드 -->
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.serCnt"/></th><!-- 정비건수 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="number" id="serStartCnt" name="serStartCnt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="number" id="serEndCnt" name="serEndCnt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                    </div>
                                </div>
                                <input type="hidden" id="serCntTermCd" name="serCntTermCd" value="OR" data-json-obj='true'/> <!-- //방문조건코드 -->
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.serAmt"/></th> <!-- 정비소비금액 으로 변경해야함 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="number" id="serStartAmt" name="serStartAmt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="number" id="serEndAmt" name="serEndAmt" min="0" max="9999999999" class="form_numeric ar" maxlength="10" data-json-obj='true'>
                                    </div>
                                </div>
                                <input type="hidden" id="serAmtTermCd" name="serAmtTermCd" value="OR" data-json-obj='true'/> <!-- //방문조건코드 -->
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="crm.title.dcRate" /> </h2><!-- 할인율 -->
                <div class="btn_right">
                </div>
            </div>

            <div class="table_form" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.serLbrDcRate'/></th><!-- 정비공임할인(%) -->
                            <td>
                                <input type="number" id="serLbrDcRate" name="serLbrDcRate" min="0" max="100" class="form_numeric ar" maxlength="3" data-json-obj='true'>
                            </td>
                            <th scope="row"><spring:message code='crm.lbl.serParDcRate'/></th><!-- 정비부품할인(%) -->
                            <td>
                                <input type="number" id="serParDcRate" name="serParDcRate" min="0" max="100" class="form_numeric ar" maxlength="3" data-json-obj='true'>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="crm.label.accuRate" /><spring:message code="crm.label.accuRateInfo" /><!-- 회원등급포인트율(100元 = 积分) --></h2>
                <div class="btn_right">
                </div>
            </div>

            <div class="table_form" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:28%;">
                        <col style="width:13%;">
                        <col style="width:21%;">
                        <col style="width:13%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.accuRate'/></th><!-- 적립율 -->
                            <td>
                                <!-- <input id="accuRate" name="accuRate" class="form_input" data-json-obj='true'> -->
                                <input type="number" id="accuRate" name="accuRate" min="0" class="form_numeric ar" data-json-obj='true'>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding:5px 0 3px 3px; text-align:right;"><spring:message code='crm.info.pointSave'/></div>
        </section>
    </section>

<script type="text/javascript">

    //등급순서(%)
    $("#gradeOrderNo").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //충전금액 시작
    $("#rchgStartAmt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //충전금액 종료
    $("#rchgEndAmt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //구매횟수 시작
    $("#purcStartCnt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //구매횟수 종료
    $("#purcEndCnt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //구매금액 시작
    $("#purcStartAmt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //구매금액 종료
    $("#purcEndAmt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비건수 시작
    $("#serStartCnt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비건수 종료
    $("#serEndCnt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비금액 시작
    $("#serStartAmt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비금액 종료
    $("#serEndAmt").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비공임할인(%)
    $("#serLbrDcRate").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비부품할인(%)
    $("#serParDcRate").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    //정비총금액할인(%)
//     $("#serTotDcRate").kendoExtNumericTextBox({
//         format:"n0"
//         ,decimals:0                // 소숫점
//         ,min:0
//         ,value:0
//         ,spinners:false             // 증,감 화살표
//     });

    //적립율
    $("#accuRate").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:100
        ,spinners:false             // 증,감 화살표
    });

$(document).ready(function() {


    //상세보기 일경우 Data Setting종료

    // 정비 총금액 할인 에서 ObKeyDown
//     $("#serTotDcRate").keydown(function(e){
//         if($("#serTotDcRate").data("kendoExtNumericTextBox").value() > 0){
//             $("#serLbrDcRate").data("kendoExtNumericTextBox").value(0);
//             $("#serParDcRate").data("kendoExtNumericTextBox").value(0);
//         }
//     });

    // 정비 공임할인 에서 ObKeyDown
//     $("#serLbrDcRate").keydown(function(e){
//         $("#serTotDcRate").data("kendoExtNumericTextBox").value(0);
//     });

    // 정비 부품 할인 에서 ObKeyDown
//     $("#serParDcRate").keydown(function(e){
//         $("#serTotDcRate").data("kendoExtNumericTextBox").value(0);
//     });

    $("#saleStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,change:fnChkSearchDate
    });

    $("#saleEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,change:fnChkSearchDate
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#saleStartDt").on('change', {from:$("#saleStartDt"), to:$("#saleEndDt")}, fnChkSearchDate);
    $("#saleEndDt").on('change', {from:$("#saleStartDt"), to:$("#saleEndDt")}, fnChkSearchDate);

    var info = '<c:out value="${dataInfo}" />';

    //상세보기 일경우 Data Setting시작
    if(info != null && info != ""){
        $("#dlrCd").val('<c:out value="${dataInfo.dlrCd}" />');
        $("#gradeSeq").val('<c:out value="${dataInfo.gradeSeq}" />');
        $("#gradeOrderNo").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.gradeOrderNo}" />');
        $("#gradeNm").val('<c:out value="${dataInfo.gradeNm}" />');
        $("#rchgStartAmt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.rchgStartAmt}" />');
        $("#rchgEndAmt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.rchgEndAmt}" />');
        $("#purcStartCnt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.purcStartCnt}" />');
        $("#purcEndCnt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.purcEndCnt}" />');
        $("#purcTermCd").val('<c:out value="${dataInfo.purcTermCd}" />');
        $("#purcStartAmt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.purcStartAmt}" />');
        $("#purcEndAmt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.purcEndAmt}" />');
        $("#purcTermAmtCd").val('<c:out value="${dataInfo.purcTermAmtCd}" />');
        $("#serStartCnt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serStartCnt}" />');
        $("#serEndCnt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serEndCnt}" />');
        $("#serTermCd").val('<c:out value="${dataInfo.serCntTermCd}" />');
        $("#serStartAmt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serStartAmt}" />');
        $("#serEndAmt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serEndAmt}" />');
        $("#serAmtTermCd").val('<c:out value="${dataInfo.serAmtTermCd}" />');
        /* $("#vsitStartCnt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.vsitStartCnt}" />');
        $("#vsitEndCnt").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.vsitEndCnt}" />');
        $("#vsitTermCd").val('<c:out value="${dataInfo.vsitTermCd}" />'); */
        $("#saleStartDt").data("kendoExtMaskedDatePicker").value(kendo.parseDate('<c:out value="${dataInfo.saleStartDtStr}" />', "<dms:configValue code='dateFormat' />"));
        $("#saleEndDt").data("kendoExtMaskedDatePicker").value(kendo.parseDate('<c:out value="${dataInfo.saleEndDtStr}" />', "<dms:configValue code='dateFormat' />"));
        $("#saleEndDtCd").val('<c:out value="${dataInfo.saleEndDtCd}" />');
        $("#serLbrDcRate").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serLbrDcRate}" />');
        $("#serParDcRate").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serParDcRate}" />');
//         $("#serTotDcRate").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.serTotDcRate}" />');
        $("#accuRate").data("kendoExtNumericTextBox").value('<c:out value="${dataInfo.accuRate}" />');

        if(dms.string.isNotEmpty('<c:out value="${dataInfo.gradeSeq}" />')){
            $("#btnDelete").show();
        }else{
            $("#btnDelete").hide();
        }
    }

    /* $("#stdPridMonth").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:stdPridMonthCdList
        , index:0
    }); */

    /*************************************************************
     * 버튼 영역
     *************************************************************/
    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            if(dms.string.isEmpty($("#gradeOrderNo").data("kendoExtNumericTextBox").value()) || 0 >= $("#gradeOrderNo").data("kendoExtNumericTextBox").value()){
                //등급순서은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.gradeOrderNo' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                //$("#gradeOrderNo").data("kendoExtNumericTextBox").focus();
                return;
            }

            if(dms.string.isEmpty($("#gradeNm").val())){
                //등급명은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='global.lbl.gradeNm' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                $("#gradeNm").focus();
                return;
            }

            if(dms.string.isEmpty($("#rchgStartAmt").data("kendoExtNumericTextBox").value()) || dms.string.isEmpty($("#rchgEndAmt").data("kendoExtNumericTextBox").value())){
                //충전금액은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }
            if($("#rchgStartAmt").data("kendoExtNumericTextBox").value() > $("#rchgEndAmt").data("kendoExtNumericTextBox").value()){
                //충전시작 금액은 충전종료 금액보다 클 수 없습니다.
                dms.notification.info("<spring:message code='global.lbl.rchgStartAmt' var='init' /><spring:message code='global.lbl.rchgEndAmt' var='init2' /><spring:message code='global.err.chkGreateParam' arguments='${init},${init2}' />");
                return;
            }

            if(dms.string.isEmpty($("#purcStartCnt").data("kendoExtNumericTextBox").value()) || dms.string.isEmpty($("#purcEndCnt").data("kendoExtNumericTextBox").value())){
                //구매횟수은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.purcCnt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }
            if($("#purcStartCnt").data("kendoExtNumericTextBox").value() > $("#purcEndCnt").data("kendoExtNumericTextBox").value()){
                //구매시작횟수은 구매종료횟수 금액보다 클 수 없습니다.
                dms.notification.info("<spring:message code='global.lbl.rchgStartAmt' var='init' /><spring:message code='global.lbl.rchgEndAmt' var='init2' /><spring:message code='global.err.chkGreateParam' arguments='${init},${init2}' />");
                return;
            }

            if(dms.string.isEmpty($("#purcStartAmt").data("kendoExtNumericTextBox").value()) || dms.string.isEmpty($("#purcEndAmt").data("kendoExtNumericTextBox").value())){
                //구매금액은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.gradePurcAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }
            if($("#purcStartAmt").data("kendoExtNumericTextBox").value() > $("#purcEndAmt").data("kendoExtNumericTextBox").value()){
                //구매시작 금액은 구매종료 금액보다 클 수 없습니다.
                dms.notification.info("<spring:message code='global.lbl.purcStartAmt' var='init' /><spring:message code='global.lbl.purcEndAmt' var='init2' /><spring:message code='global.err.chkGreateParam' arguments='${init},${init2}' />");
                return;
            }

            if(dms.string.isEmpty($("#serStartCnt").data("kendoExtNumericTextBox").value()) || dms.string.isEmpty($("#serEndCnt").data("kendoExtNumericTextBox").value())){
                //정비건수은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.serCnt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }
            /* if($("#vsitStartCnt").data("kendoExtNumericTextBox").value() > $("#vsitEndCnt").data("kendoExtNumericTextBox").value()){
                //방문시작횟수은 방문종료횟수보다 클 수 없습니다.
                dms.notification.info("<spring:message code='global.lbl.vsitStartCnt' var='init' /><spring:message code='global.lbl.vsitEndCnt' var='init2' /><spring:message code='global.err.chkGreateParam' arguments='${init},${init2}' />");
                return;
            } */

            /* if(dms.string.isEmpty($("#saleStartDt").data("kendoExtMaskedDatePicker").value()) || dms.string.isEmpty($("#saleEndDt").data("kendoExtMaskedDatePicker").value())){
                //판매구매기간(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.saleDt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            } */

         // form 데이터
            var param =
                $("#gradeForm").serializeObject(
                    $("#gradeForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            /*param["dlrCd"] = dlrCd;
            param["cardTpCd"] = cardTpCd;
            param["membershipNo"] = membershipNo;

            param["pointTp"] = "+";
            param["occrPointVal"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["realTotAmt"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["extcTargYn"] = "Y";
            param["insertFlag"] = "01";//충전카드 충전일땐 01 로 하며 존재여부파악하기 위해 사용
            */

            param["saleStartDt"]    = $("#saleStartDt").data("kendoExtMaskedDatePicker").value();
            param["saleEndDt"]      = $("#saleEndDt").data("kendoExtMaskedDatePicker").value();
            param["saleEndDtCd"]      = "OR";
            param["serAmtTermCd"]      = "OR";
            param["serCntTermCd"]      = "OR";

            var url = "<c:url value='/crm/dmm/membershipGradeMng/insertMembershipGradeMng.do' />";
            if(!dms.string.isEmpty($("#gradeSeq").val())){
                url = "<c:url value='/crm/dmm/membershipGradeMng/updateMembershipGradeMng.do' />";
            }

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //parent.$('#gradeGrid').data('kendoExtGrid').dataSource.read();
                    parent.$('#gradeGrid').data('kendoExtGrid').dataSource.page(1);
                    parent.popupWindow.close();
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            }).done(function(result) {
                //console.log("rechargAmtSave Done!!!!");
            });
       }
    });

    //버튼 - 삭제
    $("#btnDelete").kendoButton({
        click:function(e){
            var param =
                $("#gradeForm").serializeObject(
                    $("#gradeForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            /*param["dlrCd"] = dlrCd;
            param["cardTpCd"] = cardTpCd;
            param["membershipNo"] = membershipNo;

            param["pointTp"] = "+";
            param["occrPointVal"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["realTotAmt"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["extcTargYn"] = "Y";
            param["insertFlag"] = "01";//충전카드 충전일땐 01 로 하며 존재여부파악하기 위해 사용
            */

            param["gradeSeq"]    = $("#gradeSeq").val();
            param["saleStartDt"] = $("#saleStartDt").data("kendoExtMaskedDatePicker").value();
            param["saleEndDt"] = $("#saleEndDt").data("kendoExtMaskedDatePicker").value();

            var url = "<c:url value='/crm/dmm/membershipGradeMng/deleteMembershipGradeMng.do' />";

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //parent.$('#gradeGrid').data('kendoExtGrid').dataSource.read();
                    parent.$('#gradeGrid').data('kendoExtGrid').dataSource.page(1);
                    parent.popupWindow.close();
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            }).done(function(result) {
                //console.log("rechargAmtSave Done!!!!");
            });
       }
    });


});

//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    if(dms.string.isEmpty(e.data.from.val())){return;}
    if(dms.string.isEmpty(e.data.to.val())){return;}

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

</script>
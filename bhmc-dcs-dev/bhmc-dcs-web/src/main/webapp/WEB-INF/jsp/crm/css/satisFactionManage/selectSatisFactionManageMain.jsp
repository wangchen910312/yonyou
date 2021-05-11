<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 만족도 조사 관리 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.satisfactionMng" /></h1><!-- 만족도 조사관리 -->
        <div class="btn_right">
            <button class="btn_m btn_call" id="btnRcpeExtrMapping"><spring:message code="crm.btn.rcpeExtrMapping" /></button> <!-- 대상자 추출 -->
            <button class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <%-- <button class="btn_m btn_save" id="btnSatisFacMngSave"><spring:message code="global.btn.save" /></button> --%> <!-- 저장 -->
            <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button><!-- 추가 -->
            <button class="btn_m btn_print" id="btnSatisFacMngPrint"><spring:message code="global.btn.print" /></button> <!-- 인쇄 -->
            <!-- <button class="btn_m btn_print" id="btnBatch">대상자추출 배치</button> --> <!-- 인쇄 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
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
                <tr>
                    <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/></th><!-- 만족도 조사 명 -->
                    <td>
                        <input id="sStsfIvstNm" name="sStsfIvstNm" type="text" class="form_input" maxlength="33">
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.stsfIvstTpCd" /></th><!-- 만족도 조사타입 -->
                    <td>
                        <!-- <input id="sStsfIvstMthCd" type="text" class="form_input" style="width:70%"> -->
                        <input id="sStsfIvstTpCd" name="sStsfIvstTpCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.type" /></th><!-- 유형 -->
                    <td>
                        <!-- <input id="sStsfIvstMthCd" type="text" class="form_input" style="width:70%"> -->
                        <input id="sStsfIvstMthCd" name="sStsfIvstMthCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd" /></th><!-- 만족도 조사 수단 -->
                    <td>
                        <!-- <input id="sStsfIvstExpdCd" type="text" class="form_input" style="width:70%"> -->
                        <input id="sStsfIvstExpdCd" name="sStsfIvstExpdCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <%-- <button class="btn_s btn_call" id="btnRcpeExtrMapping"><spring:message code="crm.btn.rcpeExtrMapping" /></button> --%> <!-- 대상자 추출 -->
            <%-- <button class="btn_s btn_call" id="btnSearch"><spring:message code="global.btn.search" /></button> --%> <!-- 조회 -->
            <%-- <button class="btn_s btn_call" id="btnSatisFacMngCall"><spring:message code="global.btn.callTransfer" /></button> --%> <!-- 콜센터이관 -->
            <%-- <button class="btn_s btn_print" id="btnSatisFacMngPrint"><spring:message code="global.btn.print" /></button> --%> <!-- 인쇄 -->
            <%-- <button class="btn_s btn_save" id="btnSatisFacMngSave"><spring:message code="global.btn.save" /></button> --%> <!-- 저장 -->
            <%-- <button class="btn_s btn_add" id="btnSatisFacMngAdd"><spring:message code="global.btn.rowAdd" /></button> --%> <!-- 행추가 -->
            <%-- <button class="btn_s btn_del" id="btnSatisFacMngDel"><spring:message code="global.btn.rowDel" /></button> --%> <!-- 행삭제 -->
            <%-- <button class="btn_s btn_cancel" id="btnSatisFacMngCancel"><spring:message code="global.btn.cancel" /></button> --%> <!-- 취소 -->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 만족도 조사 그리드 시작 -->
    <div class="table_grid">
        <div id="satisFactionManageGrid"></div>
    </div>
    <!-- 만족도 조사 그리드 종료 -->
</section>

<!-- 만족도 조사 상세 -->
<section id="satisFactionManageWindow" class="pop_wrap">
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.title.stsfIvstDetail" /></h2> <!-- 만족도 조사 상세 -->
            <div class="btn_right">
                <button class="btn_m btn_save" id="btnSatisFacMngSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
            </div>
        </div>

        <div class="table_form" id="stsfForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:13%;">
                    <col style="width:14%;">
                    <col style="width:11%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody id="salesActiveMgmtForm" >
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstNm' /><!-- 만족도 조사명 --></span></th>
                        <td class="required_area" colspan="3">
                            <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" data-name="<spring:message code="global.lbl.dlrCd" />" data-bind="value:dlrCd" />
                            <input type="hidden" id="seq" name="seq" data-json-obj="true" data-name="<spring:message code="crm.lbl.stsfIvstNm" />" data-bind="value:seq" />
                            <input type="hidden" id="batOperId" name="batOperId" data-json-obj="true" data-name="<spring:message code="global.lbl.batOperId" />" data-bind="value:batOperId" />
                            <input type="hidden" id="editYn" name="editYn" data-json-obj="true" data-name="" data-bind="value:editYn" />
                            <input id="stsfIvstNm" name="stsfIvstNm" class="form_input" maxlength="33" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstNm" />" data-bind="value:stsfIvstNm" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstTpCd' /></span></th><!-- 만족도 조사타입 -->
                        <td class="required_area">
                            <input id="stsfIvstTpCd" name="stsfIvstTpCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstTpCd" />" data-bind="value:stsfIvstTpCd" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.type' /></span></th><!-- 유형 -->
                        <td class="required_area">
                            <input id="stsfIvstMthCd" name="stsfIvstMthCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstMthCd" />" data-bind="value:stsfIvstMthCdd" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custTargYn' /></span><!-- 고객대상여부 --></th>
                        <td>
                            <input id="custTargYn" name="custTargYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.custTargYn" />" data-bind="value:custTargYn" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstExpdCd' /><!-- 만족도 조사수단 --></span></th>
                        <td class="required_area">
                            <input id="stsfIvstExpdCd" name="stsfIvstExpdCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstExpdCd" />" data-bind="value:stsfIvstExpdCd" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></span></th>
                        <td class="required_area">
                            <input id="startDt" name="startDt" class="form_datepicker" data-json-obj="true" required data-name="<spring:message code="crm.lbl.startDt" />" data-bind="value:startDt" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.endDt' /><!-- 종료일 --></span></th>
                        <td class="required_area">
                            <input id="endDt" name="endDt" class="form_datepicker" data-json-obj="true" required data-name="<spring:message code="crm.lbl.endDt" />" data-bind="value:endDt" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rcpeExtrSeq' /><!-- 대상자 추출 --></span></th>
                        <td class="required_area">
                            <input id="custExtrAutoYn" name="custExtrAutoYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrAutoYn" />" data-bind="value:custExtrAutoYn" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.subyTmplNm' /></span><!--  설문템지명 --></th>
                        <td>
                            <input id="subyTmplSeq" name="subyTmplSeq" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.custTargYn" />" data-bind="value:custTargYn" />
                        </td>
                        <!-- ###################################################### 추출주기설정 1/5 HTML 추가 시작 1/5 -->
                        <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                        <td colspan="3">
                            <button type="button" class="btn_s" id="btnCycleDay" ><spring:message code='crm.btn.allDay' /><!-- 매일 --></button>
                            <button type="button" class="btn_s" id="btnCycleWeek" ><spring:message code='crm.btn.allWeek' /><!-- 매주 --></button>
                            <button type="button" class="btn_s btn_select" id="btnCycleSelect" ><spring:message code='global.btn.select' /><!-- 선택 --></button>
                            <input id="cycleDatepicker" name="cycleDatepicker" class="form_datepicker multi_datepicker" />
                            <input type="hidden" id="custExtrCycleTp" name="custExtrCycleTp" data-json-obj="true" />
                        </td>
                        <!-- ###################################################### 추출주기설정 1/5 HTML 추가 종료 -->
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rcpeExtrSeqCondition'/></span></th><!-- 대상자 추출조건 -->
                        <td class="required_area" colspan="3">
                            <input id="rcpeExtrSeq" name="rcpeExtrSeq" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.rcpeExtrSeq" />" data-bind="value:rcpeExtrSeq" />
                        </td>
                        <th scope="row" ></th>
                        <td class="vt" colspan="3">
                            <div id="weekSelect" style="display:none;">
                            <c:forEach var="obj" items="${custExtrCycleWeekList}">
                                <label class="label_check" style="width:45px;margin:0 0 2px;"><input type="checkbox" id="custExtrCycleWeek_<c:out value='${obj.cmmCd}' />" name="custExtrCycleWeek" class="form_check" value="<c:out value='${obj.cmmCd}' />" data-json-obj="true" /> <c:out value="${obj.cmmCdNm}" /></label>
                            </c:forEach>
                            </div>
                            <div id="cycleDtTxtArea" style="display:none;">
                                <textarea rows="2" cols="" id="cycleDt" name="cycleDt" class="form_textarea" maxlength="1000" ></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.lastExtrDt' /><!-- 마지막추출일 --></th>
                        <td>
                            <input type="text" id="lastExtrDt" name="lastExtrDt" class="form_datepicker form_readonly" disabled />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.useYn' /><!-- 사용여부 --></span></th>
                        <td class="required_area">
                            <input id="useYn" name="useYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.useYn" />" data-bind="value:useYn" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                        <td>
                            <input type="text" id="regUsrNm" name="regUsrNm" class="form_input form_readonly" disabled />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <input id="regDt" name="regDt" class="form_datepicker form_readonly" disabled />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.stsfCont'/></th><!-- 설명/화술 -->
                        <td colspan="7">
                            <textarea rows="2" cols="" id="stsfCont" name="stsfCont" class="form_textarea" maxlength="1330" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareCont" />" data-bind="value:custCareCont" style="height:42px;"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section> <!-- end class="group" -->
</section> <!-- end  class="pop_wrap" -->

<script type="text/javascript">

/* ###################################################### 추출주기설정 2/5 script 추가 시작  */

    var custExtrCycleDt = [];
    // 달력 박스 표시
    function isInArray(date, dates) {
        for(var idx = 0, length = dates.length; idx < length; idx++) {
            var d = dates[idx];
            if (date.getFullYear() == d.getFullYear() &&
                date.getMonth() == d.getMonth() &&
                date.getDate() == d.getDate()) {
                return true;
            }
        }
        return false;
    };

    // 추출주기 화면 초기화 - 화면만 초기화 하고 체크박스, 날짜 선택 값은 초기화 하지 않는다.
    function cycleFormInit() {

        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();

        // 버튼 값 초기화
        $("#custExtrCycleTp").val("");

        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");

    };

    function dtToString(custExtrCycleDt){

        var custExtrCycleDt = custExtrCycleDt;
        var firstChk = false;
        var cycleDtTxt = "";

        $("#cycleDt").val("");

        $.each(custExtrCycleDt, function(index, obj) {
            if(firstChk){
                cycleDtTxt += ", ";
            }
            cycleDtTxt += kendo.toString(obj,"<dms:configValue code='dateFormat' />");
            firstChk = true;
        });
         $("#cycleDt").val(cycleDtTxt);

    };

    $(document).ready(function() {

        // 매일
        $("#btnCycleDay").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleDay").addClass("btn_active");
                $("#custExtrCycleTp").val("D");

            }
        });
        // 매주
        $("#btnCycleWeek").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleWeek").addClass("btn_active");
                $("#custExtrCycleTp").val("W");
                $("#weekSelect").show();

            }
        });
        // 선택
        $("#btnCycleSelect").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleSelect").addClass("btn_active");
                $("#custExtrCycleTp").val("S");
                $("#cycleDtTxtArea").show();

                var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                cycleDatepicker.open();

            }
        });

        var cycleDatepicker = $("#cycleDatepicker").kendoDatePicker({
            animation:false,
            dates:custExtrCycleDt,
            month:{
                content:'# if (isInArray(data.date, data.dates)) { #' +
                             '<em class="calendarBg">#= data.value #</em>' +
                         '# } else { #' +
                             '#= data.value #' +
                         '# } # '
            },
            open:function (e) {

                //추출주기 화면 초기화 (  $("#btnCycleSelect").click() 이벤트 주면 무한루프돔 )
                cycleFormInit();
                $("#btnCycleSelect").addClass("btn_active");
                $("#custExtrCycleTp").val("S");
                $("#cycleDtTxtArea").show();

                if ( custExtrCycleDt.length > 0 ) {

                    //$("table tbody .k-state-selected").removeClass("k-state-selected k-state-focused");
                    //$("table tbody .k-state-focused").removeClass("k-state-selected k-state-focused");

                    var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                    cycleDatepicker.setOptions({
                        dates:custExtrCycleDt
                        ,month:{
                            content:'# if (isInArray(data.date, data.dates)) { #' +
                                         '<em name="calendarBg" class="calendarBg">#= data.value #</em>' +
                                     '# } else { #' +
                                         '#= data.value #' +
                                     '# } # '
                        }
                    });

                    // 기존에 선택된 날짜 포커싱되는거 삭제
                    $("table tr .k-state-selected").removeClass("k-state-selected k-state-focused");

                };

            }
        }).getKendoDatePicker();

        cycleDatepicker.dateView.options.change = function(e){

            // 선택한 셀 표시
            this._cell.addClass("calendarChek");

            var selectDate = this.value();
            var insertDt = false;

            $.each(custExtrCycleDt, function(index, obj) {
                // 선택된 날짜와 데이터소스와 비교해서 동일한 날짜가 있으면 지워준다.
                if ( kendo.toString(selectDate,"<dms:configValue code='dateFormat' />") === kendo.toString(obj,"<dms:configValue code='dateFormat' />") ){
                    insertDt = true;
                    custExtrCycleDt.splice(index,1);
                }

            });

            // 선택된 날짜 List에 추가
            if(!insertDt){
                custExtrCycleDt.push(selectDate);
            }else{
                // 클릭시 전체 영역 표시되는 빨간 박스 삭제
                this._cell.removeClass("calendarChek k-state-selected k-state-focused");
                // 데이터소스에서 추가된 클래스가 삭제가 안되서 <div class="calSelected"></div>14 영역을 날리고 날짜를 다시 쓴다
                var cellTxt = this._cell.children().text();
                this._cell.children().html("");
                this._cell.children().html(cellTxt);
            }

            // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
            dtToString(custExtrCycleDt);

        };

    });
/* ###################################################### 추출주기설정 2/5 script 추가 종료 */



/*************************************************************
데이터 셋업
*************************************************************/
    //1.그리드 질문유형 콤보 DataSource
    var surveyTmplList = [{"subyTmplSeq":"", "subyTmplNm":""}];
    <c:forEach var="obj" items="${surveyTmplList}">
    surveyTmplList.push({
        "subyTmplSeq":"${obj.subyTmplSeq}"
        ,"subyTmplNm":"${obj.subyTmplNm}"
        });
    </c:forEach>
    var surveyTmplMap = dms.data.arrayToMap(surveyTmplList, function(obj){ return obj.subyTmplSeq; });

    //2.그리드 만족도조사 유형 콤보  DataSource
    var stsfIvstMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstMthCdList}">
    stsfIvstMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
     var stsfIvstMthCdListMap = dms.data.arrayToMap(stsfIvstMthCdList, function(obj){ return obj.cmmCd; });

    //3.그리드 만족도 조사수단 콤보 DataSource
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var stsfIvstExpdCdListMap = [];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
    stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    stsfIvstExpdCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    //stsfIvstExpdCdListMap = dms.data.arrayToMap(stsfIvstExpdCdList, function(obj){ return obj.cmmCd; });

    //4.그리드 고객추출조건 콤보 DataSource
    var targExtractList = [{"custExtrTermNo":"", "custExtrTermNm":""}];
    var targExtractListMap = [];
    <c:forEach var="obj" items="${targExtractList}">
    targExtractList.push({"custExtrTermNo":"${obj.custExtrTermNo}" , "custExtrTermNm":"${obj.custExtrTermNm}"});
    targExtractListMap["${obj.custExtrTermNo}"] = "${obj.custExtrTermNm}";
    </c:forEach>

    //5.그리드 만족도 조사타입 콤보 DataSource
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var stsfIvstTpCdListMap = [];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
    stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    stsfIvstTpCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    //var stsfIvstTpCdListMap = dms.data.arrayToMap(stsfIvstTpCdList, function(obj){ return obj.cmmCd; });

    var custExtrAutoYnList = [];
    var custExtrAutoYnListMap = [];
    custExtrAutoYnList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='crm.lbl.custExtrAutoYes' />"});
    custExtrAutoYnList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='crm.lbl.custExtrAutoNo' />"});
    custExtrAutoYnListMap["Y"] =     "<spring:message code='crm.lbl.custExtrAutoYes' />";
    custExtrAutoYnListMap["N"] =     "<spring:message code='crm.lbl.custExtrAutoNo' />";

// 필터를 지정하면 저장후 value 선택시 버그 있음. 따라서 함수로 만들어서 저장후 드롭다운리스트를 다시 드려줌.
var rcpeExtrSeqDDL = function(){
    /* $("#custExtrTermNo").kendoExtDropDownList({
        dataSource:custExtrTermNoDs
        , dataTextField:"text"
        , dataValueField:"value"
        , optionLabel:" "
        , filter:"contains"
        //, filtering:onFiltering
        , index:0
    }); */

 // 고객추출조건
    $("#rcpeExtrSeq").kendoExtDropDownList({
        dataTextField:"custExtrTermNm"
        , dataValueField:"custExtrTermNo"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:targExtractList
        ,optionLabel:""
        , filter:"contains"
    });
};

$(document).ready(function() {
    // 대상자추출 드롭다운 리스트
     // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
    $("#satisFactionManageWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.menu.satisfactionMng' />"      // 만족도 조사 관리
        ,width:"950px"
        ,height:"350px"
    }).data("kendoWindow");

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#satisFactionManageGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
        ;

        if ( dms.string.isNotEmpty(selectedItem) ){
            viewDetail(selectedItem);
        } else {
            //만족도 조사를 선택하세요.
            dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
            return;
        }
   });

    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewPopup(){
     var win = $("#satisFactionManageWindow").data("kendoWindow");
     win.center();
     win.open();
    }

    // 팝업 종료 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function closePopup(){
     var win = $("#satisFactionManageWindow").data("kendoWindow");
     win.close();
    }

    // 상세조회 후 팝업오픈
    function viewDetail(selectedItem){
        if( dms.string.isNotEmpty(selectedItem) ){
            // 팝업오픈;
            viewPopup();
        } else {
            // {상세정보}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }
    }

    rcpeExtrSeqDDL();

    // 시작일
    $("#startDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //종료일
    $("#endDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //마지막 추출일
    $("#lastExtrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //등록일
    $("#regDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 사용여부 DS
    var useYnDs = [{text:"N",value:"N"},{text:"Y", value:"Y"}];

    // 템플릿 - SMS
    var smsTemplateDs = [];
    var smsTemplateArr = [];
    <c:forEach var="obj" items="${smsTemplateList}">
        smsTemplateDs.push({text:"${obj.tmplNm}", value:"${obj.tmplId}", tmplCont:"${obj.tmplCont}"});
        smsTemplateArr["${obj.tmplId}"] = "${obj.tmplNm}";
    </c:forEach>
    smsTemplateArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = smsTemplateArr[val];
        }
        return returnVal;
    };

    // 만족도 조사명 ds
    var satisFactionTitleDs = [];
    var satisFactionTitleArr = [];
    <c:forEach var="obj" items="${satisFactionTitleList}">
        satisFactionTitleDs.push({text:"${obj.stsfIvstNm}", value:"${obj.seq}"});
        satisFactionTitleArr["${obj.seq}"] = "${obj.stsfIvstNm}";
    </c:forEach>
    satisFactionTitleArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = satisFactionTitleArr[val];
        }
        return returnVal;
    };

    // 검색조건 - 유형
    $("#sStsfIvstMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:stsfIvstMthCdList
    });

    // 검색조건 - 조사수단
    $("#sStsfIvstExpdCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:stsfIvstExpdCdList
    });

    // 검색조건 - 타입
    $("#sStsfIvstTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:stsfIvstTpCdList
    });

    // 유형
    $("#stsfIvstMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:stsfIvstMthCdList
    });

    // 조사수단
    $("#stsfIvstExpdCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:stsfIvstExpdCdList
    });

    // 타입
    $("#stsfIvstTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:stsfIvstTpCdList
    });

    //조회조건 - 배치활성여부
    $("#useYn").kendoExtDropDownList({
        dataSource:useYnDs
        , dataTextField:"text"
        , dataValueField:"value"
        , index:0
    });

    // 자동실행여부
    $("#autoActiveYn").kendoExtDropDownList({
        dataSource:useYnDs
        , dataTextField:"text"
        , dataValueField:"value"
        , index:0
    });

    // 대상자자동추출
    $("#custExtrAutoYn").kendoExtDropDownList({
        dataSource:custExtrAutoYnList
        , dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , index:0
    });

    // 고객대상여부
    $("#custTargYn").kendoExtDropDownList({
        dataSource:useYnDs
        , dataTextField:"text"
        , dataValueField:"value"
        , index:0
    });

    //설문템플릿명
    $("#subyTmplSeq").kendoExtDropDownList({
        dataSource:surveyTmplList
        //,template:"[#:data.subyTmplSeq#] #:data.subyTmplNm#"
        ,dataValueField:"subyTmplSeq"
        ,dataTextField:"subyTmplNm"
    });

    //만족도 조사 기능버튼 시작=======================================================================================

    //버튼 - 대상자추출
    $("#btnRcpeExtrMapping").kendoButton({
       click:function(e){
           //개발중 입니다.
          /*  dms.notification.info("<spring:message code='global.msg.eveloping'/>");
           return;
 */
           var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
           var selectedItem = satisFactionManageGrid.dataItem(satisFactionManageGrid.select());

           if(selectedItem.custExtrAutoYn == "Y"){
               //대상자 추출이 자동입니다.
               dms.notification.info("<spring:message code='crm.info.autoRcpeExtrMapping'/>");
               return;
           }

           if(selectedItem != null){
               //대상자 추출전 추출한 적이 있는지 확인
               if(selectedItem.lastExtrDt != null){
                   if (!confirm("<spring:message code='crm.info.lastExtrDtProcess'/>")){
                       return;
                   }
               }

               //대상자 추출 시작
               if(!dms.string.isEmpty(selectedItem.seq) && !dms.string.isEmpty(selectedItem.rcpeExtrSeq)){

                   var params = {};
                   params["dlrCd"] = selectedItem.dlrCd;
                   params["seq"] = selectedItem.seq;
                   params["stsfIvstSeq"] = selectedItem.seq;//만족도조사 일련번호
                   params["subyTmplSeq"] = selectedItem.subyTmplSeq;//설문템플릿 일련번호
                   params["rcpeExtrSeq"] = selectedItem.rcpeExtrSeq;//고객추출조건번호

                   var url = "<c:url value='/crm/css/satisFactionManage/selectCallRcpeExtrMapping.do' />";

                   $.ajax({
                       url:url
                       ,data:JSON.stringify(params)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR,status,error){
                           console.log(jqXHR);
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       },
                       success:function(result){
                           dms.notification.success("<spring:message code='global.info.success'/>");
                       }
                   }).done(function(result) {
                       console.log("callProc Done!!!!");
                   });
               }else{
                   //대상자 추출을 진행할 수 없습니다.
                   dms.notification.info("<spring:message code='crm.info.noRcpeExtrMapping'/>");
                   return;
               }
           }else{
               //만족도 조사를 선택하세요.
               dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
               return;
           }
       }
    });

    //버튼 - 콜센터 이관
    $("#btnSatisFacMngCall").kendoButton({
       click:function(e){
           var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
           var selectedItem = satisFactionManageGrid.dataItem(satisFactionManageGrid.select());
           if(selectedItem != null){
               if(selectedItem.stsfIvstExpdCd == '01'){

                    var params = {};
                    var grid = $('#satisFactionManageGrid').data('kendoExtGrid');
                    var selectedItem = grid.dataItem(grid.select());
                    params["sDlrCd"] = selectedItem.dlrCd;
                    params["sSeq"] = selectedItem.seq;
                    /* params["sStsfIvstMthCd"] = selectedItem.stsfIvstMthCd;
                    params["sStsfIvstExpdCd"] = selectedItem.stsfIvstExpdCd;
                    params["sStsfIvstTpCd"] = selectedItem.stsfIvstTpCd;
                    params["sSubyTmplSeq"] = selectedItem.subyTmplSeq; */
                    params["sRcpeExtrSeq"] = selectedItem.rcpeExtrSeq;

                    var url = "<c:url value='/crm/css/satisFactionManage/selectCallSenProc.do' />";

                    $.ajax({
                        url:url
                        ,data:JSON.stringify(params)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            console.log(jqXHR);
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        },
                        success:function(result){
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    }).done(function(result) {
                        console.log("callProc Done!!!!");
                    });
               }else{
                   //만족도 조사수단이 '전화'인 유형만 콜센터 이관이 가능합니다.
                   dms.notification.info("<spring:message code='crm.err.stsfIvstExpdCd'/>");
                   return;
               }
           }else{
               //만족도 조사를 선택하세요.
               dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
               return;
           } //end if
       }
    });

    //버튼 - 인쇄
    // 대상자추출 배치
    $("#btnBatch").kendoButton({
        click:function(e){



            $.ajax({
                    url:"<c:url value='/bat/crm/css/selectSatisFaction.do' />"
                    //,data:JSON.stringify(param)      //파라미터
                    ,type:'POST'                        //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
            }).done(function(jqXHR, textStatus) {


                console.log("jqXHR:" ,jqXHR)      // 삭제 수량
                console.log("textStatus:" ,textStatus)

                // 저장완료일경우 해당 데이터를 다시 조회한다.
                if(textStatus == "success" && jqXHR === 1 ){

                    // 고객케어일련번호 / 삭제 성공하였습니다
                    dms.notification.success("<spring:message code='crm.lbl.custCareSeq' var='arguMsg' /><spring:message code='global.info.delSuccessParam' arguments='${arguMsg}'/>");

                    $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                }else{
                    // 저장정보 / 을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                }

            });



        }

    });
    //버튼 - 인쇄
    $("#btnSatisFacMngPrint").kendoButton({
       click:function(e){
           var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
           var selectedItem = satisFactionManageGrid.dataItem(satisFactionManageGrid.select());
           if(selectedItem != null){
               if(selectedItem.subyTmplSeq != null) {
                   var subyTmplSeq = selectedItem.subyTmplSeq;
                   selectItemPopupWindow(selectedItem.dlrCd,subyTmplSeq);
               }
           }else{
               //만족도 조사를 선택하세요.
               dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
               return;
           }
       }
    });
    //버튼 - 만족도 조사 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#satisFactionManageGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 만족도 조사 추가
    $("#btnAdd").kendoButton({
        click:function(e){
            initStsfDetail();

            //팝업오픈
            viewPopup();
        }
    });


    //버튼 - 만족도 조사 삭제
    $("#btnSatisFacMngDel").kendoButton({
        click:function(e) {
            var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
            var rows = satisFactionManageGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                satisFactionManageGrid.removeRow(row);
            });
        }
    });

    //버튼 - 만족도 조사 저장
    $("#btnSatisFacMngSave").kendoButton({
        click:function(e) {
            //만족도 조사명
            if ( dms.string.isEmpty($("#stsfIvstNm").val())) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //조사 타입
            if ( dms.string.isEmpty($("#stsfIvstTpCd").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstTpCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //조사 유형
            if ( dms.string.isEmpty($("#stsfIvstMthCd").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //만족도 조사수단
            if ( dms.string.isEmpty($("#stsfIvstExpdCd").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstExpdCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //고객 추출 조건
            if($("#stsfIvstExpdCd").data("kendoExtDropDownList").value() != "03"){ //전시장, 고객휴게소방문이 아닐경우
                if ( dms.string.isEmpty($("#rcpeExtrSeq").data("kendoExtDropDownList").value())) {
                    dms.notification.warning("<spring:message code='crm.lbl.rcpeExtrSeq' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //시작일
            if ( dms.string.isEmpty($("#startDt").data("kendoExtMaskedDatePicker").value())) {
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //종료일
            if ( dms.string.isEmpty($("#endDt").data("kendoExtMaskedDatePicker").value())) {
                dms.notification.warning("<spring:message code='global.lbl.endDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //설문템플릿명
            if ( dms.string.isEmpty($("#subyTmplSeq").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.subyTmplSeq' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //고객추출자동여부
            if ( dms.string.isEmpty($("#custExtrAutoYn").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            // form 데이터
            var param =
                $("#stsfForm").serializeObject(
                    $("#stsfForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            // ###################################################### 추출주기설정 3/5 추가 시작
            param.custExtrCycleDt = custExtrCycleDt;

            console.log("추출주기-선택날짜 ::",param.custExtrCycleDt);


            // 요일 1개만 선택일경우..
            if ( typeof param.custExtrCycleWeek === 'string' ) {
                var tmpWeek = [];
                tmpWeek.push(param.custExtrCycleWeek);
                param.custExtrCycleWeek = tmpWeek;
            };

            if ( $("#custExtrCycleTp").val() === "W" && !$("input[name=custExtrCycleWeek]:checkbox").is(":checked") ) {
                    // {주}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.week' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
            } else if ( $("#custExtrCycleTp").val() === "S" && !custExtrCycleDt.length > 0 ) {
                    // {일}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.day' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
            };
            // ###################################################### 추출주기설정 3/5 추가 종료

            console.log("만족도 조사 param ::",JSON.stringify(param.custExtrCycleDt))

            param.startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
            param.endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();

            param.subyTmplSeq = $("#subyTmplSeq").data("kendoExtDropDownList").value();
            param.stsfIvstMthCd = $("#stsfIvstMthCd").data("kendoExtDropDownList").value();
            param.stsfIvstExpdCd = $("#stsfIvstExpdCd").data("kendoExtDropDownList").value();
            param.stsfIvstTpCd = $("#stsfIvstTpCd").data("kendoExtDropDownList").value();
            param.rcpeExtrSeq = $("#rcpeExtrSeq").data("kendoExtDropDownList").value();
            param.useYn = $("#useYn").data("kendoExtDropDownList").value();
            param.custTargYn = $("#custTargYn").data("kendoExtDropDownList").value();
            param.custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();

            //만족도 조사 일련번호
            var url = "<c:url value='/crm/css/satisFactionManage/insertSatisFactionManage.do' />";
            if ( !dms.string.isEmpty($("#seq").val())) {
                url = "<c:url value='/crm/css/satisFactionManage/updateSatisFactionManage.do' />";
            }


            console.log("만족도 조사 param ::",JSON.stringify(param))

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    initStsfDetail();
                    searchInit();
                    $('#satisFactionManageGrid').data('kendoExtGrid').dataSource.page(1);
                    /* console.log("success!!!!");
                    console.log(result);
                    console.log(result["custNo"]);
                    if (result["custNo"] != ""){
                        console.log("success!!!!");

                        $("#custNo").val(result["custNo"]);
                        btnSaveAddress(result["custNo"]);
                    } */
                    //팝업 닫기
                    closePopup();

                }
            }).done(function(result) {
                console.log("stsfFactionManageSave Done!!!!");
            });

        }
    });

    //btn - 상세
    $("#btnDetail").kendoButton({
        click:function(e){
            var grid = $("#satisFactionManageGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
        ,enable:false
    });


    //만족도 조사 기능버튼 종료=======================================================================================


    //만족도 조사 그리드
    $("#satisFactionManageGrid").kendoExtGrid({
        gridId:"G-CRM-0721-113208"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/css/satisFactionManage/selectSatisFactionManages.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStsfIvstNm"] = $("#sStsfIvstNm").val();
                        params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
                        params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
                        params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,seq:{type:"number", editable:false}
                        ,dlrCd :{type:"string", editable:false}
                        ,stsfIvstNm:{type:"string", validation:{required:true}}/* 만족도 조사 명 */
                        ,stsfIvstMthCd:{type:"string", validation:{required:true}} /* 유형 */
                        ,stsfIvstExpdCd:{type:"string", validation:{required:true}} /* 조사 수단 */
                        ,stsfIvstTpCd:{type:"string", validation:{required:true}}  /* 조사 타입*/
                        ,subyTmplSeq:{type:"number"} /* 설문 템플릿 */
                        ,rcpeExtrSeq:{type:"string", validation:{required:true}} /*대상자 추출-고객추출 조건번호*/
                        ,startDt:{type:"date", validation:{required:true}} /* 시작일자 */
                        ,endDt:{type:"date", validation:{required:true}} /* 종료일자 */
                        ,useYn:{type:"string", validation:{required:true}} /* 사용여부 */
                        ,custTargYn:{type:"string", validation:{required:true}} /*  */
                        ,custExtrAutoYn:{type:"string", validation:{required:true}} /* 고객추출 자동여부 */
                        ,lastExtrDt:{type:"date", validation:{required:true}} /* 마지막 추출일 */
                        ,stsfCont:{type:"string", validation:{required:true}} /* 화술 */
                        ,batOperId:{type:"string", validation:{required:true}} /* 배치작업ID */
                        ,custExtrCycleTp:{type:"string", validation:{required:true}} /* 고객추출주기유형 */
                    }
                }
            }
        }
        ,selectable:"row"
        ,multiSelectWithCheckbox:false
        ,editable:false
        ,selectable:"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        /* ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:[] */
        /* ,dataBinding:function(e) {
            $("#batchScheduleGrid").data("kendoExtGrid").dataSource.data([]);
            $("#batchResultGrid").data("kendoExtGrid").dataSource.data([]);
        } */
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            initStsfDetail();
            settingStsfDetail(selectedItem);
            if ( dms.string.isNotEmpty(selectedItem.seq) ) {
                $("#btnDetail").data("kendoButton").enable(true);
            }
        }
        ,columns:[
            {
                field:"rnum"
                , title:"<spring:message code='global.lbl.no' />"
                , width:60
                , sortable:false
                , attributes:{"class":"ac"}
            }
            ,{//만족도 조사명
                field:"stsfIvstNm"
                , title:"<spring:message code='crm.lbl.stsfIvstNm'/>"
                , width:150
            }
            ,{//고객추출주기유형
            	field:"custExtrCycleTp" , title:"<spring:message code='crm.lbl.custExtrCycleTp'/>" , width:100
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){

                    var custExtrCycleTpNm = "";
                    var custExtrCycleTp = dataItem.custExtrCycleTp;
                    if ( custExtrCycleTp === "D" ) {
                        custExtrCycleTpNm = "<spring:message code='crm.btn.allDay' />";     //매일
                    } else if ( custExtrCycleTp === "W" ) {
                        custExtrCycleTpNm = "<spring:message code='crm.btn.allWeek' />";    //매주
                    } else if ( custExtrCycleTp === "S" ) {
                        custExtrCycleTpNm = "<spring:message code='global.btn.select' />";  //선택
                    };
                    return custExtrCycleTpNm;

                }
            }
            ,{ field:"custExtrCycleCont" , title:"custExtrCycleCont" , width:150, hidden:true }     // TODO 추후 삭제
            ,{//만족도 조사 유형
                field:"stsfIvstMthCd"
                , attributes:{"class":"ac"}
                , title:"<spring:message code='crm.lbl.stsfIvstMthCd' />"
                , width:170
                ,editor:function(container, options) {
                    $('<input required name="stsfIvstMthCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:stsfIvstMthCdList
                    });
                    $('<span class="k-invalid-msg" data-for="stsfIvstMthCd"></span>').appendTo(container);
                }
                //,template:'#if(stsfIvstMthCd !== ""){# #= stsfIvstMthCdListMap[stsfIvstMthCd]# #}#'
                ,template:"#=stsfIvstMthCdListMap[stsfIvstMthCd].cmmCdNm#"
            }
                   // TODO 파일:SCRIPT5007:정의되지 않음 또는 null 참조인 'cmmCdNm' 속성을 가져올 수 없습니다. / Function code (5288), 줄:2, 열:66
            ,{//만족도 조사 수단
                field:"stsfIvstExpdCd"
                , title:"<spring:message code='crm.lbl.stsfIvstExpdCd' />"
                , width:170
                , attributes:{"class":"ac"}
                //,template:"#=stsfIvstExpdCdListMap[stsfIvstExpdCd].cmmCdNm#"
                  ,template:'#if(stsfIvstExpdCd !== ""){# #= stsfIvstExpdCdListMap[stsfIvstExpdCd]# #}#'
                ,editor:function(container, options) {
                    $('<input required name="stsfIvstExpdCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:stsfIvstExpdCdList
                    });
                    $('<span class="k-invalid-msg" data-for="stsfIvstExpdCd"></span>').appendTo(container);
                    //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                }
            }

            ,{//만족도 조사 타입
                field:"stsfIvstTpCd"
                , title:"<spring:message code='crm.lbl.stsfIvstTpCd' />"
                , width:170
                ,attributes:{"class":"ac"}
                /* ,template:"#=stsfIvstTpCdListMap[stsfIvstTpCd].cmmCdNm#" */
                ,template:'#if(stsfIvstTpCd !== ""){# #= stsfIvstTpCdListMap[stsfIvstTpCd]# #}#'
                ,editor:function(container, options) {
                    $('<input required name="stsfIvstTpCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:stsfIvstTpCdList
                    });
                    $('<span class="k-invalid-msg" data-for="stsfIvstTpCd"></span>').appendTo(container);
                }

            }
            ,{//설문 템플릿
                field:"subyTmplSeq"
                ,title:"<spring:message code='crm.lbl.subyTmplNm' />"
                ,width:170
                /* ,template:"#=surveyTmplMap[subyTmplSeq].subyTmplNm#" */
                ,template:"# if(surveyTmplMap[subyTmplSeq] != null) { # #= surveyTmplMap[subyTmplSeq].subyTmplNm# # }#"
                ,editor:function(container, options) {
                    $('<input required name="subyTmplSeq" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"subyTmplNm"
                        ,dataValueField:"subyTmplSeq"
                        ,dataSource:surveyTmplList
                    });
                    $('<span class="k-invalid-msg" data-for="subyTmplSeq"></span>').appendTo(container);
                }
            }
            ,{//대상자 추출명
                field:"rcpeExtrSeq"
                ,title:"<spring:message code='crm.lbl.rcpeExtrNm' />"
                ,width:100
                ,attributes:{"class":"al"}
                ,template:'#if(rcpeExtrSeq !== "" && rcpeExtrSeq !== null){# #= targExtractListMap[rcpeExtrSeq]# #}#'
                ,editor:function(container, options) {
                    $('<input required name="rcpeExtrSeq" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"custExtrTermNm"
                        ,dataValueField:"custExtrTermNo"
                        ,dataSource:targExtractList
                    });
                    $('<span class="k-invalid-msg" data-for="rcpeExtrSeq"></span>').appendTo(container);
                }
            }
            ,{//시작일
                field:"startDt"
                ,title:"<spring:message code='global.lbl.startDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{//종료일
                field:"endDt"
                ,title:"<spring:message code='global.lbl.endDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{//사용여부
                field:"useYn"
                , title:"<spring:message code='global.lbl.useYn' />"
                , width:80
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                        ,index:1
                    });
                    $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                }
            }
            ,{//고객용 여부
                field:"custTargYn"
                , title:"<spring:message code='global.lbl.custTargYn'/>"
                , width:120
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="custTargYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                        ,index:1
                    });
                    $('<span class="k-invalid-msg" data-for="custTargYn"></span>').appendTo(container);
                }
            }
            ,{//대상자 자동추출
                field:"custExtrAutoYn"
                , title:"<spring:message code='crm.lbl.custExtrAutoYn'/>"
                , width:120
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    template:'#if(custExtrAutoYn !== "" && custExtrAutoYn !== null){# #= custExtrAutoYnListMap[custExtrAutoYn]# #}#'
                    $('<input required name="custExtrAutoYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        //autoBind:false
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:custExtrAutoYnList//["Y", "N"]
                        ,index:1
                    });
                    $('<span class="k-invalid-msg" data-for="custExtrAutoYn"></span>').appendTo(container);
                }
            }
            ,{//마지막 추출일
                field:"lastExtrDt"
                ,title:"<spring:message code='crm.lbl.lastExtrDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{//설명/화술
                field:"stsfCont"
                , title:"<spring:message code='crm.lbl.stsfCont'/>"
                , width:150
                , hidden:true
            }
            ,{//배치작업 ID
                field:"batOperId"
                , title:"<spring:message code='global.lbl.batOperId'/>"
                , width:150
                //, hidden:true
            }
        ]

    });

    //설문 미리보기
    function selectItemPopupWindow(dlrCd,subyTmplSeq){
        popupWindow = dms.window.popup({
            //windowId:"ItemMasterPopup"
            windowId:"ServeyViewPopup"
            , title:"<spring:message code='global.title.preview'/>"
            , content:{
                url:"<c:url value='/crm/css/surveySatisFaction/selectSurveyViewPopup.do?subyTmplSeq="+subyTmplSeq+"&dlrCd="+dlrCd+"'/>"
                    /* /par/cmm/selectItemPopup.do */
                , data:{
                    "subyTmplSeq":subyTmplSeq
                    ,"dlrCd":dlrCd
                }
            }
        });
    }
}); //end Ready

    function initStsfDetail(){
        $("#dlrCd").val(""); //딜러코드
        $("#seq").val(""); //만족도조사 일련번호
        $("#subyTmplSeq").data("kendoExtDropDownList").value(""); //설문지 일련번호
        $("#subyTmplSeq").data("kendoExtDropDownList").enable(true);
        $("#stsfIvstNm").val(""); //만족도조사명
        $("#stsfIvstNm").removeClass("form_readonly");//만족도조사명
        $("#stsfIvstNm").attr("readonly", false); //만족도조사명
        $("#stsfIvstTpCd").data("kendoExtDropDownList").value(""); //조사타입
        $("#stsfIvstTpCd").data("kendoExtDropDownList").enable(true);
        $("#stsfIvstMthCd").data("kendoExtDropDownList").value(""); //유형
        $("#stsfIvstMthCd").data("kendoExtDropDownList").enable(true);
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").value(""); //만족도 조사수단
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").enable(true);
        $("#rcpeExtrSeq").data("kendoExtDropDownList").value(""); //고객 추출조건
        $("#rcpeExtrSeq").data("kendoExtDropDownList").enable(true);
        $("#startDt").data("kendoExtMaskedDatePicker").value(""); //시작일
        $("#endDt").data("kendoExtMaskedDatePicker").value(""); //종료일
        $("#custExtrAutoYn").data("kendoExtDropDownList").value("N"); //고객추출자동여부
        $("#custExtrAutoYn").data("kendoExtDropDownList").enable(true);
        $("#custTargYn").data("kendoExtDropDownList").value("Y"); //고객대상여부
        $("#custTargYn").data("kendoExtDropDownList").enable(true);
        $("#custExtrCycleWeek").val(""); //주기설정
        $("#batOperId").val(""); //배치ID
        $("#stsfCont").val(""); //설명/화술
        $("#stsfCont").removeClass("form_readonly");//설명/화술
        $("#stsfCont").attr("readonly", false); //만족도조사명
        $("#lastExtrDt").data("kendoExtMaskedDatePicker").value(""); //마지막 추출일
        $("#useYn").data("kendoExtDropDownList").value("N"); //사용여부
        $("#useYn").data("kendoExtDropDownList").enable(true);
        $("#regUsrNm").val(""); //등록자
        $("#regDt").data("kendoExtMaskedDatePicker").value(""); //등록일


        // ###################################################### 추출주기설정 4/5 초기화 시작
        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();
        $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();
        custExtrCycleDt = [];
        $("#cycleDt").val("");

        // 버튼 값 초기화
        $("#custExtrCycleTp").val("");
        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");
        // ###################################################### 추출주기설정 4/5 초기화 종료

    };

    //검색조건 초기화
    function searchInit(){

        $("#sStsfIvstNm").val(""); //만족도 조사명
        $("#sStsfIvstTpCd").data("kendoExtDropDownList").value(""); //만족도 조사타입
        $("#sStsfIvstMthCd").data("kendoExtDropDownList").value(""); //만족도 조사 유형
        $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value(""); //만족도 조사수단

    };

    function settingStsfDetail(selectedItem){
            // 대상자추출 드롭다운 리스트
            rcpeExtrSeqDDL()

            $("#dlrCd").val(selectedItem.dlrCd); //딜러코드
            $("#seq").val(selectedItem.seq); //만족도조사 일련번호
            $("#subyTmplSeq").data("kendoExtDropDownList").value(selectedItem.subyTmplSeq); //설문지 일련번호
            $("#stsfIvstNm").val(selectedItem.stsfIvstNm); //만족도조사명
            $("#stsfIvstTpCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstTpCd); //조사타입
            $("#stsfIvstMthCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstMthCd); //유형
            $("#stsfIvstExpdCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstExpdCd); //만족도 조사수단
            $("#rcpeExtrSeq").data("kendoExtDropDownList").value(selectedItem.rcpeExtrSeq); //대상자 추출조건
            $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt); //시작일
            $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt); //종료일
            $("#custExtrAutoYn").data("kendoExtDropDownList").value(selectedItem.custExtrAutoYn); //고객추출자동여부
            $("#custTargYn").data("kendoExtDropDownList").value(selectedItem.custTargYn); //고객대상여부
            $("#custExtrCycleWeek").val(selectedItem.custExtrCycleWeek); //주기설정
            $("#custExtrCycleWeek").attr("readonly", true); //만족도조사명dd
            $("#batOperId").val(selectedItem.batOperId); //배치ID
            $("#stsfCont").val(selectedItem.stsfCont); //설명/화술
            $("#lastExtrDt").data("kendoExtMaskedDatePicker").value(selectedItem.lastExtrDt); //마지막 추출일
            $("#useYn").data("kendoExtDropDownList").value(selectedItem.useYn); //고객추출자동여부
            $("#regUsrNm").val(selectedItem.regUsrNm); //등록자
            $("#regDt").data("kendoExtMaskedDatePicker").value(selectedItem.regDt); //등록일
            $("#editYn").val(selectedItem.editYn); //수정가능여부
        if(selectedItem.editYn == "Y"){
            $("#stsfIvstNm").attr("readonly", false); //만족도조사명
            $("#stsfIvstNm").removeClass("form_readonly");//만족도조사명
            $("#stsfIvstTpCd").data("kendoExtDropDownList").enable(true); //조사타입
            //var stsfIvstTpCd = $("#stsfIvstTpCd").data("kendoExtDropDownList"); //조사타입
            //stsfIvstTpCd.readonly();
            $("#stsfIvstMthCd").data("kendoExtDropDownList").enable(true); //유형
            $("#stsfIvstExpdCd").data("kendoExtDropDownList").enable(true); //만족도조사수단
            $("#rcpeExtrSeq").data("kendoExtDropDownList").enable(true); //고객추출조건
            $("#custTargYn").data("kendoExtDropDownList").enable(true); //고객대상여부
            $("#subyTmplSeq").data("kendoExtDropDownList").enable(true); //설문템플릿명
            $("#custExtrAutoYn").data("kendoExtDropDownList").enable(true); //고객추출자동여부
            $("#stsfCont").attr("readonly", false); //만족도조사명
            $("#stsfCont").removeClass("form_readonly");//만족도조사명
            $("#startDt").attr("disabled", true); //만족도조사 시작일
            $("#endDt").attr("disabled", true); //만족도조사 종료일
        }else{
            $("#stsfIvstNm").attr("readonly", true);//만족도조사명
            $("#stsfIvstNm").addClass("form_readonly");//만족도조사명
            $("#stsfIvstTpCd").data("kendoExtDropDownList").enable(false); //조사타입
            $("#stsfIvstMthCd").data("kendoExtDropDownList").enable(false); //유형
            $("#stsfIvstExpdCd").data("kendoExtDropDownList").enable(false); //만족도조사수단
            /* $("#stsfIvstExpdCd").data("kendoExtDropDownList").readonly(); //만족도조사수단
            $("#stsfIvstExpdCd").prev().removeClass("k-state-default");
            $("#stsfIvstExpdCd").prev().addClass("k-state-disabled"); */

            $("#rcpeExtrSeq").data("kendoExtDropDownList").enable(false); //대상자 추출조건
            $("#custTargYn").data("kendoExtDropDownList").enable(false); //고객대상여부
            $("#subyTmplSeq").data("kendoExtDropDownList").enable(false); //설문템플릿명
            $("#custExtrAutoYn").data("kendoExtDropDownList").enable(false); //고객추출자동여부
            $("#stsfCont").attr("readonly", true); //만족도조사명
            $("#stsfCont").addClass("form_readonly");//만족도조사명

            if(selectedItem.useYn == "Y"){
                $("#startDt").prop("disabled", true); //시작일
                $("#startDt").addClass("form_readonly"); //시작일
                $("#endDt").prop("disabled", true); //종료일
                $("#endDt").addClass("form_readonly"); //종료일
            }else{
                $("#startDt").prop("disabled", false); //시작일
                $("#startDt").removeClass("form_readonly"); //시작일
                $("#endDt").prop("disabled", false); //종료일
                $("#endDt").removeClass("form_readonly"); //종료일
            }
        }

            // ###################################################### 추출주기설정 5/5 상세 조회 시작
            cycleFormInit();
            custExtrCycleDt = [];
            $("#cycleDt").val("");
            $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

            if( selectedItem.custExtrCycleTp === "S") {

                $("#btnCycleSelect").click();

                var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                cycleDatepicker.close();

                var tmpCustExtrCycleDt = [];
                // 날짜선택
                var resultArray = selectedItem.custExtrCycleCont.split(',');
                $.each(resultArray, function(idx, row){
                    tmpCustExtrCycleDt.push(kendo.parseDate(row.trim(), "yyyyMMdd"));
                });

                custExtrCycleDt = tmpCustExtrCycleDt;

                // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
                dtToString(custExtrCycleDt);

            } else if( selectedItem.custExtrCycleTp === "W") {

                $("#btnCycleWeek").click();

                // 요일 체크박스 체크
                if(dms.string.strNvl(selectedItem.custExtrCycleCont)!=""){
                    var resultArray = selectedItem.custExtrCycleCont.split(',');
                    $("input[name=custExtrCycleWeek]:checkbox").prop("checked", false);
                    $.each(resultArray, function(idx, row){
                        $("#custExtrCycleWeek_"+row.trim()).prop("checked", true);
                    });
                }

            } else if( selectedItem.custExtrCycleTp === "D") {

                $("#btnCycleDay").click();

            };

            // 상세 조회 후 달력 클릭시 자꾸 이전에 선택된 달력 날짜가 찍힘. 그래서 초기화.
            if ( custExtrCycleDt.length == 0 ) {

                var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                cycleDatepicker.setOptions({
                     month:{
                         empty:'-'
                     }
                });

            };

            var param = {
                    "sSeq":"0"
                    };

            $.ajax({
                    url:"<c:url value='/crm/css/satisFactionManage/selectSatisFactionBatchCnt.do' />"
                    ,data:JSON.stringify(param)      //파라미터
                    ,type:'POST'                        //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    //,async:false
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
            }).done(function(body) {

                console.log("배치 작업 수량:",body);

            });
            // ###################################################### 추출주기설정 5/5 상세 조회 종료

        /*
        $("#dlrCd").val(selectedItem.dlrCd); //딜러코드
        $("#seq").val(selectedItem.seq); //만족도조사 일련번호
        $("#subyTmplSeq").data("kendoExtDropDownList").value(selectedItem.subyTmplSeq); //설문지 일련번호
        $("#stsfIvstNm").val(selectedItem.stsfIvstNm); //만족도조사명
        $("#stsfIvstTpCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstTpCd); //조사타입
        $("#stsfIvstMthCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstMthCd); //유형
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstExpdCd); //만족도 조사수단
        $("#rcpeExtrSeq").data("kendoExtDropDownList").value(selectedItem.rcpeExtrSeq); //고객 추출조건
        $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt); //시작일
        $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt); //종료일
        $("#custExtrAutoYn").data("kendoExtDropDownList").value(selectedItem.custExtrAutoYn); //고객추출자동여부
        $("#custTargYn").data("kendoExtDropDownList").value(selectedItem.custTargYn); //고객대상여부
        $("#custExtrCycleWeek").val(selectedItem.custExtrCycleWeek); //주기설정
        $("#stsfCont").val(selectedItem.stsfCont); //설명/화술
        $("#lastExtrDt").data("kendoExtMaskedDatePicker").value(selectedItem.lastExtrDt); //마지막 추출일
        $("#useYn").data("kendoExtDropDownList").value(selectedItem.useYn); //고객추출자동여부
        $("#regUsrNm").val(selectedItem.regUsrNm); //등록자
        $("#regDt").data("kendoExtMaskedDatePicker").value(selectedItem.regDt); //등록일
        */
    }

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //등록시작일
          if(id === 'startDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#endDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'endDt'){//등록종료일
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#startDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
     }

</script>
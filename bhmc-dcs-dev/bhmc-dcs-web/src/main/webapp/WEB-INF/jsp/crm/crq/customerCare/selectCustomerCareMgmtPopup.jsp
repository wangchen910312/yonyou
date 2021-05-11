<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 고객케어 상세정보 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='crm.title.custCareInfo' /><!-- 고객케어 상세정보 --></h2>
            <div class="btn_right">
                <button type="button" class="btn_m btn_add" id="btnInit" ><spring:message code='global.btn.init' /><!-- 초기화 --></button>
                <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
            </div>
        </div>
        <div class="table_form">
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
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custCareNm' /><!-- 고객케어명 --></span></th>
                        <td colspan="3">
                            <input type="hidden" id="custCareSeq" name="custCareSeq" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareSeq" />" data-bind="value:custCareSeq" />
                            <input type="hidden" id="batOperId" name="batOperId" data-json-obj="true" data-name="<spring:message code="global.lbl.batOperId" />" data-bind="value:batOperId" />
                            <input id="custCareNm" name="custCareNm" class="form_input" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custCareNm" />" data-bind="value:custCareNm" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrTermNo' /><!-- 고객추출조건 --></span></th>
                        <td colspan="3">
                            <input id="custExtrTermNo" name="custExtrTermNo" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrTermNo" />" data-bind="value:custExtrTermNo" style="width:50%;" />    <span id="custExtrTermNm"></span><input type="text" id="dayy" name="dayy" class="form_input" style="width:50px"/> <spring:message code="global.lbl.day" /><!-- 일 -->
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></span></th>
                        <td>
                            <input id="activeTpCd" name="activeTpCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.activeTpCd" />" data-bind="value:activeTpCd" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.activeTmplId' /><!-- SMS템플릿 --></th>
                        <td>
                            <input id="activeTmplId" name="activeTmplId" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="crm.lbl.activeTmplId" />" data-bind="value:activeTmplId" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                        <td colspan="3">
                            <button type="button" class="btn_s" id="btnCycleDay" ><spring:message code='crm.btn.allDay' /><!-- 매일 --></button>
                            <button type="button" class="btn_s" id="btnCycleWeek" ><spring:message code='crm.btn.allWeek' /><!-- 매주 --></button>
                            <button type="button" class="btn_s" id="btnCycleSelect" ><spring:message code='global.btn.select' /><!-- 선택 --></button>
                            <input id="cycleDatepicker" name="cycleDatepicker" class="form_datepicker" style="width:20px; margin-left:-5px"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.custExtrAutoYn' /><!-- 고객추출자동여부 --></th>
                        <td>
                            <input id="custExtrAutoYn" name="custExtrAutoYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrAutoYn" />" data-bind="value:custExtrAutoYn" />
                            <input type="hidden" id="tmpCustExtrAutoYn" name="tmpCustExtrAutoYn" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.autoActiveYn' /><!-- 자동발송여부 --></th>
                        <td>
                            <input id="autoActiveYn" name="autoActiveYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.autoActiveYn" />" data-bind="value:autoActiveYn" />
                        </td>
                        <th scope="row" ></th>
                        <td class="vt" colspan="3" rowspan="2">
                            <%-- <input type="text" id="custExtrCycleCont" name="custExtrCycleCont" class="form_input form_readonly" readonly data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrCycleCont" />" data-bind="value:custExtrCycleCont" /> --%>
                            <div id="weekSelect">
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_1" name="sWeek" class="form_check" value="1" disabled /> <spring:message code="global.lbl.sunday" /><!-- 일 --></label>
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_2" name="sWeek" class="form_check" value="2" disabled /> <spring:message code="global.lbl.monday" /><!-- 월 --></label>
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_3" name="sWeek" class="form_check" value="3" disabled /> <spring:message code="global.lbl.tuesday" /><!-- 화 --></label>
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_4" name="sWeek" class="form_check" value="4" disabled /> <spring:message code="global.lbl.wednesday" /><!-- 수 --></label>
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_5" name="sWeek" class="form_check" value="5" disabled /> <spring:message code="global.lbl.thursday" /><!-- 목 --></label>
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_6" name="sWeek" class="form_check" value="6" disabled /> <spring:message code="global.lbl.friday" /><!-- 금 --></label>
                                <label class="label_check" style="width:50px;margin:0 0 2px;"><input type="checkbox" id="sWeek_7" name="sWeek" class="form_check" value="7" disabled /> <spring:message code="global.lbl.saturday" /><!-- 토 --></label>
                            </div>
                            <div id="dateSelect" style="display:none;">
                                <textarea rows="2" cols="" id="cycleDt" name="cycleDt" class="form_textarea" maxlength="1000" ></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></span></th>
                        <td>
                            <input id="startDt" name="startDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.startDt" />" data-bind="value:startDt" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.endDt' /><!-- 종료일 --></span></th>
                        <td>
                            <input id="endDt" name="endDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.endDt" />" data-bind="value:endDt" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.custCareCont' /><!-- 고객케어내용 --></th>
                        <td colspan="3">
                            <%-- <textarea rows="2" cols="" id="custCareCont" name="custCareCont" class="form_textarea" maxlength="1000" data-json-obj="true" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareCont" />" data-bind="value:custCareCont" style="height:42px;"></textarea> --%>
                            <input type="text" id="custCareCont" name="custCareCont" class="form_input" maxlength="1000" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareCont" />" data-bind="value:custCareCont" >
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.extrDgreCnt' /><!-- 추출차수 --></th>
                        <td>
                            <input type="text" id="extrDgreCnt" name="extrDgreCnt" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.lastExtrDt' /><!-- 마지막추출일 --></th>
                        <td>
                            <input type="text" id="lastExtrDt" name="lastExtrDt" class="form_input form_readonly" disabled />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                        <td>
                            <input type="text" id="regUsrNm" name="regUsrNm" class="form_input form_readonly" disabled />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <input id="regDt" name="regDt" class="form_input form_readonly" disabled />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.useYn' /><!-- 사용여부 --></th>
                        <td>
                            <input id="useYn" name="useYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.useYn" />" data-bind="value:useYn" />
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                    <tr>

                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //고객케어 상세정보 -->


            <script type="text/javascript">


                var custCareSeq
                    , isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , popupWindow
                    , isSmsUseYn = "N"
                    , cycleDaysList = []
                ;


                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어미션유형 DS
                var activeTpCdDs = [];
                var activeTpCdArr = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    activeTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                activeTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = activeTpCdArr[val];
                    }
                    return returnVal;
                };

                // 템플릿 - SMS
                var smsTemplateDs = [];
                var smsTemplateArr = [];
                <c:forEach var="obj" items="${smsTemplateList}">
                    smsTemplateDs.push({text:"${obj.mesgTmplNm}", value:"${obj.mesgTmplNo}"});
                    smsTemplateArr["${obj.mesgTmplNo}"] = "${obj.mesgTmplNm}";
                </c:forEach>
                smsTemplateArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = smsTemplateArr[val];
                    }
                    return returnVal;
                };

                // 고객추출조건명 DS
                var custExtrTermNoDs = [];
                var custExtrTermNoArr = [];
                custExtrTermNoDs.push({text:"정비후", value:"99"});
                <c:forEach var="obj" items="${custExtrTermNoList}">
                    custExtrTermNoDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    custExtrTermNoArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custExtrTermNoArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custExtrTermNoArr[val];
                    }
                    return returnVal;
                };


                // form - 읽기전용
                function readonlyForm(){

                    $("#custCareNm").attr("readonly", true).addClass("form_readonly");

                    $("#startDt").data("kendoExtMaskedDatePicker").readonly(true);
                    $("#startDt").addClass("form_readonly");
                    $("#endDt").data("kendoExtMaskedDatePicker").readonly(true);
                    $("#endDt").addClass("form_readonly");

                    $("#activeTpCd").data("kendoExtDropDownList").readonly(true);
                    $("#activeTpCd").parent().addClass("readonly_area")
                    $("#custExtrTermNo").data("kendoExtDropDownList").readonly(true);
                    $("#custExtrTermNo").parent().addClass("readonly_area")

                    $("#custCareCont").attr("readonly", true).addClass('form_readonly');

                    $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(true);
                    $("#custExtrAutoYn").parent().addClass("readonly_area")
                    $("#autoActiveYn").data("kendoExtDropDownList").readonly(true);
                    $("#autoActiveYn").parent().addClass("readonly_area")

                    $("#custExtrCycleCont").attr("readonly", true).addClass('form_readonly');

                    $("#activeTmplId").data("kendoExtDropDownList").readonly(true);
                    $("#activeTmplId").parent().addClass("readonly_area")

                }

                // 폼 초기화
                function initForm(){

                    cycleDaysList = [];

                    $("#cycleDt").val("");
                    $("#cycleDatepicker_dateview table tbody").find("td").removeClass("calendarChek");            // 달력 빨간 체크박스 삭제
                    $("#cycleDatepicker_dateview table tbody").find("div").removeClass("selectDtClass");            // 달력 빨간 체크박스 삭제

                    $("#custCareSeq").val("");
                    $("#batOperId").val("");
                    $("#custCareNm").val("").attr("readonly", false).removeClass('form_readonly');

                    $("#startDt").data("kendoExtMaskedDatePicker").value("");
                    $("#startDt").data("kendoExtMaskedDatePicker").readonly(false);
                    $("#startDt").removeClass("form_readonly");
                    $("#endDt").data("kendoExtMaskedDatePicker").value("");
                    $("#endDt").data("kendoExtMaskedDatePicker").readonly(false);
                    $("#endDt").removeClass("form_readonly");

                    $("#activeTpCd").data("kendoExtDropDownList").value("01");
                    $("#activeTpCd").data("kendoExtDropDownList").readonly(false);
                    $("#activeTpCd").parent().removeClass("readonly_area")

                    $("#custExtrTermNo").data("kendoExtDropDownList").value("");
                    $("#custExtrTermNo").data("kendoExtDropDownList").readonly(false);
                    $("#custExtrTermNo").parent().removeClass("readonly_area")

                    $("#custCareCont").val("").attr("readonly", false).removeClass('form_readonly');

                    $("#tmpCustExtrAutoYn").val("");
                    $("#custExtrAutoYn").data("kendoExtDropDownList").value("N");
                    $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(false);
                    $("#custExtrAutoYn").parent().removeClass("readonly_area")

                    $("#autoActiveYn").data("kendoExtDropDownList").value("N");
                    $("#autoActiveYn").data("kendoExtDropDownList").readonly(false);
                    $("#autoActiveYn").parent().removeClass("readonly_area")

                    $("#custExtrCycleCont").val("").attr("readonly", true).addClass('form_readonly');

                    $("#activeTmplId").data("kendoExtDropDownList").value("");
                    $("#activeTmplId").data("kendoExtDropDownList").readonly(false);
                    $("#activeTmplId").parent().removeClass("readonly_area");

                    $("#extrDgreCnt").val("");
                    $("#lastExtrDt").val("");
                    $("#regUsrNm").val("");
                    $("#regDt").val("");

                    $("#useYn").data("kendoExtDropDownList").value("Y");

                }

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
                }

                $(document).ready(function() {

                    // 시작일
                    $("#startDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#endDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 사용여부
                    $("#useYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:1
                    });

                    // 실행유형
                    $("#activeTpCd").kendoExtDropDownList({
                        dataSource:activeTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:1
                        , change:function(e) {

                            // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 고객추출자동여부
                    $("#custExtrAutoYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                        , change:function(e) {

                            var dataItem = this.dataItem(e.item);

                            if ( dataItem.value === "Y" ) {
                                //$("#custExtrCycleCont").val("");
                                $("#custExtrCycleCont").attr("readonly", false).removeClass("form_readonly");
                            } else if ( dataItem.value === "N" ) {
                                $("#custExtrCycleCont").attr("readonly", true).addClass('form_readonly');
                            }

                            // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 자동발송여부
                    $("#autoActiveYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                        , enable:false
                        , change:function(e) {

                            // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // SMS템플릿
                    $("#activeTmplId").kendoExtDropDownList({
                        dataSource:smsTemplateDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                        , enable:false
                    });


                    // 고객추출조건
                    $("#custExtrTermNo").kendoExtDropDownList({
                        dataSource:custExtrTermNoDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        //, filter:"contains"
                        //, filtering:onFiltering
                        , index:0
                        , change:function(e) {

                            var dataItem = this.dataItem(e.item);

                            console.log("dataItem:",dataItem)
                            //custExtrTermNm
                            $("#custExtrTermNm").text(dataItem.text);

                        }
                    });

                    function smsTmpEnabled(){

                        // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                        var activeTpCd = $("#activeTpCd").data("kendoExtDropDownList");        // 실행유형
                        var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList");// 고객추출자동여부
                        var autoActiveYn = $("#autoActiveYn").data("kendoExtDropDownList");    // 자동발송여부
                        var activeTmplId = $("#activeTmplId").data("kendoExtDropDownList");

                        console.log("activeTpCd:"+activeTpCd.value()+" || custExtrAutoYn:"+custExtrAutoYn.value()+" || autoActiveYn:"+autoActiveYn.value()+" || activeTmplId:"+activeTmplId.value() );

                        if ( activeTpCd.value() === "02" && custExtrAutoYn.value() === "Y" ) {

                            autoActiveYn.enable(true);

                            if ( autoActiveYn.value() === "Y" ) {
                                activeTmplId.enable(true);
                                //activeTmplId.setDataSource(smsTemplateDs);
                                isSmsUseYn = "Y";

                            } else {
                                activeTmplId.enable(false);
                                activeTmplId.setDataSource("");
                                isSmsUseYn = "N";
                            }

                        } else {
                            autoActiveYn.enable(false);
                            autoActiveYn.value("N");
                            activeTmplId.enable(false);
                            activeTmplId.setDataSource("");
                            isSmsUseYn = "N";
                        }

                    }

                    // 매일
                    $("#btnCycleDay").kendoButton({
                        click:function(e){

                            $("input[name=sWeek]:checkbox").prop("disabled", true);
                            $("input[name=sWeek]:checkbox").prop("checked",false);

                            $("#cycleDt").attr("readonly", true).addClass("form_readonly");
                            $("#cycleDt").val("");

                        }
                    });

                    // 매주
                    $("#btnCycleWeek").kendoButton({
                        click:function(e){

                            $("#weekSelect").show();
                            $("#dateSelect").hide();

                            $("#cycleDt").val("");

                            // 체크박스 활성화
                            $("input[name=sWeek]:checkbox").prop("disabled", false);

                        }
                    });

                    // 선택
                    $("#btnCycleSelect").kendoButton({
                        click:function(e){

                            // 체크박스 비활성화 및 초기화
                            $("input[name=sWeek]:checkbox").prop("disabled", true);
                            $("input[name=sWeek]:checkbox").prop("checked",false);

                            $("#weekSelect").hide();
                            $("#dateSelect").show();

                            var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                            cycleDatepicker.open();

                        }
                    });

                    /*
                    var today = new Date(),
                    cycleDaysList = [
                       new Date(today.getFullYear(), today.getMonth(), 11),
                       new Date(today.getFullYear(), today.getMonth() + 1, 6),
                       new Date(today.getFullYear(), today.getMonth() + 1, 27),
                       new Date(today.getFullYear(), today.getMonth() - 1, 3),
                       new Date(today.getFullYear(), today.getMonth() - 2, 22)
                    ];
                    */

                    var cycleDatepicker = $("#cycleDatepicker").kendoDatePicker({

                        //value:"선택",
                        animation:false,
                        dates:cycleDaysList,
                        month:{
                            // template for dates in month view
                            content:'# if (isInArray(data.date, data.dates)) { #' +
                                         '<div class="selectDtClass"></div>' +
                                     '# } #' +
                                     '#= data.value #'
                        },
                        //footer:"Today - #=kendo.toString(data, 'd') #",
                        open:function (e) {

                            $("#weekSelect").hide();
                            $("#dateSelect").show();

                            // cycleDaysList 데이터를 가지고 체크박스 선택
                            $("#cycleDatepicker_dateview table tbody .selectDtClass").parent().parent().addClass("calendarChek")

                            // 달력 팝업시 width 설정
                            var dateViewCalendar = this.dateView.calendar;
                            if (dateViewCalendar) {
                                dateViewCalendar.element.width(300);
                            }

                        }

                    }).getKendoDatePicker();

                    cycleDatepicker.dateView.options.change = function(e){

                        // 선택된 날짜 표시하기 위한 클래스  추가 ( k-state-selected k-state-focused 이거는 안먹음 )
                        this._cell.addClass("calendarChek");

                        var selectDate = this.value();

                        var insertDt = false;

                        $.each(cycleDaysList, function(index, obj) {

                            // 선택된 날짜와 데이터소스와 비교해서 동일한 날짜가 있으면 지워준다.
                            if ( kendo.toString(selectDate,"<dms:configValue code='dateFormat' />") === kendo.toString(obj,"<dms:configValue code='dateFormat' />") ){
                                insertDt = true;
                                cycleDaysList.splice(index,1);
                            }

                        });

                        // 선택된 날짜 추가
                        if(!insertDt){
                            cycleDaysList.push(selectDate);
                        }else{
                            this._cell.removeClass("calendarChek k-state-selected k-state-focused");
                        }

                        // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
                        var firstChk = false;
                        var cycleDtTxt = "";
                        $("#cycleDt").val("");
                        $.each(cycleDaysList, function(index, obj) {
                            if(firstChk){
                                cycleDtTxt += ", ";
                            }
                            cycleDtTxt += kendo.toString(obj,"<dms:configValue code='dateFormat' />");
                            firstChk = true;
                        });
                         $("#cycleDt").val(cycleDtTxt);

                    }

                    var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");

                    // 추가
                    $("#btnInit").kendoButton({
                        click:function(e){
                            initForm();
                            smsTmpEnabled();
                        }
                    });

                    // 저장
                    $("#btnSave").kendoButton({
                        click:function(e){

                            // validation 시작  TODO 필수값 정해지면 다시 확인 (태그도 수정)
                            if (validator.validate()) {

                                if ( isSmsUseYn === "Y" ) {
                                    if( dms.string.isEmpty($("#activeTmplId").data("kendoExtDropDownList").value()) ) {
                                        // SMS템플릿 / 을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.activeTmplId' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                    }
                                }

                                if ( $("#startDt").data("kendoExtMaskedDatePicker").value() > $("#endDt").data("kendoExtMaskedDatePicker").value() ) {
                                        // 시작일  / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.startDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                /*
                                if ( $("#custExtrAutoYn").data("kendoExtDropDownList").value() === "Y" && dms.string.isEmpty($("#custExtrCycleCont").val()) ) {
                                        // {고객추출주기}을(를) 입력해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrCycleCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                        return;
                                }
                                 */

                                var confrimChk = true;

                                // 수정일때:고객추출자동여부를 변경할때
                                if ( $("#custCareSeq").val() > 0 ) {

                                    // 시작일 이전에 대상자 추출후 자동실행여부를 Y로 변경할때
                                    var sysDate = "${sysDate}"+" 00:00:00";
                                    var startDt = $("#startDt").val();
                                    var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                                    var tmpCustExtrAutoYn = $("#tmpCustExtrAutoYn").val();

                                    if ( startDt > sysDate ) {
                                        if ( tmpCustExtrAutoYn === "N" && custExtrAutoYn === "Y" ) {
                                            // 고객추출자동여부를 Y로 변경할경우 기존 대상자 목록은 삭제됩니다. 계속 하시겠습니까?
                                            if (confirm("<spring:message code='crm.info.custExtrConfirm' />")) {
                                                confrimChk = true;
                                                console.log("N에서 Y로 변경");
                                            } else {
                                                confrimChk = false;
                                            }
                                        }
                                    }
                                }

                                if(!confrimChk){
                                    return;
                                }

                                var saveData = $("#salesActiveMgmtForm").serializeObject(
                                        $("#salesActiveMgmtForm").serializeArrayInSelector("[data-json-obj='true']")
                                )
                                saveData.startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
                                saveData.endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();
                                saveData.custExtrCycleCont = $("#custExtrCycleCont").val();
                                saveData.autoActiveYn = $("#autoActiveYn").val();

                                console.log("saveData:",JSON.stringify(saveData));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/multiCustomerCareMgmts.do' />",
                                    data:JSON.stringify(saveData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        console.log("jqXHR:" ,jqXHR)
                                        console.log("textStatus:" ,textStatus)
                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR > 0 ){

                                            options.callbackFunc(jqXHR);

                                            /*
                                            // 저장 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            resultKey = jqXHR;
                                            isGridReload = true;
                                            */

                                        }else{
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                });

                            }
                            // validation 종료

                        }
                    });



                    // 팝업 form 데이터 set
                    var options = parent.popupWindow.options.content.data
                        , custCareSeq = options.custCareSeq
                    ;

                    console.log("#options:",options);


                    if( dms.string.isEmpty(custCareSeq) ){



                    }else if( dms.string.isNotEmpty(custCareSeq) ){


                        var param = {
                                "sCustCareSeq":custCareSeq
                                };

                        $.ajax({
                                url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmtByKey.do' />"
                                ,data:JSON.stringify(param)      //파라미터
                                ,type:'POST'                        //조회요청
                                ,dataType:'json'                  //json 응답
                                ,contentType:'application/json'   //문자열 파라미터
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }
                        }).done(function(body) {

                            console.log("고객케어 관리 상세 조회 결과:",body);

                            initForm();

                            $("#custCareSeq").val(body.custCareSeq);
                            $("#batOperId").val(body.batOperId);
                            $("#custCareNm").val(body.custCareNm);
                            $("#useYn").data("kendoExtDropDownList").value(body.useYn);
                            $("#activeTpCd").data("kendoExtDropDownList").value(body.activeTpCd);
                            $("#autoActiveYn").data("kendoExtDropDownList").value(body.autoActiveYn);
                            $("#activeTmplId").data("kendoExtDropDownList").value(body.activeTmplId);
                            $("#custExtrTermNo").data("kendoExtDropDownList").value(body.custExtrTermNo);
                            $("#custExtrAutoYn").data("kendoExtDropDownList").value(body.custExtrAutoYn);
                            $("#tmpCustExtrAutoYn").val(body.custExtrAutoYn);
                            $("#custExtrCycleCont").val(body.custExtrCycleCont);
                            $("#custCareCont").val(body.custCareCont);

                            $("#startDt").data("kendoExtMaskedDatePicker").value(body.startDt);
                            $("#endDt").data("kendoExtMaskedDatePicker").value(body.endDt);

                            $("#extrDgreCnt").val(body.extrDgreCnt);
                            $("#lastExtrDt").val(body.lastExtrDt);
                            $("#regUsrNm").val(body.regUsrNm);
                            $("#regDt").val(body.regDt);

                            var sysDate = "${sysDate}"+" 00:00:00";
                            var dateCompare = false;

                            // 오늘날짜 - 시작일 비교 ( 시작일이 지났으면 true )
                            if ( sysDate >= body.startDt ) {
                                dateCompare = true;
                            };

                            smsTmpEnabled();

                            /*  고객케어 상세정보 리드온리
                            **  1. 고객추출자동여부가 Y:시작일이후 - 현재일 >= 시작일 일경우 사용여부 빼고 리드온리
                            **  2. 고객추출자동여부가 N:시작일이전 - 현재일 < 시작일 인경우 Y로 변경시.... 기존 대상자 목록 삭제하시겠습니까? confirm -> 기존 대상자 목록 삭제
                            **  --------------------------
                            **  시작일 이후에는 읽기전용
                            */
                            if ( dateCompare ) {
                                readonlyForm();
                            }

                        });



                    }

                    // 상세조회 종료



                });

            </script>



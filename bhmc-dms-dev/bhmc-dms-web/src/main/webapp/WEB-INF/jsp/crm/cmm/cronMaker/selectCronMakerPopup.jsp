<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <section id="window" class="pop_wrap">

        <!-- Month Tab -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.title.allMonthSelect" /><!-- 월 주기선택 --></h2>
            <div class="btn_right">
                <button id="btnSubmit" class="btn_m btn_save"><spring:message code="crm.lbl.cronConfirm" /><!-- 주기확인 --></button>
                <button id="btnUiTOText" class="btn_m btn_save"><spring:message code="global.btn.confirm" /><!-- 확인 --></button>
            </div>
        </div>

    <form id="form">
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:4%;">
                        <col style="width:96%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllMonth_Y" name="sAllMonth" class="form_check" value="Y" checked /><spring:message code="crm.lbl.allMonth" /><!-- 매월 --></label>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllMonth_N" name="sAllMonth" class="form_check" value="N" ><spring:message code="crm.lbl.month" /><!-- 월 선택 --></label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="vt">
                                <c:forEach var="i" begin="1" end="12" step="1">
                                    <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sMonth_<c:out value="${i}" />" name="sMonth" class="form_check" value="<c:out value="${i}" />" disabled /> <c:out value="${i}" /><spring:message code="crm.lbl.month" /><!-- 월 --></label>
                                </c:forEach>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- //Month Tab -->


        <!-- Day Tab -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.allDaySelect" /><!-- 일 주기선택 --></h2>
        </div>
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:4%;">
                        <col style="width:96%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllDay_Y" name="sAllDay" class="form_check" value="Y" checked /><spring:message code="crm.lbl.allDay" /><!-- 매일 --></label>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllDay_N" name="sAllDay" class="form_check" value="N" /><spring:message code="crm.lbl.day" /><!-- 일 선택 --></label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="vt">
                                <c:forEach var="i" begin="1" end="31" step="1">
                                    <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sDay_<c:out value="${i}" />" name="sDay" class="form_check" value="<c:out value="${i}" />" disabled /> <c:out value="${i}" /><spring:message code="crm.lbl.day" /><!-- 일 --></label>
                                </c:forEach>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- //Day Tab -->


        <!-- Hour Tab -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.allHourSelect" /><!-- 시간 주기선택 --></h2>
        </div>
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:4%;">
                        <col style="width:96%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllHour_Y" name="sAllHour" class="form_check" value="Y" checked /><spring:message code="crm.lbl.allHour" /><!-- 매시간 --></label>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllHour_N" name="sAllHour" class="form_check" value="N" /><spring:message code="crm.lbl.hour" /><!-- 시간 선택 --></label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="vt">
                                <c:forEach var="i" begin="0" end="23" step="1">
                                    <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sHour_<c:out value="${i}" />" name="sHour" class="form_check" value="<c:out value="${i}" />" disabled /> <c:out value="${i}" /><spring:message code="crm.lbl.hour" /><!-- 시 --></label>
                                </c:forEach>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //Hour Tab -->


        <!-- Week Tab -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.allWeekSelect" /><!-- 주 주기선택 --></h2>
        </div>
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:4%;">
                        <col style="width:96%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <label class="label_check"><input type="checkbox" id="sUseWeek" name="sUseWeek" class="form_check" value="Y" ><spring:message code="crm.lbl.allWeekUseYn" /><!-- 매주사용여부 --></label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllWeek_Y" name="sAllWeek" class="form_check" value="Y" disabled checked /><spring:message code="crm.lbl.allWeek" /><!-- 매주 --></label>
                                <label class="label_check" style="width:55px;margin-right:0;"><input type="radio" id="sAllWeek_N" name="sAllWeek" class="form_check" value="N" disabled /><spring:message code="crm.lbl.week" /><!-- 주 선택 --></label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="vt">
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_1" name="sWeek" class="form_check" value="1" disabled /> <spring:message code="global.lbl.sunday" /><!-- 일 --></label>
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_2" name="sWeek" class="form_check" value="2" disabled /> <spring:message code="global.lbl.monday" /><!-- 월 --></label>
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_3" name="sWeek" class="form_check" value="3" disabled /> <spring:message code="global.lbl.tuesday" /><!-- 화 --></label>
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_4" name="sWeek" class="form_check" value="4" disabled /> <spring:message code="global.lbl.wednesday" /><!-- 수 --></label>
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_5" name="sWeek" class="form_check" value="5" disabled /> <spring:message code="global.lbl.thursday" /><!-- 목 --></label>
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_6" name="sWeek" class="form_check" value="6" disabled /> <spring:message code="global.lbl.friday" /><!-- 금 --></label>
                                <label class="label_check" style="width:55px;margin:0 0 2px;"><input type="checkbox" id="sWeek_7" name="sWeek" class="form_check" value="7" disabled /> <spring:message code="global.lbl.saturday" /><!-- 토 --></label>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- //Week Tab -->

    </form>

        <!-- 주기확인  -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="crm.lbl.cronConfirm" /><!-- 주기확인  --></h2>
        </div>
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:4%;">
                        <col style="width:96%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <textarea id="cronSchedule" name="cronSchedule" rows="5" cols="30" class="form_textarea form_readonly" maxlength="1000" ></textarea>
                                <input type="hidden" id="cronExpression" name="cronExpression"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //주기확인 -->

    </section>
    <!-- //주기 확인-->

<script type="text/javascript">

    function initHour(isAll){

        if ( isAll ) {
            $("input[name=sAllHour][value='Y']").prop("checked", true);
        }

        $("input[name=sHour]:checkbox").prop("disabled", isAll);
        $("input[name=sHour]:checkbox").prop("checked",false);

    }

    function initDay(isAll){

        if ( isAll ) {
            $("input[name=sAllDay][value='Y']").prop("checked", true);
        }

        $("input[name=sDay]:checkbox").prop("disabled", isAll);
        $("input[name=sDay]:checkbox").prop("checked",false);

    }

    function initMonth(isAll){

        if ( isAll ) {
            $("input[name=sAllMonth][value='Y']").prop("checked", true);
        }

        $("input[name=sMonth]:checkbox").prop("disabled", isAll);
        $("input[name=sMonth]:checkbox").prop("checked",false);

    }

    function initWeek(isAll){

        if ( isAll ) {
            $("input[name=sAllWeek][value='Y']").prop("checked", true);
        }

        $("input[name=sWeek]:checkbox").prop("disabled", isAll);
        $("input[name=sWeek]:checkbox").prop("checked",false);

    }

    function cronExpressionSet(result) {

        $("#second").val(result.second);
        $("#minute").val(result.minute);
        $("#hour").val(result.hour);
        $("#day").val(result.day);
        $("#month").val(result.month);
        $("#week").val(result.week);
        $("#cronExpression").val(result.cronExpression);

        var cronSchedule = "";
        $("#cronSchedule").empty();

        $.each(result.cronSchedule, function(idx, row){
            var index = idx+1;
            cronSchedule += "<span>"+index+". "+row+"</span><br/>"
        });

        $("#cronSchedule").append(cronSchedule);

        // 탭 checkbox, radio 설정

        // 분 탭 설정
        /*
        var minArray = result.minute.split(',');
        $("input[name=sMinute]:checkbox").prop("checked", false);
        $.each(minArray, function(idx, row){
            $("#sMinute_"+row).prop("checked", true);
        });
         */

        // 시간 탭 설정
        if ( result.hour === "*" ) {

            initHour(true)  // 시간  - 초기화

        } else {

            $("input[name=sAllHour][value='N']").prop("checked", true);
            $("input[name=sHour]:checkbox").prop("disabled", false);

            var resultArray = result.hour.split(',');
            $("input[name=sHour]:checkbox").prop("checked", false);
            $.each(resultArray, function(idx, row){
                $("#sHour_"+row).prop("checked", true);
            });

        }

        // 월 탭 설정
        if ( result.month === "*" ) {

            initMonth(true)  // 월 - 초기화

        } else {

            $("input[name=sAllMonth][value='N']").prop("checked", true);
            $("input[name=sMonth]:checkbox").prop("disabled", false);

            var resultArray = result.month.split(',');
            $("input[name=sMonth]:checkbox").prop("checked", false);
            $.each(resultArray, function(idx, row){
                $("#sMonth_"+row).prop("checked", true);
            });

        }

        // 일 탭 설정
        if ( result.day === "*" || result.day === "?" ) {

            initDay(true)  // 일 - 초기화

        } else {

            $("input[name=sAllDay][value='N']").prop("checked", true);
            $("input[name=sDay]:checkbox").prop("disabled", false);

            var resultArray = result.day.split(',');
            $("input[name=sDay]:checkbox").prop("checked", false);
            $.each(resultArray, function(idx, row){
                $("#sDay_"+row).prop("checked", true);
            });

        }

        // 주 탭 설정
        if ( result.week === "?" ) {

            // 주 초기화
            $("#sUseWeek").prop("checked",false);
            $("input[name=sAllWeek]:radio").prop("disabled", true);
            initWeek(true)


        } else if ( result.week === "*" ) {

            initDay(true)  // 일 - 초기화
            $("#sUseWeek").prop("checked",true);
            $("input[name=sAllWeek]:radio").prop("disabled", false);
            // 주 사용여부 체크
            // 주 활성화

        } else {

            initDay(true)  // 일 - 초기화
            $("#sUseWeek").prop("checked",true);

            $("input[name=sAllWeek][value='N']").prop("checked", true);
            $("input[name=sAllWeek]:radio").prop("disabled", false);
            $("input[name=sWeek]:checkbox").prop("disabled", false);


            var resultArray = result.week.split(',');
            $.each(resultArray, function(idx, row){
                $("#sWeek_"+row).prop("checked", true);
            });

        }

    }

    // hour 전체 클릭시
    $("input[name=sAllHour]").change(function(e){

        var isAll = false;
        if ( $(this).val() === 'Y' ) {
            isAll = true;
        }

        initHour(isAll)  // 시간  - 초기화

    });

    // day 전체 클릭시
    $("input[name=sAllDay]").change(function(e){

        var isAll = false;
        if ( $(this).val() === 'Y' ) {
            isAll = true;
        }
        initDay(isAll)  // 일 - 초기화

        // 주 초기화
        $("#sUseWeek").prop("checked",false);
        $("input[name=sAllWeek]:radio").prop("disabled", true);
        initWeek(true)

    });

    // month 전체 클릭시
    $("input[name=sAllMonth]").change(function(e){

        var isAll = false;
        if ( $(this).val() === 'Y' ) {
            isAll = true;
        }
        initMonth(isAll)  // 월 - 초기화

    });

    // week 사용 클릭시
    $("#sUseWeek").click(function(e){

        var isAll = $(this).is(":checked");

        // 전체 클릭시 날짜선택 체크박스 해제
        $("input[name=sAllWeek]:radio").prop("disabled", !isAll);

        initWeek(true)
        initDay(true)  // 일 - 초기화

    });

    // sAllWeek 전체 클릭시
    $("input[name=sAllWeek]").change(function(e){

        var isAll = false;
        if ( $(this).val() === 'Y' ) {
            isAll = true;
        }
        initWeek(isAll)  // 월 - 초기화

    });

    $(document).ready(function() {

        $(".tab_area").kendoExtTabStrip({
            animation:false
        });


        // 주기확인
        $("#btnSubmit").kendoButton({
            click:function(e){

                /*
                if ( !$("input[name=sMinute]:checkbox").is(":checked") ) {
                    // {분}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.minute' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }
                 */
                if ( $("input[name=sAllHour]:checked").val() === "N" && !$("input[name=sHour]:checkbox").is(":checked") ) {
                    // {시}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.hour' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }

                if ( $("input[name=sAllDay]:checked").val() === "N" && !$("input[name=sDay]:checkbox").is(":checked") ) {
                    // {일}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.day' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }

                if ( $("input[name=sAllMonth]:checked").val() === "N" && !$("input[name=sMonth]:checkbox").is(":checked") ) {
                    // {월}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.month' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }

                if ( $("input[name=sUseWeek]:checkbox").is(":checked") && $("input[name=sAllWeek]:checked").val() === "N" && !$("input[name=sWeek]:checkbox").is(":checked") ) {
                    // {주}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.week' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }

                var saveData = $("#form").serializeObject();

                // 체크박스 길이 가져와서 1개면 아래실행
                //if ( typeof saveData.sMinute === 'string' ) {
                    var tmpMinute = [];
                    tmpMinute.push("00");
                    saveData.sMinute = tmpMinute;
                //}


                // 전체선택 / 1개만 선택일경우..
                if ( $("input[name=sAllHour]:checked").val() === 'Y' ) {
                    saveData.sHour = "ALL";
                }
                if ( typeof saveData.sHour === 'string' ) {
                    var tmpHour = [];
                    tmpHour.push(saveData.sHour);
                    saveData.sHour = tmpHour;
                }

                // 전체선택 / 1개만 선택일경우..
                if ( $("input[name=sAllDay]:checked").val() === 'Y' ) {
                    saveData.sDay = "ALL";
                }
                if ( typeof saveData.sDay === 'string' ) {
                    var tmpDay = [];
                    tmpDay.push(saveData.sDay);
                    saveData.sDay = tmpDay;
                }

                // 전체선택 / 1개만 선택일경우..
                if ( $("input[name=sAllMonth]:checked").val() === 'Y' ) {
                    saveData.sMonth = "ALL";
                }
                if ( typeof saveData.sMonth === 'string' ) {
                    var tmpMonth = [];
                    tmpMonth.push(saveData.sMonth);
                    saveData.sMonth = tmpMonth;
                }

                // 전체선택 / 1개만 선택일경우..
                if ( $("input[name=sAllWeek]:checked").val() === 'Y' ) {
                    saveData.sWeek = "ALL";
                }
                if ( typeof saveData.sWeek === 'string' ) {
                    var tmpWeek = [];
                    tmpWeek.push(saveData.sWeek);
                    saveData.sWeek = tmpWeek;
                }

                if ( !$("input[name=sUseWeek]:checkbox").is(":checked") ) {
                    saveData.sUseWeek = "N";
                }

                delete saveData.sAllHour;
                delete saveData.sAllDay;
                delete saveData.sAllMonth;
                delete saveData.sAllWeek;

                console.log("saveData:" + JSON.stringify(saveData));
                //return;

                $.ajax({
                    url:"<c:url value='/crm/cmm/cronMaker/cronExpression.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result, textStatus) {

                        console.log(result)
                        console.log(textStatus)


                        if ( textStatus === "success" ) {

                            cronExpressionSet(result);
                            // TODO 체크박스, 라디오 박스 선택 처리...

                        }

                        //options.callbackFunc("SUCCESS");
                        //parent.popupWindow.close();

                    }
                });

            }
        });


        $("#btnUiTOText").kendoButton({
            click:function(e){

                options.callbackFunc($("#cronExpression").val());
                //parent.popupWindow.close();

            }
        });


        // 팝업 form 데이터 set
        var options = parent.popupWindow.options.content.data;

        console.log("#options:",options);

        if ( dms.string.isNotEmpty(options) ) {

            // cronExpression 있으면 조회후 뿌려주기
            if ( dms.string.isNotEmpty(options.cronTxt) ) {

                console.log(options.cronTxt);

                var param = {};

                param["cronExpression"] = options.cronTxt;

                console.log(JSON.stringify(param));

                $.ajax({
                    url:"<c:url value='/crm/cmm/cronMaker/resolveCronMaker.do' />",
                    data:JSON.stringify(param),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result, textStatus) {

                        if ( textStatus === "success" ) {

                            cronExpressionSet(result);
                            // TODO 체크박스, 라디오 박스 선택 처리...

                        }

                    }
                });


            }

        }


    });
</script>

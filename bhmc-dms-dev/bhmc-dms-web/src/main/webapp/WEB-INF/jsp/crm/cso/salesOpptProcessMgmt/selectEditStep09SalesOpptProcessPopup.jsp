<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">

        <!-- 탭메뉴 전체 영역 -->
        <div class="tab_area" id="tab_area_main"> <!-- 탭메뉴 시작-->
            <ul>
                <li id="custInfoTab" class="k-state-active" ><spring:message code="global.lbl.custInfo" /><!-- 고객정보 --></li>
                <li id="activeAddTab"><spring:message code="crm.lbl.activeAdd" /> <!-- 추적추가 增加跟踪--></li>
                <li id="historyRecordTab"><spring:message code="crm.lbl.historyRecord" /> <!-- 이력기록--></li>
            </ul>
            <span class="btn_right_absolute2">
                <dms:access viewId="VIEW-D-11103" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlGotoStep01" class="btn_m custInfoTab"><spring:message code="crm.lbl.uploadAdd" /><!-- 업로드 집객 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11104" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlGotoStep02" class="btn_m custInfoTab"><spring:message code="crm.lbl.activeAppointment" /><!-- 추출예약 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11105" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlGotoStep04Before" class="btn_m custInfoTab"><spring:message code="crm.lbl.activeProcessing" /><!-- 추적추진 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11106" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlRejectSign" class="btn_m custInfoTab"><spring:message code="crm.btn.rejectSign" /><!-- 불통과 --></button>
                </dms:access>
                    <button type="button" id="btnCtlSearchTrace" style="display:none;" class="btn_m"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    <button type="button" id="btnCtlSearchLeadHist" style="display:none;" class="btn_m"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                <dms:access viewId="VIEW-D-11107" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlSaveBefore" class="btn_m custInfoTab"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11108" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlKeyPadCall" class="btn_m activeAddTab" style="display:none;"><spring:message code="crm.btn.OBcall" /><!-- 전화걸기 --></button>
                    <button type="button" id="btnCtlSaveTrace" class="btn_m activeAddTab" style="display:none;"><spring:message code="crm.btn.activeSave" /><!-- 추적 저장 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11109" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCtlCancel" class="btn_m btn_Cancel custInfoTab activeHistoryTab activeAddTab leadStatusExchangeTab historyRecordTab"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
                </dms:access>
                    <button type="button" id="btnCtlSave" style="display:none;" class="btn_m"></button>
                    <input type="hidden" id="btnNextStep" />
                    <input type="hidden" id="salesOpptSeq" /> <!-- 판매기회일련번호 -->
                    <input type="hidden" id="btnStepChange" />
                    <input type="hidden" id="befLeadStatCd" />
                    <input type="hidden" id="oldLeadStatCd" />
                    <input type="hidden" id="mngScIdCtrl" />
            </span>
            <div id="custInfoTabDiv" class="mt0"> <!-- custInfoTabDiv Start -->
                <div class="header_area"> <!-- 조회 조건 타이틀 시작 -->
                    <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2> <!-- 기본정보 -->
                    <div class="btn_right">
                        <button type="button" id="btnDetailCust" class="btn_xs"><spring:message code='crm.btn.custDetail' /></button> <!-- 더많음-->
                        <button type="button" id="btnFrameRefresh" class="k-icon k-i-refresh" style="height: 20px; margin-top: 6px; margin-left: -1px; padding: 2 2 2 2; border:1px solid #b4b6bc; border-radius:3px; box-sizing:border-box; box-shadow: none; background-color:#fff; background-repeat:no-repeat; color:#505050; line-height: 20px; text-align:center; vertical-align:middle;cursor: pointer;"></button> <!-- 초기화-->
                    </div>
                </div> <!-- 조회 조건 타이틀 끝 -->
                <!--  정보입력여역 시작 -->
                <!--  salesOpptProcForm Start -->
                <jsp:include page="/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectIncludeSalesOpptProcess.jsp"></jsp:include>
                <!--  salesOpptProcForm End -->
            </div> <!-- custInfoTabDiv End -->
            <div id="activeAddTabDiv"> <!-- activeAddTabDiv Start -->
                <jsp:include page="/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectIncludeActiveAdd.jsp"></jsp:include>
            </div> <!-- activeAddTabDiv End -->
            <div id="historyRecordTabDiv"> <!-- historyRecordTabDiv Start -->
                <div class="tab_area" id="tab_area_sub">
                    <ul>
                        <li id="activeHistoryTab"><spring:message code="crm.lbl.activeHistory" /> <!-- 추적이력 历史跟踪--></li>
                        <li id="leadStatusExchangeTab"><spring:message code="crm.lbl.leadStatusExchange" /> <!-- 회전기록 流转记录--></li>
                        <li id="leadDupHistoryTab"><spring:message code="crm.lbl.salesOpptDupHist" /> <!-- 중복이력 --></li>
                    </ul>
                    <div id="activeHistoryTabDiv"> <!-- activeHistoryTabDiv Start -->
                        <jsp:include page="/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectIncludeActiveHistory.jsp"></jsp:include>
                    </div> <!-- activeHistoryTabDiv End -->
                    <div id="leadStatusExchangeTabDiv"> <!-- leadStatusExchangeTabDiv Start -->
                        <jsp:include page="/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectIncludeLeadStatusExchange.jsp"></jsp:include>
                    </div> <!--  leadStatusExchangeTabDiv End -->
                    <div id="leadDupHistoryTabDiv"> <!-- leadDupHistoryTabDiv Start -->
                        <jsp:include page="/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectIncludeLeadDupHistoryTab.jsp"></jsp:include>
                    </div> <!--  leadDupHistoryTabDiv End -->
                </div>

            </div> <!-- historyRecordTabDiv End -->
        </div><!-- //탭메뉴 끝-->
<script type="text/javascript">
        $("#tab_area_main").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var callUrl;
                console.log(selectTabId);

                $("[id^=btnCtl]").hide();
                $("[class*="+selectTabId+"]").show();

                if (selectTabId == "historyRecordTab") {
//                     var tabSubStrip = $("#tab_area_sub").kendoExtTabStrip().data("kendoExtTabStrip");
//                     tabSubStrip.select(0);
                    $("#tab_area_sub").data("kendoExtTabStrip").select(0);
                    $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
                } else if (selectTabId == "activeAddTab") {
                    $("#btnCustSearchR").click();
                }

            }
        });
</script>
    </section>
    <!-- //그룹선택 팝업 -->
<!--  ************************** nextChkDiv **************************** -->
        <section id="nextChkDiv" class="pop_wrap"> <!-- nextChkDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnNextSubmit" class="btn_m"><spring:message code="crm.btn.submit" /><!-- 제출 --></button>
                </div>
            </div>
            <div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:40%;">
                            <col style="width:60%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.visitAppointDt" /></th> <!-- //  방문예약시간  预约到店时间 -->
                                <td colspan="2">
                                    <input id="vsitResvDt" name="vsitResvDt" class="form_datetimepicker" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** nextChkDiv **************************** -->
<!--  ************************** checkPwDiv **************************** -->
        <section id="checkPwDiv" class="pop_wrap"> <!-- checkPwDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnMngScSet" class="btn_m"><spring:message code="crm.btn.submit" /><!-- 제출 --></button>
                </div>
            </div>
            <div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
<!--                             <tr> -->
<%--                                 <th scope="row" class="al"><spring:message code='global.lbl.handler' /><!-- 조작인 --></th> --%>
<!--                                 <td> -->
<%--                                     ${loginUsrNm} (${loginUsrId}) --%>
<!--                                 </td> -->
<!--                             </tr> -->
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.prsn' /></th> <!-- 책임자 -->
                                <td>
                                    <input id="usersRoleCrmR03" name="usersRoleCrmR03" type="text" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" ><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td>
                                    <input id="usrPw" name="usrPw" type="password" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** checkPwDiv **************************** -->
<!--  ************************** CtlFailSendBeforeDiv **************************** -->
        <section id="ctlFailSendBeforeDiv" class="pop_wrap"> <!-- checkPwDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnGotoStep04" class="btn_m"><spring:message code="crm.btn.submit" /><!-- 제출 --></button>
                </div>
            </div>
            <div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.prsn' /></span></th> <!-- 책임자  -->
                                <td>
                                    <input id="mngScIdStep04" name="mngScIdStep04" type="text" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td>
                                    <input id="usrPwGotoStep04" name="usrPwGotoStep04" type="password" class="form_input"  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** checkPwDiv **************************** -->
<!-- <div id="mask" class="k-loading-mask"  style="position:fixed;width:100%;height:100%;top:0;left:0;border-color:#fff;"> -->
<!-- <div style="border-color:#fff;"> -->
<!--         <span class="k-loading-text">Loading....aa</span> -->
<!--         <div class="k-loading-image"></div> -->
<!--         <div class="k-loading-color"></div> -->
<!-- </div> -->
<!-- </div> -->

 <script type="text/javascript">

     var salesOpptPwYn          = "${salesOpptPwYn}";

     var addrTpList = [];
     var addrTpMap = [];
     var chgBuyYnDS = [];
     var chgBuyYnMap = [];
     var carlineCdList = [];
     var carlineCdMap = [];
     var colorCdList = [];
     var colorCdMap = [];
     var mngScIdList = [];
     var mngScIdMap = [];
     var infoPathCdList = [];
     var infoPathCdMap = [];

     var holdTpList = [];
     var holdTpMap = [];
     var holdDetlTpSeqList = [];
     var holdDetlTpSeqMap = [];

     var leadStatCdList = [];
     var leadStatCdMap = [];
     var sexCdList = [];
     var sexCdMap = [];
     var modelCdList = [];
     var modelCdMap = [];
     var traceMthCdList = [];
     var traceMthCdMap = [];

     var custTpList = [];
     var custTpMap = [];
     var infoTpList = [];
     var payTpList = [];
     var expcPurcHmCdList = [];

     var traceGradeCdList = [];
     var traceGradeCdMap = [];
     var validGradeCdList = [];
     var invalidCauCdList = [];
     var validGradeCdMap = [];
     var invalidCauCdMap = [];

     var bizcondCdList   = [];
     var mathDocTpList = [];

     var usersRoleCrmR02 = [];
     var usersRoleCrmR03 = [];
     var usersRoleCrmR17 = [];
     var usersRoleCrmR18 = [];

     var traceGrdMap = [];

     <c:forEach var="obj" items="${traceGrdList}">
         traceGrdMap["${obj.cmmCd}"] = "${obj.traceIvalDay}";
     </c:forEach>

     <c:forEach var="obj" items="${usersRoleCrmR02}">
         usersRoleCrmR02.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${usersRoleCrmR03}">
         usersRoleCrmR03.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${usersRoleCrmR17}">
         usersRoleCrmR17.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${usersRoleCrmR18}">
         usersRoleCrmR18.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${mathDocTpList}">
         <c:if test="${obj.remark1 == 'C'}">
             mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:if>
     </c:forEach>

     <c:forEach var="obj" items="${bizcondCdList}">
         bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${traceMthCdList}">
         traceMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         traceMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${traceGradeCdList}">
         traceGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         traceGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${validGradeCdList}">
         validGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         validGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${invalidCauCdList}">
         invalidCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         invalidCauCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${holdTpList}">
         holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${holdDetlTpSeqList}">
         holdDetlTpSeqList.push({"cmmCd":"${obj.holdSeq}" , "cmmCdNm":"${obj.holdDetlTpNm}", "useYn":"${obj.delYn}"});
         holdDetlTpSeqMap["${obj.holdSeq}"] = "${obj.holdDetlTpNm}";
     </c:forEach>

     <c:forEach var="obj" items="${expcPurcHmCdList}">
         expcPurcHmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${payTpList}">
         payTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${infoTpList}">
         infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${custTpList}">
         custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${leadStatCdList}">
         leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${sexCdList}">
         sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${infoPathCdList}">
         infoPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         infoPathCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${mngScIdList}">
         mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
         mngScIdMap["${obj.usrId}"] = "${obj.usrNm}";
     </c:forEach>

     chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
     chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
     chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
     chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

     <c:forEach var="obj" items="${addrTpList}">
         <c:if test="${obj.remark1 ne 'SA'}">
              addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:if>
         addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     //차종조회
     <c:forEach var="obj" items="${carlineCdList}">
         carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
         carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
     </c:forEach>

     //색상조회
     <c:forEach var="obj" items="${colorCdList}">
         colorCdList.push({extColorNm:"${obj.extColorNm}", extColorCd:"${obj.extColorCd}"});
         colorCdMap["${obj.extColorCd}"] = "${obj.extColorNm}";
     </c:forEach>

     function fn_warpWindowByMask(){
         console.log("warpWindowByMask 2!!");
         var maskHeight = $(document).height();
         var maskWidth = $(window).width();

         $("#mask").css({'width':maskWidth, 'height':maskHeight});

         $("#mask").fadeIn(1000);
     }

     //fn_warpWindowByMask();

    $(document).ready(function() {

        $("#vsitResvDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            , minTime:"08:00"
            , maxTime:"24:00"
        });

        $("#mngScIdStep04").kendoExtDropDownList({
            dataTextField:"usrNm"
            , dataValueField:"usrId"
            , dataSource:usersRoleCrmR03
            , index:0
            , optionLabel:" "
            , filter:"contains"
            , filtering:function(e){
                var filter = e.filter;
            }
            , change:function(){
                var sel = this.dataItem(this.select()).usrId;
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var bhmcYn = $("#bhmcYn").val();
                var beforeMngScId = $("#beforeMngScId").val();
                if (salesOpptPwYn == "Y"){
                    if ((sel != '') && (sel != beforeMngScId )){
                        $("#usrPwGotoStep04").attr("readonly", false);
                        $("#usrPwGotoStep04").removeClass("form_readonly");
                    } else {
                        $("#usrPwGotoStep04").attr("readonly", true);
                        $("#usrPwGotoStep04").addClass("form_readonly");
                    }
                }
            }
        });
        $("#mngScIdStep04").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });

        $("#usersRoleCrmR03").kendoExtDropDownList({
            dataTextField:"usrNm"
            , dataValueField:"usrId"
            , dataSource:usersRoleCrmR03
            , index:0
            , filter:"contains"
            , filtering:function(e){
                var filter = e.filter;
            }
            , change:function(){
                var sel = this.dataItem(this.select()).usrId;
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var bhmcYn = $("#bhmcYn").val();
                var beforeMngScId = $("#beforeMngScId").val();
                if (salesOpptPwYn == "Y"){
                    if ((sel != '') && (sel != beforeMngScId )){
                        $("#usrPw").attr("readonly", false);
                        $("#usrPw").removeClass("form_readonly");
                    } else {
                        $("#usrPw").attr("readonly", true);
                        $("#usrPw").addClass("form_readonly");
                    }

                }


    //             console.log("sel : " + sel);
    //             console.log("mngScId : " + mngScId);

                /*
                                제조사리드가 아닌 경우 책임자 기본 빈값이며 선택하더라도 비번 필요 없음.
                                판매고문 없이도 제출 가능함.
                */
    //             if (bhmcYn == 'Y') {
    //                 if (mngScId != sel){
    //                     $("#nextChkDivUsrPw").attr("readonly", false);
    //                     $("#nextChkDivUsrPw").removeClass("form_readonly");
    //                 } else {
    //                     $("#nextChkDivUsrPw").attr("readonly", true);
    //                     $("#nextChkDivUsrPw").addClass("form_readonly");
    //                 }
    //             }
            }
        });

        if ( $("#bhmcYn").val() == "Y") {
          //판매기회 실행 (ROLE_CRM_R_03)
            $("#usersRoleCrmR03").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
        } else {
            $("#usersRoleCrmR03").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
        }

//         $("#tab_area_main").kendoExtTabStrip({
//             animation:false
//             , select:function(e) {
//                 var selectTabId = e.item.id;
//                 var callUrl;
//                 console.log(selectTabId);

//                 $("[id^=btnCtl]").hide();
//                 $("[class*="+selectTabId+"]").show();

//                 if (selectTabId == "historyRecordTab") {
//                     $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
//                     var tabSubStrip = $("#tab_area_sub").kendoExtTabStrip().data("kendoExtTabStrip");
//                     tabSubStrip.select(0);
//                 } else if (selectTabId == "activeAddTab") {
//                     $("#btnCustSearchR").click();
//                 }

//             }
//         });

        var tabStrip = $("#tab_area_main").kendoExtTabStrip().data("kendoExtTabStrip");
        tabStrip.select(0);

       var options = parent.editCustPopupWindow.options.content.data;

       $("#leadStatCd").data("kendoExtDropDownList").value(options.leadStatCd);
       $("#befLeadStatCd").val(options.leadStatCd); //주의 실재 이전 단계가 아니라 지금 단계입니다. 서비스에서 단계 이력을 남기기 위한 용도임.
       $("#oldLeadStatCd").val(options.befLeadStatCd);

       $(".btnStep02").show();

       $("#tab_area_sub").kendoExtTabStrip({
           animation:false
           , select:function(e) {
               var selectTabId = e.item.id;
               var callUrl;
               console.log(selectTabId);

               $("[id^=btnCtl]").hide();
               $("[class*="+selectTabId+"]").show();

               if (selectTabId == "activeHistoryTab") {
                   $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
               } else if (selectTabId == "leadStatusExchangeTab") {
                   $("#leadStatusExchangeTabGrid").data("kendoExtGrid").dataSource.page(1);
               } else if (selectTabId == "leadDupHistoryTab") {
                   $("#leadDupHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
               }

           }
       });

       $("#btnDetailCust").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               window.parent.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+custNo, "VIEW-D-10272"); // CUST NO
           }
       });

       $("#btnFrameRefresh").click(function(){
           $("#btnCustSearch").click();
       });

       $("#btnCtlGotoStep01").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var beforeMngScId = $("#beforeMngScId").val();

               var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
               var holdTp = $("#holdTp").data("kendoExtDropDownList").value();

               var loginUsrId = "${loginUsrId}";
               var mngScIdCtrl = "${mngScIdCtrl}";

               if (mngScIdCtrl == "N") {
                   // 권한이 없습니다.
                   dms.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                   return false;
//                    if (loginUsrId != mngScId) {
//                    }
               }

               if ( dms.string.isEmpty(infoTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               if ( dms.string.isEmpty(holdTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               // 고객번호
               if ( dms.string.isEmpty(custNo) ) {
                   dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
               };

               // 책임자 확인
//                if ( dms.string.isEmpty(mngScId)) {
//                    dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
//                    return false;
//                };

               $("#leadStatCd").data("kendoExtDropDownList").value("01");
               $("#mngScId").data("kendoExtDropDownList").value(' ');
               $("#btnStepChange").click();

           }
       });

       $("#btnCtlGotoStep02").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var beforeMngScId = $("#beforeMngScId").val();

               var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
               var holdTp = $("#holdTp").data("kendoExtDropDownList").value();

               var loginUsrId = "${loginUsrId}";
               var mngScIdCtrl = "${mngScIdCtrl}";

               if (mngScIdCtrl == "N") {
                   // 권한이 없습니다.
                   dms.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                   return false;
//                    if (loginUsrId != mngScId) {
//                    }
               }

               if ( dms.string.isEmpty(infoTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               if ( dms.string.isEmpty(holdTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               // 고객번호
               if ( dms.string.isEmpty(custNo) ) {
                   dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
               };

               // 책임자 확인
               if ( dms.string.isEmpty(mngScId)) {
                   dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                   return false;
               };

               $("#leadStatCd").data("kendoExtDropDownList").value("02");

            // div 띄우기
               $("#usersRoleCrmR03").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
               $("#usersRoleCrmR03").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });

               var checkPwDiv = $("#checkPwDiv").data("kendoWindow");
               checkPwDiv.center();
               checkPwDiv.open();

               //$("#btnStepChange").click();
           }
       });

       $("#btnCtlGotoStep04Before").kendoButton({
           click:function(e) {
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var beforeMngScId = $("#beforeMngScId").val();
               var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();

               var loginUsrId = "${loginUsrId}";
               var mngScIdCtrl = "${mngScIdCtrl}";

               if (mngScIdCtrl == "N") {
                   if (leadStatCd == "09") {  // '실패'에서는 '전체'권한자만 가능.
                       // 권한이 없습니다.
                       dms.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                       return false;
                   } else {     // '전출'에서는 본인것만 가능.
                       if (loginUsrId != mngScId) {
                       // 활성화 할 수 있는 권한이 없습니다. <br> 본인것만 가능합니다.
                           dms.notification.info("<spring:message code='crm.info.notAuthActive'/>");
                           return false;
                       }
                   }
               }

               // div 띄우기
               $("#usersRoleCrmR03").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
               $("#usersRoleCrmR03").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });

               var ctlFailSendBeforeDiv = $("#ctlFailSendBeforeDiv").data("kendoWindow");
               ctlFailSendBeforeDiv.center();
               ctlFailSendBeforeDiv.open();

//                if (salesOpptPwYn == "Y"){
//                    if ((beforeMngScId != '') && (mngScId != beforeMngScId)) {
//                        var ctlFailSendBeforeDiv = $("#ctlFailSendBeforeDiv").data("kendoWindow");
//                        ctlFailSendBeforeDiv.center();
//                        ctlFailSendBeforeDiv.open();
//                    } else {
//                        $("#btnGotoStep04").click();
//                    }
//                } else {
//                    $("#btnGotoStep04").click();
//                }
           }
       });

       $("#btnGotoStep04").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               var mngScIdStep04 = $("#mngScIdStep04").data("kendoExtDropDownList").value();
               $("#mngScId").data("kendoExtDropDownList").value(mngScIdStep04);
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var beforeMngScId = $("#beforeMngScId").val();
               var oldLeadStatCd = $("#oldLeadStatCd").val();

               var loginUsrId = "${loginUsrId}";
               var mngScIdCtrl = "${mngScIdCtrl}";

               // 책임자 확인
               if ( dms.string.isEmpty(mngScIdStep04)) {
                   dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                   return false;
               };

               if (mngScIdCtrl == "N") {
                   if (loginUsrId != mngScId) {
                    // 활성화 할 수 있는 권한이 없습니다. <br> 본인것만 가능합니다.
                       dms.notification.info("<spring:message code='crm.info.notAuthActive'/>");
                       return false;
                   }
               }

               if ((oldLeadStatCd != "04") && (oldLeadStatCd != "05")) {
                   // 이전 단계가 추적추진 단계가 아닙니다. <br> 이 단계로 진행 할 수 없습니다.
                   dms.notification.info("<spring:message code='crm.info.cannotThisStep'/>");
                   return false;
               }

               var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
               var holdTp = $("#holdTp").data("kendoExtDropDownList").value();

               // 비밀번호 체크 시작
               if (salesOpptPwYn == "Y"){

                   if ((beforeMngScId != '') && (mngScId != beforeMngScId )){
                       var usrPwGotoStep04 = $("#usrPwGotoStep04").val();
                       if (dms.string.isEmpty(usrPwGotoStep04)) {
                           dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                           return false;
                       }

                       var fnPasschk = fn_passwdChk(usrPwGotoStep04);
                       if (fnPasschk == false){
                           dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                           return false;
                       }
                   }

               }
               var validGradeCd = $("#validGradeCd").data("kendoExtDropDownList").value();

               if (validGradeCd != "02") {
                   // 유효성 판단을 먼저 진행해 주십시요.
                   dms.notification.info("<spring:message code='crm.info.validCheckRequired'/>");
                   return false;
               }

               if ( dms.string.isEmpty(infoTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               if ( dms.string.isEmpty(holdTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               // 고객번호
               if ( dms.string.isEmpty(custNo) ) {
                   dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
               };

               // 책임자 확인
               if ( dms.string.isEmpty(mngScId)) {
                   dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                   return false;
               };

               $("#leadStatCd").data("kendoExtDropDownList").value("04");
               $("#btnStepChange").click();
           }
       });

       $("#btnCtlRejectSign").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var beforeMngScId = $("#beforeMngScId").val();
               var leadStatCd = $("#oldLeadStatCd").val();

               var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
               var holdTp = $("#holdTp").data("kendoExtDropDownList").value();

               var mngScIdCtrl = "${mngScIdCtrl}";

               if (mngScIdCtrl == "N") {
                    // 권한이 없습니다.
                   dms.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                   return false;
               }

               if (leadStatCd != "02"
                   && leadStatCd != "04") {
                   dms.notification.info("<spring:message code='crm.info.cannotPrevStep' /> ");
                   return false;
               }

               var salesOpptProcParam = {};
               //salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
               //salesOpptProcParam["befLeadStatCd"] = $("#oldLeadStatCd").val();
               salesOpptProcParam["leadStatCd"] = leadStatCd;
               salesOpptProcParam["evalCd"] = "01";   // 심사대기(01), 불통과(02)
               salesOpptProcParam["seq"] = $("#salesOpptSeq").val();
               salesOpptProcParam["mngScId"] = mngScId;

               console.log("Saving of Request Info. Reject.. !!");
               console.log(salesOpptProcParam);

               $.ajax({
                   url:"<c:url value='/crm/cso/salesOpptProcessMgmt/updateSalesOpptProcessMgmt.do' />"
                   ,data:JSON.stringify(salesOpptProcParam)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error){
                       console.log("error !!!");
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   },
                   success:function(result){
                       console.log(result);
                       console.log("success!!!!");
                       dms.notification.success("<spring:message code='global.info.success'/>");

                       var data = [];
                       data.push(result);
                       var options = parent.editCustPopupWindow.options.content.data;
                       options.callbackFunc(data);
                       parent.editCustPopupWindow.close();
                   }
                   ,beforeSend:function(xhr) {
                      dms.loading.show();
                   }
                   ,complete:function(xhr, status) {
                      dms.loading.hide();
                   }
               }).done(function(result) {
                   console.log("Done!!!!");
               });

           }
       });

       $("#btnStepChange").click(function(){

//            var salesOpptProcParam = {};

            var salesOpptProcParam =
               $("#salesOpptProcForm").serializeObject(
                       $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
               );

            var befLeadStatCd = $("#befLeadStatCd").val();  //주의 실재 이전 단계가 아니라 지금 단계입니다. 서비스에서 단계 이력을 남기기 위한 용도임.
            salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
            salesOpptProcParam["befLeadStatCd"] = befLeadStatCd;
            salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
            salesOpptProcParam["seq"] = $("#salesOpptSeq").val();
            salesOpptProcParam["custNo"] = $("#custNo").val();
            salesOpptProcParam["evalCd"] = "01";   // 심사대기(01), 불통과(02)
            salesOpptProcParam["submitDt"] = new Date();

            if (befLeadStatCd == "09") {
                salesOpptProcParam["reviveOppt"] = "Y";
                salesOpptProcParam["reSetYn"] = "N";
            }

           console.log("Saving of Request Info. !!");
           console.log(salesOpptProcParam);

           $.ajax({
               url:"<c:url value='/crm/cso/salesOpptProcessMgmt/updateSalesOpptProcessMgmt.do' />"
               ,data:JSON.stringify(salesOpptProcParam)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,error:function(jqXHR,status,error){
                   console.log("error !!!");
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               },
               success:function(result){
                   console.log(result);
                   console.log("success!!!!");
                   dms.notification.success("<spring:message code='global.info.success'/>");

                   var data = [];
                   data.push(result);
                   var options = parent.editCustPopupWindow.options.content.data;
                   options.callbackFunc(data);
                   parent.editCustPopupWindow.close();
               }
               ,beforeSend:function(xhr) {
                  dms.loading.show();
               }
               ,complete:function(xhr, status) {
                  dms.loading.hide();
               }
           }).done(function(result) {
               console.log("Done!!!!");
           });
       });

       $("#nextChkDiv").kendoWindow({
           animation:false
           ,draggable:true
           ,modal:false
           ,resizable:false
           ,visible:false
           ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
           ,width:"300px"
           ,height:"70px"
       }).data("kendoWindow");

       $("#ctlFailSendBeforeDiv").kendoWindow({
           animation:false
           ,draggable:true
           ,modal:false
           ,resizable:false
           ,visible:false
           ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
           ,width:"300px"
           ,height:"105px"
       }).data("kendoWindow");

       $("#btnCtlNextStepBefore").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var beforeMngScId = $("#beforeMngScId").val();

               var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
               var holdTp = $("#holdTp").data("kendoExtDropDownList").value();

               if ( dms.string.isEmpty(infoTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               if ( dms.string.isEmpty(holdTp) ) {
                   dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   return false;
               };

               // 고객번호
               if ( dms.string.isEmpty(custNo) ) {
                   dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
               };

               // 책임자 확인
               if ( dms.string.isEmpty(mngScId)) {
                   dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                   return false;
               };

               // div 띄우기
               var checkPwDiv = $("#checkPwDiv").data("kendoWindow");
               checkPwDiv.center();
               checkPwDiv.open();

//                if ( mngScId != beforeMngScId ) {
//                } else {
//                    $("#btnNextStep").click();
//                }
           }
       });

       $("#checkPwDiv").kendoWindow({
           animation:false
           ,draggable:true
           ,modal:false
           ,resizable:false
           ,visible:false
           ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
           ,width:"300px"
           ,height:"105px"
       }).data("kendoWindow");

       // 다음 스탭으로 저장 버튼.
       $("#btnNextStep").kendoButton({
           click:function(e){
               console.log("btnNextStep Call !!");
               var custNo = $("#custNo").val();
               var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
               var custTp = $("#custTp").data("kendoExtDropDownList").value();

               // 고객번호
               if ( dms.string.isEmpty(custNo) ) {
                   dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                   return false;
               };

               // 책임자 확인
               if ( dms.string.isEmpty(mngScId)) {
                   dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                   return false;
               };

               var salesOpptProcParam =
                   $("#salesOpptProcForm").serializeObject(
                           $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
                   );

               var addrParam = {};

               var grid = $("#addrGrid").data("kendoExtGrid");
               var addrGridData = grid.getCUDData("insertList", "updateList", "deleteList");

               if (grid.cudDataLength > 0) {
                   $.each(addrGridData.insertList, function(idx, row){
                       if(row.addrTp == ""){
                          // 선택하지 않은 주소요형이 있습니다.
                          dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                          //dataValidate = true;
                          return false;
                       }
                   });
               }

               // enable data Assign
               salesOpptProcParam["leadStatCd"] = "02";
               salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
               salesOpptProcParam["custNm"] = $("#custNmSearch").val();
               salesOpptProcParam["vsitResvDt"] = $("#vsitResvDt").data("kendoExtMaskedDateTimePicker").value();
               salesOpptProcParam["submitDt"] = new Date();
               salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
               salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

               if (custTp == "02"){
                   salesOpptProcParam["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                   salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                   salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                   salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
                   salesOpptProcParam["wechatId"] = $("#wechatIdC").val();
                   salesOpptProcParam["custNm"] = $("#custNmSearchC").val();
               }

               if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };

               var saveData = $.extend(
                   {"salesOpptProcessMgmtVO":salesOpptProcParam }
                   , {"addressInfoVOList":addrGridData}
               );

               console.log("Saving of Request Info. !!");
               console.log(saveData);

               $.ajax({
                   url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
                   ,data:JSON.stringify(saveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error){
                       console.log("error !!!");
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   },
                   success:function(result){
                       console.log(result);
                       console.log("success!!!!");
                       dms.notification.success("<spring:message code='global.info.success'/>");

                       var data = [];
                       data.push(result);
                       options.callbackFunc(data);
                       parent.editCustPopupWindow.close();
                   }
                   ,beforeSend:function(xhr) {
                      dms.loading.show();
                   }
                   ,complete:function(xhr, status) {
                      dms.loading.hide();
                   }
               }).done(function(result) {
                   console.log("Done!!!!");
               });

           }
       });

        // 닫기 버튼.
        $("#btnCtlCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.editCustPopupWindow.close();
            }
        });

        $("#btnCheckPwd").kendoButton({
            click:function(e) {
				var usrPw = hex_sha2($("#usrPw").val());

                if (dms.string.isEmpty($("#usrPw").val())) {
                    dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                    return false;
                }

                var pwParam = {};

                pwParam["sPassword"] = usrPw;

                console.log("pwParam !!! ");
                console.log(pwParam);

                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
                    ,data:JSON.stringify(pwParam)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        console.log("error !!!");
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                    // success:function(jqXHR, textStatus) {
                        console.log(result);
                        console.log("btnCheckPwd success!!!!");

                        if (result === true) {
                            //dms.notification.success("<spring:message code='global.info.success'/>");
                            var checkPwDiv = $("#checkPwDiv").data("kendoWindow");
                            checkPwDiv.close();

                            //$("#btnNextStep").click();
                            $("#btnStepChange").click();
                        } else {
                            dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                        }
                    }
                });

            }
        });

        $("#btnMngScSet").kendoButton({
            click:function(e) {

                var usersRoleCrmR03 = $("#usersRoleCrmR03").data("kendoExtDropDownList").value();

                if (dms.string.isEmpty(usersRoleCrmR03)) {
                    dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                    return false;
                }

                // 비밀번호 체크 시작
                if (salesOpptPwYn == "Y"){

                    var mngScId = $("#usersRoleCrmR03").data("kendoExtDropDownList").value();
                    var beforeMngScId = $("#beforeMngScId").val();

                    if ((beforeMngScId != '') && (mngScId != beforeMngScId )){
                        var usrPw = $("#usrPw").val();
                        if (dms.string.isEmpty(usrPw)) {
                            dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                            return false;
                        }

                        var fnPasschk = fn_passwdChk(usrPw);
                        if (fnPasschk == false){
                            dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                            return false;
                        }
                    }

                }

                $("#mngScId").data("kendoExtDropDownList").value(usersRoleCrmR03);

                $("#btnStepChange").click();
            }
        });

        $("#salesOpptSeq").val(options.salesOpptSeq);

        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }

        if ( options.leadStatCd == "08" )  {
            $("#btnCtlGotoStep01").addClass("hidden");
            $("#btnCtlGotoStep02").addClass("hidden");
            $("#btnCtlRejectSign").addClass("hidden");
        }

    });

    function fn_passwdChk(pwd){
        // 비밀 번호 체크 시작
        var usrPw = hex_sha2(pwd);

//         if (dms.string.isEmpty(pwd)) {
//             dms.notification.info("<spring:message code='crm.info.emptyPw' />");
//             return false;
//         }

        var pwParam = {};

        pwParam["sPassword"] = usrPw;

        console.log("pwParam !!! ");
        console.log(pwParam);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
            ,data:JSON.stringify(pwParam)
            ,async:false
        });

        return responseJson;
    }

 </script>


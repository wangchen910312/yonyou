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
                    <button type="button" id="btnCtlPrevStepBefore" class="btn_m btn_prev custInfoTab"><spring:message code="crm.lbl.activeAppointmentSend" /><!-- 추출예약으로 전달 --></button>
                    <button type="button" id="btnCtlNextStepBefore" class="btn_m btn_next custInfoTab"><spring:message code="crm.btn.activeProcessSend" /><!-- 추적|추진으로 제출 --></button>
                    <button type="button" id="btnCtlSearchTrace" style="display:none;" class="btn_m"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    <button type="button" id="btnCtlSearchLeadHist" style="display:none;" class="btn_m"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    <button type="button" id="btnCtlSaveBefore" class="btn_m custInfoTab"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    <button type="button" id="btnCtlSave" style="display:none;" class="btn_m "></button>
                    <button type="button" id="btnCtlKeyPadCall" class="btn_m activeAddTab" style="display:none;"><spring:message code="crm.btn.OBcall" /><!-- 전화걸기 --></button>
                    <button type="button" id="btnCtlSaveTrace" class="btn_m activeAddTab" style="display:none;"><spring:message code="crm.btn.activeSave" /><!-- 추적 저장 --></button>
                    <button type="button" id="btnCtlCancel" class="btn_m btn_Cancel custInfoTab activeHistoryTab activeAddTab leadStatusExchangeTab historyRecordTab"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
            </span>
            <div id="custInfoTabDiv" class="mt0"> <!-- custInfoTabDiv Start -->
                <div class="header_area"> <!-- 조회 조건 타이틀 시작 -->
                    <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2> <!-- 기본정보 -->
                    <div class="btn_right">
                        <button type="button" id="btnDetailCust" class="btn_xs"><spring:message code='crm.btn.custDetail' /></button>
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
                    </div> <!-- leadStatusExchangeTabDiv End -->
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
                                <th scope="row"><spring:message code="crm.lbl.visitDt" /></th> <!-- //  방문시간  -->
                                <td colspan="2">
                                    <input id="vsitDt" name="vsitDt" class="form_datetimepicker" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.visitCount" /></th> <!-- //  방문인원수  -->
                                <td >
                                    <input id="vsitPrsnCnt" name="vsitPrsnCnt" type="number" class="form_numeric ar" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.revisitYn" /></th> <!-- //  재방문여부  -->
                                <td >
<!--                                     <label class="label_check ml5"><input id="rvsitYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /></label> -->
                                    <ul class="tabmenu">
                                        <li id="rvsitYn01" class="on"><button type="button"><spring:message code='crm.lbl.firstVist' /></button></li>                <!-- 첫방문 -->
                                        <li id="rvsitYn02"><button type="button"><spring:message code='crm.lbl.vistAgain' /></button></li>       <!-- 재방문 -->
                                        <li id="rvsitYn03"><button type="button"><spring:message code='crm.lbl.visitEtc' /></button></li>       <!-- 기타 -->
                                    </ul>
                                    <input id="rvsitYn" name="rvsitYn" type="hidden" class="form_index" value="01" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td colspan="2">
                                    <input id="nextChkDivUsrPw" name="nextChkDivUsrPw" type="password" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** nextChkDiv **************************** -->
<!--  ************************** prevChkDiv **************************** -->
        <section id="prevChkDiv" class="pop_wrap"> <!-- prevChkDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnPrevSubmit" class="btn_m"><spring:message code="crm.btn.submit" /><!-- 제출 --></button>
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
                                <th scope="row" class="al"><spring:message code='global.lbl.handler' /><!-- 조작인 --></th>
                                <td>
                                    ${loginUsrNm} (${loginUsrId})
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="al"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td>
                                    <input id="preChkDivUsrPw" name="preChkDivUsrPw" type="password" class="form_input"  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** prevChkDiv **************************** -->

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

     var failedCdList = [];

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

     <c:forEach var="obj" items="${failedCdList}">
     failedCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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

    $(document).ready(function() {

        //방문인원수
        $("#vsitPrsnCnt").kendoExtNumericTextBox({
            decimals:0
            ,format:"n0"
            ,min:1
            ,max:99
        });

        $("#vsitDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            , minTime:"08:00"
            , maxTime:"24:00"
        });
        $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(new Date());

//         $("#vsitEndDt").kendoExtMaskedDateTimePicker({
//             format:"<dms:configValue code='dateFormat' /> HH:mm"
//             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//, minTime:"08:00"
//, maxTime:"24:00"
//         });

        $("#vsitDt").dblclick(function(){
            $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(new Date());
        });

//         $("#vsitEndDt").dblclick(function(){
//             $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(new Date());
//         });

//         $("#validGradeCd").kendoExtDropDownList({
//             dataTextField:"cmmCdNm"
//             , dataValueField:"cmmCd"
//             , optionLabel:" "
//             , dataSource:dms.data.cmmCdFilter(validGradeCdList)
//             , index:0
//         });

        $("#failCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:dms.data.cmmCdFilter(failedCdList)
            , index:0
        });


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

       if (options.leadStatCd == "02"){
           $(".btnStep02").show();
       }

       $("#btnDetailCust").kendoButton({
           click:function(e) {
               var custNo = $("#custNo").val();
               window.parent.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+custNo, "VIEW-D-10272"); // CUST NO
           }
       });

       $("#btnFrameRefresh").click(function(){
           $("#btnCustSearch").click();
       });

       // 첫방문
       $("#rvsitYn01").click(function(){
          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#rvsitYn").val("01");
       });

       // 재방문
       $("#rvsitYn02").click(function(){
          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#rvsitYn").val("02");
       });

       // 기타
       $("#rvsitYn03").click(function(){
          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#rvsitYn").val("03");
       });

       $("#btnCtlPrevStepBefore").kendoButton({
           click:function(e) {
            // div 띄우기
               //var prevChkDiv = $("#prevChkDiv").data("kendoWindow");
               //prevChkDiv.center();
               //prevChkDiv.open();

               // 비밀번호 체크 시작
               if (salesOpptPwYn == "Y"){

                   var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                   var beforeMngScId = $("#beforeMngScId").val();

                   if ((beforeMngScId != '') && (mngScId != beforeMngScId )){
                     var prevChkDiv = $("#prevChkDiv").data("kendoWindow");
                     prevChkDiv.center();
                     prevChkDiv.open();
                   } else {
                       $("#btnPrevSubmit").click();
                   }
               } else {
                   $("#btnPrevSubmit").click();
               }
           }
       });
       $("#btnCtlNextStepBefore").kendoButton({
           click:function(e) {
               // div 띄우기
               var nextChkDiv = $("#nextChkDiv").data("kendoWindow");
               nextChkDiv.center();
               nextChkDiv.open();

               // 비밀번호 체크 시작
               if (salesOpptPwYn == "Y"){

                   var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                   var beforeMngScId = $("#beforeMngScId").val();

                   if ((beforeMngScId != '') && (mngScId != beforeMngScId )){
                       $("#nextChkDivUsrPw").attr("readonly", false);
                       $("#nextChkDivUsrPw").removeClass("form_readonly");
                   } else {
                       $("#nextChkDivUsrPw").attr("readonly", true);
                       $("#nextChkDivUsrPw").addClass("form_readonly");
                   }
               }

               $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(new Date());

           }
       });

       $("#prevChkDiv").kendoWindow({
           animation:false
           ,draggable:true
           ,modal:false
           ,resizable:false
           ,visible:false
           ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
           ,width:"300px"
           ,height:"110px"
       }).data("kendoWindow");

       $("#nextChkDiv").kendoWindow({
           animation:false
           ,draggable:true
           ,modal:false
           ,resizable:false
           ,visible:false
           ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
           ,width:"300px"
           ,height:"170px"
       }).data("kendoWindow");

        // 닫기 버튼.
        $("#btnCtlCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.editCustPopupWindow.close();
            }
        });

        $("#btnPrevSubmit").kendoButton({
            click:function(e) {
                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var beforeMngScId = $("#beforeMngScId").val();
                var custTp = $("#custTp").data("kendoExtDropDownList").value();

                var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                var holdTp = $("#holdTp").data("kendoExtDropDownList").value();

                // 비밀번호 체크 시작
                if (salesOpptPwYn == "Y"){

                    if ((beforeMngScId != '') && (mngScId != beforeMngScId )){
                        var preChkDivUsrPw = $("#preChkDivUsrPw").val();
                        if (dms.string.isEmpty(preChkDivUsrPw)) {
                            dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                            return false;
                        }

                        var fnPasschk = fn_passwdChk(preChkDivUsrPw);
                        if (fnPasschk == false){
                            dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                            return false;
                        }
                    }

                }

                // 고객번호
                if ( dms.string.isEmpty(custNo) ) {
                    dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                if ( dms.string.isEmpty(infoTp) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if ( dms.string.isEmpty(holdTp) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
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
                salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
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
        $("#btnNextSubmit").kendoButton({
            click:function(e) {

                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var beforeMngScId = $("#beforeMngScId").val();
                var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
                var custTp = $("#custTp").data("kendoExtDropDownList").value();
                var vsitPrsnCnt = $("#vsitPrsnCnt").data("kendoExtNumericTextBox").value();

                // 비밀번호 체크 시작
                if (salesOpptPwYn == "Y"){

                    if ((beforeMngScId != '') && (mngScId != beforeMngScId )){
                        var nextChkDivUsrPw = $("#nextChkDivUsrPw").val();
                        if (dms.string.isEmpty(nextChkDivUsrPw)) {
                            dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                            return false;
                        }

                        var fnPasschk = fn_passwdChk(nextChkDivUsrPw);
                        if (fnPasschk == false){
                            dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                            return false;
                        }
                    }

                }

                if ( dms.string.isEmpty(vsitPrsnCnt) ) {
                    vsitPrsnCnt = 1;
                };

                // 고객번호
                if ( dms.string.isEmpty(custNo) ) {
                    dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // 방문시간
                if ( dms.string.isEmpty(vsitDt)) {
                    dms.notification.info("<spring:message code='crm.lbl.visitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                    return false;
                };

                if ( dms.string.isEmpty(infoTp) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if ( dms.string.isEmpty(holdTp) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if ( dms.string.isEmpty(mngScId) ) {
                    dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
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
                salesOpptProcParam["leadStatCd"] = "04";
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["vsitDt"] = vsitDt;
                salesOpptProcParam["vsitPrsnCnt"] = vsitPrsnCnt;
                //salesOpptProcParam["vsitEndDt"] = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                salesOpptProcParam["submitDt"] = new Date();
                salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
                salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();
                salesOpptProcParam["rvsitYn"] = $("#rvsitYn").val();

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

        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }
    });

    function fn_passwdChk(pwd){
        // 비밀번호 체크 시작
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


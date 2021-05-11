<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
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
                    <button type="button" id="btnCtlSearchTrace" style="display:none;" class="btn_m"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    <button type="button" id="btnCtlSearchLeadHist" style="display:none;" class="btn_m"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    <button type="button" id="btnCtlSave" class="btn_m custInfoTab"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    <button type="button" id="btnCtlKeyPadCall" class="btn_m activeAddTab" style="display:none;"><spring:message code="crm.btn.OBcall" /><!-- 전화걸기 --></button>
                    <button type="button" id="btnCtlSaveTrace" class="btn_m activeAddTab" style="display:none;"><spring:message code="crm.btn.activeSave" /><!-- 추적 저장 --></button>
                    <button type="button" id="btnCtlCancel" class="btn_m btn_Cancel custInfoTab activeHistoryTab activeAddTab leadStatusExchangeTab historyRecordTab"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
            </span>
            <div id="custInfoTabDiv" class="mt0"> <!-- custInfoTabDiv Start -->
                <div class="header_area"> <!-- 조회 조건 타이틀 시작 -->
                    <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2> <!-- 기본정보 -->
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
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">

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

    $(document).ready(function() {

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
        $("#tab_area_main").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var callUrl;
                console.log(selectTabId);

                $("[id^=btnCtl]").hide();
                $("[class*="+selectTabId+"]").show();

                if (selectTabId == "historyRecordTab") {
                    $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
                    var tabSubStrip = $("#tab_area_sub").kendoExtTabStrip().data("kendoExtTabStrip");
                    tabSubStrip.select(0);
                } else if (selectTabId == "activeAddTab") {
                    $("#btnCustSearchR").click();
                }

            }
        });

        var tabStrip = $("#tab_area_main").kendoExtTabStrip().data("kendoExtTabStrip");
        tabStrip.select(0);

       var options = parent.editCustPopupWindow.options.content.data;

       $("#leadStatCd").data("kendoExtDropDownList").value(options.leadStatCd);

       if (options.leadStatCd == "02"){
           $(".btnStep02").show();
       }
       if ( options.leadStatCd =="05"|| options.leadStatCd =="06") {
           $("#btnCtlSave").data("kendoButton").enable(false);
           $("#btnCtlSaveTrace").data("kendoButton").enable(false);
       }

       // 닫기 버튼.
        $("#btnCtlCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.editCustPopupWindow.close();
            }
        });

        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }
    });


 </script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">

        <!-- 탭메뉴 전체 영역 -->
        <div> <!-- 탭메뉴 시작-->
            <div class="header_area">
                <span class="btn_right">
                        <button type="button" id="btnNextStepBefore" class="btn_m"><spring:message code="crm.btn.activeProcessSend" /><!-- 추적|추진으로 제출 --></button>
                        <button type="button" id="btnCtlSave" class="btn_m"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                        <button type="button" id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
                        <input type="hidden" id="btnNextStep" />
                        <input type="hidden" id="dataTable" />
                </span>
            </div>
            <div id="custInfoTabDiv"> <!-- custInfoTabDiv Start -->
                    <!-- 조회 조건 타이틀 시작 -->
                    <div id="dataTable" class="table_form form_width_100per mt5"> <!-- 기본정보 시작-->
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
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.visitDt" /></span></th> <!-- //  방문시간  -->
                                    <td colspan="2">
                                        <input id="vsitDt" name="vsitDt" class="form_datetimepicker" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.visitCount" /></th> <!-- //  방문인원수  -->
                                    <td >
                                        <input id="vsitPrsnCnt" name="vsitPrsnCnt" class="form_input numberic" maxlength="2" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.goOutTime" /></th> <!-- //  떠난시간  -->
                                    <td colspan="2">
                                        <input id="vsitEndDt" name="vsitEndDt" class="form_datetimepicker" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.revisitYn" /></th> <!-- //  재방문여부  -->
                                    <td colspan="2">
                                        <ul class="tabmenu">
                                            <li id="rvsitYn01" class="on"><button type="button"><spring:message code='crm.lbl.firstVist' /></button></li>                <!-- 첫방문 -->
                                            <li id="rvsitYn02"><button type="button"><spring:message code='crm.lbl.vistAgain' /></button></li>       <!-- 재방문 -->
                                            <li id="rvsitYn03"><button type="button"><spring:message code='crm.lbl.visitEtc' /></button></li>       <!-- 기타 -->
                                        </ul>
                                        <input id="rvsitYn" name="rvsitYn" type="hidden" class="form_index" value="01" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.tdrvYn" /></th> <!-- //  시승여부  -->
                                    <td >
                                        <label class="label_check ml5"><input id="testDrvYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /></label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- 기본정보 끝-->
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2> <!-- 기본정보 -->
                    </div>
                    <!--  salesOpptProcForm Start -->
                    <jsp:include page="/WEB-INF/jsp/crm/cso/salesOpptProcessMgmt/selectIncludeSalesOpptShowRoom.jsp"></jsp:include>
                    <!--  salesOpptProcForm End -->
            </div> <!-- custInfoTabDiv End -->
        </div><!-- //탭메뉴 끝-->

    </section>
    <!-- //그룹선택 팝업 -->

<!--  ************************** checkPwDiv **************************** -->
        <section id="checkPwDiv" class="pop_wrap"> <!-- checkPwDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnCheckPwd" class="btn_m"><spring:message code="crm.btn.submit" /><!-- 제출 --></button>
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
                                    <input id="usrPw" name="usrPw" type="password" class="form_input"  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** checkPwDiv **************************** -->

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
     var activeGradeCdList = [];
     var activeGradeCdMap = [];

     var custTpList = [];
     var custTpMap = [];
     var infoTpList = [];
     var payTpList = [];
     var expcPurcHmCdList = [];

     var bizcondCdList   = [];
     var mathDocTpList = [];

     <c:forEach var="obj" items="${mathDocTpList}">
        <c:if test="${obj.remark1 == 'C'}">
            mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
     </c:forEach>
     <c:forEach var="obj" items="${bizcondCdList}">
        bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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

     <c:forEach var="obj" items="${activeGradeCdList}">
         activeGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

        $("#vsitDt").kendoExtMaskedDateTimePicker({
            value:kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateTimeFormat' />")
            ,format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,minTime:"08:00"
            ,maxTime:"24:00"
            ,interval:1
            ,change:function() {
                var value = this.value();
                var vsitEndDt = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();
                if ((!dms.string.isEmpty(vsitEndDt)) && vsitEndDt < value){
                   dms.notification.warning("<spring:message code='crm.lbl.goOutTime' var='returnMsg' /><spring:message code='crm.lbl.visitDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
                   this.value(null);
                }
             }
        });
        //$("#vsitDt").data("kendoExtMaskedDateTimePicker").value("${sysDate}");

        $("#vsitEndDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,minTime:"08:00"
            ,maxTime:"24:00"
            ,interval:1
            ,change:function() {
                var value = this.value();
                var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                if (vsitDt > value){
                   dms.notification.warning("<spring:message code='crm.lbl.goOutTime' var='returnMsg' /><spring:message code='crm.lbl.visitDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
                   this.value(null);
                }
             }
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

        $("#vsitEndDt").focusout(function(){
            var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
            var vsitEndDt = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();
        });

        $("#vsitEndDt").dblclick(function(){
            $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(new Date());
            var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
            var vsitEndDt = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();
            if (vsitEndDt < vsitDt){
               dms.notification.warning("<spring:message code='crm.lbl.goOutTime' var='returnMsg' /><spring:message code='crm.lbl.visitDt' var='returnMsg2' /><spring:message code='crm.lbl.dateTimeValid' arguments='${returnMsg},${returnMsg2}' />");
               $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(' ');
            }
        });

       var options = parent.editCustPopupWindow.options.content.data;

       $("#leadStatCd").val(options.leadStatCd);
       $("#dataTable").val(options.dataTable);

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.editCustPopupWindow.close();
            }
        });

        $("#btnNextStepBefore").kendoButton({
            click:function(e) {
                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var beforeMngScId = $("#beforeMngScId").val();
                var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
                var hpNo = $("#hpNo").val();
                var officeTelNo = $("#officeTelNoC").val();
                var custTp = $("#custTp").data("kendoExtDropDownList").value();
                var custNm = $("#custNmSearch").val();
                var custNmC = $("#custNmSearchC").val();
                var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

                // 법인연계인 (구매담당자)
                var relCustNm = $("#relCustNm").val();
                var relCustHpNo = $("#relCustHpNo").val();

                // 고객명
                if ( dms.string.isEmpty(custNm) && dms.string.isEmpty(custNmC)) {
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

                if ( dms.string.isEmpty(intrCarlineCd) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if (custTp =="01") {
                    if ( dms.string.isEmpty(hpNo) ) {
                        dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };

                    // 전화번호
                    if (hpNo.length <= 10) {
                        dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
                        $("#hpNo").focus();
                        return false;
                     }
                } else {
//                     if ( dms.string.isEmpty(officeTelNo) ) {
//                         dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                         return false;
//                     };
                    if ( dms.string.isEmpty(relCustNm) ) {
                        dms.notification.warning("<spring:message code='crm.lbl.corpPurcMng' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(relCustHpNo) ) {
                        dms.notification.warning("<spring:message code='crm.lbl.corpPurcMngHpno' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };

                }

                // 담당자
                if ( dms.string.isEmpty(mngScId) ) {
                    dms.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // div 띄우기
                if (salesOpptPwYn == "Y"){
                    var checkPwDiv = $("#checkPwDiv").data("kendoWindow");
                    checkPwDiv.center();
                    checkPwDiv.open();
                } else {
                    // 추적추진으로 제출
                    $("#btnNextStep").click();
                }
            }
        });

        $("#checkPwDiv").kendoWindow({
            animation:true
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
            ,width:"300px"
            ,height:"105px"
        }).data("kendoWindow");

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

                var checkPwDiv = $("#checkPwDiv").data("kendoWindow");
                checkPwDiv.close();

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
                        console.log(result);
                        console.log("btnCheckPwd success!!!!");

                        if (result === true) {
                            $("#btnNextStep").click();
                        } else {
                            dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                        }
                    }
/*                     ,beforeSend:function(xhr) {
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    } */
                });

            }
        });

        // 다음 스탭으로 저장 버튼.
        $("#btnNextStep").kendoButton({
            click:function(e){
                console.log("btnNextStep Call !!");
                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var custTp = $("#custTp").data("kendoExtDropDownList").value();

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

                // enable data Assign kjlee
                salesOpptProcParam["leadStatCd"] = "04";
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["vsitDt"] = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptProcParam["vsitEndDt"] = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptProcParam["vsitPrsnCnt"] = $("#vsitPrsnCnt").val();
                salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                salesOpptProcParam["rvsitYn"] = $("#rvsitYn").val();
                salesOpptProcParam["leadStartDt"] = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateTimeFormat' />");
                salesOpptProcParam["infoTp"] = $("#infoTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["wechatId"] = $("#wechatId").val();
                salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();

                if (custTp == "02"){
                    salesOpptProcParam["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                    salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                    salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                    //salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
//                     salesOpptProcParam["wechatId"] = $("#wechatIdC").val();
                    salesOpptProcParam["custNm"] = $("#custNmSearchC").val();
                    salesOpptProcParam["purcMngNm"] = $("#relCustNm").val();
                    salesOpptProcParam["hpNo"] = $("#relCustHpNo").val();
                    salesOpptProcParam["infoTp"] = $("#infoTp").data("kendoExtDropDownList").value();
                }

                if ($("#testDrvYn").prop("checked")){ salesOpptProcParam["testDrvYn"] = "Y" } else { salesOpptProcParam["testDrvYn"] = "N" };
                if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };

                var saveData = $.extend(
                    {"salesOpptShowRoomMgmtVO":salesOpptProcParam }
                    , {"addressInfoVOList":addrGridData}
                );

                console.log("Saving of Request Info. !!");
                console.log(saveData);

                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptShowRoom.do' />"    // multiSalesOpptShowRoomMgmts
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

        // 저장 버튼.
        $("#btnSave").kendoButton({
            click:function(e){

                if (options.dataTable != "SHOWROOM"){  //전시장유입에서 수정하는 경우
                    var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                    // 방문시간
                    if ( dms.string.isEmpty(vsitDt)) {
                        dms.notification.info("<spring:message code='crm.lbl.visitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                        return false;
                    };

                }

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

                var custTp = $("#custTp").data("kendoExtDropDownList").value();

                // enable data Assign
                salesOpptProcParam["leadStatCd"] = "99";
                salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                salesOpptProcParam["custNm"] = $("#custNmSearch").val();
                salesOpptProcParam["vsitDt"] = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptProcParam["vsitEndDt"] = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();
                salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
                salesOpptProcParam["rvsitYn"] = $("#rvsitYn").val();
                salesOpptProcParam["wechatId"] = $("#wechatId").val();

                if (custTp == "02"){
                    salesOpptProcParam["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
                    salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
                    salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
                    salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
//                     salesOpptProcParam["wechatId"] = $("#wechatIdC").val();
                    salesOpptProcParam["custNm"] = $("#custNmSearchC").val();
                }

                if ($("#testDrvYn").prop("checked")){ salesOpptProcParam["testDrvYn"] = "Y" } else { salesOpptProcParam["testDrvYn"] = "N" };

                var saveData = $.extend(
                    {"salesOpptShowRoomMgmtVO":salesOpptProcParam }
                    , {"addressInfoVOList":addrGridData}
                );

                console.log("Saving of Request Info. !!");
                console.log(saveData);

                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptShowRoom.do' />"
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
                }).done(function(result) {
                    console.log("Done!!!!");
                });
            }
        });

        if (options.autoBind) {
            $("#seq").val(options.showRoomSeq);
            $("#btnCustSearch").click();
        }

//         if (options.dataTable == "SHOWROOM"){
//             $("#btnNextStepBefore").hide();
//             $("#dataTable").hide();
//         }

    });

    //현재 시간로직
    function currentDt(){
        var Now = new Date();

        var NowTime = Now.getFullYear();
        NowTime += '-' + Now.getMonth() + 1 ;
        NowTime += '-' + Now.getDate();
        NowTime += ' ' + Now.getHours();
        NowTime += ':' + Now.getMinutes();
        NowTime += ':' + Now.getSeconds();

        return NowTime;
    }


 </script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">
            <!-- 리드 판매 -->
            <section class="group">
                <div class="header_area">
                    <%-- <h1 class="title_basic"><spring:message code='crm.lbl.displayAll' /><!-- 리드/판매기회관리 --></h1> --%>
                    <div class="btn_left" id="stepDiv">
                       <dms:access viewId="VIEW-D-10317" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                        <ul class="tabmenu3 tabmenu3_v1"> <!-- class="tabmenu3 tabmenu3_v1" -->
                            <li id="btnStep00"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep00');" ><spring:message code='crm.lbl.displayAll' /><!-- 전부표시 全部?示--></a></li>
                        </ul>
                       </dms:access>
                        <ul class="tabmenu3">
                        <dms:access viewId="VIEW-D-10318" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                            <li id="btnStep01"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep01');" ><spring:message code='crm.lbl.uploadAdd' /><!-- 업로드|집객 --></a></li>
                        </dms:access>
                        <dms:access viewId="VIEW-D-10322" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                            <li id="btnStep02"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep02');" ><spring:message code='crm.lbl.activeAppointment' /><!-- 추출|예약 --></a></li>
                        </dms:access>
                        <dms:access viewId="VIEW-D-10320" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                            <li id="btnStep03"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep03');" ><spring:message code='crm.lbl.visitCounsel' /><!-- 방문|면담 到店|洽? --></a></li>
                        </dms:access>
                        <dms:access viewId="VIEW-D-10321" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                            <li id="btnStep04"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep04');" ><spring:message code='crm.lbl.activeProcessing' /><!-- 추적|추진  ?踪|促成 --></a></li>
                        </dms:access>
                        </ul>
                        <dms:access viewId="VIEW-D-10319" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                        <ul class="tabmenu3 tabmenu3_v1">
                            <li id="btnStep99"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep99');" ><spring:message code='crm.lbl.visitCustMng' /><!-- 전시장 흐름 展?流量 --></a></li>
                        </ul>
                        </dms:access>
                    </div>
                    <div class="btn_right">
                        <!-- <button type="button" id="btnMessage" class="btn_m">信息</button> -->
                        <dms:access viewId="VIEW-D-11080" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlCall" class="btn_m btn_call"><spring:message code='global.btn.callSend' /><!-- 전화걸기 打??--></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11081" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlBigDataEx" class="btn_m"><spring:message code='crm.btn.bigDataExchange' /><!-- 대량전환 批量移交--></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11082" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlAssign" class="btn_m btn_assignment btnStep01"><spring:message code='global.btn.assign' /><!-- 배정 分配--></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11083" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlFailSend" class="btn_m btn_assignment btnStep04"><spring:message code="crm.btn.trans" /><!-- 전출 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11084" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlSearch" class="btn_m btn_search btnStep00 btnStep01 btnStep02 btnStep03 btnStep99 btnStep04"><spring:message code='global.btn.search' /><!-- 조회 ??--></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11085" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlNew" class="btn_m btn_new btnStep01 btnStep99"><spring:message code='global.btn.new' /><!-- 신규 新建--></button>
                        </dms:access>
                            <!-- <button type="button" id="btnCtlAdd" class="btn_m btn_new btnStep03 btnStep99"><spring:message code='global.btn.new' /></button> --> <!-- 추가 添加  신규로 레벨 변경 -->
                            <!-- <button type="button" class="btn_m btn_save">保存</button> -->
                        <dms:access viewId="VIEW-D-11086" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlUpdate" class="btn_m btn_modify btnStep00 btnStep01 btnStep02 btnStep03 btnStep04"><spring:message code='global.btn.update' /><!-- 수정 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11087" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlUpdateShowRoom" class="btn_m btn_modify btnStep99"><spring:message code='global.btn.update' /><!-- 수정 --></button>
                        </dms:access>
                            <!-- <button type="button" id="btnCtlDelete" class="btn_m btn_delete btnStep00 btnStep01 btnStep02 btnStep03 btnStep99 btnStep04"><spring:message code='global.btn.del' /></button> --> <!-- 삭제 ?除-->
                        <dms:access viewId="VIEW-D-11088" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlExcelImport" class="btn_m btn_excel btnStep01"><spring:message code='global.btn.excelImport' /><!-- 업로드 上?--></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11089" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlExcelExport" class="btn_m btn_excel btnStep00 btnStep99"><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11090" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlPrint" class="btn_m btn_excel"><spring:message code='global.btn.print' /><!-- 인쇄 --></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnCtlSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:23%;">
                            <col>
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.customer' /></th> <!-- 고객 客?-->
                                <td>
                                    <input type="text" id="sCust" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnCtlSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th> <!-- 고객명 客?名-->
                                <td>
                                    <input type="text" id="sCustNm" value="" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th> <!-- 이동전화 移???-->
                                <td>
                                    <input type="text" id="sHpNo" value="" class="form_input numberic" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.infoType' /></th> <!-- 리드유형 -->
                                <td>
                                    <input type="text" id="sInfoTp" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.approchLocation' /></th>  <!-- 정보경로 ?索?源-->
                                <td>
                                    <input type="text" id="sHoldTp" value="" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.leadStat' /></th> <!-- 리드상태  ?索?? -->
                                <td>
                                    <input type="text" id="sLeadStatCd" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.activeGrade' /></th> <!-- 추적등급 ?踪等? -->
                                <td>
                                    <input type="text" id="sTraceGradeCd" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.intentionCarline' /></th> <!-- 의향차종  意向?? -->
                                <td>
                                    <input type="text" id="sIntrCarlineCd" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.intentionVariant' /></th> <!-- 의향차관 -->
                                <td>
                                    <input type="text" id="sIntrFscpModtpCd" value="" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.prsNm' /></th> <!-- 담당자 ??-->
                                <td>
                                    <input type="text" id="sMngScId" value="" class="form_comboBox" />
                                </td>
                                <th scope="row" class="srItem"><spring:message code='crm.lbl.submitDt' /></th> <!-- 제출일-->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sSubmitDtFrom" name="sSubmitDtFrom" class="form_datepicker" data-type="maskDate"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sSubmitDtTo" name="sSubmitDtTo" class="form_datepicker" data-type="maskDate"/>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row" class="srHide"><spring:message code='global.lbl.newRegDt' /></th> <!-- 신규날짜-->
                                <td class="srHide">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" data-type="maskDate"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRegDtTo" name="sRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <input type="text" id="sCustNo" name="sCustNo" value="" class="form_input"  />
                                </td>
<%--                                 <th scope="row" class="srHide"><spring:message code='crm.lbl.startDt' /></th> <!-- 시작일자--> --%>
<!--                                 <td class="srHide"> -->
<!--                                     <div class="form_float"> -->
<!--                                         <div class="date_left"> -->
<!--                                             <input id="sLeadStartDtFrom" name="sLeadStartDtFrom" class="form_datepicker" data-type="maskDate"/> -->
<!--                                             <span class="txt_from">~</span> -->
<!--                                         </div> -->
<!--                                         <div class="date_right"> -->
<!--                                             <input id="sLeadStartDtTo" name="sLeadStartDtTo" class="form_datepicker" data-type="maskDate"/> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </td> -->
<%--                                 <th scope="row" class="srHide"><spring:message code='crm.lbl.bhmcLeadyn' /></th> <!-- BHMC 리드 여부  是否? BHMC?索 --> --%>
<!--                                 <td class="srHide"> -->
<!--                                     <input type="text" id="sBhmcYn" value="" class="form_comboBox" /> -->
<!--                                 </td> -->
                                <th scope="row" class="onlyShowRoomShow"><spring:message code='crm.lbl.tdrvYn' /></th> <!-- 시승 여부 是否试驾-->
                                <td class="onlyShowRoomShow">
                                    <input type="text" id="sTestDrvYn" value="" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.channelType' /></th> <!-- 판매채널 -->
                                <td>
                                    <input type="text" id="sDstbChnCd" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.purposeTag' /></th> <!-- 판매채널 -->
                                <td>
                                    <input type="text" id="sPurposeTag" value="" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10" id="salesOpptProgGridArea">
                    <div id="salesOpptProgGrid" class="resizable_grid"></div>
                </div>
                <div class="table_grid mt10" id="salesOpptShowRoomGridArea" style="display:none;">
                    <div id="salesOpptShowRoomGrid"></div>
                </div>
                <input type="hidden" id="leadStatCd" value="" />
                <input type="hidden" id="leadStatIng" value="" />
                <input type="hidden" id="callAddrPopup" />
                <input type="hidden" id="callAddrPopupParam" />
                <input type="hidden" id="bfStep" value="" />
            </section>
        </div>
<!--  ************************** assignDiv **************************** -->
        <section id="assignDiv" class="pop_wrap"> <!-- assignDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnAssign" class="btn_s"><spring:message code='global.btn.assign' /><!-- 배정 --></button>
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
                                <th scope="row" class="al"><spring:message code='crm.lbl.prsNm' /><!-- 담당자 --></th>
                                <td>
                                    <select id="assignUsers" name="assignUsers" multiple="multiple" data-bind="value: values"></select>
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
<!--  ************************** assignDiv **************************** -->

<script type="text/javascript">

    var custNo          = "${custNo}";
    var leadStatCd          = "${leadStatCd}";
    var salesOpptPwYn          = "${salesOpptPwYn}";
    var toDt            = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateFormat' />");
    var excelUploadPopupWin;

    var year = toDt.getFullYear();
    var month = toDt.getMonth()+1;
    var twoMthAgo = (toDt.getMonth()+1) -3;
    var day = toDt.getDate();

    var addrTpList = [];
    var addrTpMap = [];
    var yesOrNoList = [];
    var yesOrNoMap = [];
    var carlineCdList = [];
    var carlineCdMap = [];
    var mngScIdList = [];
    var mngScIdMap = [];
    var rvsitYnMap = [];

    var leadStatCdList = [];
    var leadStatCdMap = [];
    var modelCdList = [];
    var modelCdMap = [];
    var activeGradeCdList = [];
    var activeGradeCdMap = [];

    var holdTpList = [];
    var holdTpMap = [];


    var infoTpList = [];

    var usersRoleCrmR02 = [];
    var usersRoleCrmR03 = [];
    var usersRoleCrmR17 = [];
    var usersRoleCrmR18 = [];

    var dstbChnList = [];
    var dstbChnMap = [];
    var purposeTagList = [];
    var purposeTagMap = [];
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

    <c:forEach var="obj" items="${infoTpList}">
        infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${leadStatCdList}">
        <c:if test="${obj.remark1 == 'S'}">
            leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${rvsitYnList}">
        rvsitYnMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

/*     <c:forEach var="obj" items="${modelCdList}">
        modelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        modelCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach> */

    <c:forEach var="obj" items="${activeGradeCdList}">
        activeGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${holdTpList}">
        holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${dstbChnList}">
        dstbChnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        dstbChnMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${mngScIdList}">
        mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
        mngScIdMap["${obj.usrId}"] = "${obj.usrNm}";
    </c:forEach>
    <c:forEach var="obj" items="${purposeTagList}">
	  purposeTagList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	  purposeTagMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
	</c:forEach>
    yesOrNoList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    yesOrNoList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    yesOrNoMap["Y"] = "<spring:message code='global.lbl.yes' />";
    yesOrNoMap["N"] = "<spring:message code='global.lbl.n' />";

    <c:forEach var="obj" items="${addrTpList}">
        addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //차종조회
    <c:forEach var="obj" items="${carlineCdList}">
        carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    /**
     * hyperlink in grid event
     */
     $(document).on("click", ".linkCustSalesOpptProcess", function(e){

          var grid = $("#salesOpptProgGrid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
     });

     $(document).on("click", ".linkCustSalesOpptShowRoom", function(e){

          var grid = $("#salesOpptShowRoomGrid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          if ( dms.string.isNotEmpty(dataItem.custNo) ){
              window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
          }
     });



     function gridCommonParams() {
         // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
         var params = {};

         params["sCust"] = $("#sCust").val();
         params["sCustNm"] = $("#sCustNm").val();
         params["sHpNo"] = $("#sHpNo").val();
         params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
         params["sDstbChnCd"] = $("#sDstbChnCd").data("kendoExtDropDownList").value();
         params["sHoldTp"] = $("#sHoldTp").data("kendoExtDropDownList").value();
         params["sInfoTp"] = $("#sInfoTp").data("kendoExtDropDownList").value();
         params["sLeadStatCd"] = $("#sLeadStatCd").data("kendoExtDropDownList").value();
       //20210112 update tjx 新建日期使用画面上的字段
       //  params["sLeadStartDtFrom"] = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
         params["sCustNo"] = $("#sCustNo").val();
       //  params["sLeadStartDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
         params["sRegDtFrom"] = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
         params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
         params["sSubmitDtFrom"] = $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value();
         params["sSubmitDtTo"] = $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value();
         params["sIntrCarlineCd"] = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
         params["sIntrFscpModtpCd"] = $("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
         params["sTraceGradeCd"] = $("#sTraceGradeCd").data("kendoExtDropDownList").value();

         if ($("#leadStatCd").val() == "99") { // 전시장유동량
             params["sLeadStatCd"] = $("#leadStatCd").val();
         }

         /* 판매기회프로세스 단계와 , 실패/전출 상태에 대한 구분
                                           판매기회 단계에서는 실패,전출단계 데이터가 보이면 안 됨.
            S:진행중 , F:실패/전출
         */
         params["sLeadStatIng"] = "S";
         params["sPurposeTag"] = $("#sPurposeTag").data("kendoExtDropDownList").value();
         return params;

     };

     setKendoDate = function( dtValue){
         return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
     };

    $(document).ready(function() {

        $("#sMngScId").kendoExtDropDownList({
            dataTextField:"usrNm"
           ,dataValueField:"usrId"
           ,dataSource:mngScIdList
//            ,dataSource.sort({ field: "usrNm", dir: "asc" });
           ,optionLabel:" "
           , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
        });

        // 판매채널
        $("#sDstbChnCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(dstbChnList)
            , index:0
        });

        $("#sPurposeTag").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(purposeTagList)
            , index:0
        });
     // 시승여부
        $("#sTestDrvYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:yesOrNoList
            , index:0
        });

        // 고객확보유형1
        $("#sHoldTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , optionLabel:" "
           , dataSource:dms.data.cmmCdFilter(holdTpList)
           , filter:"contains"
           , filtering:function(e){
               var filter = e.filter;
           }
       });

        $("#sLeadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(leadStatCdList)
            , index:0
        });
        //$("#sLeadStatCd").data("kendoExtDropDownList").enable(false);

        $("#sBhmcYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:yesOrNoList
            , index:0
        });

        $("#sTraceGradeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(activeGradeCdList)
            //, index:0
        });

        $("#sInfoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:infoTpList
        });

        $("#sSubmitDtFrom").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,change:fnChkDateValue
        });

        $("#sSubmitDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,change:fnChkDateValue
        });


        $("#sRegDtFrom").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,change:fnChkDateValue
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,change:fnChkDateValue
        });

//         $("#sLeadStartDtFrom").kendoExtMaskedDatePicker({
//             format:"<dms:configValue code='dateFormat' />"
//             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//         });

//         $("#sLeadStartDtTo").kendoExtMaskedDatePicker({
//             format:"<dms:configValue code='dateFormat' />"
//             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//         });


        if ( month == "1") {
            twoMthAgo = '10';
            year  = parseInt(year) - 1;
        } else if (month == '2') {
            twoMthAgo = '11';
            year  = parseInt(year) - 1;
        }

        if(dms.string.isEmpty($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value())){
            $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value(new Date(year,twoMthAgo,'01'));
            //$("#sSubmitDtTo").data("kendoExtMaskedDatePicker").min(new Date(year,twoMthAgo,'01'));
         }
        if(dms.string.isEmpty($("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value())){
            $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(toDt);
            //$("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").max(toDt);
         }

        /**
         * 차종 콤보박스
         */
        $("#sIntrCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel: " "
           , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchVariant
        });

        /**
         * 모델 콤보박스
         */
         $("#sIntrFscpModtpCd").kendoExtDropDownList({
             dataTextField:"fscNm"
            ,dataValueField:"fscCd"
            ,filter:"contains"
            ,optionLabel:" "
         });
         $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(false);

         $("#assignDiv").kendoWindow({
             animation:false
             ,draggable: true
             ,modal: false
             ,resizable: false
             ,visible: false
             ,title: "<spring:message code='global.title.scIdAssign' />"      // 담당자 배정
             ,width: "300px"
             ,height: "125px"
         }).data("kendoWindow");

         // 조회
         $("#btnCtlSearch").kendoButton({
             click:function(e) {
                 // 필수값 체크
                 var leadStatCd = $("#leadStatCd").val();
                 if ( dms.string.isEmpty(leadStatCd)){
                     dms.notification.info("<spring:message code='crm.lbl.step' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                     return false;
                 }
//                  var sSubmitDtFrom = $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value();
//                  var sSubmitDtTo = $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value();
//                  if ( (dms.string.isNotEmpty(sSubmitDtFrom) && dms.string.isEmpty(sSubmitDtTo)) ||
//                          (dms.string.isEmpty(sSubmitDtFrom) && dms.string.isNotEmpty(sSubmitDtTo))
//                  ){
//                     dms.notification.warning("<spring:message code='crm.lbl.submitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
//                     return false;
//                  }
                 if(crmJs.isDateValidPeriod($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value()
                         ,$("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                     if(crmJs.isDateValidPeriod($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value()
                             ,$("#sRegDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                         if (leadStatCd == "99") {
                             $("#salesOpptShowRoomGrid").data("kendoExtGrid").dataSource.read();
                         } else {
                        	 //liuxueying update页数问题 start
                        	 $("#salesOpptProgGrid").data("kendoExtGrid").dataSource.page(1);
                             //liuxueying update页数问题 end
                             //$("#salesOpptProgGrid").data("kendoExtGrid").dataSource.read();
                         }
                     }else{
                         $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                         $("#sRegDtTo").focus();
                     }
                 }else{
                     $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                     $("#sSubmitDtTo").focus();
                 }

             }
         });

         $("#btnCtlAssign").kendoButton({
            click: function(e){

                var saveList      = [],
                grid          = $("#salesOpptProgGrid").data("kendoExtGrid"),
                rows          = grid.tbody.find("tr"),
                chkRow;

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    var data={};

                    chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){
                        saveList.push(data);
                    }
                });

                if(saveList.length == 0 ){
                    // 배정목록 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOpptList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                    return false;
                }

                var assignDiv = $("#assignDiv").data("kendoWindow");
                $("#usrPw").val("");
                if (salesOpptPwYn == "N" ) {
                    $("#usrPw").attr("readonly", true);
                    $("#usrPw").addClass("form_readonly");
                }
                assignDiv.center();
                assignDiv.open();
            }
         });

         // 배정 담당자
         $("#assignUsers").kendoMultiSelect({
             dataSource: usersRoleCrmR18,
             valuePrimitive: true,
             placeholder: "",
             dataTextField: "usrNm",
             dataValueField: "usrId"
         });

         //버튼 - 일괄등록
         $("#btnCtlExcelImport").kendoButton({
             click:function(e) {
                 excelUploadPopupWin = dms.window.popup({
                     title:"<spring:message code='global.title.fileUpload' />"
                     ,windowId:"excelUploadPopupWin"
                     ,content:{
                         url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessExcelUploadPopup.do'/>"
                         ,data: {
                             "callbackFunc":function(){
                                 $('#salesOpptProgGrid').data('kendoExtGrid').dataSource.read();
                             }
                         }
                     }
                     , height:535
                 });
             }
         });

         //버튼 - 엑셀저장
         $("#btnCtlExcelExport").kendoButton({
             click:function(e) {


                 if(crmJs.isDateValidPeriod($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value()
                         ,$("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                     if(crmJs.isDateValidPeriod($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value()
                             ,$("#sRegDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                     }else{
                         $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                         $("#sRegDtTo").focus();
                         return false;
                     }
                 }else{
                     $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                     $("#sSubmitDtTo").focus();
                     return false;
                 }



                    var sysDateExcelNm = new Date();
                    var sysDtVal;
                    sysDtVal = sysDateExcelNm.getFullYear()+"-";
                    sysDtVal += sysDateExcelNm.getMonth()+1;
                    sysDtVal += "-"+sysDateExcelNm.getDate();
                    sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

                    var leadStatCd = $("#leadStatCd").val();

                    if (leadStatCd == "99") {  // 전시장유동량
                        var leadStatCd = "";
                        var sSubmitDtFrom = $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value();
                        var sSubmitDtTo = $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value();

                        // TODO 사용안한다고해서 cnt 체크 안했음 [20170329 - 이인문]
                        // 전시장에서 excel 내려받기수정 했음 [20170706 - 유정]
                        dms.ajax.excelExport({
                            "beanName":"salesOpptShowRoomMgmtService"
                            ,"templateFile":"SalesOpptShowRoomExp_Tpl.xlsx"
                            ,"fileName":"<spring:message code='crm.lbl.visitCustMng' />_"+sysDtVal+".xlsx"
                            ,"sCust":$("#sCust").val()
                            ,"sCustNm":$("#sCustNm").val()
                            ,"sHpNo":$("#sHpNo").val()
                            ,"sMngScId":$("#sMngScId").data("kendoExtDropDownList").value()
                            ,"sDstbChnCd":$("#sDstbChnCd").data("kendoExtDropDownList").value()
                            ,"sHoldTp":$("#sHoldTp").data("kendoExtDropDownList").value()
                            ,"sInfoTp":$("#sInfoTp").data("kendoExtDropDownList").value()
                            ,"sLeadStatCd":leadStatCd
                            ,"sVsitDtFrom":setKendoDate(sSubmitDtFrom)
                            ,"sVsitDtTo":setKendoDate(sSubmitDtTo)
                            ,"sIntrCarlineCd":$("#sIntrCarlineCd").data("kendoExtDropDownList").value()
                            ,"sTraceGradeCd":$("#sTraceGradeCd").data("kendoExtDropDownList").value()
                            ,"sIntrCarlineCd":$("#sIntrCarlineCd").data("kendoExtDropDownList").value()
                            ,"sIntrFscpModtpCd":$("#sIntrFscpModtpCd").data("kendoExtDropDownList").value()
                            ,"sTestDrvYn":$("#sTestDrvYn").data("kendoExtDropDownList").value()
                            ,"sCustNo":$("#sCustNo").val()
                            ,"sPurposeTag":$("#sPurposeTag").data("kendoExtDropDownList").value()
                        });

                    } else {

                        var params = {};
                        params = gridCommonParams();

                        // 판매기회프로세스 관리 엑셀Export 수량 데이터를 조회한다.
                        $.ajax({
                            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtExcelExportCnt.do' />",
                            data:JSON.stringify(params),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(resultCnt) {

                                <c:set value="10000" var="maxCnt" />;
                                var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                                if ( resultCnt > excelMaxExportCnt ) {
                                    // {엑셀Export}는 { *** ??} 를 초과할 수 없습니다.
                                    dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                                    return;
                                };

                                var sysDateExcelNm = new Date();
                                var sysDtVal;
                                sysDtVal = sysDateExcelNm.getFullYear()+"-";
                                sysDtVal += sysDateExcelNm.getMonth()+1;
                                sysDtVal += "-"+sysDateExcelNm.getDate();
                                sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

                                var sSubmitDtFrom = $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value();
                                var sSubmitDtTo = $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value();
                                if ( (dms.string.isNotEmpty(sSubmitDtFrom) && dms.string.isEmpty(sSubmitDtTo)) ||
                                        (dms.string.isEmpty(sSubmitDtFrom) && dms.string.isNotEmpty(sSubmitDtTo))
                                ){
                                   dms.notification.warning("<spring:message code='crm.lbl.submitDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                   return false;
                                }

                                var sLeadStatCd = $("#sLeadStatCd").data("kendoExtDropDownList").value();
                                if ($("#leadStatCd").val() == "99") { // 전시장유동량
                                    sLeadStatCd = $("#leadStatCd").val();
                                };

                                dms.ajax.excelExport({
                                    "beanName":"salesOpptProcessMgmtService"
                                    ,"templateFile":"SalesOpptProcessExp_Tpl.xlsx"
                                    ,"fileName":"<spring:message code='global.lbl.saleOpptList' />_"+sysDtVal+".xlsx"
                                    ,"sCust":$("#sCust").val()
                                    ,"sCustNm":$("#sCustNm").val()
                                    ,"sHpNo":$("#sHpNo").val()
                                    ,"sMngScId":$("#sMngScId").data("kendoExtDropDownList").value()
                                    ,"sDstbChnCd":$("#sDstbChnCd").data("kendoExtDropDownList").value()
                                    ,"sHoldTp":$("#sHoldTp").data("kendoExtDropDownList").value()
                                    ,"sInfoTp":$("#sInfoTp").data("kendoExtDropDownList").value()
                                    ,"sLeadStatCd":sLeadStatCd
                                    ,"sSubmitDtFrom":setKendoDate(sSubmitDtFrom)
                                    ,"sSubmitDtTo":setKendoDate(sSubmitDtTo)
                                    ,"sRegDtFrom":setKendoDate($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value())
                                    ,"sRegDtTo":setKendoDate($("#sRegDtTo").data("kendoExtMaskedDatePicker").value())
                                    ,"sIntrCarlineCd":$("#sIntrCarlineCd").data("kendoExtDropDownList").value()
                                    ,"sIntrFscpModtpCd":$("#sIntrFscpModtpCd").data("kendoExtDropDownList").value()
                                    ,"sTraceGradeCd":$("#sTraceGradeCd").data("kendoExtDropDownList").value()
                                    ,"sLeadStatIng":"S"
                                    ,"sCustNo":$("#sCustNo").val()
                                    ,"sPurposeTag":$("#sPurposeTag").data("kendoExtDropDownList").value()
                                });

                            }
                        });

                    }
             }
         });

         // 배정저장
         $("#btnAssign").kendoButton({
             click: function(e){

                 var usrPw = $("#usrPw").val();

                    // 비밀번호 체크 시작
                 if (salesOpptPwYn == "Y") {
                    var fnPasschk = fn_passwdChk(usrPw);
                    if (fnPasschk == false){
                        dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                        return false;
                    }
                 }
                // 비밀번호 체크 끝

                 var saveList      = [],
                     grid          = $("#salesOpptProgGrid").data("kendoExtGrid"),
                     rows          = grid.tbody.find("tr"),
                     userList      = $("#assignUsers").data("kendoMultiSelect").dataItems(),
                     chkRow,
                     saveData;

                 if(userList.length  == 0 ){
                     // 배정담당자 / 을(를) 선택해주세요.
                     dms.notification.warning("<spring:message code='global.lbl.assignPrsNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                     return false;
                 }

                 rows.each(function(index, row) {
                     var gridData = grid.dataSource.at(index);
                     var data={};

                     chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                     if(chkRow === true){
                         data.seq = gridData.seq;
                         data.custNo = gridData.custNo;
                         //data.leadStatCd = gridData.leadStatCd;
                         data.leadStatCd = "02";
                         saveList.push(data);
                     }
                 });

                 if(saveList.length == 0 ){
                     // 배정목록 / 을(를) 선택해주세요.
                     dms.notification.warning("<spring:message code='global.btn.assignList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                     return false;
                 }

                 if(saveList.length < userList.length ){
                     // 선택된 목록보다 담당자가 많습니다.
                     dms.notification.warning("<spring:message code='global.info.assignChk' />");
                     return false;
                 }

                 saveData ={
                     "assignList":saveList
                     ,"userList":userList
                 };

                 $.ajax({
                     url:"<c:url value='/crm/ass/assign/updateSalesOpptAssign.do' />"
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

                         var assignUsers = $("#assignUsers").data("kendoMultiSelect");
                         assignUsers.dataSource.data([]);
                         assignUsers.setDataSource(usersRoleCrmR18);
                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");

                         var assignDiv = $("#assignDiv").data("kendoWindow");
                         assignDiv.close();

                         $("#btnCtlSearch").click();
                     }
                      ,beforeSend:function(xhr) {
                         dms.loading.show();
                      }
                      ,complete:function(xhr, status) {
                         dms.loading.hide();
                      }
                 });
             }
         });

         // 대량전출
         $("#btnCtlFailSend").kendoButton({
             click:function(e) {
                 console.log("btnCtlFailSend Call !!");
                 var msg = "<spring:message code='crm.btn.trans' var='globalBtnFix' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnFix}' />";

                 dms.window.confirm({
                     message:msg
                     ,title :"<spring:message code='global.lbl.info' />"
                     ,callback:function(result){
                         if(result){

                             var saveList      = [],
                             grid          = $("#salesOpptProgGrid").data("kendoExtGrid"),
                             rows          = grid.tbody.find("tr"),
                             chkRow,
                             saveData;

                             rows.each(function(index, row) {
                                 var gridData = grid.dataSource.at(index);
                                 var data={};

                                 chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                                 if(chkRow === true){
                                     data.seq = gridData.seq;
                                     data.custNo = gridData.custNo;
                                     //data.leadStatCd = gridData.leadStatCd;
                                     data.leadStatCd = "08";
                                     data.trsfTp = "02"; // 전출유형 , 자동(01), 수동(02)
                                     data.evalCd = "01"; // 심사상태 , 심사대기(01), 불통과(02)
                                     data.befLeadStatCd = "04"; // 04 추적추진
                                     data.mngScId = gridData.mngScId
                                     data.befMngScId = gridData.mngScId
                                     data.submitDt = new Date();
                                     saveList.push(data);
                                 }
                             });

                             if(saveList.length == 0) {
                             // 목록 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.target' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                return false;
                             }

                             saveData ={
                                     "assignList":saveList
                                 };

                             console.log("Saving of Request Info. btnCtlFailSend    !!");
                             //console.log(saveData);

                             $.ajax({
                                 url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcessToFail.do' />"  // multiSalesOpptProcMgmts - service
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
                                     console.log("btnCtlFailSend success!!!!");
                                     dms.notification.success("<spring:message code='global.info.success'/>");
                                 }
                                 ,beforeSend:function(xhr) {
                                    dms.loading.show();
                                 }
                                 ,complete:function(xhr, status) {
                                    dms.loading.hide();
                                 }
                             }).done(function(result) {
                                 console.log("Done!!!!");
                                 $("#btnCtlSearch").click();
                             });

                         }else{
                             return false;
                         }
                     }
                 });
             }
         });

         // 숫자
         var onlyNum = new RegExp("[^0-9]","i");
         $(".numberic").keyup(function(e)
         {
             var content = $(this).val();
             if(content.match(onlyNum)){
                 $(this).val('');
             }
         });

       $(document).on("click", ".btnModify", function(e){
           var grid = $("#salesOpptProgGrid").data("kendoExtGrid")
               , selectedItem = grid.dataItem(grid.select())
               , custNo = selectedItem.custNo
               , seq = selectedItem.seq
               , leadStatCd = selectedItem.leadStatCd
               , exhvFlakSeq = selectedItem.exhvFlakSeq
               , dataTable = selectedItem.dataTable
           ;
           var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
           var heightVal = "474";

           if (leadStatCd == "01") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep01SalesOpptProcessPopup.do'/>";
           } else if (leadStatCd == "02") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep02SalesOpptProcessPopup.do'/>";
           } else if (leadStatCd == "03") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep03SalesOpptProcessPopup.do'/>";
           } else if (leadStatCd == "04") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep04SalesOpptProcessPopup.do'/>";
           } else {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
           }

           if (dataTable === "SHOWROOM") {  // 전시장 데이터인 경우
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04EditSalesOpptShowRoomPopup.do'/>";
               heightVal = "400";
           }

           editCustPopupWindow = dms.window.popup({
              windowId:"selectEditSalesOpptProcessPopup"
              , width:"950"
              , height:heightVal
              , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
              , content:{
                  url:gotoUrl
                  , data:{
                      "autoBind":true
                      , "leadStatCd":leadStatCd
                      , "custNo":custNo
                      , "salesOpptSeq":seq
                      , "showRoomSeq":seq
                      , "exhvFlakSeq":exhvFlakSeq
                      , "dataTable":dataTable
                      , "callbackFunc":function(data) {
                          if (data[0] != "") {
                              $("#btnCtlSearch").click();
                          };
                      }
                  }
              }
          })


       });

       $(document).on("click", ".prevProcess", function(e){
           var grid = $("#salesOpptProgGrid").data("kendoExtGrid")
               , row = $(e.target).closest("tr")
               , selectedItem = grid.dataItem(row)
               , custNo = selectedItem.custNo
               , seq = selectedItem.seq
               , leadStatCd = selectedItem.leadStatCd
               , exhvFlakSeq = selectedItem.exhvFlakSeq
               , dataTable = selectedItem.dataTable
           ;

           var url;
           var heightVal = "400";

           if (leadStatCd === "01") {
               dms.notification.info("<spring:message code='crm.info.noPrevProcess' />");
               return false;
               //url = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep01PrevSalesOpptProcessPopup.do'/>";
           } else if (leadStatCd === "02") {
               url = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep02PrevSalesOpptProcessPopup.do'/>";
               heightVal = "490";
           } else if (leadStatCd === "03") {
               url = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep03PrevSalesOpptProcessPopup.do'/>";
               heightVal = "400";
           } else if (leadStatCd === "04") {
               url = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptProcessPopup.do'/>";
               heightVal = "470";
           } else {
               url = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
               heightVal = "458";
           }

           if (dataTable === "SHOWROOM") {  // 전시장 데이터인 경우
               //url = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptShowRoomPopup.do'/>";
               //heightVal = "470";
               // 방문객은 이전 단계가 없습니다.
               dms.notification.info("<spring:message code='crm.info.noPrevProcessVisit' />");
               return false;
           }

           console.log("prevProcess selecte Item !!! ");

           editCustPopupWindow = dms.window.popup({
              windowId:"selectEditSalesOpptProcessPopup"
              , width:"950"
              , height:heightVal
              , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
              , content:{
                  url:url
                  , data:{
                      "autoBind":true
                      , "leadStatCd":leadStatCd
                      , "custNo":custNo
                      , "salesOpptSeq":seq
                      , "showRoomSeq":seq
                      , "exhvFlakSeq":exhvFlakSeq
                      , "callbackFunc":function(data) {

                          console.log("data!!!");
                          if (data[0] != "") {
                              $("#btnCtlSearch").click();
                          }
                      }
                  }
              }
          })



       });

       $(document).on("click", ".nextProcess", function(e){
           var grid = $("#salesOpptProgGrid").data("kendoExtGrid")
               , row = $(e.target).closest("tr")
               , selectedItem = grid.dataItem(row)
               , custNo = selectedItem.custNo
               , seq = selectedItem.seq
               , leadStatCd = selectedItem.leadStatCd
               , exhvFlakSeq = selectedItem.exhvFlakSeq
               , dataTable = selectedItem.dataTable
           ;

           var gotoUrl;
           var heightVal = "400";

           if (leadStatCd === "01") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup.do'/>";
           } else if (leadStatCd === "02") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup.do'/>";
               heightVal = "470";
           } else if (leadStatCd === "03") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup.do'/>";
               heightVal = "495";
           } else if (leadStatCd === "04") {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptProcessPopup.do'/>";
               heightVal = "470";
           } else {
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
               heightVal = "495";
           }

           if (dataTable === "SHOWROOM") {  // 전시장 데이터인 경우
               gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptShowRoomPopup.do'/>";
               heightVal = "470";
           }

           console.log("nextProcess selecte Item !!! ");

           editCustPopupWindow = dms.window.popup({
              windowId:"selectEditSalesOpptProcessPopup"
              , width:"950"
              , height:heightVal
              , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
              , content:{
                  url:gotoUrl
                  , data:{
                      "autoBind":true
                      , "leadStatCd":leadStatCd
                      , "custNo":custNo
                      , "salesOpptSeq":seq
                      , "showRoomSeq":seq
                      , "exhvFlakSeq":exhvFlakSeq
                      , "callbackFunc":function(data) {
                          if (data[0] != "") {
                              $("#btnCtlSearch").click();
                          };
                      }
                  }
              }
          })

       });

       // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
       $("#salesOpptProgGrid").on("dblclick", "tr.k-state-selected", function (e) {
            var grid = $("#salesOpptProgGrid").data("kendoExtGrid")
                , selectedItem = grid.dataItem(grid.select())
                , custNo = selectedItem.custNo
                , seq = selectedItem.seq
                , leadStatCd = selectedItem.leadStatCd
                , exhvFlakSeq = selectedItem.exhvFlakSeq
                , dataTable = selectedItem.dataTable
            ;
            var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
            var heightVal = "474";

            if (leadStatCd == "01") {
                gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep01SalesOpptProcessPopup.do'/>";
            } else if (leadStatCd == "02") {
                gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep02SalesOpptProcessPopup.do'/>";
            } else if (leadStatCd == "03") {
                gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep03SalesOpptProcessPopup.do'/>";
            } else if (leadStatCd == "04") {
                gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep04SalesOpptProcessPopup.do'/>";
            } else {
                gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
            }

            if (dataTable === "SHOWROOM") {  // 전시장 데이터인 경우
                gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04EditSalesOpptShowRoomPopup.do'/>";
                heightVal = "400";
            }

            editCustPopupWindow = dms.window.popup({
               windowId:"selectEditSalesOpptProcessPopup"
               , width:"950"
               , height:heightVal
               , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
               , content:{
                   url:gotoUrl
                   , data:{
                       "autoBind":true
                       , "leadStatCd":leadStatCd
                       , "custNo":custNo
                       , "salesOpptSeq":seq
                       , "showRoomSeq":seq
                       , "exhvFlakSeq":exhvFlakSeq
                       , "dataTable":dataTable
                       , "callbackFunc":function(data) {
                          console.log("selectEditSalesOpptProcessPopup!!!!!");
                           if (data[0] != "") {

//                                if(dms.string.isNotEmpty(data.leadStatCd)){
//                                    console.log(data.leadStatCd);
//                                    if (data.leadStatCd == "05") {
//                                        editCustPopupWindow.close();
//                                        $("#btnCtlSearch").click();
//                                        window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.contractCt' />", "<c:url value='/sal/cnt/contractMnt/selectContractMntMain.do' />?saleOpptNo="+data[0], "VIEW-D-10634"); //계약체결관리
//                                    }
//                                } else{
//                                    $("#btnCtlSearch").click();
//                                }

                                   $("#btnCtlSearch").click();

                           };
                       }
                   }
               }
           })
       });

       // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
       $("#salesOpptShowRoomGrid").on("dblclick", "tr.k-state-selected", function (e) {
            var grid = $("#salesOpptShowRoomGrid").data("kendoExtGrid")
                , selectedItem = grid.dataItem(grid.select())
                , custNo = selectedItem.custNo
                , seq = selectedItem.seq
                , leadStatCd = selectedItem.leadStatCd
            ;

            console.log("salesOpptShowRooomGrid !!!!");

            var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptShowRoomPopup.do'/>";

            editCustPopupWindow = dms.window.popup({
               windowId:"selectEditSalesOpptProcessPopup"
               , width:"950"
               , height:"492"
               , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
               , content:{
                   url:gotoUrl
                   , data:{
                       "autoBind":true
                       , "leadStatCd":leadStatCd
                       , "custNo":custNo
                       , "showRoomSeq":seq
                       , "dataTable":"SHOWROOM"
                       , "callbackFunc":function(data) {
                           if (data[0] != "") {
                               $("#btnCtlSearch").click();
                           }
                       }
                   }
               }
           })
       });

       //수정 버튼
       $("#btnCtlUpdate").kendoButton({
           click:function(e) {
                var progGrid = $("#salesOpptProgGrid").data("kendoExtGrid")
                  , rowsPG = progGrid.tbody.find("tr")
                  , chkRow
                  , custNo
                  , seq
                  , leadStatCd
                  , exhvFlakSeq
                  , dataTable
                ;


//                 if (rowsPG.length > 1) {
//                     dms.notification.info("<spring:message code='global.info.selectOneRowMsg' />");
//                     return false;
//                 }
                var saveList      = [];
                 rowsPG.each(function(index, row) {
                   var gridData = progGrid.dataSource.at(index);
                   var data={};

                   chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                   if(chkRow === true){
                       custNo = gridData.custNo;
                       seq = gridData.seq;
                       leadStatCd = gridData.leadStatCd;
                       exhvFlakSeq = gridData.exhvFlakSeq;
                       dataTable = gridData.dataTable;
                       saveList.push(gridData.seq);
                   }
                 });

                 console.log("saveList.length : " + saveList.length);
                 if(saveList.length >= 2 ){
                     // 판매기회를 1건만 선택해 주십시요.
                     dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='arguMsg1' /><spring:message code='global.lbl.numberOne' var='arguMsg2' /><spring:message code='global.info.isSelectChk' arguments='${arguMsg1},${arguMsg2}' />");
                     return false;
                 }

                 if ( dms.string.isEmpty(seq)){
                     dms.notification.info("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                     return false;
                 }

                 var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
                 var heightVal = "474";

                 if (leadStatCd == "01") {
                     gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep01SalesOpptProcessPopup.do'/>";
                 } else if (leadStatCd == "02") {
                     gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep02SalesOpptProcessPopup.do'/>";
                 } else if (leadStatCd == "03") {
                     gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep03SalesOpptProcessPopup.do'/>";
                 } else if (leadStatCd == "04") {
                     gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep04SalesOpptProcessPopup.do'/>";
                 } else {
                     gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
                 }

                 if (dataTable === "SHOWROOM") {  // 전시장 데이터인 경우
                     gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectStep04EditSalesOpptShowRoomPopup.do'/>";
                     heightVal = "400";
                 }

                 editCustPopupWindow = dms.window.popup({
                    windowId:"selectEditSalesOpptProcessPopup"
                    , width:"950"
                    , height:heightVal
                    , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
                    , content:{
                        url:gotoUrl
                        , data:{
                            "autoBind":true
                            , "leadStatCd":leadStatCd
                            , "custNo":custNo
                            , "salesOpptSeq":seq
                            , "showRoomSeq":seq
                            , "exhvFlakSeq":exhvFlakSeq
                            , "dataTable":dataTable
                            , "callbackFunc":function(data) {
                                if (data[0] != "") {
                                    $("#btnCtlSearch").click();
                                };
                            }
                        }
                    }
                })
           }
       });

       //수정 버튼
       $("#btnCtlUpdateShowRoom").kendoButton({
           click:function(e) {
                var progGrid = $("#salesOpptShowRoomGrid").data("kendoExtGrid")
                  , rowsPG = progGrid.tbody.find("tr")
                  , chkRow
                  , custNo
                  , seq
                  , leadStatCd
                ;


//                 if (rowsPG.length > 1) {
//                     dms.notification.info("<spring:message code='global.info.selectOneRowMsg' />");
//                     return false;
//                 }

                 rowsPG.each(function(index, row) {
                   var gridData = progGrid.dataSource.at(index);
                   var data={};

                   chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");


                   if(chkRow === true){
                       custNo = gridData.custNo;
                       seq = gridData.seq;
                       leadStatCd = gridData.leadStatCd;
                   }
                 });

                 if ( dms.string.isEmpty(seq)){
                     dms.notification.info("<spring:message code='global.lbl.item' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                     return false;
                 }

                 var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptShowRoomPopup.do'/>";

                 editCustPopupWindow = dms.window.popup({
                    windowId:"selectEditSalesOpptProcessPopup"
                    , width:"950"
                    , height:"492"
                    , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
                    , content:{
                        url:gotoUrl
                        , data:{
                            "autoBind":true
                            , "leadStatCd":leadStatCd
                            , "custNo":custNo
                            , "showRoomSeq":seq
                            , "dataTable":"SHOWROOM"
                            , "callbackFunc":function(data) {
                                if (data[0] != "") {
                                    $("#btnCtlSearch").click();
                                }
                            }
                        }
                    }
                })
           }
       });

       //신규등록 버튼
       $("#btnCtlNew").kendoButton({
           click:function(e) {

               var leadStatCd = $("#leadStatCd").val(); // 판매기회 신규
               var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptProcessPopup.do'/>";
               var heightVal = "400"

               if (leadStatCd == "99") {  // 전시장유동량 신규
                   gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptShowRoomPopup.do'/>";
                   heightVal = "492";
               }

               newCustPopupWindow = dms.window.popup({
                   windowId:"selectNewSalesOpptProcessPopup"
                   , width:"950"
                   , height:heightVal
                   , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
                   , content:{
                       url:gotoUrl
                       , data:{
                           "autoBind":false
                           , "leadStatCd":leadStatCd
                           , "custNo":null
                           , "salesOpptSeq":null
                           , "callbackFunc":function(data) {
                               if (data[0] != "") {
                                   $("#btnCtlSearch").click();
                               }
                           }
                       }
                   }
               })
           }
       });

        // 검색조건 show/hide
        $("#btnHidden").kendoButton({
            click: function(e){
                $("#hiddenTable").toggle();
                $("#btnHidden").toggleClass("active");

                var leadStatVal = $("#leadStatCd").val();
                var stepDivId = "btnStep"+leadStatVal;
                onSelectBtnStepClick(stepDivId);
            }
        });

        // 판매기회 관리 그리드 시작 //
        $("#salesOpptProgGrid").kendoExtGrid({
            gridId:"G-CRM-0228-141769"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params = $.extend(params, gridCommonParams());

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                        id:"seq"
                        ,fields:{
                            rnum:{type:"number"}
                            , vsitResvDt:{type:"date"}
                            , vsitDt:{type:"date"}
                            , vsitEndDt:{type:"date"}
                            , expcPurcDt:{type:"date"}
                            , traceDt:{type:"date"}
                            , nextTraceDt:{type:"date"}
                            , regDt:{type:"date"}
                            , updtDt:{type:"date"}
                            , vsitResvDtFormat:{type:"date"}
                            , vsitDtFormat:{type:"date"}
                            , vsitEndDtFormat:{type:"date"}
                            , traceDtFormat:{type:"date"}
                            , nextTraceDtFormat:{type:"date"}
                            , regDtFormat:{type:"date"}
                           // , leadStartDtFormat:{type:"date"}
                            , updtDtFormat:{type:"date"}
                            , submitDtFormat:{type:"date"}
                            , exhvFlakSeq:{type:"String"}
                            , trsfTp:{type:"String"}
                            , evalCd:{type:"String"}
                            , mngScId:{type:"String"}
                        }
                    }
                    ,parse: function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.vsitResvDtFormat = kendo.parseDate(elem.vsitResvDt, "<dms:configValue code='dateFormat' />");
                                elem.vsitDtFormat = kendo.parseDate(elem.vsitDt, "<dms:configValue code='dateFormat' />");
                                elem.vsitEndDtFormat = kendo.parseDate(elem.vsitEndDt, "<dms:configValue code='dateFormat' />");
                                elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateFormat' />");
                                elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                elem.leadStartDtFormat = kendo.parseDate(elem.leadStartDt, "<dms:configValue code='dateFormat' />");
                                elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                                elem.submitDtFormat = kendo.parseDate(elem.submitDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
            }
            ,dataBound:function (e) {
                var dataItems = e.sender.dataSource.view();

                if ( dataItems.length > 0 ) {
                    $("#btnCtlExcelExport").data("kendoButton").enable(true);
                } else {
                    $("#btnCtlExcelExport").data("kendoButton").enable(false);
                };
            }
            ,columns:[
                { locked:true, _field:"ctlPanel", title:"<spring:message code='par.lbl.itemOper' />", width:30 // 조작  操作
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        //var spanObj = "<a href='#' class='prevProcess'><button type='button' class='btn_s btn_prev2'></button></a> | <a href='#' class='nextProcess'><button type='button' class='btn_s btn_next2'></button></a>";
                        var spanObj = "<a href='#' class='btnModify'><span class='icon_modify'></span></a>";
                        return spanObj;
                    }
                }
                , { locked:true, field:"leadStatNm", title:"<spring:message code='crm.lbl.leadStat' />", width:90 // 리드상태  ?索??
                    ,attributes:{"class":"ac"}
                }
                , { locked:true, field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:90 // 고객명  客?名
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkCustSalesOpptProcess'>"+dataItem.custNm+"</a>";
                        return spanObj;
                    }
                }
                , { locked:true, field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:110 // 휴대전화  移???
                    ,attributes:{"class":"ac"}
                }
                , {field:"intrCarlineNm", title:"<spring:message code='crm.lbl.intentionCarline' />", width:90 // 의향차종  意向??
                    ,attributes:{"class":"al"}
                }
                , {field:"submitDtFormat", title:"<spring:message code='crm.lbl.submitDt' />", width:130, attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (submitDtFormat !== null ){# #= kendo.toString(data.submitDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , {field:"infoTpNm", title:"<spring:message code='crm.lbl.infoType' />", width:90 // 리드유형
                    ,attributes:{"class":"ac"}
                }
                , {field:"purposeTagNm", title:"<spring:message code='crm.lbl.purposeTag' />", width:90 // 线索标签
                    ,attributes:{"class":"ac"}
                    ,sortable:true
                }
                , {field:"bhmcYn", title:"<spring:message code='crm.lbl.bhmcLeadyn' />", width:90 // BHMC 제조사 여부
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.bhmcYn == 'Y') {
                            spanObj = "<span class='icon_ok'></span>";
                        }
                        return spanObj;
                    }
                }
                , {field:"holdTpNm", title:"<spring:message code='crm.lbl.approchLocation' />", width:90 // 정보경로  ?索?源
                    ,attributes:{"class":"ac"}
                }
                , {field:"holdDetlTpSeqNm", title:"<spring:message code='crm.lbl.approchLocationDtl' />", width:90 // 정보경로상세
                    , sortable:false
                    ,attributes:{"class":"ac"}
                }
                , {field:"validGradeNm", title:"<spring:message code='crm.lbl.validCheck' />", width:70 // 유효성판단  有效性判?
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.validGradeCd == '01') {
                            spanObj = "<span class='icon_processing'></span>";
                        } else if (dataItem.validGradeCd == '02') {
                            spanObj = "<span class='icon_ok'></span>";
                        } else if (dataItem.validGradeCd == '03') {
                            spanObj = "<span class='icon_delete'></span>";
                        }
                        return spanObj;
                    }
                }
                , {field:"sexNm", title:"<spring:message code='global.lbl.sex' />", width:30 // 성별  性?
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.sexCd == 'M') {
                            spanObj = "<span class='icon_male'></span>";
                        } else if (dataItem.sexCd == 'F') {
                            spanObj = "<span class='icon_female'></span>";
                        }
                        return spanObj;
                    }
                }
                , {field:"custTpNm", title:"<spring:message code='global.lbl.custTp' />", width:90 // 고객유형  客??型
                    ,attributes:{"class":"ac"}
                }
                , {field:"mngScNm", title:"<spring:message code='crm.lbl.prsNm' />", width:90 // 담당자  ??
                    ,attributes:{"class":"ac"}
                }
                , {field:"dstbChnNm", title:"<spring:message code='sal.lbl.channelType' />", width:90 // 판매채널
                    ,attributes:{"class":"ac"}
                }
                , {field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:110 // 집전화  家庭??
                    ,attributes:{"class":"ac"}
                }
                , {field:"intrFscpModtpNm", title:"<spring:message code='crm.lbl.intentionVariant' />", width:180 // 의향차관
                    ,attributes:{"class":"al"}
                }
                , {field:"intrColorNm", title:"<spring:message code='crm.lbl.intentionColor' />", width:100 // 의향색상  意向?色
                    ,attributes:{"class":"al"}
                }
                , {field:"wechatId", title:"<spring:message code='global.lbl.wechat' />", width:120 // 위쳇  微信
                    ,attributes:{"class":"al"}
                }
                , {field:"vsitResvDtFormat", title:"<spring:message code='crm.lbl.visitAppointDt' />", width:130 // 방문예약시간  ??到店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitResvDtFormat !== null ){# #= kendo.toString(data.vsitResvDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , {field:"vsitDtFormat", title:"<spring:message code='crm.lbl.visitDt' />", width:130 // 방문시간  到店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitDtFormat !== null ){# #= kendo.toString(data.vsitDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , {field:"vsitPrsnCnt", title:"<spring:message code='crm.lbl.visitCount' />", width:90 // 방문인원수  到店人?
                    ,attributes:{"class":"ar"}
                }
                , {field:"rvsitYn", title:"<spring:message code='crm.lbl.revisitYn' />", width:90 // 재방문여부  是否二次到店
                    ,attributes:{"class":"ac"}
                    , template:'#if (rvsitYn !== "" && rvsitYn !== null )  {# #= rvsitYnMap[rvsitYn]# #}#'
                }
                , {field:"vsitEndDtFormat", title:"<spring:message code='crm.lbl.goOutTime' />", width:130 // 떠난시간  ?店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitEndDtFormat !== null ){# #= kendo.toString(data.vsitEndDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , {field:"payTpNm", title:"<spring:message code='crm.lbl.payMethod' />", width:90 // 지불방식  支付方式
                    ,attributes:{"class":"ac"}
                }
//                 , {field:"expcPurcHmNm", title:"<spring:message code='crm.lbl.expcPurcDateTime' />", width:90 // 예상구매시간  ????
//                     ,attributes:{"class":"ac"}
//                 }
                , {field:"localCarRegNoYn", title:"<spring:message code='crm.lbl.plateNum' />", width:90 // 현지번호판예정  ?上本地牌
                    ,attributes:{"class":"ac"}
                    //, template:'#if (localCarRegNoYn !== ""){# #= yesOrNoMap[localCarRegNoYn]# #}#'
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.localCarRegNoYn == 'Y') {
                            spanObj = "<span class='icon_ok'></span>";
                        }
                        return spanObj;
                    }
                }
                , {field:"estimateCont", title:"<spring:message code='crm.lbl.estimateInfo' />", width:90 // 견정정보  ?价信息
                    ,attributes:{"class":"al"}
                }
                , {field:"salesCont", title:"<spring:message code='crm.lbl.promotionCont' />", width:200 // 판촉내용  促??容
                    ,attributes:{"class":"al"}
                }
//                 , {field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:200 // 비고설명  ?注?明
//                     ,attributes:{"class":"al"}
//                 }
                , {field:"traceGradeNm", title:"<spring:message code='crm.lbl.activeGrade' />", width:90 // 추적등급  ?踪等?
                    ,attributes:{"class":"ac"}
                }
                , {field:"invalidCauNm", title:"<spring:message code='crm.lbl.invalidReason' />", width:90 // 무효원인  无效原因
                    ,attributes:{"class":"ac"}
                }
                , {field:"failCauNm", title:"<spring:message code='crm.lbl.failReason' />", width:200 // 전패원인  ??原因
                    ,attributes:{"class":"ac"}
                }
                , {field:"otherBrandNm", title:"<spring:message code='crm.lbl.otherBrand' />", width:100 // 타사브랜랜
                    ,attributes:{"class":"ac"}
                }
                , {field:"failCauReasonCont", title:"<spring:message code='crm.lbl.failReasonAly' />", width:90 // 전패원인분석  ??原因分析
                    ,attributes:{"class":"al"}
                }
                , {field:"purcSelCarlineNm", title:"<spring:message code='crm.lbl.purchaSelCarline' />", width:90 // 구매선택차종  ????
                    ,attributes:{"class":"al"}
                }
                , {field:"purcFscpModtpNm", title:"<spring:message code='crm.lbl.purchaSelVariant' />", width:180 // 구매선택차관
                    ,attributes:{"class":"al"}
                }
                , {field:"expcPurcDt", title:"<spring:message code='crm.lbl.expcPurcDt' />", width:100 // 예상구매일  ??成交??
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
                , {field:"expcDealPrc", title:"<spring:message code='crm.lbl.expcBpPrice' />", width:90 // 예상거래가격  ??交易价格
                    ,format:"{0:n2}"
                    ,attributes:{"class":"ar"}
                }
                ,{field:"traceDtFormat", title:"<spring:message code='crm.lbl.traceDt' />", width:130, attributes:{"class":"ac"}
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (traceDtFormat !== null ){# #= kendo.toString(data.traceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                ,{field:"nextTraceDtFormat", title:"<spring:message code='crm.lbl.nextTraceDt' />", width:130, attributes:{"class":"ac"}
                    ,attributes:{"class":"ac tooltip-disabled"}
                    //,template:"#if (nextTraceDtFormat !== null ){# #= kendo.toString(data.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.nextTraceDt != null) {
                            var traceChk = nextTraceDtChk(dataItem.traceDt, dataItem.nextTraceDt);
                            if (traceChk == 'N') {
                                spanObj = "<span class='txt_label bg_red'>"+kendo.toString(dataItem.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm')+"</span>";
                            } else {
                                spanObj = kendo.toString(dataItem.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm');
                            }
                        }
                        return spanObj;
                    }
                }
                ,{field:"leadStartDtFormat", title:"<spring:message code='global.lbl.newRegDt' />", width:100, attributes:{"class":"ac"}
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
//                 ,{field:"regDtFormat", title:"<spring:message code='global.lbl.newRegDt' />", width:130, attributes:{"class":"ac"}
//                     ,attributes:{"class":"ac tooltip-disabled"}
//                     ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
//                 }
//                 ,{field:"updtDtFormat", title:"<spring:message code='global.lbl.updtDt' />", width:130, attributes:{"class":"ac"}
//                     ,attributes:{"class":"ac tooltip-disabled"}
//                     ,template:"#if (updtDtFormat !== null ){# #= kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
//                 }
            ]
            ,multiSelectLocked:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,navigatable:false
            ,editable:false
            ,autoBind:false
            ,resizable:true
            //,height:460
        });
        // 판매기회 관리 그리드 종료 //

        // 전시장유동량 관리 그리드 시작 //
        $("#salesOpptShowRoomGrid").kendoExtGrid({
            gridId:"G-CRM-0806-141769"
            , dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var sVsitDtFrom = $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value();
                            var sVsitDtTo = $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value();

                            if ( (dms.string.isNotEmpty(sVsitDtFrom) && dms.string.isEmpty(sVsitDtTo)) ||
                                    (dms.string.isEmpty(sVsitDtFrom) && dms.string.isNotEmpty(sVsitDtTo))
                            ){
                               dms.notification.warning("<spring:message code='global.lbl.allocDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                               return false;
                            }

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCust"] = $("#sCust").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sHpNo"] = $("#sHpNo").val();
                            params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
                            //params["sDstbChnCd"] = $("#sDstbChnCd").data("kendoExtDropDownList").value();
                            params["sHoldTp"] = $("#sHoldTp").data("kendoExtDropDownList").value();
                            params["sInfoTp"] = $("#sInfoTp").data("kendoExtDropDownList").value();
                            params["sLeadStatCd"] = $("#sLeadStatCd").data("kendoExtDropDownList").value();
                            //params["sBhmcYn"] = $("#sBhmcYn").data("kendoExtDropDownList").value();
                            params["sVsitDtFrom"] = sVsitDtFrom;
                            params["sVsitDtTo"] = sVsitDtTo;
                            params["sIntrCarlineCd"] = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                            params["sIntrFscpModtpCd"] = $("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
                            params["sTraceGradeCd"] = $("#sTraceGradeCd").data("kendoExtDropDownList").value();
                            params["sTestDrvYn"] = $("#sTestDrvYn").data("kendoExtDropDownList").value();
                            params["sCustNo"] = $("#sCustNo").val();

                            if ($("#leadStatCd").val() == "99") { // 전시장유동량
                                params["sLeadStatCd"] = "";
                            }
                            console.log("전시장 유동량 관리 param!!!");
                            //console.log(params);

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                        id:"seq"
                        ,fields:{
                            rnum:{type:"number"}
                            , vsitResvDt:{type:"date"}
                            , vsitDt:{type:"date"}
                            , vsitEndDt:{type:"date"}
                            , expcPurcDt:{type:"date"}
                            , traceDt:{type:"date"}
                            , nextTraceDt:{type:"date"}
                            , regDt:{type:"date"}
                            , updtDt:{type:"date"}
                            , vsitResvDtFormat:{type:"date"}
                            , vsitDtFormat:{type:"date"}
                            , vsitEndDtFormat:{type:"date"}
                            , traceDtFormat:{type:"date"}
                            , nextTraceDtFormat:{type:"date"}
                            , regDtFormat:{type:"date"}
                            , updtDtFormat:{type:"date"}
                        }
                    }
                    ,parse: function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.vsitResvDtFormat = kendo.parseDate(elem.vsitResvDt, "<dms:configValue code='dateFormat' />");
                                elem.vsitDtFormat = kendo.parseDate(elem.vsitDt, "<dms:configValue code='dateFormat' />");
                                elem.vsitEndDtFormat = kendo.parseDate(elem.vsitEndDt, "<dms:configValue code='dateFormat' />");
                                elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateFormat' />");
                                elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
            }
            ,columns:[
                {locked:true, field:"vsitDt", title:"<spring:message code='crm.lbl.visitDt' />", width:130 // 방문시간  到店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitDtFormat !== null ){# #= kendo.toString(data.vsitDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , { locked:true, field:"vsitEndDtFormat", title:"<spring:message code='crm.lbl.goOutTime' />", width:130 // 떠난시간  ?店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitEndDtFormat !== null ){# #= kendo.toString(data.vsitEndDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , { locked:true, field:"vistPrdmm", title:"<spring:message code='crm.lbl.traceDt' />", width:90 // 추적시간
                    ,format:"{0:n0}"
                    ,attributes:{"class":"ar"}
                }
                , { locked:true, field:"vsitPrsnCnt", title:"<spring:message code='crm.lbl.visitCount' />", width:90 // 방문인원수  到店人?
                    ,format:"{0:n0}"
                    ,attributes:{"class":"ar"}
                }
                , { locked:true, field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:90 // 고객명  客?名
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if ( dms.string.isEmpty(dataItem.custNo) ) {
                            spanObj = dataItem.custNm;
                        }  else {
                            spanObj = "<a href='#' class='linkCustSalesOpptShowRoom'>"+dataItem.custNm+"</a>";
                        }
                        return spanObj;
                    }
                }
                , { locked:true,field:"sexNm", title:"<spring:message code='global.lbl.sex' />", width:30 // 성별  性?
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.sexCd == 'M') {
                            spanObj = "<span class='icon_male'></span>";
                        } else if (dataItem.sexCd == 'F') {
                            spanObj = "<span class='icon_female'></span>";
                        }
                        return spanObj;
                    }
                }
                , { locked:true, field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:130 // 휴대전화  移???
                    ,attributes:{"class":"ac"}
                }
                , { locked:true,field:"intrCarlineNm", title:"<spring:message code='crm.lbl.intentionCarline' />", width:90 // 의향차종  意向??
                    ,attributes:{"class":"al"}
                }
                , {locked:true,field:"holdTpNm", title:"<spring:message code='crm.lbl.approchLocation' />", width:90 // 정보경로  ?索?源
                    ,attributes:{"class":"ac"}
                }
                , {field:"infoTpNm", title:"<spring:message code='crm.lbl.infoType' />", width:90 // 리드유형
                    ,attributes:{"class":"ac"}
                }
                , {field:"validGradeNm", title:"<spring:message code='crm.lbl.validCheck' />", width:70 // 유효성판단  有效性判?
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.validGradeCd == '01') {
                            spanObj = "<span class='icon_processing'></span>";
                        } else if (dataItem.validGradeCd == '02') {
                            spanObj = "<span class='icon_ok'></span>";
                        } else if (dataItem.validGradeCd == '03') {
                            spanObj = "<span class='icon_delete'></span>";
                        }
                        return spanObj;
                    }
                }
                , {field:"custTpNm", title:"<spring:message code='global.lbl.custTp' />", width:90 // 고객유형  客??型
                    ,attributes:{"class":"ac"}
                }
                , {field:"rvsitYn", title:"<spring:message code='crm.lbl.revisitYn' />", width:90 // 재방문여부  是否二次到店
                    ,attributes:{"class":"ac"}
                , template:'#if (rvsitYn !== "" && rvsitYn !== null )  {# #= rvsitYnMap[rvsitYn]# #}#'
                }
                , {field:"testDrvYn", title:"<spring:message code='crm.lbl.tdrvYn' />", width:90 // 시승여부
                    ,attributes:{"class":"ac"}
                    , template:'#if (testDrvYn !== ""){# #= yesOrNoMap[testDrvYn]# #}#'
                }
                , {field:"mngScNm", title:"<spring:message code='crm.lbl.prsNm' />", width:90 // 담당자  ??
                    ,attributes:{"class":"ac"}
                }
                , {field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:110 // 집전화  家庭??
                    ,attributes:{"class":"ac"}
                }
                , {field:"intrFscpModtpNm", title:"<spring:message code='crm.lbl.intentionVariant' />", width:180 // 의향차관
                    ,attributes:{"class":"al"}
                }
                , {field:"intrColorNm", title:"<spring:message code='crm.lbl.intentionColor' />", width:100 // 의향색상  意向?色
                    ,attributes:{"class":"al"}
                }
                , {field:"wechatId", title:"<spring:message code='global.lbl.wechat' />", width:120 // 위쳇  微信
                    ,attributes:{"class":"al"}
                }
                , {field:"vsitResvDtFormat", title:"<spring:message code='crm.lbl.visitAppointDt' />", width:130 // 방문예약시간  ??到店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitResvDtFormat !== null ){# #= kendo.toString(data.vsitResvDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , {field:"payTpNm", title:"<spring:message code='crm.lbl.payMethod' />", width:90 // 지불방식  支付方式
                    ,attributes:{"class":"ac"}
                }
//                 , {field:"expcPurcHmNm", title:"<spring:message code='crm.lbl.expcPurcDateTime' />", width:90 // 예상구매시간  ????
//                     ,attributes:{"class":"ac"}
//                 }
                , {field:"localCarRegNoYn", title:"<spring:message code='crm.lbl.plateNum' />", width:90 // 현지번호판예정  ?上本地牌
                    ,attributes:{"class":"ac"}
                    //, template:'#if (localCarRegNoYn !== ""){# #= yesOrNoMap[localCarRegNoYn]# #}#'
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.localCarRegNoYn == 'Y') {
                            spanObj = "<span class='icon_ok'></span>";
                        }
                        return spanObj;
                    }
                }
                , {field:"estimateCont", title:"<spring:message code='crm.lbl.estimateInfo' />", width:90 // 견정정보  ?价信息
                    ,attributes:{"class":"al"}
                }
                , {field:"salesCont", title:"<spring:message code='crm.lbl.promotionCont' />", width:200 // 판촉내용  促??容
                    ,attributes:{"class":"al"}
                }
//                 , {field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:200 // 비고설명  ?注?明
//                     ,attributes:{"class":"al"}
//                 }
                , {field:"traceGradeNm", title:"<spring:message code='crm.lbl.activeGrade' />", width:90 // 추적등급  ?踪等?
                    ,attributes:{"class":"ac"}
                }
                , {field:"invalidCauNm", title:"<spring:message code='crm.lbl.invalidReason' />", width:90 // 무효원인  无效原因
                    ,attributes:{"class":"ac"}
                }
                , {field:"failCauNm", title:"<spring:message code='crm.lbl.failReason' />", width:200 // 전패원인  ??原因
                    ,attributes:{"class":"ac"}
                }
                , {field:"failCauReasonCont", title:"<spring:message code='crm.lbl.failReasonAly' />", width:90 // 전패원인분석  ??原因分析
                    ,attributes:{"class":"al"}
                }
                , {field:"purcSelCarlineNm", title:"<spring:message code='crm.lbl.purchaSelCarline' />", width:90 // 구매선택차종  ????
                    ,attributes:{"class":"al"}
                }
//                 , {field:"purcFscpModtpNm", title:"<spring:message code='crm.lbl.purchaSelVariant' />", width:180 // 구매선택차관
//                     ,attributes:{"class":"al"}
//                 }
                , {field:"expcPurcDt", title:"<spring:message code='crm.lbl.expcPurcDt' />", width:90 // 예상구매일  ??成交??
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
                , {field:"expcDealPrc", title:"<spring:message code='crm.lbl.expcBpPrice' />", width:90 // 예상거래가격  ??交易价格
                    ,format:"{0:n2}"
                    ,attributes:{"class":"ar"}
                }
//                 ,{field:"traceDtFormat", title:"<spring:message code='crm.lbl.traceDt' />", width:130, attributes:{"class":"ac"}
//                     ,attributes:{"class":"ac tooltip-disabled"}
//                     ,template:"#if (traceDtFormat !== null ){# #= kendo.toString(data.traceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
//                 }
//                 ,{field:"nextTraceDtFormat", title:"<spring:message code='crm.lbl.nextTraceDt' />", width:130, attributes:{"class":"ac"}
//                     ,attributes:{"class":"ac tooltip-disabled"}
//                     ,template:"#if (nextTraceDtFormat !== null ){# #= kendo.toString(data.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
//                 }
                ,{field:"regDtFormat", title:"<spring:message code='global.lbl.newRegDt' />", width:130, attributes:{"class":"ac"}
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
//                 ,{field:"updtDtFormat", title:"<spring:message code='global.lbl.updtDt' />", width:130, attributes:{"class":"ac"}
//                     ,attributes:{"class":"ac tooltip-disabled"}
//                     ,template:"#if (updtDtFormat !== null ){# #= kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
//                 }
            ]
            ,multiSelectLocked:true
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,editable:false
            ,navigatable:false
            ,autoBind:false
            ,resizable:true
            //,height:460
        });
        // 전시장유동량 관리 그리드 종료 //

         $(".custSearch").click(function(){

             var custTp = $("#custTp").data("kendoExtDropDownList").value();
             var custNm = $("#custNmSearch").val();
             if (custTp == "02") {
                 custNm = $("#custNmSearchC").val();
             }

             popupWindow = dms.window.popup({
                 windowId:"customerSearchPopupMain"
                 , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                 , width:800
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                     , data:{
                         "autoBind":true
                         , "custNm":custNm
                         , "type"  :null
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log("Popup Search Result111:::");
                                 if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                     $("#custNo").val(data[0].custNo);
                                     $("#custNm").val(data[0].custNm);
                                     $("#custNmSearch").val(data[0].custNm);
                                     $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);
                                     $("#custTp").data("kendoExtDropDownList").enable(false);
                                     $("#hpNo").val(data[0].hpNo);
                                     $("#telNo").val(data[0].telNo);
                                     $("#officeTelNo").val(data[0].officeTelNo);
                                     $("#wechatId").val(data[0].wechatId);
                                     $("#emailNm").val(data[0].emailNm);
                                 }

                                 if (data[0].custTp == "01") {
                                    $("#hpNo").addClass('form_readonly');
                                    $("#hpNo").prop('readonly', true);
                                    $("#officeTelNo").removeClass('form_readonly');
                                    $("#officeTelNo").prop('readonly', false);
                                 } else {
                                    $("#officeTelNo").addClass('form_readonly');
                                    $("#officeTelNo").prop('readonly', true);
                                    $("#hpNo").removeClass('form_readonly');
                                    $("#hpNo").prop('readonly', false);
                                 }

                                 popupWindow.close();
                                 if (fn_leadSearch(data[0].custNo)) {
                                     dms.notification.warning("<spring:message code='crm.info.processingLead' />");
                                     return false;
                                 } else {
                                     $("#addrGrid").data("kendoExtGrid").dataSource.read();
                                 }
                                 //$("#btnCustSearch").click();
                             }
                         }
                     }
                 }
             })
         });

        //화면 로딩 시 권한에 다른 단계 id 확인 후 호출
        onSelectBtnStepClick(stepDivId);

        if ( dms.string.isNotEmpty(custNo)){
            var btnStep = "btnStep"+leadStatCd;
            onSelectBtnStepClick(btnStep);
            fn_popuplink();
        };

    });

    //todo 링크
    function fn_popuplink(){

        //var leadStatCd =
        var leadStatCd          = "${leadStatCd}";
        var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
        var heightVal = "474";

        if (leadStatCd == "01") {
            gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep01SalesOpptProcessPopup.do'/>";
        } else if (leadStatCd == "02") {
            gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep02SalesOpptProcessPopup.do'/>";
        } else if (leadStatCd == "03") {
            gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep03SalesOpptProcessPopup.do'/>";
        } else if (leadStatCd == "04") {
            gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep04SalesOpptProcessPopup.do'/>";
        } else {
            gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do'/>";
        }

        editCustPopupWindow = dms.window.popup({
            windowId:"selectEditSalesOpptProcessPopup"
            , width:"950"
            , height:heightVal
            , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
            , content:{
                url:gotoUrl
                , data:{
                    "autoBind":true
                    , "leadStatCd":leadStatCd
                    , "custNo":"${custNo}"
                    , "salesOpptSeq":"${salesOpptSeq}"
                    , "showRoomSeq":"${showRoomSeq}"
                    , "exhvFlakSeq":"${exhvFlakSeq}"
                    , "dataTable":""
                    , "callbackFunc":function(data) {
                        if (data[0] != "") {
                            $("#btnCtlSearch").click();
                        };
                    }
                }
            }
        })
    }

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
     function onSelectSearchVariant(e){
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(true);

        var dataItem = this.dataItem(e.item);
        if(dataItem.carlineCd == ""){
            $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do' />"
                ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
            ,async:false
        });
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

     function assignDivPopup(){
         var assignDiv = $("#assignDiv").data("kendoWindow");
         assignDiv.center();
         assignDiv.open();
     }

     /** [조회조건 영역] ComboBox Select() **/
     // 정보경로에 따른 상세경로 조회
     function onSelectSearchHoldTp(e){
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
         $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

         var dataItem = this.dataItem(e.item);
         console.log("dataItem onSelectSearchHoldTp:::::::::::::::::::");
         if(dataItem.cmmCd == ""){
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
             ,async:false
         });
         console.log("onSelectSearchHoldTp");
         if (responseJson.total == 0) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
         } else {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     }

     function onSelectBtnStepClick(selStep){

         var btnStep = selStep;

         if ( dms.string.isEmpty(btnStep)){
             btnStep = $("#stepDiv").children("ul").children("li").eq(0).attr('id');
         }

         var leadStatCd = btnStep.substring(btnStep.length-2,btnStep.length);

         var bfStep = $("#bfStep").val();

         $("#sLeadStatCd").data("kendoExtDropDownList").value(leadStatCd);
         $("#leadStatCd").val(leadStatCd);

         $("[id^='btnStep']").attr("class", "");
         $("#"+btnStep).attr("class", "on");
         $("[id^=btnCtl]").hide();
         $("[class*="+btnStep+"]").show();

         if (btnStep == "btnStep00") {
             $("#sLeadStatCd").data("kendoExtDropDownList").enable(true);
         } else {
             $("#sLeadStatCd").data("kendoExtDropDownList").enable(false);
         }

         // 검색조건 책임자 변경
         if ( btnStep == "btnStep01"
                 || btnStep == "btnStep02" ) {
             $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
         } else if ( btnStep == "btnStep03"
             || btnStep == "btnStep04" ) {
             $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
         } else if ( btnStep == "btnStep99" ) {
             $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
         } else {
             $("#sMngScId").data("kendoExtDropDownList").setDataSource(mngScIdList);
         }
         $("#sMngScId").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });

         // 조회 권한에 따라 sMngScId 컬럼을 활성화 / 비활성화
         var mngScIdCtrl = "${mngScIdCtrl}";

         if (btnStep == "btnStep99") {
           //검색조건 권한 체크
             $("#sMngScId").data("kendoExtDropDownList").enable(true);
             $("#sMngScId").data("kendoExtDropDownList").value("");
             if (mngScIdCtrl == "N") {
                 $("#sMngScId").data("kendoExtDropDownList").value("${loginUsrId}");
                 $("#sMngScId").data("kendoExtDropDownList").enable(false);
             }

             $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value(new Date(toDt.getFullYear(),toDt.getMonth(),'01'));
             $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(toDt);

             $(".srItem").text("<spring:message code='crm.lbl.visitDate' />");   // 방문일
             $(".srHide").hide();
             $(".onlyShowRoomShow").show();
             $("#salesOpptProgGrid").removeClass("resizable_grid");
             $("#salesOpptShowRoomGrid").addClass("resizable_grid");

             $("#salesOpptProgGridArea").hide();
             $("#salesOpptShowRoomGridArea").show();

             resizeGrid();

         } else {
             //검색조건 권한 체크
             if (mngScIdCtrl == "N") {
                 $("#sMngScId").data("kendoExtDropDownList").value("${loginUsrId}");
                 $("#sMngScId").data("kendoExtDropDownList").enable(false);
             }

             // 날짜검색 라벨 변경
             $(".srItem").text("<spring:message code='crm.lbl.submitDt' />");   // 제출일
             $(".srHide").show();
             $(".onlyShowRoomShow").hide();
             if ( bfStep == "99" ) {
                 $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value(new Date(year,twoMthAgo,'01'));
                 $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(toDt);
//              } else {
//                  console.log($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value());
//                  console.log($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value());
//                  if( dms.string.isEmpty($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value()) ) {
//                      $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value(new Date(year,twoMthAgo,'01'));
//                  }
//                  if( dms.string.isEmpty($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value()) ) {
//                      $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(toDt);
//                  }
             }


             $("#salesOpptProgGrid").addClass("resizable_grid");
             $("#salesOpptShowRoomGrid").removeClass("resizable_grid");

             $("#salesOpptProgGridArea").show();
             $("#salesOpptShowRoomGridArea").hide();

             resizeGrid();
         }

         // 검색조건 기본값 셋티을 위해 이전 단계값을 체크해야함.
         $("#bfStep").val(leadStatCd);

         console.log("btnCtlSearch !!! ");
         $("#btnCtlSearch").click();
     }

     function fn_passwdChk(pwd){
         // 비밀번호 체크 시작
         var usrPw = hex_sha2(pwd);

         if (dms.string.isEmpty(pwd)) {
             dms.notification.info("<spring:message code='crm.info.emptyPw' />");
             return false;
         }

         var pwParam = {};

         pwParam["sPassword"] = usrPw;

         console.log("pwParam !!! ");
         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
             ,data:JSON.stringify(pwParam)
             ,async:false
         });

         return responseJson;
     }


     // using addrDetlUsingYn parameter to control the address INPUT box show or not
     var addrDetlUsingYn = "Y";
     if(addrDetlUsingYn === "Y"){
         var height=435;
     }else if(addrDetlUsingYn === "N"){
         var height=420;
     }

     function fn_callAddrPopUp(iframe) {
         zipCodeSearchPopupWin = dms.window.popup({
             windowId:"zipCodeSearchPopupWin"
             , width:"800"
             , height:height
             , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
             , content:{
                 url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                 , data:{
                     "autoBind":false
                     ,"usrNm":""
                     ,"addrDetlUsingYn":addrDetlUsingYn
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             var windowElement = $("#"+iframe);
                             var iframeDomElement = windowElement.children("iframe")[0];
                             var iframeWindowObject = iframeDomElement.contentWindow;
                             iframeWindowObject.insertAddressItemAdd(data);
                         }
                     }
                 }
             }
         })
     }

     function fn_custSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn, hpNo, closeYn) {

         var custTp = custTp;
         var custCd = custCd;
         var custNm = custNm;

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , width:800
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":autoBind
                     , "custNm":custNm
                     , "type"  :type
                     , "custCd":custCd
                     , "hpNo":hpNo
                     , "closeYn":closeYn
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             console.log("Popup Search fn_custSearchPopUp:::");
                             var windowElement = $("#"+iframe);
                             var iframeDomElement = windowElement.children("iframe")[0];
                             var iframeWindowObject = iframeDomElement.contentWindow;
                             iframeWindowObject.fn_custSearchRlt(data);

                             popupWindow.close();

                         }
                     }
                 }
             }
         });
     }

     function fn_relCustSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn, relHpNo, closeYn) {

         var custTp = custTp;
         var custCd = custCd;
         var custNm = custNm;

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , width:800
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":autoBind
                     , "custNm":custNm
                     , "type"  :type
                     , "custCd":custCd
                     , "hpNo":relHpNo
                     , "closeYn":closeYn
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             console.log("Popup Search fn_custSearchPopUp:::");
                             var windowElement = $("#"+iframe);
                             var iframeDomElement = windowElement.children("iframe")[0];
                             var iframeWindowObject = iframeDomElement.contentWindow;
                             iframeWindowObject.fn_relCustSearchRlt(data);

                             popupWindow.close();
                         }
                     }
                 }
             }
         })
     }

     function fnChkDateValue(e){

         var  elmt  = e.sender.element[0],
              id    = elmt.id,
              toYY,
              toMM,
              toDD,
              frYY,
              frMM,
              frDD;

         if(this.value() == null){
             if(id === 'sSubmitDtFrom'){
                 $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").max(new Date(2200,12,31));
                 $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
             }else if(id === 'sSubmitDtTo'){
                 $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").max(new Date(2200,12,31));
                 $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
             }
             if(id === 'sRegDtFrom'){
                 $("#sRegDtFrom").data("kendoExtMaskedDatePicker").max(new Date(2200,12,31));
                 $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
             }else if(id === 'sRegDtTo'){
                 $("#sRegDtFrom").data("kendoExtMaskedDatePicker").max(new Date(2200,12,31));
                 $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
             }
         }else{
             if(id === 'sSubmitDtFrom'){
                 frYY = this.value().getFullYear();
                 frMM = this.value().getMonth();
                 frDD = this.value().getDate();
                 $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
             }else if(id === 'sSubmitDtTo'){
                 toYY = this.value().getFullYear();
                 toMM = this.value().getMonth();
                 toDD = this.value().getDate();
                 $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
             }else if(id === 'sRegDtFrom'){
                 frYY = this.value().getFullYear();
                 frMM = this.value().getMonth();
                 frDD = this.value().getDate();
                 $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
             }else if(id === 'sRegDtTo'){
                 toYY = this.value().getFullYear();
                 toMM = this.value().getMonth();
                 toDD = this.value().getDate();
                 $("#sRegDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
             }
         }

      }

     function nextTraceDtChk(traceDt, nextTraceDt) {
         var today = new Date();
         var traceChk = "Y";

         if (traceDt < nextTraceDt && nextTraceDt < today) {
             traceChk = "N";
         }

         return traceChk;
     }

     //화면 로딩 시 권한에 다른 단계 id 확인
     var stepDivId = $("#stepDiv").children("ul").children("li").eq(0).attr('id');

     <%-- IB가 있는경우 --%>
     <c:if test="${callTelNo != ''}">

         var callTelNo = "<c:out value='${callTelNo}' />";
         var params = {};
         params["sCust"] = callTelNo;

         $.ajax({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
             ,type:'POST'                        //조회요청
             ,data:JSON.stringify(params)
             ,dataType:"json"
             ,contentType:"application/json"
             ,error:function(jqXHR,status,error){
                 dms.notification.error(jqXHR.responseJSON.errors);
             }
         }).done(function(jqXHR, textStatus) {

             if( jqXHR.total > 0 ) {
                 $("#sCust").val(callTelNo);
                 $("#salesOpptProgGrid").data("kendoExtGrid").dataSource.page(1);
             };

         });

     </c:if>


     /**
     **     콜센터에서 IB 종료후 해당 함수를 호출해서 콜센터 통화 정보를 넘겨준다.
     **     TODO 통화 종료 정보를 받으면 해당 함수를 호출. 다음 Action 구현.
     **/
    function sendToOpptCallInfo(callHisSeq, callFileNm, callDeviceIpNo, callStartDt, callHm){

        if (  dms.string.isEmpty(callHisSeq) ) {
            // {콜센터이력일련번호}을(를) 확인하여 주세요.
            dms.notification.warning("<spring:message code='crm.lbl.callHisSeq' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
            return;
        };
        if (  dms.string.isEmpty(callFileNm) ) {
            // {녹취파일}을(를) 확인하여 주세요.
            dms.notification.warning("<spring:message code='crm.lbl.recFileId' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
            return;
        };

        if( dms.string.isEmpty(callHm) ) {
            callHm = 0;
        };

        var parseCallStartDt = kendo.parseDate(callStartDt, "<dms:configValue code='dateTimeFormat' />");
        var parseCallEndDt = kendo.parseDate(callStartDt, "<dms:configValue code='dateTimeFormat' />");
        parseCallEndDt.setSeconds(parseCallEndDt.getSeconds() + (Number(callHm)));        // 종료시간 설정

        callDeviceInit();

    };

    // 디바이스 상태를 대기 상태로 초기화한다.
    function callDeviceInit() {

        var params = "event_type=8&line=1&ibseq=&obseq=&device_id=&device_ip=&caller=&RingCnt=&device_port=&duration=&TimeLong=&FilePath=&date=&userId=<c:out value='${scId}' />";

        $.ajax({
            url:"<c:url value='/crm/cal/callCenter/callReceive.do' />?"+params
            ,type:'GET'                        //조회요청
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors);
            }
        }).done(function(jqXHR, textStatus) {
        });

    };

</script>
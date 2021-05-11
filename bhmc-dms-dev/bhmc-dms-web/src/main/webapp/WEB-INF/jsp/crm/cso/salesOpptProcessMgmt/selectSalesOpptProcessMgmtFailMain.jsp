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
                        <ul class="tabmenu3">
                        <dms:access viewId="VIEW-D-11098" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                            <li id="btnStep09"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep09');" ><spring:message code='crm.btn.failed' /><!-- 실패 --></a></li>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11099" hasPermission="${dms:getPermissionMask('READ')}" buttonYn="N">
                            <li id="btnStep08"><a href="javascript:;" onclick="javascript:onSelectBtnStepClick('btnStep08');" ><spring:message code='crm.btn.trans' /><!-- 전출 --></a></li>
                        </dms:access>
                        </ul>
                    </div>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-13187" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnCtlAssign" class="btn_m btn_assignment btnStep08"><spring:message code='global.btn.assign' /><!-- 배정 分配 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11100" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnCtlSearch" class="btn_m btn_search btnStep08 btnStep09"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11101" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnCtlUpdate" class="btn_m btn_modify btnStep08 btnStep09"><spring:message code='global.btn.update' /><!-- 수정 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11102" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnCtlExcelExport" class="btn_m btn_excel btnStep08 btnStep09"><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
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
                                <th scope="row"><spring:message code='crm.lbl.submitDt' /></th> <!-- 제출일-->
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
                                <th scope="row"><spring:message code='global.lbl.newRegDt' /></th> <!-- 신규일자-->
                                <td>
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

<%--                                 <th scope="row"><spring:message code='crm.lbl.bhmcLeadyn' /></th> <!-- BHMC 리드 여부  是否? BHMC?索 --> --%>
<!--                                 <td> -->
<!--                                     <input type="text" id="sBhmcYn" value="" class="form_comboBox" /> -->
<!--                                 </td> -->

                                <th scope="row"><spring:message code='crm.lbl.beforeLeadStat' /></th> <!-- 실패 단계 -->
                                <td>
                                    <input type="text" id="sBefLeadStatCd" value="" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <input type="text" id="sCustNo" name="sCustNo" value="" class="form_input"  />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.channelType' /></th> <!-- 채널유형 -->
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
                <input type="hidden" id="leadStatCd" value="" />
            </section>
        </div>
<!--  ************************** assignDiv **************************** -->
        <section id="assignDiv" class="pop_wrap"> <!-- assignDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnAssign" class="btn_s"><spring:message code='crm.btn.activeProcessSend' /><!-- 추적추진으로 제출 --></button>
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
                                    <input id="assignUsers" name="assignUsers" type="text" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="al"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td>
                                    <input id="usrPw" name="usrPw" type="password" class="form_input form_readonly"  data-json-obj="true" />
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

    var year = toDt.getFullYear();
    var month = toDt.getMonth()+1;
    var twoMthAgo = (toDt.getMonth()+1) -3;
    var day = toDt.getDate();

    var excelUploadPopupWin;

    var addrTpList = [];
    var addrTpMap = [];
    var yesOrNoList = [];
    var yesOrNoMap = [];
    var carlineCdList = [];
    var carlineCdMap = [];
    var mngScIdList = [];
    var mngScIdMap = [];

    var leadStatCdList = [];
    var befLeadStatCdList = [];
    var leadStatCdMap = [];
    var modelCdList = [];
    var modelCdMap = [];
    var activeGradeCdList = [];
    var activeGradeCdMap = [];
    var failedCdList = [];
    var failedCdMap = [];

    var holdTpList = [];
    var holdTpMap = [];

    var infoTpList = [];

    var usersRoleCrmR03 = [];

    var dstbChnList = [];
    var dstbChnMap = [];

    var purposeTagList = [];
    var purposeTagMap = [];
    
    <c:forEach var="obj" items="${usersRoleCrmR03}">
        usersRoleCrmR03.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${infoTpList}">
        infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${leadStatCdList}">
        <c:if test="${obj.remark1 == 'F'}">
            leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${leadStatCdList}">
        <c:if test="${obj.remark1 == 'S'}">
            befLeadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    </c:forEach>

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

    yesOrNoList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    yesOrNoList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    yesOrNoMap["Y"] = "<spring:message code='global.lbl.yes' />";
    yesOrNoMap["N"] = "<spring:message code='global.lbl.n' />";

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

    //실패사유
    <c:forEach var="obj" items="${failedCdList}">
        failedCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        failedCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${purposeTagList}">
	  purposeTagList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	  purposeTagMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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
         params["sBefLeadStatCd"] = $("#sBefLeadStatCd").data("kendoExtDropDownList").value();
         params["sCustNo"] = $("#sCustNo").val();
         //params["sBhmcYn"] = $("#sBhmcYn").data("kendoExtDropDownList").value();

         params["sSubmitDtFrom"] = $("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value();
         params["sSubmitDtTo"] = $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value();
//          20210112 update tjx 新建日期使用画面上的字段
//          params["sLeadStartDtFrom"] = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
//          params["sLeadStartDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
         params["sRegDtFrom"] = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
         params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

         params["sIntrCarlineCd"] = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
         params["sIntrFscpModtpCd"] = $("#sIntrFscpModtpCd").data("kendoExtDropDownList").value();
         params["sTraceGradeCd"] = $("#sTraceGradeCd").data("kendoExtDropDownList").value();

         if ($("#leadStatCd").val() == "99") { // 전시장유동량
             params["sLeadStatCd"] = $("#leadStatCd").val();
         }

         /* 판매기회프로세스 단계와 , 실패/전출 상태에 대한 구분
          *판매기회 단계에서는 실패,전출단계 데이터가 보이면 안 됨.
          *S:진행중 , F:실패/전출
         */
         params["sLeadStatIng"] = "F";
         params["sPurposeTag"] = $("#sPurposeTag").data("kendoExtDropDownList").value();

         return params;

     };

     setKendoDate = function( dtValue){
         return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
     };

    $(document).ready(function() {
    	$("#sPurposeTag").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(purposeTagList)
            , index:0
        });
        $("#sMngScId").kendoExtDropDownList({
            dataTextField:"usrNm"
           ,dataValueField:"usrId"
           ,dataSource:mngScIdList
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

        $("#sBefLeadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(befLeadStatCdList)
            , index:0
        });

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
           ,optionLabel:" "
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
             ,draggable:true
             ,modal:false
             ,resizable:false
             ,visible:false
             ,title:"<spring:message code='global.title.scIdAssign' />"      // 담당자 배정
             ,width:"300px"
             ,height: "125px"
         }).data("kendoWindow");

         // 조회
         $("#btnCtlSearch").kendoButton({
             click:function(e) {
                 var leadStatCd = $("#leadStatCd").val();
                 if ( dms.string.isEmpty(leadStatCd)){
                     dms.notification.info("<spring:message code='crm.lbl.step' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                     return false;
                 }

                 if(crmJs.isDateValidPeriod($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value()
                         ,$("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                     if(crmJs.isDateValidPeriod($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value()
                             ,$("#sRegDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                         if (leadStatCd == "99") {
                             $("#salesOpptShowRoomGrid").data("kendoExtGrid").dataSource.read();
                         } else {
                             $("#salesOpptProgGrid").data("kendoExtGrid").dataSource.read();
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

                 if (salesOpptPwYn == "Y"){
                     $("#usrPw").attr("readonly", false);
                     $("#usrPw").removeClass("form_readonly");
                 }

                 assignDiv.center();
                 assignDiv.open();
             }
          });


         // 배정 담당자
         $("#assignUsers").kendoExtDropDownList({
             dataTextField:"usrNm"
             , dataValueField:"usrId"
             , dataSource:mngScIdList
             , index:0
             , optionLabel:" "
             , filter:"contains"
             , filtering:function(e){
                 var filter = e.filter;
             }
         });

         // 배정저장
         $("#btnAssign").kendoButton({
             click:function(e){

                 var usrPw = hex_sha2($("#usrPw").val());

                 if (salesOpptPwYn == "Y") {
                     if (dms.string.isEmpty($("#usrPw").val())) {
                         dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                         return false;
                     }
                    // 비밀번호 체크 시작
                    var fnPasschk = fn_passwdChk();
                    if (fnPasschk == false){
                        dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                        return false;
                    }
                    // 비밀번호 체크 끝
                 }
                 // kjlee

                 var saveList      = [],
                     grid          = $("#salesOpptProgGrid").data("kendoExtGrid"),
                     rows          = grid.tbody.find("tr"),
                     assignMngScId   = $("#assignUsers").data("kendoExtDropDownList").value(),
                     userList      = [],
                     chkRow,
                     saveData;

                    userList.push({"usrId":assignMngScId, "usrNm":assignMngScId});

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
                         data.leadStatCd = "04";
                         saveList.push(data);
                     }
                 });

                 if(saveList.length == 0 ){
                     // 배정목록 / 을(를) 선택해주세요.
                     dms.notification.warning("<spring:message code='global.btn.assignList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                     return false;
                 }

                 saveData = {
                     "assignList":saveList
                     ,"userList":userList
                 };

                 console.log("SalesOpptProcess Assign !!!");
//                  console.log(saveData);

                 $.ajax({
                     url:"<c:url value='/crm/ass/assign/updateSalesOpptAssign.do' />"
                     ,data:JSON.stringify(saveData)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR, status, error) {
                         console.log(error);
                         console.log(jqXHR.responseJSON);
                         //dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {

                         grid.dataSource._destroyed = [];
                         grid.dataSource.page(1);
                         $("#assignUsers").data("kendoExtDropDownList").value("");

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
               , befLeadStatCd = selectedItem.befLeadStatCd
               , exhvFlakSeq = selectedItem.exhvFlakSeq
               , dataTable = selectedItem.dataTable
           ;
           var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";
           var heightVal = "458";

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
                      , "befLeadStatCd":befLeadStatCd
                      , "custNo":custNo
                      , "salesOpptSeq":seq
                      , "showRoomSeq":seq
                      , "exhvFlakSeq":exhvFlakSeq
                      , "dataTable":dataTable
                      , "callbackFunc":function(data) {
                          //console.log(data);
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
                , befLeadStatCd = selectedItem.befLeadStatCd
                , exhvFlakSeq = selectedItem.exhvFlakSeq
                , dataTable = selectedItem.dataTable
            ;
            var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";
            var heightVal = "458";

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
                       , "befLeadStatCd":befLeadStatCd
                       , "custNo":custNo
                       , "salesOpptSeq":seq
                       , "showRoomSeq":seq
                       , "exhvFlakSeq":exhvFlakSeq
                       , "dataTable":dataTable
                       , "callbackFunc":function(data) {
                           //console.log(data);
                           if (data[0] != "") {
                               $("#btnCtlSearch").click();
                           };
                       }
                   }
               }
           })
       });

       //버튼 - 엑셀저장
       $("#btnCtlExcelExport").kendoButton({
           click:function(e) {

               var params = {};
               params = gridCommonParams();



               if(crmJs.isDateValidPeriod($("#sSubmitDtFrom").data("kendoExtMaskedDatePicker").value()
                       ,$("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                   if(crmJs.isDateValidPeriod($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value()
                           ,$("#sRegDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                       if (leadStatCd == "99") {
                           $("#salesOpptShowRoomGrid").data("kendoExtGrid").dataSource.read();
                       } else {
                           $("#salesOpptProgGrid").data("kendoExtGrid").dataSource.read();
                       }
                   }else{
                       $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                       $("#sRegDtTo").focus();
                   }
               }else{
                   $("#sSubmitDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                   $("#sSubmitDtTo").focus();
               }


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

                       //console.log("resultCnt : ",resultCnt)
                       <c:set value="10000" var="maxCnt" />;
                       var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                       if ( resultCnt > excelMaxExportCnt ) {
                           // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                           dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                           return;
                       };

                       var leadStatCd = $("#leadStatCd").val();
                       var grid = $("#salesOpptProgGrid").data("kendoExtGrid");
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
                           ,"templateFile":"SalesOpptProcessFailExp_Tpl.xlsx"
                           ,"fileName":"<spring:message code='crm.menu.failCustomerDB' />_"+sysDtVal+".xlsx"
                           ,"sCust":$("#sCust").val()
                           ,"sCustNm":$("#sCustNm").val()
                           ,"sHpNo":$("#sHpNo").val()
                           ,"sMngScId":$("#sMngScId").data("kendoExtDropDownList").value()
                           ,"sDstbChnCd":$("#sDstbChnCd").data("kendoExtDropDownList").value()
                           ,"sHoldTp":$("#sHoldTp").data("kendoExtDropDownList").value()
                           ,"sInfoTp":$("#sInfoTp").data("kendoExtDropDownList").value()
                           ,"sLeadStatCd":sLeadStatCd
                           ,"sBefLeadStatCd":$("#sBefLeadStatCd").data("kendoExtDropDownList").value()
                           ,"sSubmitDtFrom":setKendoDate(sSubmitDtFrom)
                           ,"sSubmitDtTo":setKendoDate(sSubmitDtTo)
                           ,"sRegDtFrom":setKendoDate($("#sRegDtFrom").data("kendoExtMaskedDatePicker").value())
                           ,"sRegDtTo":setKendoDate($("#sRegDtTo").data("kendoExtMaskedDatePicker").value())
                           ,"sIntrCarlineCd":$("#sIntrCarlineCd").data("kendoExtDropDownList").value()
                           ,"sIntrFscpModtpCd":$("#sIntrFscpModtpCd").data("kendoExtDropDownList").value()
                           ,"sTraceGradeCd":$("#sTraceGradeCd").data("kendoExtDropDownList").value()
                           ,"sLeadStatIng":"F"
                           ,"sCustNo":$("#sCustNo").val()
                           ,"sPurposeTag":$("#sPurposeTag").data("kendoExtDropDownList").value()
                       });

                   }
               });

           }
           ,enable:false
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
                  , befLeadStatCd
                  , exhvFlakSeq
                  , dataTable
                ;

                var saveList      = [];

                rowsPG.each(function(index, row) {
                    var gridData = progGrid.dataSource.at(index);
                    var data={};

                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    //console.log("index: " + index + ":chkRow:" + chkRow);

                    if(chkRow === true){
                        custNo = gridData.custNo;
                        seq = gridData.seq;
                        leadStatCd = gridData.leadStatCd;
                        befLeadStatCd = gridData.befLeadStatCd;
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

                var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";
                var heightVal = "458";

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
                            , "befLeadStatCd":befLeadStatCd
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

        // 검색조건 show/hide
        $("#btnHidden").kendoButton({
            click:function(e){
                $("#hiddenTable").toggle();
                $("#btnHidden").toggleClass("active");

                var leadStatVal = $("#leadStatCd").val();
                var stepDivId = "btnStep"+leadStatVal;
                onSelectBtnStepClick(stepDivId);
            }
        });



        // 판매기회 관리 그리드 시작 //
        $("#salesOpptProgGrid").kendoExtGrid({
            gridId:"G-CRM-0328-141772"
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
                            , ctlPanel :{type:"string", editable:true}
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
                            , submitDtFormat:{type:"date"}
                            , exhvFlakSeq:{type:"String"}
                            , purposeTagNm:{type:"String"}
                        }
                    }
                    ,parse:function(d) {
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
                , { locked:true, field:"leadStatNm", title:"<spring:message code='crm.lbl.leadStat' />", width:90 // 리드상태
                    ,attributes:{"class":"ac"}
                }
                , { locked:true, field:"befLeadStatNm", title:"<spring:message code='crm.lbl.beforeLeadStat' />", width:90 // 이전리드상태
                    ,attributes:{"class":"ac"}
                }
                , { locked:true, field:"befLeadStatCd", title:"<spring:message code='crm.lbl.beforeLeadStat' />", width:90 // 이전리드상태
                    ,attributes:{"class":"ac"}
                    ,hidden:true
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
//                 , {field:"evalNm", title:"<spring:message code='global.lbl.examinTp' />", width:90
//                     ,attributes:{"class":"ac"}
//                     ,template:function(dataItem){
//                         var spanObj = "";
//                         if (dataItem.evalCd == "02") {
//                             spanObj = "<span class='txt_label bg_red'>"+dataItem.evalNm+"</span>";
//                         } else {
//                             spanObj = "<span class='txt_label bg_blue'>"+dataItem.evalNm+"</span>";
//                         }
//                         return spanObj;
//                     }
//                 }  // 심사구분
//                 , { locked:true, field:"evalCd", title:"<spring:message code='global.lbl.examinTp' />", width:110
//                     ,attributes:{"class":"ac"}
//                     ,hidden:true
//                 }  // 심사구분
                , {field:"trsfTpNm", title:"<spring:message code='crm.btn.transType' />", width:90 // 전출유형
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
                    ,attributes:{"class":"ac"
                    ,sortable:true}
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
//                 , {field:"rvsitYn", title:"<spring:message code='crm.lbl.revisitYn' />", width:90 // 재방문여부  是否二次到店
//                     ,attributes:{"class":"ac"}
//                     , template:'#if (rvsitYn !== ""){# #= yesOrNoMap[rvsitYn]# #}#'
//                 }
                , {field:"rvsitYnNm", title:"<spring:message code='crm.lbl.revisitYn' />", width:90 // 재방문여부  是否二次到店
                    ,attributes:{"class":"ac"}
                }

                , {field:"vsitEndDtFormat", title:"<spring:message code='crm.lbl.goOutTime' />", width:130 // 떠난시간  ?店??
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (vsitEndDtFormat !== null ){# #= kendo.toString(data.vsitEndDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                , {field:"payTpNm", title:"<spring:message code='crm.lbl.payMethod' />", width:90 // 지불방식  支付方式
                    ,attributes:{"class":"ac"}
                }
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
                , {field:"failCauReasonCont", title:"<spring:message code='crm.lbl.failReasonAly' />", width:90 // 실패원인분석
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
                    ,attributes:{"class":"ar"}
                }
                ,{field:"traceDtFormat", title:"<spring:message code='crm.lbl.traceDt' />", width:130, attributes:{"class":"ac"}
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (traceDtFormat !== null ){# #= kendo.toString(data.traceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                }
                ,{field:"nextTraceDtFormat", title:"<spring:message code='crm.lbl.nextTraceDt' />", width:130, attributes:{"class":"ac"}
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (nextTraceDtFormat !== null ){# #= kendo.toString(data.nextTraceDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
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
            ,editable:false
            ,navigatable:false
            ,autoBind:false
            ,resizable:true
            ,height:460
        });
        // 판매기회 관리 그리드 종료 //

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
//                                  console.log(data[0]);
//                                  console.log(data[0].custNo);
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

        //todo 링크
        if ( dms.string.isNotEmpty(custNo)){

            if ( leadStatCd == "08" ) {
                onSelectBtnStepClick('btnStep08');
            } else if ( leadStatCd == "09" ) {
                onSelectBtnStepClick('btnStep09');
            }
            fn_popuplink();
        };
    });

    //todo 링크
    function fn_popuplink(){

        var gotoUrl = "<c:url value='/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";
        var heightVal = "458";

        editCustPopupWindow = dms.window.popup({
           windowId:"selectEditSalesOpptProcessPopup"
           , width:"950"
           , height:heightVal
           , title:"<spring:message code='crm.lbl.infoInput' />"    // 정보입력 信息?入
           , content:{
               url:gotoUrl
               , data:{
                   "autoBind":true
                   , "leadStatCd":"${leadStatCd}"
                   , "befLeadStatCd":"${befLeadStatCd}"
                   , "custNo":"${custNo}"
                   , "salesOpptSeq":"${salesOpptSeq}"
                   , "showRoomSeq":"${showRoomSeq}"
                   , "exhvFlakSeq":"${exhvFlakSeq}"
                   , "dataTable":""
                   , "callbackFunc":function(data) {
//                        console.log(data);
                       if (data[0] != "") {
                           $("#btnCtlSearch").click();
                       };
                   }
               }
           }
        });
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
//          console.log(dataItem);
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
//          console.log(responseJson.total);
         if (responseJson.total == 0) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
         } else {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     }

     function onSelectBtnStepClick(selStep){

         var btnStep = selStep;
         var opptGridTitle;
         console.log("btnStep !!! " + btnStep);

         if ( dms.string.isEmpty(btnStep)){
             btnStep = $("#stepDiv").children("ul").children("li").eq(0).attr('id');
         }

         var leadStatCd = btnStep.substring(btnStep.length-2,btnStep.length);

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
         if ( btnStep == "btnStep09" ) { //실패

             $("#sMngScId").data("kendoExtDropDownList").setDataSource(mngScIdList);
             var salesOpptProgGrid = $("#salesOpptProgGrid").data("kendoExtGrid");
             salesOpptProgGrid.hideColumn("trsfTpNm");
             opptGridTitle = {"befLeadStatNm":"<spring:message code='crm.lbl.beforeLeadStat' />"} //실패단계
             salesOpptProgGrid.setColumnHeaderText(opptGridTitle);
//              salesOpptProgGrid.showColumn("evalNm");
         } else if ( btnStep == "btnStep08" ) { //전출

             $("#sMngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
             var salesOpptProgGrid = $("#salesOpptProgGrid").data("kendoExtGrid");
             salesOpptProgGrid.showColumn("trsfTpNm");
             opptGridTitle = {"befLeadStatNm":"<spring:message code='crm.lbl.transStat' />"} //전출단계
             salesOpptProgGrid.setColumnHeaderText(opptGridTitle);
//              salesOpptProgGrid.hideColumn("evalNm");
         }
         $("#sMngScId").data("kendoExtDropDownList").dataSource.sort({ field: "usrNm", dir: "asc" });


         // 조회 권한에 따라 sMngScId 컬럼을 활성화 / 비활성화
         var mngScIdCtrl = "${mngScIdCtrl}";
//          if (mngScIdCtrl == "N") {
//              $("#sMngScId").data("kendoExtDropDownList").value("${loginUsrId}");
//              $("#sMngScId").data("kendoExtDropDownList").enable(false);
//          }

         resizeGrid();

         $("#btnCtlSearch").click();
     }

     function fn_passwdChk(){
         // 비밀번호 체크 시작
         var usrPw = hex_sha2($("#usrPw").val());
         if (dms.string.isEmpty($("#usrPw").val())) {
             dms.notification.info("<spring:message code='crm.info.emptyPw' />");
             return false;
         }

         var pwParam = {};

         pwParam["sPassword"] = usrPw;

         console.log("pwParam !!! ");
//          console.log(pwParam);
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
                             //console.log(data);
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

     function fn_relCustSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn) {

         var custTp = custTp;
         var custCd = custCd;
         var custNm = custNm;

         //console.log("fn_custSearchPopUp :" + custNm);
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
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             console.log("Popup Search fn_custSearchPopUp:::");
                             var windowElement = $("#"+iframe);
                             var iframeDomElement = windowElement.children("iframe")[0];
//                              console.log(iframeDomElement);
                             var iframeWindowObject = iframeDomElement.contentWindow;
                             iframeWindowObject.fn_relCustSearchRlt(data);

                             popupWindow.close();
                         }
                     }
                 }
             }
         })
     }

     //화면 로딩 시 권한에 다른 단계 id 확인
     var stepDivId = $("#stepDiv").children("ul").children("li").eq(0).attr('id');


</script>
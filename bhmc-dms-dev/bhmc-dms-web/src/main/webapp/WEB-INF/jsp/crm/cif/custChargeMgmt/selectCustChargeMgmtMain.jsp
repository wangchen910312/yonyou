<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<div id="resizableContainer">
    <!-- 고객 예치금 관리 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.lbl.custChargeMgmt" /><!-- 고객 예치금 관리 --></h1>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11049" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11050" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_add" id="btnChargeAdd"><spring:message code="crm.btn.chargeAdd" /><!-- 예치금 추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13154" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_delete" id="btnChargeMin"><spring:message code="crm.btn.chargeMinus" /><!-- 예치금 차감 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11051" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCtlExcelExport" class="btn_m btn_excel "><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:21%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <input id="sCustNm" name="sCustNm" class="form_input" maxlength="20" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                        <td>
                            <input id="sHpNo" name="sHpNo" class="form_input" maxlength="14" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.lastTradeDate" /><!-- 최근 거래 날자  --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartDt" name="sStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                    <div class="date_right">
                                    <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10" >
            <div id="customerChargeMgmtMainGrid" class="resizable_grid"></div>
        </div>
    </section>
</div>


    <!-- //고객 예치금 관리 button click tab popup -->
    <section id="windowMst" class="pop_wrap" style="display:none;">
        <div id="chargeAddTab" class="tab_area"><!-- charge Add Tab start -->
            <!-- 탭메뉴 -->
            <ul>
                <li id="defaultInfoTab" class="k-state-active"><spring:message code="global.title.defaultInfo" /><!-- 기본정보 0 --></li>
                <li id="historyTab"><spring:message code="crm.lbl.historyRecord"/><!-- 이력 기록 --></li>
            </ul>
            <div id="chargeAddDefaultInfoTabDiv" class="mt0"><!-- default information tab start -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.defaultInfo" /></h2><!-- 기본정보 -->
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="btnSaveCharge" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </div>
                </div>
                <div class="table_form">
                    <form id="chargeAddDefaultInfoForm" >
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:24%;">
                                <col style="width:10%;">
                                <col style="width:23%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                    <td>
                                        <input id="sCustNmAdd" name="sCustNmAdd" readonly="readonly" class="form_input form_readonly" maxlength="20" data-json-obj='true' />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객 번호 --></th>
                                    <td>
                                        <input id="sCustNoAdd" name="sCustNoAdd" readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대폰 번호 --></th>
                                    <td>
                                        <input id="sHpNoAdd" name="sHpNoAdd" readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.ableAmt" /><!-- 가용 금액 --></th>
                                    <td>
                                        <input id="sAbleAmtAdd" name="sAbleAmtAdd" readonly="readonly" class="form_readonly form_numeric ar" maxlength="20" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.totalRchgAmt" /><!-- 총충전금액--></th>
                                    <td>
                                        <input id="sTotChrAmtAdd" name="sTotChrAmtAdd" readonly="readonly" class="form_readonly form_numeric ar" maxlength="20" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.totalUseAmt" /><!-- 총 사용 금액 --></th>
                                    <td>
                                        <input id="sTotUseAmtAdd" name="sTotUseAmtAdd" readonly="readonly" class="form_readonly form_numeric ar" maxlength="14" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.payTp" /></span><!-- 지불 방식 --></th>
                                    <td>
                                        <input id="sPaymMthCdAdd" name="sPaymMthCdAdd" class="form_comboBox " maxlength="20" value="9999" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.paymAmt" /></span><!-- 수납금액 --></th>
                                    <td>
                                        <input id="sPaymAmtAdd" name="sPaymAmtAdd" class="form_numeric ar" autocomplete="off" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class=""><spring:message code='crm.lbl.invoiceTp' /></span><!-- 영수증 유형 --></th>
                                    <td>
                                        <input id="sRcptTpAdd" name="sRcptTpAdd" class="form_comboBox" maxlength="20" />
                                    </td>
                                    <th scope="row"><span class=""><spring:message code='crm.lbl.invoiceNo' /></span><!-- 영수증 번호--></th>
                                    <td>
                                        <input id="sRcptNoAdd" name="sRcptNoAdd" class="form_input" maxlength="20" autocomplete="off" />
                                    </td>
                                    <th scope="row"><spring:message code='crm.lbl.invoiceDt' /><!-- 영수증 일자--></th>
                                    <td>
                                        <input id="sRcptDtAdd" name="sRcptDtAdd" class="form_datetimepicker" type="text"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.remark" /><!-- 비고 --></th>
                                    <td colspan="5">
                                        <input id="sRemarkAdd" name="sRemarkAdd"  type="text"  class="form_input" maxlength="100" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록 일--></th>
                                    <td>
                                        <input id="sRegDtAdd" name="sRegDtAdd"  type="text"  readonly="readonly" class="form_input form_readonly" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.pprocNm" /><!-- 처리인 --></th>
                                    <td>
                                        <input id="sRegUsrIdAdd" name="sRegUsrIdAdd"  type="text"  readonly="readonly" class="form_input form_readonly" maxlength="100" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                </div> <!-- default information tab end -->
            <div id="chargeAddHistoryTabDiv" class="mt0">
                <!-- //고객 예치금 상세 이력 grid 조회 -->
                <div class="table_grid mt10">
                    <div id="customerChargeMstDetailGrid"></div>
                </div>
            </div>
        </div><!-- charge Add Tab end -->
    </section>

    <!-- //고객 예치금 관리 button click tab popup -->
    <section id="chargeMinus" class="pop_wrap" style="display:none;">
        <div id="chargeMinusTab" class="tab_area"><!-- charge Add Tab start -->
            <!-- 탭메뉴 -->
            <ul>
                <li id="chargeMinusInfoTab" class="k-state-active"><spring:message code="global.title.defaultInfo" /><!-- 기본정보 0 --></li>
                <li id="chargeMinushistoryTab"><spring:message code="crm.lbl.historyRecord"/><!-- 이력 기록 --></li>
            </ul>
            <div id="chargeMinusInfoTabDiv" class="mt0"><!-- default information tab start -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.defaultInfo" /></h2><!-- 기본정보 -->
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="btnMinusCharge" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </div>
                </div>
                <div class="table_form">
                    <form id="chargeAddDefaultInfoForm" >
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:24%;">
                                <col style="width:10%;">
                                <col style="width:23%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                    <td>
                                        <input id="sCustNmDel" name="sCustNmDel" readonly="readonly" class="form_input form_readonly" maxlength="20" data-json-obj='true' />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객 번호 --></th>
                                    <td>
                                        <input id="sCustNoDel" name="sCustNoDel" readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대폰 번호 --></th>
                                    <td>
                                        <input id="sHpNoDel" name="sHpNoDel" readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.ableAmt" /><!-- 가용 금액 --></th>
                                    <td>
                                        <input id="sAbleAmtDel" name="sAbleAmtDel" readonly="readonly" class="form_readonly form_numeric ar" maxlength="20" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.totalRchgAmt" /><!-- 총충전금액--></th>
                                    <td>
                                        <input id="sTotChrAmtDel" name="sTotChrAmtDel" readonly="readonly" class="form_readonly form_numeric ar" maxlength="20" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.totalUseAmt" /><!-- 총 사용 금액 --></th>
                                    <td>
                                        <input id="sTotUseAmtDel" name="sTotUseAmtDel" readonly="readonly" class="form_readonly form_numeric ar" maxlength="14" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.payBackTp" /></span><!-- 차감방식 --></th>
                                    <td>
                                        <input id="sPaymMthCdDel" name="sPaymMthCdDel" class="form_comboBox " maxlength="20" />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.payBackAmt" /></span><!-- 차감금액 --></th>
                                    <td>
                                        <input id="sPaymAmtDel" name="sPaymAmtDel" class="form_numeric ar" autocomplete="off" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.remark" /><!-- 비고 --></th>
                                    <td colspan="5">
                                        <input id="sRemarkDel" name="sRemarkDel"  type="text"  class="form_input" maxlength="100" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록 일--></th>
                                    <td>
                                        <input id="sRegDtDel" name="sRegDtDel"  type="text"  readonly="readonly" class="form_input form_readonly" />
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.pprocNm" /><!-- 처리인 --></th>
                                    <td>
                                        <input id="sRegUsrIdDel" name="sRegUsrIdDel"  type="text"  readonly="readonly" class="form_input form_readonly" maxlength="100" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                </div> <!-- default information tab end -->
            <div id="chargeMinushistoryTabDiv" class="mt0">
                <!-- //고객 예치금 상세 이력 grid 조회 -->
                <div class="table_grid mt10">
                    <div id="customerChargeMinusDetailGrid"></div>
                </div>
            </div>
        </div><!-- charge Add Tab end -->
    </section>

    <!-- 고객 예치금 상세 db Click tab popup -->
    <section id="windowDetail" class="pop_wrap"  style="display:none;">
        <!-- dbClick 탭 -->
        <div id="dbClickTab" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="dbClickDefaultInfoTab" class="k-state-active"><spring:message code="global.title.defaultInfo" /><!-- 기본정보 0 --></li>
                <li id="dbClickHistoryTab"><spring:message code="crm.lbl.historyRecord"/><!--이력 기록 --></li>
            </ul>
            <div id="dbClickDefaultInfoTabDiv" class="mt0"><!-- dbClick Default Information tab start -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.defaultInfo" /></h2><!-- 기본정보 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input id="sCustNmDetail" name="sCustNmDetail" readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객 번호 --></th>
                                <td>
                                    <input id="sCustNoDetail" name="sCustNoDetail"  readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대폰 번호 --></th>
                                <td>
                                    <input id="sHpNoDetail" name="sHpNoDetail"  readonly="readonly" class="form_input form_readonly" maxlength="20" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.ableAmt" /><!-- 가용 금액 --></th>
                                <td>
                                    <input id="sAbleAmtDetail" name="sAbleAmtDetail"  readonly="readonly" class="form_readonly form_numeric ar" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.totalRchgAmt" /><!-- 총충전금액--></th>
                                <td>
                                    <input id="sTotChrAmtDetail" name="sTotChrAmtDetail"  readonly="readonly" class="form_readonly form_numeric ar" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.totalUseAmt" /><!-- 총 사용 금액 --></th>
                                <td>
                                    <input id="sTotUseAmtDetail" name="sTotUseAmtDetail"  readonly="readonly" class=" form_readonly form_numeric ar" maxlength="14" />
                                </td>
                            </tr>
                            <tr>
                                 <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록 일--></th>
                                <td>
                                    <input id="sRegDtDetail" name="sRegDtDetail"  type="text"   readonly="readonly" class="form_input form_readonly" maxlength="100" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.pprocNm" /><!-- 처리인 --></th>
                                <td>
                                    <input id="sRegUsrIdDetail" name="sRegUsrIdDetail"  type="text"   readonly="readonly" class="form_input form_readonly" maxlength="100" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div> <!-- dbClick Default Information tab end -->
            <div id="dbClickHistoryTabDiv" class="mt0"><!-- dbClick History tab start -->
                <!-- //고객 예치금 상세 이력 grid 조회 -->
                <div class="table_grid mt10">
                    <div id="customerChargeHistDetailGrid"></div>
                </div>
            </div><!-- dbClick History tab end -->
        </div><!-- dbClick tab end -->
    </section>


<script type="text/javascript">

    var dcUseTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var dcUseTpArr = [];

    // 할인사용구분
    <c:forEach var="obj" items="${dcUseTpList}">
        dcUseTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        dcUseTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    dcUseTpArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = dcUseTpArr[val];
        }
        return returnVal;
    };

    //지불 방식 목록
    var paymMth = [];
    var paymMthMap = [];
    <c:forEach var="obj" items="${paymMth}">
        <c:if test="${obj.remark1 == 'Y'}">
        paymMth.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        paymMthMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //영수증 유형  목록
    var rcptTp = [];
    var rcptTpMap = [];
    <c:forEach var="obj" items="${rcptTp}">
    rcptTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    rcptTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //검색조건:시작일-완료일 날짜 비교
    fnChkSearchDate = function(e){
        //if(dms.string.isEmpty($(this).val())){return;}
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

    /**
     * hyperlink in grid event of Customer Information
     */
     $(document).on("click", ".linkCust", function(e){

          var grid = $("#customerChargeMgmtMainGrid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
     });

    setKendoDate = function( dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };

    function gridCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        params["sCustNm"] = $("#sCustNm").val();
        params["sHpNo"] = $("#sHpNo").val();
        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

        return params;

    };

    $(document).ready(function() {

        //가용 금액
        $("#sAbleAmtDetail,#sTotChrAmtDetail,#sTotUseAmtDetail,#sAbleAmtAdd,#sTotChrAmtAdd,#sTotUseAmtAdd,#sPaymAmtAdd").kendoExtNumericTextBox({
            format:"n2"
            ,min:0
            ,value:0
            ,spinners:false
        });

        //가용 금액
        $("#sAbleAmtDel,#sTotChrAmtDel,#sTotUseAmtDel,#sPaymAmtDel").kendoExtNumericTextBox({
            format:"n2"
            ,min:0
            ,value:0
            ,spinners:false
        });


        //버튼 - 엑셀저장
        $("#btnCtlExcelExport").kendoButton({
            click:function(e) {

                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#customerChargeMgmtMainGrid").data("kendoExtGrid").dataSource.page(1);
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }

                var params = {};
                params = gridCommonParams();

                // 예치금 충전 결과 목록 엑셀Export 수량 데이터를 조회한다.
                $.ajax({
                    url:"<c:url value='/crm/cif/custChargeMgmt/selectCustChargeMgmtMainResultsExcelExportCnt.do' />",
                    data:JSON.stringify(params),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(resultCnt) {

                        //console.log("resultCnt : ",resultCnt)
                        <c:set value="100000" var="maxCnt" />;
                        var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                        if ( resultCnt > excelMaxExportCnt ) {
                            // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                            dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                            return;
                        };

                        var grid = $("#customerChargeMgmtMainGrid").data("kendoExtGrid");
                        var sysDateExcelNm = new Date();
                        var sysDtVal;
                        sysDtVal = sysDateExcelNm.getFullYear()+"-";
                        sysDtVal += sysDateExcelNm.getMonth()+1;
                        sysDtVal += "-"+sysDateExcelNm.getDate();
                        sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

                        dms.ajax.excelExport({
                            "beanName":"custChargeMgmtService"
                            ,"templateFile":"CustChargeMgmtListExp_Tpl.xlsx"
                            ,"fileName":"<spring:message code='crm.title.custCharge' />_"+sysDtVal+".xlsx"
                            ,"sCustNm":$("#sCustNm").val()
                            ,"sHpNo":$("#sHpNo").val()
                            ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                            ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                        });

                    }
                });

            }
            ,enable:false
        });


        $("#btnSaveCharge").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#sPaymMthCdAdd").data("kendoExtDropDownList").value())){    // 지불방식  sPaymMthCdAdd
                    dms.notification.info("<spring:message code='crm.info.noPayMethod'/>");
                    return;
                }

                if(dms.string.isEmpty($("#sPaymAmtAdd").data("kendoExtNumericTextBox").value())){    // 수납금액     sPaymAmtAdd
                    dms.notification.info("<spring:message code='crm.info.noPaymAmt'/>");
                    return;
                }

                if(0 == dms.string.defaultString($("#sPaymAmtAdd").data("kendoExtNumericTextBox").value(),0)){
                    dms.notification.warning("<spring:message code='crm.info.noPaymAmt'/>");
                    return;
                }
                // form 데이터 SOURTP : CRM361
                 var param = {
                        "custNo":$("#sCustNoAdd").val()
                        ,"chrTp":"+"
                        ,"ableAmt":$("#sAbleAmtAdd").data("kendoExtNumericTextBox").value()
                        ,"totChrAmt":$("#sTotChrAmtAdd").data("kendoExtNumericTextBox").value()
                        ,"totUseAmt":$("#sTotUseAmtAdd").data("kendoExtNumericTextBox").value()
                        ,"paymMthCd":$("#sPaymMthCdAdd").data("kendoExtDropDownList").value()
                        ,"paymAmt":$("#sPaymAmtAdd").data("kendoExtNumericTextBox").value()
                        ,"rcptTp":$("#sRcptTpAdd").data("kendoExtDropDownList").value()
                        ,"rcptNo":$("#sRcptNoAdd").val()
                        ,"rcptDt":$("#sRcptDtAdd").data("kendoExtMaskedDatePicker").value()
                        ,"remark":$("#sRemarkAdd").val()
                        ,"regUsrId":$("#sRegUsrIdAdd").val()
                        ,"refTableNm":"CR_0828T"
                        ,"sourTp":"01"
                    }

                  var url = "<c:url value='/crm/cif/custChargeMgmt/insertCustChargeMgmtHist.do' />";
                $.ajax({
                    url:url
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                        if (result > 0){
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        closeMstPopup();
                        $('#customerChargeMgmtMainGrid').data('kendoExtGrid').dataSource.page(1);
                        resetDefaultSearchForm();
                        $("#btnChargeAdd").data("kendoButton").enable(false);
                        $("#btnChargeMin").data("kendoButton").enable(false);
                    }
                }).done(function(result) {
                    closeMstPopup();
                    resetDefaultSearchForm();
                    $("#btnChargeAdd").data("kendoButton").enable(false);
                    $("#btnChargeMin").data("kendoButton").enable(false);
                });
            }
        });

        $("#btnMinusCharge").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#sPaymMthCdDel").data("kendoExtDropDownList").value())){    // 차감방식
                    dms.notification.info("<spring:message code='crm.info.noPayMethod'/>");
                    return;
                }

                if(dms.string.isEmpty($("#sPaymAmtDel").data("kendoExtNumericTextBox").value())){    // 차감금액
                    dms.notification.info("<spring:message code='crm.info.noPaymAmt'/>");
                    return;
                }

                if(0 == dms.string.defaultString($("#sPaymAmtDel").data("kendoExtNumericTextBox").value(),0)){
                    dms.notification.warning("<spring:message code='crm.info.noPaymAmt'/>");
                    return;
                }
                // form 데이터 SOURTP : CRM361
                var param = {
                    "custNo":$("#sCustNoDel").val()
                    ,"chrTp":"-"
                    ,"ableAmt":$("#sAbleAmtDel").data("kendoExtNumericTextBox").value()
                    ,"totChrAmt":$("#sTotChrAmtDel").data("kendoExtNumericTextBox").value()
                    ,"totUseAmt":$("#sTotUseAmtDel").data("kendoExtNumericTextBox").value()
                    ,"paymMthCd":$("#sPaymMthCdDel").data("kendoExtDropDownList").value()
                    ,"paymAmt":$("#sPaymAmtDel").data("kendoExtNumericTextBox").value()
                    ,"remark":$("#sRemarkDel").val()
                    ,"regUsrId":$("#sRegUsrIdDel").val()
                    ,"refTableNm":"CR_0828T"
                    ,"sourTp":"01"
                }

                var url = "<c:url value='/crm/cif/custChargeMgmt/insertCustChargeMgmtHist.do' />";
                $.ajax({
                    url:url
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                        if (result > 0){
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        $('#customerChargeMgmtMainGrid').data('kendoExtGrid').dataSource.page(1);
                    }
                }).done(function(result) {
                    closeChargeMinusPopup();
                    resetDefaultSearchForm();
                    $("#btnChargeAdd").data("kendoButton").enable(false);
                    $("#btnChargeMin").data("kendoButton").enable(false);
                });
            }
        });

        // 시작일 & 완료일  & 영수증 날짜
        $("#sStartDt,#sEndDt,#sRcptDtAdd").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sRcptDtAdd").data("kendoExtMaskedDatePicker").value(new Date());

        //초기화(Reset)
        function resetDefaultSearchForm(){
            $("#sCustNoAdd").val("");
            $("#sHpNoAdd").val("");
            $("#sStartDt").data("kendoExtMaskedDatePicker").value();
            $("#sEndDt").data("kendoExtMaskedDatePicker").value();
        }

        function resetDefaultForm(){
            $("#sPaymMthCdAdd").data("kendoExtDropDownList").select("");
            $("#sPaymAmtAdd").data("kendoExtNumericTextBox").value(0);
            $("#sRcptTpAdd").data("kendoExtDropDownList").select("");
            $("#sRcptNoAdd").val("");
            $("#sRemarkAdd").val("");
            //$("#sRcptDtAdd").data("kendoExtMaskedDatePicker").value("");

            $("#sPaymMthCdDel").data("kendoExtDropDownList").value("");
            $("#sPaymAmtDel").data("kendoExtNumericTextBox").value("");
            $("#sRemarkDel").val("");
        }


        // Mst 팝업 종료
        function closeMstPopup(){
            var win = $("#windowMst").data("kendoWindow");
            win.close();
        }
        // Detail 팝업 종료
        function closeDetailPopup(){
            var win = $("#windowDetail").data("kendoWindow");
            win.close();
        }
        // charge Minus 팝업 종료
        function closeChargeMinusPopup(){
            var win = $("#chargeMinus").data("kendoWindow");
            win.close();
        }
        // 지불 방식 드랍다운 리스트.
        $("#sPaymMthCdDel").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:paymMth
            ,autoBind:false
            ,index:0
        });

        // 지불 방식 드랍다운 리스트.
        $("#sPaymMthCdAdd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:paymMth
            ,autoBind:false
            ,index:1
        });

        // 영수증 유형 드랍다운 리스트.
        $("#sRcptTpAdd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:rcptTp
            ,autoBind:false
            ,index:0
        });

        $("#windowMst").kendoWindow({
            pinned:true,
            draggable:true,
            modal:false,
            resizable:false,
            visible:false,
            animation:false,
            title:"<spring:message code='crm.lbl.chargeAdd' />",
            width:"950px",
            height:"270px"
        }).data("kendoWindow");

        $("#chargeMinus").kendoWindow({
            pinned:true,
            draggable:true,
            modal:false,
            resizable:false,
            visible:false,
            animation:false,
            title:"<spring:message code='crm.lbl.chargeMinus' />",
            width:"950px",
            height:"270px"
        }).data("kendoWindow");

        $("#windowDetail").kendoWindow({
            pinned:true,
            draggable:true,
            modal:false,
            resizable:false,
            visible:false,
            animation:false,
            title:"<spring:message code='crm.lbl.chargeHist' />",
            width:"950px",
            height:"270px"
        }).data("kendoWindow");


    //chargeAddTab
    var chargeAddTabStrip = $("#chargeAddTab").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "chargeAddHistoryTabDiv") {
                    $("#customerChargeMstDetailGrid").data("kendoExtGrid").dataSource.page(1);
            };
        }
    }).data("kendoExtTabStrip");

    //chargeMinusTab
    var chargeMinusTabStrip = $("#chargeMinusTab").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "chargeMinushistoryTab") {
                    $("#customerChargeMinusDetailGrid").data("kendoExtGrid").dataSource.page(1);
            };
        }
    }).data("kendoExtTabStrip");

    //dbClickTab
    var dbClickTabStrip = $("#dbClickTab").kendoExtTabStrip({
        animation:false,
        select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "dbClickHistoryTabDiv") {
                    $("#customerChargeHistDetailGrid").data("kendoExtGrid").dataSource.page(1);
            };
        }
    }).data("kendoExtTabStrip");

    //조회
    $("#btnSearch").kendoButton({
        click:function(e){

            if( ($("#sStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndDt").data("kendoExtMaskedDatePicker").value() == null)
                    ||($("#sEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                    //적용일을 모두 입력해 주세요
                      dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                      return false;
                  }

            if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                    ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                $("#customerChargeMgmtMainGrid").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sEndDt").focus();
            }
            $("#btnChargeAdd").data("kendoButton").enable(false);
            $("#btnChargeMin").data("kendoButton").enable(false);
        }
    });

    // Add charge button 클릭 이벤트
     $("#btnChargeAdd").kendoButton({click:function(e){
               closeDetailPopup();
               resetDefaultSearchForm();
               resetDefaultForm();
               $("#chargeAddTab").data("kendoExtTabStrip").select(0);
               var row = $("#customerChargeMgmtMainGrid").data("kendoExtGrid").select()
               , data = $("#customerChargeMgmtMainGrid").data("kendoExtGrid").dataItem(row);

               $("#customerChargeMstDetailGrid").data("kendoExtGrid").dataSource.page(1);

               var win = $("#windowMst").data("kendoWindow");
               win.center();
               win.open();

               if(dms.string.isNotEmpty(data)){
                   $("#sCustNmAdd").val(data.custNm);
                   $("#sCustNoAdd").val(data.custNo);
                   $("#sHpNoAdd").val(data.hpNo);
                   $("#sAbleAmtAdd").data("kendoExtNumericTextBox").value(data.ableAmt);
                   $("#sTotChrAmtAdd").data("kendoExtNumericTextBox").value(data.totChrAmt);
                   $("#sTotUseAmtAdd").data("kendoExtNumericTextBox").value(data.totUseAmt);
                   $("#sPaymMthCdAdd").data("kendoExtDropDownList").value(data.paymMthCd);
                   $("#sPaymAmtAdd").data("kendoExtNumericTextBox").value(data.paymAmt);
                   $("#sRcptTpAdd").data("kendoExtDropDownList").value(data.rcptTp);
                   $("#sRcptNoAdd").val(data.rcptNo);
                   $("#sRcptDtAdd").data("kendoExtMaskedDatePicker").value(data.rcptDt);
                   $("#sRemarkAdd").val(data.remark);
                   $("#sRegDtAdd").val(kendo.toString(data.regDt, "<dms:configValue code='dateFormat' />"));
                   $("#sRegUsrIdAdd").val(data.regUsrNm);
               }

           }
       });

    // Delete charge button 클릭 이벤트
     $("#btnChargeMin").kendoButton({click:function(e){
               closeDetailPopup();
               resetDefaultSearchForm();
               resetDefaultForm();
               $("#chargeMinusTab").data("kendoExtTabStrip").select(0);
               var row = $("#customerChargeMgmtMainGrid").data("kendoExtGrid").select()
               , data = $("#customerChargeMgmtMainGrid").data("kendoExtGrid").dataItem(row);

               $("#customerChargeMinusDetailGrid").data("kendoExtGrid").dataSource.page(1);

               var win = $("#chargeMinus").data("kendoWindow");
               win.center();
               win.open();

               if(dms.string.isNotEmpty(data)){
                   $("#sCustNmDel").val(data.custNm);
                   $("#sCustNoDel").val(data.custNo);
                   $("#sHpNoDel").val(data.hpNo);
                   $("#sAbleAmtDel").data("kendoExtNumericTextBox").value(data.ableAmt);
                   $("#sTotChrAmtDel").data("kendoExtNumericTextBox").value(data.totChrAmt);
                   $("#sTotUseAmtDel").data("kendoExtNumericTextBox").value(data.totUseAmt);
                   $("#sPaymMthCdDel").data("kendoExtDropDownList").value(data.paymMthCd);
                   $("#sPaymAmtDel").data("kendoExtNumericTextBox").value(data.paymAmt);

                   $("#sRemarkDel").val(data.remark);
                   $("#sRegDtDel").val(kendo.toString(data.regDt, "<dms:configValue code='dateFormat' />"));
                   $("#sRegUsrIdDel").val(data.regUsrNm);
               }

           }
       });

 // 예치금 이력 popup 화면
    $("#customerChargeMgmtMainGrid").on("dblclick", "tr.k-state-selected", function (e) {

        $("#dbClickTab").data("kendoExtTabStrip").select(0);
        var row = $("#customerChargeMgmtMainGrid").data("kendoExtGrid").select()
        , data = $("#customerChargeMgmtMainGrid").data("kendoExtGrid").dataItem(row);

        $("#customerChargeHistDetailGrid").data("kendoExtGrid").dataSource.page(1);
        closeMstPopup();
        var win = $("#windowDetail").data("kendoWindow");
        win.center();
        win.open();

        if(dms.string.isNotEmpty(data)){
            $("#sCustNmDetail").val(data.custNm);
            $("#sCustNoDetail").val(data.custNo);
            $("#sHpNoDetail").val(data.hpNo);
            $("#sAbleAmtDetail").data("kendoExtNumericTextBox").value(data.ableAmt);
            $("#sTotChrAmtDetail").data("kendoExtNumericTextBox").value(data.totChrAmt);
            $("#sTotUseAmtDetail").data("kendoExtNumericTextBox").value(data.totUseAmt);
            $("#sRegDtDetail").val(kendo.toString(data.regDt, "<dms:configValue code='dateFormat' />"));
            //$("#sRegDtDetail").val(data.regDt);
            $("#sRegUsrIdDetail").val(data.regUsrNm);
        }
    });

    //예치금 관리 그리드 설정
    $("#customerChargeMgmtMainGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/cif/custChargeMgmt/selectCustChargeMgmtMainResults.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params = $.extend(params, gridCommonParams());

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"custNo"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,custNo:{type:"string", validation:{required:true}}
                        ,custNm:{type:"string", validation:{required:true}}
                        ,HpNo:{type:"string", validation:{required:true}}
                        ,ableAmt:{type:"double", validation:{required:true}}
                        ,totChrAmt:{type:"double", validation:{required:true}}
                        ,totUseAmt:{type:"double", validation:{required:true}}
                        ,regDt:{type:"date", validation:{required:true}}
                        ,updtDt:{type:"date", validation:{required:true}}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDt = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                 }
            }
        }
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,autoBind:true
        ,editableOnlyNew:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,navigatable:true
        ,sortable:true
        ,editable:false
        ,appendEmptyColumn:true
        ,selectable:"row"
        ,dataBound:function (e) {
            var dataItems = e.sender.dataSource.view();

            if ( dataItems.length > 0 ) {
                $("#btnCtlExcelExport").data("kendoButton").enable(true);
            } else {
                $("#btnCtlExcelExport").data("kendoButton").enable(false);
            };
        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false,filterable:false,attributes:{"class":"ac"}}
            ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:180 ,attributes:{"class":"ac"}}
            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100           // 고객명
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                    return spanObj;
                }
            }
            ,{field:"hpNo", title:"<spring:message code='crm.lbl.corpPurcMngHpno' />", width:120,attributes:{"class":"ac"}}
            ,{field:"ableAmt", title:"<spring:message code='crm.lbl.ableAmt' />", width:120,attributes:{"class":"ar"},format:"{0:n2}"}
            ,{field:"totChrAmt", title:"<spring:message code='crm.lbl.cumulativeChargeAmount' />", width:120,attributes:{"class":"ar"},format:"{0:n2}"}
            ,{field:"totUseAmt", title:"<spring:message code='crm.lbl.cumulativeUsedAmount' />", width:120,attributes:{"class":"ar"},format:"{0:n2}"}
            ,{field:"updtDt", title:"<spring:message code='crm.lbl.lastTradeDate' />", width:120
                ,template:"#if (updtDt !== null ){# #= kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId'/>", width:100,attributes:{"class":"ac"}} //등록자
        ]
        ,change:function(e){
           var dataItem = this.dataItem(this.select());
           var selectedItem = this.dataItem(this.select());
           if ( dms.string.isNotEmpty(selectedItem) ) {
               $("#btnChargeAdd").data("kendoButton").enable(true);
               $("#btnChargeMin").data("kendoButton").enable(true);
           }
         }
 });
    $("#btnChargeAdd").data("kendoButton").enable(false);
    $("#btnChargeMin").data("kendoButton").enable(false);

  //예치금 상세 그리드 설정 MstGrid
  $("#customerChargeMstDetailGrid").kendoExtGrid({
      dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/crm/cif/custChargeMgmt/selectCustChargeMgmtHistResults.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {
                      var params = {};

                      var grid = $("#customerChargeMgmtMainGrid").data("kendoExtGrid")
                      , select = grid.select()
                      , selectedItem = grid.dataItem(select);

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      if ( dms.string.isNotEmpty(selectedItem) ) {
                          params["sCustNo"]  = selectedItem.custNo;
                      } else {
                          return;
                      }

                      return kendo.stringify(params);

                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"custNo"
                  ,fields:{
                      rnum:{type:"number", editable:false}
                      ,dlrCd:{type:"string", validation:{required:true}}
                      ,custNo:{type:"string", validation:{required:true}}
                      ,custNm:{type:"string", validation:{required:true}}
                      ,paymMthCd:{type:"string", validation:{required:true}}
                      ,paymAmt:{type:"Double", validation:{required:true}}
                      ,ableAmt:{type:"Double", validation:{required:true}}
                      ,rcptTp:{type:"string", validation:{required:true}}
                      ,rcptNo:{type:"string", validation:{required:true}}
                      ,rcptDt:{type:"Date", validation:{required:true}}
                      ,vinNo:{type:"string", validation:{required:true}}
                      ,sourTp:{type:"string", validation:{required:true}}
                      ,chrTp:{type:"string", validation:{required:true}}
                      ,chrTpNm:{type:"string", validation:{required:true}}
                      ,carRegNo:{type:"string", validation:{required:true}}
                      ,remark:{type:"string", validation:{required:true}}
                      ,refKeyNo:{type:"string", validation:{required:true}}
                      ,regUsrId:{type:"string", validation:{required:true}}
                      ,updtUsrId:{type:"string", validation:{required:true}}
                      ,updtDt:{type:"Date", validation:{required:true}}
                      ,regDt:{type:"Date", validation:{required:true}}
                      ,chrSeq:{type:"int", validation:{required:true}}
                  }
              }
          }
      }
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,autoBind:false
      ,editableOnlyNew:false
      ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,navigatable:true
      ,sortable:true
      ,editable:false
      ,appendEmptyColumn:true
      ,height: 200
      ,selectable:"row"
      ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false,filterable:false,attributes:{"class":"ac"}}
          ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:140,attributes:{"class":"ac"}}
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"ac"}}
          ,{field:"paymMthCd", title:"<spring:message code='crm.lbl.payTp' />"
              ,width:80
              ,attributes:{"class":"ac"}
              ,template:'#if (paymMthCd !== ""){# #= paymMthMap[paymMthCd]# #}#'
          }
          ,{field:"chrTpNm", title:"<spring:message code='crm.lbl.paymAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
          ,{field:"rcptTp", title:"<spring:message code='crm.lbl.invoiceTp' />"
              ,width:120
              ,attributes:{"class":"ac"}
              ,template:"#if (rcptTp === '01'||rcptTp === '02') {# #= rcptTpMap[rcptTp] # #} else {# #= '-' # #}#"
          }
          ,{field:"rcptNo", title:"<spring:message code='crm.lbl.invoiceNo' />", width:120,attributes:{"class":"ac"}}
          ,{field:"rcptDt", title:"<spring:message code='crm.lbl.invoiceDt' />", width:100,attributes:{"class":"ac"}
              ,template:"#if (rcptDt !== null ){# #= kendo.toString(data.rcptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"}
          ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width:80,attributes:{"class":"ar"}}
          ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:80,attributes:{"class":"ac"}}
          ,{field:"regUsrNm", title:"<spring:message code='global.lbl.pprocId' />", width:70,attributes:{"class":"ac"}}

          ,{field:"ableAmt", title:"<spring:message code='crm.lbl.ableAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
          ,{field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:200}
          ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />"      // 사용처
              , width :100
              , attributes:{"class":"ac"}
              , template:"#=dcUseTpArrVal(useTp)#"
          }
          ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"}, width :140}  // 사용번호
          ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150,attributes:{"class":"ac"}
          ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
          }
      ]
  });

  //예치금 차감 그리드 설정 charge Minus Grid
  $("#customerChargeMinusDetailGrid").kendoExtGrid({
      dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/crm/cif/custChargeMgmt/selectCustChargeMgmtHistResults.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {
                      var params = {};

                      var grid = $("#customerChargeMgmtMainGrid").data("kendoExtGrid")
                      , select = grid.select()
                      , selectedItem = grid.dataItem(select);

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      if ( dms.string.isNotEmpty(selectedItem) ) {
                          params["sCustNo"]  = selectedItem.custNo;
                      } else {
                          return;
                      }

                      return kendo.stringify(params);

                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"custNo"
                  ,fields:{
                      rnum:{type:"number", editable:false}
                      ,dlrCd:{type:"string", validation:{required:true}}
                      ,custNo:{type:"string", validation:{required:true}}
                      ,custNm:{type:"string", validation:{required:true}}
                      ,paymMthCd:{type:"string", validation:{required:true}}
                      ,paymAmt:{type:"Double", validation:{required:true}}
                      ,ableAmt:{type:"Double", validation:{required:true}}
                      ,rcptTp:{type:"string", validation:{required:true}}
                      ,rcptNo:{type:"string", validation:{required:true}}
                      ,rcptDt:{type:"Date", validation:{required:true}}
                      ,vinNo:{type:"string", validation:{required:true}}
                      ,sourTp:{type:"string", validation:{required:true}}
                      ,chrTp:{type:"string", validation:{required:true}}
                      ,chrTpNm:{type:"string", validation:{required:true}}
                      ,carRegNo:{type:"string", validation:{required:true}}
                      ,remark:{type:"string", validation:{required:true}}
                      ,refKeyNo:{type:"string", validation:{required:true}}
                      ,regUsrId:{type:"string", validation:{required:true}}
                      ,updtUsrId:{type:"string", validation:{required:true}}
                      ,updtDt:{type:"Date", validation:{required:true}}
                      ,regDt:{type:"Date", validation:{required:true}}
                      ,chrSeq:{type:"int", validation:{required:true}}
                  }
              }
          }
      }
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,autoBind:false
      ,editableOnlyNew:false
      ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,navigatable:true
      ,sortable:true
      ,editable:false
      ,appendEmptyColumn:true
      ,height: 200
      ,selectable:"row"
      ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false,filterable:false,attributes:{"class":"ac"}}
          ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:140,attributes:{"class":"ac"}}
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"ac"}}
          ,{field:"paymMthCd", title:"<spring:message code='crm.lbl.payTp' />"
              ,width:80
              ,attributes:{"class":"ac"}
              ,template:'#if (paymMthCd !== ""){# #= paymMthMap[paymMthCd]# #}#'
          }
          ,{field:"chrTpNm", title:"<spring:message code='crm.lbl.paymAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
          ,{field:"rcptTp", title:"<spring:message code='crm.lbl.invoiceTp' />"
              ,width:120
              ,attributes:{"class":"ac"}
              ,template:"#if (rcptTp === '01'||rcptTp === '02') {# #= rcptTpMap[rcptTp] # #} else {# #= '-' # #}#"

          }
          ,{field:"rcptNo", title:"<spring:message code='crm.lbl.invoiceNo' />", width:120,attributes:{"class":"ac"}}
          ,{field:"rcptDt", title:"<spring:message code='crm.lbl.invoiceDt' />", width:100,attributes:{"class":"ac"}
              ,template:"#if (rcptDt !== null ){# #= kendo.toString(data.rcptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"}
          ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width:80,attributes:{"class":"ar"}}
          ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:80,attributes:{"class":"ac"}}
          ,{field:"regUsrNm", title:"<spring:message code='global.lbl.pprocId' />", width:70,attributes:{"class":"ac"}}

          ,{field:"ableAmt", title:"<spring:message code='crm.lbl.ableAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
          ,{field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:200}
          ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />"      // 사용처
              , width :100
              , attributes:{"class":"ac"}
              , template:"#=dcUseTpArrVal(useTp)#"
          }
          ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"}, width :140}  // 사용번호
          ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150,attributes:{"class":"ac"}
          ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
          }
      ]
  });

//예치금 상세 그리드 설정 Hist Grid
  $("#customerChargeHistDetailGrid").kendoExtGrid({
      dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/crm/cif/custChargeMgmt/selectCustChargeMgmtHistResults.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {
                      var params = {};

                      var grid = $("#customerChargeMgmtMainGrid").data("kendoExtGrid")
                      , select = grid.select()
                      , selectedItem = grid.dataItem(select);

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      if ( dms.string.isNotEmpty(selectedItem) ) {
                          params["sCustNo"]  = selectedItem.custNo;
                      } else {
                          return;
                      }

                      return kendo.stringify(params);

                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"custNo"
                  ,fields:{
                      rnum:{type:"number", editable:false}
                      ,dlrCd:{type:"string", validation:{required:true}}
                      ,custNo:{type:"string", validation:{required:true}}
                      ,custNm:{type:"string", validation:{required:true}}
                      ,paymMthCd:{type:"string", validation:{required:true}}
                      ,paymAmt:{type:"Double", validation:{required:true}}
                      ,ableAmt:{type:"Double", validation:{required:true}}
                      ,rcptTp:{type:"string", validation:{required:true}}
                      ,rcptNo:{type:"string", validation:{required:true}}
                      ,rcptDt:{type:"Date", validation:{required:true}}
                      ,vinNo:{type:"string", validation:{required:true}}
                      ,sourTp:{type:"string", validation:{required:true}}
                      ,chrTp:{type:"string", validation:{required:true}}
                      ,chrTpNm:{type:"string", validation:{required:true}}
                      ,carRegNo:{type:"string", validation:{required:true}}
                      ,remark:{type:"string", validation:{required:true}}
                      ,refKeyNo:{type:"string", validation:{required:true}}
                      ,regUsrId:{type:"string", validation:{required:true}}
                      ,updtUsrId:{type:"string", validation:{required:true}}
                      ,updtDt:{type:"Date", validation:{required:true}}
                      ,regDt:{type:"Date", validation:{required:true}}
                      ,chrSeq:{type:"int", validation:{required:true}}
                  }
              }
          }
      }
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,autoBind:false
      ,editableOnlyNew:false
      ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:false               //Tooltip 적용, default:false
      ,navigatable:true
      ,sortable:true
      ,editable:false
      ,appendEmptyColumn:true
      ,height: 200
      ,selectable:"row"
      ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false,filterable:false,attributes:{"class":"ac"}}
          ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:140,attributes:{"class":"ac"}}
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"ac"}}
          ,{field:"paymMthCd", title:"<spring:message code='crm.lbl.payTp' />"
              ,width:80
              ,attributes:{"class":"ac"}
              ,template:'#if (paymMthCd !== ""){# #= paymMthMap[paymMthCd]# #}#'
          }
          ,{field:"chrTpNm", title:"<spring:message code='crm.lbl.paymAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
          ,{field:"rcptTp", title:"<spring:message code='crm.lbl.invoiceTp' />"
              ,width:120
              ,attributes:{"class":"ac"}
              ,template:"#if (rcptTp === '01'||rcptTp === '02') {# #= rcptTpMap[rcptTp] # #} else {# #= '-' # #}#"
          }
          ,{field:"rcptNo", title:"<spring:message code='crm.lbl.invoiceNo' />", width:120,attributes:{"class":"ac"}}
          ,{field:"rcptDt", title:"<spring:message code='crm.lbl.invoiceDt' />", width:100,attributes:{"class":"ac"}
              ,template:"#if (rcptDt !== null ){# #= kendo.toString(data.rcptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"}
          ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width:80,attributes:{"class":"ar"}}
          ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:80,attributes:{"class":"ac"}}
          ,{field:"regUsrNm", title:"<spring:message code='global.lbl.pprocId' />", width:70,attributes:{"class":"ac"}}
          ,{field:"ableAmt", title:"<spring:message code='crm.lbl.ableAmt' />", width:100,attributes:{"class":"ar"},format:"{0:n2}"}
          ,{field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:200}
          ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />"      // 사용처
              , width :100
              , attributes:{"class":"ac"}
              , template:"#=dcUseTpArrVal(useTp)#"
          }
          ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"}, width :140}  // 사용번호
          ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150,attributes:{"class":"ac"}
          ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
          }
      ]
  });

});

</script>
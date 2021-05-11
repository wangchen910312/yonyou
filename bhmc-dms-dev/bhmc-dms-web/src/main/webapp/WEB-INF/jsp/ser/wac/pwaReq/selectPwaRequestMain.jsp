<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- PWA리스트 -->
<div id="resizableContainer">
   <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.pwaList" /></h1> <!-- PWA리스트 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11721" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11720" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup id="pwaColGroup">
                        <col style="width:8%;">
                        <col style="width:22%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:15%;">
                        <col style="width:8%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carRegDt" /></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromDt" class="form_datepicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToDt" class="form_datepicker ac" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th>
                            <td>
                                <input type="text" maxlength="17" id="sVinNo" class="form_input" style="text-transform:uppercase;"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.pwaDocNo" /></th>
                            <td>
                                <input type="text" id="sPwaDocNo" class="form_input" maxlength="15" style="text-transform:uppercase;"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.statNm" /></th>
                            <td>
                                <input type="text" id="sPwaStatCd" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <div id="gridMaster" class="grid"></div>
            </div>
        </section>
        <!-- //PWA리스트 -->
    <!-- </div> -->
    <!-- //content_left -->
    <!-- content_right -->
    <form id="pwaRequestForm">
           <!-- PWA 신청 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="ser.title.pwaReq" /></h2>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11719" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnInit" ><spring:message code="global.btn.init" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11718" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11717" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnDelete" disabled><spring:message code="global.btn.del" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11716" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnReq" disabled><spring:message code="global.btn.req" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11715" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_form">
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
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.vinNo" /></span></th>
                                <td>
                                    <div class="form_search">
                                       <span class="readonly_area"><input type="text" id="vinNo" name="vinNo" readOnly class="form_input" data-json-obj="true"/></span> <!-- 차대번호 -->
                                        <a href="javascript:custPopupWindow();"></a>
                                        <!-- 2021.2.19 update by tjx 添加车辆品牌信息 -->
                                        <input type="hidden" id="ncarDstinCd" name="ncarDstinCd">
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.hqApproveNm" /></th>
                                <td class="readonly_area">
                                    <input type="text" id="hqApproveNm" name="hqApproveNm" readOnly class="form_input" data-json-obj="true"/><!-- 판정인 -->
                                </td>
                                <th></th>
                                <th></th>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carLine" /></span></th>
                                <td class="readonly_area">
                                    <input type="text" id="ltsModelNm" readOnly name="ltsModelNm" class="form_input" data-json-obj="true" /> <!-- 차종 -->
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.runDist" /></span></th>
                                <td>
                                    <input type="text" id="runDistVal" name="runDistVal"  class="form_numeric ar" maxlength="10" data-json-obj="true"/> <!-- 주행거리 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.cauItemCd" /></span></th> <!-- 원인부품 -->
                                <td colspan="4" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <div class="form_search">
                                                <input type="text" id="cauItemCd" name="cauItemCd" readOnly class="form_input" data-json-obj="true" />
                                                <a href="javascript:partSearchPopupWindow('IP')"></a>
                                            </div>
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="cauItemNm" name="cauItemNm" readOnly class="form_input" data-json-obj="true"/> <!-- 원인부품명 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.mainLbrCd" /></span></th>
                                <td colspan="4" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <div class="form_search">
                                                <input type="text" id="cauOperAtcCd" name="cauOperAtcCd" readOnly class="form_input" data-json-obj="true" /> <!-- 주작업코드 -->
                                                <a href="javascript:selectlaborCodeSearchPopupWindow('IP','Y')"></a>
                                            </div>
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="cauOperAtcNm" name="cauOperAtcNm" readOnly class="form_input form_readonly form_required" data-json-obj="true"/> <!-- 주작업코드명 -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.cauCd" /></span></th>
                                <td colspan="4" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="cauCd" name="cauCd" readOnly class="form_input" data-json-obj="true"/> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <div class="form_search">
                                                <input type="text" id="cauNm" name="cauNm" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드명 -->
                                                <a href="javascript:selectPhenCauCodeSearchPopupWindow()"></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row" rowspan="2"><span class="bu_required"><spring:message code="ser.lbl.errPhenCont" /></span></th>
                                <td rowspan="2" colspan="4">
                                <!-- 20200713 update by tjx pwa故障说明限制汉字100,空格+标点总长控制在120 -->
                                    <!-- <textarea required min=2 maxlength="1300" id="errPhenCont" name="errPhenCont" rows="2" cols="" class="form_textarea form_required" data-name="<spring:message code="ser.lbl.errPhenCont" />" data-json-obj="true"></textarea> -->
                                	<textarea required min=2 maxlength="120" id="errPhenCont" name="errPhenCont" rows="2" cols="" class="form_textarea form_required" data-name="<spring:message code="ser.lbl.errPhenCont" />" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.phenCd" /></span></th>
                                <td colspan="4" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="phenCd" name="phenCd" readOnly class="form_input" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="phenNm" name="phenNm" readOnly class="form_input" data-json-obj="true"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.returnReasonCont" /></th>
                                <td colspan="4" class="readonly_area">
                                    <textarea maxlength="1300" id="returnReasonCont" name="returnReasonCont" rows="2" cols="" readonly class="form_textarea" ></textarea> <!-- 반송사유 -->
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.rpirMtdCont" /></span></th>
                                <td colspan="4" class="required_area">
                                    <textarea required min=2 maxlength="1300" id="rpirMtdCont" name="rpirMtdCont" rows="2" cols="" class="form_textarea" data-name="<spring:message code="ser.lbl.rpirMtdCont" />" data-json-obj="true"></textarea><!-- 수리반안 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.pwaTpCd1" /></span></th>
                                <td  class="required_area">
                                    <input type="text" id="pwaTpCd1" name="pwaTpCd1" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.pwaTpCd2" /></th>
                                <td>
                                    <input type="text" id="pwaTpCd2" name="pwaTpCd2" class="form_comboBox" style="width:100%" data-json-obj="true" />
                                </td>
                                <th></th>
                                <th></th>
                                <!--csr 62 新需求，增加 关联申请单，关联结算单内容 贾明 2020-3-24 colspan="3" ser.lbl.pwaRelateRequi  ser.lbl.pwaApprovalNo start-->
                                <th scope="row" id="pwaRequiNoTh" ><spring:message code="ser.lbl.pwaRelateRequi" /></th>
                                 <td class="required_area">
                                     <input type="text" id="pwaRequiNo" disabled name="pwaRequiNo" class="form_input" data-json-obj="true" />
                                 </td>
                                 <th scope="row" id="calcDocNoTh"><spring:message code="ser.lbl.pwaRelateBill" /></th>
                                 <td class="required_area"><!--CSR 72	PWA申请单据，onchange onblur onMouseOut onkeyup  onchange PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比 贾明 2020-4-19-->
                                       <input type="text" id="calcDocNo"  disabled name="calcDocNo" onkeyup="obtainServiceStatementInfo()" class="form_input" data-json-obj="true" />
                                 </td>
                                <!--csr 62 新需求，增加 关联申请单，关联结算单内容 贾明 2020-3-24 start-->
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.creDt" /></th>
                                <td class="readonly_area">
                                    <input type="text" id="creDt" name="creDt" readOnly class="form_datetimepicker ac" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.wartDt" /></th>
                                <td class="readonly_area">
                                    <input type="text" id="wartDt" name="wartDt" readOnly class="form_datetimepicker ac" data-json-obj="true"/>
                                </td>
                                <!-- 新增保修结束日期  start -->
                                <th scope="row"><spring:message code="ser.lbl.wartExpireDt" /></th>
                                <td class="readonly_area">
                                    <input type="text" id="wartExpireDt" name="wartExpireDt"  readOnly class="form_datetimepicker ac" data-json-obj="true"/>
                                </td>
                                <!-- 新增保修结束日期  end -->
                                <th scope="row"><spring:message code="ser.lbl.returnApprNo" /><!-- 반품승인번호 --></th>
                                <td>
                                    <div class="form_search" style="width:70%">
                                        <input type="text" id="returnApproveNo" name="returnApproveNo" readOnly class="form_input form_readonly" style="width:30%" data-json-obj="true"/>
                                        <a href="javascript:selectSanbaoRtnAprSearchPopupWindow();"></a>
                                    </div>
                                    <dms:access viewId="VIEW-D-11714" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s btn_search" id="btnRtnAprDel"><spring:message code="global.btn.del" /></button>
                                    </dms:access>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.pwaApprovalNo" /><!-- 승인번호 --></th>
                                <td>
                                    <input type="text" id="pwaApproveNo" name="pwaApproveNo" readOnly class="form_input form_readonly ac" data-json-obj="true"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //PWA 신청 -->
            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active"><spring:message code="ser.lbl.lbr" /></li>
                    <li><spring:message code="ser.lbl.item" /></li>
                    <li><spring:message code="ser.lbl.file" /></li>

                </ul>
                <!-- //탭메뉴 -->
                <div>
                    <div class="btn_right_absolute">
                        <dms:access viewId="VIEW-D-11713" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="lbrAdd" class="btn_s btn_add" disabled><spring:message code="global.btn.add" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11712" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="lbrDel" class="btn_s btn_delete" disabled><spring:message code="global.btn.rowDel" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11711" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="lbrCancel" class="btn_s btn_cancel" disabled><spring:message code="global.btn.cancel" /></button>
                        </dms:access>
                    </div>
                    <div class="table_grid">
                        <div id="gridLabor" class="grid"></div>
                    </div>
                </div>
                <!-- //정비항목 -->
                <!-- 부품 -->
                <div>
                    <div class="btn_right_absolute">
                        <dms:access viewId="VIEW-D-11710" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="parAdd" class="btn_s btn_add" disabled><spring:message code="global.btn.add" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11709" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="parDel" class="btn_s btn_delete" disabled><spring:message code="global.btn.rowDel" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11708" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="parCancel" class="btn_s btn_cancel" disabled><spring:message code="global.btn.cancel" /></button>
                        </dms:access>
                    </div>
                    <div class="table_grid">
                        <div id="gridPart" class="grid"></div>
                    </div>
                </div>
                <!-- 부품 -->
                <!-- 사진 -->
                <div>
                    <div class="btn_right_absolute">
                        <dms:access viewId="VIEW-D-11707" hasPermission="${dms:getPermissionMask('READ')}">
                            <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 파일찾기 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11706" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s" disabled><spring:message code="global.btn.fileDelete" /></button>
                        </dms:access>
                    </div>
                    <!-- 파일업로드관련 include page -->
                    <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                    <!-- 파일업로드관련 include page -->
                </div>
                <!-- 사진 -->
            </div>
            <!-- //탭메뉴 전체 영역 -->
            <section class="group">
                <div class="table_form table_form_info mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:13%;">
                            <col style="width:12%;">
                            <col style="width:13%;">
                            <col style="width:12%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"><spring:message code="ser.lbl.itemAmt" /></th><!--부품금액  -->
                                <th scope="col"><spring:message code="ser.lbl.lbrAmt" /></th><!--공임금액  -->
                                <th scope="col"><spring:message code="ser.lbl.subLbrAmt" /></th><!--외주금액  -->
                                <th scope="col"><spring:message code="ser.lbl.totRepairAmt" /></th><!--수리금액 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><h2 class="title_basic"><spring:message code="ser.title.reqExpcAmt" /></h2></th><!--청구예상금액  -->
                                <td class="ar" id="itemOccrAmt"></td>
                                <td class="ar" id="lbrOccrAmt"></td>
                                <td ><input type="text" id="subLbrOccrAmt" name="subLbrOccrAmt" class="form_numeric ar"  maxlength="10" data-json-obj="true"/></td>
                                <td class="ar" id="totOccrAmt"></td>
                            </tr>
                            <tr>
                                <th scope="row"><h2 class="title_basic"><spring:message code="ser.title.reqApproveAmt" /></h2></th><!--청구승인금액  -->
                                <td class="ar" id="itemApproveAmt"></td>
                                <td class="ar" id="lbrApproveAmt"></td>
                                <td class="ar" id="subLbrApproveAmt"></td>
                                <td class="ar" id="totApproveAmt"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <div style="display:none">
                <input type="text" id="dlrCd" name="dlrCd" data-json-obj="true"/>
                <input type="text" id="ltsModelCd" name="ltsModelCd" data-json-obj="true" />
                <input type="text" id="hqApproveId" name="hqApproveId"  data-json-obj="true"/>
                <input type="text" id="pwaDocNo" name="pwaDocNo"  data-json-obj="true"/> <!-- PWA DOC NO -->
                <input type="text" id="pwaStatCd" name="pwaStatCd"  data-json-obj="true"/> <!-- PWA상태 -->
                <input type="text" id="carRegNo" name="carRegNo" data-json-obj="true" /> <!-- 차량번호 -->
                <input type="text" id="enginNo" name="enginNo"  data-json-obj="true"/> <!-- 엔진번호 -->
                <input type="text" id="carOwnerTelNo" name="carOwnerTelNo"  data-json-obj="true"/> <!-- 연락처-->
                <input type="text" id="carOwnerNm" name="carOwnerNm"  data-json-obj="true"/> <!-- 고객명 -->
                <input type="text" id="carOwnerId" name="carOwnerId" data-json-obj="true"/> <!-- 고객ID -->
                <input type="text" id="carlineCd" name="carlineCd" /> <!-- 차종 -->
                <input type="text" id="carId" name="carId" /> <!-- 차종 -->
                <input type="text" id="orgReturnApproveNo" name="orgReturnApproveNo" value="" />
                <input type="text" id="returnApproveNoYn" name="returnApproveNoYn" value="" data-json-obj="true" />
            </div>
        </form>
    </div>
</div>
    <!-- //content_right -->

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">

/**
 **************** 코드 데이터 ****************************
 */
//PWA 상태 코드
var qcVal = 1;//区分有没有点击取消申请按钮，1未点击，2为点击过了  为申请按钮隐藏做准备 贾明 2018-11-13
var qcValR =1;//1时隐藏，2为展示 当选中的状态为不承认时，申请按钮设置为隐藏 贾明 2018-11-15
var isDbClice=1;//是否双击 1 不是，2是 贾明 2018-11-15
var pwaDocNoValue = 1;//pwa编号 贾明2018-11-15
// 结算单是否存在 CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比 贾明 2020-4-19 start
var isCalcDocNo = false;
var calcServiceParts = [];
var calcServiceLabors = [];
// 结算单是否存在 CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比 贾明 2020-4-19 end
var pwaStatCdList = [];
<c:forEach var="obj" items="${pwaStatDs}">
    pwaStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pwaStatMap = dms.data.arrayToMap(pwaStatCdList, function(obj){return obj.cmmCd;});

//PWA 유형코드 pwaTpDs
var pwaTpList = [];
<c:forEach var ="obj" items="${pwaTpDs}">
 // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 start
      //console.log("是否使用","${obj.useYn}");
      if("Y" == "${obj.useYn}"){
         pwaTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      }
 // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 END
    //pwaTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pwaTpMap = dms.data.arrayToMap(pwaTpList , function(obj){return obj.cmmCd;});

//获取PWA 系数  需求 csr清单　62　JM 2020-2-28 start
var pwaTpCd2List = [];
<c:forEach var ="obj" items="${pwaTpDs}">
// CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废  C  延保索赔结算 11 作废 贾明 2020-4-19 start
    if("A" == "${obj.cmmCd}" || "C" == "${obj.cmmCd}"){
    } else {
       if("Y" == "${obj.useYn}"){
        pwaTpCd2List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      }
    }
 // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 END
    
    
</c:forEach>
var pwaTpCd2Map = dms.data.arrayToMap(pwaTpCd2List , function(obj){return obj.cmmCd;});

var pwaCoeList = [];
<c:forEach var ="obj" items="${pwaCoeD}">
    pwaCoeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}","remark1":"${obj.remark1}"});
</c:forEach>
var pwaCoeMap = dms.data.arrayToMap(pwaCoeList , function(obj){return obj.remark1;});
//获取PWA 系数  需求 csr清单　62　JM 2020-2-28 end

//PWA 주원인 여부
var pwaCauYnList = [];
<c:forEach var ="obj" items="${pwaCauYnDs}">
    pwaCauYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var pwaCauYnMap = dms.data.arrayToMap(pwaCauYnList , function(obj){return obj.cmmCd;});
//获取PWA 系数  需求 csr清单　62　JM 已经申请并承认数据的弹框 2020-3-24 start
var selectPwaRequiItemPopupWindow;
//获取PWA 系数  需求 csr清单　62　JM 已经申请并承认数据的弹框 2020-3-24  end 
/** 공임 조회 팝업 **/
var laborSearchPopup;
/** 부품 조회 팝업 **/
var selectShareStockGiItemPopupWindow;
/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;
/** 고객 팝업 **/
var vehOfCustInfoSearchPopup;
/** 삼포 반품승인 조회 팝업**/
var sanbaoRtnApprSearchPopupWindow;
/** 부품세율 **/
var vatCd = Number("${vatCd}");

//그리드 선택 Row
var gridRow = 0;
var rowPwaDocNo;
var selectedYn = false;

var infoType  = "PWA";

/**임률정보**/
var rateList = [];
<c:forEach var ="obj" items="${rateDs}">
    rateList.push({
        rpirTp:"${obj.rpirTp}"
       ,rpir01:"${obj.gnlRteRate}"
       ,rpir02:"${obj.wartRteRate}"
       ,rpir03:"${obj.incRteRate}"
       ,rpir04:"${obj.intRteRate}"
       ,rpir05:"${obj.rwrkRteRate}"
   });
</c:forEach>


$(document).ready(function (e){

    /* $("#sVinNo").bind("keyup",function(){
        $(this).val($(this).val().toUpperCase());
     }); */

    setPwaStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaStatMap[value] != undefined)
            resultVal =  pwaStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    setPwaCauYnMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaCauYnMap[value] != undefined)
            resultVal =  pwaCauYnMap[value].cmmCdNm;
        }
        return resultVal;
    };


 // ********************** 초기 데이터 세팅 **********************

    //공임조회팝업
    selectlaborCodeSearchPopupWindow = function (sFlag , sCloseYn){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        var goodwillYn = "N";
        var pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        var pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();

        if(pwaTpCd1 == "G" || pwaTpCd2 == "G" || pwaTpCd1 == "J" || pwaTpCd2 == "J"){
            goodwillYn = "Y";
        }
        //维修项目增加
        laborSearchPopup = dms.window.popup({
            windowId:"laborCodeSearchPopupWindow"
            ,title:"<spring:message code = 'ser.lbl.lbrNm'/>"
            ,template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            ,height:400
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                , data:{
                     "autoBind":false
                    ,"selectable":(sFlag == "GD") ? "multiple":"row"
                    ,"sLtsModelCd":$("#ltsModelCd").val()
                    ,"sCauLbrYn": (sFlag == "GD") ? "N" : "Y"
                    ,"sGoodwillYn":goodwillYn
                    ,"sRoTp" : "02"
                    ,"sReadOnly":"Y"      // 구분 readOnly 여부
                    ,"sDstinCd": "H"
                    ,"sClose":sCloseYn
                    ,"sButtonEnable":"N"
                    ,"callbackFunc":function(jsonObj){

                        var grid = $('#gridLabor').data('kendoExtGrid');
                        var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
                        var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();

                        var rpirCd = (pwaType1 == "3" || pwaType2 == "3") ? "P":"W";
                        var ratePrc = Number(serviceJs.setRpirRate(rateList , "02" , rpirCd));

                        if(sFlag == 'GD'){
                            if(jsonObj.length > 0) {

                                var popTzCdCnt = 0; // 공임팝업에서 선택한 TT,ZZ CODE 수
                                var gridTzCnt=0;    //그리드에 입력된 TT,ZZ 코드 수
                                var cauOperAtcCd = $("#cauOperAtcCd").val();

                                $.each(jsonObj, function(idx, data){ //popup Labor Code Data
                                    var copyData = {};
                                    var result = true;
                                    var popDstinCd = data.dstinCd;
                                    var pupLbrCd = data.lbrCd;
                                    var popZZCd = data.lbrCd.substr(-2);

                                    $.each(grid.dataSource._data , function(i , labrGridData){ //grid Labor Code Data
                                        var gridLbrCd   = labrGridData.lbrCd;
                                        var gridDstinCd = labrGridData.dstinCd;
                                        var gridZZCd    = labrGridData.lbrCd.substr(-2);
                                         if(gridLbrCd == pupLbrCd){
                                            result = false;
                                         }
                                         if((gridDstinCd == "Z") || (gridDstinCd == "H" && gridZZCd == "ZZ")) gridTzCnt++;
                                    });

                                    // ZZ CODE , TT CODE 는 1개만 입력 가능하게 체크
                                    if((popDstinCd == "Z") || (popDstinCd == "H" && popZZCd == "ZZ")) popTzCdCnt++;

                                    if( (gridTzCnt >= 1 && popTzCdCnt > 0) &&
                                            ((popDstinCd == "Z") || (popDstinCd == "H" && popZZCd == "ZZ"))) result = false;

                                    //ZZ코드인경우 금액은 0
                                    if(popDstinCd == "H" && popZZCd == "ZZ") ratePrc = 0;

                                    if(result){
                                        //if(data.lbrCd)
                                        copyData = {
                                                lbrCd:pupLbrCd // 정비코드
                                               ,lbrNm:data.lbrNm // 정비항목
                                               ,lbrHm:data.lbrHm // 공임시간
                                               ,lbrQty:data.lbrQty   // 공임수량
                                               ,lbrPrc:ratePrc  // 공임단가
                                               ,lbrAmt:Number(( data.lbrQty * data.lbrHm  * ratePrc ).toFixed(2))          // 공임금액
                                               ,cauLbrYn:(pupLbrCd == cauOperAtcCd) ? "Y":"N"
                                               ,relCauLbrYn: data.relCauLbrYn
                                               ,dstinCd: data.dstinCd
                                               ,lbrTp:data.lbrTp
                                               ,lbrCdTp:data.lbrCdTp
                                        };
                                        grid.dataSource.add(copyData);
                                        calTotAmt();
                                    }
                                });
                            }
                        }else{

                            $("#cauOperAtcCd").val(jsonObj[0].lbrCd);
                            $("#cauOperAtcNm").val(jsonObj[0].lbrNm);

                            // 그리드 주작업유무 초기화
                            $.each(grid.dataSource._data, function(idx, data){
                                grid.dataSource._data[idx].set("cauLbrYn","N");
                            });

                            // 주작업 선택한 공임코드가 그리드에 존재하면 주작업여부 선택
                             $.each(jsonObj, function(idx, data){
                                $.each(grid.dataSource._data , function(i , labrData){
                                     if(labrData.lbrCd == data.lbrCd){
                                        grid.dataSource._data[i].set("cauLbrYn","Y");
                                    }
                                });
                            });
                        }
                    }
                }
            }
        });
    };

    //부품조회팝업 配件项目添加
    partSearchPopupWindow = function (sFlag){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,height : 630
            ,modal : true
            ,content:{
              //  url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                url:"<c:url value='/ser/wac/pwaReq/selectPwaItemSearchPopup.do'/>"
                ,data:{
                     "autoBind":false
                    ,"selectable":(sFlag == "GD") ? "multiple":"row"
                    ,"prcTp" :"04"
                    ,"avlbStockQtyZeroYn" : "N"    //재고 없는 부품도 함께 조회.(16.12.04 yewonK)
                    ,"carlineCd" : ($("#carlineCd").val() != undefined) ? $("#carlineCd").val() : ""
                    ,"sFlag" : sFlag
                    ,"callbackFunc":function(jsonObj,bizType){
                        if(jsonObj.length > 0) {

                            var grid = $('#gridPart').data('kendoExtGrid');
                            var cauItemCd = $("#cauItemCd").val();

                            if(sFlag == 'GD'){
                                $.each(jsonObj, function(idx, data){
                                    var copyData = {};
                                    var result = true;
                                    $.each(grid.dataSource._data , function(i , partData){

                                        if(partData.itemCd == data.itemCd){
                                            result = false;
                                        }

                                    });
                                    if(result){
                                        copyData = {
                                                  dlrCd :data.dlrCd
                                                , itemCd:data.itemCd
                                                , itemNm:data.itemNm
                                                , reqQty:data.giQty
                                                , saleUnitCd:data.stockUnitCd
                                                , itemPrc:data.taxDdctGrtePrc
                                                , salePrcAmt:data.salePrcAmt
                                                , itemMarkup:data.markUp
                                                , itemAmt:Number(calMarkupPartAmt(data.taxDdctGrtePrc, data.giQty, data.markUp, data.npnpYn))
                                                , cauItemYn:(cauItemCd == data.itemCd ) ? "Y":"N"
                                                , npnpYn: (bizType == "NPN") ? data.npnpYn : "N"
                                                , npnpMaxAmt: (bizType == "NPN") ? data.npnpMaxAmt : 0
                                        };
                                        grid.dataSource.add(copyData);
                                        calTotAmt();
                                    }

                                });
                             }else {
                                 $("#cauItemCd").val(jsonObj[0].itemCd);
                                 $("#cauItemNm").val(jsonObj[0].itemNm);

                                 // 그리드 원인부품 유무 초기화
                                 $.each(grid.dataSource._data, function(idx, data){
                                     grid.dataSource._data[idx].set("cauItemYn","N");
                                 });

                                 // 원인부품 선택한 부품코드가 그리드에 존재하면 원인부품 여부 선택
                                  $.each(jsonObj, function(idx, data){
                                     $.each(grid.dataSource._data , function(i , partData){
                                          if(partData.itemCd == data.itemCd){
                                             grid.dataSource._data[i].set("cauItemYn","Y");
                                         }
                                     });
                                 });
                                selectShareStockGiItemPopupWindow.close();
                             }
                        }
                    }
                }
            }
        });
    };

    //고객조회팝업
    custPopupWindow = function(){

        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
                ,title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                ,content:{
                      url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"type"  :null
                        ,"sOwnCarYn":"Y"
                        ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            //필드 초기화
                            getCustInfo(data[0],"PWA");
                        }
                    }
                }
            }
        });
    };

    // 고객 상세조회
    getCustInfo = function(data,infoType){
        initAll();
        var jsonData = {};
        if(infoType == "PWA"){
            jsonData = {
                "sVinNo":data.vinNo
               ,"sCarId":data.carId
            };
        }else {
            jsonData = data;
        }
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
            ,data:JSON.stringify(jsonData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                  //고객정보 , 차량정보 세팅
                    custInfoSet(result.data[0]);
                }
            }
        });
    };

    /** 원인현상코드 조회 팝업 **/
    selectPhenCauCodeSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.item' var='item' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${item}' />";

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
        if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        }

        var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
        var paintYn = (pwaType1 == "3" || pwaType2 == "3") ? "P":"C";

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            , height:450
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data:{
                     "autoBind":false
                    ,"paintYn": paintYn //paint:P , 원인코드:C
                    ,"itemCd":$("#cauItemCd").val()        // 보증수리:0 , 일반수리 :1
                    , "callbackFunc":function(data){
                        $("#cauCd").val(data[0].cauCd);
                        $("#cauNm").val(data[0].cauNm);
                        $("#phenCd").val(data[0].phenCd);
                        $("#phenNm").val(data[0].phenNm);
                    }
                }
            }
        });
    };


    /** 삼포 반품승인  조회 팝업 **/
    selectSanbaoRtnAprSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.vinNo' var='vinNo' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />";

        if($("#vinNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
            sanbaoRtnApprSearchPopupWindow = dms.window.popup({
                windowId:"sanbaoRtnApprSearchPopupWindow"
                ,title:"<spring:message code = 'ser.title.sanbaoReturnApr'/>"    //
                ,template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
                ,height:270
                ,content:{
                      url:"<c:url value='/ser/cmm/popup/selectSanbaoReturnApprovePopup.do'/>"
                    ,data:{
                         "autoBind":true
                        ,"sVinNo":$("#vinNo").val()
                        ,"sPreFixId":"PWA"
                        ,"callbackFunc":function(data){
                            if(data.length != 0 ){
                                $("#returnApproveNo").val(data[0].returnApproveNo);
                                $("#returnApproveNoYn").val("Y");
                                $("#orgReturnApproveNo").val(data[0].returnApproveNo);
                            }
                        }
                    }
                }
            });
    };




   /** PWA Type 중복 체크 **/
     checkPwaType = function(e){

         var msg = "<spring:message code='ser.lbl.pwaTpCd' var='ser_lbl_pwaTpCd' />"+
                   "<spring:message code='global.info.duplicateCheck' arguments='${ser_lbl_pwaTpCd}' />";

         var grid = $("#gridLabor").data("kendoExtGrid");
         var gridData = grid.dataSource._data;

         var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
         var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();

         var rpirCd = (pwaType1 == "3" || pwaType2 == "3") ? "P":"W";
         var ratePrc = Number(serviceJs.setRpirRate(rateList , "02" , rpirCd));

         // PWA TYPE 변경시 금액 재계산
         $.each(grid.dataSource._data , function(i , gridData){
             //ZZ코드인경우 금액은 0
             var zzCd    = gridData.lbrCd.substr(-2);
             if(gridData.dstinCd == "H" && zzCd == "ZZ") ratePrc = 0;

             var lbrQty = Number(gridData.lbrQty);
             var lbrHm  = Number(gridData.lbrHm);
             var lbrPrc = Number(ratePrc);
             var lbrAmt = Number(( lbrQty * lbrHm * lbrPrc  ).toFixed(2));

             grid.dataSource._data[i].set("lbrAmt",lbrAmt);
             grid.dataSource._data[i].set("lbrPrc",lbrPrc);
             //calTotAmt();
         });

         if( pwaType1  == pwaType2 ){ //global.info.duplicateCheck
             $("#pwaTpCd2").focus();
             $("#pwaTpCd2").data("kendoExtDropDownList").value("");

             return dms.notification.warning(msg);
         }
         //获取PWA 系数  需求 csr清单　62　 延保索赔申请 、延保索赔结算  只放到PWA类型1上 然后当选择其中之一的情况下,PWA2类型置灰（不让选）  当PWA类型1 JM 2020-2-28 start
        // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
         if("A" == pwaType1 || "C" == pwaType1){
            $("#pwaTpCd2").focus();
            $("#pwaTpCd2").data("kendoExtDropDownList").value("");
            $("#pwaTpCd2").data("kendoExtDropDownList").enable(false);
           
            $("#subLbrOccrAmt").data("kendoExtNumericTextBox").value(0.00);
            $("#subLbrOccrAmt").data("kendoExtNumericTextBox").enable(false);
         }else {
            $("#pwaTpCd2").data("kendoExtDropDownList").enable(true);
            $("#subLbrOccrAmt").data("kendoExtNumericTextBox").enable(true);
         }
         var gridPart = $("#gridPart").data("kendoExtGrid");
         var gridPartData = gridPart.dataSource._data;
          $.each(gridPartData , function(i , partData){
             var reqQty = Number(partData.reqQty);//配件数量
             var itemPrc  = Number(partData.itemPrc);//配件单价
             var npnpYn = partData.npnpYn;
             var itemMarkup = partData.itemMarkup;
             var itemAmt =  Number(calMarkupPartAmt(itemPrc, reqQty, itemMarkup, npnpYn))
             gridPart.dataSource._data[i].set("itemAmt",itemAmt);
             //calTotAmt();
          });
            //选择的pwa信息
            var gridMaster = $("#gridMaster").data("kendoExtGrid");
            var rows = gridMaster.select();
            var selectedVal = gridMaster.dataItem(rows);
            // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
          if("C" == pwaType1){
              if(0 == rows.length){
                if(dms.string.isEmpty($("#vinNo").val())){
                   $("#pwaTpCd1").focus();
                   $("#pwaTpCd1").data("kendoExtDropDownList").value("");
                   dms.notification.warning("<spring:message code='ser.lbl.vinNo' var='serVinNO' /><spring:message code='global.info.validation.select' arguments='${serVinNO}' />");
                   //dms.notification.warning("<spring:message code='ser.lbl.vinNo' />");
                   return;
                }else{
                   //$("#pwaRequiNo").attr("disabled", false);
                    $("#calcDocNo").attr("disabled", false);
                    $("#pwaRequiNoTh").html('<span class="bu_required"><spring:message code="ser.lbl.pwaRelateRequi" /></span>');
                    $("#calcDocNoTh").html('<span class="bu_required"><spring:message code="ser.lbl.pwaRelateBill" /></span>');
                    pwaRequiSearchPopupWindow();//获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，并用是已经承认 状态的 csr清单　62 JM 
                };
              } else {
                 if('C' == selectedVal.pwaTpCd1 && 'O' == selectedVal.pwaStatCd){
                      $("#calcDocNo").attr("disabled", false);
                      $("#pwaRequiNoTh").html('<span class="bu_required"><spring:message code="ser.lbl.pwaRelateRequi" /></span>');
                      $("#calcDocNoTh").html('<span class="bu_required"><spring:message code="ser.lbl.pwaRelateBill" /></span>');
                      pwaRequiSearchPopupWindow();//获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，并用是已经承认 状态的 csr清单　62 JM 
                   } 
              
                  
              }
               
          }else {
              $("#pwaRequiNoTh").html('<spring:message code="ser.lbl.pwaRelateRequi" />');
              $("#calcDocNoTh").html('<spring:message code="ser.lbl.pwaRelateBill" />');
              $("#pwaRequiNo").attr("disabled", "disabled");
              $("#calcDocNo").attr("disabled", "disabled");
              $("#pwaRequiNo").val('');
              $("#calcDocNo").val('');
          }
          calTotAmt();
          
         //获取PWA 系数  需求 csr清单　62　JM 2020-2-28 end
     };
//获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，并用是已经承认 状态的 csr清单　62 JM 2020-3-24 start 
pwaRequiSearchPopupWindow = function(){
     selectPwaRequiItemPopupWindow = dms.window.popup({
            windowId:"pwaRequiItemPopup"
            ,title:"<spring:message code="ser.title.pwaList" />"   
            ,height : 630
            ,modal : true
            ,content:{
                url:"<c:url value='/ser/wac/pwaReq/selectPwaRelateRequiSearchPopup.do'/>"
                ,data:{
                      "vinNo":$("#vinNo").val()
                      ,"callbackFunc":function(pwaDocNoVal,gridRelLaborData,gridRelPartData,pwaInfos){
                           //console.log("返回数据",pwaInfos);
                            $("#pwaRequiNo").val(pwaDocNoVal);
                            var gridLabor = $('#gridLabor').data('kendoExtGrid');
                            var gridPart = $('#gridPart').data('kendoExtGrid');
                            //维修项目添加 start
                            if(gridRelLaborData.length > 0 ){
                                $.each(gridRelLaborData, function(idx, data){
                                    copyData = {
                                                lbrCd:data.lbrCd // 维修代码
                                               ,lbrNm:data.lbrNm // 维修项目
                                               ,lbrHm:data.lbrHm // 标准工时
                                               ,lbrQty:data.lbrQty   // 数量
                                               ,lbrPrc:data.lbrPrc  // 工时单价
                                               ,lbrAmt:data.lbrAmt          // 金额
                                               ,cauLbrYn:data.cauLbrYn  //主作业代码
                                               ,relCauLbrYn: data.relCauLbrYn
                                               ,dstinCd: data.dstinCd
                                               ,lbrTp:data.lbrTp
                                               ,lbrCdTp:data.lbrCdTp
                                        };
                                        gridLabor.dataSource.add(copyData);
                                        
                                });
                            }
                             //维修项目添加 end
                             //配件项目添加 start
                            if(gridRelPartData.length > 0 ){
                               $.each(gridRelPartData, function(idx, data){
                                    var copyData = {};
                                    copyData = {
                                                  dlrCd :data.dlrCd
                                                , itemCd:data.itemCd
                                                , itemNm:data.itemNm
                                                , reqQty:data.reqQty
                                                , saleUnitCd:data.saleUnitCd
                                                , itemPrc:data.itemPrc
                                                , salePrcAmt:data.salePrcAmt
                                                , itemMarkup:data.itemMarkup
                                                , itemAmt:data.itemAmt
                                                , cauItemYn:data.cauItemYn
                                                , npnpYn:data.npnpYn
                                                , npnpMaxAmt: data.npnpMaxAmt
                                        };
                                        gridPart.dataSource.add(copyData);
                                }); 
                            }
                            //获取 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，增加关联申请的带入内容，将主表的 原因配件代码、主作业代码、原因代码、现像代码、故障现像说明、维修方案几项都带出来
                            //原因配件代码
                            $("#cauItemCd").val(pwaInfos["cauItemCd"]); 
                            $("#cauItemNm").val(pwaInfos["cauItemNm"]);
                            //主作业代码
                            $("#cauOperAtcCd").val(pwaInfos["cauOperAtcCd"]);
                            $("#cauOperAtcNm").val(pwaInfos["cauOperAtcNm"]);
                            //原因代码
                            $("#cauCd").val(pwaInfos["cauCd"]);
                            $("#cauNm").val(pwaInfos["cauNm"]);
                            //现像代码、
		                    $("#phenCd").val(pwaInfos["phenCd"]);
                            $("#phenNm").val(pwaInfos["phenNm"]);
                            //故障现像说明、
		                    $("#errPhenCont").val(pwaInfos["errPhenCont"]);
		                    //维修方案
		                    $("#rpirMtdCont").val(pwaInfos["rpirMtdCont"]);
		                    //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
		                    var  fileKeyNmVal = pwaInfos["fileKeyNm"];
		                    if(dms.string.isNotEmpty(fileKeyNmVal)){
		                         getRequisitionFile(fileKeyNmVal,pwaDocNoVal);
		                    }
		                     //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 end
		                    //console.log("PWA申请文件编号",pwaInfos["fileKeyNm"]);
                            calTotAmt();
                     }
                }
            }
     });
 };
 
 //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
 //在选择PWA1类型时为延保索赔结算时，选择 延保索赔申请的附件
 getRequisitionFile = function(fileKeyNmVal,filePwaRequiNo){
                   var params = {};
                   params["sFileDocNo"] =fileKeyNmVal;
                  $.ajax({
                         url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                        ,data:JSON.stringify(params)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result , textStatus){
                              //var fileGrid = $('#fileGrid').data('kendoExtGrid');
                               var fileGrid = $("#fileGrid").data("kendoExtGrid");
                            if(result.data.length > 0 ){
                                 var fileGridData = result.data;
                                 $.each(fileGridData, function(idx, data){
                                    var copyData = {};
                                    copyData = {
                                                  fileDocNo :data.fileDocNo
                                                , fileNo:data.fileNo
                                                , fileNm:data.fileNm
                                                , fileSize:data.fileSize
                                                , filePwaRequiNo:filePwaRequiNo    
                                             };
                                        fileGrid.dataSource.add(copyData);
                                }); 
                              
                              }
                             
                              
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                 });
 
 };
  //在选中pwa时，带出延保索赔申请的附件
  getPwaFileRequestByKey = function(fileVinNo,filePwaRequiNo){
       var data = {
               "sVinNo" : fileVinNo
               ,"sPwaDocNo":filePwaRequiNo
             };
             
       $.ajax({
                 url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestByKey.do' />"
                ,data:JSON.stringify(data)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
                ,error:function(jqXHR,status,error) {

                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function (result){
                  var fileKeyNmVal = result["fileKeyNm"];
                  if(dms.string.isNotEmpty(fileKeyNmVal)){
                     getRequisitionFile(fileKeyNmVal,filePwaRequiNo);
                  }
                  //2021.2.19 update by tjx 查询结果将车辆品牌信息制空;
                  $("#ncarDstinCd").val("") ;
                }
             }) ;
  };
 
 //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 end
 
 //CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比 2020-4-19 start
 obtainServiceStatementInfo = function(){
            var params = {};
            params["sCalcDocNo"]  = $("#calcDocNo").val();
           //根据关联结算单 查 维修委托号码
           if(dms.string.isNotEmpty($("#calcDocNo").val()) && 12 <= ($("#calcDocNo").val().length)){
               $.ajax({
                         url:"<c:url value='/ser/cal/calculate/selectCalculatesList.do' />"
                        ,data:JSON.stringify(params)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result , textStatus){
                        
                           isCalcDocNo = false;
                          if(dms.string.isNotEmpty(result.data)){
                               isCalcDocNo = true;
                          }else{
                               isCalcDocNo = false;
                          }
                          
                          if(isCalcDocNo){
                              //console.log(result.data);
                             //result.data[0].calcDocNo;
                             if(dms.string.isNotEmpty(result.data[0].roDocNo)){
                                var roDocNoVal = result.data[0].roDocNo;
                                //获取服务结算单的配件项目
                                getCalcServiceParts(roDocNoVal);
                                //获取服务结算单的维修项目
                                getCalcServiceLabors(roDocNoVal);
                             }
                          }
                           
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                 });
             }
 };
 
 //获取服务结算单的配件项目
 getCalcServiceParts = function(partDocNo){
           var params = {};
           params["sPreFixId"] = "RO";
           params["sDocNo"] = partDocNo;
           params["sGiQtyExist"] = "Y";
             $.ajax({
                         url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do' />"
                        ,data:JSON.stringify(params)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result , textStatus){
                             //console.log("获取服务结算单的配件项目",result);
                             calcServiceParts = [];
                             if(dms.string.isNotEmpty(result.data)){
                                 calcServiceParts = result.data
                             }
                             //console.log("获取服务结算单的配件项目calcServiceParts",calcServiceParts);
                             //console.log("获取服务结算单的配件项目calcServiceParts",calcServiceParts.length);
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                 });
 };
 
 //获取服务结算单的维修项目
  getCalcServiceLabors = function(sDocNo){
       var params = {};
       params["sPreFixId"] = "RO";
       params["sDocNo"] = sDocNo;
       
               $.ajax({
                         url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do' />"
                        ,data:JSON.stringify(params)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result , textStatus){
                              //console.log("获取服务结算单的维修项目",result);
                              calcServiceLabors = [];
                             if(dms.string.isNotEmpty(result.data)){
                                 calcServiceLabors = result.data
                             }
                              //console.log("获取服务结算单的维修项目calcServiceLabors",calcServiceLabors);
                              //console.log("获取服务结算单的维修项目calcServiceLabors",calcServiceLabors.length);
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                });
                 
 };
 //CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比 2020-4-19 end
 
//获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，并用是已经承认 状态的 csr清单　62 JM 2020-3-24 start 
   /** PWA 유형코드1 pwaTpCd1 **/
     $("#pwaTpCd1").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pwaTpList
        ,template:"[#:cmmCd#] #:cmmCdNm#"
        ,valueTemplate:"[#:cmmCd#] #:cmmCdNm#"
        ,optionLabel:" "  // 선택
        ,index:0
        ,change:checkPwaType
        ,valuePrimitive:true
     });

    /**PWA 유형코드2 pwaTpCd2 **/
     $("#pwaTpCd2").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pwaTpCd2List  // pwaTpList 获取PWA 系数  需求 csr清单　62　JM 2020-2-28 
        ,template:"[#:cmmCd#] #:cmmCdNm#"
        ,valueTemplate:"[#:cmmCd#] #:cmmCdNm#"
        ,optionLabel:" "  // 선택
        ,index:0
        ,change:checkPwaType
        ,valuePrimitive:true
      });

     // ********************** 데이터 format 세팅 **********************
     /**조회조건 시작일자 **/
     $("#sFromDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sFromDt}"
     });

    /**조회조건 종료일자**/
     $("#sToDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sToDt}"
     });

     /** PWA 상태코드  콤보박스 **/
     $("#sPwaStatCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:pwaStatCdList
         ,optionLabel:" "  // 선택
         ,index:0
         ,valuePrimitive:true
     });

     //조회버튼
     $("#btnSearch").kendoButton({
         click:function(e){

             selectedYn = false;
             $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
             $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
             $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
             $("#gridPart").data("kendoExtGrid").dataSource.data([]);
         }
     });

     //엑셀버튼
     $("#btnExcelExport").kendoButton({

         click:function(e){

             dms.ajax.excelExport({
                 "beanName"         :"pwaRequestService"
                 ,"templateFile"    :"PwaRequestList_Tpl.xlsx"
                 ,"fileName"        :"<spring:message code='ser.title.pwaList' />.xlsx"
                 ,"sFromDt"         :$("#sFromDt").val()
                 ,"sToDt"           :$("#sToDt").val()
                 ,"sVinNo"          :$("#sVinNo").val()
                 ,"sPwaStatCd"      :$("#sPwaStatCd").val()
                 ,"sPwaDocNo"       :$("#sPwaDocNo").val()                            // TAB ID
             });
         }
     });

     /** 초기화 버튼**/
     $("#btnInit").kendoButton({
         click:function (e){
             initAll();
         }
     });

     /** 저장 버튼**/
     $("#btnSave").kendoButton({
         click:function(e){
            //console.log("btnSave传递的值",$("#pwaStatCd").val());
            //2021.2.19 update by tjx 报错pwa申请时校验车辆品牌是否为北京现代,不是则提示 start
            var ncarDstinCd = $("#ncarDstinCd").val();
            if("N" != ncarDstinCd && "" != ncarDstinCd){
           	  dms.notification.warning("<spring:message code='ser.lbl.notBhmcCannotPwa'/>");//非北京现代品牌车辆，不可以制作PWA
              return;
            }
          //2021.2.19 update by tjx 报错pwa申请时校验车辆品牌是否为北京现代,不是则提示 end
             sendRequestSave($("#pwaStatCd").val());
             qcVal=1;//当点击保存时，qcVal置为1 贾明 2018-11-13
             if("R"==$("#pwaStatCd").val()){
                 qcValR=2;
                 isDbClice=3;
             }
         }
     });

     /** 삭제버튼 **/
     $("#btnDelete").kendoButton({
         click:function (e){

             $("#messageId").html("<spring:message code='ser.lbl.del' var='global_lbl_del' />"+
                                  "<spring:message code='global.info.cnfrmMsg' arguments='${global_lbl_del}' />");
             conformKendoWindow.content( $(".msgDiv").html());
             conformKendoWindow.open();

             $(".yes, .no").click(function(){

                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                     var formSaveData = $("#pwaRequestForm").serializeObject( $("#pwaRequestForm").serializeArrayInSelector("[data-json-obj='true']"));
                     formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
                     formSaveData.wartDt = $("#wartDt").data("kendoDatePicker").value();
                     //保修结束日期
                     formSaveData.wartExpireDt = $("#wartExpireDt").data("kendoDatePicker").value("");
                     formSaveData.pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
                     formSaveData.pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();


                     $.ajax({
                         url:"<c:url value='/ser/wac/pwaReq/deletePwaRequests.do' />"
                        ,data:JSON.stringify(formSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(jqXHR , textStatus){
                            /** 버튼 상태 세팅 **/
                            setButtonEnable("");
                            initAll();
                            $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
                            dms.notification.success("<spring:message code='global.info.success' />");
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                     });
                 }else{
                     conformKendoWindow.close();
                 }
             }).end();
         }
     });

     /** 요청버튼 **/
     $("#btnReq").kendoButton({
         click:function (e){
        	 //2021.2.19 update by tjx 报错pwa申请时校验车辆品牌是否为北京现代,不是则提示 start
             var ncarDstinCd = $("#ncarDstinCd").val();
             if("N" != ncarDstinCd && "" != ncarDstinCd){
            	  dms.notification.warning("<spring:message code='ser.lbl.notBhmcCannotPwa'/>");//非北京现代品牌车辆，不可以制作PWA
               return;
             }
           //2021.2.19 update by tjx 报错pwa申请时校验车辆品牌是否为北京现代,不是则提示 end
             var pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
             var pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();

             $("#messageId").html("<spring:message code='ser.lbl.quest' var='ser_lbl_quest' />"+
                                  "<spring:message code='global.info.cnfrmMsg' arguments='${ser_lbl_quest}' />");
             conformKendoWindow.content( $(".msgDiv").html());
             conformKendoWindow.open();
             $(".yes, .no").click(function(){
                 if($(this).hasClass("yes")){
                     conformKendoWindow.close();
                     sendPwaRequest("Q");
                 }else{
                     conformKendoWindow.close();
                 }
             }).end();
         }
     });

     /** 요청취소 **/
     $("#btnReqCancel").kendoButton({
         click:function (e){
            $("#messageId").html("<spring:message code='ser.lbl.reqCancel' var='ser_lbl_reqCancel' />"+
                                  "<spring:message code='global.info.cnfrmMsg' arguments='${ser_lbl_reqCancel}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                    sendPwaRequest("O");
                    qcVal=2;//当点击取消申请时，qcVal置为2 贾明 2018-11-13
                }else{
                    conformKendoWindow.close();
                }
            }).end();
         }
     });

     /** 기술자문 삭제 버튼**/
     $("#btnRtnAprDel").kendoButton({

         click:function(e){

            var jsonData = {
                    pwaDocNo : $("#pwaDocNo").val()
                   ,vinNo:$("#vinNo").val()
            };

            $.ajax({
                url:"<c:url value='/ser/wac/pwaReq/deleteApproveNo.do' />"
               ,data:JSON.stringify(jsonData)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
                ,success:function(result , textStatus){

                    dms.notification.success("<spring:message code='global.info.success' />");
                    $("#returnApproveNo").val("");
                    $("#orgReturnApproveNoYn").val("");
                    $("#returnApproveNoYn").val("N");

                }
                ,beforeSend: function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete: function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
         }
     });


     /** 공임추가  **/
     $("#lbrAdd").kendoButton({

         click:function (e){

             var pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
             var pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();

             if( pwaTpCd1 == "" && pwaTpCd2 =="" ){
                 var  msgText = "<spring:message code='ser.lbl.pwaTpCd' var='ser_lbl_pwaTpCd' />"+
                               "<spring:message code='global.info.check.field' arguments='${ser_lbl_pwaTpCd}' />";
                 return dms.notification.warning(msgText);
             }
             selectlaborCodeSearchPopupWindow('GD','N');
         }
     });

     /** 공임삭제  **/
     $("#lbrDel").kendoButton({

         click:function (e){

             var grid = $("#gridLabor").data("kendoExtGrid");
             var rows = grid.select();
             var selectedVal = grid.dataItem(rows);

             if(selectedVal != null){
                 if(selectedVal.lbrCd == $("#cauOperAtcCd").val() ){
                     $("#cauOperAtcCd").val("");
                     $("#cauOperAtcNm").val("");
                 }
             }
             rows.each(function(index, row) {
                 grid.removeRow(row);
             });
             calTotAmt();
         }
     });

    /**공임취소 **/
     $("#lbrCancel").kendoButton({
         click:function(e) {
             var griLabor = $('#gridLabor').data('kendoExtGrid');
             griLabor.cancelChanges();
             calTotAmt();

             $.each(griLabor.dataSource._data , function(i , laborData){
                 if(laborData.cauLbrYn == "Y"){
                     $("#cauOperAtcCd").val(laborData.lbrCd);
                     $("#cauOperAtcNm").val(laborData.lbrNm);
                 }
             });
         }
     });

     /** 부품추가  **/
     $("#parAdd").kendoButton({

         click:function(e){
             partSearchPopupWindow('GD');
          }
      });

     /** 부품삭제  **/
     $("#parDel").kendoButton({
         click:function (e){
             var grid = $("#gridPart").data("kendoExtGrid");
             var rows = grid.select();

             var selectedVal = grid.dataItem(rows);
             if(selectedVal != null){
                 if(selectedVal.itemCd == $("#cauItemCd").val() ){
                     $("#cauItemCd").val("");
                     $("#cauItemNm").val("");
                 }
             }
             rows.each(function(index, row) {
                 grid.removeRow(row);
             });

             calTotAmt();
         }

     });

     /**부품취소 **/
     $("#parCancel").kendoButton({
         click:function(e) {
             var gridPart = $('#gridPart').data('kendoExtGrid');
             gridPart.cancelChanges();
             calTotAmt();

             $.each(gridPart.dataSource._data , function(i , partData){
                 if(partData.cauItemYn == "Y"){
                     $("#cauItemCd").val(partData.itemCd);
                     $("#cauItemNm").val(partData.itemNm);
                 }
             });
         }
     });

    /**PWA 요청 및 요청 취소**/
    sendPwaRequest = function(pwaStatCd){

        /**PWA 승인 상태를 확인필요 **/
        var pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        var pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
        // 弹框 延保索赔申请类型的PWA申请单  csr清单 保存时　62 贾明 2020-3-26 start
        // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
        if("C" == pwaTpCd1 && "Q" == pwaStatCd){
           if(dms.string.isEmpty($("#calcDocNo").val())){
                dms.notification.warning("<spring:message code='ser.lbl.pwaRelateBill' var='pwaRelateBill' /><spring:message code='global.info.isNotNull' arguments='${pwaRelateBill}' />");
                return;
           }
           if(dms.string.isEmpty($("#pwaRequiNo").val())){
                dms.notification.warning("<spring:message code='ser.lbl.pwaRelateRequi' var='pwaRelateRequi' /><spring:message code='global.info.isNotNull' arguments='${pwaRelateRequi}' />");
                return;
           }
        }
        // 弹框 延保索赔申请类型的PWA申请单  csr清单 　保存时 62 贾明 2020-3-26 end

        if(!saveCheckValue(pwaStatCd) || !checkGridValue(pwaTpCd1 , pwaTpCd2)){
           return;
        }

        var gridLabor = $("#gridLabor").data("kendoExtGrid");
        var gridPart = $("#gridPart").data("kendoExtGrid");
        
        //CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比  2020-4-19 贾明 start
          if("C" == pwaTpCd1 && "Q" == pwaStatCd){
             if(isCalcDocNo){
                  //console.log("11",gridLabor);
                  //console.log("112",gridPart);
                  //维修项目
                  var gridLbrData = gridLabor.dataSource._data;
                  var lbrArr =[];//存放 维修项目差异数据
                  //console.log("服务结算单维修项目",calcServiceLabors.length);
                  if(gridLbrData.length != calcServiceLabors.length){
                      //dms.notification.warning("维修项目与结算单维修项目不一致，请修改后保存。");
                        dms.notification.warning("<spring:message code='ser.info.maintenanceItemModify' />");
                      return; 
                  }
                  
                  if(gridLbrData.length == calcServiceLabors.length){
                       $.each(gridLbrData , function(i , labrData){ 
                            var lbrCount = 0;
                            //console.log("维修项目维修代码在",labrData.lbrCd);
                             for(var i = 0; i < calcServiceLabors.length; i++ ){
                                //console.log("服务结算单维修项目代码",calcServiceLabors[i].lbrCd);
                                if(labrData.lbrCd == calcServiceLabors[i].lbrCd) {
                                      lbrCount++;
                                  }
                             }
                             if(lbrCount === 0) {//表示数组1的这个值没有重复的，放到LbrArr列表中
                               lbrArr.push(labrData.lbrCd);
                             }
                       });
                       //console.log("LbrArr的数据",lbrArr.length);
                       //console.log("LbrArr的数据",lbrArr);
                       if(0 != lbrArr.length){
                           //dms.notification.warning("维修项目与结算单维修项目不一致，请修改后保存1。");
                            dms.notification.warning("<spring:message code='ser.info.maintenanceItemModify' />");
                           return; 
                       }
                      
                  }

                  //配件项目
                  var gridPartData = gridPart.dataSource._data;
                  var partArr =[];//存放 配件项目差异数据
                  
                  if(gridPartData.length != calcServiceParts.length){
                      
                      //dms.notification.warning("配件项目与结算单配件项目不一致，请修改后保存。");
                       dms.notification.warning("<spring:message code='ser.info.accessoryItemModify' />");
                      return; 
                  }
                  if(gridPartData.length == calcServiceParts.length){
                    $.each(gridPartData , function(i , partData){ 
                            var partCount = 0;
                             for(var j = 0; j < calcServiceParts.length; j++ ){
                                if(partData.itemCd == calcServiceParts[j].itemCd) {
                                      partCount++;
                                  }
                             }
                             if(partCount === 0) {//表示数组1的这个值没有重复的，放到partArr列表中
                               partArr.push(partData.itemCd);
                             }
                    });
                    
                     if(0 != partArr.length){
                            //dms.notification.warning("配件项目与结算单配件项目不一致，请修改后保存。");
                            dms.notification.warning("<spring:message code='ser.info.accessoryItemModify' />");
                           return; 
                       }
                  }
                  //var calcServiceParts = [];  获取服务结算单的配件项目
                  //var calcServiceLabors = []; 获取服务结算单的维修项目
             }
            }
        //CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比  2020-4-19 贾明 end
        
        var formSaveData = $("#pwaRequestForm").serializeObject( $("#pwaRequestForm").serializeArrayInSelector("[data-json-obj='true']") );

        formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
        formSaveData.wartDt = $("#wartDt").data("kendoDatePicker").value();
        //保修结束日期
        var wartExpireDtFmt = formSaveData.wartExpireDt = $("#wartExpireDt").data("kendoDatePicker").value();
        formSaveData.wartExpireDt = $("#wartExpireDt").data("kendoDatePicker").value("");
        formSaveData.pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        formSaveData.pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
        formSaveData.returnApproveNo = $("#orgReturnApproveNo").val();
        formSaveData.pwaStatCd = ( pwaStatCd  == "") ? "O":pwaStatCd;
        formSaveData.itemOccrAmt = Number($("#itemOccrAmt").text().replace(",", "")).toFixed(2);
        formSaveData.lbrOccrAmt = Number($("#lbrOccrAmt").text().replace(",", "")).toFixed(2);
        formSaveData.totOccrAmt = Number($("#totOccrAmt").text().replace(",", "")).toFixed(2);
        //关联申请单号 、服务结算单号  csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26 保存操作 start
        formSaveData.pwaRequiNo = $("#pwaRequiNo").val();
        formSaveData.calcDocNo  = $("#calcDocNo").val();
        if("Q" == formSaveData.pwaStatCd){
           formSaveData.relatedId  = 'S';
        } else {
           formSaveData.relatedId  = 'T';
        }
        //关联申请单号 、服务结算单号  csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26 end
        var lbrSaveData = gridLabor.getCUDData("insertList", "updateList", "deleteList");
        var partSaveData = gridPart.getCUDData("insertList", "updateList", "deleteList");

        var params =  $.extend(
                {"pwaFormVO":formSaveData}
                ,{"pwaLbrSaveVO":lbrSaveData}
                ,{"pwaPartSaveVO":partSaveData}
        );

        /**
                    요청 상태:Q
                    요청 취소:O ( 미결 상태로 돌린다. )
        **/
        var validator = $("#pwaRequestForm").kendoExtValidator().data("kendoExtValidator");

        var pwaDocNo = dms.string.isNotEmpty($("#pwaDocNo").val());

        if (validator.validate()) {
            $.ajax({
                url:"<c:url value='/ser/wac/pwaReq/updatePwaRequestStat.do' />"
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result , textStatus){

                    $("#pwaDocNo").val(result);
                    $("#pwaStatCd").val( ( pwaStatCd  == "") ? "O" : pwaStatCd );
                    //保修结束日期回显
                    $("#wartExpireDt").data("kendoDatePicker").value(wartExpireDtFmt);
                    selectedYn = ( dms.string.isEmpty($("#sPwaStatCd").val() )  && ((pwaStatCd != "O" ) || (pwaDocNo)) );
                    if(selectedYn) {
                        gridRow = $("#gridMaster").data("kendoExtGrid").select().index();
                        if(gridRow == -1 )gridRow = 0;
                        $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                        $("#gridMaster").data("kendoExtGrid").dataSource.read();
                    }else{

                        var lbrUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />";
                        var partUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />";

                        gridLabor.dataSource.transport.options.read.url = lbrUrl;
                        gridPart.dataSource.transport.options.read.url = partUrl;

                        gridLabor.dataSource._destroyed = [];
                        gridPart.dataSource._destroyed = [];

                        gridLabor.dataSource.read();
                        gridPart.dataSource.read();
                    }
                    //console.log("取消申请",$("#pwaStatCd").val());
                    setButtonEnable($("#pwaStatCd").val()); //버튼 세팅
                    dms.notification.success("<spring:message code='global.info.success' />");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
    };


    /**PWA 요청 및 요청 취소**/
    sendRequestSave = function (pwaStatCd){

        // PWA TYPE 별 체크로직 추가
        // 외주 금액 입력후 외주 코드(TOWINGZZ) 입력 여부 체크
        // TT 코드 유효성 체크
        // 주행거리 체크
        // 원인 현상코드 체크
        // 원인 부품 체크
        // 고장현상  , 수리방안 체크
        

        var pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        var pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
        // 弹框 延保索赔申请类型的PWA申请单  csr清单 保存时　62 贾明 2020-3-26 start
        // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
        if("C" == pwaTpCd1){
           if(dms.string.isEmpty($("#calcDocNo").val())){
                dms.notification.warning("<spring:message code='ser.lbl.pwaRelateBill' var='pwaRelateBill' /><spring:message code='global.info.isNotNull' arguments='${pwaRelateBill}' />");
                return;
           }
           if(dms.string.isEmpty($("#pwaRequiNo").val())){
                dms.notification.warning("<spring:message code='ser.lbl.pwaRelateRequi' var='pwaRelateRequi' /><spring:message code='global.info.isNotNull' arguments='${pwaRelateRequi}' />");
                return;
           }
        }
        // 弹框 延保索赔申请类型的PWA申请单  csr清单 　保存时 62 贾明 2020-3-26 end
        

        if(!saveCheckValue(pwaStatCd) || !checkGridValue(pwaTpCd1 , pwaTpCd2)){
            return;
        }

        var grid = $("#gridMaster").data("kendoExtGrid");
        var gridLabor = $("#gridLabor").data("kendoExtGrid");
        var gridPart = $("#gridPart").data("kendoExtGrid");
        //CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比  2020-4-19 贾明 start
          if("C" == pwaTpCd1){
             if(isCalcDocNo){
                  //console.log("11",gridLabor);
                  //console.log("112",gridPart);
                  //维修项目
                  var gridLbrData = gridLabor.dataSource._data;
                  var lbrArr =[];//存放 维修项目差异数据
                  //console.log("服务结算单维修项目",calcServiceLabors.length);
                  if(gridLbrData.length != calcServiceLabors.length){
                      //dms.notification.warning("维修项目与结算单维修项目不一致，请修改后保存。");
                        dms.notification.warning("<spring:message code='ser.info.maintenanceItemModify' />");
                      return; 
                  }
                  
                  if(gridLbrData.length == calcServiceLabors.length){
                       $.each(gridLbrData , function(i , labrData){ 
                            var lbrCount = 0;
                            //console.log("维修项目维修代码在",labrData.lbrCd);
                             for(var i = 0; i < calcServiceLabors.length; i++ ){
                                //console.log("服务结算单维修项目代码",calcServiceLabors[i].lbrCd);
                                if(labrData.lbrCd == calcServiceLabors[i].lbrCd) {
                                      lbrCount++;
                                  }
                             }
                             if(lbrCount === 0) {//表示数组1的这个值没有重复的，放到LbrArr列表中
                               lbrArr.push(labrData.lbrCd);
                             }
                       });
                       //console.log("LbrArr的数据",lbrArr.length);
                       //console.log("LbrArr的数据",lbrArr);
                       if(0 != lbrArr.length){
                           //dms.notification.warning("维修项目与结算单维修项目不一致，请修改后保存1。");
                            dms.notification.warning("<spring:message code='ser.info.maintenanceItemModify' />");
                           return; 
                       }
                      
                  }

                  //配件项目
                  var gridPartData = gridPart.dataSource._data;
                  var partArr =[];//存放 配件项目差异数据
                  
                  if(gridPartData.length != calcServiceParts.length){
                      
                      //dms.notification.warning("配件项目与结算单配件项目不一致，请修改后保存。");
                       dms.notification.warning("<spring:message code='ser.info.accessoryItemModify' />");
                      return; 
                  }
                  if(gridPartData.length == calcServiceParts.length){
                    $.each(gridPartData , function(i , partData){ 
                            var partCount = 0;
                             for(var j = 0; j < calcServiceParts.length; j++ ){
                                if(partData.itemCd == calcServiceParts[j].itemCd) {
                                      partCount++;
                                  }
                             }
                             if(partCount === 0) {//表示数组1的这个值没有重复的，放到partArr列表中
                               partArr.push(partData.itemCd);
                             }
                    });
                    
                     if(0 != partArr.length){
                            //dms.notification.warning("配件项目与结算单配件项目不一致，请修改后保存。");
                            dms.notification.warning("<spring:message code='ser.info.accessoryItemModify' />");
                           return; 
                       }
                  }
                  //var calcServiceParts = [];  获取服务结算单的配件项目
                  //var calcServiceLabors = []; 获取服务结算单的维修项目
             }
            }
        //CSR 72	PWA申请单据，PWA类型1字段选择了延保索赔结算类型，保存时增加结算单与PWA申请的维修项目与配件的对比  2020-4-19 贾明 end
        
        var formSaveData = $("#pwaRequestForm").serializeObject( $("#pwaRequestForm").serializeArrayInSelector("[data-json-obj='true']") );

        formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
        formSaveData.wartDt = $("#wartDt").data("kendoDatePicker").value();
        //保修结束日期
        var wartExpireDtFmt = formSaveData.wartExpireDt = $("#wartExpireDt").data("kendoDatePicker").value();
        formSaveData.wartExpireDt = $("#wartExpireDt").data("kendoDatePicker").value("");
        formSaveData.pwaTpCd1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
        formSaveData.pwaTpCd2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
        formSaveData.returnApproveNo = $("#orgReturnApproveNo").val();
        formSaveData.pwaStatCd = ( pwaStatCd  == "") ? "O":pwaStatCd;
        formSaveData.itemOccrAmt = Number($("#itemOccrAmt").text().replace(",", "")).toFixed(2);
        formSaveData.lbrOccrAmt = Number($("#lbrOccrAmt").text().replace(",", "")).toFixed(2);
        formSaveData.totOccrAmt = Number($("#totOccrAmt").text().replace(",", "")).toFixed(2);
        //关联申请单号 、服务结算单号  csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26 保存操作 start
        formSaveData.pwaRequiNo = $("#pwaRequiNo").val();
        formSaveData.calcDocNo  = $("#calcDocNo").val();
        formSaveData.relatedId  = 'S';  
        //关联申请单号 、服务结算单号  csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26 end
        var lbrSaveData = gridLabor.getCUDData("insertList", "updateList", "deleteList");
        //console.log("lbrSaveData44",lbrSaveData);
        var partSaveData = gridPart.getCUDData("insertList", "updateList", "deleteList");

        var params =  $.extend(
                {"pwaFormVO":formSaveData}
                ,{"pwaLbrSaveVO":lbrSaveData}
                ,{"pwaPartSaveVO":partSaveData}
        );

        var pwaDocNo = dms.string.isNotEmpty($("#pwaDocNo").val());
        //console.log("gridLabor.gridValidation()的值",gridLabor.gridValidation());
        if(gridLabor.gridValidation() && gridPart.gridValidation()){

            $.ajax({
                url:"<c:url value='/ser/wac/pwaReq/multiPwaRequests.do' />"
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result , textStatus){

                    $("#pwaDocNo").val(result);
                    $("#pwaStatCd").val( ( pwaStatCd  == "") ? "O":pwaStatCd );
                    //保修结束日期回显
                    $("#wartExpireDt").data("kendoDatePicker").value(wartExpireDtFmt);
                    infoType = "PWA";
                    /*
                    selectedYn = ( dms.string.isEmpty($("#sPwaStatCd").val() )  && ((pwaStatCd != "O" ) || (pwaDocNo)) );
                    if(selectedYn) {
                        gridRow = $("#gridMaster").data("kendoExtGrid").select().index();
                        if(gridRow == -1 )gridRow = 0;
                        $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                        $("#gridMaster").data("kendoExtGrid").dataSource.read();
                    }else{

                        var lbrUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />";
                        var partUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />";

                        gridLabor.dataSource.transport.options.read.url = lbrUrl;
                        gridPart.dataSource.transport.options.read.url = partUrl;

                        gridLabor.dataSource._destroyed = [];
                        gridPart.dataSource._destroyed = [];

                        gridLabor.dataSource.read();
                        gridPart.dataSource.read();
                    }
                     */

                     setGridRows(grid);
                     grid.dataSource.data([]);
                     grid.dataSource.page(1);

                    var lbrUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />";
                    var partUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />";

                    gridLabor.dataSource.transport.options.read.url = lbrUrl;
                    gridPart.dataSource.transport.options.read.url = partUrl;

                    gridLabor.dataSource._destroyed = [];
                    gridPart.dataSource._destroyed = [];

                    gridLabor.dataSource.read();
                    gridPart.dataSource.read();


                    setButtonEnable($("#pwaStatCd").val()); //버튼 세팅
                    dms.notification.success("<spring:message code='global.info.success' />");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }else{
            dms.notification.warning("<spring:message code='global.info.check.input' />");
        }

    };

     /** 조회 결과값  세팅**/
     setResultDataSetting =  function (result){
        //PWA 需求csr　62 延保索赔结算选择时的弹出框页 2020-3-26 贾明 START
         $("#pwaRequiNo").val(result["pwaRequiNo"]);
         $("#calcDocNo").val(result["calcDocNo"]);
        //PWA 需求csr　62 延保索赔结算选择时的弹出框页 2020-3-26 贾明 END
        //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
             var  fileVinNo = result["vinNo"];
             var  filePwaRequiNo = result["pwaRequiNo"];
		     if(dms.string.isNotEmpty(filePwaRequiNo)){
		         //getRequisitionFile(fileKeyNmVal);
		         getPwaFileRequestByKey(fileVinNo,filePwaRequiNo);
		     }
        //CSR 74 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，文件子表也要继承延保索赔申请类型的 贾明 2020-4-20 start
         //console.log("选择后,输出的数据",result);
         /* 차량정보 */
         $("#carRegNo").val(result["carRegNo"]);
         $("#enginNo").val(result["enginNo"]);
         $("#carOwnerId").val(result["carOwnerId"]);
         $("#carOwnerNm").val(result["carOwnerNm"]);
         $("#carOwnerTelNo").val(result["carOwnerTelNo"]);
         $("#carlineCd").val(result["carlineCd"]);
         $("#carId").val(result["carId"]);

         $("#vinNo").val(result["vinNo"]);
         $("#pwaDocNo").val(result["pwaDocNo"]);
         $("#dlrCd").val(result["dlrCd"]);
         $("#pwaStatCd").val(result["pwaStatCd"]);
         $("#runDistVal").data("kendoExtNumericTextBox").value(result["runDistVal"]);
         $("#ltsModelCd").val(result["ltsModelCd"]);
         $("#ltsModelNm").val(result["ltsModelNm"]);
         $("#hqApproveId").val(result["hqApproveId"]);
         $("#hqApproveNm").val(result["hqApproveNm"]);
         $("#pwaApproveNo").val(result["pwaApproveNo"]);
         $("#cauCd").val(result["cauCd"]);
         $("#cauNm").val(result["cauNm"]);
         $("#cauItemCd").val(result["cauItemCd"]);
         $("#cauItemNm").val(result["cauItemNm"]);
         $("#phenCd").val(result["phenCd"]);
         $("#phenNm").val(result["phenNm"]);
         $("#cauOperAtcCd").val(result["cauOperAtcCd"]);
         $("#cauOperAtcNm").val(result["cauOperAtcNm"]);
         $("#errPhenCont").val(result["errPhenCont"]);
         $("#rpirMtdCont").val(result["rpirMtdCont"]);
         $("#returnReasonCont").val(result["returnReasonCont"]);
         $("#returnApproveNo").val(result["returnApproveNo"]);
         $("#orgReturnApproveNo").val(result["orgReturnApproveNo"]);

         $("#fileKeyNm").val(result["fileKeyNm"]);

         $("#pwaTpCd1").data("kendoExtDropDownList").value(result["pwaTpCd1"]);
         $("#pwaTpCd2").data("kendoExtDropDownList").value(result["pwaTpCd2"]);

         $("#creDt").data("kendoDatePicker").value(result["creDt"]);
         $("#wartDt").data("kendoDatePicker").value(result["wartDt"]);
         //20200729 保修结束日期  update by tjx 
         $("#wartExpireDt").data("kendoDatePicker").value(result["wartExpireDt"]);
         $("#itemOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["itemOccrAmt"]).toFixed(2)));
         $("#lbrOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["lbrOccrAmt"]).toFixed(2)));
         $("#subLbrOccrAmt").data("kendoExtNumericTextBox").value(result["subLbrOccrAmt"]);
         $("#totOccrAmt").html(dms.string.addThousandSeparatorCommas(Number(result["totOccrAmt"]).toFixed(2)));

         $("#itemApproveAmt").html(dms.string.addThousandSeparatorCommas(Number(result["itemApproveAmt"]).toFixed(2)));
         $("#lbrApproveAmt").html(dms.string.addThousandSeparatorCommas(Number(result["lbrApproveAmt"]).toFixed(2)));
         $("#subLbrApproveAmt").html(dms.string.addThousandSeparatorCommas(Number(result["subLbrApproveAmt"]).toFixed(2)));
         $("#totApproveAmt").html(dms.string.addThousandSeparatorCommas(Number(result["totApproveAmt"]).toFixed(2)));

         if( result["itemApproveAmt"] === null    || result["lbrApproveAmt"] === null ||
             result["subLbrApproveAmt"] === null  || result["totApproveAmt"] === null  )
         {
             $("#itemApproveAmt").html("");
             $("#lbrApproveAmt").html("");
             $("#subLbrApproveAmt").html("");
             $("#totApproveAmt").html("");
         }

     };

     // 차량정보, 고객정보 셋팅
     custInfoSet = function(data){

         $("#vinNo").val(data.vinNo);
         $("#carRegNo").val(data.carRegNo);
         $("#enginNo").val(data.enginNo);
         $("#carOwnerId").val(data.carOwnerId);
         $("#carOwnerNm").val(data.carOwnerNm);
         $("#carOwnerTelNo").val(data.carOwnerTelNo);
         $("#carlineCd").val(data.carlineCd);
         $("#carId").val(data.carId);

         $("#creDt").data("kendoDatePicker").value(data.signOffDt);
         $("#wartDt").data("kendoDatePicker").value(data.grteStartDt);
         //20200729 update by  tjx 新增保修结束日期显示  strat
         $("#wartExpireDt").data("kendoDatePicker").value(data.grteEndDt);
         //20200729 update by  tjx 新增保修结束日期显示 end
         $("#runDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
         $("#ltsModelCd").val(data.ltsModelCd);
         $("#ltsModelNm").val(data.ltsModelNm);
         //2021.2.19 update by tjx 查询出的车辆品牌信息赋值 strat
         $("#ncarDstinCd").val(data.ncarDstinCd);
        //2021.2.19 update by tjx 查询出的车辆品牌信息赋值 end
     };
     var i =0;//贾明 pwa申请中，选中不承认的单子，申请按钮不可用 
    
       
    
     //상세조회
     detailSet = function(data,sInfoType){

         var lbrGrid  = $("#gridLabor").data("kendoExtGrid");
         var partGrid = $("#gridPart").data("kendoExtGrid");
         var fileGrid = $("#fileGrid").data("kendoExtGrid");

         var lbrUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />";
         var partUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />";


         infoType = sInfoType;
         if(infoType == "RO"){
             lbrUrl = "<c:url value='/ser/wac/pwaReq/selectRoLabors.do' />";
             partUrl = "<c:url value='/ser/wac/pwaReq/selectRoParts.do' />";
         }
         lbrGrid.dataSource.transport.options.read.url = lbrUrl;
         partGrid.dataSource.transport.options.read.url = partUrl;


         if(infoType == "RO"){

             getCustInfo(data);
             fileGrid.dataSource.data([]);
             lbrGrid.dataSource.data([]);
             partGrid.dataSource.data([]);

             if( dms.string.isNotEmpty(data.sRoDocNo) ){
                 lbrGrid.dataSource.read();
                 partGrid.dataSource.read();
             }
         }else{

             $.ajax({
                 url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestByKey.do' />"
                ,data:JSON.stringify(data)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
                ,error:function(jqXHR,status,error) {

                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function (result){
                    setResultDataSetting(result);
                    fileGrid.dataSource.data([]);
                    lbrGrid.dataSource.data([]);
                    partGrid.dataSource.data([]);
                    lbrGrid.dataSource.read();
                    partGrid.dataSource.read();
                    fileGrid.dataSource.read();
                    // pwa申请中，选中不承认的单子，申请按钮不可用 贾明 2018-11-20 start
                    var pwaValue =  $("#pwaStatCd").val();
                    //console.log("aq"+i);
                    if(i==0 && "R"==pwaValue){
                        pwaDocNoValue=data.sPwaDocNo;
                        qcValR=1;
                    } else if(i!=0 && "R"==pwaValue){
                        if(pwaDocNoValue==data.sPwaDocNo && "R"==pwaValue && 3==isDbClice){
                               qcValR=2;
                               pwaDocNoValue=data.sPwaDocNo;
                        }else{
                           qcValR=1;
                           pwaDocNoValue=data.sPwaDocNo;
                        }
                    }else {
                       pwaDocNoValue=data.sPwaDocNo;
                    }
                    i++;
                   // pwa申请中，选中不承认的单子，申请按钮不可用 贾明 2018-11-20 end
                    
                    setButtonEnable($("#pwaStatCd").val());
                  //2021.2.19 update by tjx 查询结果将车辆品牌信息制空;
                    $("#ncarDstinCd").val("") ;
                }
             }) ;
         }
     };


    /** 필드 초기화**/
     initAll = function(){
         // PWA申请 csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26 初始化时不再选择 PWA 列表数据
         // $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
          $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
         // PWA申请 csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26 
         $("#pwaRequestForm").get(0).reset();

         $("#pwaStatCd").val("");
         $("#pwaDocNo").val("");
         $("#fileKeyNm").val("");

         $("#itemOccrAmt").html("0");
         $("#lbrOccrAmt").html("0");
         $("#subLbrOccrAmt").data("kendoExtNumericTextBox").value(0);
         $("#totOccrAmt").html("0");

         $("#itemApproveAmt").html("0");
         $("#lbrApproveAmt").html("0");
         $("#subLbrApproveAmt").html("0");
         $("#totApproveAmt").html("0");


         $("#gridLabor").data("kendoExtGrid").dataSource._destroyed = [];
         $("#gridPart").data("kendoExtGrid").dataSource._destroyed = [];
         $("#fileGrid").data("kendoExtGrid").dataSource._destroyed = [];

         $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
         $("#gridPart").data("kendoExtGrid").dataSource.data([]);
         $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

         setButtonEnable("");
     };


     //버튼설정
     setButtonEnable = function (pwaStatCd){
     
         switch(pwaStatCd){
             case "O" :
                 $("#btnSave").data("kendoButton").enable(true);
                 $("#btnDelete").data("kendoButton").enable(true);
                 $("#btnReq").data("kendoButton").enable(qcVal==1?true:false);// 取消申请后，申请按钮设置为不可用 贾明 2018-11-13
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#lbrAdd").data("kendoButton").enable(true);
                 $("#lbrDel").data("kendoButton").enable(true);
                 $("#lbrCancel").data("kendoButton").enable(true);
                 $("#parAdd").data("kendoButton").enable(true);
                 $("#parDel").data("kendoButton").enable(true);
                 $("#parCancel").data("kendoButton").enable(true);

                 setFileButton("Y");
                       break;
             case "S" :
                 $("#btnSave").data("kendoButton").enable(false);
                 $("#btnDelete").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#lbrAdd").data("kendoButton").enable(false);
                 $("#lbrDel").data("kendoButton").enable(false);
                 $("#lbrCancel").data("kendoButton").enable(false);
                 $("#parAdd").data("kendoButton").enable(false);
                 $("#parDel").data("kendoButton").enable(false);
                 $("#parCancel").data("kendoButton").enable(false);

                 setFileButton("N");
                       break;
             case "A" :
                 $("#btnSave").data("kendoButton").enable(false);
                 $("#btnDelete").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#lbrAdd").data("kendoButton").enable(false);
                 $("#lbrDel").data("kendoButton").enable(false);
                 $("#lbrCancel").data("kendoButton").enable(false);
                 $("#parAdd").data("kendoButton").enable(false);
                 $("#parDel").data("kendoButton").enable(false);
                 $("#parCancel").data("kendoButton").enable(false);

                 setFileButton("N");
                       break;
              case "C" :

                 $("#btnSave").data("kendoButton").enable(false);
                 $("#btnDelete").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#lbrAdd").data("kendoButton").enable(false);
                 $("#lbrDel").data("kendoButton").enable(false);
                 $("#lbrCancel").data("kendoButton").enable(false);
                 $("#parAdd").data("kendoButton").enable(false);
                 $("#parDel").data("kendoButton").enable(false);
                 $("#parCancel").data("kendoButton").enable(false);

                 setFileButton("N");
                       break;
             case "Q" :
                 $("#btnSave").data("kendoButton").enable(false);
                 $("#btnDelete").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(true);
                 $("#lbrAdd").data("kendoButton").enable(false);
                 $("#lbrDel").data("kendoButton").enable(false);
                 $("#lbrCancel").data("kendoButton").enable(false);
                 $("#parAdd").data("kendoButton").enable(false);
                 $("#parDel").data("kendoButton").enable(false);
                 $("#parCancel").data("kendoButton").enable(false);

                 setFileButton("N");
                       break;
             case "R" :
                 $("#btnSave").data("kendoButton").enable(true);
                 $("#btnDelete").data("kendoButton").enable(false);
                 //$("#btnReq").data("kendoButton").enable(true);
                 $("#btnReq").data("kendoButton").enable(qcValR==1?false:true);//1时隐藏，2为展示 当选中的状态为不承认时，申请按钮设置为隐藏 贾明 2018-11-15
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#lbrAdd").data("kendoButton").enable(true);
                 $("#lbrDel").data("kendoButton").enable(true);
                 $("#lbrCancel").data("kendoButton").enable(true);
                 $("#parAdd").data("kendoButton").enable(true);
                 $("#parDel").data("kendoButton").enable(true);
                 $("#parCancel").data("kendoButton").enable(true);

                 setFileButton("Y");
                       break;
             default :
                 $("#btnSave").data("kendoButton").enable(true);
                 $("#btnDelete").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#lbrAdd").data("kendoButton").enable(true);
                 $("#lbrDel").data("kendoButton").enable(true);
                 $("#lbrCancel").data("kendoButton").enable(true);
                 $("#parAdd").data("kendoButton").enable(true);
                 $("#parDel").data("kendoButton").enable(true);
                 $("#parCancel").data("kendoButton").enable(true);

                 setFileButton("Y");
                 break;
         }
     };
     setFileButton("N");


     /** 공임 계산**/
     calLaborAmt = function(e){
         // 공임 금액:수량 * 시간당 금액 * 단가
         var grid = $("#gridLabor").data("kendoExtGrid");
         var gridData = grid.dataSource._data;

         var selectedVal = grid.dataItem(grid.select());
         var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
         var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();

         var lbrQty = Number(selectedVal.lbrQty);
         var lbrHm  = Number(selectedVal.lbrHm);
         var lbrPrc = Number(selectedVal.lbrPrc);

         var lbrAmt = Number((lbrQty*lbrHm* lbrPrc  ).toFixed(2));

         selectedVal.set("lbrAmt",lbrAmt);
         calTotAmt();

     };

     /** 부품 계산**/
     calPartAmt = function(e){

         var grid = $("#gridPart").data("kendoExtGrid");
         var gridData = grid.dataSource._data;

         var selectedVal = grid.dataItem(grid.select());

         // ROUND ( ROUND ( 부품단가 * MARK UP * 수량  , 2) * TAX , 2)

         if(selectedVal != null){

             var npnpMaxAmt = Number(selectedVal.npnpMaxAmt);
             var npnpYn = selectedVal.npnpYn;

             var reqQty  = Number(selectedVal.reqQty); //수량
             var itemPrc = Number(selectedVal.itemPrc); //단가
             var salePrcAmt = Number(selectedVal.salePrcAmt);
             var itemAmt = Number( calMarkupPartAmt(selectedVal.itemPrc, selectedVal.reqQty, selectedVal.itemMarkup, npnpYn)  );

             if( npnpYn == "Y" ){
                 if( itemAmt > npnpMaxAmt){
                     selectedVal.set("reqQty",  Number(npnpMaxAmt/itemPrc).toFixed(0));
                     selectedVal.set("itemAmt",  (Number(npnpMaxAmt/itemPrc).toFixed(0) * itemPrc).toFixed(2) );
                     dms.notification.warning("<spring:message code='ser.info.overMayQty'  />" );
                 }else{
                     selectedVal.set("itemAmt",  itemAmt);
                 }
             }else{
                 selectedVal.set("itemAmt",itemAmt);
             }
         }
         calTotAmt();

     };

  // 요청금액 합계 계산
     calTotAmt = function(){
         var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value(); //获取PWA 系数  需求 csr清单　62　JM 2020-2-28
         var gridLbr = $("#gridLabor").data("kendoExtGrid");//维修项目
         var gridLbrData = gridLbr.dataSource._data;

         var gridPart = $("#gridPart").data("kendoExtGrid");//配件项目
         var gridPartData = gridPart.dataSource._data;

      // 전체 공임 금액 계산
         var labrTotAmt=0;
         //PWA类型1 如果为G、J 按照原有方式进行计算	贾明2018-12-21 statr
         var pwaTpCDVal = $("#pwaTpCd1").data("kendoExtDropDownList").value();
         var pwaBo = pwaTpCDVal=='G' ? '0' : (pwaTpCDVal=='J' ? '0' : '1');
         //PWA类型1 如果为G、J 按照原有方式进行计算	贾明2018-12-21 end

         $.each(gridLbrData , function(i , labrData){
             
             //增加更改喷漆即维修代码为99的计算方式  lbrPrc 工时单价 lbrAmt 金额 贾明 start 2018-12-13
                if('1'==pwaBo){
                //labrData.__proto__.fields.lbrCd.editable=true;
                   var lbrCd =  labrData.lbrCd.substring(labrData.lbrCd.length-2 , labrData.lbrCd.length); // 공임코드 뒷2 자리
                  //console.log("erewdsss",labrData.lbrTp);
                  var zzCodeYn = (lbrCd == "ZZ") ? true : false;
                  //console.log("zzCodeYn",zzCodeYn);
                  var lbrTp = dms.string.defaultString(labrData.lbrTp, "01");
                  var lbrPrc = Number(serviceJs.setRpirRate(rateList, '02', lbrTp));
                  var lbrAmt = Number(labrData.lbrQty * labrData.lbrHm * lbrPrc).toFixed(2);
                  labrData.set("lbrPrc", (zzCodeYn) ? 0 : lbrPrc);
                  labrData.set("lbrAmt", (zzCodeYn) ? 0 :  lbrAmt);
               //获取PWA 系数  需求 csr清单　维修改项目 62　共同编码是 2代表是  维修项目系数 JM 2020-2-28 start
               // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
                  if("A" == pwaType1 || "C" == pwaType1){
                        labrData.set("lbrAmt", Number(lbrAmt * pwaCoeList[1].remark1).toFixed(2)); 
                   }  
                  //获取PWA 系数  需求 csr清单　维修改项目 62　JM 2020-2-28 end
                  
                }
               //增加更改喷漆即维修代码为99的计算方式  lbrPrc 工时单价 lbrAmt 金额 贾明 start end
              
                 labrTotAmt += labrData.lbrAmt;
        });

         $("#lbrOccrAmt").html( dms.string.addThousandSeparatorCommas( labrTotAmt.toFixed(2) ) );

         // 전체 부품 금액 계산
         var partTotAmt=0;
          $.each(gridPartData , function(i , partData){
              
              //获取PWA 系数  需求 csr清单　配件项目 62　JM 2020-2-28 start
              var reqQty = Number(partData.reqQty);//配件数量
              var itemPrc  = Number(partData.itemPrc);//配件单价
              var npnpYn = partData.npnpYn;
              var itemMarkup = partData.itemMarkup;
              var itemAmt =  Number(calMarkupPartAmt(itemPrc, reqQty, itemMarkup, npnpYn))
              gridPart.dataSource._data[i].set("itemAmt",itemAmt);
              // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
                  if("A" == pwaType1 || "C" == pwaType1){
                 // console.log("itemAmt的值",partData);
                      partData.set("itemAmt", Number(partData.itemAmt * pwaCoeList[0].remark1).toFixed(2)); 
                }  
               //获取PWA 系数  需求 csr清单　配件项目 62　JM 2020-2-28 end
               partTotAmt += partData.itemAmt;
         });

          $("#itemOccrAmt").html( dms.string.addThousandSeparatorCommas( partTotAmt.toFixed(2) ) );

          var lbrAmt   =  $("#lbrOccrAmt").text();
          lbrAmt = Number(lbrAmt.replace(",", "")).toFixed(2);


          var subLbrAmt =  $("#subLbrOccrAmt").data("kendoExtNumericTextBox").value();

          var partAmt   =  $("#itemOccrAmt").text();
          partAmt = Number(partAmt.replace(",", "")).toFixed(2);

          var totOccrAmt = Number(lbrAmt) + Number(subLbrAmt) + Number(partAmt);
          $("#totOccrAmt").html( dms.string.addThousandSeparatorCommas( totOccrAmt.toFixed(2) ) );


     };

     /**판매일자,보증수리일자**/
     //新增保修结束日期
     $("#creDt,#wartDt,#wartExpireDt").kendoDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
     });

    /**주행거리**/
     $("#runDistVal").kendoExtNumericTextBox({
        min:0
       ,format:"n0" //"{0:##,###}"
       ,spinners:false             // 증,감 화살표

     });

    /**외주 요청 금액**/
     $("#subLbrOccrAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false
       ,change:calTotAmt
     });



     /** 저장 필수값 체크 **/
     saveCheckValue = function (pwaStatCd){
      // PWA TYPE 별 체크로직 추가
        /**
         * 1. 공임 코드 가 ZZ 코드 일경우 금액은 0 수량은 1 처리 한다.
         * 2. ZZ 또는 TT 코드는 1개만 입력 가능
         * 3. TT 코드는 PWA 유형코드 2번을 필수로 입력 해야된다.
         * 4. PWA 유형이 G (Good Will )일경우 금액은 직접입력한다.
         * 5. 외주 금액 입력후 외주 코드(TOWINGZZ) 입력 여부 체크
         */

         //
         // TT 코드 유효성 체크
         // 주행거리 체크
         // 원인 현상코드 체크
         // 원인 부품 체크
         // 고장현상  , 수리방안 체크


         var msgText;
         var result = true;

         var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
         var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
       //var pwaTypeYn = (pwaType1 == "" && pwaType2 == "") ? true:false;
         var pwaTypeYn = (pwaType1 == "") ? true:false;


         if( $("#vinNo").val() == "" ) {
             msgText = "<spring:message code='ser.lbl.vinNo' var='vinNo' />"+
                       "<spring:message code='global.info.required.field' arguments='${vinNo}' />";

                       $("#vinNo").focus();
                       result =  false;

         }else if( $("#ltsModelCd").val() == "" ){
             msgText = "<spring:message code='ser.lbl.carLine' var='carLine' />"+
                       "<spring:message code='global.info.required.field' arguments='${carLine}' />";
                       result =  false;
         }else if( Number($("#runDistVal").val()) == 0 ){
             msgText = "<spring:message code='ser.lbl.runDist' var='runDist' />"+
                       "<spring:message code='global.info.required.field' arguments='${runDist}' />";
                       $("#runDistVal").focus();
                       result =  false;
         }else if( $("#cauItemCd").val() == "" ){
             msgText = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                       "<spring:message code='global.info.required.field' arguments='${cauItemCd}' />";

                       result =  false;
         }else if( $("#cauOperAtcCd").val() == "" ){
             msgText = "<spring:message code='ser.lbl.mainLbrCd' var='mainLbrCd' />"+
                       "<spring:message code='global.info.required.field' arguments='${mainLbrCd}' />";
                       result =  false;
         }else if( $("#cauCd").val() == "" ){
             msgText = "<spring:message code='ser.lbl.cauCd' var='cauCd' />"+
                       "<spring:message code='global.info.required.field' arguments='${cauCd}' />";
                       result =  false;
         }else if( $("#phenCd").val() == "" ){
             msgText = "<spring:message code='ser.lbl.phenCd' var='phenCd' />"+
                       "<spring:message code='global.info.required.field' arguments='${phenCd}' />";
                       result =  false;
         }else if( $("#errPhenCont").val().length <= 2 ){
             msgText = "<spring:message code='ser.lbl.errPhenCont' var='errPhenCont' />"+
                       "<spring:message code='global.info.required.field' arguments='${errPhenCont}' />";
                       $("#errPhenCont").focus();
                       result =  false;
         }else if( $("#rpirMtdCont").val().length <= 2 ){ //수리방안
             msgText = "<spring:message code='ser.lbl.rpirMtdCont' var='rpirMtdCont' />"+"[2位以上]"+
                       "<spring:message code='global.info.required.field' arguments='${rpirMtdCont}' />";
                       $("#rpirMtdCont").focus();
                       result =  false;
         }else if( pwaTypeYn ){
             msgText = "<spring:message code='ser.lbl.pwaTpCd1' var='pwaTpCd' />"+
                       "<spring:message code='global.info.check.field' arguments='${pwaTpCd}' />";
             $("#pwaTpCd1").focus();
             result =  false;
         }else if( pwaStatCd == "Q" ){

             var fileLength = $("#fileGrid").data("kendoExtGrid").dataSource.data().length;
             if(fileLength == 0 ){
                 msgText =  "<spring:message code='ser.info.pwaFileChk'  />";
                 result =  false;
             }
        }

         if(!result) dms.notification.warning(msgText);
         return result;
     };

     //공임 그리드 체크로직
     checkGridValue = function(type1 , type2){

         var gridLabor = $("#gridLabor").data("kendoExtGrid");
         var gridLbrData = gridLabor.dataSource._data;


          var zCodeYn = false;
          var tCodeYn = false;
          var gCodeYn = false;
         $.each(gridLbrData , function(i , gridData){

             var lbrCd   = gridData.lbrCd;
             var dstinCd = gridData.dstinCd;
             var zzCd    = gridData.lbrCd.substr(-2);

             // ZZ코드는 dstinCd가 Z인경우가 아니고 dstinCd가 H이고 lbrCd 마지막 글자가 ZZ인경우로 변경
             //if(dstinCd == "Z") zCodeYn = true;
             if(dstinCd == "H" && zzCd == "ZZ") zCodeYn = true;

             if(dstinCd == "Z") tCodeYn = true;

             if(dstinCd == "G") gCodeYn = true;

             if(lbrCd.length < 6){ //global.info.validation.pattern
                 dms.notification.warning( "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                                           "<spring:message code='global.info.validation.pattern' arguments='${lbrCd}' />");
                 return false;
             }
         });

         if( (type1 == "2" || type2 == "2") ){ // pwaType 2 ==> 딜러TT 공임
             if(!tCodeYn){
                 //{0}을(를) 입력해주세요.
                 dms.notification.warning( "<spring:message code='ser.lbl.lbrTtCode' var='lbrTtCode' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${lbrTtCode}' />");
                   return false;
             }
         }else if( (type1 == "G" || type2 == "G" || type1 == "J" || type2 == "J") ){ //  ser.lbl.pwaSubTp
             if(!gCodeYn ){
                 dms.notification.warning( "<spring:message code='ser.lbl.goodwillLbrCd' var='goodwillLbrCd' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${goodwillLbrCd}' />");
                 return false;
             }
         }

         if(tCodeYn){   // TT 코드는 PWA 유형코드 2번을 필수로 입력 해야된다.
             if( (type1 != "2" && type2 != "2") ){
                 dms.notification.warning( "<spring:message code='ser.lbl.pwaSubTp' var='pwaSubTp' />"+
                                           "<spring:message code='global.info.check.field' arguments='${pwaSubTp}' />");
                  return false;
             }
         }
         if(gCodeYn){
             if( (type1 != "G" && type2 != "G" && type1 != "J" && type2 != "J")){
                 dms.notification.warning( "<spring:message code='ser.lbl.pwaGoodWillTp' var='pwaGoodWillTp' />"+
                                           "<spring:message code='global.info.check.field' arguments='${pwaGoodWillTp}' />");
                 return false;
             }
         }

         var subAmt = Number($("#subLbrOccrAmt").val());
         if( ( (zCodeYn) && subAmt == 0 ) ){    // 공임 코드 가 ZZ 코드 일경우 금액은 0 수량은 1 처리 한다.
             dms.notification.warning( "<spring:message code='global.lbl.subLbrAmt' var='subLbrAmt' />"+
                                       "<spring:message code='global.info.emptyCheckParam' arguments='${subLbrAmt}' />");
             return false;
         }
         if( ( (!zCodeYn) && subAmt > 0 )  ){
             dms.notification.warning( "<spring:message code='ser.info.chkSubAmt'  />");
             return false;
         }

         return true;

    };
    
   
     //双击 贾明
      $("#gridMaster").on('dblclick', '.k-grid-content tr', function (e) {
           isDbClice=2;
      });

       //单击 贾明
        $("#gridMaster").on('click', '.k-grid-content tr', function () {
            isDbClice=1;
        });

    // Master Grid
    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000168"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sFromDt"]    = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"]      = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"]     = $("#sVinNo").val();
                         params["sPwaStatCd"] = $("#sPwaStatCd").val();
                         params["sPwaDocNo"]  = $("#sPwaDocNo").val();


                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,pwaStatCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,hqApproveDt:{type:"date" }
                       ,dlrSignReqDt:{type:"date" }
                       ,updtDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:170
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,dataBound:function(e) {
            
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(rowPwaDocNo  == selectedVal.pwaDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }
        }
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());
            //console.log("pwaDocNo选中的",selectedVal);
            //获取PWA 系数  需求 csr清单　62　jm 2020-3-3 start
            var pwaType1 = selectedVal.pwaTpCd1;
            // CSR 76	DMSpwa申请功能  A  延保索赔申请 10 作废 C  延保索赔结算 11 作废 贾明 2020-4-19 
           if("A" == pwaType1 || "C" == pwaType1){
            $("#pwaTpCd2").focus();
            $("#pwaTpCd2").data("kendoExtDropDownList").value("");
            $("#pwaTpCd2").data("kendoExtDropDownList").enable(false);
           
            $("#subLbrOccrAmt").data("kendoExtNumericTextBox").value(0.00);
            $("#subLbrOccrAmt").data("kendoExtNumericTextBox").enable(false);
         }else {
            $("#pwaTpCd2").data("kendoExtDropDownList").enable(true);
            $("#subLbrOccrAmt").data("kendoExtNumericTextBox").enable(true);
         }
         
          if("C" == pwaType1 && 'O' == selectedVal.pwaStatCd){
             //if(dms.string.isEmpty($("#vinNo").val())){
               //  $("#pwaTpCd1").focus();
               // $("#pwaTpCd1").data("kendoExtDropDownList").value("");
               // dms.notification.warning("<spring:message code='ser.lbl.vinNo' var='serVinNO' /><spring:message code='global.info.validation.select' arguments='${serVinNO}' />");
               // dms.notification.warning("<spring:message code='ser.lbl.vinNo' />");
               // return;
               //}else{
                //$("#pwaRequiNo").attr("disabled", false);
                
                $("#calcDocNo").attr("disabled", false);
                $("#pwaRequiNoTh").html('<span class="bu_required"><spring:message code="ser.lbl.pwaRelateRequi" /></span>');
                $("#calcDocNoTh").html('<span class="bu_required"><spring:message code="ser.lbl.pwaRelateBill" /></span>');
                //pwaRequiSearchPopupWindow();//获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，并用是已经承认 状态的 csr清单　62 JM 
            //};
          }else {
              $("#pwaRequiNoTh").html('<spring:message code="ser.lbl.pwaRelateRequi" />');
              $("#calcDocNoTh").html('<spring:message code="ser.lbl.pwaRelateBill" />');
              $("#pwaRequiNo").attr("disabled", "disabled");
              $("#calcDocNo").attr("disabled", "disabled");
              $("#pwaRequiNo").val('');
              $("#calcDocNo").val('');
          }
         
         //获取PWA 系数  需求 csr清单　62　jm 2020-3-3 end
            
            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var pwaDocNo = selectedVal.pwaDocNo;

            var data = {
                    "sVinNo" : vinNo
                   ,"sPwaDocNo":pwaDocNo
            };
            infoType = "PWA";
            detailSet(data , "PWA");

        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"al"} , hidden:true }//딜러코드
               ,{field:"pwaDocNo",title:"<spring:message code='ser.lbl.pwaDocNo' />", width:110, attributes :{"class":"al"} }//pwa no
               ,{field:"pwaStatCd",title:"<spring:message code='ser.lbl.statNm' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setPwaStatMap(pwaStatCd)#"
                   ,editor:function(container, options){
                       $('<input required name="pwaStatCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:pwaStatCdList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="pwaStatCd"></span>').appendTo(container);
                      }
                 }//pwa 상태코드
              ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />" , width:150 , attributes :{"class":"al"}}//빈번호
              ,{field:"cauOperAtcCd", title:"<spring:message code='ser.lbl.mainLbrCd' />" , width:100 , attributes :{"class":"al"}}//주작업코드
              ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />" , width:100 , attributes :{"class":"al"}}//원인부품
              ,{field:"itemApproveAmt", title:"<spring:message code='ser.lbl.itemAmt' />" , width:90 , attributes :{"class":"ar"}, format:"{0:n2}"}//부품금액
              ,{field:"lbrApproveAmt", title:"<spring:message code='ser.lbl.lbrAmt' />" , width:80 , attributes :{"class":"ar"}, format:"{0:n2}"}//공임금액
              ,{field:"subLbrApproveAmt", title:"<spring:message code='ser.lbl.subLbrAmt' />" , width:80 , attributes :{"class":"ar"}, format:"{0:n2}"}//외주금액
              ,{field:"pwaApproveNo", title:"<spring:message code='ser.lbl.pwaApprovalNo' />" , width:110 , attributes :{"class":"al"}}//승인번호
              ,{field:"hqApproveNm", title:"<spring:message code='ser.lbl.hqApproveNm' />" , width:120 , attributes :{"class":"al"}}//승인자
              ,{field:"hqApproveDt" , title:"<spring:message code='ser.lbl.approveDt'/>", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//승인일자
              ,{field:"dlrSignReqDt" , title:"<spring:message code='ser.lbl.fincReqDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//신청일자
              ,{field:"updtDt" , title:"<spring:message code='ser.lbl.regDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//수정일자
               ,{field:"returnCnt", title:"<spring:message code='ser.lbl.returnCnt' />",  width:80 , attributes :{"class":"ar"}}//리턴횟수
             ]
    });



    /**공임 그리드 **/
    $("#gridLabor").kendoExtGrid({
        gridId:"G-SER-1011-000169"
        ,dataSource:{
            transport:{
                   read :{
                       //url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />"
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         if(infoType == "RO"){
                             params["sPreFixId"] = infoType;
                             params["sDocNo"]      = "${roDocNo}";
                             params["sVinNo"]      = "${sVinNo}";
                             params["sLtsModelCd"] = $("#ltsModelCd").val();
                         }else{
                             params["sPwaDocNo"]   = $("#pwaDocNo").val();
                             params["sLtsModelCd"] = $("#ltsModelCd").val();
                         }




                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number", editable:false}
                       ,lbrCd:{type:"string", editable:false, validation:{required:true}}
                       ,lbrNm:{type:"string" , editable:false}
                       ,lbrHm:{type:"number" , editable:false}
                       ,lbrQty:{type:"number", validation:{required:true}}
                       ,lbrPrc:{type:"number" , editable:true}
                       ,lbrAmt:{type:"number" }
                       ,cauLbrYn:{type:"string", editable:true}
                       ,lbrTp:{type:"string"}
                       ,lbrCdTp:{type:"string"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,resizable:true
        ,height:100
        ,appendEmptyColumn:true
        ,selectable:"row"
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
       // ,editableOnlyNew:true
       // ,editableOnlyNewExcludeColumns:["lbrQty","cauLbrYn"]
        ,dataBinding:function(e){
            if(infoType == "RO" && typeof e.items!="undefined" && e.items.length>0){
                var selectedVal = null;
                $.each(e.items,function(idx,obj){
                    if(obj.cauLbrYn=="Y"){
                        selectedVal = obj;
                    }
                });
                selectedVal = selectedVal || e.items[0];
                //setMainLbrYn();
                if(selectedVal.cauLbrYn == "Y" ){
                    $("#cauOperAtcCd").val(selectedVal.lbrCd);
                    $("#cauOperAtcNm").val(selectedVal.lbrNm);
                    $("#cauItemCd").val(selectedVal.cauItemCd);
                    $("#cauItemNm").val(selectedVal.cauItemNm);
                    $("#cauCd").val(selectedVal.cauCd);
                    $("#cauNm").val(selectedVal.cauNm);
                    $("#phenCd").val(selectedVal.phenCd);
                    $("#phenNm").val(selectedVal.phenNm);
                }
            }
        }
        ,edit:function(e){
             var fieldName = $(e.container.find("input")[1]).attr("name");
             var fieldName2 = $(e.container.find("input")[0]).attr("name");
             var pwaType1 = $("#pwaTpCd1").data("kendoExtDropDownList").value();
             var pwaType2 = $("#pwaTpCd2").data("kendoExtDropDownList").value();
             if((pwaType1 != "G" && pwaType2 != "G" && pwaType1 != "J" && pwaType2 != "J")){
                 if(fieldName =="lbrPrc" ){
                     this.closeCell();
                 }
             }
             if(fieldName=="lbrAmt"  ){
                 this.closeCell();
             }

             var grid = $("#gridLabor").data("kendoExtGrid");
             var selectedVal = grid.dataItem(grid.select());
             if(selectedVal==null){return;}
             if(fieldName2=="cauLbrYn" && selectedVal.lbrCd.substr(-2)=="ZZ" ){
                 this.closeCell();
             }
         }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:150, attributes:{"class":"al"}} //공임코드
               ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width:329, attributes:{"class":"al"}}//공임명
               ,{field:"lbrHm",title:"<spring:message code='ser.lbl.lbrHm' />", width:120, attributes:{"class":"ar"} }//공임시간
               ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:95
                   , attributes :{"class":"ar"}
                   , editor:function(container, options){
                       $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0                // 소숫점
                          ,min:1
                          ,value:0
                          ,spinners:false
                          ,change:calLaborAmt
                       });
                       $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
                    }
               }//공임수량
               ,{field:"lbrPrc",title:"<spring:message code='ser.lbl.lbrPrc' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n2}"
                   , editor:function(container, options){
                       $('<input required name="lbrPrc" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n2"                // n0:###,###, n2:###,###.##
                          ,decimals:2                // 소숫점
                          ,min:1
                          ,value:0.00
                          ,spinners:false
                          ,change:calLaborAmt
                       });
                       $('<span class="k-invalid-msg" data-for="lbrPrc"></span>').appendTo(container);
                    }
               }//공임단가
               ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.amt' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n2}"
                   , editor:function(container, options){
                       $('<input required name="lbrAmt" id="lbrAmt" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n2"                // n0:###,###, n2:###,###.##
                          ,decimals:2                // 소숫점
                          ,min:1
                          ,value:0.00
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="lbrAmt"></span>').appendTo(container);
                    }
               }//공임금액
               ,{field:"cauLbrYn",title:"<spring:message code='ser.lbl.mainLbrCd' />", width:120
                   , attributes :{"class":"ac"}
                   , template:"#= setPwaCauYnMap(cauLbrYn) #"
                   , editor:function(container, options){
                       $('<input required name="cauLbrYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:pwaCauYnList
                           ,change:setMainLbrYn
                       });
                       $('<span class="k-invalid-msg" data-for="cauLbrYn"></span>').appendTo(container);
                      }
                 }//원인코드
               ,{field:"relCauLbrYn"  , hidden : true }//연관 공임 코드 여부( N 이면 주작업 불가 )
               ,{field:"dstinCd"  , hidden : true }//공임 구분 코드
               ,{field:"lbrTp"  , hidden : true }//정비유형
               ,{field:"lbrCdTp"  , hidden : true }//공임코드유형
             ]

    });

    setMainLbrYn = function(){ //ser.lbl.notSelectMainLbrCd
        var grid = $("#gridLabor").data("kendoExtGrid");//.dataSource._data;
        var selectedVal = grid.dataItem(grid.select());

        if(selectedVal.relCauLbrYn == "N"){
            dms.notification.warning("<spring:message code='ser.lbl.notSelectMainLbrCd' />");

            selectedVal.set("cauLbrYn" ,"N");
            return;
        }

        if(selectedVal.cauLbrYn == "Y" ){
            $("#cauOperAtcCd").val(selectedVal.lbrCd);
            $("#cauOperAtcNm").val(selectedVal.lbrNm);
        }else{
            $("#cauOperAtcCd").val("");
            $("#cauOperAtcNm").val("");
        }

        $.each(grid.dataSource._data , function(i , gridData){
            var result = true;
            if($("#cauOperAtcCd").val() == gridData.lbrCd){
                result = false;
                gridData.set("cauLbrYn" , "Y");
            }
            if(result) gridData.set("cauLbrYn" , "N");

        });
        grid.refresh();
    }



    /**부품 그리드 **/
    $("#gridPart").kendoExtGrid({
        gridId:"G-SER-1011-000170"
        ,dataSource:{
            transport:{
                   read :{
                       //url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />"
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         if(infoType == "RO"){
                             params["sPreFixId"] = infoType;
                             params["sDocNo"]   = "${roDocNo}";
                             params["sVinNo"]     = "${sVinNo}";
                         }else{
                             params["sPwaDocNo"]   = $("#pwaDocNo").val();
                         }

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number", editable:false }
                       ,itemCd:{type:"string", editable:false, validation:{required:true} }//부품코드
                       ,itemNm:{type:"string", editable:false }//부품명
                       ,reqQty:{type:"number", validation:{required:true} } //수량
                       ,saleUnitCd:{type:"string", editable:false }//단위
                       ,itemPrc:{type:"number", editable:false } // 단가
                       ,salePrcAmt:{type:"number", editable:false }
                       ,itemTax:{type:"number", editable:false } // 세금
                       ,itemAmt:{type:"number", editable:true }//금액
                       ,cauItemYn:{type:"string", editable:true }
                       ,itemMarkup:{type:"number", editable:false }//markUp
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,height:100
        ,resizable:false
        ,selectable:"row"
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
         }
        ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150, attributes :{"class":"al"}}//부품코드
               ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:329, attributes :{"class":"al"}}//부품명
               ,{field:"reqQty", title:"<spring:message code='ser.lbl.itemQty' />", width:95
                   , attributes :{"class":"ar"}
                   , editor:function(container, options){
                       $('<input required name="reqQty" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n0"                // n0:###,###, n2:###,###.##
                          ,decimals:0                // 소숫점
                          ,min:1
                          ,value:0
                          ,spinners:false
                          ,change:calPartAmt
                       });
                       $('<span class="k-invalid-msg" data-for="reqQty"></span>').appendTo(container);
                    }
               }//부품수량
               ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:120, attributes :{"class":"ac"}}//부품단위코드
               ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:120, attributes :{"class":"ar"}, format:"{0:n2}"}//부품가격
               ,{field:"salePrcAmt", format:"{0:n2}", hidden:true}//부품기본가격
               ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:120, attributes :{"class":"ar"}, format:"{0:n2}"}//부품금액
               ,{field:"cauItemYn", title:"<spring:message code='ser.lbl.cauItemCd' />", width:120
                   , attributes :{"class":"ac"}
                   , template:"#= setPwaCauYnMap(cauItemYn) #"
                   , editor:function(container, options){
                       $('<input required name="cauItemYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:pwaCauYnList
                           ,change:function(e){

                               var grid = $("#gridPart").data("kendoExtGrid");//.dataSource._data;
                               var selectedVal = grid.dataItem(grid.select());
                               if(selectedVal.cauItemYn == "Y" ){
                                   $("#cauItemCd").val(selectedVal.itemCd);
                                   $("#cauItemNm").val(selectedVal.itemNm);
                               }else{
                                   $("#cauItemCd").val("");
                                   $("#cauItemNm").val("");
                               }

                               $.each(grid.dataSource._data , function(i , gridData){
                                   var result = true;
                                   if($("#cauItemCd").val() == gridData.itemCd){
                                       result = false;
                                       gridData.set("cauItemYn" , "Y");
                                   }
                                   if(result) gridData.set("cauItemYn" , "N");

                              });
                               grid.refresh();
                           }
                       });
                       $('<span class="k-invalid-msg" data-for="cauItemYn"></span>').appendTo(container);
                      }
                 }//주원인 코드
                ,{field:"npnpMaxAmt" , width:20, hidden:true}
                ,{field:"npnpYn" , width:20, hidden:true}
                ,{field:"itemMarkup", format:"{0:n0}", hidden:true}//markup
             ]

    });


  //선택된 그리드 Rows
    setGridRows = function(grid){

        rowPwaDocNo = "";
        gridRow = 0;
        var selectedVal = grid.dataItem(grid.select());
        if(selectedVal != null){
            gridRow = grid.select().index();
            rowPwaDocNo = selectedVal.pwaDocNo;
        }
    }


    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });


    /** RO 화면에서  넘어온경 우 자동 조회**/
    <c:choose>
        <c:when test="${sVinNo ne ''}">
            <c:if test="${infoType eq 'RO'}">
                var data = {"sVinNo":"${sVinNo}","sRoDocNo":"${roDocNo}","sLtsModelCd":"${ltsModelCd}"};
                infoType = "RO";
                detailSet(data, "RO");
            </c:if>
            <c:if test="${infoType eq 'PC'}">
                var data = {"sVinNo":"${sVinNo}","sDiagDocNo":"${diagDocNo}"};
                getCustInfo(data,"PC");
            </c:if>
        </c:when>
        <c:otherwise>
        var data = {"vinNo":"${sVinNo}"};
        </c:otherwise>
    </c:choose>

    // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#pwaColGroup col");
            $(colEmt[1]).css("width","24%");

            $("#gridMaster").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

// 보증부품금액계산 : ROUND(    ROUND(ITEM_PRC * NVL(((MARKUP) / 100), 1.12) * REQ_QTY, 2)     * 1.12, 2)   (田佳兴配件加价率改为0.12)
function calMarkupPartAmt(itemPrc, reqQty, markUp, npnpYn){
    if(markUp == null || markUp == ""){
        markUp = 112;       
    }
    var partAmt = 0.00;

    if(npnpYn == "Y"){
        partAmt = (itemPrc * reqQty).toFixed(2);
    } else {
        partAmt = ((itemPrc * (markUp / 100) * reqQty).toFixed(2) * 1.13).toFixed(2);
    }
    
    return partAmt;
}

</script>


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

<!-- 免费配件申请 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.freeItemRequest" /></h1><!-- 면비부품신청 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11994" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </dms:access>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.wrtrDt"/></th><!-- 지정일자 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromDt" class="form_monthpicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToDt" class="form_monthpicker ac"/>
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.statNm" /></th><!-- 상태 -->
                            <td>
                                <input type="text" id="sFreeItemStatCd" name="sFreeItemStatCd" value="" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.itemGubun" /></th><!-- 부품유형 -->
                            <td>
                                <input type="text" id="sItemTp" name="sItemTp" value="" class="form_comboBox"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.itemCd"/></th><!-- 부품번호 -->
                            <td>
                                <input type="text" id="sItemCd" name="sItemCd" value="" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!-- VIN -->
                            <td>
                                <input type="text" id="sVinNo" name="sVinNo" value="" class="form_input"/>
                            </td>
                            <td colspan="2"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <div class="table_grid">
                   <div id="grid" class="grid"></div>
                </div>
            </div>
        </section>

        <form id="freeServiceForm">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11993" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11992" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button><!-- 저장 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11991" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnDel" disabled><spring:message code="global.btn.del"/></button><!-- 삭제  -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11990" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnReq" disabled><spring:message code="global.btn.req" /></button><!-- 요청 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11989" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button><!-- 요청취소 -->
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
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.reqDt" /></th><!-- 요청일 -->
                                <td class="readonly_area">
                                    <input type="text" id="freeItemReqDt" name="freeItemReqDt" readonly value="" class="form_datepicker" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.bhmcConfirmDt" /></th><!-- BHMC판정일 -->
                                <td class="readonly_area">
                                    <input type="text" id="bhmcConfirmDt" name="bhmcConfirmDt" readonly value="" class="form_datepicker"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.bhmcConfirm' /></th><!-- BHMC판정인 -->
                                <td class="readonly_area">
                                    <input type="text" id="bhmcJudgNm" name="bhmcJudgNm" value="" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.statNm' /></th><!-- 상태 -->
                                <td class="readonly_area">
                                    <input type="text" id="freeItemStatCd" name="freeItemStatCd" readonly value="" class="form_comboBox"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.supplyConfirm' /></th><!-- 공급상판정인 -->
                                <td class="readonly_area">
                                    <input type="text" id="spyrJudgNm" name="spyrJudgNm" readonly value="" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.supplyConfirmDt' /></th><!-- 공급상판정일 -->
                                <td class="readonly_area">
                                    <input type="text" id="spyrJudgDt" name="spyrJudgDt" readonly value="" class="form_datepicker"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.bhmcProcCont' /></th><!--  BHMC처리의견-->
                                <td colspan="3" class="readonly_area">
                                    <input type="text" id="bhmcJudgProcCont" name="bhmcJudgProcCont" readonly value="" class="form_input"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.approveNo' /></th><!-- 승인번호  -->
                                <td class="readonly_area">
                                    <input type="text" id="freeItemApproveNo" name="freeItemApproveNo" readonly value="" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.supplyCd' /></th><!-- 공급상 -->
                                <td class="readonly_area">
                                    <input type="text" id="spyrNm" name="spyrNm" value="" readonly class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.supplyProcCont' /></th><!-- 공급상처리의견 -->
                                <td colspan="3" class="readonly_area">
                                    <input type="text" id="spyrProcCont" name="spyrProcCont" readonly value="" class="form_input" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form mt5">
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
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.vinNo' /></span></th><!-- 차대번호 -->
                                <td>
                                    <div class="form_search">
                                       <span class="readonly_area"><input required type="text" id="vinNo" name="vinNo" readOnly class="form_input" data-name="<spring:message code="ser.lbl.vinNo" />"  data-json-obj="true"/></span> <!-- 차대번호 -->
                                        <a href="javascript:custPopupWindow();"></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carLine' /></th><!-- 차종  -->
                                <td class="readonly_area">
                                    <input type="text" id="ltsModelNm" name="ltsModelNm" readonly value="" class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.wartDt' /></th><!-- 보증적용일자 -->
                                <td class="readonly_area">
                                    <input type="text" id="wartDt" name="wartDt" value="" readonly class="form_datepicker ac" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.saleDt' /></th><!-- 판매일자  -->
                                <td class="readonly_area">
                                    <input type="text" id="saleDt" name="saleDt" value="" readonly class="form_datepicker ac" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.creDt' /></th><!--  생산일자-->
                                <td class="readonly_area">
                                    <input type="text" id="creDt" name="creDt" value="" readonly class="form_datepicker ac" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.dirveMon' /></th><!-- 운행월 -->
                                <td class="readonly_area">
                                    <input type="text" id="driveMonth" name="driveMonth" value="" readonly class="form_input ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.runDist' /></span></th><!-- 주행거리 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <input type="text" required id="runDistVal" name="runDistVal" value="" class="form_numeric ar" data-name="<spring:message code="ser.lbl.runDist" />" data-json-obj="true"/>
                                        </div>
                                        <div class="form_right">
                                            <input type="text" id="lastRunDistVal" name="lastRunDistVal" value="0" readonly class="form_numeric form_readonly ar"/>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.reqUsrNm' /></th><!-- 신청인 -->
                                <td>
                                    <input type="text" id="reqUsrNm" name="reqUsrNm" value="" class="form_input" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.reqUsrHpNo' /></th><!-- 신청인전화번호 -->
                                <td>
                                    <input type="text" id="reqUsrTelNo" name="reqUsrTelNo" value="" class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.custNm' /></th><!--  고객명-->
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerNm" name="carOwnerNm" value="" readonly class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='serl.lbl.custTelNo' /></th><!-- 고객전화 -->
                                <td>
                                    <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" value="" class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="table_form mt5">
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
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.itemGubun' /></span></th><!--  부품유형-->
                                <td>
                                    <input type="text" required id="itemTp" name="itemTp" value="" class="form_comboBox" data-name="<spring:message code="ser.lbl.itemGubun" />" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.freeItemCmpn' /></th><!-- 부품업체 -->
                                <td>
                                    <input type="text" id="itemCmp" name="itemCmp" value="" class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.wrtrDt' /></th><!--  작성일자-->
                                <td>
                                    <input type="text" id="wrtrDt" name="wrtrDt" value="" class="form_datepicker ac" data-name="<spring:message code="ser.lbl.wrtrDt" />" data-json-obj="true"/>
                                </td>
                                <th scope="row"></th><!--  -->
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="cauCdSpan" class="bu_required"><spring:message code="ser.lbl.cauCd" /></span></th><!-- 원인 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" required id="cauCd" name="cauCd" readOnly class="form_input" data-name="<spring:message code="ser.lbl.cauCd" />" data-json-obj="true"/> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <div class="form_search">
                                                <input type="text" id="cauNm" name="cauNm" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드명 -->
                                                <a href="javascript:selectPhenCauCodeSearchPopupWindow();"></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.itemCd' /></span></th><!-- 부품번호 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <div class="form_search">
                                                <input type="text" required id="itemCd" name="itemCd" class="form_input" data-name="<spring:message code="ser.lbl.itemCd" />" data-json-obj="true" />
                                                 <a href="javascript:partSearchPopupWindow('IP')"></a>
                                            </div>
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="itemNm" name="itemNm" class="form_input" data-json-obj="true"/> <!-- 부품명 -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="phenCdSpan" class="bu_required"><spring:message code="ser.lbl.phenCd" /></span></th><!-- 현상(N) -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" required id="phenCd" name="phenCd" readOnly class="form_input" data-name="<spring:message code="ser.lbl.phenCd" />" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="phenNm" name="phenNm" readOnly class="form_input" data-json-obj="true"/>
                                        </div>
                                    </div>
                                </td>

                                <th scope="row"><spring:message code='ser.lbl.errPhenCont' /></th><!--  고장현상설명 -->
                                <td colspan="3">
                                    <input type="text" id="errCauCont" name="errCauCont" value="" class="form_input" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.memo' /></th><!-- 비고 -->
                                <td colspan="7">
                                    <input type="text" id="remark" name="remark" value="" class="form_input" data-json-obj="true"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="tabstrip1" class="tab_area mt10">
                    <ul>
                        <li class ="k-state-active"><spring:message code="ser.lbl.expsInfo" /></li>
                        <li><spring:message code="ser.lbl.file" /></li>
                    </ul>

                    <div>
                        <div class="table_form mt0">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:16%;">
                                    <col style="width:19%;">
                                    <col style="width:16%;">
                                    <col style="width:18%;">
                                    <col style="width:16%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='ser.lbl.supplyItemSendDt' /></th><!-- 공급상면비부품발송일  -->
                                        <td class="readonly_area">
                                            <input type="text" required id="spyrFreeItemSendDt" name="spyrFreeItemSendDt" value="" readonly class="form_datepicker ac" data-name="<spring:message code="ser.lbl.supplyItemSendDt" />" />
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.supplyItemInvoiceNo' /></th><!-- 공급상면비부품송장번호 -->
                                        <td class="readonly_area">
                                            <input type="text" required id="spyrFreeItemRtnInvcNo" name="spyrFreeItemRtnInvcNo" readonly value="" class="form_input" data-name="<spring:message code="ser.lbl.supplyItemInvoiceNo" />" />
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.freeItemExpNm' /></th><!-- 면비부품발송택배회사명 -->
                                        <td class="readonly_area">
                                            <input type="text" required id="freeItemExpsCmpNm" name="freeItemExpsCmpNm" value="" readonly class="form_input" data-name="<spring:message code="ser.lbl.freeItemExpNm" />" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='ser.lbl.dlrItemReceiptDt' /></th><!--  딜러면비부품접수일-->
                                        <td>
                                             <input type="text" id="dlrFreeItemAcptDt" name="dlrFreeItemAcptDt" class="form_datepicker ac" data-json-obj="true"/>
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.dlrItemReturnDt' /></th><!-- 딜러고품반납일 -->
                                        <td>
                                            <input type="text" id="dlrOldItemRtnDt" name="dlrOldItemRtnDt" class="form_datepicker ac" data-json-obj="true"/>
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.itemExpressCmpnNm' /></th><!-- 고품반납택배회사명 -->
                                        <td>
                                            <input type="text" id="oldItemExpsCmpNm" name="oldItemExpsCmpNm" class="form_input" data-json-obj="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='ser.lbl.dlrItemReturnInvoiceNo' /></th><!-- 딜러고품반납송장번호 -->
                                        <td>
                                            <input type="text" id="dlrOldItemRtnInvcNo" name="dlrOldItemRtnInvcNo" class="form_input" data-json-obj="true"/>
                                        </td>
                                        <td colspan="4"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div>
                        <div class="btn_right_absolute">
                            <dms:access viewId="VIEW-D-11988" hasPermission="${dms:getPermissionMask('READ')}">
                                <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 파일찾기 -->
                            </dms:access>
                            <dms:access viewId="VIEW-D-11987" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.fileDelete" /></button>
                            </dms:access>
                        </div>
                        <!-- 파일업로드관련 include page -->
                        <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                        <!-- 파일업로드관련 include page -->
                    </div>

                </div>
            </section>
            <input type="hidden" id="freeItemDocNo" name="freeItemDocNo" data-json-obj="true"/><!-- 면비부품문서번호 -->
            <input type="hidden" id="bhmcJudgId" name="bhmcJudgId"/> <!-- BHMC 판정ID -->
            <input type="hidden" id="spyrJudgId" name="spyrJudgId"/><!-- 공급상 판정ID -->
            <input type="hidden" id="carlineCd" name="carlineCd"/>
            <input type="hidden" id="ltsModelCd" name="ltsModelCd" data-json-obj="true"/><!-- LTS MODEL CD -->
            <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true"/><!-- 소유자ID -->
            <input type="hidden" id="preFixId" name="preFixId"  value="${preFixId}" data-json-obj="true"/><!-- 소유자ID -->
        </form>
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- //免费配件申请 -->
<!-- script -->
<script>


//고객조회팝업
var vehOfCustInfoSearchPopup;
//원인현상코드 조회 팝업
var phenCauCodeWin;
//부품조회팝업
var selectShareStockGiItemPopupWindow;

//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

    $(document).ready(function() {


      //부품조회팝업
        partSearchPopupWindow = function (sFlag){

            if($("#ltsModelCd").val() == ""){
                return dms.notification.warning("<spring:message code='global.info.preInquire' />");
            }

            selectShareStockGiItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='ser.title.itemInfo' />"   // 품목정보
                ,height:630
                ,content:{
                    //url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                    url:"<c:url value='/ser/wac/pwaReq/selectPwaItemSearchPopup.do'/>"
                    ,data:{
                         "autoBind":false
                        ,"selectable":"row"
                        ,"prcTp" :"04"
                        ,"carlineCd" : ($("#carlineCd").val() != undefined) ? $("#carlineCd").val() : ""
                        ,"sFlag" :sFlag
                        ,"callbackFunc":function(jsonObj){
                            if(jsonObj.length > 0) {

                                 $("#itemCd").val(jsonObj[0].itemCd);
                                 $("#itemNm").val(jsonObj[0].itemNm);
                                 selectShareStockGiItemPopupWindow.close();
                            }
                        }
                    }
                }
            });
        };

        /** 원인현상코드 조회 팝업 **/
        selectPhenCauCodeSearchPopupWindow = function (e){


            if($("#ltsModelCd").val() == ""){
                return dms.notification.warning("<spring:message code='global.info.preInquire' />");
            }

            var paintYn = "C";

            phenCauCodeWin = dms.window.popup({
                windowId:"phenCauCodeSearchPopupWindow"
                , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
                , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
                //,height:150
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                    , data:{
                         "autoBind":false
                        ,"paintYn":paintYn  // paint:P , 원인코드:C
                        ,"itemCd":$("#itemCd").val()
                        ,"callbackFunc":function(data){
                            $("#cauCd").val(data[0].cauCd);
                            $("#cauNm").val(data[0].cauNm);
                            $("#phenCd").val(data[0].phenCd);
                            $("#phenNm").val(data[0].phenNm);
                        }
                    }
                }
            });
        };


      //고객조회팝업
        custPopupWindow = function(){

            vehOfCustInfoSearchPopup = dms.window.popup({
                windowId:"vehOfCustInfoSearchPopup"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"type"  :null
                        ,"sOwnCarYn":"Y"
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {

                                //필드 초기화
                                initAll();
                                getCustInfo(data[0]);
                            }
                        }
                    }
                }
            });
        };

        // 고객 상세조회
        getCustInfo = function(data){
            $.ajax({
                url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
                ,data:JSON.stringify({sVinNo:data.vinNo})
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
                        setButtonEnable("");
                    }
                }
            });
        };

        custInfoSet = function(data){

            $("#vinNo").val(data.vinNo);
            $("#carOwnerId").val(data.carOwnerId);
            $("#carOwnerNm").val(data.carOwnerNm);
            $("#carOwnerTelNo").val(data.carOwnerTelNo);

            $("#creDt").data("kendoExtMaskedDatePicker").value(data.signOffDt);
            $("#wartDt").data("kendoExtMaskedDatePicker").value(data.grteStartDt);
            $("#wrtrDt").data("kendoExtMaskedDatePicker").value(new Date());
            $("#lastRunDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
            $("#ltsModelCd").val(data.ltsModelCd);
            $("#ltsModelNm").val(data.ltsModelNm);
            $("#driveMonth").val(data.driveMonth);//운행월
            $("#carlineCd").val(data.carlineCd);

        };


        /**면비 부품 유형 코드 **/
        var freeItemTpList = [];
         <c:forEach var ="obj" items="${freeItemTp}">
             freeItemTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>

         var freeItemTpMap = dms.data.arrayToMap(freeItemTpList , function(obj){return obj.cmmCd;});

         setFreeItemTpMap = function(value){
             var resultVal = "";
             if( dms.string.strNvl(value) != ""){
                if(freeItemTpMap[value] != undefined)
                 resultVal =  freeItemTpMap[value].cmmCdNm;
             }
             return resultVal;
         };

        /**면비 부품 상태 코드 **/
        var freeItemStatList = [];
         <c:forEach var ="obj" items="${freeItemStatDs}">
             <c:if test="${obj.useYn eq 'Y' }" >
               freeItemStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             </c:if>
         </c:forEach>

         var freeItemStatMap = dms.data.arrayToMap(freeItemStatList , function(obj){return obj.cmmCd;});

         setFreeItemStatMap = function(value){
             var resultVal = "";
             if( dms.string.strNvl(value) != ""){
                if(freeItemStatMap[value] != undefined)
                 resultVal =  freeItemStatMap[value].cmmCdNm;
             }
             return resultVal;
         };



         /** 조회조건 상태 **/
         $("#sFreeItemStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:freeItemStatList
             ,optionLabel:" "
             ,index:0
         });

         /** 조회조건 부품유형 상태 **/
         $("#sItemTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:freeItemTpList
             ,optionLabel:" "
             ,index:0
         });

         /** 상태 **/
         $("#freeItemStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:freeItemStatList
             ,optionLabel:" "
             ,index:0
         });

         /** 부품유형  **/
         $("#itemTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:freeItemTpList
             ,optionLabel:" "
             ,index:0
         });


         /** 조회조건 시작일자 **/
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

        /**요청일자**/
         $("#freeItemReqDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** BHMC 판정일**/
         $("#bhmcConfirmDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 공급상 판정일**/
         $("#spyrJudgDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 보증적용일**/
         $("#wartDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 판매일**/
         $("#saleDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 생산일**/
         $("#creDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 작성일자**/
         $("#wrtrDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 공급상면비부품발송일**/
         $("#spyrFreeItemSendDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 딜러면비부품접수일**/
         $("#dlrFreeItemAcptDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
         });

        /** 딜러고품반납일**/
         $("#dlrOldItemRtnDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
         });

         /**주행거리**/
         $("#runDistVal").kendoExtNumericTextBox({
            min:0
           ,format:"n0" //"{0:##,###}"
           ,value :0
           ,spinners:false             // 증,감 화살표

         });

         /**최종주행거리**/
         $("#lastRunDistVal").kendoExtNumericTextBox({
            min:0
           ,format:"n0" //"{0:##,###}"
           ,value :0
           ,spinners:false             // 증,감 화살표

         });

        /**  버튼 설정 **/
        initAll = function(e){

          //  $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#freeServiceForm").get(0).reset();
            $("#freeItemDocNo").val("");
            $("#fileKeyNm").val("");

        }

        // 조회 버튼
        $("#btnSearch").kendoButton({

            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();

            }

        });


        //dialog.content($("#info-init").html());

        /** 초기화 버튼**/
        $("#btnInit").kendoButton({

            click:function(e){
                initAll();
            }
        });


        /** 저장 버튼**/
        $("#btnSave").kendoButton({

            click:function(e){
                sendRequestData( ($("#freeItemStatCd").val() == "") ? "O":$("#freeItemStatCd").val());

            }

        });

        /** 삭제  버튼**/
        $("#btnDel").kendoButton({

            click:function(e){
                $("#messageId").html("<spring:message code='global.btn.del' var='del' />"+
                                      "<spring:message code='global.info.cnfrmMsg' arguments='${del}' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        sendRequestData("D");
                    }
                    conformKendoWindow.close();

                }).end();
            }
        });


        /** 요청 버튼**/
        $("#btnReq").kendoButton({

            click:function(e){

                $("#messageId").html("<spring:message code='global.btn.req' var='req' />"+
                "<spring:message code='global.info.cnfrmMsg' arguments='${req}' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        sendRequestData("Q");
                    }
                    conformKendoWindow.close();

                }).end();


            }

        });

        /** 요청취소 버튼**/
        $("#btnReqCancel").kendoButton({

            click:function(e){

                $("#messageId").html("<spring:message code='ser.lbl.reqCancel' var='reqCancel' />"+
                        "<spring:message code='global.info.cnfrmMsg' arguments='${reqCancel}' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        sendRequestData("QC");
                    }
                    conformKendoWindow.close();

                }).end();
            }

        });


        // 데이터 전송
        sendRequestData = function(statCd){

            var validator = $("#freeServiceForm").kendoExtValidator().data("kendoExtValidator");

            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value() ;
            var lastRunDistVal = $("#lastRunDistVal").data("kendoExtNumericTextBox").value() ;

            if( lastRunDistVal > runDistVal ){
                msgText = "<spring:message code='ser.lbl.nowRunDist' var='drivDis' />"+
                          "<spring:message code='ser.lbl.accuDrivDis' var='accuDrivDis' />"+
                          "<spring:message code='global.info.validation.min' arguments='${drivDis} ,${accuDrivDis}' />";
                        return  dms.notification.warning(msgText);
            }
            if( dms.string.isEmpty( $("#itemCd").val()) ){
                msgText = "<spring:message code='ser.lbl.itemCd' var='itemCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${itemCd}' />";
                        return  dms.notification.warning(msgText);
            }



            var formSaveData = $("#freeServiceForm").serializeObject( $("#freeServiceForm").serializeArrayInSelector("[data-json-obj='true']") );
            formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
            formSaveData.spyrJudgDt = $("#spyrJudgDt").data("kendoExtMaskedDatePicker").value();//공급상판정일
            formSaveData.wartDt = $("#wartDt").data("kendoExtMaskedDatePicker").value();//작성일자
            formSaveData.wrtrDt = $("#wrtrDt").data("kendoExtMaskedDatePicker").value();//작성일자
            formSaveData.creDt = $("#creDt").data("kendoExtMaskedDatePicker").value();//작성일자
            formSaveData.saleDt = $("#saleDt").data("kendoExtMaskedDatePicker").value();//작성일자
            formSaveData.spyrFreeItemSendDt = $("#spyrFreeItemSendDt").data("kendoExtMaskedDatePicker").value();//공급상면비부품발송일
            formSaveData.dlrFreeItemAcptDt = $("#dlrFreeItemAcptDt").data("kendoExtMaskedDatePicker").value();//딜러면비부품접수일
            formSaveData.dlrOldItemRtnDt = $("#dlrOldItemRtnDt").data("kendoExtMaskedDatePicker").value();//딜러고품반납일
            formSaveData.itemTp = $("#itemTp").data("kendoExtDropDownList").value();//부품유형
            formSaveData.freeItemStatCd = statCd;//상태

            var strUrl = "";

            if(statCd == "D"){
                strUrl = "<c:url value='/ser/wac/freeServicePart/deleteFreeServicePart.do' />";
            }else{
                strUrl = "<c:url value='/ser/wac/freeServicePart/multiFreeServicePart.do' />";
            }

            var freeItemDocNoYn = dms.string.isEmpty($("#freeItemDocNo").val());

            //----------UPDATE BY TJX 20190904      START
            if(statCd = "D" && validator.validate()){
                $.ajax({
                    url:strUrl
                   ,data:JSON.stringify(formSaveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function(result , textStatus){
                	   initAll();
                   }
                   ,beforeSend:function(xhr){
                       dms.loading.show($("#resizableContainer"));
                   }
                   ,complete:function(xhr,status){
                       dms.loading.hide($("#resizableContainer"));
                   }
                });

            }
            //----------END
            
            if(statCd != "D" && validator.validate()){
                $.ajax({
                    url:strUrl
                   ,data:JSON.stringify(formSaveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function(result , textStatus){

                       $("#freeItemStatCd").val( (statCd == "QC") ? "O":statCd);
                       //$("#freeItemStatCd").val(statCd);
                       $("#freeItemDocNo").val(result);
                       /** 버튼 상태 세팅 **/
                       setButtonEnable(statCd);

                       selectedYn = (dms.string.isEmpty($("#sFreeItemStatCd").val()) && ((statCd != "O" ) || freeItemDocNoYn ) );

                       if(selectedYn){
                           gridRow = $("#grid").data("kendoExtGrid").select().index();
                           $("#grid").data("kendoExtGrid").dataSource.data([]);
                           $("#grid").data("kendoExtGrid").dataSource.read();
                       }
                       dms.notification.success("<spring:message code='global.info.success' />");
                   },beforeSend:function(xhr){
                       dms.loading.show($("#resizableContainer"));
                   }
                   ,complete:function(xhr,status){
                       dms.loading.hide($("#resizableContainer"));
                   }
                });

            }

        };




        //상세 데이터 세팅
        setResultDataSetting =  function (result){

            $("#freeItemDocNo").val(result.freeItemDocNo);//면비부품문서번호
            $("#bhmcJudgNm").val(result.bhmcJudgNm);//BHMC판정인
            $("#freeItemStatCd").data("kendoExtDropDownList").value(result.freeItemStatCd);//상태
            $("#itemTp").data("kendoExtDropDownList").value(result.itemTp);//부품유형
            $("#spyrJudgNm").val(result.spyrJudgNm);//공급상판정인
            $("#bhmcJudgProcCont").val(result.bhmcJudgProcCont);//BHMC처리의견
            $("#freeItemApproveNo").val(result.freeItemApproveNo);//승인번호
            $("#spyrJudgNm").val(result.spyrJudgNm);//공급상
            $("#spyrProcCont").val(result.spyrProcCont);//공급상처리의견
            $("#vinNo").val(result.vinNo); //VIN_NO
            $("#ltsModelCd").val(result.ltsModelCd);//LTS MODEL CD
            $("#ltsModelNm").val(result.ltsModelNm);//차종
            $("#carlineCd").val(result.carlineCd);//LTS MODEL CD
            $("#freeItemReqDt").data("kendoExtMaskedDatePicker").value(result.freeItemReqDt);//요청일
            $("#spyrJudgDt").data("kendoExtMaskedDatePicker").value(result.spyrJudgDt);//공급상판정일
            $("#bhmcConfirmDt").data("kendoExtMaskedDatePicker").value(result.bhmcConfirmDt);//BHMC판정일
            $("#wartDt").data("kendoExtMaskedDatePicker").value(result.wartDt);//보증적용일자
            $("#saleDt").data("kendoExtMaskedDatePicker").value(result.saleDt);//판매일자
            $("#creDt").data("kendoExtMaskedDatePicker").value(result.creDt);//생산일자
            $("#wrtrDt").data("kendoExtMaskedDatePicker").value(result.wrtrDt);//작성일자
            $("#spyrFreeItemSendDt").data("kendoExtMaskedDatePicker").value(result.spyrFreeItemSendDt);//공급상면비부품발송일
            $("#dlrFreeItemAcptDt").data("kendoExtMaskedDatePicker").value(result.dlrFreeItemAcptDt);//딜러면비부품접수일
            $("#dlrOldItemRtnDt").data("kendoExtMaskedDatePicker").value(result.dlrOldItemRtnDt);//딜러고품반납일
            $("#driveMonth").val(result.driveMonth);//운행월
            $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);//주행거리
            $("#lastRunDistVal").data("kendoExtNumericTextBox").value(result.lastRunDistVal);//최종 주행거리
            $("#reqUsrNm").val(result.reqUsrNm);//신청인
            $("#reqUsrTelNo").val(result.reqUsrTelNo);//신청인전화번호
            $("#carOwnerId").val(result.carOwnerId);//고객ID
            $("#carOwnerNm").val(result.carOwnerNm);//고객명
            $("#carOwnerTelNo").val(result.carOwnerTelNo);//고객전화
            $("#itemCmp").val(result.itemCmp);//부품업체
            $("#cauCd").val(result.cauCd);//원인코드
            $("#cauNm").val(result.cauNm);//원인코드명
            $("#itemCd").val(result.itemCd);//부품번호
            $("#itemNm").val(result.itemNm);//부품명
            $("#phenCd").val(result.phenCd);//현상코드
            $("#phenNm").val(result.phenNm);//현상코드명
            $("#errCauCont").val(result.errCauCont);//고장현상설명
            $("#remark").val(result.remark);//비고


            $("#spyrFreeItemRtnInvcNo").val(result.spyrFreeItemRtnInvcNo);//공급상면비부품송장번호
            $("#freeItemExpsCmpNm").val(result.freeItemExpsCmpNm);//면비부품발송택배회사명
            $("#oldItemExpsCmpNm").val(result.oldItemExpsCmpNm);//고품반납택배회사명
            $("#dlrOldItemRtnInvcNo").val(result.dlrOldItemRtnInvcNo);//딜러고품반납송장번호


            $("#fileKeyNm").val(result.fileKeyNm);

        };


      //버튼설정
        setButtonEnable = function (sFlag){

            switch(sFlag){
                case "O" :
                    $("#btnSave").data("kendoButton").enable(true);
                    $("#btnDel").data("kendoButton").enable(true);
                    $("#btnReq").data("kendoButton").enable(true);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("Y");
                          break;
                case "HS" :
                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnDel").data("kendoButton").enable(false);
                    $("#btnReq").data("kendoButton").enable(false);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "HA" :
                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnDel").data("kendoButton").enable(false);
                    $("#btnReq").data("kendoButton").enable(false);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "HR" :
                    $("#btnSave").data("kendoButton").enable(true);
                    $("#btnDel").data("kendoButton").enable(true);
                    $("#btnReq").data("kendoButton").enable(true);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("Y");
                          break;
                case "ZS" :
                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnDel").data("kendoButton").enable(false);
                    $("#btnReq").data("kendoButton").enable(false);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "ZA" :
                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnDel").data("kendoButton").enable(false);
                    $("#btnReq").data("kendoButton").enable(false);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "HR" :
                    $("#btnSave").data("kendoButton").enable(true);
                    $("#btnDel").data("kendoButton").enable(true);
                    $("#btnReq").data("kendoButton").enable(true);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "Q" :
                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnDel").data("kendoButton").enable(false);
                    $("#btnReq").data("kendoButton").enable(false);
                    $("#btnReqCancel").data("kendoButton").enable(true);

                    setFileButton("N");
                          break;
                case "ZR" :
                    $("#btnSave").data("kendoButton").enable(true);
                    $("#btnDel").data("kendoButton").enable(true);
                    $("#btnReq").data("kendoButton").enable(true);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("Y");
                          break;
                default :
                    $("#btnSave").data("kendoButton").enable(true);
                    $("#btnDel").data("kendoButton").enable(false);
                    $("#btnReq").data("kendoButton").enable(false);
                    $("#btnReqCancel").data("kendoButton").enable(false);

                    setFileButton("Y");
                    break;
            }
        };
        setFileButton("N");

        /**저장된 면비 보양 상세 데이터 조회 **/
        searchFreeItemmData = function(params){



            $.ajax({
                url:"<c:url value='/ser/wac/freeServicePart/selectFreeServicePartByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){

                   if( dms.string.strNvl(result.vinNo) == ""  ){
                       initAll();
                       dms.notification.info("<spring:message code='global.info.noSearchDataMsg' />");
                       return ;
                   }

                   setResultDataSetting(result);

                   $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                   $("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#freeItemStatCd").val());
                  // dms.notification.success("<spring:message code='global.info.success' />");

                }

            }) ;
        };


        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000159"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/freeServicePart/selectFreeServiceParts.do'/>"
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

                             params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                             params["sToDt"]   = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                             params["sVinNo"] = $("#sVinNo").val();
                             params["sItemCd"] = $("#sItemCd").val();
                             params["sItemTp"] = $("#sItemTp").val();
                             params["sFreeItemStatCd"] = $("#sFreeItemStatCd").val();
                             params["sPreFixId"] = $("#preFixId").val();

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
                           ,freeItemReqDt:{type:"date" }
                           ,bhmcConfirmDt:{type:"date" }
                        }

                     }//model
               }//schema
            }//dataSource
            ,height:170
            ,editable:false
            ,pageable:false
            ,autoBind:false
            ,sortable:false
            ,selectable:"row"
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:true
            ,change:function(e){
                var selectedVal = this.dataItem(this.select());
                var params = {};
                params["sVinNo"] = selectedVal.vinNo;
                params["sFreeItemDocNo"] = selectedVal.freeItemDocNo;
                params["sDlrCd"] = selectedVal.dlrCd;

                //면비부품 상세 조회
                searchFreeItemmData(params);
            }
            ,dataBound:function(e) {
                if(selectedYn ){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }
            ,columns:[
                 {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50}
                ,{field:"freeItemStatCd", title:"<spring:message code='ser.lbl.statNm' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#= setFreeItemStatMap(freeItemStatCd) #"
                }
                ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100, hidden:true}
                ,{field:"freeItemDocNo", title:"<spring:message code='ser.lbl.freeItemDocNo' />", width:100, hidden:true}
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:250}
                ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.carLine'/>", width:200}
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.custNm'/>", width:150}
                ,{field:"freeItemReqDt", title:"<spring:message code='ser.lbl.reqDt'/>", width:150
                    , attributes :{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                }
                ,{field:"bhmcConfirmDt", title:"<spring:message code='ser.lbl.judgDt'/>", width:150
                    , attributes :{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                }
                ,{field:"itemTp", title:"<spring:message code='ser.lbl.itemGubun' />", width:150
                    ,attributes:{"class":"ac"}
                    ,template:"#= setFreeItemTpMap(itemTp) #"
                }
                ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:200}

            ]
        });
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });

     // tablet 사이즈 맞추는거 khskhs 문제시 삭제
        if(${isTablet}){
            if(window.matchMedia('(max-width:1024px)').matches){

                $("#grid").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
            }

        }
     // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    });
</script>
<!-- //script -->



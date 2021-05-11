<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 免费配件申请 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.freeItemRequest" /></h1><!-- 면비부품신청 -->
                <div class="btn_right">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
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
                   <div id="grid" class="resizable_grid"></div>
                </div>
            </div>
        </section>

        <form id="freeServiceBhmcForm">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_s_min5" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                        <button type="button" class="btn_s btn_approve btn_s_min5" id="btnAccept" disabled><spring:message code="ser.btn.btnAccept" /></button>
                        <button type="button" class="btn_s btn_approve btn_s_min5" id="btnApprove" disabled><spring:message code="ser.btn.approval" /></button>
                        <button type="button" class="btn_s btn_return btn_s_min5" id="btnReturn" disabled><spring:message code="ser.btn.nonAppr" /></button>
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
                                    <input type="text" id="spyrJudgNm" name="spyrJudgNm" value="" readonly class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.supplyConfirmDt' /></th><!-- 공급상판정일 -->
                                <td class="readonly_area">
                                    <input type="text" id="spyrJudgDt" name="spyrJudgDt" value="" readonly class="form_datepicker"/>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.bhmcProcCont' /></span></th><!--  BHMC처리의견-->
                                <td colspan="3" >
                                    <input type="text" required id="bhmcJudgProcCont" name="bhmcJudgProcCont" value="" data-name="<spring:message code="ser.lbl.bhmcProcCont" />" class="form_input" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.approveNo' /></th><!-- 승인번호  -->
                                <td class="readonly_area">
                                    <input type="text" id="freeItemApproveNo" name="freeItemApproveNo" readonly value="" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.supplyCd' /></th><!-- 공급상 -->
                                <td class="readonly_area">
                                    <input type="text" id="spyrNm" name="spyrNm" value="" class="form_input" readonly/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.supplyProcCont' /></th><!-- 공급상처리의견 -->
                                <td colspan="3" class="readonly_area">
                                    <input type="text" id="spyrProcCont" name="spyrProcCont" value="" readonly class="form_input" />
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
                                <td class="readonly_area">
                                    <input required type="text" id="vinNo" name="vinNo" readOnly class="form_input" data-name="<spring:message code="ser.lbl.vinNo" />"  data-json-obj="true"/> <!-- 차대번호 -->
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carLine' /></th><!-- 차종  -->
                                <td class="readonly_area">
                                    <input type="text" id="ltsModelNm" name="ltsModelNm" readonly value="" class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.wartDt' /></th><!-- 보증적용일자 -->
                                <td class="readonly_area">
                                    <input type="text" id="wartDt" name="wartDt" value="" readonly class="form_datepicker ac" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.saleDt' /></th><!-- 판매일자  -->
                                <td class="readonly_area">
                                    <input type="text" id="saleDt" name="saleDt" value="" readonly class="form_datepicker ac" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.creDt' /></th><!--  생산일자-->
                                <td class="readonly_area">
                                    <input type="text" id="creDt" name="creDt" value="" readonly class="form_datepicker ac" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.dirveMon' /></th><!-- 운행월 -->
                                <td class="readonly_area">
                                    <input type="text" id="driveMonth" name="driveMonth" value="" readonly class="form_input ar"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.runDist' /></th><!-- 주행거리 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <input type="text" id="runDistVal" name="runDistVal" value="0" readonly class="form_numeric form_readonly ar" />
                                        </div>
                                        <div class="form_right">
                                            <input type="text" id="lastRunDistVal" name="lastRunDistVal" value="0" readonly class="form_numeric form_readonly ar"/>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.reqUsrNm' /></th><!-- 신청인 -->
                                <td class="readonly_area">
                                    <input type="text" id="reqUsrNm" name="reqUsrNm" value="" readonly class="form_input" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.reqUsrHpNo' /></th><!-- 신청인전화번호 -->
                                <td class="readonly_area">
                                    <input type="text" id="reqUsrTelNo" name="reqUsrTelNo" value="" readonly class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.custNm' /></th><!--  고객명-->
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerNm" name="carOwnerNm" value="" readonly class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='serl.lbl.custTelNo' /></th><!-- 고객전화 -->
                                <td class="readonly_area">
                                    <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" value="" readonly class="form_input" />
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
                                <th scope="row"><spring:message code='ser.lbl.itemGubun' /></th><!--  부품유형-->
                                <td class="readonly_area">
                                    <input type="text" id="itemTp" name="itemTp" value="" readonly class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.freeItemCmpn' /></th><!-- 부품업체 -->
                                <td class="readonly_area">
                                    <input type="text" id="itemCmp" name="itemCmp" value="" class="form_input" readonly />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.wrtrDt' /></th><!--  작성일자-->
                                <td class="readonly_area">
                                    <input type="text" id="wrtrDt" name="wrtrDt" value="" readonly class="form_datepicker ac"/>
                                </td>
                                <th scope="row"></th><!--  -->
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.cauCd" /></th><!-- 원인 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" required id="cauCd" name="cauCd" readOnly class="form_input" /> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                           <input type="text" id="cauNm" name="cauNm" readOnly class="form_input" /> <!-- 원인코드명 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.itemCd' /></th><!-- 부품번호 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <input type="text" required id="itemCd" name="itemCd" readOnly class="form_input" />
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="itemNm" name="itemNm" readOnly class="form_input"/> <!-- 원인부품명 -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.phenCd" /></th><!-- 현상(N) -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="phenCd" name="phenCd" readOnly class="form_input" />
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="phenNm" name="phenNm" readOnly class="form_input"/>
                                        </div>
                                    </div>
                                </td>

                                <th scope="row"><spring:message code='ser.lbl.errPhenCont' /></th><!--  고장현상설명 -->
                                <td colspan="3" class="readonly_area">
                                    <input type="text" id="errCauCont" name="errCauCont" value="" class="form_input" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.memo' /></th><!-- 비고 -->
                                <td colspan="7" class="readonly_area">
                                    <input type="text" id="remark" name="remark" value="" class="form_input" readonly/>
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
                                            <input type="text" id="spyrFreeItemSendDt" name="spyrFreeItemSendDt" value="" readonly class="form_datepicker" />
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.supplyItemInvoiceNo' /></th><!-- 공급상면비부품송장번호 -->
                                        <td class="readonly_area">
                                            <input type="text" required id="spyrFreeItemRtnInvcNo" name="spyrFreeItemRtnInvcNo" value="" readonly class="form_input" />
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.freeItemExpNm' /></th><!-- 면비부품발송택배회사명 -->
                                        <td class="readonly_area">
                                            <input type="text" id="freeItemExpsCmpNm" name="freeItemExpsCmpNm" value="" readonly class="form_input"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='ser.lbl.dlrItemReceiptDt' /></th><!--  딜러면비부품접수일-->
                                        <td class="readonly_area">
                                             <input type="text" id="dlrFreeItemAcptDt" name="dlrFreeItemAcptDt" value="" class="form_datepicker" readonly />
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.dlrItemReturnDt' /></th><!-- 딜러고품반납일 -->
                                        <td class="readonly_area">
                                            <input type="text" id="dlrOldItemRtnDt" name="dlrOldItemRtnDt" value="" class="form_datepicker" readonly />
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.itemExpressCmpnNm' /></th><!-- 고품반납택배회사명 -->
                                        <td class="readonly_area">
                                            <input type="text" id="oldItemExpsCmpNm" name="oldItemExpsCmpNm" value="" class="form_input" readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='ser.lbl.dlrItemReturnInvoiceNo' /></th><!-- 딜러고품반납송장번호 -->
                                        <td class="readonly_area">
                                            <input type="text" id="dlrOldItemRtnInvcNo" name="dlrOldItemRtnInvcNo" value="" class="form_input" readonly />
                                        </td>
                                        <td colspan="4"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div>
                        <div class="btn_right_absolute">
                            <span class="btn_file_disable" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 파일찾기 -->
                            <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s btn_s_min5" disabled><spring:message code="global.btn.fileDelete" /></button>
                        </div>
                        <!-- 파일업로드관련 include page -->
                        <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                        <!-- 파일업로드관련 include page -->
                    </div>

                </div>
            </section>
            <input type="hidden" id="freeItemDocNo" name="freeItemDocNo" data-json-obj="true"/><!-- 면비부품문서번호 -->
            <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true"/><!-- 딜러코드 -->
            <input type="hidden" id="bhmcJudgId" name="bhmcJudgId"/> <!-- BHMC 판정ID -->
            <input type="hidden" id="spyrJudgId" name="spyrJudgId"/><!-- 공급상 판정ID -->
            <input type="hidden" id="ltsModelCd" name="ltsModelCd" /><!-- LTS MODEL CD -->
            <input type="hidden" id="carOwnerId" name="carOwnerId" /><!-- 소유자ID -->
            <input type="hidden" id="preFixId" name="preFixId"  value="${preFixId}" data-json-obj="true"/><!-- preFixId -->
        </form>
    </div>
</div>
<!-- //免费配件申请 -->


<!-- script -->
<script>


//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

    $(document).ready(function() {




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
             <c:if test="${obj.useYn eq 'Y' and obj.cmmCd ne 'O'}" >
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
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

        /** 딜러고품반납일**/
         $("#dlrOldItemRtnDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
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

            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#freeServiceBhmcForm").get(0).reset();

        }

        // 조회 버튼
        $("#btnSearch").kendoButton({

            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();

            }

        });

        /** 초기화 버튼**/
        $("#btnInit").kendoButton({

            click:function(e){
               initAll();
            }
        });

        /** 접수 버튼**/
        $("#btnAccept").kendoButton({

            click:function(e){
                sendRequestData("HS");

            }

        });


        /** 승인  버튼**/
        $("#btnApprove").kendoButton({

            click:function(e){
                if(!confirm("<spring:message code='global.btn.approval' var='approval' />"+
                "<spring:message code='global.info.cnfrmMsg' arguments='${approval}' />")){
                    return;
                }
                sendRequestData("HA");
            }

        });


        /** 불승인 버튼**/
        $("#btnReturn").kendoButton({

            click:function(e){
                if(!confirm("<spring:message code='ser.btn.nonAppr' var='nonAppr' />"+
                "<spring:message code='global.info.cnfrmMsg' arguments='${nonAppr}' />")){
                    return;
                }
                sendRequestData("HR");
            }

        });


        // 데이터 전송
        sendRequestData = function(statCd){

            var validator = $("#freeServiceBhmcForm").kendoExtValidator().data("kendoExtValidator");

            if(statCd == "HS"){
                $("#bhmcJudgProcCont").removeAttr("required");
            }else{
                $("#bhmcJudgProcCont").attr("required","");
            }

            if(validator.validate()){

                var formSaveData = $("#freeServiceBhmcForm").serializeObject( $("#freeServiceBhmcForm").serializeArrayInSelector("[data-json-obj='true']") );
                formSaveData.freeItemStatCd = statCd;//상태

                $.ajax({
                    url:"<c:url value='/ser/wac/freeServicePart/multiFreeServicePartBhmc.do' />"
                   ,data:JSON.stringify(formSaveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function(result , textStatus){

                       $("#freeItemStatCd").val(statCd);
                       $("#freeItemDocNo").val(result);
                       /** 버튼 상태 세팅 **/
                       setButtonEnable(statCd);

                       selectedYn = (dms.string.isEmpty($("#sFreeItemStatCd").val())) ? true:false;

                       if(selectedYn){
                           gridRow = $("#grid").data("kendoExtGrid").select().index();
                           $("#grid").data("kendoExtGrid").dataSource.data([]);
                           $("#grid").data("kendoExtGrid").dataSource.read();
                       }
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




        //상세 데이터 세팅
        setResultDataSetting =  function (result){

            $("#freeItemDocNo").val(result.freeItemDocNo);//면비부품문서번호
            $("#dlrCd").val(result.dlrCd);//딜러코드
            $("#freeItemReqDt").val(result.freeItemReqDt);//요청일
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
                case "HS" :
                    $("#btnAccept").data("kendoButton").enable(false);
                    $("#btnApprove").data("kendoButton").enable(true);
                    $("#btnReturn").data("kendoButton").enable(true);

                    setFileButton("N");
                          break;
                case "HA" :
                    $("#btnAccept").data("kendoButton").enable(false);
                    $("#btnApprove").data("kendoButton").enable(false);
                    $("#btnReturn").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "S" :
                    $("#btnAccept").data("kendoButton").enable(false);
                    $("#btnApprove").data("kendoButton").enable(true);
                    $("#btnReturn").data("kendoButton").enable(true);

                    setFileButton("N");
                          break;
                case "Q" :
                    $("#btnAccept").data("kendoButton").enable(true);
                    $("#btnApprove").data("kendoButton").enable(false);
                    $("#btnReturn").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                case "HR" :
                    $("#btnAccept").data("kendoButton").enable(false);
                    $("#btnApprove").data("kendoButton").enable(false);
                    $("#btnReturn").data("kendoButton").enable(false);

                    setFileButton("N");
                          break;
                default :
                    $("#btnAccept").data("kendoButton").enable(false);
                    $("#btnApprove").data("kendoButton").enable(false);
                    $("#btnReturn").data("kendoButton").enable(false);

                    setFileButton("N");

                    break;
            }
        };
        setFileButton("N");

        /**저장된 면비 보양 상세 데이터 조회 **/
        searchFreeItemmData = function(params){



            $.ajax({
                url:"<c:url value='/ser/wac/freeServicePart/selectFreeServicePartBhmcByKey.do' />"
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

                }

            }) ;
        };


        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000158"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/freeServicePart/selectFreeServicePartsBhmc.do'/>"
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
                ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100}
                ,{field:"freeItemDocNo", title:"<spring:message code='ser.lbl.freeItemDocNo' />", width:100, hidden:true}
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:250}
                ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.carLine'/>", width:200}
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.custNm'/>", width:150}
                ,{field:"freeItemReqDt", title:"<spring:message code='ser.lbl.reqDt'/>", width:150
                    ,attributes :{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
                ,{field:"bhmcConfirmDt", title:"<spring:message code='ser.lbl.judgDt'/>", width:150
                    ,attributes :{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
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
    });
</script>
<!-- //script -->



<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 판매기회관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.opportunityMng' /><!-- 판매기회관리 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnMessage" ><spring:message code='global.btn.message' /><!-- 메시지 --></button>
                        <button type="button" class="btn_m" id="btnActive" ><spring:message code='global.btn.active' /><!-- 활동 --></button>
                        <button type="button" class="btn_m" id="btnFail" ><spring:message code='global.btn.failed' /><!-- 실패 --></button>
                        <button type="button" class="btn_m" id="btnReOpen" ><spring:message code='crm.btn.reOpen' /><!-- 재오픈 --></button>
                        <button type="button" class="btn_m" id="btnSuccess" ><spring:message code='global.btn.success' /><!-- 성공 --></button>
                        <%-- <button type="button" class="btn_m" id="btnTrsfReq" ><spring:message code='global.btn.trsfReq' /><!-- 전출요청 --></button>
                        <button type="button" class="btn_m" id="btnTrsfApprover" ><spring:message code='global.btn.trsfApprover' /><!-- 전출승인 --></button> --%>
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="btnSomSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                        <button type="button" class="btn_m" id="btnReset" ><spring:message code='global.btn.add' /><!-- 추가 --></button>
                    </div>
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
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></th>
                                <td>
                                    <input id="sSaleOpptStepCd" name="sSaleOpptStepCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></th>
                                <td>
                                    <input id="sTrsfStatCd" name="sTrsfStatCd" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.intrCarLine' /><!-- 관심차종--></th>
                                <td>
                                    <input id="sIntrCarLine" name="sIntrCarLine" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.intrModel' /><!-- 관심모델--></th>
                                <td>
                                    <input id="sIntrModel" name="sIntrModel" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartRegDt" name="sStartRegDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndRegDt" name="sEndRegDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="salesOpptGrid"></div>
                </div>

            </section>
            <!-- //판매기회관리 -->

            <!-- 판매기회 상세정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.salesOpptDetlInfo' /><!-- 판매기회 상세정보 --></h2>
                </div>
                <div class="table_form form_width_70per">
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
                        <tbody id="salesOpptMgmtInputForm" >
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></span></th>
                                <td colspan="7" class="required_area">
                                    <input type="text" id="remark" name="remark" class="form_input" data-json-obj="true" maxlength="1000" required data-name="<spring:message code="crm.lbl.saleRemark" />" data-bind="value:remark" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span></th>
                                <td class="required_area">
                                    <input type="hidden" id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />
                                    <input type="hidden" id="custNo" name="custNo" data-json-obj="true" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].custNo}' />"</c:if> required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNo" />
                                    <input type="hidden" id="sLeadNo" name="sLeadNo" <c:if test="${leadNo != ''}">value="<c:out value='${leadNo}' />"</c:if> />
                                    <input type="hidden" id="leadNo" name="leadNo" data-json-obj="true" <c:if test="${leadNo != ''}">value="<c:out value='${leadNo}' />"</c:if> />
                                    <input type="hidden" id="vsitNo" name="vsitNo" <c:if test="${vsitNo != ''}">value="<c:out value='${vsitNo}' />"</c:if> />
                                    <input type="hidden" id="sVsitNo" name="sVsitNo" <c:if test="${vsitNo != ''}">value="<c:out value='${vsitNo}' />"</c:if> />
                                <div class="form_search" >
                                    <input id="custNm" name="custNm" class="form_input form_readonly" disabled <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].custNm}' />"</c:if> required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                    <a href="javascript:;" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></span></th>
                                <td class="required_area">
                                    <input id="hpNo" name="hpNo" class="form_input numberic" data-json-obj="true" maxlength="14" <c:if test="${customerInfoVO != ''}">value="<c:out value='${customerInfoVO.custInfoDS[0].hpNo}' />"</c:if> required data-name="<spring:message code="global.lbl.hpNo" />" data-bind="value:hpNo" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></span></th>
                                <td class="required_area">
                                    <input id="saleOpptStepCd" name="saleOpptStepCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.saleOpptStepCd" />" data-bind="value:saleOpptStepCd" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.expcSaleDt' /><!-- 예상판매일자 --></th>
                                <td>
                                    <input id="expcSaleDt" name="expcSaleDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.saleOpptSrcCd' /><!-- 판매기회출처 --></th>
                                <td>
                                    <input id="saleOpptSrcCd" name="saleOpptSrcCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></th>
                                <td>
                                    <input id="trsfStatCd" name="trsfStatCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.succPrbCd' /><!-- 성공확률 --></th>
                                <td>
                                    <input id="succPrbCd" name="succPrbCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                <td>
                                    <input type="hidden" id="scId" name="scId" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="sal.lbl.salesAdvisor" />" data-bind="value:scId" />
                                    <input type="text" id="scNm" name="scNm" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                <td>
                                    <input type="text" id="regUsrId" name="regUsrId" class="form_input form_readonly" disabled />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <input type="text" id="regDt" name="regDt" class="form_input form_readonly" disabled />
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //판매기회 상세 정보 -->


            <!-- 관심차 -->
            <section class="group">
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code="global.lbl.intrCar" /><!-- 관심차 --></h3>
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="btnAddVehic" ><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                        <button type="button" class="btn_s" id="btnDelVehic" ><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
                        <button type="button" class="btn_s" id="btnCancelVehic" ><spring:message code='global.btn.cancel' /></button> <!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="carGrid"></div>
                </div>
            </section>
            <!--  //관심차 -->

            <!-- 실패 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='global.title.saleOpptFailDetl' /><!-- 판매기회 실패 상세정보 --></h3>
                </div>
                <div class="table_grid">
                    <div id="salesOpptFailDetlGrid"></div>
                </div>
            </section>
            <!--  // 실패 상세 정보-->

            <!-- 탭메뉴 -->
            <div class="tab_area">
                <ul>
                    <li id="activeListTab" class="k-state-active"><spring:message code='global.title.active' /><!-- 활동 --></li>
                    <li id="custInfoTab" ><spring:message code='global.title.custinfo' /><!-- 고객정보 --></li>
                    <li id="msgHistoryTab" ><spring:message code='global.lbl.msgHistory' /><!-- 메시지이력 --></li>
                    <li id="salesOpptHistoryTab" ><spring:message code='crm.title.salesOpptHistory' /><!-- HISTORY --></li>
                </ul>
                <div class="mt0">
                    <!-- 활동 탭 그리드 -->
                    <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                                <button type="button" class="btn_xs" id="btnActiveListTab" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="activeGrid"></div>
                        </div>
                    </section>
                    <!-- //활동 탭 그리드 -->
                </div>
                <div id="custInfoTabDiv" class="mt0">

<!-- ******************************************************
          고객 상세 정보 탭 적용 가이드 시작
1. Controll에 코드 추가. (LeadInfoController.java)
      코멘트:고객상세텝 Controller에 추가  <== 로 검색해서 추가해 주세요.

2. HTML 추가
     고객상세정보 탭(HTML) - '시작'에서 '끝'까지

3. 스크립트 1
   고객상세정보 탭 (스크립트1)- '시작'에서 '끝'까지

4. 스크립트 2
    고객상세정보 탭 (스크립트2)- '시작'에서 '끝'까지
******************************************************-->
<!-- ******************************************************
 * 고객상세정보 탭(HTML) - 시작
 ******************************************************-->

                <section class="group">
                <div class="header_area">
                <div class="btn_right">
                  <button class="btn_xs" id="btnResetCustInfoTab" ><spring:message code="global.btn.init" /></button> <!-- 초기화 -->
                  <button class="btn_xs" id="btnSearchCustInfoTab" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                  </div>
                </div>
                <div class="table_form form_width_100per">
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
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td class="readonly_area">
                                    <input id="custNos" name="custNos" type="text" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                <td class="readonly_area">
                                    <input id="custNms" name="custNms" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td class="readonly_area">
                                    <input id="custTps" name="custTps" class="form_comboBox form_readonly"  readOnly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                                <td class="readonly_area">
                                    <input id="custCds" name="custCds" class="form_comboBox form_readonly" readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.sex" /></th> <!-- 성별 -->
                                <td class="readonly_area">
                                    <input id="sexCds" name="sexCds"  class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 신분증유형 -->
                                <td class="readonly_area">
                                    <input id="mathDocTps" name="mathDocTps" class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 신분증번호 -->
                                <td class="readonly_area">
                                    <input id="ssnCrnNos" name="ssnCrnNos" type="text" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:16%" >
                                            <label class="label_check ml5"><input id="bhmcYns" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly data-json-obj="true" /></label>
                                        </div>
                                        <div class="form_right" style="width:84%" >
                                            <input id="siebelRowIds" name="siebelRowIds" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.prsnSC" /></th> <!-- 담당SC -->
                                <td class="readonly_area">
                                    <input id="mngScIds" name="mngScIds" type="text" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecIds" name="mngTecIds" type="text" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custHoldTp" /></th> <!-- 정보출처 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.5%;" >
                                            <input id="custHoldTps" name="custHoldTps" class="form_comboBox" readonly data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.5%;">
                                            <input id="custHoldTpDtls" name="custHoldTpDtls" class="form_comboBox" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per mt5">
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
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hpNo" /></span></th> <!-- 휴대전화 -->
                                <td class="readonly_area">
                                    <input id="hpNos" name="hpNos" type="text" class="form_input form_readonly"  readonly  data-type="mobile" pattern="\d" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                <td class="readonly_area">
                                    <input id="telNos" name="telNos" type="text" value="" class="form_input form_readonly"  readonly data-type="tel"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td class="readonly_area">
                                    <input id="officeTelNos" name="officeTelNos" type="text" class="form_input form_readonly"  readonly  data-type="tel" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td class="readonly_area">
                                    <input id="officeFaxNos" name="officeFaxNos" type="text" value="" class="form_input form_readonly"  readonly  data-type="tel" pattern="\d" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td colspan="3" class="readonly_area">
                                    <input id="emailNms" name="emailNms" type="email" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.wechatId" /></th> <!-- wechat id -->
                                <td class="readonly_area">
                                    <input id="wechatIds" name="wechatIds" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.qq" /></th> <!-- QQ -->
                                <td class="readonly_area">
                                    <input id="qqIds" name="qqIds" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.prefCommMthCd" /></span></th> <!-- 선호연락방법 -->
                                <td class="readonly_area">
                                    <input id="prefCommMthCds" name="prefCommMthCds" class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.prefCommNo" /></span></th> <!-- 선호연락처 -->
                                <td class="readonly_area">
                                    <input id="prefCommNos" name="prefCommNos" class="form_input form_readonly"  readonly data-type="mobile" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefContactMthCd" /></th> <!-- 우선연락방식  SMS / EMAIL / DM -->
                                <td class="readonly_area">
                                    <input id="prefContactMthCds" name="prefContactMthCds" class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefContactTime" /></th> <!-- 우선연락시간 -->
                                <td class="readonly_area">
                                    <input id="prefContactTimeCds" name="prefContactTimeCds" class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per mt5">
                    <table>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:40%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.buyAddCnt' /></th> <!-- 추가구매  -->
                                <td class="readonly_area">
                                    <input id="buyCnts" name="buyCnts" class="form_input"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.chgBuy' /></th> <!-- 교환구매  -->
                                <td class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:33%;" >
                                            <input id="chgBuyYns" name="chgBuyYns" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_left" style="width:33%;">
                                            <input id="purcCarBrandCds" name="purcCarBrandCds" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:34%;">
                                            <input id="purcCarModelNms" name="purcCarModelNms" class="form_input" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 주소정보 시작 -->
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='global.title.addr' /></h3>
                </div>
                <div class="table_grid">
                    <div id="addrGrid"></div>
                </div>
                <!-- //주소정보 끝 -->
                </section>

<!-- ******************************************************
 * 고객상세정보 탭 - 끝

 ******************************************************-->





                </div>
                <div class="mt0">
                    <!-- 메시지이력 탭 그리드 -->
                    <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                                <button type="button" class="btn_xs" id="btnMsgHistoryTab" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="msgHistoryGrid"></div>
                        </div>
                    </section>
                    <!-- //메시지이력 탭 그리드 -->
                </div>
                <div class="mt0">
                    <!-- HISTORY 그리드 -->
                    <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                                <button type="button" class="btn_xs" id="btnSalesOpptHistoryTab" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="salesOpptHistorysGrid"></div>
                        </div>
                    </section>
                    <!-- // HISTORY 그리드 -->
                </div>
            </div>
            <!-- //탭메뉴 -->

            <script type="text/javascript">
            var popupWindow            // 고객 검색 팝업
                , salesOpptStatPopup     // 상태 알림 팝업
                , salesOpptFailPopup     // 실패 등록 팝업
                , messagePopupWindow     // 메시지 전송
                , isGridReload = false            // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                , saleOpptMgmtNo;                       // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )

            $("#carGrid").on("click", "input.flagYn", function(e){

                var carGrid = $("#carGrid").data("kendoExtGrid");
                var uid = $(this).data("uid");

                $("input.flagYn", "#carGrid").prop("checked", false);
                $(this).prop("checked", true);

                $.each(carGrid.dataSource.view(), function(idx, dataItem){
                    dataItem.set("flagYn", "N");
                });

                carGrid.dataSource.getByUid(uid).set("flagYn", "Y");

            });

            /**
            * hyperlink in grid event of Customer Information
            */
            $(document).on("click", ".linkCust", function(e){

                 var grid = $("#salesOpptGrid").data("kendoExtGrid"),
                 row = $(e.target).closest("tr");
                 var dataItem = grid.dataItem(row);

                 window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
            });


            // 고객 검색 팝업
            $("#custSearch").click(function(){

             // 수정모드에서는 고객팝업 안열어준다
                // 판매기회단계 가 실패(07) 또는 판매에서  변경한경우 - 주문취소(01) / 계약완료(06) / 계약제출(08) 일경우 readonly 이기 때문에 팝업을 안열어준다.
                var saleOpptStepCd = $("#saleOpptStepCd").val();
                if ( dms.string.isNotEmpty($("#saleOpptNo").val()) && dms.string.isNotEmpty(saleOpptStepCd) ) {

                    if( saleOpptStepCd === "07" || saleOpptStepCd === "01"  || saleOpptStepCd === "06"  || saleOpptStepCd === "08" ){
                        return;
                    }
                }

                popupWindow = dms.window.popup({
                    windowId:"customerSearchPopup"
                    , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                    , content:{
                        url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                        , data:{
                            "autoBind":false
                            , "type"  :null
                            , "callbackFunc":function(data){
                                if(data.length >= 1) {

                                    console.log(data);

                                    // 초기화
                                    initForm();

                                    $("#custNo").val(data[0].custNo);
                                    $("#custNm").val(data[0].custNm);
                                    $("#hpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                    $("#scId").val(data[0].mngScId);
                                    $("#scNm").val(data[0].mngScNm);

                                    popupWindow.close();

                                }
                            }
                        }
                    }
                });
            });

            // 판매기회 상세 조회
            function saleOpptMgmtByKey(saleOpptNo){

                if( dms.string.isEmpty(saleOpptNo) ){
                    // 판매기회 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                var param = {
                        "sSaleOpptNo":saleOpptNo
                        };

                console.log(JSON.stringify(param));
                //return;

                $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtByKey.do' />"
                        ,data:JSON.stringify(param)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                }).done(function(body) {

                    console.log("selectSalesOpptMgmtByKey:",body);

                    // 판매기회 상태 알림 팝업 ( 등록일 기준 1개월 이상이면 팝업 )
                    var regPrid = body.regPrid;
                    //regPrid = 1;
                    console.log("regPrid:"+regPrid)

                    //if(regPrid >= 1){
                    if(regPrid >= 30){

                        salesOpptStatPopup = dms.window.popup({
                            windowId:"salesOpptStatPopup"
                            , title:"<spring:message code='global.title.saleOpptStatNoti' />"  // 판매기회 상태알림
                            , width:355
                            , height:200
                            , content:{
                                url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptStatPopup.do'/>"
                                ,data:{
                                    "autoBind":false
                                    , "saleOpptNo"  :body.saleOpptNo
                                    , "custNm"       :body.custNm
                                    , "regPrid"      :regPrid
                                    , "callbackFunc":function(data){

                                        console.log("data:",data);

                                        if(data == "SUCCESS"){
                                            // 판매기회단계변경 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.saleOpptStepUpdt' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            // 초기화
                                            $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                                            initForm();

                                        }else if(data == "CLOSE"){

                                            console.log("판매기회 상태 팝업 종후 실패 팝업 오픈");
                                            failPopup();

                                        }

                                    }
                                }
                            }
                        });

                    }

                    // 초기화
                    initForm();

                    // data set 시작
                    $("#saleOpptNo").val(body.saleOpptNo);
                    $("#leadNo").val(body.leadNo);
                    $("#vsitNo").val(body.vsitNo);
                    $("#remark").val(body.remark);
                    $("#custNo").val(body.custNo);
                    $("#custNm").val(body.custNm);
                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                    $("#scId").val(body.scId);
                    $("#scNm").val(body.scNm);
                    $("#expcSaleDt").data("kendoExtMaskedDatePicker").value(body.expcSaleDt);
                    $("#succPrbCd").data("kendoExtDropDownList").value(body.succPrbCd);
                    $("#saleOpptSrcCd").data("kendoExtDropDownList").value(body.saleOpptSrcCd);

                    $("#regUsrId").val(body.regUsrNm);
                    $("#regDt").val(body.regDt);

                    $("#btnMessage").data("kendoButton").enable(true);

                    var trsfStatCd = body.trsfStatCd;
                    $("#trsfStatCd").data("kendoExtDropDownList").value(trsfStatCd);
                    /* // 전출상태에 따라서 전출요청/전출승인 버튼 확인
                    var btnTrsfReq = $("#btnTrsfReq").data("kendoButton");
                    var btnTrsfApprover = $("#btnTrsfApprover").data("kendoButton");

                    if(trsfStatCd == "01"){             // 전출요청
                        btnTrsfReq.enable(false);       // 전출요청 비활성
                        btnTrsfApprover.enable(true);   // 전출승인 활성
                    }else if(trsfStatCd == "02"){       // 전출확인
                        btnTrsfReq.enable(false);        // 전출요청 비활성
                        btnTrsfApprover.enable(false);   // 전출승인 비활성
                    }else if(trsfStatCd == "03"){       // 전출거부
                        btnTrsfReq.enable(true);        // 전출요청 활성
                        btnTrsfApprover.enable(false);   // 전출승인 비활성
                    }else{
                        btnTrsfReq.enable(true);        // 전출요청 활성
                        btnTrsfApprover.enable(true);   // 전출승인 활성
                    }
                    */

                    var saleOpptStepCd = body.saleOpptStepCd;
                    $("#saleOpptStepCd").data("kendoExtDropDownList").value(saleOpptStepCd);
                    // 판매기회단계 가 실패(07) 또는 판매에서  변경한경우 - 주문취소(01) / 계약완료(06) / 계약제출(08) 일경우 form 읽기전용 + 버튼 비활성
                    if( saleOpptStepCd == "07" || saleOpptStepCd == "01"  || saleOpptStepCd == "06"  || saleOpptStepCd == "08" ){

                        // 읽기전용
                        $("#remark").attr("disabled", true).addClass('form_readonly');
                        $("#hpNo").data("kendoMaskedTextBox").enable(false);
                        $("#hpNo").addClass('form_readonly');
                        $("#saleOpptStepCd").data("kendoExtDropDownList").enable(false);
                        $("#expcSaleDt").data("kendoExtMaskedDatePicker").enable(false);;
                        $("#saleOpptSrcCd").data("kendoExtDropDownList").enable(false)
                        $("#trsfStatCd").data("kendoExtDropDownList").enable(false);
                        $("#succPrbCd").data("kendoExtDropDownList").enable(false);

                        // 버튼 비활성
                        //$("#btnActive").data("kendoButton").enable(false);          // 활동
                        $("#btnFail").data("kendoButton").enable(false);            // 실패
                        //$("#btnReOpen").data("kendoButton").enable(false);          // 재오픈
                        $("#btnSuccess").data("kendoButton").enable(false);         // 성공
                        //$("#btnTrsfReq").data("kendoButton").enable(false);         // 전출요청
                        //$("#btnTrsfApprover").data("kendoButton").enable(false);    // 전출승인
                        $("#btnSomSave").data("kendoButton").enable(false);         // 저장

                        $("#btnAddVehic").data("kendoButton").enable(false);        // 행추가
                        $("#btnDelVehic").data("kendoButton").enable(false);        // 행삭제
                        $("#btnCancelVehic").data("kendoButton").enable(false);     // 취소

                        // 실패일경우에 재오픈:활성
                        if(saleOpptStepCd == "07" ){                                // 실패
                            $("#btnReOpen").data("kendoButton").enable(true);       // 재오픈 활성
                        }

                    }else{

                        $("#btnActive").data("kendoButton").enable(true);          // 활동
                        $("#btnReOpen").data("kendoButton").enable(false);          // 재오픈 비활성
                        $("#btnFail").data("kendoButton").enable(true);             // 실패 활성
                        $("#btnSuccess").data("kendoButton").enable(true);          // 성공 활성
                        //$("#btnTrsfReq").data("kendoButton").enable(true);          // 전출요청 활성
                        //$("#btnTrsfApprover").data("kendoButton").enable(true);     // 전출승인 활성

                    }
                    // data set 종료


                    // 탭 그리드 조회 버튼
                    $("#btnActiveListTab").data("kendoButton").enable(true);
                    $("#btnMsgHistoryTab").data("kendoButton").enable(true);
                    $("#btnSalesOpptHistoryTab").data("kendoButton").enable(true);
                    $("#btnResetCustInfoTab").data("kendoButton").enable(true);
                    $("#btnSearchCustInfoTab").data("kendoButton").enable(true);

                    // 연관 그리드 조회
                    $("#carGrid").data("kendoExtGrid").dataSource.read();
                    $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.read();

                    // 판매기회 단계에 따라서 관심차 그리드 selectable 변경
                    if ( body.saleOpptStepCd == "07" || body.saleOpptStepCd == "01"  || body.saleOpptStepCd == "06"  || body.saleOpptStepCd == "08" ) {
                        $("table", "#carGrid").removeClass('k-selectable');
                    } else {
                        $("table", "#carGrid").addClass('k-selectable');
                    }

                });

            }

            // 판매기회 실패 팝업
            function failPopup(){

                var saleOpptNo = $("#saleOpptNo").val();

                if( dms.string.isEmpty(saleOpptNo) ){
                    // 판매기회 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                salesOpptFailPopup = dms.window.popup({
                    windowId:"salesOpptFailPopup"
                    , title:"<spring:message code='global.title.saleOpptFailReg' />"  // 판매기회 실패등록
                    //, width:355
                    , height:350       // 드롭다운 리스트 클릭하면 스크롤이 생기기 때문에 적당히 높이지정
                    , content:{
                        url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptFailPopup.do'/>"
                        ,data:{
                            "autoBind":false
                            , "saleOpptNo"  :saleOpptNo
                            , "callbackFunc":function(data){

                                console.log("data:",data)

                                if(data == "SUCCESS"){

                                    // 판매기회단계변경 / 이 완료 되었습니다.
                                    dms.notification.success("<spring:message code='global.lbl.saleOpptStepUpdt' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                    // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                    $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                                    isGridReload = true;
                                    saleOpptMgmtNo = saleOpptNo;

                                    salesOpptFailPopup.close();

                                }


                            }
                        }
                    }
                });

            }

            // 판매기회단계 상태 변경
            function saleOpptStepUpdt(saleOpptStepCd){

                console.log("saleOpptStepCd:"+saleOpptStepCd)

                var saleOpptNo = $("#saleOpptNo").val();

                if( dms.string.isEmpty(saleOpptNo) ){
                    // 판매기회 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                if( dms.string.isEmpty(saleOpptStepCd) ){
                    // 판매기회단계 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOpptStepCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                var param = {
                        "saleOpptNo":saleOpptNo
                        ,"saleOpptStepCd":saleOpptStepCd
                        };

                console.log(JSON.stringify(param));
                //return;

                // 판매기회단계 상태 변경
                $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptMgmt/updateSalesOpptStep.do' />"
                        ,data:JSON.stringify(param)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                }).done(function(body) {

                    // 판매기회단계 변경 / 이 완료 되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.saleOpptStepUpdt' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                    // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                    $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                    isGridReload = true;
                    saleOpptMgmtNo = saleOpptNo;


                });

            }

            // 전출상태 변경
            function trsfStatUpdt(trsfStatCd){

                var saleOpptNo = $("#saleOpptNo").val();

                if( dms.string.isEmpty(saleOpptNo) ){
                    // 판매기회 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                if( dms.string.isEmpty(trsfStatCd) ){
                    // 전출상태 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.trsfStatCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                var param = {
                        "saleOpptNo":saleOpptNo
                        ,"trsfStatCd":trsfStatCd
                        };

                console.log(JSON.stringify(param));
                //return;

                // 판매기회단계 상태 변경
                $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptMgmt/updateTrsfStat.do' />"
                        ,data:JSON.stringify(param)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                }).done(function(body) {

                    // 전출상태 / 이 완료 되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.trsfStatCd' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                    // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                    $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                    isGridReload = true;
                    saleOpptMgmtNo = saleOpptNo;


                });

            }

            function initForm(){

                console.log(":::::initForm 시작 :::::")
                // form data 초기화
                $("#saleOpptNo").val("");
                $("#leadNo").val("");
                $("#sLeadNo").val("");      // param 값만 초기화
                $("#sVsitNo").val("");      // param 값만 초기화
                $("#vsitNo").val("");
                $("#custNo").val("");
                $("#custNm").val("");
                $("#hpNo").data("kendoMaskedTextBox").value("");
                $("#remark").val("");
                $("#saleOpptStepCd").data("kendoExtDropDownList").value("");
                $("#trsfStatCd").data("kendoExtDropDownList").value("");
                $("#expcSaleDt").data("kendoExtMaskedDatePicker").value("");
                $("#succPrbCd").data("kendoExtDropDownList").value("");
                $("#scId").val("");
                $("#scNm").val("");
                $("#saleOpptSrcCd").data("kendoExtDropDownList").value("");
                $("#regUsrId").val("");
                $("#regDt").val("");

                // form readonly 속성 초기화
                $("#remark").attr("disabled", false).removeClass('form_readonly');
                $("#hpNo").data("kendoMaskedTextBox").enable(true);
                $("#hpNo").removeClass('form_readonly');
                $("#saleOpptStepCd").data("kendoExtDropDownList").enable(true);
                $("#expcSaleDt").data("kendoExtMaskedDatePicker").enable(true);
                $("#saleOpptSrcCd").data("kendoExtDropDownList").enable(true)
                $("#trsfStatCd").data("kendoExtDropDownList").enable(true);
                $("#succPrbCd").data("kendoExtDropDownList").enable(true);

                // button 초기화
                $("#btnMessage").data("kendoButton").enable(false);
                $("#btnActive").data("kendoButton").enable(false);          // 활동
                $("#btnFail").data("kendoButton").enable(false);            // 실패
                $("#btnReOpen").data("kendoButton").enable(false);          // 재오픈
                $("#btnSuccess").data("kendoButton").enable(false);         // 성공
                //$("#btnTrsfReq").data("kendoButton").enable(false);         // 전출요청
                //$("#btnTrsfApprover").data("kendoButton").enable(false);    // 전출승인
                $("#btnSomSave").data("kendoButton").enable(true);         // 저장
                $("#btnReset").data("kendoButton").enable(true);           // 초기화
                $("#btnAddVehic").data("kendoButton").enable(true);        // 행추가
                $("#btnDelVehic").data("kendoButton").enable(true);        // 행삭제
                $("#btnCancelVehic").data("kendoButton").enable(true);     // 취소

                // 그리드 초기화
                $("#carGrid").data("kendoExtGrid").dataSource.data([]);
                $(".checkAll", "#carGrid").prop("disabled", false);
                $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.data([]);

                // 탭 그리드 초기화
                $("#msgHistoryGrid").data("kendoExtGrid").dataSource.data([]);
                $("#salesOpptHistorysGrid").data("kendoExtGrid").dataSource.data([]);
                $("#activeGrid").data("kendoExtGrid").dataSource.data([]);

                // 탭 그리드 조회 버튼
                $("#btnActiveListTab").data("kendoButton").enable(false);
                $("#btnMsgHistoryTab").data("kendoButton").enable(false);
                $("#btnSalesOpptHistoryTab").data("kendoButton").enable(false);
                $("#btnResetCustInfoTab").data("kendoButton").enable(false);
                $("#btnSearchCustInfoTab").data("kendoButton").enable(false);

                // 고객 상세정보 탭 초기화
                resetCustInfoTab();

                console.log(":::::initForm 종료 :::::")

                //var tabStrip = $(".tab_area").kendoExtTabStrip().data("kendoExtTabStrip");
                //tabStrip.select("li:first");

            }

                /******************************************************
                 * 고객상세정보 탭 (스크립트1)- 시작
                 ******************************************************/

                 var custTpList = [];
                 var custCdList = [];
                 var custCdMap = [];
                 var sexCdList                                   = [];
                 var mathDocTpList             = [];
                 var custHoldTpList            = [];
                 var custHoldTpDtlList         = [];
                 var prefCommMthCdList         = [];
                 var prefContactMthCdList      = [];
                 var prefContactTimeCdList     = [];
                 var addrTpList = [];
                 var chgBuyYnDS = [];
                 var chgBuyYnMap = [];
                 var purcCarBrandCdDS = [];
                 var addrTpMap = [];

                 chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
                 chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
                 chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
                 chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

                 <c:forEach var="obj" items="${addrTpList}">
                 addrTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                 </c:forEach>

                 <c:forEach var="obj" items="${custTpList}">
                 custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${custCdList}">
                 custCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                 </c:forEach>
                 custCdVal = function(val){
                     var returnVal = "";
                     if(val != null && val != ""){
                         returnVal = custCdMap[val];
                     }
                     return returnVal;
                 };

                 <c:forEach var="obj" items="${sexCdList}">
                 sexCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${mathDocTpList}">
                 mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${custHoldTpList}">
                 custHoldTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${custHoldTpDtlList}">
                 custHoldTpDtlList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${prefCommMthCdList}">
                 prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${prefContactMthCdList}">
                 prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${prefContactTimeCdList}">
                 prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 <c:forEach var="obj" items="${purcCarBrandCdDS}">
                 purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                 </c:forEach>

                 var resetCustInfoTab = function(E){

                     $("#custNms").val("");
                     $("#custNos").val("");
                     $("#custTps").data("kendoExtDropDownList").value("");
                     $("#custCds").data("kendoExtDropDownList").value("");
                     $("#hpNos").val("");
                     $("#emailNms").val("");
                     $("#mngScIds").val("");
                     $("#mngTecIds").val("");
                     $("#wechatIds").val("");
                     $("#qqIds").val("");
                     $("#telNos").val("");
                     $("#prefCommMthCds").data("kendoExtDropDownList").value("");
                     $("#custHoldTps").data("kendoExtDropDownList").value("");
                     $("#custHoldTpDtls").data("kendoExtDropDownList").value("");
                     $("#mathDocTps").data("kendoExtDropDownList").value("");
                     $("#ssnCrnNos").val("");
                     $("#officeTelNos").val("");
                     $("#officeFaxNos").val("");
                     $("#sexCds").data("kendoExtDropDownList").value("");
                     $("#prefContactMthCds").data("kendoExtDropDownList").value("");
                     $("#prefContactTimeCds").data("kendoExtDropDownList").value("");
                     $("#prefCommNos").val("");
                     $("#siebelRowIds").val("");
                     $("#buyCnts").val("");
                     $("#chgBuyYns").data("kendoExtDropDownList").value("");
                     $("#purcCarBrandCds").data("kendoExtDropDownList").value("");
                     $("#purcCarModelNms").val("");

                     $("#addrGrid").data("kendoExtGrid").dataSource.data([]);
                 };


                /******************************************************
                * 고객상세정보 탭 (스크립트1)- 끝
                ******************************************************/


                /******************************************************
                 * 판매기회 그리드 (DataSource)- 시작
                 ******************************************************/
                // 판매기회단계 DS
                var saleOpptStepCdDs = [];
                var saleOpptStepCdArr = [];
                <c:forEach var="obj" items="${saleOpptStepCdList}">
                    saleOpptStepCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    saleOpptStepCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                saleOpptStepCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = saleOpptStepCdArr[val];
                    }
                    return returnVal;
                };

                // 전출상태 DS
                var trsfStatCdDs = [];
                var trsfStatCdArr = [];
                <c:forEach var="obj" items="${trsfStatCdList}">
                    trsfStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    trsfStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                trsfStatCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = trsfStatCdArr[val];
                    }
                    return returnVal;
                };

                // 판매고문
                var usersDS = [];
                var usersArr = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                    usersArr["${obj.usrId}"] = "${obj.usrNm}";
                </c:forEach>
                usersArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = usersArr[val];
                    }
                    return returnVal;
                };

                // 판매기회 출처 DS
                var saleOpptSrcCdDs = [];
                var saleOpptSrcCdArr = [];
                <c:forEach var="obj" items="${saleOpptSrcCdList}">
                    saleOpptSrcCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    saleOpptSrcCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                saleOpptSrcCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = saleOpptSrcCdArr[val];
                    }
                    return returnVal;
                };

                // 성공확률 DS
                var succPrbCdDs = [];
                var succPrbCdArr = [];
                <c:forEach var="obj" items="${succPrbCdList}">
                    succPrbCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    succPrbCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>

                succPrbCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = succPrbCdArr[val];
                    }
                    return returnVal;
                };

                /******************************************************
                 * 판매기회 그리드 (DataSource)- 종료
                 ******************************************************/

                /******************************************************
                * 관심차종 그리드 (DataSource)- 시작
                ******************************************************/
                //차종조회
                var carLineCdDSList = [];
                var carLineCdObj = {};
                <c:forEach var="obj" items="${carLineCdInfo}">
                   carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
                   carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
                </c:forEach>

                //그리드 모델 콤보 DataSource
                var modelCdDSList = [];
                var modelCdObj = {};

                // 그리드 외장색 콤보 DataSource
                var extColorCdDSList = [];
                var extColorCdObj = {};

                // 그리드 내장색 콤보 DataSource
                var intColorCdDSList = [];
                var intColorCdObj = {};

                // 차량모델DS (검색조건이랑 그리드. 두곳에서 사용중이라서 function 으로 뺐음)
                function getModelCdDSList(carlineCd){

                    if (dms.string.isEmpty(carlineCd)) {
                        return;
                    }

                    var responseJson = dms.ajax.getJson({
                        url:_contextPath + "/sal/cnt/contractPackage/selectModel.do"
                        ,data:JSON.stringify({"carlineCd":carlineCd})
                        ,async:false
                    });
                    modelCdDSList = responseJson.data;

                    if(modelCdDSList === null){
                        // 해당 차종에 따른 모델이 없습니다. 차종을 다시 선택해주세요.
                        dms.notification.error("<spring:message code='crm.lbl.carLineNOTmodel' />");
                        return;
                    }

                    return modelCdDSList;


                }
                /**
                 * 차종에 따른 모델 조회 ( 드롭다운 리스트 )
                 */
                function selectCarlineCd(e) {
                    var dataItem = this.dataItem(e.item);

                    modelCdDSList = getModelCdDSList(dataItem.carlineCd);

                    $("#sIntrModel").data("kendoExtDropDownList").setDataSource(modelCdDSList);

                };

                /**
                 * 차종에 따른 모델 조회 ( 관심차 그리드 )
                 */
                function selectGridCarlineCd(e) {
                    var dataItem = this.dataItem(e.item);

                    var grid = $("#carGrid").data("kendoExtGrid");
                    var selectRow = grid.dataItem(grid.select());

                    selectRow.set("carlineNm", dataItem.carlineNm);
                    selectRow.set("modelCd", '');
                    selectRow.set("modelNm", '');
                    selectRow.set("extColorCd", '');
                    selectRow.set("extColorNm", '');
                    selectRow.set("intColorCd", '');
                    selectRow.set("intColorNm", '');

                    modelCdDSList = getModelCdDSList(dataItem.carlineCd);

                    modelCdObj = {};
                    if(modelCdDSList != null){
                        $.each(modelCdDSList, function(idx, obj){
                            modelCdObj[obj.modelCd] = obj.modelNm;
                        });
                    }

                };

                // 모델에 따른 외장색 조회
                function selectGridModelCd(e) {

                    var dataItem = this.dataItem(e.item);
                    var grid = $("#carGrid").data("kendoExtGrid");
                    var selectRow = grid.dataItem(grid.select());

                    selectRow.set("modelNm", dataItem.modelNm);
                    selectRow.set("extColorCd", '');
                    selectRow.set("extColorNm", '');
                    selectRow.set("intColorCd", '');
                    selectRow.set("intColorNm", '');

                    var responseJson = dms.ajax.getJson({
                        url:_contextPath + "/sal/cnt/contractPackage/selectExtColor.do"
                        ,data:JSON.stringify({"modelCd":dataItem.modelCd})
                        ,async:false
                    });
                    extColorCdDSList = responseJson.data;

                    if(extColorCdDSList === null){
                        // 해당 모델에 따른 외장색이 없습니다. 모델을 다시 선택해주세요.
                        dms.notification.error("<spring:message code='crm.lbl.modelNOToutColor' />");
                        return;
                    }

                    extColorCdObj = {};
                    if(extColorCdDSList != null){
                        $.each(extColorCdDSList, function(idx, obj){
                            extColorCdObj[obj.extColorCd] = obj.extColorNm;
                        });
                    }

                };

                //외장색에 따른 내장색 조회:모델값으로 조회
                function selectGridExtColorCd(e) {
                    var dataItem = this.dataItem(e.item);
                    var grid = $("#carGrid").data("kendoExtGrid");
                    var selectRow = grid.dataItem(grid.select());

                    selectRow.set("extColorNm", dataItem.extColorNm);
                    selectRow.set("intColorCd", '');
                    selectRow.set("intColorNm", '');

                    var responseJson = dms.ajax.getJson({
                        url:_contextPath + "/sal/cnt/contractPackage/selectIntColor.do"
                        ,data:JSON.stringify({"modelCd":selectRow.modelCd})
                        ,async:false
                    });
                    intColorCdDSList = responseJson.data;

                    if(intColorCdDSList === null){
                        // 해당 외장색에 따른 내장색이 없습니다. 외장색을 다시 선택해주세요.
                        dms.notification.error("<spring:message code='crm.lbl.outColorNOTintColor' />");
                        return;
                    }

                    intColorCdObj = {};
                    if(intColorCdDSList != null){
                        $.each(intColorCdDSList, function(idx, obj){
                            intColorCdObj[obj.intColorCd] = obj.intColorNm;
                        });
                    }
                };

                //내장색 선택
                function selectGridIntColorCd(e) {
                    var dataItem = this.dataItem(e.item);
                    var grid = $("#carGrid").data("kendoExtGrid");
                    var selectRow = grid.dataItem(grid.select());

                    selectRow.set("intColorNm", dataItem.intColorNm);
                };

                //1 Grid- 차종의 template 정의
                function bf_selectCarLine(carlineCd) {
                   if(carlineCd == ""){
                       return "";
                   }else{
                       return carLineCdObj[carlineCd];
                   }
                }

                //2 Grid- 모델의 template 정의
                function bf_selectModel(modelCd, modelNm){

                    if ( dms.string.isEmpty(modelNm) ||  dms.string.isEmpty(modelCd) ){
                        return "";
                    }
                    if(modelNm != ""){
                        return modelNm;
                    }
                    if(modelCd == ""){
                        return "";
                    }

                    return modelCdObj[modelCd];
                }

                //4 Grid - 외장색의 template 정의
                function bf_selectExtColor(extColorCd, extColorNm){

                    if ( dms.string.isEmpty(extColorNm) ||  dms.string.isEmpty(extColorCd) ){
                        return "";
                    }
                    if ( extColorNm != "" ) {
                       return extColorNm;
                    }
                    if ( extColorCd == "" ) {
                        return "";
                    }
                    return extColorCdObj[extColorCd];
                }

                //5 Grid - 내장색의 template 정의
                function bf_selectIntColor(intColorCd, intColorNm){

                    if ( dms.string.isEmpty(intColorCd) ||  dms.string.isEmpty(intColorNm) ){
                        return "";
                    }
                    if(intColorNm != ""){
                        return intColorNm;
                    }
                    if(intColorCd == ""){
                        return "";
                    }
                    return intColorCdObj[intColorCd];
                }
                /******************************************************
                * 관심차종 그리드 (DataSource)- 종료
                ******************************************************/

                /******************************************************
                 * 판매기회실패 그리드 (DataSource)- 시작
                 ******************************************************/
                // 실패유형 DS
                //var failTpCdDs = [];
                var failTpCdArr = [];
                <c:forEach var="obj" items="${failTpCdList}">
                    //failTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    failTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                failTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = failTpCdArr[val];
                    }
                    return returnVal;
                };

                // 실패1급원인 DS
                //var failCau1CdDs = [];
                var failCau1CdArr = [];
                <c:forEach var="obj" items="${failCau1CdList}">
                    //failCau1CdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    failCau1CdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                failCau1CdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = failCau1CdArr[val];
                    }
                    return returnVal;
                };

                // 실패2급원인 DS
                //var failCau2CdDs = [];
                var failCau2CdArr = [];
                <c:forEach var="obj" items="${failCau2CdList}">
                    //failCau2CdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    failCau2CdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                failCau2CdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = failCau2CdArr[val];
                    }
                    return returnVal;
                };

                // 등록차량 브랜드 DS
                //var brandCdDs = [];
                var brandCdArr = [];
                <c:forEach var="obj" items="${brandCdList}">
                    //brandCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    brandCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                brandCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = brandCdArr[val];
                    }
                    return returnVal;
                };
                /******************************************************
                 * 판매기회실패 그리드 (DataSource)- 종료
                 ******************************************************/

                /******************************************************
                 * 활동 탭 (DataSource)- 시작
                 ******************************************************/


                // 영업활동유형 DS
                var salesActiveTpCdArr = [];
                <c:forEach var="obj" items="${salesActiveTpCdList}">
                    salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                salesActiveTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = salesActiveTpCdArr[val];
                    }
                    return returnVal;
                };

                // 연락방식 DS
                var commMthCdArr = [];
                <c:forEach var="obj" items="${commMthCdList}">
                    commMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                commMthCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = commMthCdArr[val];
                    }
                    return returnVal;
                };

                // 영업활동상태 DS
                var salesActiveStatCdArr = [];
                <c:forEach var="obj" items="${salesActiveStatCdList}">
                    salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                salesActiveStatCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = salesActiveStatCdArr[val];
                    }
                    return returnVal;
                };
                 /******************************************************
                 * 활동 탭 (DataSource)- 종료
                 ******************************************************/

                /******************************************************
                 * 메시지이력 탭 (DataSource)- 시작
                 ******************************************************/
                // 접촉유형 DS
                var contactTpArr = [];
                <c:forEach var="obj" items="${activeCdList}">
                    contactTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                contactTpArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = contactTpArr[val];
                    }
                    return returnVal;
                };

                // 접촉업무 DS
//                 var contactBizCdArr = [];
//                 <c:forEach var="obj" items="${contactBizCdList}">
//                     contactBizCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
//                 </c:forEach>
//                 contactBizCdArrVal = function(val){
//                     var returnVal = "";
//                     if(val != null && val != ""){
//                         returnVal = contactBizCdArr[val];
//                     }
//                     return returnVal;
//                 };
                /******************************************************
                 * 메시지이력 탭 (DataSource)- 종료
                 ******************************************************/

                $(document).ready(function() {


                    /******************************************************
                    * 고객상세정보 탭 (스크립트2)- 시작
                    ******************************************************/

                    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
                        $("#custTps").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:custTpList
                            , index:0
                            , enable:false
                        });

                     // 잠재/보유고객      custCd              (CRM023)
                        $("#custCds").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:custCdList
                            , index:0
                            , enable:false
                        });

                    // 성별                       sexCd                   (COM017)
                         $("#sexCds").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:sexCdList
                            , index:0
                            , enable:false
                        });

                    // 신분증유형            mathDocTp       (CRM024)
                         $("#mathDocTps").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:mathDocTpList
                            , index:1
                            , enable:false
                        });

                     // 고객확보유형1      custHoldTp      (CRM008)
                         $("#custHoldTps").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:custHoldTpList
                            , index:0
                            , enable:false
                        });

                     // 고객확보유형2      custHoldTpDtl   (CRM***)
                         $("#custHoldTpDtls").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:custHoldTpDtlList
                            , index:0
                            , enable:false
                        });

                     // 선호연락방법       prefCommMthCd (CRM022)
                         $("#prefCommMthCds").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:prefCommMthCdList
                            , index:0
                            , enable:false
                        });

                     // 우선연락방식                       prefContactMthCd    (CRM022)
                         $("#prefContactMthCds").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:prefContactMthCdList
                            , index:0
                            , enable:false
                        });

                     // 우선연락시간                       prefContactTimeCd      (CRM027)
                         $("#prefContactTimeCds").kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            //, optionLabel:" "
                            , dataSource:prefContactTimeCdList
                            , index:0
                            , enable:false
                        });

                         $("#chgBuyYns").kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             , optionLabel:"<spring:message code='global.lbl.check' />"
                             , dataSource:chgBuyYnDS
                             , index:0
                             , enable:false
                         });

                         $("#purcCarBrandCds").kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             , dataValueField:"cmmCd"
                             //, optionLabel:" "
                             , dataSource:purcCarBrandCdDS
                             , index:0
                             , enable:false
                         });


                         $("#btnResetCustInfoTab").kendoButton({
                             click:function(e) {
                                 resetCustInfoTab();
                             }
                             , enable:false
                         });

                         $("#btnSearchCustInfoTab").kendoButton({
                             click:function(e) {

                                 console.log("+++++ cust No +++++");
                                 console.log($("#custNo").val());
                                 if ( dms.string.isEmpty($("#custNo").val())){
                                     dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                                     $("#custNo").focus();
                                     return false;
                                 }

                                 var custNo = $("#custNo").val();

                                 // form 데이터
                                 var param = {};
                                 param["sCustNo"] = custNo; // $("#custNo").val();
                                 param["sSearchRange"] = "MY";

                                 console.log("Customer Search!!!!");
                                 console.log(param);

                                 $.ajax({
                                     url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                                     ,data:JSON.stringify(param)
                                     ,type:'POST'
                                     ,dataType:'json'
                                     ,contentType:'application/json'
                                     ,error:function(jqXHR,status,error){
                                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                     }
                                 }).done(function(result) {
                                     console.log(result);

                                     if (result.custInfoDS.length != 0 ){
                                         console.log(result.custInfoDS[0]);
                                         $("#custNms").val(result.custInfoDS[0].custNm);
                                         $("#custNos").val(result.custInfoDS[0].custNo);
                                         $("#custTps").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                                         $("#custCds").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                                         $("#hpNos").val(result.custInfoDS[0].hpNo);
                                         $("#emailNms").val(result.custInfoDS[0].emailNm);
                                         $("#mngScIds").val(result.custInfoDS[0].mngScId);
                                         $("#mngTecIds").val(result.custInfoDS[0].mngTecId);
                                         $("#wechatIds").val(result.custInfoDS[0].wechatId);
                                         $("#qqIds").val(result.custInfoDS[0].qqId);
                                         $("#telNos").val(result.custInfoDS[0].telNo);
                                         $("#prefCommMthCds").data("kendoExtDropDownList").value(result.custInfoDS[0].prefCommMthCd);
                                         $("#custHoldTps").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                                         $("#custHoldTpDtls").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                                         $("#mathDocTps").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                                         $("#ssnCrnNos").val(result.custInfoDS[0].ssnCrnNo);
                                         $("#officeTelNos").val(result.custInfoDS[0].officeTelNo);
                                         $("#officeFaxNos").val(result.custInfoDS[0].officeFaxNo);
                                         $("#sexCds").data("kendoExtDropDownList").value(result.custInfoDS[0].sexCd);
                                         $("#prefContactMthCds").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactMthCd);
                                         $("#prefContactTimeCds").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactTimeCd);
                                         $("#prefCommNos").val(result.custInfoDS[0].prefCommNo);
                                         $("#siebelRowIds").val(result.custInfoDS[0].siebelRowId);
                                         $("#buyCnts").val(result.custInfoDS[0].buyCnt);
                                         $("#chgBuyYns").data("kendoExtDropDownList").value(result.custInfoDS[0].chgBuyYn);
                                         $("#purcCarBrandCds").data("kendoExtDropDownList").value(result.custInfoDS[0].purcCarBrandCd);
                                         $("#purcCarModelNms").val(result.custInfoDS[0].purcCarModelNm);

                                         // CheckBox
                                         var bhmcYn = result.custInfoDS[0].bhmcYn;

                                         if (bhmcYn == 'Y'){ $("#bhmcYns").prop("checked", true) };
                                     }

                                     // 주소 조회
                                     var addrGrid = $("#addrGrid").data("kendoExtGrid");
                                     addrGrid.dataSource.read();

                                 });
                             }
                             , enable:false

                        });

                         // 고객상세 주소 그리드
                         $("#addrGrid").kendoExtGrid({
                             dataSource:{
                                 transport:{
                                     read:{
                                         url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                                     }
                                     ,parameterMap:function(options, operation) {
                                         if (operation === "read") {

                                             var params = {};

                                             params["recordCountPerPage"]    = options.pageSize;
                                             params["pageIndex"]             = options.page;
                                             params["firstIndex"]            = options.skip;
                                             params["lastIndex"]             = options.skip + options.take;
                                             params["sort"]                  = options.sort;
                                             params["sRefTableNm"]           = "CR_0101T";
                                             params["sRefKeyNm"]             = $("#custNo").val();

                                             console.log(params);
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
                                                 seq:{type:"string", editable:false}
                                                 ,rnum  :{type:"number" , editable:false}
                                                 ,addrTp:{type:"string", editable:false}
                                                 ,zipCd:{type:"string", editable:false}
                                                 ,sungCd:{type:"string", editable:false}
                                                 ,cityCd:{type:"string", editable:false}
                                                 ,distCd:{type:"string", editable:false}
                                                 ,sungNm:{type:"string", editable:false}
                                                 ,cityNm:{type:"string", editable:false}
                                                 ,distNm:{type:"string", editable:false}
                                                 ,addrNm:{type:"string", editable:false}
                                                 ,addrDetlCont:{type:"string", editable:false}
                                                 ,flagYn:{type:"string", editable:false}
                                                 ,refTableNm:{type:"string", editable:false}
                                                 ,refKeyNm:{type:"string", editable:false}
                                                 ,useYn:{type:"string", editable:false}
                                             }
                                         }
                                 }
                                 ,requestEnd:function(e){
                                     if (e.type !== "read"){
                                         //this.page(1);
                                     }
                                 }
                             }
                             ,autoBind:false
                             ,pageable:false
                             ,navigatable:false
                             ,height:150
                             ,columns:[
                                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
                                ,{field:"flagYn", title:"<spring:message code='global.lbl.typicalCar' />", width:100
                                    ,attributes:{"class":"ac"}
                                    ,template:function(dataItem) {
                                        if (dataItem.flagYn == "Y") {
                                            return "<input type='checkbox' name='flagYn' data-uid='" + dataItem.uid + "' class='flagYn' checked />"
                                        } else {
                                            return "<input type='checkbox' name='flagYn' data-uid='" + dataItem.uid + "' class='flagYn' />"
                                        }
                                    }
                                }
                                ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}
                                    , editor:function(container, options){
                                        $('<input data-bind="value:' + options.field + '"  />')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            dataTextField:"cmmCdNm"
                                            , dataValueField:"cmmCd"
                                            , dataSource:addrTpList
                                        });
                                    }
                                    , template:'#if (addrTp !== ""){# #= addrTpMap[addrTp]# #}#'
                                }       // 주소유형
                                ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
                                ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
                                ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}}       // 지역
                                ,{field:"addrNm", hidden:true}       // 주소
                                ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:200, attributes:{"class":"al"}}       // 상세주소
                                ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:100, attributes:{"class":"ac"}}       // 우편번호
                                ,{field:"useYn", title:"<spring:message code='global.lbl.validYn' />", width:100, attributes:{"class":"ac"}
                                    , editor:function(container, options){
                                        $('<input data-bind="value:' + options.field + '"  />')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            dataTextField:"cmmCdNm"
                                            , dataValueField:"cmmCd"
                                            , dataSource:chgBuyYnDS
                                        });
                                    }
                                    , template:'#if (addrTp !== ""){# #= chgBuyYnMap[addrTp]# #}#'
                                }       // 사융유무
                                ,{title:""}
                             ]

                         });

                    /******************************************************
                    * 고객상세정보 탭 (스크립트2)- 끝
                    ******************************************************/


                    // s관심차종
                    $("#sIntrCarLine").kendoExtDropDownList({
                        dataSource:carLineCdDSList
                        , dataTextField:"carlineNm"
                        , dataValueField:"carlineCd"
                        , optionLabel:" "
                        , index:0
                        , select:selectCarlineCd
                    });

                    // s관심모델
                    $("#sIntrModel").kendoExtDropDownList({
                        dataSource:modelCdDSList
                        , autoBind:false
                        , dataTextField:"modelNm"
                        , dataValueField:"modelCd"
                        //, optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        //, index:0
                    });

                    // s전출상태
                    $("#sTrsfStatCd").kendoExtDropDownList({
                        dataSource:trsfStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // S판매기회단계
                    $("#sSaleOpptStepCd").kendoExtDropDownList({
                        dataSource:saleOpptStepCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s판매고문
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // 판매기회단계
                    $("#saleOpptStepCd").kendoExtDropDownList({
                        dataSource:saleOpptStepCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                    });

                    // 성공확률
                    $("#succPrbCd").kendoExtDropDownList({
                        dataSource:succPrbCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 판매기회출처
                    $("#saleOpptSrcCd").kendoExtDropDownList({
                        dataSource:saleOpptSrcCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 전출상태
                    $("#trsfStatCd").kendoExtDropDownList({
                        dataSource:trsfStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 등록 시작일
                    $("#sStartRegDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 등록 종료일
                    $("#sEndRegDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 예상판매일
                    $("#expcSaleDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 휴대전화
                    $("#hpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // 메시지
                    $("#btnMessage").kendoButton({
                        click:function(e){

                            messagePopupWindow = dms.window.popup({
                                windowId:"messagePopupWindow"
                                , title:"<spring:message code='global.title.msgTransmission' />"   // 메시지전송
                                , content:{
                                    url:"<c:url value='/crm/cmm/customerInfo/selectMessagePopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        , "custNm"         :$("#custNm").val()
                                        , "custNo"         :$("#custNo").val()
                                        , "hpNo"           :$("#hpNo").val()
                                        , "contactBizCd"   :"03"                      // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07)
                                        , "refTableNm"     :"CR_0201T"                // 참조테이블
                                        , "refKeyNm"       :$("#saleOpptNo").val()   // 참조키
                                        , "callbackFunc":function(data){

                                            if(data == "SUCCESS"){
                                                // 전송 / 이 완료 되었습니다.
                                                dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                                // 초기화
                                                //$("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                                                //initForm();

                                            }

                                        }
                                    }
                                }
                            });

                        }
                        , enable:false
                    });

                    // 활동
                    $("#btnActive").kendoButton({
                        click:function(e){

                            //window.open("<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarMain.do' />"); //활동 관리
                            //window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.activeMng' />", "<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarMain.do' />", "VIEW-I-10254"); //활동 관리

                            //var schedulerSeq = $("#schedulerSeq").val();
                            //var start = new Date($("#start").val());

                            var custNo = $("#custNo").val();

                            if( dms.string.isEmpty(custNo) ){
                                // 고객 / 을(를) 선택해주세요.
                                dms.notification.info("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                                return;
                            }


                            // 영업활동 스케줄 팝업 호출
                            popupUrl = "<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarPopup.do'/>"
                            popupWindowId = "salesActivePopup"
                            popupTitle =  "<spring:message code='crm.menu.salesActiveScheduler' />"  // 영업활동 스케줄

                            popupWindow = dms.window.popup({
                                windowId:popupWindowId
                                ,title:popupTitle
                                ,content:{
                                    url:popupUrl
                                    , data:{

                                        "autoBind":false
                                        //,"schedulerSeq":schedulerSeq
                                        //,"start":start

                                        // 신규등록일때 전송할 정보
                                        ,"custNo":custNo
                                        ,"custNm":$("#custNm").val()
                                        ,"saleOpptNo":$("#saleOpptNo").val()
                                        ,"hpNo":$("#hpNo").data("kendoMaskedTextBox").value()
                                        ,"scId":$("#scId").val()
                                        ,"scNm":$("#scNm").val()
                                        // 신규등록일때 전송할 정보

                                        ,"callbackFunc":function(data){

                                            console.log("callbackFunc")
                                            console.log(data)

                                            if ( data == "SUCCESS" ) {
                                                // 예약 / 이 완료 되었습니다.
                                                dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                                $("#activeGrid").data("kendoExtGrid").dataSource.read();
                                                popupWindow.close();

                                            }

                                        }
                                    }
                                }

                            })
                        }

                        , enable:false
                    });

                    // 실패
                    $("#btnFail").kendoButton({
                        click:function(e){
                            failPopup();
                        }
                        , enable:false
                    });

                    // 재오픈 ( 판매기회단계 상태:실패시 재오픈 )
                    $("#btnReOpen").kendoButton({
                        click:function(e){
                            // 판매기회단계 상태 변경 ( CRM211 / 03:A-7일~1개월)
                            saleOpptStepUpdt("03");
                        }
                        , enable:false
                    });

                    // 성공
                    $("#btnSuccess").kendoButton({
                        click:function(e){

                            var saleOpptNo = $("#saleOpptNo").val();
                            if( dms.string.isNotEmpty(saleOpptNo) ){
                                // 성공상태로 변경한경우 계약화면 윈도우 오픈
                                //window.open("<c:url value='/sal/cnt/contractRe/selectContractReMain.do' />?saleOpptNo="+saleOpptNo)
                                window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.contMgmt' />", "<c:url value='/sal/cnt/contractRe/selectContractReMain.do' />?saleOpptNo="+saleOpptNo); //계약품의관리
                            }


                        }
                        , enable:false
                    });
/*
                    // 전출요청
                    $("#btnTrsfReq").kendoButton({
                        click:function(e){
                            // 전출상태 변경 ( CRM219 / 01:전출요청 )
                            trsfStatUpdt("01");
                        }
                        , enable:false
                    });

                    // 전출승인
                    $("#btnTrsfApprover").kendoButton({
                        click:function(e){
                            // 전출상태 변경 ( CRM219 / 02:전출확인 )
                            trsfStatUpdt("02");
                        }
                        , enable:false
                    });
 */
                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#salesOpptGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });

                    var validator = $("#salesOpptMgmtInputForm").kendoExtValidator().data("kendoExtValidator");

                    // 저장
                    $("#btnSomSave").kendoButton({
                        click:function(e){

                            if (validator.validate()) {

                                var saveFormData = $("#salesOpptMgmtInputForm").serializeObject(
                                        $("#salesOpptMgmtInputForm").serializeArrayInSelector("[data-json-obj='true']")
                                    )
                                var expcSaleDt = $("#expcSaleDt").data("kendoExtMaskedDatePicker").value();

                                if( !dms.string.isEmpty( expcSaleDt ) ){
                                    saveFormData.expcSaleDt = $("#expcSaleDt").data("kendoExtMaskedDatePicker").value();
                                }

                                console.log("saveFormData:"+JSON.stringify(saveFormData));

                                // 관심차 그리드 validation
                                var carGrid = $("#carGrid").data("kendoExtGrid");
                                var saveGridData = carGrid.getCUDData("insertList", "updateList", "deleteList");

                                var insertList = saveGridData.insertList.length;        // grid insert 항목 // 수정일때..
                                var gridDataLength;                                     // grid data 수량     // 신규일때(dataSource를 안불러옴), 수정일때 ..
                                if( dms.string.isEmpty($("#saleOpptNo").val()) ){
                                    gridDataLength = 0;
                                }else{
                                    gridDataLength = carGrid._data.length;
                                }

                                var gridDataChk = parseInt(insertList)+parseInt(gridDataLength);

                                // 리드번호로 조회한 관심차종 validation
                                if( dms.string.isNotEmpty($("#sLeadNo").val()) || dms.string.isNotEmpty($("#sVsitNo").val()) ){
                                    gridDataChk = carGrid.dataSource.view().length;
                                    console.log("gridDataChk:"+gridDataChk)
                                }

                                // 관심차 필수 체크
                                if(gridDataChk < 1 ){
                                    // 관심차 / 을(를) 선택하여주해주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.intrCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                    return;
                                }

                                // 그리드 무결성 점검
                                var dataValidate = false;
                                $.each(saveGridData.insertList, function(idx, row){
                                    if(row.carlineCd == ""){
                                       // 선택하지 않은 차종이 있습니다.
                                       dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCarLine}' />");
                                       dataValidate = true;
                                       return false;
                                    }
                                    if(row.modelCd == ""){
                                        // 선택하지 않은 모델이 있습니다.
                                        dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                                        dataValidate = true;
                                        return false;
                                     }
                                    if(row.extColorCd == ""){
                                        // 선택하지 않은 외장색이 있습니다.
                                        dms.notification.info("<spring:message code='crm.lbl.extColorCd' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                                        dataValidate = true;
                                        return false;
                                     }
                                    if(row.intColorCd == ""){
                                        // 선택하지 않은 내장색이 있습니다.
                                        dms.notification.info("<spring:message code='crm.lbl.intColorCd' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                                        dataValidate = true;
                                        return false;
                                     }
                                 });

                                if(dataValidate){ return false; }

                                //TODO 관심 체크박스 editable 확인 ( 행추가 신규 등록시 input box 로 나옴 )
                                if($("input.flagYn:checked", "#carGrid").length != 1 ){
                                    // 관심 / 을(를) 선택해주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.typicalCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                    return false;
                                }

                                // 리드번호로 조회한 관심차종은 등록할때 insertList 로 등록한다.
                                if( dms.string.isNotEmpty($("#sLeadNo").val()) || dms.string.isNotEmpty($("#sVsitNo").val()) ){

                                    carGrid.dataSource._destroyed = [];
                                    saveGridData.insertList = [];
                                    saveGridData.updateList = [];
                                    saveGridData.deleteList = [];

                                    var carGridDs = carGrid.dataSource;
                                    var carGridData = carGridDs.view();         // insert에 담을 데이터를 만든다
                                    var carGridSize = carGridData.length;


                                  for(var i = 0; i < carGridSize; i = i + 1){

                                      var newCarGridData = {};
                                      //console.log(i + ":"+carGridData[i].flagYn);
                                      newCarGridData.seq = "";
                                      newCarGridData.carlineCd = carGridData[i].carlineCd;
                                      newCarGridData.carlineNm = carGridData[i].carlineNm;
                                      newCarGridData.modelCd = carGridData[i].modelCd;
                                      newCarGridData.modelNm = carGridData[i].modelNm;

                                      newCarGridData.extColorCd = carGridData[i].extColorCd;
                                      newCarGridData.extColorNm = carGridData[i].extColorNm;
                                      newCarGridData.intColorCd = carGridData[i].intColorCd;
                                      newCarGridData.intColorNm = carGridData[i].intColorNm;

                                      newCarGridData.flagYn = carGridData[i].flagYn;
                                      newCarGridData.refTableNm = "CR_0201T";
                                      newCarGridData.refKeyNm = "";

                                      saveGridData.insertList.push(newCarGridData);

                                  }

                                }

                                var saveData = $.extend(
                                        {"salesOpptMgmtVO":saveFormData}
                                        , saveGridData
                                )

                                //console.log("saveData:"+JSON.stringify(saveData));
                                console.log("saveData:",JSON.stringify(saveData));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/multiSalesOpptMgmts.do' />",
                                    data:JSON.stringify(saveData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR > 0 ){

                                            // 저장 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                            $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                                            var saleOpptNo = jqXHR;
                                            isGridReload = true;
                                            saleOpptMgmtNo = saleOpptNo;

                                        }else{
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                });



                            }




                        }
                    });

                    // 추가(초기화)
                    $("#btnReset").kendoButton({
                        click:function(e){

                            $("#salesOpptGrid").data("kendoExtGrid").dataSource.page(1);
                            initForm();

                        }

                    });

                    // 행추가 - carGrid
                    $("#btnAddVehic").kendoButton({
                        click:function(e) {

                            $("#carGrid").data("kendoExtGrid").dataSource.insert(0,{
                                seq:""

                                ,carlineCd  :""
                                ,carlineNm  :""
                                ,modelCd    :""
                                ,modelNm    :""
                                ,extColorCd :""
                                ,extColorNm :""
                                ,intColorCd :""
                                ,intColorNm :""

                                ,refTableNm:"CR_0201T"
                                ,flagYn:"N"
                            });
                        }
                    });

                    // 행삭제 - carGrid
                    $("#btnDelVehic").kendoButton({
                       click:function(e) {

                           var grid = $("#carGrid").data("kendoExtGrid");
                           var rows = grid.select();

                           rows.each(function(index, row) {
                               grid.removeRow(row);
                           });

                       }
                    });

                    // 취소 - carGrid
                    $("#btnCancelVehic").kendoButton({
                       click:function(e) {
                           $('#carGrid').data('kendoExtGrid').cancelChanges();
                       }
                    });

                    // 활동 탭 조회
                    $("#btnActiveListTab").kendoButton({
                        click:function(e){
                            $("#activeGrid").data("kendoExtGrid").dataSource.read();
                        }
                        , enable:false
                    });

                    // 메시지이력 탭 조회
                    $("#btnMsgHistoryTab").kendoButton({
                        click:function(e){
                            $("#msgHistoryGrid").data("kendoExtGrid").dataSource.read();
                        }
                        , enable:false
                    });

                    // HISTORY 탭 조회
                    $("#btnSalesOpptHistoryTab").kendoButton({
                        click:function(e){
                            $("#salesOpptHistorysGrid").data("kendoExtGrid").dataSource.read();
                        }
                        , enable:false
                    });

                    $(".tab_area").kendoExtTabStrip({
                        animation:false
                        /*
                        , select:function(e) {

                            var selectTabId = e.item.id;
                            var saleOpptNo = $("#saleOpptNo").val();

                            console.log("tab_area | saleOpptNo:"+saleOpptNo);

                            if(saleOpptNo != ""){

                                if (selectTabId == "custInfoTab") {
                                    $("#msgHistoryGrid").data("kendoExtGrid").dataSource.read();
                                } else if (selectTabId == "msgHistoryTab"){
                                    $("#msgHistoryGrid").data("kendoExtGrid").dataSource.read();
                                    $("#msgHistoryGrid").data("kendoExtGrid").dataSource.data([]);
                                } else if (selectTabId == "salesOpptHistoryTab") {
                                    $("#salesOpptHistorysGrid").data("kendoExtGrid").dataSource.read();
                                    $("#salesOpptHistorysGrid").data("kendoExtGrid").dataSource.data([]);
                                } else {
                                    $("#activeGrid").data("kendoExtGrid").dataSource.data([]);
                                }
                            }
                        }
                        */
                    });

                    /******************************************************
                     * 판매기회 관리 그리드 시작
                     ******************************************************/
                    $("#salesOpptGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sCustNm"]               = $("#sCustNm").val();
                                        params["sIntrCarLine"]          = $("#sIntrCarLine").data("kendoExtDropDownList").value();
                                        params["sIntrModel"]            = $("#sIntrModel").data("kendoExtDropDownList").value();
                                        params["sTrsfStatCd"]           = $("#sTrsfStatCd").data("kendoExtDropDownList").value();
                                        params["sSaleOpptStepCd"]       = $("#sSaleOpptStepCd").data("kendoExtDropDownList").value();
                                        params["sScId"]                 = $("#sScId").data("kendoExtDropDownList").value();
                                        params["sStartRegDt"]           = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndRegDt"]             = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("salesOpptGrid:" + kendo.stringify(params));
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
                                        id:"saleOpptNo"
                                        ,fields:{
                                            rnum:{type:"number"}
                                            ,saleOpptNo:{type:"string"}
                                            ,custNm:{type:"string"}
                                            ,carlineNm:{type:"string"}
                                            ,modelNm:{type:"string"}
                                            ,expcSaleDt:{type:"date"}
                                            ,succPrbCd:{type:"string"}
                                            ,saleOpptSrcCd:{type:"string"}
                                            ,saleOpptStepCd:{type:"string"}
                                            ,scNm:{type:"string"}
                                            ,regDt:{type:"date"}
                                        }
                                    }
                            }
                        }
                        ,change:function(e){

                            var selectedVal = this.dataItem(this.select());
                            var saleOpptNo = selectedVal.saleOpptNo;

                            if( dms.string.isNotEmpty(saleOpptNo) ){
                                saleOpptMgmtByKey(saleOpptNo);
                            }

                        }
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var grid        = $("#salesOpptGrid").data("kendoExtGrid")
                            , rows = grid.tbody.find("tr")
                            , gridData
                            , selectRow
                            , saleOpptNo;

                            saleOpptNo = saleOpptMgmtNo;

                            if ( isGridReload && dms.string.isNotEmpty(saleOpptNo) ) {

                                rows.each(function(index, row) {

                                    gridData = grid.dataSource.at(index);

                                    if ( gridData.saleOpptNo === saleOpptNo ) {

                                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                        grid.select(selectRow);
                                    }

                                });

                                isGridReload = false;

                            }

                        }
                        ,editable:false
                        ,height:304
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                                    //{field:"saleOpptNo", title:"SEQ", width:60},
                                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                        , attributes:{"class":"ac"}
                                    }
                                    ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100        // 고객명
                                        ,template:function(dataItem){
                                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                            return spanObj;
                                        }
                                    }
                                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                        , template:'#= custCdVal(custCd)#'
                                    }
                                    ,{field:"remark", title:"<spring:message code='crm.lbl.saleRemark' />", width:200}                /* 판매개회 개술 */
                                    ,{field:"carlineNm", title:"<spring:message code='global.lbl.intrCarLine' />", width:150}         /* 관심차종 */
                                    ,{field:"modelNm", title:"<spring:message code='global.lbl.intrModel' />", width:220}             /* 관심모델 */
                                    ,{field:"expcSaleDt", title:"<spring:message code='global.lbl.expcSaleDt' />", width:100          /* 예상판매일자 */
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{field:"succPrbCd", title:"<spring:message code='global.lbl.succPrbCd' />", width:100            /* 성공확률 */
                                        , attributes:{"class":"ac"}
                                        , template:'#= succPrbCdArrVal(succPrbCd)#'
                                    }
                                    ,{field:"saleOpptSrcCd", title:"<spring:message code='global.lbl.saleOpptSrcCd' />", width:100    /* 판매기회출처 */
                                        , sortable:false, template:'#= saleOpptSrcCdArrVal(saleOpptSrcCd)#'
                                    }
                                    ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:150  /* 판매기회단계 */
                                        , sortable:false, template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                                    }
                                    ,{field:"scId", title:"<spring:message code='sal.lbl.salesAdvisor' />", width:100                 /* 판매고문 */
                                        , template:'#= usersArrVal(scId)#'
                                    }
                                    ,{field:"trsfStatCd", title:"<spring:message code='global.lbl.trsfStatCd' />", width:100          /* 전출상태 */
                                        , sortable:false, attributes:{"class":"ac"}
                                        , template:'#= trsfStatCdArrVal(trsfStatCd)#'
                                    }
                                    ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                        ]
                    });
                    /******************************************************
                     * 판매기회 관리 그리드 종료
                     ******************************************************/


                    /******************************************************
                     * 관심차종 그리드 시작
                     ******************************************************/
                    var carGridRefTableNm = "";
                    var carGridRefKeyNm = "";
                    $("#carGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cmm/carLineInfo/selectCarLineInfo.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;


                                        var grid = $("#salesOpptGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());

                                        if( dms.string.isNotEmpty(selectedVal) ){
                                            params["sRefTableNm"] = "CR_0201T";
                                            params["sRefKeyNm"] = selectedVal.saleOpptNo;
                                        }else{
                                            params["sRefTableNm"] = carGridRefTableNm;
                                            params["sRefKeyNm"] = carGridRefKeyNm;
                                        }

                                        console.log('carGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                         seq           :{type:"string"}
                                        ,rnum          :{type:"number" , editable:false}
                                        ,carlineCd     :{type:"string"}
                                        ,carlineNm     :{type:"string"}
                                        ,modelCd       :{type:"string"}
                                        ,modelNm       :{type:"string"}
                                        ,extColorCd    :{type:"string"}
                                        ,extColorNm    :{type:"string"}
                                        ,intColorCd    :{type:"string"}
                                        ,intColorNm    :{type:"string"}
                                        ,flagYn        :{type:"string", editable:true}
                                        ,regDt         :{type:"date"}
                                        ,updtDt        :{type:"date"}
                                    }
                                }
                            }
                        }
                        ,editableOnlyNew:true
                        ,editableOnlyNewExcludeColumns:["modelCd","extColorCd"]
                        ,multiSelectWithCheckbox:true
                        ,autoBind:false
                        //,editable:false
                        ,height:118
                        ,navigatable:false
                        ,pageable:false
                        ,sortable:false
                        ,selectable:"multiple"
                       ,dataBound:function(e) {

                           var disabled = false;

                           var grid = $("#salesOpptGrid").data("kendoExtGrid");
                           var dataItem = grid.dataItem(grid.select());

                           if( dms.string.isNotEmpty(dataItem) ){

                               if( dataItem.saleOpptStepCd == "07" || dataItem.saleOpptStepCd == "01"  || dataItem.saleOpptStepCd == "06"  || dataItem.saleOpptStepCd == "08" ){
                                   disabled = true;
                                   $(".checkAll", "#carGrid").prop("disabled", disabled);
                               }

                               var rows = this.tbody.find("tr");
                               rows.each(function(idx, row){
                                   $("input.grid-checkbox-item", row).prop("disabled", disabled);
                                   $("input.flagYn", row).prop("disabled", disabled);
                               });
                           }

                       }
                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }

                            ,{  // 관심차종
                                 field:"carlineCd"
                                ,title:"<spring:message code='global.lbl.intrCarLine' />"
                                ,width:150
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#=bf_selectCarLine(carlineCd)#"
                                ,editor:function (container, options){
                                    if( options.model.seq == "" || options.model.carlineCd == ""){
                                        $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            , dataTextField:"carlineNm"
                                            , dataValueField:"carlineCd"
                                            , dataSource:carLineCdDSList
                                            , select:selectGridCarlineCd
                                            /*
                                            , change:function(e){
                                                if(modelCdDSList == null){return false;}

                                                var grid = $("#carGrid").data("kendoExtGrid");
                                                var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(3)");
                                                grid.editCell(modelCell);

                                            }
                                            */
                                        });
                                    }else{
                                        container.context.innerText = dms.string.strNvl(carLineCdObj[options.model.carlineCd]);
                                    }
                                }
                            }
                            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
                            ,{    // 관심모델
                                 field:"modelCd"
                                ,title:"<spring:message code='global.lbl.intrModel' />"
                                ,width:150
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#= bf_selectModel(modelCd, modelNm) #"
                                ,editor:function (container, options){

                                    if(     options.model.carlineCd != "" && (options.model.modelCd == "" || options.model.seq == "") ){
                                        $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            ,dataTextField:"modelNm"
                                            ,dataValueField:"modelCd"
                                            ,dataSource:modelCdDSList
                                            , select:selectGridModelCd
                                            /*
                                            , change:function(e){

                                                if(extColorCdDSList == null){return false;}

                                                var grid = $("#carGrid").data("kendoExtGrid");
                                                var extColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(5)");

                                                grid.editCell(extColorCell);

                                            }
                                            */
                                        });
                                    }else{
                                        if(options.model.modelNm != ""){
                                            container.context.innerText = options.model.modelNm;
                                        }else{
                                            // 관심차종 / 을(를) 선택해주세요.
                                            container.context.innerText = "<spring:message code='global.lbl.intrCarLine' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                       }
                                   }
                               }
                           }
                           ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
                           ,{    // 외장색
                                 field:"extColorCd"
                                ,title:"<spring:message code='global.lbl.extColor' />"
                                ,width:100
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#= bf_selectExtColor(extColorCd, extColorNm) #"
                                ,editor:function (container, options){

                                    if( options.model.modelCd != "" && (options.model.extColorCd == "" || options.model.seq == "" ) ){
                                        $('<input name="extColorCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            ,dataTextField:"extColorNm"
                                            ,dataValueField:"extColorCd"
                                            ,dataSource:extColorCdDSList
                                            ,select:selectGridExtColorCd
                                            /*
                                            ,change:function(e){
                                                if(intColorCdDSList == null){return false;}

                                                var grid = $("#carGrid").data("kendoExtGrid");
                                                var intColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(7)");
                                                grid.editCell(intColorCell);
                                            }
                                            */
                                        });
                                    }else{
                                        if(options.model.extColorNm != ""){
                                            container.context.innerText = options.model.extColorNm;
                                        }else{
                                            // 관심모델 / 을(를) 선택해주세요.
                                            container.context.innerText = "<spring:message code='global.lbl.intrModel' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                        }
                                    }
                                }
                            }
                            ,{field:"extColorCd", hidden:true}       // 외장색
                            ,{    // 내장색
                                 field:"intColorCd"
                                ,title:"<spring:message code='global.lbl.intColor' />"
                                ,width:100
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#= bf_selectIntColor(intColorCd, intColorNm) #"
                                ,editor:function (container, options){

                                    if(     options.model.extColorCd != "" && (options.model.intColorCd == "" || options.model.seq == "") ){
                                        $('<input name="intColorCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            ,dataTextField:"intColorNm"
                                            ,dataValueField:"intColorCd"
                                            ,dataSource:intColorCdDSList
                                            ,select:selectGridIntColorCd
                                        });
                                    }else{
                                        if(options.model.intColorNm != ""){
                                            container.context.innerText = options.model.intColorNm;
                                        }else{
                                            // 외장색 / 을(를) 선택해주세요.
                                            container.context.innerText = "<spring:message code='crm.lbl.extColorCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                        }
                                    }
                                }
                            }
                            ,{field:"intColorNm", hidden:true}       // 내장색

                            ,{title:"<spring:message code='global.lbl.typicalCar' />", template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:45, attributes:{"class":"ac"}}
                            ,{title:""}
                       ]
                   });
                    /******************************************************
                     * 관심차종 그리드 종료
                     ******************************************************/


                    /******************************************************
                     * 판매기회 실패 상세 그리드 시작
                     ******************************************************/
                    $("#salesOpptFailDetlGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptFailMgmt/selectSalesOpptFailDetlMgmts.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        var grid = $("#salesOpptGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sSaleOpptNo"] = selectedVal.saleOpptNo;
                                        } else {
                                            return;
                                        }

                                        console.log('salesOpptFailDetlGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                        rnum:{type:"number"}
                                        ,seq:{type:"number"}
                                        ,saleOpptNo:{type:"string"}
                                        ,failTpCd   :{type:"string"}
                                        ,failCau1Cd:{type:"string"}
                                        ,failCau2Cd:{type:"string"}
                                        ,failBrandCd:{type:"string"}
                                        ,failModelCd:{type:"string"}
                                        ,regDt:{type:"date"}
                                    }
                                }
                            }
                        }
                        ,autoBind:false
                        ,editable:false
                        ,height:118
                        ,navigatable:false
                        ,pageable:false
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"failTpCd", title:"<spring:message code='global.lbl.failTpCd' />", width:100          /* 실패유형 */
                                , template:"#=failTpCdArrVal(failTpCd)#"
                            }
                            ,{field:"failCau1Cd", title:"<spring:message code='global.lbl.failCau1Cd' />", width:180      /* 실패1급원인 */
                                , template:"#=failCau1CdArrVal(failCau1Cd)#"
                            }
                            ,{field:"failCau2Cd", title:"<spring:message code='global.lbl.failCau2Cd' />", width:180      /* 실패2급원인 */
                                , template:"#=failCau2CdArrVal(failCau2Cd)#"
                            }
                            ,{field:"failBrandCd", title:"<spring:message code='global.lbl.failBrandCd' />", width:100    /* 실패브랜드 */
                                , template:"#=brandCdArrVal(failBrandCd)#"
                            }
                            ,{field:"failModelCd", title:"<spring:message code='global.lbl.failModelCd' />", width:200}   /* 실패차형 */
                            //,{title:""}
                        ]
                    });
                    /******************************************************
                     * 판매기회 실패 상세 그리드 종료
                     ******************************************************/


                    /******************************************************
                     * 활동 그리드 시작
                     ******************************************************/
                    $("#activeGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesActives.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        var grid = $("#salesOpptGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sSaleOpptNo"] = selectedVal.saleOpptNo;
                                        } else {
                                            return;
                                        }

                                        console.log('activeGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"salesActiveNo"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,salesActiveNo:{type:"string"}
                                        ,scNm:{type:"string"}
                                        ,salesActiveStatCd:{type:"string"}
                                        ,planStartDt:{type:"date"}
                                        ,planEndDt:{type:"date"}
                                        ,activeStartDt:{type:"date"}
                                        ,activeEndDt:{type:"date"}
                                        ,salesActiveTpCd:{type:"string"}
                                        ,activeCont:{type:"string"}
                                        ,activeRsltCont:{type:"string"}
                                        ,saleOpptNo:{type:"string"}
                                        ,custNm:{type:"string"}
                                        ,prefCommNo:{type:"string"}
                                        ,regDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                    }
                                }
                            }
                        }
                        ,autoBind:false
                        ,editable:false
                        ,height:256
                        ,navigatable:false
                        ,pageable:false
                        ,sortable:false
                        //,selectable:"row"
                        ,columns:[

                                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                        ,attributes:{"class":"ac"}
                                    }
                                    ,{field:"salesActiveStatCd", title:"<spring:message code='crm.lbl.salesActiveStatCd' />", width:100       /* 영업활동상태 */
                                        , attributes:{"class":"ac"}
                                        , template:'#= salesActiveStatCdArrVal(salesActiveStatCd)#'
                                    }
                                    ,{field:"planStartDt", title:"<spring:message code='crm.lbl.planStartDt' />", width:120                   /* 계획시작일자 */
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                                    }
                                    ,{field:"planEndDt", title:"<spring:message code='crm.lbl.planEndDt' />", width:120                       /* 계획종료일자 */
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                                    }
                                    ,{field:"salesActiveTpCd", title:"<spring:message code='crm.lbl.salesActiveTpCd' />", width:100           /* 영업활동유형 */
                                        , attributes:{"class":"ac"}
                                        , template:'#= salesActiveTpCdArrVal(salesActiveStatCd)#'
                                    }
                                    ,{field:"activeCont", title:"<spring:message code='crm.lbl.activeCont' />", width:100}                    /* 활동내용 */
                                    ,{field:"activeRsltCont", title:"<spring:message code='global.lbl.activeRsltCont' />", width:200}         /* 활동결과 */
                                    ,{field:"saleOpptNo", title:"<spring:message code='global.lbl.saleOpptSeq' />", width:100}                /* 판매기회번호 */
                                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}                         /* 고객명 */
                                    /*     TODO 하위 탭인데도 고객명에 링크 걸어야 하나?
                                    ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100            // 고객명
                                        ,template:function(dataItem){
                                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                            return spanObj;
                                        }
                                    }
                                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                        , template:'#= custCdVal(custCd)#'
                                    }
                                     */
                                    ,{field:"prefCommNo", title:"<spring:message code='global.lbl.prefCommNo' />", width:100}                 /* 선호연락처 */

                        ]
                   });
                    /******************************************************
                     * 활동 그리드 종료
                     ******************************************************/

                    /******************************************************
                     * 메시지이력 그리드 - 시작
                     ******************************************************/
                    $("#msgHistoryGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectMsgHistorys.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        var grid = $("#salesOpptGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sRefKeyNm"] = selectedVal.saleOpptNo;
                                        } else {
                                            return;
                                        }


                                        console.log('msgHistoryGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"contactNo",
                                    fields:{
                                          contactNo:{type:"number"}
                                         ,contactStatCd:{type:"string"}
                                         ,contactTp:{type:"string"}
                                         ,contactCont:{type:"string"}
                                         ,regDt        :{type:"date"}
                                    }
                                }
                            }
                        }
                    ,autoBind:false
                    ,editable:false
                    ,height:256
                    ,navigatable:false
                    ,pageable:false
                    ,sortable:false
                    //,selectable:"row"
                    ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"regDt", title:"<spring:message code='global.crm.contactDt' />", width:100                /* 연락일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"contactStatCd", title:"<spring:message code='global.lbl.contactStatCd' />", width:100    /* 유형 */
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"contactTp", title:"<spring:message code='global.lbl.contactTp' />", width:100            /* 연락방법 */
                                , template:'#= contactTpArrVal(contactTp)#'
                            }
                            ,{field:"contactCont", title:"<spring:message code='global.lbl.contactCont' />"}       /* 연락내용 */
                            //,{title:""}
                    ]
                   });
                    /******************************************************
                     * 메시지이력 그리드 - 종료
                     ******************************************************/

                    /******************************************************
                    * 판매기회 히스토리 그리드 시작
                    ******************************************************/
                    $("#salesOpptHistorysGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptHistorys.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        var grid = $("#salesOpptGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sSaleOpptNo"] = selectedVal.saleOpptNo;
                                        } else {
                                            return;
                                        }

                                        console.log('salesOpptHistorysGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                        rnum:{type:"number"}
                                        ,seq:{type:"number"}
                                        ,saleOpptNo:{type:"string"}
                                        ,expcSaleDt:{type:"date"}
                                        ,succPrbCd:{type:"string"}
                                        ,saleOpptSrcCd:{type:"string"}
                                        ,saleOpptStepCd:{type:"string"}
                                        ,regDt:{type:"date"}
                                    }
                                }
                            }
                        }
                       ,autoBind:false
                       ,editable:false
                       ,height:256
                       ,navigatable:false
                       ,pageable:false
                       ,sortable:false
                       //,selectable:"row"
                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:100                  /* BHMC여부 */
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"expcSaleDt", title:"<spring:message code='global.lbl.expcSaleDt' />", width:100          /* 예상판매일자 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"succPrbCd", title:"<spring:message code='global.lbl.succPrbCd' />", width:100            /* 성공확률 */
                                , attributes:{"class":"ac"}
                                , template:'#= succPrbCdArrVal(succPrbCd)#'
                            }
                            ,{field:"saleOpptSrcCd", title:"<spring:message code='global.lbl.saleOpptSrcCd' />", width:100    /* 판매기회출처 */
                                , template:'#= saleOpptSrcCdArrVal(saleOpptSrcCd)#'
                            }
                            ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:150  /* 판매기회단계 */
                                , template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                            }
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{title:""}

                        ]
                    });
                    /******************************************************
                    * 판매기회 히스토리 그리드 종료
                    ******************************************************/


                    // 리드 / 내방에서 넘어왔을때 관심차종 set
                    <c:if test="${customerInfoVO != ''}">

                        var vsitNo = "<c:out value='${vsitNo}' />"
                        var leadNo = "<c:out value='${leadNo}' />"

                        console.log("vsitNo:",vsitNo)
                        console.log("vsitNo:",leadNo)

                        // TODO 관심차노출 기준:리드기준?   - 리드에는 없고, 내방에 있는경우?
                        if ( dms.string.isNotEmpty(leadNo) ) {

                            carGridRefTableNm = "CR_0202T"
                            carGridRefKeyNm = leadNo

                        } else if (dms.string.isNotEmpty(vsitNo)) {

                            carGridRefTableNm = "CR_0206T"
                            carGridRefKeyNm = vsitNo

                        }

                        console.log("carGridRefTableNm:",carGridRefTableNm)
                        console.log("carGridRefKeyNm:",carGridRefKeyNm)

                        // 내방예약 정보의 판매고문으로 set
                        $("#scId").val("<c:out value='${customerInfoVO.custInfoDS[0].mngScId}' />");
                        $("#scNm").val("<c:out value='${customerInfoVO.custInfoDS[0].mngScNm}' />");

                        $("#carGrid").data("kendoExtGrid").dataSource.read();

                        // 리드번호가 있으면 판매기회 출처:전시방 방문으로 설정
                        $("#saleOpptSrcCd").data("kendoExtDropDownList").value("02");

                        $("#btnAddVehic").data("kendoButton").enable(true);        // 행추가
                        $("#btnDelVehic").data("kendoButton").enable(true);        // 행삭제
                        $("#btnCancelVehic").data("kendoButton").enable(true);     // 취소


                    </c:if>

                });

            </script>
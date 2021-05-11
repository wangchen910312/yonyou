<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 기본정보 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.leadMng' /></h1> <!-- 리드관리 -->
                    <div class="btn_right">
                        <!-- <spring:message code="global.btn.search" /></button> -->
                        <!-- 판매기회등록
                        <button type="button" class="btn_m" id="btnSomSave"><spring:message code='global.btn.saleOptyCreate' /></button>
                        -->
                        <!-- 판매기회바로가기 -->
                        <button type="button" class="btn_m" id="btnOpptLink"><spring:message code='crm.btn.opptLink' /></button>
                        <!-- 메시지 -->
                        <button type="button" class="btn_m" id="btnMessage"><spring:message code="global.btn.message" /></button>  <!-- 메시지 -->
                        <!-- 내방예약바로가기 -->
                        <button type="button" class="btn_m" id="btnVisitLink"><spring:message code='crm.btn.visitCustomerLink' /></button>
                        <!-- 시승예약 바로가기
                        <button type="button" class="btn_m" id="btnTestDriveLink"><spring:message code='crm.btn.tdrvResvLink' /></button>
                        -->
                         <!-- CLOSE (종료)
                        <button type="button" class="btn_m btn_save" id="btnLeadClose"><spring:message code='crm.btn.leadClose' /></button>
                        -->
                        <button type="button" class="btn_m btn_reset" id="btnSearchReset"><spring:message code="global.btn.init" /></button> <!-- 검색초기화 -->
                        <button type="button" class="btn_m btn_search" id="btnLeadSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                        <button type="button" class="btn_m btn_save" id="btnLeadSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                        <button type="button" class="btn_m btn_add" id="btnCustReset"><spring:message code="global.btn.add" /></button> <!--  추가 -->
                        <input type="hidden" class="btn_m btn_search" id="btnLeadDtlSearch">
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnLeadSearch">
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
                                <th scope="row"><spring:message code='global.lbl.leadSrc' /><!-- 리드출처 --></th>
                                <td>
                                    <input id="sLeadSrcCd" name="sLeadSrcCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input id="sCustNm" name="sCustNm" class="form_input"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="sHpNo" name="sHpNo" type="text" class="form_input numberic"  data-type="tel" pattern="\d" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.homeTelNo' /><!-- 집전화 --></th>
                                <td>
                                    <input id="sTelNo" name="sTelNo" type="text" class="form_input numberic"  data-type="tel" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.statNm' /></th> <!-- 상태 -->
                                <td>
                                    <input id="sStatCd" name="sStatCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></th>
                                <td>
                                    <input id="sMngScId" name="sMngScId" class="form_comboBox"  data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td>
                                    <input id="sBhmcYn" name="sBhmcYn" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.allocDt' /></th> <!-- 배정일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sAllocDtFrom" name="sAllocDtFrom" class="form_datepicker" data-json-obj="true" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sAllocDtTo" name="sAllocDtTo" class="form_datepicker" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="grid"></div>
                </div>
            </section>
            <section class="group">
                <!-- 리드기본정보 시작 -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.leadDtlInfo' /></h2> <!-- 리드상세정보 -->
                </div>
                <div id="leadForm">
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
                                <th scope="row"><spring:message code='global.lbl.leadNo' /></th> <!--  리드번호 -->
                                <td>
                                    <input id="leadNo" name="leadNo" type="text" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                <td class="required_area" >
                                    <input id="custNo" name="custNo" type="hidden"  data-json-obj="true" />
                                    <input id="updateTp" name="updateTp" type="hidden" data-json-obj="true" />
                                    <div class="form_search" >
                                        <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input onKey_down" />
                                        <input id="custNm" name="custNm" type="hidden"  class="form_input form_readonly" readonly data-json-obj="true" />
                                        <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                    </div>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.leadSrc' /></span></th> <!--  리드출처 -->
                                <td colspan="3" class="required_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.5%;" >
                                            <input id="leadSrcCd" name="leadSrcCd" type="text" class="form_comboBox"  data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.5%;">
                                            <input id="leadSrcDtl" name="leadSrcDtl" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custTp" /></span></th> <!-- 고객유형 개인/법인-->
                                <td >
                                    <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.hpNo' /></span></th> <!-- 휴대전화 -->
                                <td>
                                    <input id="hpNo" name="hpNo" type="tel" class="form_input numberic" data-type="mobile" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ddlnDt' /></th> <!-- 마감일자 -->
                                <td class="readonly_area">
                                    <input id="ddlnDt" name="ddlnDt" type="text" class="form_datepicker"  readonly />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.opptChgDt' /></th> <!--  기회전환일자 -->
                                <td class="readonly_area">
                                    <input id="opptChgDt" name="opptChgDt" type="text" class="form_datepicker"  readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.homeTelNo' /></th> <!-- 집전화 -->
                                <td>
                                    <input id="telNo" name="telNo" type="text" class="form_input numberic" data-type="tel" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td>
                                    <input id="officeTelNo" name="officeTelNo" type="text" class="form_input numberic"  data-type="tel" maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regUsrId' /></th> <!--  등록자 -->
                                <td>
                                    <input id="regUsrNm" name="regUsrNm" type="text" class="form_input form_readonly"  readonly />
                                    <input id="regUsrId" name="regUsrId" type="hidden"  />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt' /></th> <!-- 등록일 -->
                                <td class="readonly_area">
                                    <input id="regDt" name="regDt" type="text" class="form_datepicker"  readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.scId' /></th> <!-- 담당자 -->
                                <td>
                                    <input id="prsnId" name="prsnId" type="hidden" value="" data-json-obj="true" />
                                    <input id="prsnNm" name="prsnNm" type="hidden" value="" data-json-obj="true" />
                                    <input id="mngScNm" name="mngScNm" class="form_input form_readonly" readonly />
<!--                                     <div class="form_search" >
                                        <a href="#;" id="btnAddUser"></a>
                                    </div> -->
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.statNm' /></span></th> <!-- 상태 -->
                                <td>
                                    <input id="statCd" name="statCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row" rowspan="2"><spring:message code="global.lbl.remark" /></th> <!-- 비고 -->
                                <td colspan="3" rowspan="2">
                                    <textarea id="remark" name="remark" type="testarea" class="form_input" style="height:40px;" rows="3" data-json-obj="true" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td>
                                    <label class="label_check ml5"><input id="bhmcYn" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled /></label>
                                </td>
                                <th></th>
                                <td></td>
                                <input id="opptNo" name="opptNo" type="hidden" class="form_input form_readonly" readonly data-json-obj="true" />
                            </tr>
                        </tbody>
                    </table>
                </div>
                </div> <!--  // leadForm End -->
                <!-- 리드기본정보 끝 -->
            </section>

            <section class="group">
                <!-- 관심차종 시작 -->
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='global.title.intrCarLine' /></h3> <!-- 관심차종 -->
                    <div class="btn_right">
                      <%-- <button class="btn_s btn_save" id="btnSaveVehic" ><spring:message code="global.btn.save" /></button> <!-- 저장 --> --%>
                      <button class="btn_s btn_add" id="btnAddVehic" ><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                      <button class="btn_s btn_del" id="btnDelVehic" ><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="carGrid"></div>
                </div>
                <!-- //관심차종 끝 -->
            </section>
            <section class="group">
                <!-- 탭메뉴 전체 영역 -->
                <%-- <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.custinfo' /></h2> <!-- 고객정보 -->
                </div> --%>

                <div id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="callTab" class="k-state-active"><spring:message code='global.title.record' /><!-- 콜 --></li>
                        <li id="custInfoTab" ><spring:message code="global.lbl.custInfo" /><!-- 고객정보 --></li>
                        <li id="msgHistTab"><spring:message code='global.lbl.msgHistory' /> <!-- 메시지이력 --></li>
                        <!--  보유고객
                        <li id="haveCarTab"><spring:message code="global.lbl.haveCar" /></li>
                        -->
                        <!--  정비이력
                        <li id="lbrHistoryTab"><spring:message code="ser.lbl.lbrHistory" /></li>
                        -->
                        <!-- <li id="saleOptyTab"><spring:message code="global.lbl.saleOpty" /> </li> --> <!-- 판매기회 -->
                    </ul>
                    <div id="callTabDiv">
                        <section class="group">
                            <!-- CALL 정보 시작 -->
                            <div id="callInfoArea">
                                <div class="header_area">
                                    <%-- <h3 class="title_basic"><spring:message code='global.title.record' /></h3> <!-- CALL 정보 --> --%>
                                    <div class="btn_right">
                                        <button type="button" class="btn_xs btn_record" id="btnLeadRecord"><spring:message code='global.lbl.record' /></button>  <!-- 녹취 -->
                                        <button type="button" class="btn_xs btn_call" id="btnCallAPI"><spring:message code='global.btn.callSend' /></button>  <!-- 전화걸기 -->
                                        <button class="btn_xs btn_save" id="btnCallSave" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
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
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><spring:message code='global.lbl.callCnt' /></th> <!--  CALL횟수 -->
                                                <td>
                                                    <input id="callCnt" name="callCnt" type="text" value="" class="form_input form_readonly"  data-json-obj="true" />
                                                </td>
                                                <th scope="row"><spring:message code='global.lbl.record' /></th> <!--  녹취 -->
                                                <td>
                                                    <input id="regUrl" name="regUrl" type="text" class="form_input form_readonly"  data-json-obj="true" />
                                                </td>
                                                <th scope="row" rowspan="3"><span class="bu_required"><spring:message code='global.lbl.callRemark' /></span></th> <!--  통화내용 -->
                                                <td  rowspan="3" colspan="3" class="required_area">
                                                    <textarea id="callRemark" name="callRemark" type="testarea" class="form_input" style="height:64px;" rows="5" data-json-obj="true" ></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.telNo' /></span></th> <!-- 전화번호 -->
                                                <td class="required_area">
                                                    <input id="callHpNo" name="callHpNo" type="text" class="form_input numberic" data-type="tel" data-json-obj="true" />
                                                </td>
                                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.callRlt' /></span></th> <!-- 통화결과 -->
                                                <td class="required_area">
                                                    <input id="callStatCd" name="callStatCd" class="form_comboBox"  data-json-obj="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><spring:message code='crm.lbl.nextCallDt' /></th> <!-- 다음Call시간 -->
                                                <td>
                                                    <input id="nextCallDt" name="nextCallDt" class="form_datetimepicker"  data-json-obj="true" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- callInfoArea CALL 정보 끝 -->
                        </section>
                        <section class="group">
                            <!-- CALL정보이력 시작-->
                            <div class="header_area">
                                <h3 class="title_basic"><spring:message code='global.title.callInfoHist' /></h3> <!-- CALL정보이력 -->
                            </div>
                            <div class="table_grid">
                                <div id="callHistGrid"></div>
                            </div>
                            <!-- CALL정보이력 끝-->
                        </section>
                    </div>

                    <div id="custInfoTabDiv">
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
                <%-- <h2 class="title_basic"><spring:message code="global.title.custinfo" /></h2> --%>
                <div class="btn_right">
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
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
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
                                            <label class="label_check ml5"><input id="bhmcYns" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled data-json-obj="true" /></label>
                                        </div>
                                        <div class="form_right" style="width:84%" >
                                            <input id="siebelRowIds" name="siebelRowIds" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.scId" /></th> <!-- 담당SC -->
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
                                <th scope="row"><spring:message code="global.lbl.hpNo" /></th> <!-- 이동전화 -->
                                <td class="readonly_area">
                                    <input id="hpNos" name="hpNos" type="text" class="form_input form_readonly "  readonly  data-type="mobile" pattern="\d" data-json-obj="true" />
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
                                <th scope="row"><spring:message code="global.lbl.prefCommMthCd" /></th> <!-- 선호연락방법 -->
                                <td class="readonly_area">
                                    <input id="prefCommMthCds" name="prefCommMthCds" class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prefCommNo" /></th> <!-- 선호연락처 -->
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

                    </div> <!-- 고객정보 -->
                    <!-- 보유차량 -->
                    <!--
                    <div id="haveCarTabDiv">
                        <section class="group">
                          <div class="header_area">
                              <div class="btn_right">
                                  <button class="btn_xs" id="btnSearchHaveCar" ><spring:message code="global.btn.search" /></button>
                              </div>
                          </div>
                          <div class="table_grid">
                            <div id="haveCarGrid" class="grid"></div>
                          </div>
                        </section>
                    </div>
                    -->
                    <!-- 정비이력 -->
                    <!--
                    <div id="lbrHistoryTabDiv">
                        <section class="group">
                          <div class="header_area">
                              <div class="btn_right">
                                  <button class="btn_xs" id="btnSearchLbr" ><spring:message code="global.btn.search" /></button>
                              </div>
                          </div>
                          <div class="table_grid">
                            <div id="lbrGrid" class="grid"></div>
                          </div>
                        </section>
                    </div>
                    -->
                    <div id="msgHistTabDiv"><!-- 메시지이력 -->
                        <section class="group">
                          <div class="header_area">
                              <%-- <h2 class="title_basic"><spring:message code="global.lbl.activeHist" /></h2> --%>
                              <div class="btn_right">
                                  <button class="btn_xs" id="btnSearchMsg" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                              </div>
                          </div>
                          <div class="table_grid">
                            <div id="msgHistoryGrid"></div>
                          </div>
                        </section>
                    </div>
                </div>
            </section>
            <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">


    var popupWindow;

    var leadSrcList = [];
    var statList = [];
    var ynCdList = [];

    // 담당SC
    var roleUsersList = [{"cmmCd":"00", "cmmCdNm":"<spring:message code='global.lbl.unAssign' />"}];
    var roleUsersMap = [];

    // 화면 호출 유형
    var callType = "${callType}";
    var telNo =  "${telNo}";

    // 차종
    var carLineCdDSList = [];
    var carLineCdObj = {};

    var leadSrcMap = [];
    var statMap = [];

    // 그리드 모델 콤보 DataSource
    var modelCdDSList = [];
    var modelCdObj = {};

    // 활동유형 (메시지)
    var contactTpMap = [];

    var callStatCdList = [];
    var callStatCdMap = [];

    <c:forEach var="obj" items="${activeCdList}">
        contactTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${roleUsers}">
        roleUsersList.push({"cmmCd":"${obj.refId}" , "cmmCdNm":"${obj.usrNm}"});
        roleUsersMap["${obj.refId}"] = "${obj.usrNm}";
    </c:forEach>

    <c:forEach var="obj" items="${leadSrcList}">
        leadSrcList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        statMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

    <c:forEach var="obj" items="${callStatCdList}">
        callStatCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        callStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${carLineCdInfo}">
        carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    function callBackFunc(){
        //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
        //$("#tabstrip-1", parent.document).html(customerForm);
        //$("#tabFormIframe").contents().find("#customerForm").html();
    }

    /**
     * hyperlink in grid event
     */
     $(document).on("click", ".linkCust", function(e){

          var grid = $("#grid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
     });
/******************************************************
 * 고객상세정보 탭 (스크립트1)- 시작
 ******************************************************/

 var custTpList = [];
 var custCdList = [];
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
 </c:forEach>

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
 custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
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

 var resetCustInfoTab = function(e){

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
// var contactBizCdArr = [];
// <c:forEach var="obj" items="${contactBizCdList}">
//     contactBizCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
// </c:forEach>
// contactBizCdArrVal = function(val){
//     var returnVal = "";
//     if(val != null && val != ""){
//         returnVal = contactBizCdArr[val];
//     }
//     return returnVal;
// };
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
        , optionLabel:" "
        , dataSource:custTpList
        , index:0
        , enable:false
    });

 // 잠재/보유고객      custCd              (CRM023)
    $("#custCds").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custCdList
        , index:0
        , enable:false
    });

// 성별                       sexCd                   (COM017)
     $("#sexCds").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:sexCdList
        , index:0
        , enable:false
    });

// 신분증유형            mathDocTp       (CRM024)
     $("#mathDocTps").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:mathDocTpList
        , index:0
        , enable:false
    });

 // 고객확보유형1      custHoldTp      (CRM008)
     $("#custHoldTps").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , index:0
        , enable:false
    });

 // 고객확보유형2      custHoldTpDtl   (CRM***)
     $("#custHoldTpDtls").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpDtlList
        , index:0
        , enable:false
    });

 // 선호연락방법       prefCommMthCd (CRM022)
     $("#prefCommMthCds").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:prefCommMthCdList
        , index:0
        , enable:false
    });

 // 우선연락방식                       prefContactMthCd    (CRM022)
     $("#prefContactMthCds").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:prefContactMthCdList
        , index:0
        , enable:false
    });

 // 우선연락시간                       prefContactTimeCd      (CRM027)
     $("#prefContactTimeCds").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:prefContactTimeCdList
        , index:0
        , enable:false
    });

     $("#chgBuyYns").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:" "
         , dataSource:chgBuyYnDS
         , index:0
         , enable:false
     });

     $("#purcCarBrandCds").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:" "
         , dataSource:purcCarBrandCdDS
         , index:0
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
         }
         ,autoBind:false
         ,navigatable:false
         ,height:150
         ,pageable:false
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
            ,{field:"flagYn", title:"<spring:message code='global.lbl.typicalCar' />", width:60
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    if (dataItem.flagYn == "Y") {
                        return "<input type='checkbox' name='flagYn' data-uid='" + dataItem.uid + "' class='flagYn' checked disabled  />"
                    } else {
                        return "<input type='checkbox' name='flagYn' data-uid='" + dataItem.uid + "' class='flagYn' disabled />"
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
                , template:'#if (useYn !== ""){# #= chgBuyYnMap[useYn]# #}#'
            }       // 사융유무
            ,{title:""}
         ]

     });

/******************************************************
* 고객상세정보 탭 (스크립트2)- 끝
******************************************************/
//그리드 설정 (callHistGrid CRUD)
$("#callHistGrid").kendoExtGrid({
    dataSource:{
        transport:{
            read:{
                url:"<c:url value='/crm/cmm/callInfo/selectCallInfo.do' />"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"]    = options.pageSize;
                    params["pageIndex"]             = options.page;
                    params["firstIndex"]            = options.skip;
                    params["lastIndex"]             = options.skip + options.take;
                    params["sort"]                  = options.sort;

                    params["sCallListCd"] = "IDCCLEAD";
                    params["sCallListReqNo"]               = $("#leadNo").val();

                    console.log(params);

                    return kendo.stringify(params);

                }else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
                errors:"error"
                , model:{
                    id:"rnum"
                    , fields:{
                        rnum:{type:"number"}
                        , telNo       :{type:"string", editable:false}
                        , statCd       :{type:"string", editable:false}
                        , remark       :{type:"string", editable:false}
                        , nextCallDt   :{type:"date", editable:false}
                        , regDt        :{type:"date", editable:false}
                    }
                }
        }
    }
    ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                            ,attributes:{"class":"ac"}
                }
                , {field:"telNo" , title:"<spring:message code='global.lbl.telNo' />",  width:100, attributes:{"class":"ac"}}
                , {field:"statCd" , title:"<spring:message code='global.lbl.callRlt' />",  width:100, attributes:{"class":"ac"}
                    , editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:callStatCdList
                        });
                    }
                    , template:'#if (statCd !== ""){# #= callStatCdMap[statCd]# #}#'
                }
                , {field:"remark" , title:"<spring:message code='global.lbl.callRemark' />",  width:300, attributes:{"class":"al"}}
                , {field:"nextCallDt" , title:"<spring:message code='crm.lbl.nextCallDt' />", width:180, attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }
                , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                }
                , {title:""}
            ]
    ,autoBind:false
    ,navigatable:false
    ,height:100
    ,pageable:false
});
/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/
    $("#sMngScId").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "   // 전체
        , dataSource:roleUsersList
        , index:0
    });

    // 리드출처.   leadSrcList
    $("#leadSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:leadSrcList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            var custHoldTpDtl = $("#leadSrcDtl").data("kendoExtDropDownList");
            if (selcmmCd == "02"){
                custHoldTpDtl.enable(true);
            } else {
                custHoldTpDtl.value("");
                custHoldTpDtl.enable(false);
            }
        }
    });

    // 리드출처(검색).   sLeadSrcCd
    $("#sLeadSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:leadSrcList
        , index:0
    });

    // 상태(검색).   statList
    $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:statList
        , index:0
    });

    // bhmc여부(검색).   sBhmcYn
    $("#sBhmcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:ynCdList
        , index:0
    });

    // 상태.   statList
    $("#statCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:statList
        , index:0
    });

    // 통화상태.   callStatCdList
    $("#callStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:callStatCdList
        , index:0
    });

    // 고객확보유형2      leadSrcDtl   (CRM***)
    $("#leadSrcDtl").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:" "
       , dataSource:custHoldTpDtlList
       , index:0
       , enable:false
   });

    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custTpList
        , index:0
        , enable:true
    });

 // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
     $(".numberic").keyup(function(e)
     {
         var content = $(this).val();

         if(content.match(onlyNum)){
             console.log($(this).val());
             $(this).val('');
         }
     });

    // 숫자
     $(".numberic").focusout(function(){
         $(this).val($.trim($(this).val()));
         var content = $(this).val();
         if(content.match(onlyNum)){
             $(this).val('');
         }
     });

    $("#regDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sAllocDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sAllocDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#nextCallDt").kendoDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
    });

    $("#ddlnDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#opptChgDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var callUrl;
            console.log(selectTabId);

        }
    });

/*************************************************************
이벤트 정의
*************************************************************/

    //버튼 - 담당자
     //$("#btnAddUser").kendoButton({
     $("#btnAddUser").click( function(){
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if (data.length >= 1) {
                            console.log("Return to User Popup");
                            //console.log(data[0]);
                            $("#prsnId").val(data[0].usrId);
                            //$("#prsnNm").val(data[0].usrNm);
                        }
                    }
                }
            }
        });
    });

     // 고객명에서 ObKeyDown
     $(".onKey_down").keydown(function(e){
         if (e.keyCode == 13) {
             if($(this).val() != "") {
                 $(".custSearch").click();
             }
         }
     });

     // 고객 팝업
     //$("#btnAddCust").kendoButton({
     $(".custSearch").click(function() {
         popupWindow = dms.window.popup({
             windowId:"customerSearchPopup"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":false
                     , "type"  :"LEAD"
                     , "telNo" :telNo
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             console.log("Return to Customer Popup");
                             console.log(data[0]);
                             //$("#leadNo").val(data[0].leadNo);
                             $("#custNmSearch").val(data[0].custNm);
                             $("#custNm").val(data[0].custNm);
                             $("#custNo").val(data[0].custNo);
                             $("#hpNo").val(data[0].hpNo);
                             $("#telNo").val(data[0].telNo);
                             $("#officeTelNo").val(data[0].officeTelNo);
                             $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);
                             $("#custTp").data("kendoExtDropDownList").enable(false);

                             popupWindow.close();
                         }
                     }
                 }
             }
         })
     });

     // 리드 조회
     $("#btnLeadSearch").kendoButton({
         click:function(e) {
             $("#grid").data("kendoExtGrid").dataSource.read();
         }
     });


     // 메시지이력 탭 조회
     $("#btnSearchMsg").kendoButton({
         click:function(e){
             $("#msgHistoryGrid").data("kendoExtGrid").dataSource.read();
         }
     });

     $("#btnLeadDtlSearch").click(function(){

             if ( dms.string.isEmpty($("#leadNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.lead' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 //$("#leadNo").focus();
                 return false;
             }

             // form 데이터
             var param = {};
             param["sLeadNo"] = $("#leadNo").val();
             param["sLeadTp"] = "COMMON";  // COMMON:일반리드, IDCC:IDCC리드

             console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/slm/leadInfo/selectLeads.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {

                 console.log("Result----------------------");
                 console.log(result);

                 if (result.total >= 1) {
                     $("#leadNo").val(result.data[0].leadNo);
                     $("#custNo").val(result.data[0].custNo);
                     $("#custNmSearch").val(result.data[0].custNm);
                     $("#custNm").val(result.data[0].custNm);
                     $("#hpNo").val(result.data[0].hpNo);
                     $("#telNo").val(result.data[0].telNo);
                     $("#prsnId").val(result.data[0].prsnId);
                     $("#prsnNm").val(result.data[0].prsnNm);
                     $("#mngScNm").val(result.data[0].mngScNm);
                     $("#leadSrcCd").data("kendoExtDropDownList").value(result.data[0].leadSrcCd);
                     $("#leadSrcDtl").data("kendoExtDropDownList").value(result.data[0].leadSrcDtl);
                     $("#statCd").data("kendoExtDropDownList").value(result.data[0].statCd);
                     $("#custTp").data("kendoExtDropDownList").value(result.data[0].custTp);
                     $("#custTp").data("kendoExtDropDownList").enable(false);
                     $("#regUsrId").val(result.data[0].regUsrId);
                     $("#regUsrNm").val(result.data[0].regUsrNm);
                     $("#regDt").data("kendoExtMaskedDatePicker").value(result.data[0].regDt);
                     $("#ddlnDt").data("kendoExtMaskedDatePicker").value(result.data[0].ddlnDt);
                     $("#opptChgDt").data("kendoExtMaskedDatePicker").value(result.data[0].opptChgDt);
                     $("#remark").val(result.data[0].remark);

                     var bhmcYn = result.data[0].bhmcYn;
                     if (bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true) };

                     console.log(result.data[0].hpNo);
                     //Call 정보
                     $("#callCnt").val(result.data[0].callCount);
                     $("#callHpNo").val(result.data[0].hpNo);
                     //var btnDelVehic = $("#btnDelVehic").data("kendoButton");           // 관심차량삭제
                     //var btnAddVehic = $("#btnAddVehic").data("kendoButton");           // 관심차량추가
                     //var btnSaveVehic = $("#btnSaveVehic").data("kendoButton");         // 관심차량저장
                     //var btnAddCust = $("#btnAddCust").data("kendoButton");           // 고객 선택
                     //var btnAddUser = $("#btnAddUser").data("kendoButton");            // 담당자 선택
                     var btnLeadSave = $("#btnLeadSave").data("kendoButton");          // 리드 저장

                     //btnVisitLink.enable(true);
                     //btnTestDriveLink.enable(true);
                     //btnLeadClose.enable(true);
                     //btnDelVehic.enable(true);
                     //btnAddVehic.enable(true);
                     //btnSaveVehic.enable(true);
                     btnLeadSave.enable(true);
                     //btnAddUser.enable(true);
                     $("#hpNo").removeClass('form_readonly');
                     $("#telNo").removeClass('form_readonly');
                     $("#remark").removeClass('form_readonly');
                     //$("#hpNo").data("kendoMaskedTextBox").enable(true);
                     //$("#telNo").data("kendoMaskedTextBox").enable(true);
                     $("#leadSrcCd").data("kendoExtDropDownList").enable(true);

                     if ($("#statCd").val() == "03") {
                         //btnVisitLink.enable(false);
                         //btnTestDriveLink.enable(false);
                         //btnLeadClose.enable(false);
                         //btnDelVehic.enable(false);
                         //btnAddVehic.enable(false);
                         //btnSaveVehic.enable(false);
                         //btnAddCust.enable(false);
                         //btnAddUser.enable(false);
                         //btnLeadSave.enable(false);
                         //$("#hpNo").addClass('form_readonly');
                         //$("#telNo").addClass('form_readonly');
                         //$("#remark").addClass('form_readonly');
                         //$("#hpNo").data("kendoMaskedTextBox").enable(false);
                         //$("#telNo").data("kendoMaskedTextBox").enable(false);
                         //$("#leadSrcCd").data("kendoExtDropDownList").enable(false);
                         //$("#statCd").data("kendoExtDropDownList").enable(false);
                     } else if ($("#statCd").val() == "02"){
                         //btnAddCust.enable(false);
                     }

                     //정보 초기화 (콜정보 & 탭)
                     tabReset();

                     // 관심차종 Reload
                     $("#carGrid").data("kendoExtGrid").dataSource.read();

                     // CALL이력 Reload
                     $("#callHistGrid").data("kendoExtGrid").dataSource.read();

                 } else {
                     dms.notification.info("<spring:message code='global.info.noSearchDataMsg' />");
                 }

             });
     });

     // 리드조회팝업
     $("#btnLeadPopup").kendoButton({
         click:function(e) {
             console.log('리드 조회 팝업');
             alert('리드조회 팝업');
         }
     });

     // 검색조건초기화
     $("#btnSearchReset").kendoButton({
         click:function(e) {
             $("#sLeadSrcCd").data("kendoExtDropDownList").value("");
             $("#sCustNm").val();
             $("#sHpNo").val();
             $("#sTelNo").val();
             $("#sStatCd").data("kendoExtDropDownList").value("");
             $("#sMngScId").data("kendoExtDropDownList").value("");
             $("#sBhmcYn").prop("checked",false);
             $("#sAllocDtFrom").data("kendoExtMaskedDatePicker").value("");
             $("#sAllocDtTo").data("kendoExtMaskedDatePicker").value("");
         }
     });

     // 추가 - 초기화
     $("#btnCustReset").kendoButton({
        click:function(e){
            $("#leadNo").val("");
            $("#custNo").val("");
            $("#custNmSearch").val("");
            $("#custNm").val("");
            $("#hpNo").val("");
            $("#telNo").val("");
            $("#officeTelNo").val("");
            $("#prsnId").val("");
            $("#prsnNm").val("");
            $("#mngScNm").val("");
            $("#leadSrcCd").data("kendoExtDropDownList").value("");
            $("#leadSrcDtl").data("kendoExtDropDownList").value("");
            $("#statCd").data("kendoExtDropDownList").value("");
            $("#custTp").data("kendoExtDropDownList").value("");
            $("#custTp").data("kendoExtDropDownList").enable(true);

            $("#regUsrId").val("");
            $("#regUsrNm").val("");
            $("#remark").val("");
            $("#opptNo").val("");
            //$("#regDt").val("");
            //$("#ddlnDt").val("");
            //$("#opptChgDt").val("");

            $("#regDt").data("kendoExtMaskedDatePicker").value("");
            $("#ddlnDt").data("kendoExtMaskedDatePicker").value("");
            $("#opptChgDt").data("kendoExtMaskedDatePicker").value("");


            $("#bhmcYn").prop("checked",false)

            //var btnVisitLink = $("#btnVisitLink").data("kendoButton");         // 내방예약 바로가기
            //var btnTestDriveLink = $("#btnTestDriveLink").data("kendoButton"); // 시승예약 바로가기
            //var btnLeadClose = $("#btnLeadClose").data("kendoButton");         // Close
            //var btnDelVehic = $("#btnDelVehic").data("kendoButton");           // 관심차량삭제
            //var btnAddVehic = $("#btnAddVehic").data("kendoButton");           // 관심차량추가
            //var btnSaveVehic = $("#btnSaveVehic").data("kendoButton");         // 관심차량저장
            //var btnAddCust = $("#btnAddCust").data("kendoButton");             // 고객 선택
            var btnAddUser = $("#btnAddUser").data("kendoButton");             // 담당자 선택
            var btnLeadSave = $("#btnLeadSave").data("kendoButton");            // 리드저장

            //btnVisitLink.enable(false);
            //btnTestDriveLink.enable(false);
            //btnLeadClose.enable(false);
            //btnDelVehic.enable(false);
            //btnAddVehic.enable(false);
            //btnSaveVehic.enable(false);
            //btnAddCust.enable(true);
            //btnAddUser.enable(true);
            btnLeadSave.enable(true);

            $("#hpNo").removeClass('form_readonly');
            $("#telNo").removeClass('form_readonly');
            $("#remark").removeClass('form_readonly');
            //$("#hpNo").data("kendoMaskedTextBox").enable(true);
            //$("#telNo").data("kendoMaskedTextBox").enable(true);
            $("#leadSrcCd").data("kendoExtDropDownList").enable(true);

            // 관심차종 Reset
            $("#carGrid").data("kendoExtGrid").dataSource.data([]);

            tabReset();

        }
     });

    //버튼 - 시승예약 바로가기
     $("#btnTestDriveLink").kendoButton({
        click:function(e) {
            alert('시승예약 바로가기');
        }
        , enable:false
     });

     // 메시지버튼
     $("#btnMessage").kendoButton({
         click:function(e){

             var   grid = $("#grid").data("kendoExtGrid")
                 , rows = grid.select()
                 , dataItem
                 , dataValidate  = false
                 , smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                 , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                 , smsTmplUserList = []              // sms 전송 대상자 목록
                 , selectedItem = grid.dataItem(grid.select())
                 , refKeyNm
                 , refTableNm = "CR_0202T"
                 , contactBizCd = "02"
             ;

             if (rows.length <= 0) {
                 //목록을 선택하여 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.select'/>");
                 return;
             }

             refKeyNm = selectedItem.leadNo    // 단건 일때는 여기서 변수지정, List 일때는 smsTmplUserList 에서 변수지정

             rows.each(function(index, row) {

                 dataItem = grid.dataItem(row);

                 if ( dms.string.isEmpty(dataItem.custNo) || dms.string.isEmpty(dataItem.custNm) || dms.string.isEmpty(dataItem.hpNo) ) {
                     // {고객정보}을(를) 확인하여 주세요.
                     dms.notification.success("<spring:message code='global.lbl.custInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                     smsTmplUserList = [];
                     dataValidate = true;
                     return false;
                 }

                 smsTmplUserList.push({
                     "custNo" :dataItem.custNo
                   , "custNm" :dataItem.custNm
                   , "hpNo"   :dataItem.hpNo
                   , "refKeyNm":dataItem.leadNo
                 });

             });
             if(dataValidate){ return false; }

             console.log("smsTmplUserList ::",smsTmplUserList)

             // SMS 전송 대상자를 임시 테이블에 저장
             if ( smsTmplUserGroup === "Y" ) {

                 $.ajax({
                     url:"<c:url value='/crm/cmm/customerInfo/insertSmsTmplUsers.do' />"
                     ,data:JSON.stringify(smsTmplUserList)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,async:false
                     ,error:function(jqXHR, status, error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {

                         if ( jqXHR > 0 && textStatus === "success" ) {
                             smsTmplUserSeq = jqXHR;
                         } else {
                             smsTmplUserSeq = ""
                         }

                     }
                 });

                 smsTmplUserList = [];

             } else if ( smsTmplUserGroup === "N" ) {

                 smsTmplUserSeq = ""
             }

             messagePopupWindow = dms.window.popup({
                 windowId:"messagePopupWindow"
                 , title:"<spring:message code='global.title.msgTransmission' />"   // 메시지전송
                 , width:"550px"
                 , height:"550px"
                 , content:{
                     url:"<c:url value='/crm/cmm/customerInfo/selectMessagePopup.do'/>"
                     , data:{
                         "autoBind":false

                         , "smsTmplUserList":smsTmplUserList
                         , "smsTmplUserSeq" :smsTmplUserSeq

                         , "contactBizCd"   :contactBizCd
                         , "refTableNm"     :refTableNm
                         , "refKeyNm"       :refKeyNm

                         , "callbackFunc":function(data){

                             if(data == "success"){

                                 messagePopupWindow.close();
                                 // 전송 / 이 완료 되었습니다.
                                 dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                             }

                         }
                     }
                 }
             });

         }
     });


    //버튼 - 판매기회 바로가기
    $("#btnOpptLink").kendoButton({
        click:function(e) {

            var custNo = $("#custNo").val();
            var leadNo = $("#leadNo").val();
            var leadSrcCd = $("#leadSrcCd").val();
            var leadSrcDtl = $("#leadSrcDtl").val();

            if ( dms.string.isEmpty(leadNo)){
                dms.notification.warning("<spring:message code='global.lbl.lead' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            if ( dms.string.isEmpty(custNo)){
                dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.opportunityMng' />","<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMain.do' />?leadNo="+leadNo, "VIEW-I-10237"); // 판매기회

        }
    });

    //버튼 - 내방예약 바로가기
    $("#btnVisitLink").kendoButton({
        click:function(e) {

            var custNo = $("#custNo").val();
            var leadNo = $("#leadNo").val();
            var leadSrcCd = $("#leadSrcCd").val();
            var leadSrcDtl = $("#leadSrcDtl").val();

            if ( dms.string.isEmpty(leadNo)){
                dms.notification.warning("<spring:message code='global.lbl.lead' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            if ( dms.string.isEmpty(custNo)){
                dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.visitCustomer' />","<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMain.do' />?leadNo="+leadNo, "VIEW-I-10235"); //내방예약

        }
    });

     //버튼 - 리드등록
    $("#btnSomSave").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#leadNo").val()) ){
                // 리드 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.leadNo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                return;
            }

            if( dms.string.isEmpty($("#custNo").val()) ){
                // 고객 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                return;
            }

            if( dms.string.isEmpty($("#hpNo").val()) ){
                // 휴대전화/ 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }

            if( dms.string.isEmpty($("#prsnId").val()) ){
                // 담당자 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.prsNm' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }

            if( dms.string.isEmpty($("#remark").val()) ){
                // 비고 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.remark' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }



            var saveFormData = {}
            //var saveFormData = $("#leadForm").serializeObject(
            //        $("#leadForm").serializeArrayInSelector("[data-json-obj='true']")
            //    )

            saveFormData["custNo"] = $("#custNo").val(); // 고객번호
            saveFormData["hpNo"] = $("#hpNo").val(); // 휴대폰번호                             trim 필수
            saveFormData["remark"] = $("#remark").val(); // 판매기회 개술
            saveFormData["scId"] = $("#prsnId").val(); // 판매고문
            saveFormData["saleOpptStepCd"] = "01"; // 판매기회단계코드

            //console.log("--- btnSomSave 판매기회 ---");
            //console.log(saveFormData);

            // 그리드 validation
            var grid = $("#carGrid").data("kendoExtGrid");
            saveGridData = {};

            //console.log("grid!!!");
            //console.log(grid);

            var gridDataChk = grid._data.length;

            // 관심차 필수 체크
            if(gridDataChk < 1 ){
                // 관심차 / 을(를) 선택하여주해주세요.
                dms.notification.warning("<spring:message code='global.lbl.intrCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                return;
            }

            saveGridData["insertList"] = grid._data;

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
             });

            if(dataValidate){ return false; }

            if($("input.flagYn:checked", "#carGrid").length != 1 ){
                // 대표차 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.typicalCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }

            var saveData = $.extend(
                    {"salesOpptMgmtVO":saveFormData}
                    , saveGridData
            )

            console.log("---saveData---");
            console.log(saveData);

            $.ajax({
                url:"<c:url value='/crm/slm/leadInfo/insertLeadToSalesOppt.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(result) {
                    // 저장 / 이 완료 되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='saveSuccessMsg' /><spring:message code='global.info.successMsg' arguments='${saveSuccessMsg}'/>");
                    console.log("-- Result ~~");
                    console.log(result);
                    if (result != null && result != ""){
                        // 저장 프로세스
                        $("#btnLeadSave").click();
                        //$("#btnLeadSearch").click();
                    }
                }
            });

        }
    });

     // 리드종료 (Close)
     $("#btnLeadClose").kendoButton({
         click:function(e) {
             $("#updateTp").val("leadClose");
             $("#btnLeadSave").click();
         }
         , enable:false
     });

     // 저장 (신규, 수정)
     $("#btnLeadSave").kendoButton({
         click:function(e) {

          // 신규고객의 등록인 경우 체크
             if ( dms.string.isEmpty($("#leadNo").val()) ) {
                 var custTp = $("#custTp").data("kendoExtDropDownList").value();
                 var custNmSearch = $("#custNmSearch").val();
                 var hpNo = $("#hpNo").val();
                 var officeTelNo = $("#officeTelNo").val();

                 if ( dms.string.isEmpty(custTp) ){
                     dms.notification.warning("<spring:message code='global.lbl.custTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 }
                 if ( dms.string.isEmpty(custNmSearch) ){
                     dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     return false;
                 }

                 if (custTp == "01") { // 개인
                     if ( dms.string.isEmpty(hpNo) ){
                         dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     }
                 } else {  // 법인
                     if ( dms.string.isEmpty(officeTelNo) ){
                         dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     }
                 }

                 $("#custNm").val(custNmSearch);
             }

             // 화면 필수 체크
             if ( dms.string.isEmpty($("#leadSrcCd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.leadSrc' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#leadSrcCd").focus();
                 return false;
             } else {
                 if ($("#leadSrcCd").data("kendoExtDropDownList").value() == "02") {
                     if ( dms.string.isEmpty($("#leadSrcDtl").val())) {
                         dms.notification.warning("<spring:message code='crm.lbl.leadSrcCamp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         $("#leadSrcDtl").focus();
                         return false;
                     }
                 }
             }

             // form 데이터
             var param =
                 $("#leadForm").serializeObject(
                     $("#leadForm").serializeArrayInSelector("[data-json-obj='true']")
                 );

             var callInfoAreaParam = {};

             $("#updateTp").val("Normal");

             param["updateTp"] = $("#updateTp").val();
             param["statCd"] = $("#statCd").val();
             param["leadNo"] = $("#leadNo").val();
             param["leadTp"] = "COMMON";    // IDCC / COMMON

             var grid = $("#carGrid").data("kendoExtGrid");
             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

             if (grid.cudDataLength > 0) {

                 // 그리드 무결성 점검
                 //var dataValidate = false;
                 $.each(saveData.insertList, function(idx, row){
                     if(row.carlineCd == ""){
                        // 선택하지 않은 차종이 있습니다.
                        dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCarLine}' />");
                        //dataValidate = true;
                        return false;
                     }
                     if(row.modelCd == ""){
                         // 선택하지 않은 모델이 있습니다.
                         dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                         //dataValidate = true;
                         return false;
                      }
                 });

                 if($("input.flagYn:checked", "#carGrid").length != 1 ){
                     // 대표차 / 을(를) 선택해주세요.
                     dms.notification.warning("<spring:message code='global.lbl.typicalCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                     return false;
                 }

             }

             var saveLeadData = $.extend(
                 {"leadInfoVO":param}
                 , {"callInfoVO":callInfoAreaParam}
                 , {"carLineInfoVO":saveData}
             );

             console.log("Saving of Request Info.!!!");
             console.log(saveLeadData);

             $.ajax({
                 url:"<c:url value='/crm/slm/leadInfo/multiLeads.do' />"
                 ,data:JSON.stringify(saveLeadData)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log("error !!!");
                     //console.log(jqXHR.responseJSON);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     console.log(result);
                     if (result != null && result != ""){
                         $("#leadNo").val(result);
                         $("#btnLeadSearch").click();
                         $("#carGrid").data("kendoExtGrid").dataSource.page(1);
                     }
                 }
             }).done(function(result) {
                 console.log("Done!!!!");
             });
         }
     });

     // 녹취
     $("#btnLeadRecord").kendoButton({
        click:function(e) {
            dms.notification.warning("<spring:message code='global.msg.eveloping' />");
            return false;
        }
     });

     // CALLAPI 호출
     $("#btnCallAPI").kendoButton({
        click:function(e){
            dms.notification.warning("<spring:message code='global.msg.eveloping' />");
            return false;
        }
     });

     // CALL정보 저장
     $("#btnCallSave").kendoButton({
         click:function(e) {

             // 리드를 선택해주십시오.
             if ( dms.string.isEmpty($("#leadNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.lead' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return false;
             }

             // 고객을 선택해주십시오.
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return false;
             }

             // 통화내용은 필수 입니다.
             if ( dms.string.isEmpty($("#callHpNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.telNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                 $("#callHpNo").focus();
                 return false;
             }

             // 통화내용은 필수 입니다.
             if ( dms.string.isEmpty($("#callRemark").val())){
                 dms.notification.warning("<spring:message code='global.lbl.callRemark' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                 $("#callRemark").focus();
                 return false;
             }

             // 화면 필수 체크
             if ( dms.string.isEmpty($("#callStatCd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.callRlt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#callStatCd").focus();
                 return false;
             }

             // form 데이터
             /*
             var param =
                 $("#callInfoArea").serializeObject(
                     $("#callInfoArea").serializeArrayInSelector("[data-json-obj='true']")
                 );
             */

             var param = {};

             param["custNo"] = $("#custNo").val();
             param["callListCd"] = "IDCCLEAD";
             param["callListReqNo"] = $("#leadNo").val();
             param["telNo"] = $("#callHpNo").val();
             param["remark"] = $("#callRemark").val();
             param["statCd"] = $("#callStatCd").data("kendoExtDropDownList").value();
             param["regUrl"] = $("#regUrl").val();
             param["nextCallDt"] = $("#nextCallDt").data("kendoDateTimePicker").value();

             var url = "<c:url value='/crm/cmm/callInfo/insertCallInfo.do' />";

             console.log("Saving of Call Info.!!!");
             console.log(param);

             $.ajax({
                 url:url
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR.responseJSON);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     console.log(result);
                     if (result != null && result != ""){
                         //$("#leadNo").val(result);
                         $("#btnLeadDtlSearch").click();
                     }
                 }
             }).done(function(result) {
                 console.log("Done!!!!");
             });
         }
     });

     // 삭제 - carGrid
     $("#btnDelVehic").kendoButton({
        click:function(e) {
            var grid = $("#carGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
     });


    // 추가 - carGrid
     $("#btnAddVehic").kendoButton({
         click:function(e) {
             $("#carGrid").data("kendoExtGrid").dataSource.insert(0,{
                 seq:""
                 ,carlineCd:""
                 ,carlineNm:""
                 ,modelCd:""
                 ,modelNm:""
                 ,refTableNm:"CR_0202T"
                 //,refKeyNm:$("#leadNo").val()
                 ,refKeyNm:""
                 ,flagYn:"N"
             });
         }
     });

     // 저장 - carGrid
     $("#btnSaveVehic").kendoButton({
         click:function(e){
             var grid = $("#carGrid").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

             if (grid.cudDataLength == 0){
                 dms.notification.info("<spring:message code='global.info.required.change' />");
                 return;
             }


             // 그리드 무결성 점검
             var dataValidate = false;
             $.each(saveData.insertList, function(idx, row){
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
             });

             if(dataValidate){ return false;}

             if($("input.flagYn:checked", "#carGrid").length != 1 ){
                 // 대표차 / 을(를) 선택해주세요.
                 dms.notification.warning("<spring:message code='global.lbl.typicalCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                 dataValidate = true;
                 return false;
             }

             console.log("----btnSaveVehic-----");
             console.log(saveData);

             if (grid.gridValidation()){
                 $.ajax({
                     url:"<c:url value='/crm/cmm/carLineInfo/multiCarLineInfo.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error){
                         //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                         console.log("failed!!");
                     },
                     success:function(jqXHR, textStatus){

                         //grid.dataSource._destroyed = [];
                         dms.notification.info("<spring:message code='global.info.success' />");
                         grid.dataSource.page(1);
                     }
                 });
             }else{
                 globalNotification.show("<spring:message code='global.info.check.input' />", "error");
             }
         }
         , enable:false
     });

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
/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

     // 리드 그리드
     $("#grid").kendoExtGrid({
       dataSource:{
         transport:{
             read:{
                 url:"<c:url value='/crm/slm/leadInfo/selectLeads.do' />"
             }
             ,parameterMap:function(options, operation) {
                 if (operation === "read") {

                     var params = {};

                     var sAllocDtFrom = $("#sAllocDtFrom").data("kendoExtMaskedDatePicker").value();
                     var sAllocDtTo = $("#sAllocDtTo").data("kendoExtMaskedDatePicker").value();

                     if ( (dms.string.isNotEmpty(sAllocDtFrom) && dms.string.isEmpty(sAllocDtTo)) ||
                             (dms.string.isEmpty(sAllocDtFrom) && dms.string.isNotEmpty(sAllocDtTo))
                     ){
                        dms.notification.warning("<spring:message code='global.lbl.allocDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                     }

                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;

                     params["sort"] = options.sort;
                     params["sLeadTp"] = "COMMON";
                     params["sCallListCd"] = "LEAD";
                     params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
                     params["sCustNm"] = $("#sCustNm").val();
                     params["sHpNo"] = $("#sHpNo").val();
                     params["sTelNo"] = $("#sTelNo").val();
                     params["sStatCd"] = $("#sStatCd").data("kendoExtDropDownList").value();
                     params["sLeadSrcCd"] = $("#sLeadSrcCd").data("kendoExtDropDownList").value();
                     params["sBhmcYn"] = $("#sBhmcYn").data("kendoExtDropDownList").value();
                     params["sAllocDtFrom"] = sAllocDtFrom;
                     params["sAllocDtTo"] = sAllocDtTo;

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
                     id:"leadNo"
                     ,fields:{
                         leadTp:{type:"string", editable:false}
                         ,hpNo:{type:"string", editable:false}
                         ,telNo:{type:"string", editable:false}
                         ,leadSrcCd:{type:"string", editable:false}
                         ,bhmcYn:{type:"string", editable:false}
                         ,prsnNm:{type:"string", editable:false}
                         ,ddlnDt:{type:"date", editable:false}
                         ,opptChgDt:{type:"date", editable:false}
                         ,regUsrNm:{type:"string", editable:false}
                         ,regDt:{type:"date", editable:false}
                         ,statCd:{type:"string", editable:false}
                         ,delayYn:{type:"string", editable:false}
                         ,allocDt:{type:"date", editable:false}
                     }
                 }
         }
     }
     ,autoBind:false
     ,columns:[
                  {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                    ,attributes:{"class":"ac"}
                  }
                  ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}
                      ,template:function(dataItem){
                          var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                          return spanObj;
                      }
                  }/* 고객명 */
                  ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                  ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:120, attributes:{"class":"ac"}}
                  ,{field:"leadSrcCd", title:"<spring:message code='global.lbl.leadSrc' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (leadSrcCd !== ""){# #= leadSrcMap[leadSrcCd]# #}#'
                  }
                  ,{field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:100, attributes:{"class":"ac"}}
                  ,{field:"mngScId", title:"<spring:message code='crm.lbl.scId' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (mngScId !== ""){# #= roleUsersMap[mngScId]# #}#'
                  }
                  ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}
                  ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}
                      ,template:'#if (statCd !== ""){# #= statMap[statCd]# #}#'
                  }
                  ,{field:"ddlnDt", title:"<spring:message code='global.lbl.ddlnDt' />", width:100, attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }
                  ,{field:"opptChgDt", title:"<spring:message code='crm.lbl.opptChgDt' />", width:100, attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }
                  ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }
                  ,{field:"allocDt", title:"<spring:message code='global.lbl.allocDt' />", width:150, attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }
                  ,{field:"delayYn", title:"<spring:message code='global.lbl.delayYn' />", width:100, attributes:{"class":"ac"}}
                  ,{title:""}

     ]
     ,editable:false
     ,navigatable:false
     ,height:200
     ,sortable:false
     //,scrollable:true
     ,change:function(e) {
         console.log('selected!!!');
         if (!e.sender.dataItem(e.sender.select()).isNew()){
             var selectedVal = this.dataItem(this.select());
             var leadNo = selectedVal.leadNo;
             console.log(selectedVal);
             $("#custNo").val("");
             $("#leadNo").val("");
             if (leadNo != null && leadNo != "undefined") {
                 $("#leadNo").val(leadNo);
                 $("#btnLeadDtlSearch").click();
             }
         }
     }
     });

     // 관심차종 그리드
     $("#carGrid").kendoExtGrid({
         dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/cmm/carLineInfo/selectCarLineInfo.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"]    = options.pageSize;
                         params["pageIndex"]             = options.page;
                         params["firstIndex"]            = options.skip;
                         params["lastIndex"]             = options.skip + options.take;
                         params["sort"]                  = options.sort;
                         params["sRefTableNm"]           = "CR_0202T";
                         params["sRefKeyNm"]             = $("#leadNo").val();

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
                             ,rnum  :{type:"number" , editable:false}           //
                             ,carlineCd:{type:"string"}
                             //,carlineNm:{type:"string"}
                             ,modelCd:{type:"string"}
                             ,modelNm:{type:"string"}
                             ,flagYn     :{type:"string", editable:true}
                             ,refTableNm:{type:"string"}
                             ,refKeyNm:{type:"string"}
                             ,regDt:{type:"date"}
                             ,updtDt:{type:"date"}
                         }
                     }
             }

         }
         ,autoBind:false
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
            ,{  // 차량
                field:"carlineCd"
               ,title:"<spring:message code='global.lbl.carLine' />"
               ,width:200
               ,headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
               ,template:"#=bf_selectCarLine(carlineCd)#"
               ,editor:function (container, options){
                   if( options.model.seq == "" || options.model.carlineCd == ""){
                       $('<input required name="carlineNm" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:false
                           , dataTextField:"carlineNm"
                           , dataValueField:"carlineCd"
                           , dataSource:carLineCdDSList
                           , select:selectGridCarlineCd
                       });
                   }else{
                       container.context.innerText = carLineCdObj[options.model.carlineCd];
                   }
               }
            }
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
            ,{    // 모델
                field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:200
                , headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
                ,template:"#= bf_selectModel(modelCd, modelNm) #"
                ,editor:function (container, options){

                    if(     options.model.carlineCd != ""
                        && (options.model.modelCd == "" || options.model.seq == "") ){
                        $('<input required name="modelCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataTextField:"modelNm"
                            ,dataValueField:"modelCd"
                            ,dataSource:modelCdDSList
                        });
                    }else{
                        if(options.model.modelNm != ""){
                            container.context.innerText = options.model.modelNm;
                        }else{
                            //container.context.innerText = modelCdObj[options.model.modelCd];
                            container.context.innerText = "<spring:message code='global.lbl.intrCarLine' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                        }
                    }
                }
            }
            ,{template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:50, attributes:{"class":"ac"},title:"<spring:message code='global.lbl.typicalCar' />"}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
            ,{field:"refTableNm", hidden:true}
            ,{field:"refKeyNm", hidden:true}
            , {title:""}
            //,{field:"regDt",             title:"<spring:message code='global.lbl.regDt' />",  width:100, attributes:{"class":"ac"}
            //    ,format:"{0:<dms:configValue code='dateFormat' />}"
            //}
         ]
         ,multiSelectWithCheckbox:true
         ,navigatable:false
         ,height:100
         ,pageable:false
     });

     // 탭 그리드
     // 보유차량
     /*
     $("#haveCarGrid").kendoExtGrid({
         editable:false
         ,autoBind:false
         ,height:200
         ,columns:[
             {field:"a",  title:"<spring:message code='global.lbl.brand' />",   width:130, attributes:{"class":"al"}} //브랜드
             ,{field:"b", title:"<spring:message code='global.lbl.carlineNm' />",     width:130, attributes:{"class":"al"}} //차종
             ,{field:"b", title:"<spring:message code='global.lbl.modelNm' />",     width:130, attributes:{"class":"al"}} //모델
             ,{field:"c", title:"<spring:message code='global.lbl.vinNo' />", width:130, attributes:{"class":"al"}} //VIN
             ,{field:"d", title:"<spring:message code='global.lbl.enginNo' />", width:130, attributes:{"class":"al"}} //엔진번호
             ,{field:"e", title:"<spring:message code='global.lbl.licensePlt' />",     width:130, attributes:{"class":"al"}} //번호판
             ,{field:"f", title:"<spring:message code='global.lbl.extColorNm' />",     width:130, attributes:{"class":"al"}} //외장색
             ,{field:"f1", title:"<spring:message code='global.lbl.intColorNm' />",     width:130, attributes:{"class":"al"}} //내장색
             ,{field:"g", title:"<spring:message code='global.lbl.purcDlrComp' />",     width:130, attributes:{"class":"al"}} //구매 딜러사
             //,{field:"h", title:"<spring:message code='global.lbl.salPrsnNm' />",     width:130, attributes:{"class":"al"}} //판매담당자
             ,{field:"i", title:"<spring:message code='global.lbl.purcDt' />",     width:130, attributes:{"class":"al"}} //구매일자
         ]
     });
     */

     // 정비이력그리드
     /*
     $("#lbrGrid").kendoExtGrid({
         editable:false
         ,autoBind:false
         ,height:200
         ,columns:[
             {field:"a",  title:"<spring:message code='global.lbl.line' />",   width:130, attributes:{"class":"al"}} //No
             ,{field:"b", title:"<spring:message code='global.lbl.fosterDt' />",     width:130, attributes:{"class":"al"}} //위탁시간
             ,{field:"c", title:"<spring:message code='global.lbl.fosterNo' />", width:130, attributes:{"class":"al"}} //위탁번호
             ,{field:"d", title:"<spring:message code='global.lbl.fosterTp' />", width:130, attributes:{"class":"al"}} //위탁유형
             ,{field:"e", title:"<spring:message code='global.lbl.carNo' />",     width:130, attributes:{"class":"al"}} //차량번호
             ,{field:"f", title:"<spring:message code='global.lbl.runDist' />",     width:130, attributes:{"class":"al"}} //주행거리
             ,{field:"g", title:"<spring:message code='global.lbl.driver' />",     width:130, attributes:{"class":"al"}} //운전자
             ,{field:"h", title:"<spring:message code='global.lbl.driverHpNo' />",     width:130, attributes:{"class":"al"}} //운전자핸드폰
             ,{field:"i", title:"<spring:message code='global.lbl.serviceAd' />",     width:130, attributes:{"class":"al"}} //서비스고문
             ,{field:"j", title:"<spring:message code='global.lbl.lbrUserNm' />",     width:130, attributes:{"class":"al"}} //정비자
             ,{field:"k", title:"<spring:message code='ser.lbl.arCd' />",     width:130, attributes:{"class":"al"}} //AR
             ,{field:"l", title:"<spring:message code='ser.lbl.outstdAmt' />",     width:130, attributes:{"class":"al"}} //미수금
             ,{field:"m", title:"<spring:message code='global.lbl.suspenseReceipt' />",     width:130, attributes:{"class":"al"}} //가수금
         ]
     });
     */

     // 판매기회 관리 그리드 시작 //
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
                         params["sIntrCarLine"]          = $("#sIntrCarLine").val();
                         params["sIntrModel"]            = $("#sIntrModel").val();

                         console.log("sIntrCarLine:"+$("#sIntrCarLine").data("kendoExtDropDownList").value());
                         console.log("sIntrModel:"+$("#sIntrModel").data("kendoExtDropDownList").value());

                         params["sSaleOpptStepCd"]       = $("#sSaleOpptStepCd").data("kendoExtDropDownList").value();
                         params["sScId"]                 = $("#sScId").data("kendoExtDropDownList").value();
                         params["sStartRegDt"]           = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                         params["sEndRegDt"]             = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

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
                         id:"saleOpptSeq"
                         ,fields:{
                             rnum:{type:"number"}
                             ,saleOpptSeq:{type:"number"}
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
             var saleOpptSeq = selectedVal.saleOpptSeq;

             if(saleOpptSeq != null && saleOpptSeq != "undefined" ){

                 var param = {
                         "sSaleOpptSeq":saleOpptSeq
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
                             dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                         }
                 }).done(function(body) {

                     console.log("selectSalesOpptMgmtByKey:",body);
                     initForm();

                     $("#saleOpptSeq").val(body.saleOpptSeq);
                     $("#custNo").val(body.custNo);
                     $("#custNm").val(body.custNm);
                     $("#hpNo").val(body.hpNo);
                     $("#remark").val(body.remark);
                     $("#saleOpptStepCd").data("kendoExtDropDownList").value(body.saleOpptStepCd);
                     $("#saleOpptStatCd").data("kendoExtDropDownList").value(body.saleOpptStatCd);
                     $("#trsfStatCd").data("kendoExtDropDownList").value(body.trsfStatCd);
                     $("#expcSaleDt").data("kendoExtMaskedDatePicker").value(body.expcSaleDt);
                     $("#succPrbCd").data("kendoExtDropDownList").value(body.succPrbCd);
                     $("#scId").val(body.scId);
                     $("#saleOpptSrcCd").data("kendoExtDropDownList").value(body.saleOpptSrcCd);
                     $("#regUsrId").val(body.regUsrId);
                     $("#regDt").val(body.regDt);

                     //$("#btnSomSave").data("kendoButton").enable(true);

                     $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.read();

                     $("#carGrid").data("kendoExtGrid").dataSource.read();
                     $("#activeGrid").data("kendoExtGrid").dataSource.read();

                 });

             }

         }
         ,editable:false
         ,height:200
         ,navigatable:false
         //,sortable:false
         ,autoBind:false
         ,selectable:"row"
         ,columns:[
                     //{field:"saleOpilegridptSeq", title:"SEQ", width:30}
                     {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                         ,attributes:{"class":"ac"}
                     }
                     ,{field:"a1", title:"<spring:message code='global.lbl.salesOpptCont' />", width:90}/* 판매기회요약 */
                     ,{field:"a", title:"<spring:message code='global.lbl.source' />", width:90}/* 출처 */
                     ,{field:"b1", title:"<spring:message code='global.lbl.promotionNm' />", width:90}/* 프로모션 */
                     ,{field:"b2", title:"<spring:message code='global.lbl.salesStep' />", width:90}/* 판매단계 */
                     ,{field:"b3", title:"<spring:message code='global.lbl.relCustInfo' />", width:90}/* 연계인 */
                     ,{field:"b4", title:"<spring:message code='global.lbl.telNo' />", width:90}/* 전화번호 */
                     ,{field:"b5", title:"<spring:message code='global.lbl.dealSchDt' />", width:90}/* 거래예정일 */
                     ,{field:"b6", title:"<spring:message code='global.lbl.regDt' />", width:90}/* 등록시간 */
                     ,{field:"b7", title:"<spring:message code='crm.lbl.scId' />", width:90}/* 판매고문 */
                     ,{field:"b8", title:"<spring:message code='global.lbl.dlrAndFactory' />", width:90}/* 딜러사/제조사 */
                     ,{field:"b9", title:"<spring:message code='global.lbl.remark' />", width:90}/* 비고 */
         ]
     });
     // 판매기회 관리 그리드 종료 //

    /******************************************************
     * 메시지이력 그리드 - 시작
     ******************************************************/
    $("#msgHistoryGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/slm/leadInfo/selectMsgHistorys.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        var leadNo = $("#leadNo").val();
                        if ( dms.string.isNotEmpty(leadNo) ) {
                            params["sRefKeyNm"] = leadNo;
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
            ,{field:"contactTp", title:"<spring:message code='global.lbl.contactTp' />", width:100            /* 활동유형 */
                ,template:'#if (contactTp !== ""){# #= contactTpMap[contactTp]# #}#'
            }
            ,{field:"contactCont", title:"<spring:message code='global.lbl.contactCont' />"}       /* 연락내용 */
            //,{title:""}
    ]
   });
    /******************************************************
     * 메시지이력 그리드 - 종료
     ******************************************************/


     // IB인 경우 고객조회 팝업호출
     if(callType == "IB"){
         console.log("callType :" + callType);
         console.log("TelNo :" + telNo);
         $("#sHpNo").val(telNo);
         $("#btnLeadSearch").click();
     };

     selectCallInfo = function(){
         console.log('test');
     };

     selectCallInfo();

});

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
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return modelCdObj[modelCd];
}

/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;

    modelCdObj = [];
    $.each(modelCdDSList, function(idx, obj){
        modelCdObj[obj.modelCd] = obj.modelNm;
    });
};

// 모델에 따른 OCN 조회
function selectGridModelCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.modelNm = dataItem.modelNm;

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectOcn.do"
        ,data:JSON.stringify({"modelCd":dataItem.modelCd})
        ,async:false
    });
    ocnCdDSList = responseJson.data;

    ocnCdObj = [];
    $.each(ocnCdDSList, function(idx, obj){
        ocnCdObj[obj.ocnCd] = obj.ocnNm;
    });
};

//TabReset
function tabReset(){

 // Call Info Reset 시작
    //$("#callHpNo").val("");
    $("#callStatCd").data("kendoExtDropDownList").value("");
    $("#nextCallDt").data("kendoDateTimePicker").value("");
    $("#regUrl").val("");
    $("#callRemark").val("");
    $("#callHistGrid").data("kendoExtGrid").dataSource.data([]);
    // Call Info Reset 끝

    resetCustInfoTab();

    //$("#haveCarGrid").data("kendoExtGrid").dataSource.data([]);
    //$("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
    $("#msgHistoryGrid").data("kendoExtGrid").dataSource.data([]);

}

</script>







<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

        <!-- 콜센터실행-고객케어 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.callCenterCustomerCare" /></h1><!-- 콜센터실행-고객케어 -->
                    <div class="btn_right">
                        <button id="btnRecord" class="btn_m"><spring:message code="crm.btn.record" /><!-- 녹취 --></button>
                        <button id="btnCall" class="btn_m"><spring:message code="global.btn.callSend" /><!-- 전화걸기 --></button>
                        <button id="btnVsitCustomer" class="btn_m"><spring:message code="global.btn.visitResv" /><!-- 내방예약 --></button>
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button id="btnCallCenterSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:27%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input id="sCustNm" name="sCustNm" class="form_input" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="sHpNo" name="sHpNo" class="form_input numberic" maxlength="14" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.homeTelNo" /><!-- 집전화 --></th>
                                <td>
                                    <input id="sTelNo" name="sTelNo" class="form_input numberic" maxlength="14" />
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="grid01"></div>
                </div>

            </section>

            <!-- CALL 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.record" /><!-- CALL 정보 --></h2>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:17%;">
                        </colgroup>
                        <tbody id="callCenterActionInfoForm" >
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.callCnt" /><!-- CALL횟수 --></th>
                                <td>
                                    <input type="hidden" id="callSeq" name="callSeq" data-json-obj="true" required data-name="<spring:message code="crm.lbl.callSeq" />" data-bind="value:callSeq" />
                                    <input type="hidden" id="refTableNm" name="refTableNm" data-json-obj="true" />
                                    <input type="hidden" id="refKeyNm" name="refKeyNm" data-json-obj="true" />
                                    <input type="hidden" id="callTp" name="callTp" data-json-obj="true" />
                                    <input type="hidden" id="custNo" name="custNo" data-json-obj="true" />
                                    <input type="hidden" id="extrDgreCnt" name="extrDgreCnt" data-json-obj="true" />
                                    <input id="callCnt" name="callCnt" class="form_input form_readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="hpNo" name="hpNo" class="form_input form_readonly" readonly data-json-obj="true" required data-name="<spring:message code="global.lbl.hpNo" />" data-bind="value:sHpNo" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.callRsltCd" /><!-- 콜결과 --></span></th>
                                <td class="required_area">
                                    <input id="callRsltCd" name="callRsltCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.callRsltCd" />" data-bind="value:callRsltCd" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.nextCallDt" /><!-- 다음Call시간 --></th>
                                <td>
                                    <input id="scheCallDt" name="scheCallDt" class="form_datetimepicker" data-json-obj="true" type="date" data-name="<spring:message code="crm.lbl.nextCallDt" />" data-bind="value:scheCallDt" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.recFileId" /><!-- 녹취파일 --></th>
                                <td>
                                    <input type="text" id="recFileId" name="recFileId" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.callCont" /><!-- 콜내용 --></span></th>
                                <td rowspan="2" colspan="5" class="required_area">
                                    <textarea rows="2" cols="" id="callCont" name="callCont" class="form_textarea" data-json-obj="true" required data-name="<spring:message code="crm.lbl.callCont" />" data-bind="value:callCont" ></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //CALL 정보 -->

            <!-- 고객 케어 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.custCareInfo" /><!-- 고객케어 상세정보 --></h2>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:39%;">
                            <col style="width:10%;">
                            <col style="width:42%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.custCareNm" /><!-- 고객케어명 --></th>
                                <td colspan="3">
                                    <input type="text" id="custCareNm" name="custCareNm" value="" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.custCareCont" /><!-- 고객케어내용 --></th>
                                <td colspan="3">
                                    <textarea rows="3" cols="" id="custCareCont" name="custCareCont" readonly class="form_textarea form_readonly"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //고객 케어 정보 -->

            <!-- 탭메뉴 전체 영역 -->
            <div class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="custInfoTab" class="k-state-active" ><spring:message code="global.lbl.custInfo" /><!-- 고객정보 --></li>
                    <li id="haveCarTab"><spring:message code="global.lbl.haveCar" /> <!-- 보유차량 --></li>
                    <li id="lbrHistoryTab"><spring:message code="ser.lbl.lbrHistory" /> <!-- 정비이력 --></li>
                    <li id="msgHistoryTab" ><spring:message code='global.lbl.msgHistory' /><!-- 메시지이력 --></li>
                    <li><spring:message code="global.lbl.saleOpptHis" /><!-- 판매기회이력 --></li>
                </ul>
                <!-- //탭메뉴 -->

                <!-- 고객 정보 -->
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

                <!-- //고객 정보 -->

                <!-- 보유모델 -->
                <div id="haveCarTabDiv"><!-- 보유차량 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="global.lbl.haveCar" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchHaveCar" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="haveCarGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //보유차량 끝 -->
                <!-- //보유모델 -->

                <!-- 정비 이력 -->
                <div id="lbrHistoryTabDiv"> <!-- 정비이력 -->
                  <section class="group">
                      <div class="header_area">
                          <%-- <h2 class="title_basic"><spring:message code="ser.lbl.lbrHistory" /></h2> --%>
                          <div class="btn_right">
                              <button class="btn_xs" id="btnSearchLbr" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="lbrGrid" class="grid"></div>
                      </div>
                  </section>
                </div> <!-- //정비이력 끝 -->
                <!-- //정비 이력 -->

                <!-- 메시지이력 -->
                <div class="mt0">
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
                </div>
                <!-- //메시지이력 -->

                <!-- 판매기회 -->
                <div class="mt0">
                    <section class="group">
                        <div class="header_area">
                            <div class="btn_right">
                                <button type="button" class="btn_xs" id="btnSalesOpptTab" ><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="salesOpptGrid"></div>
                        </div>
                    </section>
                </div>
                <!-- //판매기회 -->

            </div>
            <!-- //탭메뉴 전체 영역 -->

        <!-- //콜센터실행-고객케어 -->

            <script>

                // 폼 초기화
                function initForm(){

                    $("#callSeq").val("");
                    $("#refTableNm").val("");
                    $("#refKeyNm").val("");
                    $("#callTp").val("");
                    $("#custNo").val("");
                    $("#extrDgreCnt").val("");
                    $("#callCnt").val("");
                    $("#hpNo").data("kendoMaskedTextBox").value("");
                    $("#callRsltCd").data("kendoExtDropDownList").value("");
                    $("#scheCallDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#recFileId").val("");
                    $("#callCont").val("");

                    $("#custCareNm").val("");
                    $("#custCareCont").val("");

                    // 탭 고객정보 초기화
                    resetCustInfoTab();

                    // 탭 그리드 초기화
                    $("#haveCarGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#lbrGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#msgHistoryGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#salesOpptGrid").data("kendoExtGrid").dataSource.data([]);

                    // 탭 그리드 버튼 초기화
                    $("#btnSearchCustInfoTab").data("kendoButton").enable(false);
                    $("#btnSearchHaveCar").data("kendoButton").enable(false);
                    $("#btnSearchLbr").data("kendoButton").enable(false);
                    $("#btnMsgHistoryTab").data("kendoButton").enable(false);
                    $("#btnSalesOpptTab").data("kendoButton").enable(false);

                }

                // 콜결과 DS
                var callRsltCdDs = [];
                var callRsltCdArr = [];
                <c:forEach var="obj" items="${callRsltCdList}">
                    callRsltCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                </c:forEach>

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
                 * 보유차량 그리드 (DataSource)- 시작
                 ******************************************************/
                // 보유차량 - 브랜드
                var purcCarBrandCdMap       = [];
                <c:forEach var="obj" items="${purcCarBrandCdDS}">
                purcCarBrandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                /******************************************************
                 * 보유차량 그리드 (DataSource)- 종료
                 ******************************************************/

                /******************************************************
                * 정비이력 그리드 (DataSource)- 시작
                ******************************************************/
                // 정비이력 RO유형 -- 시작
                var roTpCdList = [];
                var roTpCdListMap = [];
                <c:forEach var="obj" items="${roTpCdList}">
                roTpCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
                roTpCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                // 정비이력 RO유형 -- 끝
                /******************************************************
                * 정비이력 그리드 (DataSource)- 종료
                ******************************************************/

                /******************************************************
                 * 판매기회 그리드 (DataSource)- 시작
                 ******************************************************/
                // 판매기회단계 DS
                var saleOpptStepCdArr = [];
                <c:forEach var="obj" items="${saleOpptStepCdList}">
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
                var trsfStatCdArr = [];
                <c:forEach var="obj" items="${trsfStatCdList}">
                    trsfStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                trsfStatCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = trsfStatCdArr[val];
                    }
                    return returnVal;
                };

                // 판매기회 출처 DS
                var saleOpptSrcCdArr = [];
                <c:forEach var="obj" items="${saleOpptSrcCdList}">
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
                var succPrbCdArr = [];
                <c:forEach var="obj" items="${succPrbCdList}">
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
                  * 메시지이력 탭 (DataSource)- 시작
                  ******************************************************/
                 // 접촉유형 DS
                 var contactTpArr = [];
                 <c:forEach var="obj" items="${activeCdList}">
                     contactTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                     console.log(contactTpArr)
                 </c:forEach>
                 contactTpArrVal = function(val){
                     var returnVal = "";
                     if(val != null && val != ""){
                         returnVal = contactTpArr[val];
                     }
                     return returnVal;
                 };

                 // 접촉업무 DS
                 var contactBizCdArr = [];
                 <c:forEach var="obj" items="${contactBizCdList}">
                     contactBizCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                 </c:forEach>
                 contactBizCdArrVal = function(val){
                     var returnVal = "";
                     if(val != null && val != ""){
                         returnVal = contactBizCdArr[val];
                     }
                     return returnVal;
                 };

                 /******************************************************
                  * 메시지이력 탭 (DataSource)- 종료
                  ******************************************************/

                  /**
                   * hyperlink in grid event of Customer Information
                   */
                   $(document).on("click", ".linkCust", function(e){

                        var grid = $("#grid01").data("kendoExtGrid"),
                        row = $(e.target).closest("tr");
                        var dataItem = grid.dataItem(row);

                        window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                   });

                $(document).ready(function() {

                    $(".tab_area").kendoExtTabStrip({
                        animation:false
                    });

                    // 휴대전화
                    $("#sHpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // 휴대전화
                    $("#hpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // 집전화
                    $("#sTelNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // 콜결과
                    $("#callRsltCd").kendoExtDropDownList({
                        dataSource:callRsltCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 예정콜일자
                    $("#scheCallDt").kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 녹취
                    $("#btnRecord").kendoButton({
                        click:function(e){
                            // 개발중
                            dms.notification.warning("<spring:message code='global.msg.eveloping' />");
                            return;
                        }
                    })

                    // 전화걸기
                    $("#btnCall").kendoButton({
                        click:function(e){
                            // 개발중
                            dms.notification.warning("<spring:message code='global.msg.eveloping' />");
                            return;
                        }
                    })

                    // 내방예약
                    $("#btnVsitCustomer").kendoButton({
                        click:function(e){
                            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.visitCustomer' />","<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMain.do' />", "VIEW-I-10235"); //내방예약
                            return;
                        }
                    })

                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#grid01").data("kendoExtGrid").dataSource.page(1);

                            initForm();
                        }
                    })

                    // 콜센터실행 정보저장
                    var validator = $("#callCenterActionInfoForm").kendoExtValidator().data("kendoExtValidator");
                    $("#btnCallCenterSave").kendoButton({
                        click:function(e){

                            if (validator.validate()) {

                                if ( dms.string.isNotEmpty($("#scheCallDt").data("kendoExtMaskedDateTimePicker").value()) ) {
                                    var callcenterMaxCall = "<c:out value='${callcenterMaxCall}' />"
                                    if ( $("#callCnt").val() >= callcenterMaxCall ) {
                                        // {maxCall 을 초과하여 다음콜을 등록할 수 없습니다.
                                        dms.notification.error("<spring:message code='crm.err.maxCallChk' />");
                                        return;
                                    }
                                }

                                var saveData =
                                    $("#callCenterActionInfoForm").serializeObject(
                                        $("#callCenterActionInfoForm").serializeArrayInSelector("[data-json-obj='true']")
                                    );

                                saveData.scheCallDt = $("#scheCallDt").data("kendoExtMaskedDateTimePicker").value();

                                console.log("saveData:" + JSON.stringify(saveData));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/cal/callCenter/updateCallCenterActionCustomerCare.do' />",
                                    data:JSON.stringify(saveData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        console.log("저장완료---------");
                                        console.log(textStatus);
                                        console.log(jqXHR);

                                        if(textStatus == "success" && jqXHR === true ){
                                            // 저장 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                            $("#grid01").data("kendoExtGrid").dataSource.page(1);
                                            initForm();

                                        }else{
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                });
                                // ajax 종료

                            }
                            // validatrion 종료


                        }
                    });

                    // 콜센터실행 시행내역 그리드 시작
                    $("#grid01").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cal/callCenter/selectCallCenterActionCustomerCares.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sCustNm"] = $("#sCustNm").val();
                                        params["sHpNo"] = $("#sHpNo").data("kendoMaskedTextBox").value();
                                        params["sTelNo"] = $("#sTelNo").data("kendoMaskedTextBox").value();

                                         console.log("grid01 param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"callSeq"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,callSeq:{type:"number"}
                                        ,custNm:{type:"string"}
                                        ,hpNo:{type:"string"}
                                        ,telNo:{type:"string"}
                                        ,callCnt:{type:"number"}
                                        ,callRsltCd:{type:"string"}
                                        ,regUsrNm:{type:"string"}
                                        ,regDt:{type:"date"}
                                        ,callPrsnAllocDt:{type:"date"}
                                        ,scheCallDt:{type:"date"}
                                        ,realCallDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            var callSeq = selectedItem.callSeq;

                            if ( dms.string.isNotEmpty(callSeq) ) {


                                var param = {
                                        "sCallSeq":callSeq
                                        };

                                console.log("콜센터실행 상세 조회 파람:",JSON.stringify(param));
                                //return;

                                $.ajax({
                                        url:"<c:url value='/crm/cal/callCenter/selectCallCenterActionCustomerCareByKey.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                        }
                                }).done(function(body) {

                                    console.log("콜센터실행 상세 조회 결과:",body);

                                    initForm();


                                    // 탭 버튼 활성화
                                    $("#btnSearchCustInfoTab").data("kendoButton").enable(true);
                                    $("#btnSearchHaveCar").data("kendoButton").enable(true);
                                    $("#btnSearchLbr").data("kendoButton").enable(true);
                                    $("#btnMsgHistoryTab").data("kendoButton").enable(true);
                                    $("#btnSalesOpptTab").data("kendoButton").enable(true);

                                    $("#callSeq").val(body.callSeq);
                                    $("#refTableNm").val(body.refTableNm);
                                    $("#refKeyNm").val(body.refKeyNm);
                                    $("#callTp").val(body.callTp);
                                    $("#custNo").val(body.custNo);
                                    $("#extrDgreCnt").val(body.extrDgreCnt);

                                    $("#callCnt").val(body.callCnt);
                                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                                    $("#callRsltCd").data("kendoExtDropDownList").value(body.callRsltCd);
                                    //$("#scheCallDt").data("kendoExtMaskedDateTimePicker").value(body.scheCallDt);     다음콜시간 != 예정콜시간
                                    $("#recFileId").val(body.recFileId);
                                    $("#callCont").val(body.callCont);

                                    // 고객케어정보
                                    $("#custCareNm").val(body.custCareNm);
                                    $("#custCareCont").val(body.custCareCont);

                                });

                            }

                        }
                        ,autoBind:true
                        ,editable:false
                        ,height:305
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100         // 고객명
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            ,{field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                , template:'#= custCdVal(custCd)#'
                            }
                            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100}             /* 휴대전화 */
                            ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:100}       /* 집전화 */
                            ,{field:"callCnt", title:"<spring:message code='global.lbl.callCnt' />", width:100}       /* CALL횟수 */
                            ,{field:"scheCallDt", title:"<spring:message code='crm.lbl.scheCallDt' />", width:120     /* 예정콜일자 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }

                            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100}     /* 등록자 */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100            /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                        ]
                    });
                    // 콜센터실행 시행내역 그리드 종료


                    /******************************************************
                     * 탭 버튼 - 시작
                     ******************************************************/
                    // 메시지이력 탭 조회
                    $("#btnMsgHistoryTab").kendoButton({
                        click:function(e){
                            $("#msgHistoryGrid").data("kendoExtGrid").dataSource.read();
                        }
                        , enable:false
                    });

                    // 판매기회 탭 조회
                    $("#btnSalesOpptTab").kendoButton({
                        click:function(e){
                            $("#salesOpptGrid").data("kendoExtGrid").dataSource.read();
                        }
                        , enable:false
                    });

                    //보유차량탭 조회
                    $("#btnSearchHaveCar").kendoButton({
                        click:function(e) {
                            if ( dms.string.isEmpty($("#custNo").val())){
                                dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                $("#custNo").focus();
                                return false;
                            }

                            $("#haveCarGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                        , enable:false
                    });

                    // 정비이력탭 조회
                    $("#btnSearchLbr").kendoButton({
                        click:function(e) {
                            if ( dms.string.isEmpty($("#custNo").val())){
                                dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                $("#custNo").focus();
                                return false;
                            }
                            $("#lbrGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                        , enable:false
                    });
                    /******************************************************
                     * 탭 버튼 - 종료
                     ******************************************************/


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


                    /******************************************************
                     * 탭 그리드 - 시작
                     ******************************************************/
                     // 보유차량 그리드 - 시작
                     $("#haveCarGrid").kendoExtGrid({
                         dataSource:{
                             transport:{
                                 read:{
                                     url:"<c:url value='/crm/cal/callCenter/selectCustomerCareHaveCar.do' />"
                                 }
                                 ,parameterMap:function(options, operation) {
                                     if (operation === "read") {

                                         var params = {};

                                         params["recordCountPerPage"]   = options.pageSize;
                                         params["pageIndex"]            = options.page;
                                         params["firstIndex"]           = options.skip;
                                         params["lastIndex"]            = options.skip + options.take;
                                         params["sort"]                 = options.sort;

                                         //params["sDlrCd"] = $("#dlrCd").val();

                                         var grid = $("#grid01").data("kendoExtGrid");
                                         var selectedVal = grid.dataItem(grid.select());
                                         if ( dms.string.isNotEmpty(selectedVal) ) {
                                             params["sCustNo"] = selectedVal.custNo;
                                         } else {
                                             return;
                                         }

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
                                         id:"vinNo"
                                            ,fields:{
                                               vinNo               :{type:"string"}
                                             , ncarDstinCd         :{type:"string"}
                                             , dlrCd               :{type:"string"}
                                             , carRegNo            :{type:"string"}
                                             , carlineCd           :{type:"string"}
                                             , carlineNm           :{type:"string"}
                                             , modelCd             :{type:"string"}
                                             , modelNm             :{type:"string"}
                                             , ocnCd               :{type:"string"}
                                             , ocnNm               :{type:"string"}
                                             , extColorCd          :{type:"string"}
                                             , extColorNm          :{type:"string"}
                                             , intColorCd          :{type:"string"}
                                             , intColorNm          :{type:"string"}
                                             , corpCarDstinCd      :{type:"string"}
                                             , carBrandCd          :{type:"string"}
                                             , carNm               :{type:"string"}
                                             , enginNo             :{type:"string"}
                                             , custSaleDt          :{type:"date"}
                                             , dlrNm               :{type:"string"}
                                         }
                                     }
                             }
                         }
                         ,editable:false
                         ,autoBind:false
                         ,navigatable:false
                         ,pageable:false
                         ,height:158
                         ,columns:[
                             {field:"carBrandCd",  title:"<spring:message code='global.lbl.brand' />",   width:130, attributes:{"class":"ac"}, template:"#= purcCarBrandCdMap[carBrandCd] #"}  //브랜드
                             ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />",     width:130, attributes:{"class":"ac"}} //차종
                             ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />",     width:130, attributes:{"class":"ac"}} //모델
                             ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}} //VIN
                             ,{field:"enginNo", title:"<spring:message code='global.lbl.enginNo' />", width:130, attributes:{"class":"ac"}} //엔진번호
                             ,{field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />",     width:130, attributes:{"class":"al"}} //번호판
                             ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",     width:130, attributes:{"class":"ac"}} //외장색
                             ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",     width:130, attributes:{"class":"ac"}} //내장색
                             ,{field:"dlrNm", title:"<spring:message code='global.lbl.purcDlrComp' />",     width:130, attributes:{"class":"ac"}} //구매 딜러사
                             ,{field:"custSaleDt", title:"<spring:message code='global.lbl.purcDt' />",     width:130, attributes:{"class":"ac"}
                                 ,format:"{0:<dms:configValue code='dateFormat' />}"
                             } //구매일자
                             ,{title:""}
                         ]
                     });
                     // 보유차량 그리드 - 종료

                     // 정비이력 그리드 - 시작
                     $("#lbrGrid").kendoExtGrid({
                         dataSource:{
                             transport:{
                                 read:{
                                     url:"<c:url value='/crm/cal/callCenter/selectCustomerCareRepairOrders.do' />"
                                     ,dataType:"json"
                                     ,type:"POST"
                                     ,contentType:"application/json"
                                 }
                                 ,parameterMap:function(options, operation) {
                                     if (operation === "read") {

                                         var params = {};

                                         params["recordCountPerPage"] = options.pageSize;
                                         params["pageIndex"] = options.page;
                                         params["firstIndex"] = options.skip;
                                         params["lastIndex"] = options.skip + options.take;
                                         params["sort"] = options.sort;

                                         var grid = $("#grid01").data("kendoExtGrid");
                                         var selectedVal = grid.dataItem(grid.select());
                                         if ( dms.string.isNotEmpty(selectedVal) ) {
                                             params["sCarOwnerId"] = selectedVal.custNo;
                                         } else {
                                             return;
                                         }


                                         return kendo.stringify(params);

                                     }else if (operation !== "read" && options.models) {
                                         return kendo.stringify(options.models);
                                     }
                                 }
                             }
                             ,schema:{
                                 model:{
                                     id:"rnum"
                                     ,fields:{
                                         rnum:{type:"number", editable:false}
                                         ,dlrCd:{type:"string", editable:false}
                                         ,resvDocNo:{type:"string", editable:false}
                                         ,roDocNo:{type:"string", editable:false}
                                     }
                                 }
                             }
                         }
                         ,height:158
                         ,pageable:false
                         ,navigatable:false
                         ,autoBind:false
                         ,editable:false
                         ,columns:[
                             {field:"dlrCd", title:"<spring:message code='global.lbl.dealer' />", width:100, attributes:{"class":"ac"}}  // 딜러
                             ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100, attributes:{"class":"ac"}}                    // 차량번호
                             ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}                       // VIN
                             ,{field:"carOwnNm", title:"<spring:message code='global.lbl.carOwner' />", width:100, attributes:{"class":"ac"}}                 // 차량소유주
                             ,{field:"driverNm", title:"<spring:message code='global.lbl.vsitr' />", width:100, attributes:{"class":"ac"}}                    // 방문자
                             ,{field:"carNm", title:"<spring:message code='global.lbl.car' />", width:100, attributes:{"class":"ac"}}                         // 차량
                             ,{field:"runDistVal", title:"<spring:message code='global.lbl.runDist' />", width:70, attributes:{"class":"ar"}}                   // 주행거리
                             ,{field:"roDocNo", title:"<spring:message code='global.lbl.roDocNo' />", width:150, attributes:{"class":"ac"}}                       // RO번호
                             ,{field:"rnum", title:"<spring:message code='ser.lbl.roDt' />", width:100, attributes:{"class":"ar"}}     // RO확인시간
                             ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                                 , attributes:{"class":"ac"}
                                 , editor:function(container, options){
                                     $('<input data-bind="value:' + options.field + '"  />')
                                     .appendTo(container)
                                     .kendoExtDropDownList({
                                         dataTextField:"cmmCdNm"
                                         , dataValueField:"cmmCd"
                                         , dataSource:roTpCdList
                                     });
                                 }
                                 , template:'#if (roTp !== ""){# #= roTpCdListMap[roTp]# #}#'
                             }                                // RO유형
                             ,{field:"ro", title:"<spring:message code='global.lbl.roUser' />", width:100, attributes:{"class":"ac"}}                            // RO발행자
                             ,{title:""}
                         ]
                     });
                     // 정비이력 그리드 - 종료

                     // 메시지이력 그리드 - 시작
                    $("#msgHistoryGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cal/callCenter/selectCustomerCareMsgHistorys.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        var grid = $("#grid01").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sCustNo"] = selectedVal.custNo;
                                            params["sRefKeyNm"] = selectedVal.refKeyNm;
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
                                         ,contactBizCd:{type:"string"}
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
                            ,{field:"contactBizCd", title:"<spring:message code='global.lbl.contactBizCd' />", width:100            /* 접촉업무 */
                                , template:'#= contactBizCdArrVal(contactBizCd)#'
                            }
                            ,{field:"contactCont", title:"<spring:message code='global.lbl.contactCont' />"}       /* 연락내용 */
                            //,{title:""}
                    ]
                   });
                    //메시지이력 그리드 - 종료

                    // 판매기회 관리 그리드 시작
                    $("#salesOpptGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cal/callCenter/selectCustomerCareSalesOpptMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        var grid = $("#grid01").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sCustNo"] = selectedVal.custNo;
                                        } else {
                                            return;
                                        }

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
                        ,autoBind:false
                        ,editable:false
                        ,height:256
                        ,navigatable:false
                        ,pageable:false
                        ,sortable:false
                        //,selectable:"row"
                        ,columns:[
                                    //{field:"saleOpptNo", title:"SEQ", width:60},
                                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                        , attributes:{"class":"ac"}
                                    }
                                    ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100}         // 고객명
                                    /*
                                    ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100         // 고객명
                                        ,template:function(dataItem){
                                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                            return spanObj;
                                        }
                                    }
                                    ,{field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                        , template:'#= custCdVal(custCd)#'
                                    }
                                     */
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
                                    ,{field:"scNm", title:"1<spring:message code='sal.lbl.salesAdvisor' />", width:100}               /* 판매고문 */
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
                    // 판매기회 관리 그리드 종료
                    /******************************************************
                     * 탭 그리드 - 종료
                     ******************************************************/

                });
            </script>
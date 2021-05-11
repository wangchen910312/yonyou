<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 캠페인 대상자 고객추출 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.crmTargClientExtr" /></h1><!-- 대상자 고객추출 -->
            <div class="btn_right">
                <button type="button" id="btnAddTarg" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                <button type="button" id="btnSaveTarg" class="btn_m btn_save"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                <button type="button" id="btnDelTarg" class="btn_m btn_delete"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
                <button type="button" id="btnTargExtracting" class="btn_m"><spring:message code="crm.btn.extracting" /></button><!-- 추출진행 -->
            </div>
        </div>

        <div class="clfix">
            <div class="content_left">
                <div class="header_area pt0">
                    <h2 class="title_basic"><spring:message code="crm.title.TargCategory" /></h2><!-- 대상 카테고리 -->
                </div>
                <div class="target_category">
                    <ul>
                        <li><a href="javascript:;"><spring:message code="global.menu.fav" /></a><!-- 즐겨찾기 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500102');"><spring:message code="global.lbl.sex" /></a></li><!-- 성별 -->
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.perCustInfo" /></a><!-- 개인고객정보 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500101');"><spring:message code="crm.lbl.birthYyyy" /></a></li><!-- 태어난 해 -->
                                <li><a href="javascript:f_addInput('CRM7500102');"><spring:message code="global.lbl.sex" /></a></li><!-- 성별 -->
                                <li><a href="javascript:f_addInput('CRM7500103');"><spring:message code="global.lbl.addr" /></a></li><!-- 주소 -->
                                <li><a href="javascript:f_addInput('CRM7500104');"><spring:message code="global.lbl.birthday" /></a></li><!-- 생일 -->
                                <li><a href="javascript:f_addInput('CRM7500105');"><spring:message code="crm.lbl.birthdayOhter" /></a></li><!-- 생일 -->
                                <li><a href="javascript:f_addInput('CRM7500106');"><spring:message code="crm.lbl.blueMembers" /></a></li><!-- Blue Members -->
                                <li><a href="javascript:f_addInput('CRM7500107');"><spring:message code="crm.lbl.blueMembersPoint" /></a></li><!-- Blue Members Point -->
                                <li><a href="javascript:f_addInput('CRM7500108');"><spring:message code="crm.lbl.dealerMember" /></a></li><!-- 딜러회원 -->
                                <li><a href="javascript:f_addInput('CRM7500109');"><spring:message code="crm.lbl.dealerMemberPoint" /></a></li><!-- 딜러회원 Point -->
                                <li><a href="javascript:f_addInput('CRM7500110');"><spring:message code="crm.lbl.custSource" /></a></li><!-- 고객출처 -->
                                <li><a href="javascript:f_addInput('CRM7500111');"><spring:message code="crm.lbl.custReqDt" /></a></li><!-- 고객 신규날짜 -->
                                <li><a href="javascript:f_addInput('CRM7500150');"><spring:message code="global.lbl.custCd" /></a></li><!-- 잠재/보유고객 -->
                                <li><a href="javascript:f_addInput('CRM7500112');"><spring:message code="crm.lbl.mLevel" /></a></li><!-- 회원등급 -->
                                <li><a href="javascript:f_addInput('CRM7500113');"><spring:message code="crm.lbl.bmMembGrade" /></a></li><!-- BM 회원등급 -->
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.saleOpptInfo" /></a><!-- 판매기회정보 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500212');"><spring:message code="crm.lbl.intentionCarline" /></a></li><!-- 의향차종 -->
                                <li><a href="javascript:f_addInput('CRM7500213');"><spring:message code="crm.lbl.activeGrade" /></a></li><!-- 추적등급 -->
<%--                                 <li><a href="javascript:f_addInput('CRM7500214');"><spring:message code="crm.lbl.expectPureTime" /></a></li><!-- 예상구매시기 --> --%>
                                <li><a href="javascript:f_addInput('CRM7500215');"><spring:message code="global.lbl.newRegDt" /></a></li><!-- 신규날짜 -->
                                <!--<li><a href="javascript:f_addInput('CRM7500216');"><spring:message code="crm.lbl.sixMonthPure" /></a></li>--><!-- 6개월이내 구매확률 -->
                                <li><a href="javascript:f_addInput('CRM7500217');"><spring:message code="crm.lbl.expcBpPrice" /></a></li><!-- 예상거래가격 -->
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.pureInfo" /></a><!-- 구매정보 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500425');"><spring:message code="crm.lbl.pureExperience" /></a></li><!-- 구매경험 -->
                                <li><a href="javascript:f_addInput('CRM7500426');"><spring:message code="crm.lbl.latelyPureCar" /></a></li><!-- 최근구매차종 -->
                                <li><a href="javascript:f_addInput('CRM7500427');"><spring:message code="crm.lbl.latelyPureCarDt" /></a></li><!-- 최근구매차 구매일 -->
                                <li><a href="javascript:f_addInput('CRM7500428');"><spring:message code="global.lbl.haveCar" /></a></li><!-- 보유차종 -->
                                <li><a href="javascript:f_addInput('CRM7500429');"><spring:message code="crm.lbl.havePureDt" /></a></li><!-- 보유차 구매일 -->
                                <li><a href="javascript:f_addInput('CRM7500430');"><spring:message code="crm.lbl.haveCarCnt" /></a></li><!-- 보유 대수 -->
                                <li><a href="javascript:f_addInput('CRM7500431');"><spring:message code="crm.lbl.dlrCdPureCarCnt" /></a></li><!-- 본 딜러에서 구매 대수 -->
                                <li><a href="javascript:f_addInput('CRM7500432');"><spring:message code="crm.lbl.ncarRelease" /></a></li><!-- 신차 출고일 -->
<%--                                 <li><a href="javascript:f_addInput('CRM7500433');"><spring:message code="global.lbl.insurance" /></a></li><!-- 보험 --> --%>
<%--                                 <li><a href="javascript:f_addInput('CRM7500434');"><spring:message code="crm.lbl.fincRate" /></a></li><!-- 금융 --> --%>
<%--                                 <li><a href="javascript:f_addInput('CRM7500435');"><spring:message code="ser.lbl.incStartDt" /></a></li><!-- 보험 시작일 --> --%>
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.lbrInfo" /></a><!-- 정비정보 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500318');"><spring:message code="crm.lbl.lbrDt" /></a></li><!-- 정비 일자 -->
                                <li><a href="javascript:f_addInput('CRM7500319');"><spring:message code="crm.lbl.lbrDtAfter" /></a></li><!-- 정비 일자 -->
                                <li><a href="javascript:f_addInput('CRM7500320');"><spring:message code="crm.lbl.runDistVal" /></a></li><!-- 주행 거리 -->
                                <li><a href="javascript:f_addInput('CRM7500321');"><spring:message code="crm.lbl.lbrAmt" /></a></li><!-- 정비 금액 -->
                                <li><a href="javascript:f_addInput('CRM7500322');"><spring:message code="crm.lbl.lbrAccAmt" /></a></li><!-- 정비 누적 금액 -->
                                <li><a href="javascript:f_addInput('CRM7500323');"><spring:message code="par.lbl.invResvWorkType" /></a></li><!-- 정비위탁유형 -->
                                <li><a href="javascript:f_addInput('CRM7500324');"><spring:message code="crm.lbl.lbrCnt" /></a></li><!-- 정비 횟수 -->
                                <li><a href="javascript:f_addInput('CRM7500325');"><spring:message code="ser.lbl.lbrTp" /></a></li><!-- 수리유형 -->
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.venderTelInfo" /></a><!-- 연락정보 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500533');"><spring:message code="crm.lbl.peridAddrHave" /></a></li><!-- 유효주소보유 -->
                                <li><a href="javascript:f_addInput('CRM7500534');"><spring:message code="crm.lbl.repTelHave" /></a></li><!-- 대표전화보유 -->
                                <li><a href="javascript:f_addInput('CRM7500535');"><spring:message code="crm.lbl.hpTelHave" /></a></li><!-- 핸드폰전화보유 -->
                                <li><a href="javascript:f_addInput('CRM7500536');"><spring:message code="crm.lbl.wechatHave" /></a></li><!-- WECHAT 보유 -->
                                <li><a href="javascript:f_addInput('CRM7500537');"><spring:message code="crm.lbl.smsRejectRecvOff" /></a></li><!-- SMS 수신 거부 제외 -->
                                <li><a href="javascript:f_addInput('CRM7500538');"><spring:message code="crm.lbl.hpRejectRecvOff" /></a></li><!-- 휴대전화 수신 거부 제외 -->
                                <li><a href="javascript:f_addInput('CRM7500539');"><spring:message code="crm.lbl.homeTelRejectRecvOff" /></a></li><!-- 집전화 수신 거부 제외 -->
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.perVenHis" /></a><!-- 개인거래이력 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500640');"><spring:message code="crm.lbl.activePlan" /></a></li><!-- 활돌방법 -->
                                <li><a href="javascript:f_addInput('CRM7500641');"><spring:message code="crm.lbl.activeEnterDt" /></a></li><!-- 판매기회추적추가 일자 -->
                                <li><a href="javascript:f_addInput('CRM7500642');"><spring:message code="crm.lbl.activeEnterCnt" /></a></li><!-- 활동 참가 횟수 -->
                                <li><a href="javascript:f_addInput('CRM7500643');"><spring:message code="crm.lbl.custCareDt" /></a></li><!-- 고객 케어 일 -->
                                <li><a href="javascript:f_addInput('CRM7500644');"><spring:message code="crm.lbl.custCareCnt" /></a></li><!-- 고객 케어 횟수 -->
                                <li><a href="javascript:f_addInput('CRM7500645');"><spring:message code="global.lbl.stsfIvstDtEx" /></a></li><!-- 설문 일 -->
                                <li><a href="javascript:f_addInput('CRM7500646');"><spring:message code="global.lbl.stsfIvstCnt" /></a></li><!-- 설문 횟수 -->
                                <li><a href="javascript:f_addInput('CRM7500647');"><spring:message code="crm.lbl.lately3MonthAccessCnt" /></a></li><!-- 최근 3개월내방횟수 -->
                            </ul>
                        </li>
                        <li><a href="javascript:;"><spring:message code="crm.lbl.campaignTouchInfo" /></a><!-- 캠페인접촉정보 -->
                            <ul>
                                <li><a href="javascript:f_addInput('CRM7500748');"><spring:message code="crm.lbl.useCampaign" /></a></li><!-- 참여 캠페인 -->
                                <li><a href="javascript:f_addInput('CRM7500749');"><spring:message code="crm.lbl.useDt" /></a></li><!-- 참여일 -->
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="content_right">
                <section class="group">
                    <div class="header_area pt0">
                        <h2 class="title_basic"><spring:message code="crm.lbl.custExtrTermDetil" /></h2><!-- 추출조건 상세 -->
                       <!--  <div class="btn_right">
                            <button type="button" class="btn_s">조회 조건 저장</button>
                        </div> -->
                    </div>
                    <form id="crmTargExtractMasterForm">
                        <div class="target_form">
                            <span class="span_txt"><spring:message code="crm.lbl.custExtrTermTitle" /></span><!-- 추출조건 제목 -->
                            <span class="span_form">
                                <input id="dlrCd" name="dlrCd" type="hidden">
                                <input id="custExtrTermNo" name="custExtrTermNo" type="hidden">
                                <input id="useYn" name="useYn" type="hidden" value="Y">
                                <input type="text" id="custExtrTermNm" name="custExtrTermNm" value="" class="form_input" onKeyUp="txtLimit(this, '100');">
                            </span>
                        </div>
                        <p class="target_txt">
                            <input id="randomYn" name="randomYn" type="checkbox" class="form_check" onclick="f_randomYn()" unchecked> <spring:message code="crm.info.onRandom" /><!-- 랜덤으로 -->
                            <input id="randomCnt" name="randomCnt" type="nember" value="" class="form_numeric ar" style="width:50px;">
                            <spring:message code="crm.info.extrRandomTermAdd" /><!-- 건 추출 * 체크(v)시 랜덤 조회 조건 추가 -->
                        </p>
                    </form>
                </section>
                <section class="group">
                    <div class="header_area pt0">
                        <h2 class="title_basic"><spring:message code="crm.lbl.custExtrTermDetailList" /></h2><!-- 조건 상세 목록 -->
                    </div>
                    <div class="target_setting">
                        <ul>
                            <li id="CRM7500101">
                                <div class="target_btn"><button id="CRM7500101_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.birthYyyy" /></div><!-- 태어난 해 -->
                                <div class="target_content">
                                    <input id="CRM7500101_fleg" name="CRM7500101_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500101-01" name="CRM7500101-01" maxlength="4" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500101-02" name="CRM7500101-02" maxlength="4" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500102">
                                <div class="target_btn"><button id="CRM7500102_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.sex" /></div><!-- 성별 -->
                                <div class="target_content">
                                    <input id="CRM7500102_fleg" name="CRM7500102_fleg" type="hidden" value="N">
                                    <label for="CRM7500102-01-01" class="label_check">
                                        <input id="CRM7500102-01-01" name="CRM7500102-01" type="radio" value="M" class="form_check" />
                                        <spring:message code="global.lbl.man" /><!-- 남성 -->
                                    </label>
                                    <label for="CRM7500102-01-02" class="label_check">
                                        <input id="CRM7500102-01-02" name="CRM7500102-01" type="radio" value="F" class="form_check" />
                                        <spring:message code="global.lbl.woman" /><!-- 여성 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500103">
                                <div class="target_btn"><button id="CRM7500103_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.addr" /></div><!-- 주소 -->
                                <div class="target_content">
                                    <input id="CRM7500103_fleg" name="CRM7500103_fleg" type="hidden" value="N">
                                    <input id="CRM7500103-01" name="CRM7500103-01" value="" class="form_comboBox" style="width:49%" />
                                    <input id="CRM7500103-02" name="CRM7500103-02" value="" class="form_comboBox" style="width:49%" />
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500104">
                                <div class="target_btn"><button id="CRM7500104_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.birthday" /></div><!-- 생일 -->
                                <div class="target_content">
                                    <input id="CRM7500104_fleg" name="CRM7500104_fleg" type="hidden" value="N">
                                    <input id="CRM7500104-01" name="CRM7500104-01" value="" class="form_comboBox" style="width:22%" />
                                    <input id="CRM7500104-02" name="CRM7500104-02" value="" class="form_comboBox" style="width:23%" />
                                    <span class="txt_from">~</span>
                                    <input id="CRM7500104-03" name="CRM7500104-03" value="" class="form_comboBox" style="width:22%" />
                                    <input id="CRM7500104-04" name="CRM7500104-04" value="" class="form_comboBox" style="width:23%" />
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500105">
                                <div class="target_btn"><button id="CRM7500105_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.birthday" /></div><!-- 생일 -->
                                <div class="target_content">
                                    <input id="CRM7500105_fleg" name="CRM7500105_fleg" type="hidden" value="N">
                                    <spring:message code="crm.info.birthdayBefore" /><!-- 생일 전 -->
                                    <input id="CRM7500105-01" name="CRM7500105-01" type="nember" value="" class="form_numeric ar" style="width:22%">
                                    <spring:message code="global.lbl.day" /><!-- 일 -->
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500106">
                                <div class="target_btn"><button id="CRM7500106_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.blueMembers" /></div><!-- Blue Members -->
                                <div class="target_content">
                                    <input id="CRM7500106_fleg" name="CRM7500106_fleg" type="hidden" value="N">
                                    <label for="CRM7500106-01-01" class="label_check">
                                        <input id="CRM7500106-01-01" name="CRM7500106-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500106-01-02" class="label_check">
                                        <input id="CRM7500106-01-02" name="CRM7500106-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500107">
                                <div class="target_btn"><button id="CRM7500107_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.blueMembersPoint" /></div><!-- Blue Members Point -->
                                <div class="target_content">
                                    <input id="CRM7500107_fleg" name="CRM7500107_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500107-01" name="CRM7500107-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500107-02" name="CRM7500107-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500108">
                                <div class="target_btn"><button id="CRM7500108_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.dealerMember" /></div><!-- 딜러회원 -->
                                <div class="target_content">
                                    <input id="CRM7500108_fleg" name="CRM7500108_fleg" type="hidden" value="N">
                                    <label for="CRM7500108-01-01" class="label_check">
                                        <input id="CRM7500108-01-01" name="CRM7500108-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500108-01-02" class="label_check">
                                        <input id="CRM7500108-01-02" name="CRM7500108-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500109">
                                <div class="target_btn"><button id="CRM7500109_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.dealerMemberPoint" /></div><!-- 딜러회원 Point -->
                                <div class="target_content">
                                    <input id="CRM7500109_fleg" name="CRM7500109_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500109-01" name="CRM7500109-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500109-02" name="CRM7500109-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500110">
                                <div class="target_btn"><button id="CRM7500110_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.custSource" /></div><!-- 고객출처 -->
                                <div class="target_content">
                                    <input id="CRM7500110_fleg" name="CRM7500110_fleg" type="hidden" value="N">
                                    <select id="CRM7500110-01" name="CRM7500110-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500111">
                                <div class="target_btn"><button id="CRM7500111_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.custReqDt" /></div><!-- 고객 신규날짜 -->
                                <div class="target_content">
                                    <input id="CRM7500111_fleg" name="CRM7500111_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500111-01" name="CRM7500111-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500111-02" name="CRM7500111-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500150">
                                <div class="target_btn"><button id="CRM7500150_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.custCd" /></div><!-- 잠재/보유고객 -->
                                <div class="target_content">
                                    <input id="CRM7500150_fleg" name="CRM7500150_fleg" type="hidden" value="N">
                                    <label for="CRM7500150-01-01" class="label_check">
                                        <input id="CRM7500150-01-01" name="CRM7500150-01" type="radio" value="01" class="form_check" />
                                        <spring:message code="crm.lbl.potenCust" /><!-- 잠재고객 -->
                                    </label>
                                    <label for="CRM7500150-01-02" class="label_check">
                                        <input id="CRM7500150-01-02" name="CRM7500150-01" type="radio" value="02" class="form_check" />
                                        <spring:message code="crm.lbl.haveCust" /><!-- 보유고객 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500112">
                                <div class="target_btn"><button id="CRM7500112_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.mLevel" /></div><!-- 회원등급 -->
                                <div class="target_content">
                                    <input id="CRM7500112_fleg" name="CRM7500112_fleg" type="hidden" value="N">
                                    <select id="CRM7500112-01" name="CRM7500112-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500113">
                                <div class="target_btn"><button id="CRM7500113_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.bmMembGrade" /></div><!-- BM 회원등급 -->
                                <div class="target_content">
                                    <input id="CRM7500113_fleg" name="CRM7500113_fleg" type="hidden" value="N">
                                    <select id="CRM7500113-01" name="CRM7500113-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500212">
                                <div class="target_btn"><button id="CRM7500212_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.intentionCarline" /></div><!-- 의향차종 -->
                                <div class="target_content">
                                    <input id="CRM7500212_fleg" name="CRM7500212_fleg" type="hidden" value="N">
                                    <select id="CRM7500212-01" name="CRM7500212-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500213">
                                <div class="target_btn"><button id="CRM7500213_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.activeGrade" /></div><!-- 추적등급 -->
                                <div class="target_content">
                                    <input id="CRM7500213_fleg" name="CRM7500213_fleg" type="hidden" value="N">
                                    <select id="CRM7500213-01" name="CRM7500213-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500214">
                                <div class="target_btn"><button id="CRM7500214_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.expectPureTime" /></div><!-- 예상구매시기 -->
                                <div class="target_content">
                                    <input id="CRM7500214_fleg" name="CRM7500214_fleg" type="hidden" value="N">
                                    <input id="CRM7500214-01" name="CRM7500214-01" value="" class="form_comboBox"/>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500215">
                                <div class="target_btn"><button id="CRM7500215_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.newRegDt" /></div><!-- 신규날짜 -->
                                <div class="target_content">
                                    <input id="CRM7500215_fleg" name="CRM7500215_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500215-01" name="CRM7500215-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500215-02" name="CRM7500215-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500216">
                                <div class="target_btn"><button id="CRM7500216_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.sixMonthPure" /></div><!-- 6개월이내 구매확률 -->
                                <div class="target_content">
                                    <input id="CRM7500216_fleg" name="CRM7500216_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            %<input id="CRM7500216-01" name="CRM7500216-01" type="nember" value="" class="form_numeric ar" style="width:84%">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            %<input id="CRM7500216-02" name="CRM7500216-02" type="nember" value="" class="form_numeric ar" style="width:82%">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500217">
                                <div class="target_btn"><button id="CRM7500217_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.expcBpPrice" /></div><!-- 구매예상금액 -->
                                <div class="target_content">
                                    <input id="CRM7500217_fleg" name="CRM7500217_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500217-01" name="CRM7500217-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500217-02" name="CRM7500217-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500318">
                                <div class="target_btn"><button id="CRM7500318_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.lbrDt" /></div><!-- 정비일자 -->
                                <div class="target_content">
                                    <input id="CRM7500318_fleg" name="CRM7500318_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500318-01" name="CRM7500318-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500318-02" name="CRM7500318-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500425">
                                <div class="target_btn"><button id="CRM7500425_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.pureExperience" /></div><!-- 구매경험 -->
                                <div class="target_content">
                                    <input id="CRM7500425_fleg" name="CRM7500425_fleg" type="hidden" value="N">
                                    <label for="CRM7500425-01-01" class="label_check">
                                        <input id="CRM7500425-01-01" name="CRM7500425-01" type="radio" value="FP" class="form_check" />
                                        <spring:message code="crm.lbl.firstPure" /><!-- 첫 구매 -->
                                    </label>
                                    <label for="CRM7500425-01-02" class="label_check">
                                        <input id="CRM7500425-01-02" name="CRM7500425-01" type="radio" value="RP" class="form_check" />
                                        <spring:message code="crm.lbl.rePure" /><!-- 재 구매 -->
                                    </label>
                                    <label for="CRM7500425-01-03" class="label_check">
                                        <input id="CRM7500425-01-03" name="CRM7500425-01" type="radio" value="TP" class="form_check" />
                                        <spring:message code="crm.lbl.tradePure" /><!-- 교환구매 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500426">
                                <div class="target_btn"><button id="CRM7500426_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.latelyPureCar" /></div><!-- 최근구매차종 -->
                                <div class="target_content">
                                    <input id="CRM7500426_fleg" name="CRM7500426_fleg" type="hidden" value="N">
                                    <select id="CRM7500426-01" name="CRM7500426-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500427">
                                <div class="target_btn"><button id="CRM7500427_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.latelyPureCarDt" /></div><!-- 최근 구매차 구매일 -->
                                <div class="target_content">
                                    <input id="CRM7500427_fleg" name="CRM7500427_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500427-01" name="CRM7500427-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500427-02" name="CRM7500427-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500428">
                                <div class="target_btn"><button id="CRM7500428_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.haveCar" /></div><!-- 보유차종 -->
                                <div class="target_content">
                                    <input id="CRM7500428_fleg" name="CRM7500428_fleg" type="hidden" value="N">
                                    <select id="CRM7500428-01" name="CRM7500428-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500429">
                                <div class="target_btn"><button id="CRM7500429_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.havePureDt" /></div><!-- 보유차 구매일 -->
                                <div class="target_content">
                                    <input id="CRM7500429_fleg" name="CRM7500429_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500429-01" name="CRM7500429-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500429-02" name="CRM7500429-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500430">
                                <div class="target_btn"><button id="CRM7500430_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.haveCarCnt" /></div><!-- 보유 대수 -->
                                <div class="target_content">
                                    <input id="CRM7500430_fleg" name="CRM7500430_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500430-01" name="CRM7500430-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500430-02" name="CRM7500430-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500431">
                                <div class="target_btn"><button id="CRM7500431_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.dlrCdPureCarCnt" /></div><!-- 본 딜러에서 구매 대수 -->
                                <div class="target_content">
                                    <input id="CRM7500431_fleg" name="CRM7500431_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500431-01" name="CRM7500431-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500431-02" name="CRM7500431-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500432">
                                <div class="target_btn"><button id="CRM7500432_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.ncarRelease" /></div><!-- 신차 출고일 -->
                                <div class="target_content">
                                    <input id="CRM7500432_fleg" name="CRM7500432_fleg" type="hidden" value="N">
                                    <spring:message code="crm.info.releaseAfter" /><!-- 출고 후 -->
                                    <input id="CRM7500432-01" name="CRM7500432-01" type="nember" value="" class="form_numeric ar" style="width:22%">
                                    <spring:message code="global.lbl.day" /><!-- 일 -->
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500433">
                                <div class="target_btn"><button id="CRM7500433_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.insurance" /></div><!-- 보험유무 -->
                                <div class="target_content">
                                    <input id="CRM7500433_fleg" name="CRM7500433_fleg" type="hidden" value="N">
                                    <label for="CRM7500433-01-01" class="label_check">
                                        <input id="CRM7500433-01-01" name="CRM7500433-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500433-01-02" class="label_check">
                                        <input id="CRM7500433-01-02" name="CRM7500433-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500434">
                                <div class="target_btn"><button id="CRM7500434_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.fincRate" /></div><!-- 금융유무 -->
                                <div class="target_content">
                                    <input id="CRM7500434_fleg" name="CRM7500434_fleg" type="hidden" value="N">
                                    <label for="CRM7500434-01-01" class="label_check">
                                        <input id="CRM7500434-01-01" name="CRM7500434-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500434-01-02" class="label_check">
                                        <input id="CRM7500434-01-02" name="CRM7500434-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500435">
                                <div class="target_btn"><button id="CRM7500435_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="ser.lbl.incStartDt" /></div><!-- 보험 시작일 -->
                                <div class="target_content">
                                    <input id="CRM7500435_fleg" name="CRM7500435_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500435-01" name="CRM7500435-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500435-02" name="CRM7500435-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500319">
                                <div class="target_btn"><button id="CRM7500319_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.lbrDt" /></div><!-- 정비일자 -->
                                <div class="target_content">
                                    <input id="CRM7500319_fleg" name="CRM7500319_fleg" type="hidden" value="N">
                                    <spring:message code="crm.info.lastLbrAfter" /><!-- 마지막 정비 후 -->
                                    <input id="CRM7500319-01" name="CRM7500319-01" type="nember" value="" class="form_numeric ar" style="width:22%">
                                    <spring:message code="global.lbl.day" /><!-- 일 -->
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500320">
                                <div class="target_btn"><button id="CRM7500320_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.runDistVal" /></div><!-- 주행 거리 -->
                                <div class="target_content">
                                    <input id="CRM7500320_fleg" name="CRM7500320_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500320-01" name="CRM7500320-01" type="nember" value="" class="form_numeric ar" style="width:84%">Km
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500320-02" name="CRM7500320-02" type="nember" value="" class="form_numeric ar" style="width:82%">Km
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500321">
                                <div class="target_btn"><button id="CRM7500321_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.lbrAmt" /></div><!-- 정비금액 -->
                                <div class="target_content">
                                    <input id="CRM7500321_fleg" name="CRM7500321_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500321-01" name="CRM7500321-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500321-02" name="CRM7500321-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500322">
                                <div class="target_btn"><button id="CRM7500322_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.lbrAccAmt" /></div><!-- 정비누적금액 -->
                                <div class="target_content">
                                    <input id="CRM7500322_fleg" name="CRM7500322_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500322-01" name="CRM7500322-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500322-02" name="CRM7500322-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500323">
                                <div class="target_btn"><button id="CRM7500323_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="par.lbl.invResvWorkType" /></div><!-- 정비위탁유형 -->
                                <div class="target_content">
                                    <input id="CRM7500323_fleg" name="CRM7500323_fleg" type="hidden" value="N">
                                    <select id="CRM7500323-01" name="CRM7500323-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500324">
                                <div class="target_btn"><button id="CRM7500324_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.lbrCnt" /></div><!-- 정비 횟수 -->
                                <div class="target_content">
                                    <input id="CRM7500324_fleg" name="CRM7500324_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500324-01" name="CRM7500324-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500324-02" name="CRM7500324-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500325">
                                <div class="target_btn"><button id="CRM7500325_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="ser.lbl.lbrTp" /></div><!-- 수리 유형 -->
                                <div class="target_content">
                                    <input id="CRM7500325_fleg" name="CRM7500325_fleg" type="hidden" value="N">
                                    <select id="CRM7500325-01" name="CRM7500325-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500533">
                                <div class="target_btn"><button id="CRM7500533_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.peridAddrHave" /></div><!-- 유효주소보유 -->
                                <div class="target_content">
                                    <input id="CRM7500533_fleg" name="CRM7500533_fleg" type="hidden" value="N">
                                    <label for="CRM7500533-01-01" class="label_check">
                                        <input id="CRM7500533-01-01" name="CRM7500533-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="crm.lbl.yes" /><!-- 보유 -->
                                    </label>
                                    <label for="CRM7500533-01-02" class="label_check">
                                        <input id="CRM7500533-01-02" name="CRM7500533-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="crm.lbl.none" /><!-- 미보유 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500534">
                                <div class="target_btn"><button id="CRM7500534_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.repTelHave" /></div><!-- 대표전화보유 -->
                                <div class="target_content">
                                    <input id="CRM7500534_fleg" name="CRM7500534_fleg" type="hidden" value="N">
                                    <label for="CRM7500534-01-01" class="label_check">
                                        <input id="CRM7500534-01-01" name="CRM7500534-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="crm.lbl.yes" /><!-- 보유 -->
                                    </label>
                                    <label for="CRM7500534-01-02" class="label_check">
                                        <input id="CRM7500534-01-02" name="CRM7500534-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="crm.lbl.none" /><!-- 미보유 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500535">
                                <div class="target_btn"><button id="CRM7500535_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.hpTelHave" /></div><!-- 핸드폰전화보유 -->
                                <div class="target_content">
                                    <input id="CRM7500535_fleg" name="CRM7500535_fleg" type="hidden" value="N">
                                    <label for="CRM7500535-01-01" class="label_check">
                                        <input id="CRM7500535-01-01" name="CRM7500535-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="crm.lbl.yes" /><!-- 보유 -->
                                    </label>
                                    <label for="CRM7500535-01-02" class="label_check">
                                        <input id="CRM7500535-01-02" name="CRM7500535-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="crm.lbl.none" /><!-- 미보유 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500536">
                                <div class="target_btn"><button id="CRM7500536_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.wechatHave" /></div><!-- WECHAT 보유 -->
                                <div class="target_content">
                                    <input id="CRM7500536_fleg" name="CRM7500536_fleg" type="hidden" value="N">
                                    <label for="CRM7500536-01-01" class="label_check">
                                        <input id="CRM7500536-01-01" name="CRM7500536-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="crm.lbl.yes" /><!-- 보유 -->
                                    </label>
                                    <label for="CRM7500536-01-02" class="label_check">
                                        <input id="CRM7500536-01-02" name="CRM7500536-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="crm.lbl.none" /><!-- 미보유 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500537">
                                <div class="target_btn"><button id="CRM7500537_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.smsRejectRecvOff" /></div><!-- SMS 수신 거부 제외 -->
                                <div class="target_content">
                                    <input id="CRM7500537_fleg" name="CRM7500537_fleg" type="hidden" value="N">
                                    <label for="CRM7500537-01-01" class="label_check">
                                        <input id="CRM7500537-01-01" name="CRM7500537-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500537-01-02" class="label_check">
                                        <input id="CRM7500537-01-02" name="CRM7500537-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500538">
                                <div class="target_btn"><button id="CRM7500538_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.hpRejectRecvOff" /></div><!-- 휴대전화 수신 거부 제외 -->
                                <div class="target_content">
                                    <input id="CRM7500538_fleg" name="CRM7500538_fleg" type="hidden" value="N">
                                    <label for="CRM7500538-01-01" class="label_check">
                                        <input id="CRM7500538-01-01" name="CRM7500538-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500538-01-02" class="label_check">
                                        <input id="CRM7500538-01-02" name="CRM7500538-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500539">
                                <div class="target_btn"><button id="CRM7500539_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.homeTelRejectRecvOff" /></div><!-- 집전화 수신 거부 제외 -->
                                <div class="target_content">
                                    <input id="CRM7500539_fleg" name="CRM7500539_fleg" type="hidden" value="N">
                                    <label for="CRM7500539-01-01" class="label_check">
                                        <input id="CRM7500539-01-01" name="CRM7500539-01" type="radio" value="Y" class="form_check" />
                                        <spring:message code="global.lbl.yes" /><!-- 예 -->
                                    </label>
                                    <label for="CRM7500539-01-02" class="label_check">
                                        <input id="CRM7500539-01-02" name="CRM7500539-01" type="radio" value="N" class="form_check" />
                                        <spring:message code="global.lbl.n" /><!-- 아니오 -->
                                    </label>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500640">
                                <div class="target_btn"><button id="CRM7500640_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.activePlan" /></div><!-- 활동방법 -->
                                <div class="target_content">
                                    <input id="CRM7500640_fleg" name="CRM7500110_fleg" type="hidden" value="N">
                                    <select id="CRM7500640-01" name="CRM7500640-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500641">
                                <div class="target_btn"><button id="CRM7500641_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.activeEnterDt" /></div><!-- 활동 참가 일 -->
                                <div class="target_content">
                                    <input id="CRM7500641_fleg" name="CRM7500641_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500641-01" name="CRM7500641-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500641-02" name="CRM7500641-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500642">
                                <div class="target_btn"><button id="CRM7500642_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.activeEnterCnt" /></div><!-- 활동 참가 횟수 -->
                                <div class="target_content">
                                    <input id="CRM7500642_fleg" name="CRM7500642_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500642-01" name="CRM7500642-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500642-02" name="CRM7500642-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500643">
                                <div class="target_btn"><button id="CRM7500643_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.custCareDt" /></div><!-- 고객 케어 일 -->
                                <div class="target_content">
                                    <input id="CRM7500643_fleg" name="CRM7500643_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500643-01" name="CRM7500643-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500643-02" name="CRM7500643-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500644">
                                <div class="target_btn"><button id="CRM7500644_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.custCareCnt" /></div><!-- 고객 케어 횟수 -->
                                <div class="target_content">
                                    <input id="CRM7500644_fleg" name="CRM7500644_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500644-01" name="CRM7500644-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500644-02" name="CRM7500644-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500645">
                                <div class="target_btn"><button id="CRM7500645_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.stsfIvstDtEx" /></div><!-- 설문 일 -->
                                <div class="target_content">
                                    <input id="CRM7500645_fleg" name="CRM7500645_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500645-01" name="CRM7500645-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500645-02" name="CRM7500645-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500646">
                                <div class="target_btn"><button id="CRM7500646_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="global.lbl.stsfIvstCnt" /></div><!-- 설문 횟수 -->
                                <div class="target_content">
                                    <input id="CRM7500646_fleg" name="CRM7500646_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500646-01" name="CRM7500646-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500646-02" name="CRM7500646-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500647">
                                <div class="target_btn"><button id="CRM7500647_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.lately3MonthAccessCnt" /></div><!-- 최근 3개월 접근 횟수 -->
                                <div class="target_content">
                                    <input id="CRM7500647_fleg" name="CRM7500647_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500647-01" name="CRM7500647-01" type="nember" value="" class="form_numeric ar">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500647-02" name="CRM7500647-02" type="nember" value="" class="form_numeric ar">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500748">
                                <div class="target_btn"><button id="CRM7500748_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.useCampaign" /></div><!-- 참여 캠페인 -->
                                <div class="target_content">
                                    <input id="CRM7500748_fleg" name="CRM7500748_fleg" type="hidden" value="N">
<!--                                     <input id="CRM7500748-01" name="CRM7500748-01" value="" class="form_comboBox"/> -->
                                    <select id="CRM7500748-01" name="CRM7500748-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                            <li id="CRM7500749">
                                <div class="target_btn"><button id="CRM7500749_del" class="btn_s btn_target_delete">delete</button></div>
                                <div class="target_title"><spring:message code="crm.lbl.useDt" /></div><!-- 참여일 -->
                                <div class="target_content">
                                    <input id="CRM7500749_fleg" name="CRM7500749_fleg" type="hidden" value="N">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="CRM7500749-01" name="CRM7500749-01" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="CRM7500749-02" name="CRM7500749-02" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </div>
                                <div class="target_empty"></div>
                            </li>
                        </ul>
                    </div>
                </section>

                <!-- <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic">예산 건수 결과</h2>
                        <div class="btn_right">
                            <button type="button" class="btn_s">예상인원조회</button>
                        </div>
                    </div>
                    <div class="target_form">
                        <span class="span_txt">선택한 조건으로</span>
                        <span class="span_form"><input type="text" value="" readonly class="form_input form_readonly ar" style="width:50px;"> <span class="span_txt2">건이 추출 가능합니다.</span></span>
                    </div>
                </section> -->

                <!-- <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic">추출</h2>
                        <div class="btn_right">
                            <button type="button" class="btn_s">엑셀다운로드</button>
                        </div>
                    </div>
                    <div class="target_form">
                        <span class="span_txt">추출(엑셀) 제목</span>
                        <span class="span_form"><input type="text" value="" class="form_input"></span>
                    </div>
                </section>
                 -->

            </div>
        </div>
    </section>
    <!-- //캠페인 대상자 고객추출 -->

<script type="text/javascript">

var popupWindow;

//추출조건 사용카운트
var crmTargExtractUsedCnt = "${crmTargExtractUsedCnt}";

//추출조건 마스터
var targExtractKeyMap = [];
<c:forEach var="obj" items="${targExtractKeyList}">
targExtractKeyMap["dlrCd"] = "${obj.dlrCd}";
targExtractKeyMap["custExtrTermNo"] = "${obj.custExtrTermNo}";
targExtractKeyMap["custExtrTermNm"] = "${obj.custExtrTermNm}";
targExtractKeyMap["randomYn"] = "${obj.randomYn}";
targExtractKeyMap["randomCnt"] = "${obj.randomCnt}";
</c:forEach>

//추출조건 상세
var targExtractValMap = [];
<c:forEach var="obj" items="${targExtractList}">
targExtractValMap["${obj.detlExtrTermCd}"] = "${obj.termVal1}";
</c:forEach>

//도시코드
var cityList = [];
<c:forEach var="obj" items="${cityCdInfo}">
cityList.push({cityNm:"${obj.cityNm}", cityCd:"${obj.cityCd}"});
</c:forEach>

/**
 * 도시코드에 따른 지역코드 조회(값 셋팅시에만 사용)
 */
function onSelectCityCdSet(value) {

    $("#CRM7500103-02").data("kendoExtDropDownList").setDataSource([]);
    $("#CRM7500103-02").data("kendoExtDropDownList").enable(true);

    if(value == ""){
        $("#CRM7500103-02").data("kendoExtDropDownList").setDataSource([]);
        $("#CRM7500103-02").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/crm/cmm/crmTargExtract/selectDistCdList.do"
        ,data:JSON.stringify({"cmmCd":value})
        ,async:false
    });

    $("#CRM7500103-02").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

//고객출처코드
var custHoldTps = [];
<c:forEach var="obj" items="${custHoldTps}">
custHoldTps.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//예상구매시기
var expcPurcHmCdList = [];
<c:forEach var="obj" items="${expcPurcHmCdList}">
expcPurcHmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//회원등급
var dlrMbrGradeList = [];
<c:forEach var="obj" items="${dlrMbrGradeList}">
dlrMbrGradeList.push({gradeSeq:"${obj.gradeSeq}", gradeNm:"${obj.gradeNm}"});
</c:forEach>

//BM 회원등급
var bmMbrGradeList = [];
<c:forEach var="obj" items="${bmMbrGradeList}">
bmMbrGradeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//차종
var carlineList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//추적등급
var intentionClass = [];
<c:forEach var="obj" items="${intentionClass}">
intentionClass.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//정비위탁유형
var lbrTps = [];
<c:forEach var="obj" items="${lbrTps}">
lbrTps.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//수리유형
var rePairTps = [];
<c:forEach var="obj" items="${rePairTps}">
rePairTps.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//활동방법
var activeCdList = [];
<c:forEach var="obj" items="${activeCdList}">
activeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//캠페인
var campaignList = [];
<c:forEach var="obj" items="${campaignList}">
campaignList.push({"cmmCd":"${obj.remark}", "cmmCdNm":"${obj.holdDetlTpNm}"});
</c:forEach>

//입력부 초기화
function resetDefualtForm(){

    //[추출 마스터]
    $("#custExtrTermNo").val("");
    $("#custExtrTermNm").val("");
    $("#randomYn").prop("checked", false);
    $("#randomCnt").data("kendoExtNumericTextBox").value(0);

    //[태어난 해]
    $("#CRM7500101_fleg").val("N");
    $("#CRM7500101-01").val("");
    $("#CRM7500101-02").val("");
    $("#CRM7500101").hide();

    //[성별]
    $("#CRM7500102_fleg").val("N");
    $("#CRM7500102-01-01").prop("checked", false);
    $("#CRM7500102-01-02").prop("checked", false);
    $("#CRM7500102").hide();

    //[주소(지역)]
    $("#CRM7500103_fleg").val("N");
    $("#CRM7500103-01").data("kendoExtDropDownList").select(0);
    $("#CRM7500103-02").data("kendoExtDropDownList").setDataSource([]);
    $("#CRM7500103-02").data("kendoExtDropDownList").enable(false);
    $("#CRM7500103").hide();

    //[생일]
    $("#CRM7500104_fleg").val("N");
    $("#CRM7500104-01").data("kendoExtDropDownList").select(0);
    $("#CRM7500104-02").data("kendoExtDropDownList").select(0);
    $("#CRM7500104-03").data("kendoExtDropDownList").select(0);
    $("#CRM7500104-04").data("kendoExtDropDownList").select(0);
    $("#CRM7500104").hide();

    //[생일(몇일 전)]
    $("#CRM7500105_fleg").val("N");
    $("#CRM7500105-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500105").hide();

    //[Blue Members]
    $("#CRM7500106_fleg").val("N");
    $("#CRM7500106-01-01").prop("checked", false);
    $("#CRM7500106-01-02").prop("checked", false);
    $("#CRM7500106").hide();

    //[Blue Members Point]
    $("#CRM7500107_fleg").val("N");
    $("#CRM7500107-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500107-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500107").hide();

    //[딜러회원]
    $("#CRM7500108_fleg").val("N");
    $("#CRM7500108-01-01").prop("checked", false);
    $("#CRM7500108-01-02").prop("checked", false);
    $("#CRM7500108").hide();

    //[딜러회원 Point]
    $("#CRM7500109_fleg").val("N");
    $("#CRM7500109-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500109-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500109").hide();

    //[고객출처]
    $("#CRM7500110_fleg").val("N");
    $("#CRM7500110-01").data("kendoMultiSelect").value("");
    $("#CRM7500110").hide();

    //[고객 신규날짜]
    $("#CRM7500111_fleg").val("N");
    $("#CRM7500111-01").val("");
    $("#CRM7500111-02").val("");
    $("#CRM7500111").hide();

    //[잠재/보유고객]
    $("#CRM7500150_fleg").val("N");
    $("#CRM7500150-01-01").prop("checked", false);
    $("#CRM7500150-01-02").prop("checked", false);
    $("#CRM7500150").hide();

    //[자체회원등급]
    $("#CRM7500112_fleg").val("N");
    $("#CRM7500112-01").data("kendoMultiSelect").value("");
    $("#CRM7500112").hide();

    //[BM 회원등급]
    $("#CRM7500113_fleg").val("N");
    $("#CRM7500113-01").data("kendoMultiSelect").value("");
    $("#CRM7500113").hide();

    //[의향차종]
    $("#CRM7500212_fleg").val("N");
    $("#CRM7500212-01").data("kendoMultiSelect").value("");
    $("#CRM7500212").hide();

    //[추적등급]
    $("#CRM7500213_fleg").val("N");
    $("#CRM7500213-01").data("kendoMultiSelect").value("");
    $("#CRM7500213").hide();

    //[예상구매시기]
    $("#CRM7500214_fleg").val("N");
    $("#CRM7500214-01").data("kendoExtDropDownList").select(0);
    $("#CRM7500214").hide();

    //[신규날짜]
    $("#CRM7500215_fleg").val("N");
    $("#CRM7500215-01").val("");
    $("#CRM7500215-02").val("");
    $("#CRM7500215").hide();

    //[6개월이내 구매확률]
    $("#CRM7500216_fleg").val("N");
    $("#CRM7500216-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500216-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500216").hide();

    //[구매예상금액]
    $("#CRM7500217_fleg").val("N");
    $("#CRM7500217-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500217-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500217").hide();

    //[정비 일자]
    $("#CRM7500318_fleg").val("N");
    $("#CRM7500318-01").val("");
    $("#CRM7500318-02").val("");
    $("#CRM7500318").hide();

    //[정비 일자(후 일수)]
    $("#CRM7500319_fleg").val("N");
    $("#CRM7500319-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500319").hide();

    //[주행 거리]
    $("#CRM7500320_fleg").val("N");
    $("#CRM7500320-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500320-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500320").hide();

    //[정비 금액]
    $("#CRM7500321_fleg").val("N");
    $("#CRM7500321-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500321-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500321").hide();

    //[정비 누적 금액]
    $("#CRM7500322_fleg").val("N");
    $("#CRM7500322-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500322-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500322").hide();

    //[정비위탁유형]
//     $("#CRM7500323_fleg").val("N");
//     $("#CRM7500323-01").data("kendoExtDropDownList").select(0);
//     $("#CRM7500323").hide();

    //[정비위탁유형]
    $("#CRM7500323_fleg").val("N");
    $("#CRM7500323-01").data("kendoMultiSelect").value("");
    $("#CRM7500323").hide();

    //[정비 횟수]
    $("#CRM7500324_fleg").val("N");
    $("#CRM7500324-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500324-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500324").hide();

    //[수리유형]
    $("#CRM7500325_fleg").val("N");
    $("#CRM7500325-01").data("kendoMultiSelect").value("");
    $("#CRM7500325").hide();

    //[구매경험]
    $("#CRM7500425_fleg").val("N");
    $("#CRM7500425-01-01").prop("checked", false);
    $("#CRM7500425-01-02").prop("checked", false);
    $("#CRM7500425-01-03").prop("checked", false);
    $("#CRM7500425").hide();

    //[최근구매차종]
    $("#CRM7500426_fleg").val("N");
    $("#CRM7500426-01").data("kendoMultiSelect").value("");
    $("#CRM7500426").hide();

    //[최근 구매차 구매일]
    $("#CRM7500427_fleg").val("N");
    $("#CRM7500427-01").val("");
    $("#CRM7500427-02").val("");
    $("#CRM7500427").hide();

    //[보유차종]
    $("#CRM7500428_fleg").val("N");
    $("#CRM7500428-01").data("kendoMultiSelect").value("");
    $("#CRM7500428").hide();

    //[보유차 구매일]
    $("#CRM7500429_fleg").val("N");
    $("#CRM7500429-01").val("");
    $("#CRM7500429-02").val("");
    $("#CRM7500429").hide();

    //[보유 대수]
    $("#CRM7500430_fleg").val("N");
    $("#CRM7500430-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500430-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500430").hide();

    //[본 딜러에서 구매 대수]
    $("#CRM7500431_fleg").val("N");
    $("#CRM7500431-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500431-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500431").hide();

    //[신차 출고일]
    $("#CRM7500432_fleg").val("N");
    $("#CRM7500432-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500432").hide();

    //[보험]
    $("#CRM7500433_fleg").val("N");
    $("#CRM7500433-01-01").prop("checked", false);
    $("#CRM7500433-01-02").prop("checked", false);
    $("#CRM7500433").hide();

    //[금융]
    $("#CRM7500434_fleg").val("N");
    $("#CRM7500434-01-01").prop("checked", false);
    $("#CRM7500434-01-02").prop("checked", false);
    $("#CRM7500434").hide();

    //[보험 시작일]
    $("#CRM7500435_fleg").val("N");
    $("#CRM7500435-01").val("");
    $("#CRM7500435-02").val("");
    $("#CRM7500435").hide();

    //[유효주소보유]
    $("#CRM7500533_fleg").val("N");
    $("#CRM7500533-01-01").prop("checked", false);
    $("#CRM7500533-01-02").prop("checked", false);
    $("#CRM7500533").hide();

    //[대표전화보유]
    $("#CRM7500534_fleg").val("N");
    $("#CRM7500534-01-01").prop("checked", false);
    $("#CRM7500534-01-02").prop("checked", false);
    $("#CRM7500534").hide();

    //[핸드폰전화보유]
    $("#CRM7500535_fleg").val("N");
    $("#CRM7500535-01-01").prop("checked", false);
    $("#CRM7500535-01-02").prop("checked", false);
    $("#CRM7500535").hide();

    //[WECHAT 보유]
    $("#CRM7500536_fleg").val("N");
    $("#CRM7500536-01-01").prop("checked", false);
    $("#CRM7500536-01-02").prop("checked", false);
    $("#CRM7500536").hide();

    //[SMS 수신 거부 제외]
    $("#CRM7500537_fleg").val("N");
    $("#CRM7500537-01-01").prop("checked", false);
    $("#CRM7500537-01-02").prop("checked", false);
    $("#CRM7500537").hide();

    //[휴대전화 수신 거부 제외]
    $("#CRM7500538_fleg").val("N");
    $("#CRM7500538-01-01").prop("checked", false);
    $("#CRM7500538-01-02").prop("checked", false);
    $("#CRM7500538").hide();

    //[집전화 수신 거부 제외]
    $("#CRM7500539_fleg").val("N");
    $("#CRM7500539-01-01").prop("checked", false);
    $("#CRM7500539-01-02").prop("checked", false);
    $("#CRM7500539").hide();

    //[활동방법]
    $("#CRM7500640_fleg").val("N");
    $("#CRM7500640-01").data("kendoMultiSelect").value("");
    $("#CRM7500640").hide();

    //[활동 참가 일]
    $("#CRM7500641_fleg").val("N");
    $("#CRM7500641-01").val("");
    $("#CRM7500641-02").val("");
    $("#CRM7500641").hide();

    //[활동 참가 횟수]
    $("#CRM7500642_fleg").val("N");
    $("#CRM7500642-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500642-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500642").hide();

    //[고객 케어 일]
    $("#CRM7500643_fleg").val("N");
    $("#CRM7500643-01").val("");
    $("#CRM7500643-02").val("");
    $("#CRM7500643").hide();

    //[고객 케어 횟수]
    $("#CRM7500644_fleg").val("N");
    $("#CRM7500644-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500644-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500644").hide();

    //[설문 일]
    $("#CRM7500645_fleg").val("N");
    $("#CRM7500645-01").val("");
    $("#CRM7500645-02").val("");
    $("#CRM7500645").hide();

    //[설문 횟수]
    $("#CRM7500646_fleg").val("N");
    $("#CRM7500646-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500646-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500646").hide();

    //[최근 3개월 접근 횟수]
    $("#CRM7500647_fleg").val("N");
    $("#CRM7500647-01").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500647-02").data("kendoExtNumericTextBox").value(0);
    $("#CRM7500647").hide();

    //[참여 캠페인]
//     $("#CRM7500748_fleg").val("N");
//     $("#CRM7500748-01").data("kendoExtDropDownList").select(0);
//     $("#CRM7500748").hide();
    $("#CRM7500748_fleg").val("N");
    $("#CRM7500748-01").data("kendoMultiSelect").value("");
    $("#CRM7500748").hide();

    //[참여일]
    $("#CRM7500749_fleg").val("N");
    $("#CRM7500749-01").val("");
    $("#CRM7500749-02").val("");
    $("#CRM7500749").hide();
}

//조건값 유무에 따른 입력부 활성화/비활성화 스크립트
function f_showHideInput(){
    //[태어난 해]
    if($("#CRM7500101-01").val() == "" || $("#CRM7500101-01").val() == null){
        $("#CRM7500101_fleg").val("N");
        $("#CRM7500101-01").val("");
        $("#CRM7500101-02").val("");
        $("#CRM7500101").hide();

    }else{
        $("#CRM7500101").show();
        $("#CRM7500101_fleg").val("Y");
    }

    //[성별]
    if($("#CRM7500102-01-01").is(":checked") == false && $("#CRM7500102-01-02").is(":checked") == false){
        $("#CRM7500102_fleg").val("N");
        $("#CRM7500102-01-01").prop("checked", false);
        $("#CRM7500102-01-02").prop("checked", false);
        $("#CRM7500102").hide();
    }else{
        $("#CRM7500102").show();
        $("#CRM7500102_fleg").val("Y");
    }

    //[주소]
    if(($("#CRM7500103-01").val() == "" || $("#CRM7500103-01").val() == null) && ($("#CRM7500103-02").val() == "" || $("#CRM7500103-02").val() == null)){
        $("#CRM7500103_fleg").val("N");
        $("#CRM7500103-01").data("kendoExtDropDownList").select(0);
        $("#CRM7500103-02").data("kendoExtDropDownList").setDataSource([]);
        $("#CRM7500103-02").data("kendoExtDropDownList").enable(false);
        $("#CRM7500103").hide();
    }else{
        $("#CRM7500103").show();
        $("#CRM7500103_fleg").val("Y");
    }

    //[생일]
    if($("#CRM7500104-01").val() == "" || $("#CRM7500104-01").val() == null){
        $("#CRM7500104_fleg").val("N");
        $("#CRM7500104-01").data("kendoExtDropDownList").select(0);
        $("#CRM7500104-02").data("kendoExtDropDownList").select(0);
        $("#CRM7500104-03").data("kendoExtDropDownList").select(0);
        $("#CRM7500104-04").data("kendoExtDropDownList").select(0);
        $("#CRM7500104").hide();
    }else{
        $("#CRM7500104").show();
        $("#CRM7500104_fleg").val("Y");
    }

    //[생일(몇일 전)]
    if($("#CRM7500105-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500105-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500105_fleg").val("N");
        $("#CRM7500105-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500105").hide();
    }else{
        $("#CRM7500105").show();
        $("#CRM7500105_fleg").val("Y");
    }

    //[Blue Members]
    if($("#CRM7500106-01-01").is(":checked") == false && $("#CRM7500106-01-02").is(":checked") == false){
        $("#CRM7500106_fleg").val("N");
        $("#CRM7500106-01-01").prop("checked", false);
        $("#CRM7500106-01-02").prop("checked", false);
        $("#CRM7500106").hide();
    }else{
        $("#CRM7500106").show();
        $("#CRM7500106_fleg").val("Y");
    }

    //[Blue Members Point]
    if($("#CRM7500107-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500107-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500107_fleg").val("N");
        $("#CRM7500107-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500107-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500107").hide();
    }else{
        $("#CRM7500107").show();
        $("#CRM7500107_fleg").val("Y");
    }

    //[딜러회원]
    if($("#CRM7500108-01-01").is(":checked") == false && $("#CRM7500108-01-02").is(":checked") == false){
        $("#CRM7500108_fleg").val("N");
        $("#CRM7500108-01-01").prop("checked", false);
        $("#CRM7500108-01-02").prop("checked", false);
        $("#CRM7500108").hide();
    }else{
        $("#CRM7500108").show();
        $("#CRM7500108_fleg").val("Y");
    }

    //[딜러회원 Point]
    if($("#CRM7500109-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500109-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500109_fleg").val("N");
        $("#CRM7500109-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500109-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500109").hide();
    }else{
        $("#CRM7500109").show();
        $("#CRM7500109_fleg").val("Y");
    }

    //[고객 출처]
    if($("#CRM7500110-01").val() == "" || $("#CRM7500110-01").val() == null){
        $("#CRM7500110_fleg").val("N");
        $("#CRM7500110-01").data("kendoMultiSelect").value("");
        $("#CRM7500110").hide();
    }else{
        $("#CRM7500110").show();
        $("#CRM7500110_fleg").val("Y");
    }

    //[고객 신규날짜]
    if($("#CRM7500111-01").val() == "" || $("#CRM7500111-01").val() == null){
        $("#CRM7500111_fleg").val("N");
        $("#CRM7500111-01").val("");
        $("#CRM7500111-02").val("");
        $("#CRM7500111").hide();

    }else{
        $("#CRM7500111").show();
        $("#CRM7500111_fleg").val("Y");
    }

    //[잠재/보유고객]
    if($("#CRM7500150-01-01").is(":checked") == false && $("#CRM7500150-01-02").is(":checked") == false){
        $("#CRM7500150_fleg").val("N");
        $("#CRM7500150-01-01").prop("checked", false);
        $("#CRM7500150-01-02").prop("checked", false);
        $("#CRM7500150").hide();
    }else{
        $("#CRM7500150").show();
        $("#CRM7500150_fleg").val("Y");
    }

    //[회원등급]
    if($("#CRM7500112-01").val() == "" || $("#CRM7500112-01").val() == null){
        $("#CRM7500112_fleg").val("N");
        $("#CRM7500112-01").data("kendoMultiSelect").value("");
        $("#CRM7500112").hide();
    }else{
        $("#CRM7500112").show();
        $("#CRM7500112_fleg").val("Y");
    }

    //[BM 회원등급]
    if($("#CRM7500113-01").val() == "" || $("#CRM7500113-01").val() == null){
        $("#CRM7500113_fleg").val("N");
        $("#CRM7500113-01").data("kendoMultiSelect").value("");
        $("#CRM7500113").hide();
    }else{
        $("#CRM7500113").show();
        $("#CRM7500113_fleg").val("Y");
    }

    //[의향차종]
    if($("#CRM7500212-01").val() == "" || $("#CRM7500212-01").val() == null){
        $("#CRM7500212_fleg").val("N");
        $("#CRM7500212-01").data("kendoMultiSelect").value("");
        $("#CRM7500212").hide();
    }else{
        $("#CRM7500212").show();
        $("#CRM7500212_fleg").val("Y");
    }

    //[추적등급]
    if($("#CRM7500213-01").val() == "" || $("#CRM7500213-01").val() == null){
        $("#CRM7500213_fleg").val("N");
        $("#CRM7500213-01").data("kendoMultiSelect").value("");
        $("#CRM7500213").hide();
    }else{
        $("#CRM7500213").show();
        $("#CRM7500213_fleg").val("Y");
    }

    //[예상구매시기]
    if($("#CRM7500214-01").val() == "" || $("#CRM7500214-01").val() == null){
        $("#CRM7500214_fleg").val("N");
        $("#CRM7500214-01").data("kendoExtDropDownList").select(0);
        $("#CRM7500214").hide();

    }else{
        $("#CRM7500214").show();
        $("#CRM7500214_fleg").val("Y");
    }

    //[신규날짜]
    if($("#CRM7500215-01").val() == "" || $("#CRM7500215-01").val() == null){
        $("#CRM7500215_fleg").val("N");
        $("#CRM7500215-01").val("");
        $("#CRM7500215-02").val("");
        $("#CRM7500215").hide();

    }else{
        $("#CRM7500215").show();
        $("#CRM7500215_fleg").val("Y");
    }

    //[6개월이내 구매확률]
    if($("#CRM7500216-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500216-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500216_fleg").val("N");
        $("#CRM7500216-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500216-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500216").hide();
    }else{
        $("#CRM7500216").show();
        $("#CRM7500216_fleg").val("Y");
    }

    //[구매예상금액]
    if($("#CRM7500217-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500217-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500217_fleg").val("N");
        $("#CRM7500217-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500217-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500217").hide();
    }else{
        $("#CRM7500217").show();
        $("#CRM7500217_fleg").val("Y");
    }

    //[정비 일자]
    if($("#CRM7500318-01").val() == "" || $("#CRM7500318-01").val() == null){
        $("#CRM7500318_fleg").val("N");
        $("#CRM7500318-01").val("");
        $("#CRM7500318-02").val("");
        $("#CRM7500318").hide();

    }else{
        $("#CRM7500318").show();
        $("#CRM7500318_fleg").val("Y");
    }

    //[정비 일자(후 일수)]
    if($("#CRM7500319-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500319-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500319_fleg").val("N");
        $("#CRM7500319-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500319").hide();
    }else{
        $("#CRM7500319").show();
        $("#CRM7500319_fleg").val("Y");
    }

    //[주행 거리]
    if($("#CRM7500320-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500320_fleg").val("N");
        $("#CRM7500320-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500320-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500320").hide();
    }else{
        $("#CRM7500320").show();
        $("#CRM7500320_fleg").val("Y");
    }

    //[정비 금액]
    if($("#CRM7500321-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500321_fleg").val("N");
        $("#CRM7500321-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500321-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500321").hide();
    }else{
        $("#CRM7500321").show();
        $("#CRM7500321_fleg").val("Y");
    }

    //[정비 누적 금액]
    if($("#CRM7500322-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500322-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500322_fleg").val("N");
        $("#CRM7500322-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500322-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500322").hide();
    }else{
        $("#CRM7500322").show();
        $("#CRM7500322_fleg").val("Y");
    }

    //[정비위탁유형]
//     if($("#CRM7500323-01").val() == "" || $("#CRM7500323-01").val() == null){
//         $("#CRM7500323_fleg").val("N");
//         $("#CRM7500323-01").data("kendoExtDropDownList").select(0);
//         $("#CRM7500323").hide();
//     }else{
//         $("#CRM7500323").show();
//         $("#CRM7500323_fleg").val("Y");
//     }
    //[정비위탁유형]
    if($("#CRM7500323-01").val() == "" || $("#CRM7500323-01").val() == null){
        $("#CRM7500323_fleg").val("N");
        $("#CRM7500323-01").data("kendoMultiSelect").value("");
        $("#CRM7500323").hide();
    }else{
        $("#CRM7500323").show();
        $("#CRM7500323_fleg").val("Y");
    }

    //[정비 횟수]
    //if($("#CRM7500324-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500324-01").data("kendoExtNumericTextBox").value() == 0){
    if ( dms.string.isEmpty($("#CRM7500324-01").data("kendoExtNumericTextBox").value())){
        $("#CRM7500324_fleg").val("N");
        $("#CRM7500324-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500324-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500324").hide();
    }else{
        console.log("CRM7500324-01 is Value :::");
        console.log($("#CRM7500324-01").data("kendoExtNumericTextBox").value());
        $("#CRM7500324").show();
        $("#CRM7500324_fleg").val("Y");
    }

    //[수리유형]
    if($("#CRM7500325-01").val() == "" || $("#CRM7500325-01").val() == null){
        $("#CRM7500325_fleg").val("N");
        $("#CRM7500325-01").data("kendoMultiSelect").value("");
        $("#CRM7500325").hide();
    }else{
        $("#CRM7500325").show();
        $("#CRM7500325_fleg").val("Y");
    }

    //[구매경험]
    if($("#CRM7500425-01-01").is(":checked") == false && $("#CRM7500425-01-02").is(":checked") == false && $("#CRM7500425-01-03").is(":checked") == false){
        $("#CRM7500425_fleg").val("N");
        $("#CRM7500425-01-01").prop("checked", false);
        $("#CRM7500425-01-02").prop("checked", false);
        $("#CRM7500425-01-03").prop("checked", false);
        $("#CRM7500425").hide();
    }else{
        $("#CRM7500425").show();
        $("#CRM7500425_fleg").val("Y");
    }

    //[최근구매차종]
    if($("#CRM7500426-01").val() == "" || $("#CRM7500426-01").val() == null){
        $("#CRM7500426_fleg").val("N");
        $("#CRM7500426-01").data("kendoMultiSelect").value("");
        $("#CRM7500426").hide();
    }else{
        $("#CRM7500426").show();
        $("#CRM7500426_fleg").val("Y");
    }

    //[최근 구매차 구매일]
    if($("#CRM7500427-01").val() == "" || $("#CRM7500427-01").val() == null){
        $("#CRM7500427_fleg").val("N");
        $("#CRM7500427-01").val("");
        $("#CRM7500427-02").val("");
        $("#CRM7500427").hide();

    }else{
        $("#CRM7500427").show();
        $("#CRM7500427_fleg").val("Y");
    }

    //[보유차종]
    if($("#CRM7500428-01").val() == "" || $("#CRM7500428-01").val() == null){
        $("#CRM7500428_fleg").val("N");
        $("#CRM7500428-01").data("kendoMultiSelect").value("");
        $("#CRM7500428").hide();
    }else{
        $("#CRM7500428").show();
        $("#CRM7500428_fleg").val("Y");
    }

    //[보유차 구매일]
    if($("#CRM7500429-01").val() == "" || $("#CRM7500429-01").val() == null){
        $("#CRM7500429_fleg").val("N");
        $("#CRM7500429-01").val("");
        $("#CRM7500429-02").val("");
        $("#CRM7500429").hide();

    }else{
        $("#CRM7500429").show();
        $("#CRM7500429_fleg").val("Y");
    }

    //[보유 대수]
    if($("#CRM7500430-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500430-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500430_fleg").val("N");
        $("#CRM7500430-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500430-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500430").hide();
    }else{
        $("#CRM7500430").show();
        $("#CRM7500430_fleg").val("Y");
    }

    //[본 딜러에서 구매 대수]
    if($("#CRM7500431-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500431-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500431_fleg").val("N");
        $("#CRM7500431-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500431-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500431").hide();
    }else{
        $("#CRM7500431").show();
        $("#CRM7500431_fleg").val("Y");
    }

    //[신차 출고일]
    if($("#CRM7500432-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500432-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500432_fleg").val("N");
        $("#CRM7500432-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500432").hide();
    }else{
        $("#CRM7500432").show();
        $("#CRM7500432_fleg").val("Y");
    }

    //[보험]
    if($("#CRM7500433-01-01").is(":checked") == false && $("#CRM7500433-01-02").is(":checked") == false){
        $("#CRM7500433_fleg").val("N");
        $("#CRM7500433-01-01").prop("checked", false);
        $("#CRM7500433-01-02").prop("checked", false);
        $("#CRM7500433").hide();
    }else{
        $("#CRM7500433").show();
        $("#CRM7500433_fleg").val("Y");
    }

    //[금융]
    if($("#CRM7500434-01-01").is(":checked") == false && $("#CRM7500434-01-02").is(":checked") == false){
        $("#CRM7500434_fleg").val("N");
        $("#CRM7500434-01-01").prop("checked", false);
        $("#CRM7500434-01-02").prop("checked", false);
        $("#CRM7500434").hide();
    }else{
        $("#CRM7500434").show();
        $("#CRM7500434_fleg").val("Y");
    }

    //[보험 시작일]
    if($("#CRM7500435-01").val() == "" || $("#CRM7500435-01").val() == null){
        $("#CRM7500435_fleg").val("N");
        $("#CRM7500435-01").val("");
        $("#CRM7500435-02").val("");
        $("#CRM7500435").hide();

    }else{
        $("#CRM7500435").show();
        $("#CRM7500435_fleg").val("Y");
    }

    //[유효주소보유]
    if($("#CRM7500533-01-01").is(":checked") == false && $("#CRM7500533-01-02").is(":checked") == false){
        $("#CRM7500533_fleg").val("N");
        $("#CRM7500533-01-01").prop("checked", false);
        $("#CRM7500533-01-02").prop("checked", false);
        $("#CRM7500533").hide();
    }else{
        $("#CRM7500533").show();
        $("#CRM7500533_fleg").val("Y");
    }

    //[대표전화보유]
    if($("#CRM7500534-01-01").is(":checked") == false && $("#CRM7500534-01-02").is(":checked") == false){
        $("#CRM7500534_fleg").val("N");
        $("#CRM7500534-01-01").prop("checked", false);
        $("#CRM7500534-01-02").prop("checked", false);
        $("#CRM7500534").hide();
    }else{
        $("#CRM7500534").show();
        $("#CRM7500534_fleg").val("Y");
    }

    //[핸드폰전화보유]
    if($("#CRM7500535-01-01").is(":checked") == false && $("#CRM7500535-01-02").is(":checked") == false){
        $("#CRM7500535_fleg").val("N");
        $("#CRM7500535-01-01").prop("checked", false);
        $("#CRM7500535-01-02").prop("checked", false);
        $("#CRM7500535").hide();
    }else{
        $("#CRM7500535").show();
        $("#CRM7500535_fleg").val("Y");
    }

    //[WECHAT 보유]
    if($("#CRM7500536-01-01").is(":checked") == false && $("#CRM7500536-01-02").is(":checked") == false){
        $("#CRM7500536_fleg").val("N");
        $("#CRM7500536-01-01").prop("checked", false);
        $("#CRM7500536-01-02").prop("checked", false);
        $("#CRM7500536").hide();
    }else{
        $("#CRM7500535").show();
        $("#CRM7500535_fleg").val("Y");
    }

    //[SMS 수신 거부 제외]
    if($("#CRM7500537-01-01").is(":checked") == false && $("#CRM7500537-01-02").is(":checked") == false){
        $("#CRM7500537_fleg").val("N");
        $("#CRM7500537-01-01").prop("checked", false);
        $("#CRM7500537-01-02").prop("checked", false);
        $("#CRM7500537").hide();
    }else{
        $("#CRM7500537").show();
        $("#CRM7500537_fleg").val("Y");
    }

    //[휴대전화 수신 거부 제외]
    if($("#CRM7500538-01-01").is(":checked") == false && $("#CRM7500538-01-02").is(":checked") == false){
        $("#CRM7500538_fleg").val("N");
        $("#CRM7500538-01-01").prop("checked", false);
        $("#CRM7500538-01-02").prop("checked", false);
        $("#CRM7500538").hide();
    }else{
        $("#CRM7500538").show();
        $("#CRM7500538_fleg").val("Y");
    }

    //[집전화 수신 거부 제외]
    if($("#CRM7500539-01-01").is(":checked") == false && $("#CRM7500539-01-02").is(":checked") == false){
        $("#CRM7500539_fleg").val("N");
        $("#CRM7500539-01-01").prop("checked", false);
        $("#CRM7500539-01-02").prop("checked", false);
        $("#CRM7500539").hide();
    }else{
        $("#CRM7500539").show();
        $("#CRM7500539_fleg").val("Y");
    }

    //[활동방법]
    if($("#CRM7500640-01").val() == "" || $("#CRM7500640-01").val() == null){
        $("#CRM7500640_fleg").val("N");
        $("#CRM7500640-01").data("kendoMultiSelect").value("");
        $("#CRM7500640").hide();
    }else{
        $("#CRM7500640").show();
        $("#CRM7500640_fleg").val("Y");
    }

    //[활동 참가 일]
    if($("#CRM7500641-01").val() == "" || $("#CRM7500641-01").val() == null){
        $("#CRM7500641_fleg").val("N");
        $("#CRM7500641-01").val("");
        $("#CRM7500641-02").val("");
        $("#CRM7500641").hide();

    }else{
        $("#CRM7500641").show();
        $("#CRM7500641_fleg").val("Y");
    }

    //[활동 참가 횟수]
    if($("#CRM7500642-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500642-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500642_fleg").val("N");
        $("#CRM7500642-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500642-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500642").hide();
    }else{
        $("#CRM7500642").show();
        $("#CRM7500642_fleg").val("Y");
    }

    //[고객 케어 일]
    if($("#CRM7500643-01").val() == "" || $("#CRM7500643-01").val() == null){
        $("#CRM7500643_fleg").val("N");
        $("#CRM7500643-01").val("");
        $("#CRM7500643-02").val("");
        $("#CRM7500643").hide();

    }else{
        $("#CRM7500643").show();
        $("#CRM7500643_fleg").val("Y");
    }

    //[고객 케어 횟수]
    if($("#CRM7500644-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500644-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500644_fleg").val("N");
        $("#CRM7500644-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500644-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500644").hide();
    }else{
        $("#CRM7500644").show();
        $("#CRM7500644_fleg").val("Y");
    }

    //[설문 일]
    if($("#CRM7500645-01").val() == "" || $("#CRM7500645-01").val() == null){
        $("#CRM7500645_fleg").val("N");
        $("#CRM7500645-01").val("");
        $("#CRM7500645-02").val("");
        $("#CRM7500645").hide();

    }else{
        $("#CRM7500645").show();
        $("#CRM7500645_fleg").val("Y");
    }

    //[설문 횟수]
    if($("#CRM7500646-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500646-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500646_fleg").val("N");
        $("#CRM7500646-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500646-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500646").hide();
    }else{
        $("#CRM7500646").show();
        $("#CRM7500646_fleg").val("Y");
    }

    //[최근 3개월 접근 횟수]
    if($("#CRM7500647-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500647-01").data("kendoExtNumericTextBox").value() == 0){
        $("#CRM7500647_fleg").val("N");
        $("#CRM7500647-01").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500647-02").data("kendoExtNumericTextBox").value(0);
        $("#CRM7500647").hide();
    }else{
        $("#CRM7500647").show();
        $("#CRM7500647_fleg").val("Y");
    }

    //[참여 캠페인]
//     if($("#CRM7500748-01").val() == "" || $("#CRM7500748-01").val() == null){
//         $("#CRM7500748_fleg").val("N");
//         $("#CRM7500748-01").data("kendoExtDropDownList").select(0);
//         $("#CRM7500748").hide();
//     }else{
//         $("#CRM7500748").show();
//         $("#CRM7500748_fleg").val("Y");
//     }
    if($("#CRM7500748-01").val() == "" || $("#CRM7500748-01").val() == null){
        $("#CRM7500748_fleg").val("N");
        $("#CRM7500748-01").data("kendoMultiSelect").value("");
        $("#CRM7500748").hide();
    }else{
        $("#CRM7500748").show();
        $("#CRM7500748_fleg").val("Y");
    }

    //[참여일]
    if($("#CRM7500749-01").val() == "" || $("#CRM7500749-01").val() == null){
        $("#CRM7500749_fleg").val("N");
        $("#CRM7500749-01").val("");
        $("#CRM7500749-02").val("");
        $("#CRM7500749").hide();

    }else{
        $("#CRM7500749").show();
        $("#CRM7500749_fleg").val("Y");
    }
}

//조건에 따른 입력부 활성화
function f_addInput(value){
    //개인고객정보
    if(value == 'CRM7500101'){
        $("#CRM7500101").show();
        $("#CRM7500101_fleg").val("Y");
    }else if(value == 'CRM7500102'){
        $("#CRM7500102").show();
        $("#CRM7500102_fleg").val("Y");
    }else if(value == 'CRM7500103'){
        $("#CRM7500103").show();
        $("#CRM7500103_fleg").val("Y");
    }else if(value == 'CRM7500104'){
        $("#CRM7500104").show();
        $("#CRM7500104_fleg").val("Y");
    }else if(value == 'CRM7500105'){
        $("#CRM7500105").show();
        $("#CRM7500105_fleg").val("Y");
    }else if(value == 'CRM7500106'){
        $("#CRM7500106").show();
        $("#CRM7500106_fleg").val("Y");
    }else if(value == 'CRM7500107'){
        $("#CRM7500107").show();
        $("#CRM7500107_fleg").val("Y");
    }else if(value == 'CRM7500108'){
        $("#CRM7500108").show();
        $("#CRM7500108_fleg").val("Y");
    }else if(value == 'CRM7500109'){
        $("#CRM7500109").show();
        $("#CRM7500109_fleg").val("Y");
    }else if(value == 'CRM7500110'){
        $("#CRM7500110").show();
        $("#CRM7500110_fleg").val("Y");
    }else if(value == 'CRM7500111'){
        $("#CRM7500111").show();
        $("#CRM7500111_fleg").val("Y");
    }else if(value == 'CRM7500150'){
        $("#CRM7500150").show();
        $("#CRM7500150_fleg").val("Y");
    }else if(value == 'CRM7500112'){
        $("#CRM7500112").show();
        $("#CRM7500112_fleg").val("Y");
    }else if(value == 'CRM7500113'){
        $("#CRM7500113").show();
        $("#CRM7500113_fleg").val("Y");

    //판매기회정보
    }else if(value == 'CRM7500212'){
        $("#CRM7500212").show();
        $("#CRM7500212_fleg").val("Y");
    }else if(value == 'CRM7500213'){
        $("#CRM7500213").show();
        $("#CRM7500213_fleg").val("Y");
    }else if(value == 'CRM7500214'){
        $("#CRM7500214").show();
        $("#CRM7500214_fleg").val("Y");
    }else if(value == 'CRM7500215'){
        $("#CRM7500215").show();
        $("#CRM7500215_fleg").val("Y");
    }else if(value == 'CRM7500216'){
        $("#CRM7500216").show();
        $("#CRM7500216_fleg").val("Y");
    }else if(value == 'CRM7500217'){
        $("#CRM7500217").show();
        $("#CRM7500217_fleg").val("Y");

    //정비정보
    }else if(value == 'CRM7500318'){
        $("#CRM7500318").show();
        $("#CRM7500318_fleg").val("Y");
    }else if(value == 'CRM7500319'){
        $("#CRM7500319").show();
        $("#CRM7500319_fleg").val("Y");
    }else if(value == 'CRM7500320'){
        $("#CRM7500320").show();
        $("#CRM7500320_fleg").val("Y");
    }else if(value == 'CRM7500321'){
        $("#CRM7500321").show();
        $("#CRM7500321_fleg").val("Y");
    }else if(value == 'CRM7500322'){
        $("#CRM7500322").show();
        $("#CRM7500322_fleg").val("Y");
    }else if(value == 'CRM7500323'){
        $("#CRM7500323").show();
        $("#CRM7500323_fleg").val("Y");
    }else if(value == 'CRM7500324'){
        $("#CRM7500324").show();
        $("#CRM7500324_fleg").val("Y");
    }else if(value == 'CRM7500325'){
        $("#CRM7500325").show();
        $("#CRM7500325_fleg").val("Y");
    //구매정보
    }else if(value == 'CRM7500425'){
        $("#CRM7500425").show();
        $("#CRM7500425_fleg").val("Y");
    }else if(value == 'CRM7500426'){
        $("#CRM7500426").show();
        $("#CRM7500426_fleg").val("Y");
    }else if(value == 'CRM7500427'){
        $("#CRM7500427").show();
        $("#CRM7500427_fleg").val("Y");
    }else if(value == 'CRM7500428'){
        $("#CRM7500428").show();
        $("#CRM7500428_fleg").val("Y");
    }else if(value == 'CRM7500429'){
        $("#CRM7500429").show();
        $("#CRM7500429_fleg").val("Y");
    }else if(value == 'CRM7500430'){
        $("#CRM7500430").show();
        $("#CRM7500430_fleg").val("Y");
    }else if(value == 'CRM7500431'){
        $("#CRM7500431").show();
        $("#CRM7500431_fleg").val("Y");
    }else if(value == 'CRM7500432'){
        $("#CRM7500432").show();
        $("#CRM7500432_fleg").val("Y");
    }else if(value == 'CRM7500433'){
        $("#CRM7500433").show();
        $("#CRM7500433_fleg").val("Y");
    }else if(value == 'CRM7500434'){
        $("#CRM7500434").show();
        $("#CRM7500434_fleg").val("Y");
    }else if(value == 'CRM7500435'){
        $("#CRM7500435").show();
        $("#CRM7500435_fleg").val("Y");

    //연락정보
    }else if(value == 'CRM7500533'){
        $("#CRM7500533").show();
        $("#CRM7500533_fleg").val("Y");
    }else if(value == 'CRM7500534'){
        $("#CRM7500534").show();
        $("#CRM7500534_fleg").val("Y");
    }else if(value == 'CRM7500535'){
        $("#CRM7500535").show();
        $("#CRM7500535_fleg").val("Y");
    }else if(value == 'CRM7500536'){
        $("#CRM7500536").show();
        $("#CRM7500536_fleg").val("Y");
    }else if(value == 'CRM7500537'){
        $("#CRM7500537").show();
        $("#CRM7500357_fleg").val("Y");
    }else if(value == 'CRM7500538'){
        $("#CRM7500538").show();
        $("#CRM7500538_fleg").val("Y");
    }else if(value == 'CRM7500539'){
        $("#CRM7500539").show();
        $("#CRM7500539_fleg").val("Y");

    //개인거래이력
    }else if(value == 'CRM7500640'){
        $("#CRM7500640").show();
        $("#CRM7500640_fleg").val("Y");
    }else if(value == 'CRM7500641'){
        $("#CRM7500641").show();
        $("#CRM7500641_fleg").val("Y");
    }else if(value == 'CRM7500642'){
        $("#CRM7500642").show();
        $("#CRM7500642_fleg").val("Y");
    }else if(value == 'CRM7500643'){
        $("#CRM7500643").show();
        $("#CRM7500643_fleg").val("Y");
    }else if(value == 'CRM7500644'){
        $("#CRM7500644").show();
        $("#CRM7500644_fleg").val("Y");
    }else if(value == 'CRM7500645'){
        $("#CRM7500645").show();
        $("#CRM7500645_fleg").val("Y");
    }else if(value == 'CRM7500646'){
        $("#CRM7500646").show();
        $("#CRM7500646_fleg").val("Y");
    }else if(value == 'CRM7500647'){
        $("#CRM7500647").show();
        $("#CRM7500647_fleg").val("Y");

    //캠페인접촉정보
    }else if(value == 'CRM7500748'){
        $("#CRM7500748").show();
        $("#CRM7500748_fleg").val("Y");
    }else if(value == 'CRM7500749'){
        $("#CRM7500749").show();
        $("#CRM7500749_fleg").val("Y");
    }
}

//랜덤 체크시 이벤트
function f_randomYn(){
    if($("#randomYn").prop('checked')){
        $("#randomCnt").prop("disabled", false);
    }else{
        $("#randomCnt").data("kendoExtNumericTextBox").value(0);
        $("#randomCnt").prop("disabled", true);
    }
}

//문자열 byte 체크
var txtLimit = function(obj, limitByte) {

    var currLen = 0;
    var size = 0;
    var charCode, chr = null;
    for( var i = 0 ; i < obj.value.length ; i++ ) {

        chr = obj.value.charAt(i);
        charCode = chr.charCodeAt(0);

        if (charCode <= 0x00007F) size += 1; else
        if (charCode <= 0x0007FF) size += 2; else
        if (charCode <= 0x00FFFF) size += 3;
        else size += 4;

        //console.log("charCode:",charCode+" | size:",size)
        if(size > limitByte ){

            var rtnVal = "";

            for( var j = 0 ; j < currLen ; j++ ) {
                rtnVal += obj.value.charAt(j);
            }

            obj.value = rtnVal;
            // 텍스트를 {?} byte 초과하여 작성할 수 없습니다.
            dms.notification.warning("<spring:message code='crm.info.byteLimitInfo' arguments='"+limitByte+"' />");
            return false;

        };

        currLen++;
    };
};

$(document).ready(function() {

    $(".target_category>ul>li>a").click(function(e){
        e.preventDefault();
        if($(this).siblings().is(":hidden")){
            $(this).siblings().slideDown(200);
        }else {
            $(this).siblings().slideUp(200);
        }
    });

    //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:dms.data.cmmCdFilter(calendarList)
        ,optionLabel:""
        ,index:0
    });

    /**********************************************************
        버튼설정
    ***********************************************************/

    //버튼 - 초기화
    $("#btnAddTarg").kendoButton({
        click:function(e) {
            resetDefualtForm();
        }
    });

    //버튼 - 추출조건 저장
    $("#btnSaveTarg").kendoButton({
        click:function(e){

            if (crmTargExtractUsedCnt != 0) {   // crmTargExtractUsedCnt if - START
//              해당 추출조건은 다른업무에서 사용하고 있으므로 제목만 수정 가능합니다.
                var msg = "<spring:message code='crm.err.onlyTitleAbleCustTargExtr' />";
                dms.window.confirm({
                   message:msg
                   ,title :"<spring:message code='global.lbl.info' />"
                   ,callback:function(result){
                       if(result){
                           // 제목 수정 서비스

                           var updParams = {};
                           updParams["custExtrTermNo"]       = $("#custExtrTermNo").val();
                           updParams["custExtrTermNm"]       = $("#custExtrTermNm").val();

                           $.ajax({
                               url:"<c:url value='/crm/cmm/crmTargExtract/updateCrmTargExtractMaster.do' />"
                               ,dataType:"json"
                               ,type:"POST"
                               ,contentType:"application/json"
                               ,data:JSON.stringify(updParams)
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors);
                               }
                               ,success:function(data) {
                                   console.log("updateCrmTargExtractMaster result!!!");
                                   //dms.notification.success("<spring:message code='global.info.success'/>");
                               }
                               ,beforeSend:function(xhr){
                                   dms.loading.show();
                               }
                               ,complete:function(xhr,status){
                                   dms.loading.hide();
                               }

                           });
                       }else{
                           return false;
                       }
                   }
               });
            } else {        // crmTargExtractUsedCnt if - ELSE

                // 화면 필수 체크
                if ( dms.string.isEmpty($("#custExtrTermNm").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custExtrTermTitle' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custExtrTermNm").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( $("#randomYn").is(":checked") == true){
                    if($("#randomCnt").data("kendoExtNumericTextBox").value() == null || $("#randomCnt").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.randomCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#randomCnt").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }


                //개인고객정보-태어난 해
                if($("#CRM7500101_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500101-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.birthYyyy' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500101-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500101-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.birthYyyy' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500101-02").focus();
                        return false;
                    }
                }

                //개인고객정보-성별
                if($("#CRM7500102_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500102-01-01").is(":checked") == false && $("#CRM7500102-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='global.lbl.sex' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                        $("#CRM7500102-01-02").focus();
                        return false;
                    }
                }

                //개인고객정보-주소
                if($("#CRM7500103_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500103-01").val())){
                        dms.notification.warning("<spring:message code='global.lbl.addr' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500103-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500103-02").val())){
                        dms.notification.warning("<spring:message code='global.lbl.addr' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500103-02").focus();
                        return false;
                    }
                }

                //개인고객정보-생일
                if($("#CRM7500104_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500104-01").val())){
                        dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500104-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500104-02").val())){
                        dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500104-02").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500104-03").val())){
                        dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500104-03").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500104-04").val())){
                        dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500104-04").focus();
                        return false;
                    }
                }

                //개인고객정보-생일(몇일 전)
                if ($("#CRM7500105_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500105-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500105-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500105-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //개인고객정보-Blue Members
                if($("#CRM7500106_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500106-01-01").is(":checked") == false && $("#CRM7500106-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.blueMembers' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //개인고객정보-Blue Members Point
                if ($("#CRM7500107_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500107-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500107-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.blueMembersPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500107-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500107-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500107-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.blueMembersPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500107-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //개인고객정보-딜러회원
                if($("#CRM7500108_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500108-01-01").is(":checked") == false && $("#CRM7500108-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.dealerMember' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //개인고객정보-딜러회원 Point
                if ($("#CRM7500109_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500109-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500109-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.dealerMemberPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500109-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500109-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500109-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.dealerMemberPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500109-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //개인고객정보-고객출처
                if($("#CRM7500110_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500110-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.custSource' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500110-01").focus();
                        return false;
                    }
                }

                //개인고객정보-고객 신규날짜
                if($("#CRM7500111_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500111-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.custReqDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500111-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500111-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.custReqDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500111-02").focus();
                        return false;
                    }
                }

                //개인고객정보-잠재/보유고객
                if($("#CRM7500150_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500150-01-01").is(":checked") == false && $("#CRM7500150-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='global.lbl.custCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                        $("#CRM7500150-01-02").focus();
                        return false;
                    }
                }

                //회원등급
                if($("#CRM7500112_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500112-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.mLevel' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500112-01").focus();
                        return false;
                    }
                }

                //BM 회원등급
                if($("#CRM7500113_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500113-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.bmMembGrade' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500113-01").focus();
                        return false;
                    }
                }

                //판매기회정보-의향차종
                if($("#CRM7500212_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500212-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500212-01").focus();
                        return false;
                    }
                }

                //판매기회정보-추적등급
                if($("#CRM7500213_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500213-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.activeGrade' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500213-01").focus();
                        return false;
                    }
                }

                //판매기회정보-예상구매시기
                if($("#CRM7500214_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500214-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.expectPureTime' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500214-01").focus();
                        return false;
                    }
                }

                //판매기회정보-신규날짜
                if($("#CRM7500215_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500215-01").val())){
                        dms.notification.warning("<spring:message code='global.lbl.newRegDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500215-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500215-02").val())){
                        dms.notification.warning("<spring:message code='global.lbl.newRegDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500215-02").focus();
                        return false;
                    }
                }

                //판매기회정보-6개월이내 구매확률
                if ($("#CRM7500216_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500216-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500216-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.sixMonthPure' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500216-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500216-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500216-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.sixMonthPure' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500216-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //판매기회정보-구매예상금액
                if ($("#CRM7500217_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500217-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500217-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.expcBpPrice' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500217-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500217-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500217-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.expcBpPrice' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500217-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-정비 일자
                if($("#CRM7500318_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500318-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500318-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500318-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500318-02").focus();
                        return false;
                    }
                }

                //정비정보-정비 일자(후 일수)
                if ($("#CRM7500319_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500319-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500319-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500319-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-주행 거리
                if ($("#CRM7500320_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500320-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.runDistVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500320-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500320-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.runDistVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500320-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-정비 금액
                if ($("#CRM7500321_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500321-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500321-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500321-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500321-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-정비 누적 금액
                if ($("#CRM7500322_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500322-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500322-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrAccAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500322-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500322-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500322-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrAccAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500322-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-정비위탁유형
                if($("#CRM7500323_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500323-01").val())){
                        dms.notification.warning("<spring:message code='par.lbl.invResvWorkType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500323-01").focus();
                        return false;
                    }
                }

                //정비정보-정비 횟수
                if ($("#CRM7500324_fleg").val() == "Y"){
                    // 화면 필수 체크
                    var CRM7500324_01 = $("#CRM7500324-01").data("kendoExtNumericTextBox").value();
                    var CRM7500324_02 = $("#CRM7500324-02").data("kendoExtNumericTextBox").value();
                    if($("#CRM7500324-01").data("kendoExtNumericTextBox").value() == null){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500324-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500324-02").data("kendoExtNumericTextBox").value() == null){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500324-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }

                    if (CRM7500324_02 - CRM7500324_01 < 0) {
                        dms.notification.warning("<spring:message code='crm.info.NotDisitAfterNumber' />");
                        $("#CRM7500324-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-수리유형
                if($("#CRM7500325_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500325-01").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.lbrTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500325-01").focus();
                        return false;
                    }
                }

                //구매정보-구매경험
                if($("#CRM7500425_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500425-01-01").is(":checked") == false && $("#CRM7500425-01-02").is(":checked") == false && $("#CRM7500425-01-03").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.pureExperience' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //구매정보-최근구매차종
                if($("#CRM7500426_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500426-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.latelyPureCar' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500426-01").focus();
                        return false;
                    }
                }

                //구매정보-최근 구매차 구매일
                if($("#CRM7500427_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500427-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.latelyPureCarDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500427-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500427-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.latelyPureCarDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500427-02").focus();
                        return false;
                    }
                }

                //구매정보-보유차종
                if($("#CRM7500428_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500428-01").val())){
                        dms.notification.warning("<spring:message code='global.lbl.haveCar' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500428-01").focus();
                        return false;
                    }
                }

                //구매정보-보유차 구매일
                if($("#CRM7500429_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500429-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.havePureDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500429-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500429-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.havePureDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500429-02").focus();
                        return false;
                    }
                }

                //구매정보-보유 대수
                if ($("#CRM7500430_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500430-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500430-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.haveCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500430-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500430-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500430-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.haveCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500430-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //구매정보-본 딜러에서 구매 대수
                if ($("#CRM7500431_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500431-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500431-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.dlrCdPureCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500431-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500431-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500431-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.dlrCdPureCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500431-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //구매정보-신차 출고일
                if ($("#CRM7500432_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500432-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500432-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.ncarRelease' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500432-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //구매정보-보험
                if($("#CRM7500433_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500433-01-01").is(":checked") == false && $("#CRM7500433-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='global.lbl.insurance' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //구매정보-금융
                if($("#CRM7500434_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500434-01-01").is(":checked") == false && $("#CRM7500434-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.fincRate' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //구매정보-보험 시작일
                if ($("#CRM7500435_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500435-01").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.incStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500435-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500435-02").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.incStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500435-02").focus();
                        return false;
                    }

                }

                //연락정보-유효주소보유
                if($("#CRM7500533_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500533-01-01").is(":checked") == false && $("#CRM7500533-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.peridAddrHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //연락정보-대표전화보유
                if($("#CRM7500534_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500534-01-01").is(":checked") == false && $("#CRM7500534-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.repTelHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //연락정보-핸드폰전화보유
                if($("#CRM7500535_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500535-01-01").is(":checked") == false && $("#CRM7500535-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.hpTelHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //연락정보-WECHAT 보유
                if($("#CRM7500536_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500536-01-01").is(":checked") == false && $("#CRM7500536-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.wechatHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //연락정보-SMS 수신 거부 제외
                if($("#CRM7500537_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500537-01-01").is(":checked") == false && $("#CRM7500537-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.smsRejectRecvOff' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //연락정보-휴대전화 수신 거부 제외
                if($("#CRM7500538_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500538-01-01").is(":checked") == false && $("#CRM7500538-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.hpRejectRecvOff' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //연락정보-집전화 수신 거부 제외
                if($("#CRM7500539_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( $("#CRM7500539-01-01").is(":checked") == false && $("#CRM7500539-01-02").is(":checked") == false){
                        dms.notification.warning("<spring:message code='crm.lbl.homeTelRejectRecvOff' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    }
                }

                //개인거래이력-활동방법
                if($("#CRM7500640_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500640-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.activePlan' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500640-01").focus();
                        return false;
                    }
                }

                //개인거래이력-활동 참가 일
                if($("#CRM7500641_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500641-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.activeEnterDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500641-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500641-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.activeEnterDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500641-02").focus();
                        return false;
                    }
                }

                //개인거래이력-활동 참가 횟수
                if ($("#CRM7500642_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500642-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500642-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.activeEnterCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500642-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500642-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500642-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.activeEnterCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500642-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //개인거래이력-고객 케어 일
                if($("#CRM7500643_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500643-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.custCareDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500643-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500643-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.custCareDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500643-02").focus();
                        return false;
                    }
                }

                //개인거래이력-고객 케어 횟수
                if ($("#CRM7500644_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500644-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500644-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.custCareCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500644-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500644-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500644-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.custCareCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500644-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //개인거래이력-설문 일
                if($("#CRM7500645_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500645-01").val())){
                        dms.notification.warning("<spring:message code='global.lbl.stsfIvstDtEx' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500645-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500645-02").val())){
                        dms.notification.warning("<spring:message code='global.lbl.stsfIvstDtEx' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500645-02").focus();
                        return false;
                    }
                }

                //개인거래이력-설문 횟수
                if ($("#CRM7500646_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500646-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500646-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='global.lbl.stsfIvstCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500646-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500646-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500646-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='global.lbl.stsfIvstCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500646-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //개인거래이력-최근 3개월 접근 횟수
                if ($("#CRM7500647_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500647-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500647-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lately3MonthAccessCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500647-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500647-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500647-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lately3MonthAccessCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500647-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //캠페인 접촉정보-참여 캠페인
                if($("#CRM7500748_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500748-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.useCampaign' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500748-01").focus();
                        return false;
                    }
                }

                //캠페인 접촉정보-참여일
                if($("#CRM7500749_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500749-01").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.useDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500749-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500749-02").val())){
                        dms.notification.warning("<spring:message code='crm.lbl.useDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500749-02").focus();
                        return false;
                    }
                }

                if($("#CRM7500101_fleg").val() == "N" && $("#CRM7500102_fleg").val() == "N" && $("#CRM7500103_fleg").val() == "N" && $("#CRM7500104_fleg").val() == "N" && $("#CRM7500105_fleg").val() == "N" &&
                   $("#CRM7500106_fleg").val() == "N" && $("#CRM7500107_fleg").val() == "N" && $("#CRM7500108_fleg").val() == "N" && $("#CRM7500109_fleg").val() == "N" && $("#CRM7500110_fleg").val() == "N" &&
                   $("#CRM7500111_fleg").val() == "N" && $("#CRM7500212_fleg").val() == "N" && $("#CRM7500213_fleg").val() == "N" && $("#CRM7500214_fleg").val() == "N" && $("#CRM7500215_fleg").val() == "N" &&
                   $("#CRM7500216_fleg").val() == "N" && $("#CRM7500217_fleg").val() == "N" && $("#CRM7500318_fleg").val() == "N" && $("#CRM7500319_fleg").val() == "N" && $("#CRM7500320_fleg").val() == "N" &&
                   $("#CRM7500321_fleg").val() == "N" && $("#CRM7500322_fleg").val() == "N" && $("#CRM7500323_fleg").val() == "N" && $("#CRM7500324_fleg").val() == "N" && $("#CRM7500325_fleg").val() == "N" &&
                   $("#CRM7500425_fleg").val() == "N" &&
                   $("#CRM7500426_fleg").val() == "N" && $("#CRM7500427_fleg").val() == "N" && $("#CRM7500428_fleg").val() == "N" && $("#CRM7500429_fleg").val() == "N" && $("#CRM7500430_fleg").val() == "N" &&
                   $("#CRM7500431_fleg").val() == "N" && $("#CRM7500432_fleg").val() == "N" && $("#CRM7500533_fleg").val() == "N" && $("#CRM7500534_fleg").val() == "N" && $("#CRM7500535_fleg").val() == "N" &&
                   $("#CRM7500536_fleg").val() == "N" && $("#CRM7500537_fleg").val() == "N" && $("#CRM7500538_fleg").val() == "N" && $("#CRM7500539_fleg").val() == "N" && $("#CRM7500640_fleg").val() == "N" &&
                   $("#CRM7500641_fleg").val() == "N" && $("#CRM7500642_fleg").val() == "N" && $("#CRM7500643_fleg").val() == "N" && $("#CRM7500644_fleg").val() == "N" && $("#CRM7500645_fleg").val() == "N" &&
                   $("#CRM7500646_fleg").val() == "N" && $("#CRM7500647_fleg").val() == "N" && $("#CRM7500748_fleg").val() == "N" && $("#CRM7500749_fleg").val() == "N" && $("#CRM7500150_fleg").val() == "N" &&
                   $("#CRM7500112_fleg").val() == "N" && $("#CRM7500113_fleg").val() == "N" && $("#CRM7500433_fleg").val() == "N" && $("#CRM7500434_fleg").val() == "N" && $("#CRM7500435_fleg").val() == "N" ){
                    dms.notification.warning("<spring:message code='crm.info.noExtrTerms'/>"); //대상자 추출조건을 하나 이상 등록해 주세요.
                    return false;
                }

                //추출조건 마스터
                var formSaveData = $("#crmTargExtractMasterForm").serializeObject();

                if ($("#randomYn").prop("checked")){
                    formSaveData.randomYn = "Y"
                }else{
                    formSaveData.randomYn = "N"
                };

                //추출조건 상세
                var json = {};

                //태어난 해
                json["CRM7500101"] = $("#CRM7500101-01").val() != "" && $("#CRM7500101-01").val() != null ? $("#CRM7500101-01").val() + "|" + $("#CRM7500101-02").val():"";

                //성별
                json["CRM7500102"] = $("#CRM7500102-01-01").is(":checked") == true || $("#CRM7500102-01-02").is(":checked") == true ? $("#CRM7500102-01-01").is(":checked") == true ? "M":"F":"";

                //주소
                json["CRM7500103"] = $("#CRM7500103-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500103-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500103-01").data("kendoExtDropDownList").value() + "|" + $("#CRM7500103-02").data("kendoExtDropDownList").value():"";

                //생일
                json["CRM7500104"] = $("#CRM7500104-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500104-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500104-01").data("kendoExtDropDownList").value() + "|" + $("#CRM7500104-02").data("kendoExtDropDownList").value() + "|" + $("#CRM7500104-03").data("kendoExtDropDownList").value() + "|" + $("#CRM7500104-04").data("kendoExtDropDownList").value():"";

                //생일(몇일 전)
                json["CRM7500105"] = $("#CRM7500105-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500105-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500105-01").data("kendoExtNumericTextBox").value():"";

                //Blue Members
                json["CRM7500106"] = $("#CRM7500106-01-01").is(":checked") == true || $("#CRM7500106-01-02").is(":checked") == true ? $("#CRM7500106-01-01").is(":checked") == true ? "Y":"N":"";

                //Blue Members Point
                json["CRM7500107"] = $("#CRM7500107-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500107-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500107-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500107-02").data("kendoExtNumericTextBox").value():"";

                //딜러회원
                json["CRM7500108"] = $("#CRM7500108-01-01").is(":checked") == true || $("#CRM7500108-01-02").is(":checked") == true ? $("#CRM7500108-01-01").is(":checked") == true ? "Y":"N":"";

                //딜러회원 Point
                json["CRM7500109"] = $("#CRM7500109-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500109-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500109-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500109-02").data("kendoExtNumericTextBox").value():"";

                //고객출처
                json["CRM7500110"] = $("#CRM7500110-01").data("kendoMultiSelect").value() != "" && $("#CRM7500110-01").data("kendoMultiSelect").value() != null ?$("#CRM7500110-01").data("kendoMultiSelect").value():"";

                //고객 신규날짜
                json["CRM7500111"] = $("#CRM7500111-01").val() != "" && $("#CRM7500111-01").val() != null ? $("#CRM7500111-01").val() + "|" + $("#CRM7500111-02").val():"";

                //잠재/보유고객
                json["CRM7500150"] = $("#CRM7500150-01-01").is(":checked") == true || $("#CRM7500150-01-02").is(":checked") == true ? $("#CRM7500150-01-01").is(":checked") == true ? "01":"02":"";

                //회원등급
                json["CRM7500112"] = $("#CRM7500112-01").data("kendoMultiSelect").value() != "" && $("#CRM7500112-01").data("kendoMultiSelect").value() != null ?$("#CRM7500112-01").data("kendoMultiSelect").value():"";

                //BM 회원등급
                json["CRM7500113"] = $("#CRM7500113-01").data("kendoMultiSelect").value() != "" && $("#CRM7500113-01").data("kendoMultiSelect").value() != null ?$("#CRM7500113-01").data("kendoMultiSelect").value():"";

                //의향차종
                json["CRM7500212"] = $("#CRM7500212-01").data("kendoMultiSelect").value() != "" && $("#CRM7500212-01").data("kendoMultiSelect").value() != null ?$("#CRM7500212-01").data("kendoMultiSelect").value():"";

                //추적등급
                json["CRM7500213"] = $("#CRM7500213-01").data("kendoMultiSelect").value() != "" && $("#CRM7500213-01").data("kendoMultiSelect").value() != null ?$("#CRM7500213-01").data("kendoMultiSelect").value():"";

                //예상구매시기
                json["CRM7500214"] = $("#CRM7500214-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500214-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500214-01").data("kendoExtDropDownList").value():"";

                //신규날짜
                json["CRM7500215"] = $("#CRM7500215-01").val() != "" && $("#CRM7500215-01").val() != null ? $("#CRM7500215-01").val() + "|" + $("#CRM7500215-02").val():"";

                //6개원이내 구매확률
                json["CRM7500216"] = $("#CRM7500216-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500216-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500216-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500216-02").data("kendoExtNumericTextBox").value():"";

                //구매예상금액
                json["CRM7500217"] = $("#CRM7500217-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500217-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500217-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500217-02").data("kendoExtNumericTextBox").value():"";

                //정비 일자
                json["CRM7500318"] = $("#CRM7500318-01").val() != "" && $("#CRM7500318-01").val() != null ? $("#CRM7500318-01").val() + "|" + $("#CRM7500318-02").val():"";

                //정비 일자(후 일수)
                json["CRM7500319"] = $("#CRM7500319-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500319-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500319-01").data("kendoExtNumericTextBox").value():"";

                //주행 거리
                json["CRM7500320"] = $("#CRM7500320-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500320-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500320-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500320-02").data("kendoExtNumericTextBox").value():"";

                //정비 금액
                json["CRM7500321"] = $("#CRM7500321-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500321-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500321-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500321-02").data("kendoExtNumericTextBox").value():"";

                //정비 누적 금액
                json["CRM7500322"] = $("#CRM7500322-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500322-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500322-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500322-02").data("kendoExtNumericTextBox").value():"";

                //정비위탁유형
//                 json["CRM7500323"] = $("#CRM7500323-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500323-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500323-01").data("kendoExtDropDownList").value():"";
                json["CRM7500323"] = $("#CRM7500323-01").data("kendoMultiSelect").value() != "" && $("#CRM7500323-01").data("kendoMultiSelect").value() != null ?$("#CRM7500323-01").data("kendoMultiSelect").value():"";

                //정비 횟수
                if ($("#CRM7500324_fleg").val() == "Y"){
                    json["CRM7500324"] = $("#CRM7500324-01").data("kendoExtNumericTextBox").value() != null ? $("#CRM7500324-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500324-02").data("kendoExtNumericTextBox").value():"";
                }

                //수리유형
                json["CRM7500325"] = $("#CRM7500325-01").data("kendoMultiSelect").value() != "" && $("#CRM7500325-01").data("kendoMultiSelect").value() != null ?$("#CRM7500325-01").data("kendoMultiSelect").value():"";

                //구매경험
                json["CRM7500425"] = $("#CRM7500425-01-01").is(":checked") == true || $("#CRM7500425-01-02").is(":checked") == true || $("#CRM7500425-01-03").is(":checked") == true ? $("#CRM7500425-01-01").is(":checked") == true ? "FP":$("#CRM7500425-01-02").is(":checked") == true ? "RP":"TP":"";

                //최근구매차종
                json["CRM7500426"] = $("#CRM7500426-01").data("kendoMultiSelect").value() != "" && $("#CRM7500426-01").data("kendoMultiSelect").value() != null ?$("#CRM7500426-01").data("kendoMultiSelect").value():"";

                //최근 구매차 구매일
                json["CRM7500427"] = $("#CRM7500427-01").val() != "" && $("#CRM7500427-01").val() != null ? $("#CRM7500427-01").val() + "|" + $("#CRM7500427-02").val():"";

                //보유차종
                json["CRM7500428"] = $("#CRM7500428-01").data("kendoMultiSelect").value() != "" && $("#CRM7500428-01").data("kendoMultiSelect").value() != null ?$("#CRM7500428-01").data("kendoMultiSelect").value():"";

                //보유차 구매일
                json["CRM7500429"] = $("#CRM7500429-01").val() != "" && $("#CRM7500429-01").val() != null ? $("#CRM7500429-01").val() + "|" + $("#CRM7500429-02").val():"";

                //보유 대수
                json["CRM7500430"] = $("#CRM7500430-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500430-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500430-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500430-02").data("kendoExtNumericTextBox").value():"";

                //본 딜러에서 구매 대수
                json["CRM7500431"] = $("#CRM7500431-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500431-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500431-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500431-02").data("kendoExtNumericTextBox").value():"";

                //신차 출고일
                json["CRM7500432"] = $("#CRM7500432-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500432-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500432-01").data("kendoExtNumericTextBox").value():"";

                //보험
                json["CRM7500433"] = $("#CRM7500433-01-01").is(":checked") == true || $("#CRM7500433-01-02").is(":checked") == true ? $("#CRM7500433-01-01").is(":checked") == true ? "Y":"N":"";

                //금융
                json["CRM7500434"] = $("#CRM7500434-01-01").is(":checked") == true || $("#CRM7500434-01-02").is(":checked") == true ? $("#CRM7500434-01-01").is(":checked") == true ? "Y":"N":"";

                //보험 시작일
                json["CRM7500435"] = $("#CRM7500435-01").val() != "" && $("#CRM7500435-01").val() != null ? $("#CRM7500435-01").val() + "|" + $("#CRM7500435-02").val():"";

                //유효주소보유
                json["CRM7500533"] = $("#CRM7500533-01-01").is(":checked") == true || $("#CRM7500533-01-02").is(":checked") == true ? $("#CRM7500533-01-01").is(":checked") == true ? "Y":"N":"";

                //대표전화보유
                json["CRM7500534"] = $("#CRM7500534-01-01").is(":checked") == true || $("#CRM7500534-01-02").is(":checked") == true ? $("#CRM7500534-01-01").is(":checked") == true ? "Y":"N":"";

                //핸드폰전화보유
                json["CRM7500535"] = $("#CRM7500535-01-01").is(":checked") == true || $("#CRM7500535-01-02").is(":checked") == true ? $("#CRM7500535-01-01").is(":checked") == true ? "Y":"N":"";

                //WECHAT 보유
                json["CRM7500536"] = $("#CRM7500536-01-01").is(":checked") == true || $("#CRM7500536-01-02").is(":checked") == true ? $("#CRM7500536-01-01").is(":checked") == true ? "Y":"N":"";

                //SMS 수신 거부 제외
                json["CRM7500537"] = $("#CRM7500537-01-01").is(":checked") == true || $("#CRM7500537-01-02").is(":checked") == true ? $("#CRM7500537-01-01").is(":checked") == true ? "Y":"N":"";

                //휴대전화 수신 거부 제외
                json["CRM7500538"] = $("#CRM7500538-01-01").is(":checked") == true || $("#CRM7500538-01-02").is(":checked") == true ? $("#CRM7500538-01-01").is(":checked") == true ? "Y":"N":"";

                //집전화 수신 거부 제외
                json["CRM7500539"] = $("#CRM7500539-01-01").is(":checked") == true || $("#CRM7500539-01-02").is(":checked") == true ? $("#CRM7500539-01-01").is(":checked") == true ? "Y":"N":"";

                //활동방법
                json["CRM7500640"] = $("#CRM7500640-01").data("kendoMultiSelect").value() != "" && $("#CRM7500640-01").data("kendoMultiSelect").value() != null ?$("#CRM7500640-01").data("kendoMultiSelect").value():"";

                //활동 참가 일
                json["CRM7500641"] = $("#CRM7500641-01").val() != "" && $("#CRM7500641-01").val() != null ? $("#CRM7500641-01").val() + "|" + $("#CRM7500641-02").val():"";

                //활동 참가 횟수
                json["CRM7500642"] = $("#CRM7500642-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500642-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500642-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500642-02").data("kendoExtNumericTextBox").value():"";

                //고객 케어 일
                json["CRM7500643"] = $("#CRM7500643-01").val() != "" && $("#CRM7500643-01").val() != null ? $("#CRM7500643-01").val() + "|" + $("#CRM7500643-02").val():"";

                //고객 케어 횟수
                json["CRM7500644"] = $("#CRM7500644-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500644-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500644-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500644-02").data("kendoExtNumericTextBox").value():"";

                //설문 일
                json["CRM7500645"] = $("#CRM7500645-01").val() != "" && $("#CRM7500645-01").val() != null ? $("#CRM7500645-01").val() + "|" + $("#CRM7500645-02").val():"";

                //설문 횟수
                json["CRM7500646"] = $("#CRM7500646-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500646-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500646-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500646-02").data("kendoExtNumericTextBox").value():"";

                //최근 3개월 접근 횟수
                json["CRM7500647"] = $("#CRM7500647-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500647-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500647-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500647-02").data("kendoExtNumericTextBox").value():"";

                //참여 캠페인
                //json["CRM7500748"] = $("#CRM7500748-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500748-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500748-01").data("kendoExtDropDownList").value():"";
                json["CRM7500748"] = $("#CRM7500748-01").data("kendoMultiSelect").value() != "" && $("#CRM7500748-01").data("kendoMultiSelect").value() != null ?$("#CRM7500748-01").data("kendoMultiSelect").value():"";

                //참여일
                json["CRM7500749"] = $("#CRM7500749-01").val() != "" && $("#CRM7500749-01").val() != null ? $("#CRM7500749-01").val() + "|" + $("#CRM7500749-02").val():"";

                var params = [];
                var idx = 0;

                $.each(json, function(key, value){

                    if(value != ""){
                        obj = {};
                        obj["dlrCd"] = $("dlrCd").val();
                        obj["custExtrTermNo"] = $("custExtrTermNo").val();
                        obj["detlExtrTermCd"] = key;

                        if (value.constructor === Array) {
                            obj["termVal1"] = value.join(",");
                        } else {
                            obj["termVal1"] = value;
                        }

                        params.push(obj);

                        idx++;
                    }
                });

                var paramsEx =  $.extend(
                    {"extractList":formSaveData}
                    ,{"extractSaveList":params}
                 );

                console.log("paramsEx Parameter :::::: ");
                console.log(paramsEx);

                $.ajax({
                    url:"<c:url value='/crm/cmm/crmTargExtract/multiTargExtracts.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify(paramsEx)
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {

                        console.log("multiTargExtracts result!!!");
                        //dms.notification.success("<spring:message code='global.info.success'/>");
                        //console.log(data);

                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show();
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide();
                    }
                }).done(function(data) {

                    console.log(data);
                    console.log(data.detlExtrTermCdTermVal);
                    console.log(data.custExtrTermNo);

                    if (data.detlExtrTermCdTermVal == "0" ){
                        $("#custExtrTermNo").val(data.custExtrTermNo);
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    } else {

//                       이미 존재합니다. 확인 하시겠습니까?
                         var custExtrTermNo = data.custExtrTermNo;   // setCustExtrTermNo
                         var msg = "<spring:message code='crm.lbl.custExtrTermTitle' var='returnMsg' /><spring:message code='crm.info.dupConfirmMsg' arguments='${returnMsg}' />";

                         if (data.detlExtrTermCdTermVal == "2") {
                             msg = "<spring:message code='crm.lbl.custExtrTermDetailList' var='returnMsg' /><spring:message code='crm.info.dupConfirmMsg' arguments='${returnMsg}' />";
                         }

                         if (data.detlExtrTermCdTermVal == "1" || data.detlExtrTermCdTermVal == "2") {
                             console.log(data.detlExtrTermCdTermVal);
                             dms.window.confirm({
                                message:msg
                                ,title :"<spring:message code='global.lbl.info' />"
                                ,callback:function(result){
                                    if(result){
                                        parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.crmTargExtractDetail' />", "<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do' />?sCustExtrTermNo="+custExtrTermNo, "VIEW-D-10272"); // CUST NO
                                        // window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.crmTargExtractDetail' />", "<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do' />?sDlrCd="+dataItem.dlrCd+"&sCustExtrTermNo="+dataItem.custExtrTermNo); // RO Main
                                    }else{
                                        return false;
                                    }
                                }
                             });
                         } else if(data.detlExtrTermCdTermVal == "3"){
                             console.log(data.detlExtrTermCdTermVal);
                             msg = "<spring:message code='crm.lbl.custExtrTermTitle' var='returnMsg' /><spring:message code='crm.lbl.custExtrTermDetailList' var='returnMsg2' /><spring:message code='crm.info.extractDupMsg' arguments='${returnMsg},${returnMsg2}' />";
                             dms.notification.warning(msg);
                         }
                    }

                });
            } //        crmTargExtractUsedCnt if - END

        }
    });

    //버튼 - 추출조건 삭제
    $("#btnDelTarg").kendoButton({
        click:function(e) {

            // 화면 필수 체크
            if ( dms.string.isEmpty($("#custExtrTermNo").val())){
                dms.notification.warning("<spring:message code='global.info.noDelData'/>");
                return false;
            };

            // 삭제 confirm
            dms.window.confirm({
                message:"<spring:message code='cmm.info.delYn'/>"       // 삭제하시겠습니까?
                ,callback:function(result){
                    if(result){

                        var json = $("#crmTargExtractMasterForm").serializeObject();

                        var url = "<c:url value='/crm/cmm/crmTargExtract/deleteTargExtract.do' />";

                        $.ajax({
                            url:url
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                            ,data:JSON.stringify(json)
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(data) {
                                // 삭제가 완료 되었습니다.
                                dms.notification.success("<spring:message code='global.info.deleteSuccess'/>");

                                //입력부 초기화
                                resetDefualtForm();
                            }
                            ,beforeSend:function(xhr){
                                dms.loading.show();
                            }
                            ,complete:function(xhr,status){
                                dms.loading.hide();
                            }
                        });

                    }else{
                        //취소버튼 클릭 로직
                        return;
                    }
                }
            });
            // 삭제 confirm

        }
    });

    //추출진행
    $("#btnTargExtracting").kendoButton({
        click:function(e) {

            // 화면 필수 체크
            if ( dms.string.isEmpty($("#custExtrTermNo").val())){
                dms.notification.warning("<spring:message code='crm.err.noCustExtrTermNoSave'/>");
                return false;
            }

         // 화면 필수 체크
            if ( dms.string.isEmpty($("#custExtrTermNm").val())){
                dms.notification.warning("<spring:message code='crm.lbl.custExtrTermTitle' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#custExtrTermNm").focus();
                return false;
            }
            // 화면 필수 체크
            if ( $("#randomYn").is(":checked") == true){
                if($("#randomCnt").data("kendoExtNumericTextBox").value() == null || $("#randomCnt").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.randomCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#randomCnt").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }


            //개인고객정보-태어난 해
            if($("#CRM7500101_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500101-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.birthYyyy' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500101-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500101-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.birthYyyy' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500101-02").focus();
                    return false;
                }
            }

            //개인고객정보-성별
            if($("#CRM7500102_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500102-01-01").is(":checked") == false && $("#CRM7500102-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='global.lbl.sex' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                    $("#CRM7500102-01-02").focus();
                    return false;
                }
            }

            //개인고객정보-주소
            if($("#CRM7500103_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500103-01").val())){
                    dms.notification.warning("<spring:message code='global.lbl.addr' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500103-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500103-02").val())){
                    dms.notification.warning("<spring:message code='global.lbl.addr' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500103-02").focus();
                    return false;
                }
            }

            //개인고객정보-생일
            if($("#CRM7500104_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500104-01").val())){
                    dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500104-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500104-02").val())){
                    dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500104-02").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500104-03").val())){
                    dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500104-03").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500104-04").val())){
                    dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500104-04").focus();
                    return false;
                }
            }

            //개인고객정보-생일(몇일 전)
            if ($("#CRM7500105_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500105-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500105-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='global.lbl.birthday' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500105-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //개인고객정보-Blue Members
            if($("#CRM7500106_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500106-01-01").is(":checked") == false && $("#CRM7500106-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.blueMembers' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //개인고객정보-Blue Members Point
            if ($("#CRM7500107_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500107-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500107-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.blueMembersPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500107-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500107-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500107-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.blueMembersPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500107-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //개인고객정보-딜러회원
            if($("#CRM7500108_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500108-01-01").is(":checked") == false && $("#CRM7500108-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.dealerMember' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //개인고객정보-딜러회원 Point
            if ($("#CRM7500109_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500109-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500109-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.dealerMemberPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500109-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500109-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500109-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.dealerMemberPoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500109-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //개인고객정보-고객출처
            if($("#CRM7500110_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500110-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custSource' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500110-01").focus();
                    return false;
                }
            }

            //개인고객정보-고객 신규날짜
            if($("#CRM7500111_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500111-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custReqDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500111-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500111-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custReqDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500111-02").focus();
                    return false;
                }
            }

            //개인고객정보-잠재/보유고객
            if($("#CRM7500150_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500150-01-01").is(":checked") == false && $("#CRM7500150-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='global.lbl.custCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                    $("#CRM7500150-01-02").focus();
                    return false;
                }
            }

            //회원등급
            if($("#CRM7500112_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500112-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.mLevel' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500112-01").focus();
                    return false;
                }
            }

            //BM 회원등급
            if($("#CRM7500113_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500113-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.bmMembGrade' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500113-01").focus();
                    return false;
                }
            }

            //판매기회정보-의향차종
            if($("#CRM7500212_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500212-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500212-01").focus();
                    return false;
                }
            }

            //판매기회정보-추적등급
            if($("#CRM7500213_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500213-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.activeGrade' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500213-01").focus();
                    return false;
                }
            }

            //판매기회정보-예상구매시기
            if($("#CRM7500214_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500214-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.expectPureTime' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500214-01").focus();
                    return false;
                }
            }

            //판매기회정보-신규날짜
            if($("#CRM7500215_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500215-01").val())){
                    dms.notification.warning("<spring:message code='global.lbl.newRegDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500215-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500215-02").val())){
                    dms.notification.warning("<spring:message code='global.lbl.newRegDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500215-02").focus();
                    return false;
                }
            }

            //판매기회정보-6개월이내 구매확률
            if ($("#CRM7500216_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500216-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500216-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.sixMonthPure' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500216-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500216-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500216-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.sixMonthPure' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500216-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //판매기회정보-구매예상금액
            if ($("#CRM7500217_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500217-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500217-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.expcBpPrice' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500217-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500217-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500217-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.expcBpPrice' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500217-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //정비정보-정비 일자
            if($("#CRM7500318_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500318-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500318-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500318-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500318-02").focus();
                    return false;
                }
            }

            //정비정보-정비 일자(후 일수)
            if ($("#CRM7500319_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500319-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500319-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500319-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //정비정보-주행 거리
            if ($("#CRM7500320_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500320-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.runDistVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500320-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500320-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.runDistVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500320-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //정비정보-정비금액
            if ($("#CRM7500321_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500321-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500321-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500321-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500321-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //정비정보-정비누적금액
            if ($("#CRM7500322_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500322-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500322-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrAccAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500322-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500322-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500322-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrAccAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500322-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //정비정보-정비위탁유형
            if($("#CRM7500323_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500323-01").val())){
                    dms.notification.warning("<spring:message code='par.lbl.invResvWorkType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500323-01").focus();
                    return false;
                }
            }

            //정비정보-정비 횟수
            if ($("#CRM7500324_fleg").val() == "Y"){
                // 화면 필수 체크
//                 if($("#CRM7500324-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500324-01").data("kendoExtNumericTextBox").value() == 0){
//                     dms.notification.warning("<spring:message code='crm.lbl.lbrCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                     $("#CRM7500324-01").data("kendoExtNumericTextBox").focus();
//                     return false;
//                 }
                // 화면 필수 체크
//                 if($("#CRM7500324-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500324-02").data("kendoExtNumericTextBox").value() == 0){
//                     dms.notification.warning("<spring:message code='crm.lbl.lbrCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                     $("#CRM7500324-02").data("kendoExtNumericTextBox").focus();
//                     return false;
//                 }

                // 화면 필수 체크
                var CRM7500324_01 = $("#CRM7500324-01").data("kendoExtNumericTextBox").value();
                var CRM7500324_02 = $("#CRM7500324-02").data("kendoExtNumericTextBox").value();
                if($("#CRM7500324-01").data("kendoExtNumericTextBox").value() == null){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500324-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500324-02").data("kendoExtNumericTextBox").value() == null){
                    dms.notification.warning("<spring:message code='crm.lbl.lbrCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500324-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }

                if (CRM7500324_02 - CRM7500324_01 < 0) {
                    dms.notification.warning("<spring:message code='crm.info.NotDisitAfterNumber' />");
                    $("#CRM7500324-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }



            }

            //정비정보-수리유형
            if($("#CRM7500325_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500325-01").val())){
                    dms.notification.warning("<spring:message code='ser.lbl.lbrTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500325-01").focus();
                    return false;
                }
            }

            //구매정보-구매경험
            if($("#CRM7500425_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500425-01-01").is(":checked") == false && $("#CRM7500425-01-02").is(":checked") == false && $("#CRM7500425-01-03").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.pureExperience' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //구매정보-최근구매차종
            if($("#CRM7500426_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500426-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.latelyPureCar' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500426-01").focus();
                    return false;
                }
            }

            //구매정보-최근 구매차 구매일
            if($("#CRM7500427_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500427-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.latelyPureCarDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500427-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500427-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.latelyPureCarDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500427-02").focus();
                    return false;
                }
            }

            //구매정보-보유차종
            if($("#CRM7500428_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500428-01").val())){
                    dms.notification.warning("<spring:message code='global.lbl.haveCar' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500428-01").focus();
                    return false;
                }
            }

            //구매정보-보유차 구매일
            if($("#CRM7500429_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500429-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.havePureDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500429-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500429-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.havePureDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500429-02").focus();
                    return false;
                }
            }

            //구매정보-보유 대수
            if ($("#CRM7500430_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500430-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500430-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.haveCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500430-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500430-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500430-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.haveCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500430-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //구매정보-본 딜러에서 구매 대수
            if ($("#CRM7500431_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500431-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500431-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.dlrCdPureCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500431-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500431-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500431-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.dlrCdPureCarCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500431-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //구매정보-신차 출고일
            if ($("#CRM7500432_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500432-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500432-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.ncarRelease' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500432-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //구매정보-보험
            if($("#CRM7500433_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500433-01-01").is(":checked") == false && $("#CRM7500433-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='global.lbl.insurance' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //구매정보-금융
            if($("#CRM7500434_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500434-01-01").is(":checked") == false && $("#CRM7500434-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.fincRate' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //구매정보-보험 시작일
            if ($("#CRM7500435_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500435-01").val())){
                    dms.notification.warning("<spring:message code='ser.lbl.incStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500435-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500435-02").val())){
                    dms.notification.warning("<spring:message code='ser.lbl.incStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500435-02").focus();
                    return false;
                }
            }

            //연락정보-유효주소보유
            if($("#CRM7500533_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500533-01-01").is(":checked") == false && $("#CRM7500533-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.peridAddrHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //연락정보-대표전화보유
            if($("#CRM7500534_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500534-01-01").is(":checked") == false && $("#CRM7500534-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.repTelHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //연락정보-핸드폰전화보유
            if($("#CRM7500535_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500535-01-01").is(":checked") == false && $("#CRM7500535-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.hpTelHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //연락정보-WECHAT 보유
            if($("#CRM7500536_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500536-01-01").is(":checked") == false && $("#CRM7500536-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.wechatHave' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //연락정보-SMS 수신 거부 제외
            if($("#CRM7500537_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500537-01-01").is(":checked") == false && $("#CRM7500537-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.smsRejectRecvOff' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //연락정보-휴대전화 수신 거부 제외
            if($("#CRM7500538_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500538-01-01").is(":checked") == false && $("#CRM7500538-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.hpRejectRecvOff' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //연락정보-집전화 수신 거부 제외
            if($("#CRM7500539_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( $("#CRM7500539-01-01").is(":checked") == false && $("#CRM7500539-01-02").is(":checked") == false){
                    dms.notification.warning("<spring:message code='crm.lbl.homeTelRejectRecvOff' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            //개인거래이력-활동방법
            if($("#CRM7500640_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500640-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.activePlan' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500640-01").focus();
                    return false;
                }
            }

            //개인거래이력-활동 참가 일
            if($("#CRM7500641_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500641-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.activeEnterDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500641-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500641-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.activeEnterDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500641-02").focus();
                    return false;
                }
            }

            //개인거래이력-활동 참가 횟수
            if ($("#CRM7500642_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500642-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500642-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.activeEnterCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500642-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500642-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500642-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.activeEnterCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500642-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //개인거래이력-고객 케어 일
            if($("#CRM7500643_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500643-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custCareDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500643-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500643-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custCareDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500643-02").focus();
                    return false;
                }
            }

            //개인거래이력-고객 케어 횟수
            if ($("#CRM7500644_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500644-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500644-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.custCareCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500644-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500644-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500644-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.custCareCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500644-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //개인거래이력-설문 일
            if($("#CRM7500645_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500645-01").val())){
                    dms.notification.warning("<spring:message code='global.lbl.stsfIvstDtEx' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500645-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500645-02").val())){
                    dms.notification.warning("<spring:message code='global.lbl.stsfIvstDtEx' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500645-02").focus();
                    return false;
                }
            }

            //개인거래이력-설문 횟수
            if ($("#CRM7500646_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500646-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500646-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='global.lbl.stsfIvstCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500646-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500646-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500646-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='global.lbl.stsfIvstCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500646-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //개인거래이력-최근 3개월 접근 횟수
            if ($("#CRM7500647_fleg").val() == "Y"){
                // 화면 필수 체크
                if($("#CRM7500647-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500647-01").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lately3MonthAccessCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500647-01").data("kendoExtNumericTextBox").focus();
                    return false;
                }
                // 화면 필수 체크
                if($("#CRM7500647-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500647-02").data("kendoExtNumericTextBox").value() == 0){
                    dms.notification.warning("<spring:message code='crm.lbl.lately3MonthAccessCnt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500647-02").data("kendoExtNumericTextBox").focus();
                    return false;
                }
            }

            //캠페인 접촉정보-참여 캠페인
            if($("#CRM7500748_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500748-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.useCampaign' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500748-01").focus();
                    return false;
                }
            }

            //캠페인 접촉정보-참여일
            if($("#CRM7500749_fleg").val() == "Y"){
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500749-01").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.useDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500749-01").focus();
                    return false;
                }
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#CRM7500749-02").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.useDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#CRM7500749-02").focus();
                    return false;
                }
            }

            if($("#CRM7500101_fleg").val() == "N" && $("#CRM7500102_fleg").val() == "N" && $("#CRM7500103_fleg").val() == "N" && $("#CRM7500104_fleg").val() == "N" && $("#CRM7500105_fleg").val() == "N" &&
               $("#CRM7500106_fleg").val() == "N" && $("#CRM7500107_fleg").val() == "N" && $("#CRM7500108_fleg").val() == "N" && $("#CRM7500109_fleg").val() == "N" && $("#CRM7500110_fleg").val() == "N" &&
               $("#CRM7500111_fleg").val() == "N" && $("#CRM7500212_fleg").val() == "N" && $("#CRM7500213_fleg").val() == "N" && $("#CRM7500214_fleg").val() == "N" && $("#CRM7500215_fleg").val() == "N" &&
               $("#CRM7500216_fleg").val() == "N" && $("#CRM7500217_fleg").val() == "N" && $("#CRM7500318_fleg").val() == "N" && $("#CRM7500319_fleg").val() == "N" && $("#CRM7500320_fleg").val() == "N" &&
               $("#CRM7500321_fleg").val() == "N" && $("#CRM7500322_fleg").val() == "N" && $("#CRM7500323_fleg").val() == "N" && $("#CRM7500324_fleg").val() == "N" && $("#CRM7500325_fleg").val() == "N" &&
               $("#CRM7500425_fleg").val() == "N" &&
               $("#CRM7500426_fleg").val() == "N" && $("#CRM7500427_fleg").val() == "N" && $("#CRM7500428_fleg").val() == "N" && $("#CRM7500429_fleg").val() == "N" && $("#CRM7500430_fleg").val() == "N" &&
               $("#CRM7500431_fleg").val() == "N" && $("#CRM7500432_fleg").val() == "N" && $("#CRM7500533_fleg").val() == "N" && $("#CRM7500534_fleg").val() == "N" && $("#CRM7500535_fleg").val() == "N" &&
               $("#CRM7500536_fleg").val() == "N" && $("#CRM7500537_fleg").val() == "N" && $("#CRM7500538_fleg").val() == "N" && $("#CRM7500539_fleg").val() == "N" && $("#CRM7500640_fleg").val() == "N" &&
               $("#CRM7500641_fleg").val() == "N" && $("#CRM7500642_fleg").val() == "N" && $("#CRM7500643_fleg").val() == "N" && $("#CRM7500644_fleg").val() == "N" && $("#CRM7500645_fleg").val() == "N" &&
               $("#CRM7500646_fleg").val() == "N" && $("#CRM7500647_fleg").val() == "N" && $("#CRM7500748_fleg").val() == "N" && $("#CRM7500749_fleg").val() == "N" && $("#CRM7500150_fleg").val() == "N" &&
               $("#CRM7500112_fleg").val() == "N" && $("#CRM7500113_fleg").val() == "N" && $("#CRM7500433_fleg").val() == "N" && $("#CRM7500434_fleg").val() == "N" && $("#CRM7500435_fleg").val() == "N" ){
                dms.notification.warning("<spring:message code='crm.info.noExtrTerms'/>"); //대상자 추출조건을 하나 이상 등록해 주세요.
                return false;
            }

            //추출조건 마스터
            var formSaveData = $("#crmTargExtractMasterForm").serializeObject();

            if ($("#randomYn").prop("checked")){
                formSaveData.randomYn = "Y"
            }else{
                formSaveData.randomYn = "N"
            };

            //추출조건 상세
            var json = {};

            //태어난 해
            json["CRM7500101"] = $("#CRM7500101-01").val() != "" && $("#CRM7500101-01").val() != null ? $("#CRM7500101-01").val() + "|" + $("#CRM7500101-02").val():"";

            //성별
            json["CRM7500102"] = $("#CRM7500102-01-01").is(":checked") == true || $("#CRM7500102-01-02").is(":checked") == true ? $("#CRM7500102-01-01").is(":checked") == true ? "M":"F":"";

            //주소
            json["CRM7500103"] = $("#CRM7500103-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500103-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500103-01").data("kendoExtDropDownList").value() + "|" + $("#CRM7500103-02").data("kendoExtDropDownList").value():"";

            //생일
            json["CRM7500104"] = $("#CRM7500104-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500104-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500104-01").data("kendoExtDropDownList").value() + "|" + $("#CRM7500104-02").data("kendoExtDropDownList").value() + "|" + $("#CRM7500104-03").data("kendoExtDropDownList").value() + "|" + $("#CRM7500104-04").data("kendoExtDropDownList").value():"";

            //생일(몇일 전)
            json["CRM7500105"] = $("#CRM7500105-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500105-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500105-01").data("kendoExtNumericTextBox").value():"";

            //Blue Members
            json["CRM7500106"] = $("#CRM7500106-01-01").is(":checked") == true || $("#CRM7500106-01-02").is(":checked") == true ? $("#CRM7500106-01-01").is(":checked") == true ? "Y":"N":"";

            //Blue Members Point
            json["CRM7500107"] = $("#CRM7500107-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500107-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500107-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500107-02").data("kendoExtNumericTextBox").value():"";

            //딜러회원
            json["CRM7500108"] = $("#CRM7500108-01-01").is(":checked") == true || $("#CRM7500108-01-02").is(":checked") == true ? $("#CRM7500108-01-01").is(":checked") == true ? "Y":"N":"";

            //딜러회원 Point
            json["CRM7500109"] = $("#CRM7500109-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500109-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500109-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500109-02").data("kendoExtNumericTextBox").value():"";

            //고객출처
            json["CRM7500110"] = $("#CRM7500110-01").data("kendoMultiSelect").value() != "" && $("#CRM7500110-01").data("kendoMultiSelect").value() != null ?$("#CRM7500110-01").data("kendoMultiSelect").value():"";

            //고객 신규날짜
            json["CRM7500111"] = $("#CRM7500111-01").val() != "" && $("#CRM7500111-01").val() != null ? $("#CRM7500111-01").val() + "|" + $("#CRM7500111-02").val():"";

            //잠재/보유고객
            json["CRM7500150"] = $("#CRM7500150-01-01").is(":checked") == true || $("#CRM7500150-01-02").is(":checked") == true ? $("#CRM7500150-01-01").is(":checked") == true ? "01":"02":"";

            //회원등급
            json["CRM7500112"] = $("#CRM7500112-01").data("kendoMultiSelect").value() != "" && $("#CRM7500112-01").data("kendoMultiSelect").value() != null ?$("#CRM7500112-01").data("kendoMultiSelect").value():"";

            //BM 회원등급
            json["CRM7500113"] = $("#CRM7500113-01").data("kendoMultiSelect").value() != "" && $("#CRM7500113-01").data("kendoMultiSelect").value() != null ?$("#CRM7500113-01").data("kendoMultiSelect").value():"";

            //의향차종
            json["CRM7500212"] = $("#CRM7500212-01").data("kendoMultiSelect").value() != "" && $("#CRM7500212-01").data("kendoMultiSelect").value() != null ?$("#CRM7500212-01").data("kendoMultiSelect").value():"";

            //추적등급
            json["CRM7500213"] = $("#CRM7500213-01").data("kendoMultiSelect").value() != "" && $("#CRM7500213-01").data("kendoMultiSelect").value() != null ?$("#CRM7500213-01").data("kendoMultiSelect").value():"";

            //예상구매시기
            json["CRM7500214"] = $("#CRM7500214-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500214-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500214-01").data("kendoExtDropDownList").value():"";

            //신규날짜
            json["CRM7500215"] = $("#CRM7500215-01").val() != "" && $("#CRM7500215-01").val() != null ? $("#CRM7500215-01").val() + "|" + $("#CRM7500215-02").val():"";

            //6개원이내 구매확률
            json["CRM7500216"] = $("#CRM7500216-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500216-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500216-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500216-02").data("kendoExtNumericTextBox").value():"";

            //구매예상금액
            json["CRM7500217"] = $("#CRM7500217-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500217-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500217-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500217-02").data("kendoExtNumericTextBox").value():"";

            //정비 일자
            json["CRM7500318"] = $("#CRM7500318-01").val() != "" && $("#CRM7500318-01").val() != null ? $("#CRM7500318-01").val() + "|" + $("#CRM7500318-02").val():"";

            //정비 일자(후 일수)
            json["CRM7500319"] = $("#CRM7500319-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500319-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500319-01").data("kendoExtNumericTextBox").value():"";

            //주행 거리
            json["CRM7500320"] = $("#CRM7500320-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500320-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500320-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500320-02").data("kendoExtNumericTextBox").value():"";

            //정비 금액
            json["CRM7500321"] = $("#CRM7500321-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500321-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500321-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500321-02").data("kendoExtNumericTextBox").value():"";

            //정비 누적 금액
            json["CRM7500322"] = $("#CRM7500322-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500322-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500322-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500322-02").data("kendoExtNumericTextBox").value():"";

            //정비위탁유형
//             json["CRM7500323"] = $("#CRM7500323-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500323-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500323-01").data("kendoExtDropDownList").value():"";
            json["CRM7500323"] = $("#CRM7500323-01").data("kendoMultiSelect").value() != "" && $("#CRM7500323-01").data("kendoMultiSelect").value() != null ?$("#CRM7500323-01").data("kendoMultiSelect").value():"";

            //정비 횟수
            if ($("#CRM7500324_fleg").val() == "Y"){
                json["CRM7500324"] = $("#CRM7500324-01").data("kendoExtNumericTextBox").value() != null ? $("#CRM7500324-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500324-02").data("kendoExtNumericTextBox").value():"";
            }

            //수리유형
            json["CRM7500325"] = $("#CRM7500325-01").data("kendoMultiSelect").value() != "" && $("#CRM7500325-01").data("kendoMultiSelect").value() != null ?$("#CRM7500325-01").data("kendoMultiSelect").value():"";

            //구매경험
            json["CRM7500425"] = $("#CRM7500425-01-01").is(":checked") == true || $("#CRM7500425-01-02").is(":checked") == true || $("#CRM7500425-01-03").is(":checked") == true ? $("#CRM7500425-01-01").is(":checked") == true ? "FP":$("#CRM7500425-01-02").is(":checked") == true ? "RP":"TP":"";

            //최근구매차종
            json["CRM7500426"] = $("#CRM7500426-01").data("kendoMultiSelect").value() != "" && $("#CRM7500426-01").data("kendoMultiSelect").value() != null ?$("#CRM7500426-01").data("kendoMultiSelect").value():"";

            //최근 구매차 구매일
            json["CRM7500427"] = $("#CRM7500427-01").val() != "" && $("#CRM7500427-01").val() != null ? $("#CRM7500427-01").val() + "|" + $("#CRM7500427-02").val():"";

            //보유차종
            json["CRM7500428"] = $("#CRM7500428-01").data("kendoMultiSelect").value() != "" && $("#CRM7500428-01").data("kendoMultiSelect").value() != null ?$("#CRM7500428-01").data("kendoMultiSelect").value():"";

            //보유차 구매일
            json["CRM7500429"] = $("#CRM7500429-01").val() != "" && $("#CRM7500429-01").val() != null ? $("#CRM7500429-01").val() + "|" + $("#CRM7500429-02").val():"";

            //보유 대수
            json["CRM7500430"] = $("#CRM7500430-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500430-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500430-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500430-02").data("kendoExtNumericTextBox").value():"";

            //본 딜러에서 구매 대수
            json["CRM7500431"] = $("#CRM7500431-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500431-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500431-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500431-02").data("kendoExtNumericTextBox").value():"";

            //신차 출고일
            json["CRM7500432"] = $("#CRM7500432-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500432-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500432-01").data("kendoExtNumericTextBox").value():"";

            //보험
            json["CRM7500433"] = $("#CRM7500433-01-01").is(":checked") == true || $("#CRM7500433-01-02").is(":checked") == true ? $("#CRM7500433-01-01").is(":checked") == true ? "Y":"N":"";

            //금융
            json["CRM7500434"] = $("#CRM7500434-01-01").is(":checked") == true || $("#CRM7500434-01-02").is(":checked") == true ? $("#CRM7500434-01-01").is(":checked") == true ? "Y":"N":"";

            //보험 시작일
            json["CRM7500435"] = $("#CRM7500435-01").val() != "" && $("#CRM7500435-01").val() != null ? $("#CRM7500435-01").val() + "|" + $("#CRM7500435-02").val():"";

            //유효주소보유
            json["CRM7500533"] = $("#CRM7500533-01-01").is(":checked") == true || $("#CRM7500533-01-02").is(":checked") == true ? $("#CRM7500533-01-01").is(":checked") == true ? "Y":"N":"";

            //대표전화보유
            json["CRM7500534"] = $("#CRM7500534-01-01").is(":checked") == true || $("#CRM7500534-01-02").is(":checked") == true ? $("#CRM7500534-01-01").is(":checked") == true ? "Y":"N":"";

            //핸드폰전화보유
            json["CRM7500535"] = $("#CRM7500535-01-01").is(":checked") == true || $("#CRM7500535-01-02").is(":checked") == true ? $("#CRM7500535-01-01").is(":checked") == true ? "Y":"N":"";

            //WECHAT 보유
            json["CRM7500536"] = $("#CRM7500536-01-01").is(":checked") == true || $("#CRM7500536-01-02").is(":checked") == true ? $("#CRM7500536-01-01").is(":checked") == true ? "Y":"N":"";

            //SMS 수신 거부 제외
            json["CRM7500537"] = $("#CRM7500537-01-01").is(":checked") == true || $("#CRM7500537-01-02").is(":checked") == true ? $("#CRM7500537-01-01").is(":checked") == true ? "Y":"N":"";

            //휴대전화 수신 거부 제외
            json["CRM7500538"] = $("#CRM7500538-01-01").is(":checked") == true || $("#CRM7500538-01-02").is(":checked") == true ? $("#CRM7500538-01-01").is(":checked") == true ? "Y":"N":"";

            //집전화 수신 거부 제외
            json["CRM7500539"] = $("#CRM7500539-01-01").is(":checked") == true || $("#CRM7500539-01-02").is(":checked") == true ? $("#CRM7500539-01-01").is(":checked") == true ? "Y":"N":"";

            //활동방법
            json["CRM7500640"] = $("#CRM7500640-01").data("kendoMultiSelect").value() != "" && $("#CRM7500640-01").data("kendoMultiSelect").value() != null ?$("#CRM7500640-01").data("kendoMultiSelect").value():"";

            //활동 참가 일
            json["CRM7500641"] = $("#CRM7500641-01").val() != "" && $("#CRM7500641-01").val() != null ? $("#CRM7500641-01").val() + "|" + $("#CRM7500641-02").val():"";

            //활동 참가 횟수
            json["CRM7500642"] = $("#CRM7500642-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500642-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500642-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500642-02").data("kendoExtNumericTextBox").value():"";

            //고객 케어 일
            json["CRM7500643"] = $("#CRM7500643-01").val() != "" && $("#CRM7500643-01").val() != null ? $("#CRM7500643-01").val() + "|" + $("#CRM7500643-02").val():"";

            //고객 케어 횟수
            json["CRM7500644"] = $("#CRM7500644-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500644-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500644-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500644-02").data("kendoExtNumericTextBox").value():"";

            //설문 일
            json["CRM7500645"] = $("#CRM7500645-01").val() != "" && $("#CRM7500645-01").val() != null ? $("#CRM7500645-01").val() + "|" + $("#CRM7500645-02").val():"";

            //설문 횟수
            json["CRM7500646"] = $("#CRM7500646-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500646-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500646-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500646-02").data("kendoExtNumericTextBox").value():"";

            //최근 3개월 접근 횟수
            json["CRM7500647"] = $("#CRM7500647-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500647-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500647-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500647-02").data("kendoExtNumericTextBox").value():"";

            //참여 캠페인
//             json["CRM7500748"] = $("#CRM7500748-01").data("kendoExtDropDownList").value() != "" && $("#CRM7500748-01").data("kendoExtDropDownList").value() != null ? $("#CRM7500748-01").data("kendoExtDropDownList").value():"";
            json["CRM7500748"] = $("#CRM7500748-01").data("kendoMultiSelect").value() != "" && $("#CRM7500748-01").data("kendoMultiSelect").value() != null ?$("#CRM7500748-01").data("kendoMultiSelect").value():"";

            //참여일
            json["CRM7500749"] = $("#CRM7500749-01").val() != "" && $("#CRM7500749-01").val() != null ? $("#CRM7500749-01").val() + "|" + $("#CRM7500749-02").val():"";

            var params = [];
            var idx = 0;

            $.each(json, function(key, value){

                if(value != ""){
                    obj = {};
                    obj["dlrCd"] = $("dlrCd").val();
                    obj["custExtrTermNo"] = $("custExtrTermNo").val();
                    obj["detlExtrTermCd"] = key;

                    if (value.constructor === Array) {
                        obj["termVal1"] = value.join(",");
                    } else {
                        obj["termVal1"] = value;
                    }

                    params.push(obj);

                    idx++;
                }
            });

            var paramsEx =  $.extend(
                {"extractList":formSaveData}
                ,{"extractSaveList":params}
            );

            console.log("paramsEx!!!!!!");
            console.log(paramsEx);

            // 추출조건을 저장하고 추출을 진행 하시겠습니까?
            dms.window.confirm({
                message:"<spring:message code='crm.info.extrSaveExtractingConfirm'/>"
                ,callback:function(result){
                    if(result){

                        $.ajax({
                            url:"<c:url value='/crm/cmm/crmTargExtract/selectTargetExtractSaveExcel.do' />"
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                            ,data:JSON.stringify(paramsEx)
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(data) {

                                //console.log("data : ",data)
                                $("#custExtrTermNo").val(data.custExtrTermNo);

                                //01, 02
                                if("01" == data.result){
                                    dms.notification.info("<spring:message code='crm.info.extrNoData'/>");
                                }else if("02" == data.result){
                                    dms.notification.info("<spring:message code='crm.info.extrNoCustData'/>");
                                }else{

                                    // 대상자 미리보기 팝업을 연다.
                                    targExtractDetailPopupWin = dms.window.popup({
                                        windowId:"targExtractDetailPopupWin"
                                        ,title:"<spring:message code='crm.title.rcpeList'/>"   // 대상자 목록
                                        ,height:540
                                        ,content:{
                                            url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailPopup.do'/>"
                                            , data:{
                                                "autoBind" : false
                                                ,"type" : null
                                                ,"sSeq" : data.seq
                                                ,"sDlrCd" : $("#dlrCd").val()
                                                ,"callbackFunc" : function(data){

                                                }
                                            }
                                        }
                                    })

                                }
                            }
                            ,beforeSend:function(xhr){
                                dms.loading.show();
                                dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                            }
                            ,complete:function(xhr,status){
                                dms.loading.hide();
                            }
                        });

                    }else{
                        //취소버튼 클릭 로직
                        return;
                    }
                }
            });
            // 추출조건을 저장하고 엑셀Export confirm

        }
    });

    //[태어난 해] 조건 입력부 비활성화
    $("#CRM7500101_del").kendoButton({
        click:function(e){
            $("#CRM7500101_fleg").val("N");
            $("#CRM7500101-01").val("");
            $("#CRM7500101-02").val("");
            $("#CRM7500101").hide();
        }
    });

    //[성별] 조건 입력부 비활성화
    $("#CRM7500102_del").kendoButton({
        click:function(e){
            $("#CRM7500102_fleg").val("N");
            $("#CRM7500102-01-01").prop("checked", false);
            $("#CRM7500102-01-02").prop("checked", false);
            $("#CRM7500102").hide();
        }
    });

    //[주소] 조건 입력부 비활성화
    $("#CRM7500103_del").kendoButton({
        click:function(e){
            $("#CRM7500103_fleg").val("N");
            $("#CRM7500103-01").data("kendoExtDropDownList").select(0);
            $("#CRM7500103-02").data("kendoExtDropDownList").setDataSource([]);
            $("#CRM7500103-02").data("kendoExtDropDownList").enable(false);
            $("#CRM7500103").hide();
        }
    });

    //[생일] 조건 입력부 비활성화
    $("#CRM7500104_del").kendoButton({
        click:function(e){
            $("#CRM7500104_fleg").val("N");
            $("#CRM7500104-01").data("kendoExtDropDownList").select(0);
            $("#CRM7500104-02").data("kendoExtDropDownList").select(0);
            $("#CRM7500104-03").data("kendoExtDropDownList").select(0);
            $("#CRM7500104-04").data("kendoExtDropDownList").select(0);
            $("#CRM7500104").hide();
        }
    });

    //[생일(몇일 전)] 조건 입력부 비활성화
    $("#CRM7500105_del").kendoButton({
        click:function(e){
            $("#CRM7500105_fleg").val("N");
            $("#CRM7500105-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500105").hide();
        }
    });

    //[Blue Members] 조건 입력부 비활성화
    $("#CRM7500106_del").kendoButton({
        click:function(e){
            $("#CRM7500106_fleg").val("N");
            $("#CRM7500106-01-01").prop("checked", false);
            $("#CRM7500106-01-02").prop("checked", false);
            $("#CRM7500106").hide();
        }
    });

    //[Blue Members Point] 조건 입력부 비활성화
    $("#CRM7500107_del").kendoButton({
        click:function(e){
            $("#CRM7500107_fleg").val("N");
            $("#CRM7500107-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500107-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500107").hide();
        }
    });

    //[딜러회원] 조건 입력부 비활성화
    $("#CRM7500108_del").kendoButton({
        click:function(e){
            $("#CRM7500108_fleg").val("N");
            $("#CRM7500108-01-01").prop("checked", false);
            $("#CRM7500108-01-02").prop("checked", false);
            $("#CRM7500108").hide();
        }
    });

    //[딜러회원 Point] 조건 입력부 비활성화
    $("#CRM7500109_del").kendoButton({
        click:function(e){
            $("#CRM7500109_fleg").val("N");
            $("#CRM7500109-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500109-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500109").hide();
        }
    });

    //[고객 출처] 조건 입력부 비활성화
    $("#CRM7500110_del").kendoButton({
        click:function(e){
            $("#CRM7500110_fleg").val("N");
            $("#CRM7500110-01").data("kendoMultiSelect").value("");
            $("#CRM7500110").hide();
        }
    });

    //[고객 신규날짜] 조건 입력부 비활성화
    $("#CRM7500111_del").kendoButton({
        click:function(e){
            $("#CRM7500111_fleg").val("N");
            $("#CRM7500111-01").val("");
            $("#CRM7500111-02").val("");
            $("#CRM7500111").hide();
        }
    });

    //[잠재/보유고객] 조건 입력부 비활성화
    $("#CRM7500150_del").kendoButton({
        click:function(e){
            $("#CRM7500150_fleg").val("N");
            $("#CRM7500150-01-01").prop("checked", false);
            $("#CRM7500150-01-02").prop("checked", false);
            $("#CRM7500150").hide();
        }
    });

    //[회원등급] 조건 입력부 비활성화
    $("#CRM7500112_del").kendoButton({
        click:function(e){
            $("#CRM7500112_fleg").val("N");
            $("#CRM7500112-01").data("kendoMultiSelect").value("");
            $("#CRM7500112").hide();
        }
    });

    //[BM 회원등급] 조건 입력부 비활성화
    $("#CRM7500113_del").kendoButton({
        click:function(e){
            $("#CRM7500113_fleg").val("N");
            $("#CRM7500113-01").data("kendoMultiSelect").value("");
            $("#CRM7500113").hide();
        }
    });

    //[의향차종] 조건 입력부 비활성화
    $("#CRM7500212_del").kendoButton({
        click:function(e){
            $("#CRM7500212_fleg").val("N");
            $("#CRM7500212-01").data("kendoMultiSelect").value("");
            $("#CRM7500212").hide();
        }
    });

    //[추적등급] 조건 입력부 비활성화
    $("#CRM7500213_del").kendoButton({
        click:function(e){
            $("#CRM7500213_fleg").val("N");
            $("#CRM7500213-01").data("kendoMultiSelect").value("");
            $("#CRM7500213").hide();
        }
    });

    //[예상구매시기] 조건 입력부 비활성화
    $("#CRM7500214_del").kendoButton({
        click:function(e){
            $("#CRM7500214_fleg").val("N");
            $("#CRM7500214-01").data("kendoExtDropDownList").select(0);
            $("#CRM7500214").hide();
        }
    });

    //[신규날짜] 조건 입력부 비활성화
    $("#CRM7500215_del").kendoButton({
        click:function(e){
            $("#CRM7500215_fleg").val("N");
            $("#CRM7500215-01").val("");
            $("#CRM7500215-02").val("");
            $("#CRM7500215").hide();
        }
    });

    //[6개월이내 구매확률] 조건 입력부 비활성화
    $("#CRM7500216_del").kendoButton({
        click:function(e){
            $("#CRM7500216_fleg").val("N");
            $("#CRM7500216-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500216-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500216").hide();
        }
    });

    //[구매예상금액] 조건 입력부 비활성화
    $("#CRM7500217_del").kendoButton({
        click:function(e){
            $("#CRM7500217_fleg").val("N");
            $("#CRM7500217-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500217-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500217").hide();
        }
    });

    //[정비 일자] 조건 입력부 비활성화
    $("#CRM7500318_del").kendoButton({
        click:function(e){
            $("#CRM7500318_fleg").val("N");
            $("#CRM7500318-01").val("");
            $("#CRM7500318-02").val("");
            $("#CRM7500318").hide();
        }
    });

    //[정비 일자(후 일수)] 조건 입력부 비활성화
    $("#CRM7500319_del").kendoButton({
        click:function(e){
            $("#CRM7500319_fleg").val("N");
            $("#CRM7500319-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500319").hide();
        }
    });

    //[주행 거리] 조건 입력부 비활성화
    $("#CRM7500320_del").kendoButton({
        click:function(e){
            $("#CRM7500320_fleg").val("N");
            $("#CRM7500320-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500320-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500320").hide();
        }
    });

    //[정비 금액] 조건 입력부 비활성화
    $("#CRM7500321_del").kendoButton({
        click:function(e){
            $("#CRM7500321_fleg").val("N");
            $("#CRM7500321-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500321-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500321").hide();
        }
    });

    //[정비 누적 금액] 조건 입력부 비활성화
    $("#CRM7500322_del").kendoButton({
        click:function(e){
            $("#CRM7500322_fleg").val("N");
            $("#CRM7500322-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500322-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500322").hide();
        }
    });

    //[정비위탁유형] 조건 입력부 비활성화
//     $("#CRM7500323_del").kendoButton({
//         click:function(e){
//             $("#CRM7500323_fleg").val("N");
//             $("#CRM7500323-01").data("kendoExtDropDownList").select(0);
//             $("#CRM7500323").hide();
//         }
//     });
    //[정비위탁유형] 조건 입력부 비활성화
    $("#CRM7500323_del").kendoButton({
        click:function(e){
            $("#CRM7500323_fleg").val("N");
            $("#CRM7500323-01").data("kendoMultiSelect").value("");
            $("#CRM7500323").hide();
        }
    });

    //[정비 횟수] 조건 입력부 비활성화
    $("#CRM7500324_del").kendoButton({
        click:function(e){
            $("#CRM7500324_fleg").val("N");
            $("#CRM7500324-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500324-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500324").hide();
        }
    });

    //[수리유형] 조건 입력부 비활성화
    $("#CRM7500325_del").kendoButton({
        click:function(e){
            $("#CRM7500325_fleg").val("N");
            $("#CRM7500325-01").data("kendoMultiSelect").value("");
            $("#CRM7500325").hide();
        }
    });

    //[구매경험] 조건 입력부 비활성화
    $("#CRM7500425_del").kendoButton({
        click:function(e){
            $("#CRM7500425_fleg").val("N");
            $("#CRM7500425-01-01").prop("checked", false);
            $("#CRM7500425-01-02").prop("checked", false);
            $("#CRM7500425-01-03").prop("checked", false);
            $("#CRM7500425").hide();
        }
    });

    //[최근구매차종] 조건 입력부 비활성화
    $("#CRM7500426_del").kendoButton({
        click:function(e){
            $("#CRM7500426_fleg").val("N");
            $("#CRM7500426-01").data("kendoMultiSelect").value("");
            $("#CRM7500426").hide();
        }
    });

    //[최근 구매차 구매일] 조건 입력부 비활성화
    $("#CRM7500427_del").kendoButton({
        click:function(e){
            $("#CRM7500427_fleg").val("N");
            $("#CRM7500427-01").val("");
            $("#CRM7500427-02").val("");
            $("#CRM7500427").hide();
        }
    });

    //[보유차종] 조건 입력부 비활성화
    $("#CRM7500428_del").kendoButton({
        click:function(e){
            $("#CRM7500428_fleg").val("N");
            $("#CRM7500428-01").data("kendoMultiSelect").value("");
            $("#CRM7500428").hide();
        }
    });

    //[보유차 구매일] 조건 입력부 비활성화
    $("#CRM7500429_del").kendoButton({
        click:function(e){
            $("#CRM7500429_fleg").val("N");
            $("#CRM7500429-01").val("");
            $("#CRM7500429-02").val("");
            $("#CRM7500429").hide();
        }
    });

    //[보유 대수] 조건 입력부 비활성화
    $("#CRM7500430_del").kendoButton({
        click:function(e){
            $("#CRM7500430_fleg").val("N");
            $("#CRM7500430-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500430-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500430").hide();
        }
    });

    //[본 딜러에서 구매 대수] 조건 입력부 비활성화
    $("#CRM7500431_del").kendoButton({
        click:function(e){
            $("#CRM7500431_fleg").val("N");
            $("#CRM7500431-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500431-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500431").hide();
        }
    });

    //[신차 출고일] 조건 입력부 비활성화
    $("#CRM7500432_del").kendoButton({
        click:function(e){
            $("#CRM7500432_fleg").val("N");
            $("#CRM7500432-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500432").hide();
        }
    });

    //[보험] 조건 입력부 비활성화
    $("#CRM7500433_del").kendoButton({
        click:function(e){
            $("#CRM7500433_fleg").val("N");
            $("#CRM7500433-01-01").prop("checked", false);
            $("#CRM7500433-01-02").prop("checked", false);
            $("#CRM7500433").hide();
        }
    });

    //[금융] 조건 입력부 비활성화
    $("#CRM7500434_del").kendoButton({
        click:function(e){
            $("#CRM7500434_fleg").val("N");
            $("#CRM7500434-01-01").prop("checked", false);
            $("#CRM7500434-01-02").prop("checked", false);
            $("#CRM7500434").hide();
        }
    });

    //[보험 시작일] 조건 입력부 비활성화
    $("#CRM7500435_del").kendoButton({
        click:function(e){
            $("#CRM7500435_fleg").val("N");
            $("#CRM7500435-01").val("");
            $("#CRM7500435-02").val("");
            $("#CRM7500435").hide();
        }
    });

    //[유효주소보유] 조건 입력부 비활성화
    $("#CRM7500533_del").kendoButton({
        click:function(e){
            $("#CRM7500533_fleg").val("N");
            $("#CRM7500533-01-01").prop("checked", false);
            $("#CRM7500533-01-02").prop("checked", false);
            $("#CRM7500533").hide();
        }
    });

    //[대표전화보유] 조건 입력부 비활성화
    $("#CRM7500534_del").kendoButton({
        click:function(e){
            $("#CRM7500534_fleg").val("N");
            $("#CRM7500534-01-01").prop("checked", false);
            $("#CRM7500534-01-02").prop("checked", false);
            $("#CRM7500534").hide();
        }
    });

    //[핸드폰전화보유] 조건 입력부 비활성화
    $("#CRM7500535_del").kendoButton({
        click:function(e){
            $("#CRM7500535_fleg").val("N");
            $("#CRM7500535-01-01").prop("checked", false);
            $("#CRM7500535-01-02").prop("checked", false);
            $("#CRM7500535").hide();
        }
    });

    //[WECHAT 보유] 조건 입력부 비활성화
    $("#CRM7500536_del").kendoButton({
        click:function(e){
            $("#CRM7500536_fleg").val("N");
            $("#CRM7500536-01-01").prop("checked", false);
            $("#CRM7500536-01-02").prop("checked", false);
            $("#CRM7500536").hide();
        }
    });

    //[SMS 수신 거부 제외] 조건 입력부 비활성화
    $("#CRM7500537_del").kendoButton({
        click:function(e){
            $("#CRM7500537_fleg").val("N");
            $("#CRM7500537-01-01").prop("checked", false);
            $("#CRM7500537-01-02").prop("checked", false);
            $("#CRM7500537").hide();
        }
    });

    //[휴대전화 수신 거부 제외] 조건 입력부 비활성화
    $("#CRM7500538_del").kendoButton({
        click:function(e){
            $("#CRM7500538_fleg").val("N");
            $("#CRM7500538-01-01").prop("checked", false);
            $("#CRM7500538-01-02").prop("checked", false);
            $("#CRM7500538").hide();
        }
    });

    //[집전화 수신 거부 제외] 조건 입력부 비활성화
    $("#CRM7500539_del").kendoButton({
        click:function(e){
            $("#CRM7500539_fleg").val("N");
            $("#CRM7500539-01-01").prop("checked", false);
            $("#CRM7500539-01-02").prop("checked", false);
            $("#CRM7500539").hide();
        }
    });

    //[활동방법] 조건 입력부 비활성화
    $("#CRM7500640_del").kendoButton({
        click:function(e){
            $("#CRM7500640_fleg").val("N");
            $("#CRM7500640-01").data("kendoMultiSelect").value("");
            $("#CRM7500640").hide();
        }
    });

    //[활동 참가 일] 조건 입력부 비활성화
    $("#CRM7500641_del").kendoButton({
        click:function(e){
            $("#CRM7500641_fleg").val("N");
            $("#CRM7500641-01").val("");
            $("#CRM7500641-02").val("");
            $("#CRM7500641").hide();
        }
    });

    //[활동 참가 횟수] 조건 입력부 비활성화
    $("#CRM7500642_del").kendoButton({
        click:function(e){
            $("#CRM7500642_fleg").val("N");
            $("#CRM7500642-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500642-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500642").hide();
        }
    });

    //[고객 케어 일] 조건 입력부 비활성화
    $("#CRM7500643_del").kendoButton({
        click:function(e){
            $("#CRM7500643_fleg").val("N");
            $("#CRM7500643-01").val("");
            $("#CRM7500643-02").val("");
            $("#CRM7500643").hide();
        }
    });

    //[고객 케어 횟수] 조건 입력부 비활성화
    $("#CRM7500644_del").kendoButton({
        click:function(e){
            $("#CRM7500644_fleg").val("N");
            $("#CRM7500644-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500644-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500644").hide();
        }
    });

    //[설문 일] 조건 입력부 비활성화
    $("#CRM7500645_del").kendoButton({
        click:function(e){
            $("#CRM7500645_fleg").val("N");
            $("#CRM7500645-01").val("");
            $("#CRM7500645-02").val("");
            $("#CRM7500645").hide();
        }
    });

    //[설문 횟수] 조건 입력부 비활성화
    $("#CRM7500646_del").kendoButton({
        click:function(e){
            $("#CRM7500646_fleg").val("N");
            $("#CRM7500646-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500646-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500646").hide();
        }
    });

    //[최근 3개월 접근 횟수] 조건 입력부 비활성화
    $("#CRM7500647_del").kendoButton({
        click:function(e){
            $("#CRM7500647_fleg").val("N");
            $("#CRM7500647-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500647-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500647").hide();
        }
    });

    //[참여 캠페인] 조건 입력부 비활성화
//     $("#CRM7500748_del").kendoButton({
//         click:function(e){
//             $("#CRM7500748_fleg").val("N");
//             $("#CRM7500748-01").data("kendoExtDropDownList").select(0);
//             $("#CRM7500748").hide();
//         }
//     });

  //[참여 캠페인] 조건 입력부 비활성화
    $("#CRM7500748_del").kendoButton({
        click:function(e){
            $("#CRM7500748_fleg").val("N");
            $("#CRM7500748-01").data("kendoMultiSelect").value("");
            $("#CRM7500748").hide();
        }
    });

    //[참여일] 조건 입력부 비활성화
    $("#CRM7500749_del").kendoButton({
        click:function(e){
            $("#CRM7500749_fleg").val("N");
            $("#CRM7500749-01").val("");
            $("#CRM7500749-02").val("");
            $("#CRM7500749").hide();
        }
    });

    /**********************************************************
        기본값 설정
    ***********************************************************/

    //딜러코드
    $("#dlrCd").val(targExtractKeyMap["dlrCd"] == "" || targExtractKeyMap["dlrCd"] == null ? "${dlrCd}":targExtractKeyMap["dlrCd"]);

    //고객추출조건번호
    $("#custExtrTermNo").val(targExtractKeyMap["custExtrTermNo"]);

    //고객추출조건명
    $("#custExtrTermNm").val(targExtractKeyMap["custExtrTermNm"]);

    // 랜덤추출여부
    if(targExtractKeyMap["randomYn"] == "Y"){
        $("#randomYn").prop("checked", true);
    }else{
        $("#randomYn").prop("checked", false);
    }

    // 랜덤추출 갯수
    $("#randomCnt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 랜덤추출 갯수
    $("#randomCnt").data("kendoExtNumericTextBox").value(targExtractKeyMap["randomCnt"]);

    // 랜덤추출여부 체크여부에 따른 이벤트
    f_randomYn();


    //태어난 해 FROM
    $("#CRM7500101-01").kendoExtMaskedDatePicker({
        value:""
        ,start:"decade"
        ,depth:"decade"
        ,format:"yyyy"
        ,parseFormats:["yyyy"]
    });

    $("#CRM7500101-01").kendoMaskedTextBox({
        mask:"####"
    });

    //태어난 해 TO
    $("#CRM7500101-02").kendoExtMaskedDatePicker({
        value:""
        ,start:"decade"
        ,depth:"decade"
        ,format:"yyyy"
        ,parseFormats:["yyyy"]
    });

    $("#CRM7500101-02").kendoMaskedTextBox({
        mask:"####"
    });

    $("#CRM7500101-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500101-01"]);
    $("#CRM7500101-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500101-02"]);


    //성별
    if(targExtractValMap["CRM7500102-01"] != "" && targExtractValMap["CRM7500102-01"] != null){
        if(targExtractValMap["CRM7500102-01"] == "M"){
            $("#CRM7500102-01-01").prop("checked", true);
        }else{
            $("#CRM7500102-01-02").prop("checked", true);
        }
    }


    //도시코드
    $("#CRM7500103-01").kendoExtDropDownList({
        dataTextField:"cityNm"
        , dataValueField:"cityCd"
        , optionLabel:" "  // 전체
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:dms.data.cmmCdFilter(cityList)
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            onSelectCityCdSet(dataItem.cityCd);
        }
    });

    $("#CRM7500103-01").data("kendoExtDropDownList").value(targExtractValMap["CRM7500103-01"]);


    //지역코드
    $("#CRM7500103-02").kendoExtDropDownList({
        dataTextField:"distNm"
        , dataValueField:"distCd"
        , optionLabel:" "  // 전체
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    $("#CRM7500103-02").data("kendoExtDropDownList").enable(true);
    onSelectCityCdSet(targExtractValMap["CRM7500103-01"]);

    $("#CRM7500103-02").data("kendoExtDropDownList").value(targExtractValMap["CRM7500103-02"]);


    // 생일 월 FROM.
    $("#CRM7500104-01").kendoExtDropDownList({
        dataSource:['','01','02','03','04','05','06','07','08','09','10','11','12']
        ,autoBind:false
        ,index:0
    });

    // 생일 일 FROM.
    $("#CRM7500104-02").kendoExtDropDownList({
        dataSource:['','01','02','03','04','05','06','07','08','09','10',
                         '11','12','13','14','15','16','17','18','19','20',
                         '21','22','23','24','25','26','27','28','29','30','31']
        ,autoBind:false
        ,index:0
    });

    // 생일 월 TO.
    $("#CRM7500104-03").kendoExtDropDownList({
        dataSource:['','01','02','03','04','05','06','07','08','09','10','11','12']
        ,autoBind:false
        ,index:0
    });

    // 생일 일 TO.
    $("#CRM7500104-04").kendoExtDropDownList({
        dataSource:['','01','02','03','04','05','06','07','08','09','10',
                         '11','12','13','14','15','16','17','18','19','20',
                         '21','22','23','24','25','26','27','28','29','30','31']
        ,autoBind:false
        ,index:0
    });

    $("#CRM7500104-01").data("kendoExtDropDownList").value(targExtractValMap["CRM7500104-01"]);
    $("#CRM7500104-02").data("kendoExtDropDownList").value(targExtractValMap["CRM7500104-02"]);
    $("#CRM7500104-03").data("kendoExtDropDownList").value(targExtractValMap["CRM7500104-03"]);
    $("#CRM7500104-04").data("kendoExtDropDownList").value(targExtractValMap["CRM7500104-04"]);


    // 생일(몇일 전)
    $("#CRM7500105-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500105-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500105-01"]);


    //Blue Members
    if(targExtractValMap["CRM7500106-01"] != "" && targExtractValMap["CRM7500106-01"] != null){
        if(targExtractValMap["CRM7500106-01"] == "Y"){
            $("#CRM7500106-01-01").prop("checked", true);
        }else{
            $("#CRM7500106-01-02").prop("checked", true);
        }
    }


    // Blue Members Point (from)
    $("#CRM7500107-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // Blue Members Point (to)
    $("#CRM7500107-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500107-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500107-01"]);
    $("#CRM7500107-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500107-02"]);


    //딜러회원
    if(targExtractValMap["CRM7500108-01"] != "" && targExtractValMap["CRM7500108-01"] != null){
        if(targExtractValMap["CRM7500108-01"] == "Y"){
            $("#CRM7500108-01-01").prop("checked", true);
        }else{
            $("#CRM7500108-01-02").prop("checked", true);
        }
    }


    // 딜러회원 Point (from)
    $("#CRM7500109-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 딜러회원 Point (to)
    $("#CRM7500109-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500109-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500109-01"]);
    $("#CRM7500109-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500109-02"]);


    //고객출처
    $("#CRM7500110-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(custHoldTps),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500110-01"] != "" && targExtractValMap["CRM7500110-01"] != null){
        $("#CRM7500110-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500110-01"].split(","));
    }


    // 고객 신규날짜 FROM
    $("#CRM7500111-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 고객 신규날짜 TO
    $("#CRM7500111-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500111-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500111-01"]);
    $("#CRM7500111-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500111-02"]);


    //잠재/보유고객
    if(targExtractValMap["CRM7500150-01"] != "" && targExtractValMap["CRM7500150-01"] != null){
        if(targExtractValMap["CRM7500150-01"] == "01"){
            $("#CRM7500150-01-01").prop("checked", true);
        }else{
            $("#CRM7500150-01-02").prop("checked", true);
        }
    }

    //회원등급
    $("#CRM7500112-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(dlrMbrGradeList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"gradeNm",
        dataValueField:"gradeSeq"
    });

    if(targExtractValMap["CRM7500112-01"] != "" && targExtractValMap["CRM7500112-01"] != null){
        $("#CRM7500112-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500112-01"].split(","));
    }

    //BM 회원등급
    $("#CRM7500113-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(bmMbrGradeList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500113-01"] != "" && targExtractValMap["CRM7500113-01"] != null){
        $("#CRM7500113-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500113-01"].split(","));
    }

    //의향차종 의향차종
    $("#CRM7500212-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(carlineList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"carlineNm",
        dataValueField:"carlineCd"
    });

    if(targExtractValMap["CRM7500212-01"] != "" && targExtractValMap["CRM7500212-01"] != null){
        $("#CRM7500212-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500212-01"].split(","));
    }


    //추적등급  추적등급
    $("#CRM7500213-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(intentionClass),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500213-01"] != "" && targExtractValMap["CRM7500213-01"] != null){
        $("#CRM7500213-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500213-01"].split(","));
    }


    // 예상구매시기
    $("#CRM7500214-01").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:dms.data.cmmCdFilter(expcPurcHmCdList)
    });

    $("#CRM7500214-01").data("kendoExtDropDownList").value(targExtractValMap["CRM7500214-01"]);


    // 신규날짜 FROM
    $("#CRM7500215-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 신규날짜 TO
    $("#CRM7500215-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500215-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500215-01"]);
    $("#CRM7500215-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500215-02"]);


    // 6개월이내 구매확률 (from)
    $("#CRM7500216-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 6개월이내 구매확률 (to)
    $("#CRM7500216-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500216-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500216-01"]);
    $("#CRM7500216-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500216-02"]);


    // 구매예상금액 (from)
    $("#CRM7500217-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 구매예상금액 (to)
    $("#CRM7500217-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500217-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500217-01"]);
    $("#CRM7500217-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500217-02"]);


    // 정비 일자 FROM
    $("#CRM7500318-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 정비 일자 TO
    $("#CRM7500318-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500318-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500318-01"]);
    $("#CRM7500318-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500318-02"]);


    // 정비 일자(후 일수)
    $("#CRM7500319-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500319-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500319-01"]);


    // 주행 거리 (from)
    $("#CRM7500320-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 주행 거리 (to)
    $("#CRM7500320-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500320-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500320-01"]);
    $("#CRM7500320-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500320-02"]);


    // 정비 금액 (from)
    $("#CRM7500321-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 정비 금액 (to)
    $("#CRM7500321-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500321-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500321-01"]);
    $("#CRM7500321-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500321-02"]);


    // 정비 누적 금액 (from)
    $("#CRM7500322-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 정비 누적 금액 (to)
    $("#CRM7500322-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500322-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500322-01"]);
    $("#CRM7500322-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500322-02"]);


    // 정비 유형
//     $("#CRM7500323-01").kendoExtDropDownList({
//         dataTextField:"cmmCdNm"
//         , dataValueField:"cmmCd"
//         , optionLabel:" "  // 전체
//         , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
//         , dataSource:lbrTps
//     });
//     $("#CRM7500323-01").data("kendoExtDropDownList").value(targExtractValMap["CRM7500323-01"]);

    $("#CRM7500323-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(lbrTps),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500323-01"] != "" && targExtractValMap["CRM7500323-01"] != null){
        $("#CRM7500323-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500323-01"].split(","));
    }


    // 정비 횟수 (from)
    $("#CRM7500324-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       //,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 정비 횟수 (to)
    $("#CRM7500324-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500324-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500324-01"]);
    $("#CRM7500324-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500324-02"]);

    $("#CRM7500325-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(rePairTps),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500325-01"] != "" && targExtractValMap["CRM7500325-01"] != null){
        $("#CRM7500325-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500325-01"].split(","));
    }

    //구매경험
    if(targExtractValMap["CRM7500425-01"] != "" && targExtractValMap["CRM7500425-01"] != null){
        if(targExtractValMap["CRM7500425-01"] == "FP"){
            $("#CRM7500425-01-01").prop("checked", true);
        }else if(targExtractValMap["CRM7500425-01"] == "RP"){
            $("#CRM7500102-01-02").prop("checked", true);
        }else{
            $("#CRM7500102-01-03").prop("checked", true);
        }
    }


    //최근구매차종
    $("#CRM7500426-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(carlineList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"carlineNm",
        dataValueField:"carlineCd"
    });

    if(targExtractValMap["CRM7500426-01"] != "" && targExtractValMap["CRM7500426-01"] != null){
        $("#CRM7500426-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500426-01"].split(","));
    }


    // 최근 구매차 구매일 FROM
    $("#CRM7500427-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 최근 구매차 구매일 TO
    $("#CRM7500427-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500427-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500427-01"]);
    $("#CRM7500427-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500427-02"]);


    //보유차종
    $("#CRM7500428-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(carlineList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"carlineNm",
        dataValueField:"carlineCd"
    });

    if(targExtractValMap["CRM7500428-01"] != "" && targExtractValMap["CRM7500428-01"] != null){
        $("#CRM7500428-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500428-01"].split(","));
    }


    // 보유차 구매일 FROM
    $("#CRM7500429-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 보유차 구매일 TO
    $("#CRM7500429-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500429-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500429-01"]);
    $("#CRM7500429-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500429-02"]);


    // 보유 대수 (from)
    $("#CRM7500430-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 보유 대수 (to)
    $("#CRM7500430-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500430-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500430-01"]);
    $("#CRM7500430-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500430-02"]);


    // 본 딜러에서 구매 대수 (from)
    $("#CRM7500431-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 본 딜러에서 구매 대수 (to)
    $("#CRM7500431-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500431-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500431-01"]);
    $("#CRM7500431-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500431-02"]);


    // 신차 출고일
    $("#CRM7500432-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500432-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500432-01"]);

    // 보험
    if(targExtractValMap["CRM7500433-01"] != "" && targExtractValMap["CRM7500433-01"] != null){
        if(targExtractValMap["CRM7500433-01"] == "Y"){
            $("#CRM7500433-01-01").prop("checked", true);
        }else{
            $("#CRM7500433-01-02").prop("checked", true);
        }
    }

    // 금융
    if(targExtractValMap["CRM7500434-01"] != "" && targExtractValMap["CRM7500434-01"] != null){
        if(targExtractValMap["CRM7500434-01"] == "Y"){
            $("#CRM7500434-01-01").prop("checked", true);
        }else{
            $("#CRM7500434-01-02").prop("checked", true);
        }
    }

    // 보험 시작일 FROM
    $("#CRM7500435-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 보험 시작일 TO
    $("#CRM7500435-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500435-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500435-01"]);
    $("#CRM7500435-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500435-02"]);

    // 유효주소보유
    if(targExtractValMap["CRM7500533-01"] != "" && targExtractValMap["CRM7500533-01"] != null){
        if(targExtractValMap["CRM7500533-01"] == "Y"){
            $("#CRM7500533-01-01").prop("checked", true);
        }else{
            $("#CRM7500533-01-02").prop("checked", true);
        }
    }


    // 대표전화보유
    if(targExtractValMap["CRM7500534-01"] != "" && targExtractValMap["CRM7500534-01"] != null){
        if(targExtractValMap["CRM7500534-01"] == "Y"){
            $("#CRM7500534-01-01").prop("checked", true);
        }else{
            $("#CRM7500534-01-02").prop("checked", true);
        }
    }


    // 핸드폰전화보유
    if(targExtractValMap["CRM7500535-01"] != "" && targExtractValMap["CRM7500535-01"] != null){
        if(targExtractValMap["CRM7500535-01"] == "Y"){
            $("#CRM7500535-01-01").prop("checked", true);
        }else{
            $("#CRM7500535-01-02").prop("checked", true);
        }
    }


    // WECHAT 보유
    if(targExtractValMap["CRM7500536-01"] != "" && targExtractValMap["CRM7500536-01"] != null){
        if(targExtractValMap["CRM7500536-01"] == "Y"){
            $("#CRM7500536-01-01").prop("checked", true);
        }else{
            $("#CRM7500536-01-02").prop("checked", true);
        }
    }


    // SMS 수신 거부 제외
    if(targExtractValMap["CRM7500537-01"] != "" && targExtractValMap["CRM7500537-01"] != null){
        if(targExtractValMap["CRM7500537-01"] == "Y"){
            $("#CRM7500537-01-01").prop("checked", true);
        }else{
            $("#CRM7500537-01-02").prop("checked", true);
        }
    }


    // 휴대전화 수신 거부 제외
    if(targExtractValMap["CRM7500538-01"] != "" && targExtractValMap["CRM7500538-01"] != null){
        if(targExtractValMap["CRM7500538-01"] == "Y"){
            $("#CRM7500538-01-01").prop("checked", true);
        }else{
            $("#CRM7500538-01-02").prop("checked", true);
        }
    }


    // 집전화 수신 거부 제외
    if(targExtractValMap["CRM7500539-01"] != "" && targExtractValMap["CRM7500539-01"] != null){
        if(targExtractValMap["CRM7500539-01"] == "Y"){
            $("#CRM7500539-01-01").prop("checked", true);
        }else{
            $("#CRM7500539-01-02").prop("checked", true);
        }
    }


    //활동방법
    $("#CRM7500640-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(activeCdList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500640-01"] != "" && targExtractValMap["CRM7500640-01"] != null){
        $("#CRM7500640-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500640-01"].split(","));
    }


    // 활동 참가 일 FROM
    $("#CRM7500641-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 활동 참가 일 TO
    $("#CRM7500641-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500641-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500641-01"]);
    $("#CRM7500641-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500641-02"]);


    // 활동 참가 횟수 (from)
    $("#CRM7500642-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 활동 참가 횟수 (to)
    $("#CRM7500642-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500642-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500642-01"]);
    $("#CRM7500642-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500642-02"]);


    // 고객 케어 일 FROM
    $("#CRM7500643-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 고객 케어 일 TO
    $("#CRM7500643-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500643-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500643-01"]);
    $("#CRM7500643-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500643-02"]);


    // 고객 케어 횟수 (from)
    $("#CRM7500644-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 고객 케어 횟수 (to)
    $("#CRM7500644-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500644-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500644-01"]);
    $("#CRM7500644-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500644-02"]);


    // 설문 일 FROM
    $("#CRM7500645-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 설문 일 TO
    $("#CRM7500645-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500645-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500645-01"]);
    $("#CRM7500645-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500645-02"]);


    // 설문 횟수 (from)
    $("#CRM7500646-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 설문 횟수 (to)
    $("#CRM7500646-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500646-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500646-01"]);
    $("#CRM7500646-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500646-02"]);


    // 최근 3개월 접근 횟수 (from)
    $("#CRM7500647-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 최근 3개월 접근 횟수 (to)
    $("#CRM7500647-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#CRM7500647-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500647-01"]);
    $("#CRM7500647-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500647-02"]);


    // 참여 캠페인
//     $("#CRM7500748-01").kendoExtDropDownList({
//         dataTextField:"makNm"
//         , dataValueField:"makCd"
//         , optionLabel:" "  // 전체
//         , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
//         , dataSource:campaignList
//     });

//     $("#CRM7500748-01").data("kendoExtDropDownList").value(targExtractValMap["CRM7500748-01"]);

 // 참여 캠페인
    $("#CRM7500748-01").kendoMultiSelect({
//         dataSource:campaignList,
//         valuePrimitive:true,
//         placeholder:"",
//         dataTextField:"makNm",
//         dataValueField:"makCd" kjlee
        dataSource:campaignList,
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    if(targExtractValMap["CRM7500748-01"] != "" && targExtractValMap["CRM7500748-01"] != null){
        $("#CRM7500748-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500748-01"].split(","));
    }


    // 참여일 FROM
    $("#CRM7500749-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 참여일 TO
    $("#CRM7500749-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#CRM7500749-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500749-01"]);
    $("#CRM7500749-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500749-02"]);


    //조건값 유무에 따른 입력부 활성화/비활성화 스크립트
    f_showHideInput();

});
</script>
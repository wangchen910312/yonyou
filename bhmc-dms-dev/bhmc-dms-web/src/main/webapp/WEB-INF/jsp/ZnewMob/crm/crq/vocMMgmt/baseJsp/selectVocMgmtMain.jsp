<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/crm/crq/vocMMgmt/listJsp/selectVocMgmtList.jsp"></c:import>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.title.vocProc" /><spring:message code="global.btn.searchCondition" /></h2>
        </div>
        <div class="formarea">
            <input type="hidden" id="sDrlCd" name="sDrlCd" />
            <input type="hidden" id="sPltCd" name="sPltCd" />
            <input type="hidden" id="sVocNo" name="sVocNo" />

            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 客户--></th>
                        <td>
                            <div class="f_text">
                                <input type="text" id="sCust" placeholder="<spring:message code='crm.lbl.custNmHpNo' />">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRegStartDt" style="width:140px; background-color:#ffffff;"/>
                                <!-- <input type="search" id="sRegStartDt" style="width:140px" class=""  />
                                <span class="date" onclick="calpicker('sRegStartDt');">날짜선택</span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRegEndDt" style="width:140px; background-color:#ffffff;"/>
                                <!-- <input type=search id="sRegEndDt" style="width:140px" class=""  />
                                <span class="date" onclick="calpicker('sRegEndDt');">날짜선택</span> -->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVocTpCd" name="sVocTpCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVocStatCd" name=""sVocStatCd"" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.cmplCauCd" /><!-- 불만이유 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCmplCauCd" name="sCmplCauCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.pprocId" /><!-- 처리인 --></th>
                        <td>
                            <div class="f_text"><input id="sPprocIdNm" name="sPprocIdNm" class="form_input" /><input type="hidden" id="sMngScId" name="sMngScId" class="form_input" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.vocSource" /><!-- 서비스 요청 출처 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sBhmcYn" name="sBhmcYn" class="form_combo" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12723" hasPermission="${dms:getPermissionMask('READ')}">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="crm.lbl.vocReqInfo" /></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:40%;">
                            <col style="">
                        </colgroup>
                        <tbody id="vocReqInfo">
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vocNo" /><!-- VOC 번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocStatCdNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocTpCdNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.tendCd" /><!-- 성향 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="tendCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vocTpSub1Cd" /><!-- 1급 Sub 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocTpSub1Cd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="global.lbl.vocTpSub2Cd" /><!-- 2급 Sub 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocTpSub2Cd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="global.lbl.vocTpSub3Cd" /><!-- 3급 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocTpSub3Cd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="global.lbl.acptSrcCd" /><!-- 접수경로 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="acptSrcCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.activeGainPathCd" /><!-- 활동 취득 경로 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="activeGainPathCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr id="cmplCauCdTr">
                                <th scope="row"><spring:message code="global.lbl.cmplCauCd" /><!-- 불만 이유 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="cmplCauCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.prorCd" /> <!-- 중요성 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="prorCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.procLmtCd" /><!-- 처리시한 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="procLmtCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vocEndDt" /><!-- Close 시간 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocEndDt" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.receiveTelNo" /><!-- 수신 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="receiveTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.customer" /><!-- 고객 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="custNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="custNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.cmplDlEmpId" /><!-- 불만요청자 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pconCustNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custPrefCommNo" /><!-- 고객 주요 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="custPrefCommNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.hpNo" /><!-- 고객 이동 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                        <input type="number" id="hpNo" disabled="disabled" style="width: 55%"/><img src="<c:url value='/resources/img/mob/btn_popphone2.png' />" style="width: 40%" usemap="#001" id="mapImg">
                                            <map name="001">
                                            <dms:access viewId="VIEW-D-12722" hasPermission="${dms:getPermissionMask('READ')}">
                                            <area shape="rect" coords="0,0,35,35" href="#" id="mapTel" />
                                            </dms:access>
                                            <dms:access viewId="VIEW-D-12721" hasPermission="${dms:getPermissionMask('READ')}">
                                            <area shape="rect" coords="35,0,66,35" id="mapSMS" />
                                            </dms:access>
                                            </map>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.homeTelNo" /><!-- 고객 집 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="homeTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.officeTelNo" /><!-- 고객 직장 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="officeTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pconCustMjrTelNo" /><!-- 문의자 주요 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pconCustMjrTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pconCustHomeTelNo" /><!-- 문의자 집 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pconCustHomeTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pconCustOfficeTelNo" /><!-- 문의자 직장 전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pconCustOfficeTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.vorResvDt" /><!-- 예약시간 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="resvDt" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.repairBookId" /><!-- 정비예약ID --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="repairBookId" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.sendTelNo" /><!-- 발신전화번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="sendTelNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pconRelCd" /><!-- 고객 및 문의자 관계 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pconRelCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pprocDeptNm" /><!-- 처리부서 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pprocDeptNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pprocId" /><!-- 처리인 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pprocNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.coopDeptNm" /><!-- 협조부서 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="coopDeptNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.division" /><!-- 사업부 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="bizDeptNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.officeNm" /><!-- 사무소 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="officeNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.sung" /><!-- 성 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="sungCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.city" /><!-- 도시 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="cityNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.vinNo" /><!-- VIN 번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vinNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.carRegNo" /><!-- 차 번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="carRegNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="carlineNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.model" /><!-- 차형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="modelNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocnNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.runDistVal" /><!-- 키로 수 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="runDistVal" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.acptDeptNm" /><!-- 접수부서 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="acptDeptNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pacptId" /><!-- 접수인 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pacptNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.acptDt" /><!-- 접수시간 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="acptDt" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.manufacturer" /><!-- 제조사/특약점 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="manufacturer" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custReqCont" /><!-- 고객 요구 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="custReqCont" disabled="disabled" /></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="bhmcYn" name="bhmcYn">
                </div>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.title.vocHandling" /><!-- VOC 처리 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea3">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:40%;">
                                <col style="">
                            </colgroup>
                            <tbody id="vocHandling">
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.pevalId" /><!-- 심사인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="pevalNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.evalAllocDt" /><!-- 심사 배정시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="evalAllocDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.returnCauCont" /><!-- 반송원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="returnCauCont" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.dataShipStatCd" /><!-- 자료배송상태 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="sendCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.pmoCauCd" /><!-- 승급원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="pmoCauCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.pmoDt" /><!-- 승급시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="pmoDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.realPprocId" /><!-- 실 처리인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="realPprocNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.procDt" /><!-- 처리시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="procDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.pprocTelNo" /><!-- 처리인 전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="pprocTelNo" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.pprocEmailNm" /><!-- 처리인 E-mail --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="pprocEmailNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.stsfIvstEmpId" /><!-- 설문조사인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="stsfIvstEmpNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.vocStsfIvstDt" /><!-- 설문 조사시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="stsfIvstDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.mthAchvHm" /><!-- 방안 달성시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="mthAchvHm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.callCenOpnCont" /><!-- 콜센터 의견 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="callCenOpnCont" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr id="revMthContTr">
                                    <th scope="row"><spring:message code="crm.lbl.revMthCont" /><!-- 검토중인 방안 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="revMthCont" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.procRsltCont" /><!-- 처리결과 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="procRsltCont" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.stsfIvstRsltCont" /><!-- 설문결과 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="stsfIvstRsltCont" disabled="disabled" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div id="addInfoDiv" class="co_group">
                <div class="content_title" id="carHistTitle">
                    <h2><spring:message code="crm.title.addInfo" /><!-- 추가 정보 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea3">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:40%;">
                                <col style="">
                            </colgroup>
                            <tbody id="addInfo">
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.cmplStsfCd" /><!-- 불만 만족도 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplStsfCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.cmplReAcptYn" /><!-- 불만 재 접수 여부 --></th>
                                    <td>
                                        <div class="check"><input type="checkbox" id="cmplReAcptYn" name="cmplReAcptYn" class="f_check" data-type="checkbox" onclick="return false;" /><label for="cmplReAcptYn"></label></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.cmplReAcptCnt" /><!-- 불만 재 접수 횟수 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplReAcptCnt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.serReqNo" /><!-- 관련서비스 요청번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="serReqNo" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.cmplDlDeptNm" /><!-- 불만전달 부서 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplDlDeptNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.vocCmplDlEmpId" /><!-- 불만전달 자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplDlEmpNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.vocSaleDt" /><!-- 판매시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="saleDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.dstbNo" /><!-- 물류번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="dstbNo" disabled="disabled" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div id="itemInfoDiv" class="co_group">
                <div class="content_title" id="carHistTitle">
                    <h2><spring:message code="ser.title.itemInfo" /><!-- 부품정보 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea3">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:40%;">
                                <col style="">
                            </colgroup>
                            <tbody id="itemInfo">
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.parOrdYn" /><!-- 부품오더 여부 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="parOrdYn" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.parOrdDt" /><!-- 오더시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="parOrdDt" disabled="disabled" /></div>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.parArrvDt" /><!-- 도착시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="parArrvDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.itemCd" /><!-- 부품번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="itemCd" disabled="disabled" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 활동 -->
            <c:import url="/WEB-INF/jsp/ZnewMob/crm/crq/vocMMgmt/listJsp/selectVocMgmtSubList.jsp"></c:import>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script type="text/javascript">
var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

    var dateFormat =  '<dms:configValue code="dateFormat" />';
    $("#sDrlCd").val("${dlrCd}");
    var yesMap = [];
    yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
    yesMap["N"] = "<spring:message code='global.lbl.n' />";

    var callTelNo = "${callTelNo}";
    var vocNo = "${vocNo}";

    var crm604List      = []; // VOC 유형
    var crm601List      = []; // VOC 불만의 원인

    var crm601ListObj = [];
    var crm602ListObj = [];
    var crm603ListObj = [];
    var crm605ListObj = [];
    var crm606ListObj = [];
    var crm607ListObj = [];
    var crm608ListObj = [];
    var crm615ListObj = [];
    var crm616ListObj = [];
    var crm620ListObj = [];
    var crm621ListObj = [];
    var crm622ListObj = [];
    var crm030ListObj = [];

    var activeStatCdList = [];//활동상태코드
    var activeStatCdMap = [];
    var activeTpCdList = [];//활동유형코드
    var activeTpCdMap = [];
    var activeTpSubCdList = [];//활동유형SUB코드
    var activeTpSubCdListObj = {};
    var activeTpSubCdMap = [];

    var toDate;
    toDate = new Date();

    var vocTpCdList = []; //VOC유형코드 / CRM604
    <c:forEach var="obj" items="${vocTpCdList}">
        vocTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    var vocStatCdList = []; //VOC상태코드 / CRM624
    <c:forEach var="obj" items="${vocStatCdList}">
        vocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    console.log("111vocStatCdList : ",vocStatCdList);

    var vocTpSubCdList = []; //VOC유형SUB코드 / CRM617
    <c:forEach var="obj" items="${vocTpSubCdList}">
        vocTpSubCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var tendCdList = []; //성향코드 / CRM609
    <c:forEach var="obj" items="${tendCdList}">
        tendCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var acptSrcCdList = []; //접수출처코드 / CRM602
    <c:forEach var="obj" items="${acptSrcCdList}">
        acptSrcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var activeGainPathCdList = []; //활동 획득 경로 코드 / CRM615
    <c:forEach var="obj" items="${activeGainPathCdList}">
        activeGainPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var cmplCauCdList = []; //불만원인코드 / CRM601
    <c:forEach var="obj" items="${cmplCauCdList}">
        cmplCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var bhmcYnList = [];
    bhmcYnList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='crm.lbl.factory' />"});
    bhmcYnList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='ser.lbl.dealer' />"});

    var prorCdList = []; //우선순위코드 / CRM623
    <c:forEach var="obj" items="${prorCdList}">
        prorCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var procLmtCdList = []; //처리시한 코드 / CRM616
    <c:forEach var="obj" items="${procLmtCdList}">
        procLmtCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var pmoCauCdList = []; //승급 원인 코드 / CRM620
    <c:forEach var="obj" items="${pmoCauCdList}">
        pmoCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var vocTpSub1CdList = []; //1급 SUB 유형 / CRM605
    <c:forEach var="obj" items="${vocTpSub1CdList}">
        vocTpSub1CdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var cmplStsfNmList = []; //문의만족도 / CRM628
    <c:forEach var="obj" items="${cmplStsfNmList}">
        cmplStsfNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var crm030List = []; //고객 및 연계인 관계
    <c:forEach var="obj" items="${crm030List}">
        crm030List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${activeStatCdList}">
        activeStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        activeStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${activeTpCdList}">
        activeTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        activeTpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>



    <c:forEach var="obj" items="${activeTpSubCdList}">
    if(activeTpSubCdListObj.hasOwnProperty("${obj.remark1}")){
        activeTpSubCdListObj["${obj.remark1}"].push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    }else{
        activeTpSubCdListObj["${obj.remark1}"] = [];
        activeTpSubCdListObj["${obj.remark1}"].push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    };

    if(!activeTpSubCdMap.hasOwnProperty("${obj.cmmCd}")){
        activeTpSubCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    };
    </c:forEach>


    var sendCdList = []; //발송상태 / CRM629
    <c:forEach var="obj" items="${sendCdList}">
        sendCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    /**
     * 유형에 따른 상태 조회(조회조건)
     */
     fnOnSelectVocStatCdSearch = function (e) {
         var dataItem = this.dataItem(e.item);

         $("#sVocStatCd").data("kendoExtDropDownList").select(0);

         if(dataItem.cmmCd == ""){
             $("#sCmplCauCd").data("kendoExtDropDownList").select(0);
             $("#sCmplCauCd").data("kendoExtDropDownList").enable(false);

             return false;
         }

         if(dataItem.cmmCd=="02"){
             $("#sCmplCauCd").data("kendoExtDropDownList").setDataSource(cmplCauCdList);
             $("#sCmplCauCd").data("kendoExtDropDownList").enable(true);
         }else{
             $("#sCmplCauCd").data("kendoExtDropDownList").select(0);
             $("#sCmplCauCd").data("kendoExtDropDownList").enable(false);
         }
     };

    $(document).ready(function() {
        $("#sRegStartDt").val("${sevenDtBf}");
        $("#sRegEndDt").val("${today}");

        // 유형(조회부)
        $("#sVocTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:vocTpCdList
            , index:0
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , select:fnOnSelectVocStatCdSearch
        });

        // 상태(조회부).
        $("#sVocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:vocStatCdList
            , index:0
            , optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        // 불만이유(조회부)
        $("#sCmplCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:cmplCauCdList
            , index:0
            , optionLabel:" "
        });
        $("#sCmplCauCd").data("kendoExtDropDownList").enable(false);

      //제조사,딜러
        $("#sBhmcYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:bhmcYnList
            , index:0
            , optionLabel:"<spring:message code='global.lbl.check'/>"
        });


        // 타이틀
        $("#header_title").html("<spring:message code='crm.title.vocMgmt'/>");
        // 0705
        $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                initList();
                listData.read();
            }
        });
        $("#mapSMS").click(function(){
            sendSMSPopup();
        });

        $("#tendCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:tendCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#vocTpSub1Cd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:vocTpSub1CdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
            , select:function(e){
                    var dataItem = this.dataItem(e.item);
                    onSelectVocTpSubCdSet("CRM606", dataItem.cmmCd);
            }
        });

      //2급 Sub 유형(입력부).
        $("#vocTpSub2Cd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , select:function(e){
                var dataItem = this.dataItem(e.item);

                var vocTpSub1Cd = $("#vocTpSub1Cd").data("kendoExtDropDownList").value();
                var vocTpSub2Cd = dataItem.cmmCd;

                onSelectVocTpSubCdSet("CRM607", vocTpSub2Cd);

                // 긴급구조일때 화면 변경
                if ( (vocTpSub1Cd === "01" && vocTpSub2Cd === "14" ) || (vocTpSub1Cd === "03" && vocTpSub2Cd === "33") ) {
                    changeComboList("",vocTpSub1Cd,vocTpSub2Cd);
                } else {
                    changeComboList("","","");
                };
            }
        });
      //3급 유형(입력부).
        $("#vocTpSub3Cd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
        });

        $("#acptSrcCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:acptSrcCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#activeGainPathCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:activeGainPathCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#cmplCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:cmplCauCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#prorCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:prorCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#procLmtCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:procLmtCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#pconRelCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:crm030List
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#sendCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:sendCdList
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#pmoCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:crm620ListObj
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#cmplStsfCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:crm621ListObj
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });
    });

    function onSelectVocTpSubCdSet(grpCd, cmmCd) {
        var param ={
                "sCmmGrpCd":grpCd
                ,"cmmCd":cmmCd
        };
        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectVocTpSubCdList.do"
            ,data:JSON.stringify(param)
            ,async:false
        });

        var vocTpSubDatsSource = responseJson.data;
        if ( grpCd === "CRM606" ) {
            if ( vocTpSubDatsSource.length > 0 ) {
                $("#vocTpSub3Cd").data("kendoExtDropDownList").setDataSource([]);
                $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);

                $("#vocTpSub2Cd").data("kendoExtDropDownList").setDataSource(vocTpSubDatsSource);
                $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(true);
            }
        } else if ( grpCd === "CRM607" ) {
            if ( vocTpSubDatsSource.length > 0 ) {
                $("#vocTpSub3Cd").data("kendoExtDropDownList").setDataSource(vocTpSubDatsSource);
                $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(true);
            } else {
                $("#vocTpSub3Cd").data("kendoExtDropDownList").setDataSource([]);
                $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);
            }
        };
    };
</script>

<script type="text/javascript">
    function fnVocMgmtByKey(vocNo) {
        // VOC 상세 조회 시작
        var vocNo = vocNo;

        var param = {
                "sVocNo":vocNo
                };

        $.ajax({
                url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmtByKey.do' />"
                ,data:JSON.stringify(param)      //파라미터
                ,type:'POST'                        //조회요청
                ,dataType:'json'                  //json 응답
                ,contentType:'application/json'   //문자열 파라미터
                ,async:false
                ,error:function(jqXHR,status,error){
                    mob.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(result) {
                    $("#stsfIvstRsltCont").val(result.stsfIvstRsltCont);
                    $("#pconRelCd").parent().find(".k-input").html(result.pconTpNm);
                }
        });
        // 상세조회 종료
    };


    //상세페이지 보기
    fnContentDetail = function (key) {
        vocNo=key.vocNo;
        // [partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        if (key.vocTpCd == "02") {
            $("#cmplCauCdTr").show();           // VOC 요청 정보 - 불만 이유
            $("#revMthContTr").show();          // VOC 처리 - 검토 중인 방안
            $("#addInfoDiv").show();            // 추가 정보
            $("#itemInfoDiv").show();           // 부품 정보
        }
        else {
            $("#cmplCauCdTr").hide();           // VOC 요청 정보 - 불만 이유
            $("#revMthContTr").hide();          // VOC 처리 - 검토 중인 방안
            $("#addInfoDiv").hide();            // 추가 정보
            $("#itemInfoDiv").hide();           // 부품 정보
        }
        $("#sPltCd").val(key.pltCd);
        $("#sVocNo").val(key.vocNo);
        $("#vocNo").val(key.vocNo);
        $("#vocStatCdNm").val(key.vocStatCdNm);
        $("#vocTpCdNm").val(key.vocTpCdNm);
        $("#tendCd").data("kendoExtDropDownList").value(key.tendCd);
        $("#vocTpSub1Cd").data("kendoExtDropDownList").value(key.vocTpSub1Cd);
        onSelectVocTpSubCdSet("CRM606", key.vocTpSub1Cd);
        $("#vocTpSub2Cd").data("kendoExtDropDownList").value(key.vocTpSub2Cd);
        onSelectVocTpSubCdSet("CRM607", key.vocTpSub2Cd);
        $("#vocTpSub3Cd").data("kendoExtDropDownList").value(key.vocTpSub3Cd);
        $("#acptSrcCd").data("kendoExtDropDownList").value(key.acptSrcCd);                     // 접수 경로
        $("#activeGainPathCd").data("kendoExtDropDownList").value(key.activeGainPathCd);       // 활동 취득 경로
        $("#cmplCauCd").data("kendoExtDropDownList").value(key.cmplCauCd);                     // 불만 이유
        $("#prorCd").data("kendoExtDropDownList").value(key.prorCd);                           // 중요성
        $("#procLmtCd").data("kendoExtDropDownList").value(key.procLmtCd);                     // 처리 시한
        $("#vocEndDt").val(chgDate2DateTimeStr(key.vocEndDt));                              // Close 시간
        $("#receiveTelNo").val(key.receiveTelNo);                                           // 전화번호
        $("#custNm").val(key.custNm);                                                       // 고객
        $("#custNo").val(key.custNo);                                                       // 고객
        $("#pconCustNm").val(key.pconCustNm);                                               // 문의자
        $("#custPrefCommNo").val(key.custPrefCommNo);                                       // 고객 주요 전화번호
        $("#hpNo").val(key.hpNo);                                                           // 고객 이동 전화번호
        try{
            var userAgent = navigator.userAgent.toLowerCase();
            if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                || (userAgent.search("ipad") > -1))
            {
                $("#mapTel").attr("href","telprompt://"+key.hpNo);
            }else
            {
                $("#mapTel").attr("href","tel:"+key.hpNo);
            }
        }catch(e){

        }
        $("#homeTelNo").val(key.homeTelNo);                                                 // 고객 집 전화번호
        $("#officeTelNo").val(key.officeTelNo);                                             // 고객 직장 전화번호
        $("#pconCustMjrTelNo").val(key.pconCustMjrTelNo);                                   // 문의자 주요 전화번호
        $("#pconCustHomeTelNo").val(key.pconCustHomeTelNo);                                 // 문의자 집 전화번호
        $("#pconCustOfficeTelNo").val(key.pconCustOfficeTelNo);                             // 문의자 직장 전화번호
        $("#resvDt").val(chgDate2DateTimeStr(key.resvDt));                                  // 예약 시간
        $("#repairBookId").val(key.repairBookId);                                           // 정비 예약 ID
        $("#sendTelNo").val(key.sendTelNo);                                                 // 발신전화번호
        $("#pconRelCd").data("kendoExtDropDownList").value(key.pconRelCd);                     // 고객 및 문의자 관계
        $("#pprocDeptNm").val(key.pprocDeptNm);                                             // 처리부서
        $("#pprocNm").val(key.pprocNm);                                                     // 처리인
        $("#coopDeptNm").val(key.coopDeptNm);                                               // 협조부서
        $("#bizDeptNm").val(key.bizDeptNm);                                                 // 사업부
        $("#officeNm").val(key.officeNm);                                                   // 사무소
        $("#sungCd").val(key.sungNm);                                                       // 성
        $("#cityNm").val(key.cityNm);                                                       // 도시
        $("#vinNo").val(key.vinNo);                                                         // VIN 번호
        $("#carRegNo").val(key.carRegNo);                                                   // 차번호
        $("#carlineNm").val(key.carlineNm);                                                 // 차종
        $("#modelNm").val(key.modelNm);                                                     // 차형
        $("#ocnNm").val(key.ocnNm);                                                         // OCN 명
        $("#runDistVal").val(key.runDistVal);                                               // Km 수
        $("#acptDeptNm").val(key.acptDeptNm);                                               // 접수부서
        $("#pacptNm").val(key.pacptNm);                                                     // 접수인
        $("#acptDt").val(chgServerDateTime2Str2(key.acptDt));                                                       // 접수 시간
        $("#manufacturer").val("<c:out value='${loginDlrNm}' />");                                           // 제조사 / 특약점
        $("#custReqCont").val(key.custReqCont);                                             // 고객 요구
        $("#custRescLocCont").val(key.custRescLocCont);                                     // 고객 구조 위치

        // VOC 처리
        $("#pevalNm").val(key.pevalNm);                                                     // 심사인
        $("#evalAllocDt").val(chgDate2DateTimeStr(key.evalAllocDt));                        // 심사 배정시간
        $("#returnCauCont").val(key.returnCauCont);                                         // 반송 원인
        $("#sendCd").data("kendoExtDropDownList").value(key.sendCd);           // 자료배송상태
        $("#pmoCauCd").data("kendoExtDropDownList").value(key.pmoCauCd);                       // 승급 원인
        $("#pmoDt").val(chgDate2DateTimeStr(key.pmoDt));                                    // 승급 시간
        $("#realPprocNm").val(key.realPprocNm);                                             // 실 처리인
        $("#procDt").val(chgDate2DateTimeStr(key.procDt));                                  // 처리 시간
        $("#pprocTelNo").val(key.pprocTelNo);                                               // 처리인 전화
        $("#pprocEmailNm").val(key.pprocEmailNm);                                           // 처리인 E-Mail
        $("#stsfIvstEmpNm").val(key.stsfIvstEmpNm);                                         // 만족도 조사인
        $("#stsfIvstDt").val(chgDate2DateTimeStr(key.stsfIvstDt));                          // 만족도 조사 시간
        $("#mthAchvHm").val(key.mthAchvHm);                                                 // 방안 달성 시간
        $("#callCenOpnCont").val(key.callCenOpnCont);                                       // 콜센터 의견
        $("#revMthCont").val(key.revMthCont);                                               // 검토중인 방안
        $("#procRsltCont").val(key.procRsltCont);                                           // 처리 결과
        $("#stsfIvstRsltCont").val(key.stsfIvstRsltCont);                                   // 만족도 조사 결과

        // 추가 정보
        $("#cmplStsfCd").data("kendoExtDropDownList").value(key.cmplStsfCd);                   // 불만 만족도
        $("#cmplReAcptCnt").val(key.cmplReAcptCnt);                                         // 불만 재접수 횟수
        $("#serReqNo").val(key.serReqNo);                                                   // 관련 서비스 요청 번호
        $("#cmplDlDeptNm").val(key.cmplDlDeptNm);                                           // 불만 전달 부서
        $("#cmplDlEmpNm").val(key.cmplDlEmpNm);                                             // 불만 전달 자
        $("#saleDt").val(chgDate2DateTimeStr(key.saleDt));                                  // 판매 시간
        $("#dstbNo").val(key.dstbNo);                                                       // 물류 번호

        if (key.cmplReAcptYn == "Y") {
            $("#cmplReAcptYn").prop("checked", true);
        }
        else {
            $("#cmplReAcptYn").prop("checked", false);
        }

        // 부품
        $("#parOrdYn").val(yesMap[key.parOrdYn]);                                           // 부품 오더 여부
        $("#parOrdDt").val(chgDate2DateTimeStr(key.parOrdDt));                      // 오더 시간
        $("#parArrvDt").val(chgDate2DateTimeStr(key.parArrvDt));                    // 도착 시간
        $("#itemCd").val(key.itemCd);                                               // 부품 번호

        $("#tendCd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSub1Cd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);
        $("#acptSrcCd").data("kendoExtDropDownList").enable(false);
        $("#activeGainPathCd").data("kendoExtDropDownList").enable(false);
        $("#cmplCauCd").data("kendoExtDropDownList").enable(false);
        $("#prorCd").data("kendoExtDropDownList").enable(false);
        $("#procLmtCd").data("kendoExtDropDownList").enable(false);
        $("#pconRelCd").data("kendoExtDropDownList").enable(false);
        $("#sendCd").data("kendoExtDropDownList").enable(false);
        $("#pmoCauCd").data("kendoExtDropDownList").enable(false);
        $("#cmplStsfCd").data("kendoExtDropDownList").enable(false);
        $("#bhmcYn").val(key.bhmcYn);
        // 활동
        subListData.read();

     // BHMC 인경우 이름 그대로 보여줌.
        if ( dms.string.isNotEmpty(key.bhmcVocNo) && key.bhmcYn === "Y" ) {
             //접수인
             $("#pacptId").val("");
             $("#pacptNm").val(key.pacptId);

             //처리인
             /* $("#pprocId").val("");
             $("#pprocNm").val(key.pprocId); */


             //설문조사인
             $("#stsfIvstEmpId").val("");
             $("#stsfIvstEmpNm").val(key.stsfIvstEmpId);

             //불만전달자
             $("#cmplDlEmpId").val("");
             $("#cmplDlEmpNm").val(key.cmplDlEmpId);

             //심사인
             $("#pevalId").val(key.pevalId);
             $("#pevalNm").val(key.pevalNm);

             //실처리인
            $("#realPprocId").val(key.realPprocId);
            $("#realPprocNm").val(key.realPprocNm);

            $("#pconRelCd").parent().find(".k-input").html(key.pconTpNm);
            $("#sungCd").parent().find(".k-input").html(key.sungNm);
            $("#cityCd").parent().find(".k-input").html(key.cityNm);
            $("#carlineCd").parent().find(".k-input").html(key.carlineNm);
            $("#modelCd").parent().find(".k-input").html(key.modelNm);
            $("#ocnCd").parent().find(".k-input").html(key.ocnNm);
            $("#pacptId").parent().find(".k-input").html(key.pacptId);
            $("#cmplStsfNm01").parent().find(".k-input").html(key.cmplStsfNm);
        }

        if(vocNo!=""){
            fnVocMgmtByKey(vocNo);
        }
    };
  //SMS 팝업
    var sendSMSPopupWin;
    function sendSMSPopup(){
        var   smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
            , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
            , smsTmplUserList = []              // sms 전송 대상자 목록
            , refKeyNm =$("#custNo").val()
            , refTableNm = "CR_0601T"
            , contactBizCd = "04" //업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07)
            , custNoRequired = "Y"
        ;

        if ( $("#bhmcYn").val() == "Y" ) {
            custNoRequired = "N";
        };

        var custNo = $("#custNo").val()
            , custNm = $("#custNm").val()
            , hpNo = $("#hpNo").val();

        sendSMSPopupWin = mob.window.popup({
                windowId:"sendSMSPopupWin"
                ,width:"100%"
                ,height:"700px"
                ,content:{
                    url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSendSMSPopup.do'/>"
                    , data:{
                        "custNo":custNo
                        ,"custNm":custNm
                        ,"hpNo":hpNo
                        ,"smsTmplUserGroup":smsTmplUserGroup
                        ,"smsTmplUserSeq":smsTmplUserSeq
                        ,"smsTmplUserList":smsTmplUserList
                        ,"refKeyNm":refKeyNm
                        ,"refTableNm":refTableNm
                        ,"contactBizCd":contactBizCd
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                if(data == "FAIL"){
                                    mob.notification.success("<spring:message code='global.lbl.send'/>"+"<spring:message code='global.btn.failed'/>");
                                }else{
                                    mob.notification.success("<spring:message code='global.info.success'/>");
                                }
                            }
                        }
                    }
                }
            });
    }
</script>
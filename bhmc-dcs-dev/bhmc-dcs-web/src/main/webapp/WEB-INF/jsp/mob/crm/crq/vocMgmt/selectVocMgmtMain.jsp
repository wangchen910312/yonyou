<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title">VOC 목록</h2>
            </div>
            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="global.lbl.regDt" /><!-- 등록일 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.statNm" /><!-- 상태 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.cmplCauCd" /><!-- 불만이유 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btnarea">
                        <span class="sbtn">전체조건 삭제</span>
                    </div>
                </div>
            </div>

            <div class="listarea01">
                <div class="listhead dlistitem">
                    <span style="width:65%"><spring:message code="global.lbl.vocNo" /><!-- VOC 번호 --></span>
                    <span style="width:35%"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></span>
                    <span class="clboth" style="width:35%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
                    <span style="width:30%"><spring:message code="global.lbl.telNumer" /><!-- 연락처 --></span>
                    <span style="width:30%"><spring:message code="global.lbl.vocStatCd" /><!-- 진행상태 --></span>
                    <span class="clboth" style="width:35%"><spring:message code="crm.lbl.procDt" /><!-- 처리기간 --></span>
                    <span style="width:30%"><spring:message code="crm.lbl.mainDeptNm" /><!-- 담당부서 --></span>
                    <span style="width:30%"><spring:message code="crm.lbl.prsn" /><!-- 담당자 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2>VOC 목록 조회조건 </h2>
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
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sRegStartDt" style="width:140px" class="" readOnly />
                                <span class="date" onclick="calpicker('sRegStartDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sRegEndDt" style="width:140px" class="" readOnly />
                                <span class="date" onclick="calpicker('sRegEndDt');">날짜선택</span>
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
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2>VOC 요청 정보</h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vocNo" /><!-- VOC 번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">VOC 상태</th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocStatNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="vocTpNm" disabled="disabled" /></div>
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
                                <th scope="row"><spring:message code="global.lbl.telNo" /><!-- 전화번호 --></th>
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
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pconCustInfo" /><!-- 문의자 --></th>
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
                                    <div class="f_text f_disabled"><input type="text" id="hpNo" disabled="disabled" /></div>
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
                                <th scope="row"><spring:message code="ser.lbl.resvDt" /><!-- 예약시간 --></th>
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
                                <th scope="row"><spring:message code="global.lbl.sung" /><!-- 성 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="sungCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.city" /><!-- 도시 --></th>
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
                                    <div class="f_text f_disabled"><input type="text" id="pacptNm" disabled="disabled" /></div>
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
                            <tr id="custRescLocContTr">
                                <th scope="row"><spring:message code="global.lbl.custRescLocCont" /><!-- 고객 구조 위치 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="custRescLocCont" disabled="disabled" /></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
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
                                        <div class="f_text f_disabled"><input type="text" id="dataShipStatCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
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
                                    <th scope="row"><spring:message code="global.lbl.stsfIvstEmpId" /><!-- 만족도 조사인 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="stsfIvstEmpNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.stsfIvstDt" /><!-- 만족도 조사시간 --></th>
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
                                    <th scope="row"><spring:message code="global.lbl.revMthCont" /><!-- 검토중인 방안 --></th>
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
                                    <th scope="row"><spring:message code="global.lbl.stsfIvstRsltCont" /><!-- 만족도 조사결과 --></th>
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
                    <h2><spring:message code="global.title.addInfo" /><!-- 추가 정보 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea3">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.cmplStsfCd" /><!-- 불만 만족도 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplStsfCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="checkbox" id="cmplReAcptYn" name="cmplReAcptYn" class="f_check" data-type="checkbox" disabled="disabled" /><label for="cmplReAcptYn"></label><spring:message code="global.lbl.cmplReAcptYn" /><!-- 불만 재 접수 여부 --></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.cmplReAcptCnt" /><!-- 불만 재 접수 횟수 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplReAcptCnt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.serReqNo" /><!-- 관련서비스 요청번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="serReqNo" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.cmplDlDeptNm" /><!-- 불만전달 부서 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplDlDeptNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.cmplDlEmpId" /><!-- 불만전달 자 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="cmplDlEmpNm" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.saleDt" /><!-- 판매시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="saleDt" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.dstbNo" /><!-- 물류번호 --></th>
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
                    <h2><spring:message code="par.lbl.itemInfo" /><!-- 부품 정보 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea3">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
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
                                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="itemCd" disabled="disabled" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


            <div class="co_group">
                <div class="content_title" id="carHistTitle">
                    <h2><spring:message code="global.title.active" /><!-- 활동 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="subListarea">
                        <div class="listhead dlistitem">
                            <span style="width:35%"><spring:message code="global.lbl.customer" /><!-- 고객 --></span>
                            <span style="width:30%"><spring:message code="global.lbl.pconCustInfo" /><!-- 문의자 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.statNm" /><!-- 상태 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></span>
                            <span style="width:65%"><spring:message code="crm.lbl.subType" /><!-- Sub 유형 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></span>
                            <span style="width:65%"><spring:message code="crm.lbl.regTime" /><!-- 등록시간 --></span>
                            <span class="clboth" style="width:100%"><spring:message code="crm.lbl.activeCont" />/<spring:message code="global.lbl.result" /><!-- 활동내용/결과 --></span>
                        </div>

                        <iframe id="detailList" name="detailList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                    </div>
                </div>
            </div>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script type="text/javascript">
    var dateFormat =  '<dms:configValue code="dateFormat" />';
    $("#sDrlCd").val("${dlrCd}");

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

    var toDate;
    toDate = new Date();

    $(".skeyarea .btnarea .sbtn").click(function() {
        var obj = $(this).parent().parent();

        $(".skeyarea").hide();

        $("#sRegStartDt").val("");
        $("#sRegEndDt").val("");
        $("#sVocTpCd").data("kendoExtDropDownList").value("");
        $("#sVocStatCd").data("kendoExtDropDownList").value("");
        $("#sCmplCauCd").data("kendoExtDropDownList").value("");

        obj.find("span[name='searchStr']").text("");

        fnSetSearchBox();
        contentList();
    });

    // 불만 원인
    <c:forEach var="obj" items="${crm601List}">
        crm601List.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        crm601ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 접수 경로
    <c:forEach var="obj" items="${crm602List}">
        crm602ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 중요성
    <c:forEach var="obj" items="${crm603List}">
        crm603ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 유형
    <c:forEach var="obj" items="${crm604List}">
        crm604List.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // VOC 성향
    <c:forEach var="obj" items="${crm608List}">
        crm608ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 1급 SUB 유형
    <c:forEach var="obj" items="${crm605List}">
        crm605ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 2급 SUB 유형
    <c:forEach var="obj" items="${crm606List}">
        crm606ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 3급 SUB 유형
    <c:forEach var="obj" items="${crm607List}">
        crm607ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 활동 취득 경로
    <c:forEach var="obj" items="${crm615List}">
        crm615ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 처리 시한
    <c:forEach var="obj" items="${crm616List}">
        crm616ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 승급 원인
    <c:forEach var="obj" items="${crm620List}">
        crm620ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 불만 만족도
    <c:forEach var="obj" items="${crm621List}">
        crm621ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 자료배송상태
    <c:forEach var="obj" items="${crm622List}">
        crm622ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    // 고객 및 문의자 관계
    <c:forEach var="obj" items="${crm030List}">
        crm030ListObj.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    /**
     * 유형에 따른 상태 조회(조회조건)
     */
     fnOnSelectVocStatCdSearch = function (e) {
         var dataItem = this.dataItem(e.item);

         $("#sVocStatCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sVocStatCd").data("kendoExtDropDownList").enable(true);

         if(dataItem.cmmCd == ""){
             $("#sVocStatCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sVocStatCd").data("kendoExtDropDownList").enable(false);

             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:_contextPath + "/crm/crq/vocMgmt/selectVocTpCdList.do"
             ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
             ,async:false
         });

         $("#sVocStatCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     };


    fnSetSearchBox = function () {
        var sRegStartDt = $("#sRegStartDt").val();
        var sRegEndDt = $("#sRegEndDt").val();
        var sVocTpCd = $("#sVocTpCd").data("kendoExtDropDownList").value();
        var sVocStatCd = $("#sVocStatCd").data("kendoExtDropDownList").value();
        var sCmplCauCd = $("#sCmplCauCd").data("kendoExtDropDownList").value();

        setMainListHeight();

        if(sRegStartDt == "" && sRegEndDt == "" && sVocTpCd == "" && sVocStatCd == "" && sCmplCauCd == "") {
            $(".skeyarea").hide();
        }
        else {
            $(".skeyarea").show();

            if (sRegStartDt == "") {
                $("#search1Area").hide();
            }
            else {
                $("#search1Area").show();
            }

            if (sRegEndDt == "") {
                $("#search1Area").hide();
            }
            else {
                $("#search1Area").show();
            }

            if (sVocTpCd == "") {
                $("#search2Area").hide();
            }
            else {
                $("#search2Area").show();
            }

            if (sVocStatCd == "") {
                $("#search3Area").hide();
            }
            else {
                $("#search3Area").show();
            }

            if (sCmplCauCd == "") {
                $("#search4Area").hide();
            }
            else {
                $("#search4Area").show();
            }
        }
    }

    /* fnChangeCmplCauCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm601ListObj[val];
        }

        return returnVal;
    }

    fnChangeAcptSrcCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm602ListObj[val];
        }

        return returnVal;
    }

    fnChangeProrCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm603ListObj[val];
        }

        return returnVal;
    }

    fnChangeVocTpSub1Cd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm605ListObj[val];
        }

        return returnVal;
    }

    fnChangeVocTpSub2Cd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm606ListObj[val];
        }

        return returnVal;
    }

    fnChangeVocTpSub3Cd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm607ListObj[val];
        }

        return returnVal;
    }

    fnChangetendCd = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm608ListObj[val];
        }

        return returnVal;
    }

    fnChangeActiveGainPathCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm615ListObj[val];
        }

        return returnVal;
    }

    fnChangeProcLmtCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm616ListObj[val];
        }

        return returnVal;
    }

    fnChangePmoCauCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm620ListObj[val];
        }

        return returnVal;
    }

    fnChangeCmplStsfCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm621ListObj[val];
        }

        return returnVal;
    }

    fnChangeDataShipStatCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm622ListObj[val];
        }

        return returnVal;
    }

    fnChangePconRelCd = function(val) {
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = crm030ListObj[val];
        }

        return returnVal;
    } */

    $(document).ready(function() {
        $("#sRegStartDt").val("${oneDay}");
        $("#sRegEndDt").val("${today}");


        // 유형(조회부)
        $("#sVocTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:crm604List
            , index:0
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , select:fnOnSelectVocStatCdSearch
        });

        // 상태(조회부).
        $("#sVocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#sVocStatCd").data("kendoExtDropDownList").enable(false);

        // 불만이유(조회부)
        $("#sCmplCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:crm601List
            , index:0
            , optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        fnInitPage = function (){
            $(".skeyarea").hide();
        }

        fnInitPage();

        // 타이틀
        $("#header_title").html("VOC 관리");
        // 0705
        // $("#header_title").on("click", contentSearch);
        $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

        // 목록 조회
        $("#mainList").attr("src", "<c:url value='/mob/crm/crq/vocMgmt/selectVocMgmtMainList.do' />");

        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                var sRegStartDt = $("#sRegStartDt");
                var sRegEndDt = $("#sRegEndDt");
                var sVocTpCd = $("#sVocTpCd").data("kendoExtDropDownList");
                var sVocStatCd = $("#sVocStatCd").data("kendoExtDropDownList");
                var sCmplCauCd = $("#sCmplCauCd").data("kendoExtDropDownList");

                if (sRegStartDt.val() != "" && sRegEndDt.val() != "") {
                    $("#search1Area span[name='searchStr']").text(sRegStartDt.val() + "~" + sRegEndDt.val());
                }
                else {
                    if(sRegStartDt.val() != "") {
                        $("#search1Area span[name='searchStr']").text(sRegStartDt.val() + "~");
                    }
                    else if (sRegEndDt.val() != "") {
                        $("#search1Area span[name='searchStr']").text("~" + sRegEndDt.val());
                    }
                }

                if(sVocTpCd.value() != "") {
                    $("#search2Area span[name='searchStr']").text(sVocTpCd.text());
                }

                if(sVocStatCd.value() != "") {
                    $("#search3Area span[name='searchStr']").text(sVocStatCd.text());
                }

                if(sCmplCauCd.value() != "") {
                    $("#search4Area span[name='searchStr']").text(sCmplCauCd.text());
                }

                fnSetSearchBox();
                contentList();
            }
        });

        // 버튼 - 이전
        $("#docu_prev").bind("click", function() {
            if ($("#content_list").css("display") == "block") { goMain(); }
            else if ($("#content_search").css("display") == "block") { contentList(); }
            else if ($("#content_detail").css("display") == "block") { contentList(); }
        });

        //버튼 - TOP
        $("#docu_top").bind("click", function() {
            $("body,html").animate({scrollTop:0}, 200);
        });

        //상단으로 이동
        $(window).scroll(function () {
            if ($(this).scrollTop() != 0) {
                $("#docu_top").fadeIn();
            }
            else {
                $("#docu_top").fadeOut();
            }
        });
    });
</script>

<script type="text/javascript">
    //메인화면 가기
    function goMain() {
        window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    }

    //목록페이지 보기
    function contentList() {
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "none");
        $("#content_list").css("display", "block");

        // 0705
        $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
        document.getElementById("mainList").contentWindow.document.location.reload();
    }

    //검색페이지 보기
    function contentSearch() {
        $("#content_list").css("display", "none");
        $("#content_detail").css("display", "none");
        $("#content_search").css("display", "block");
    }

    //상세페이지 보기
    fnContentDetail = function (key) {
        $("#content_list").css("display", "none");
        $("#content_search").css("display", "none");
        $("#content_detail").css("display","block");
        // 0705
        $("#header_title span").removeAttr("class");

        if( key != null && key != 'undefined'){
            // [partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }

            if (key.vocTpCd == "02") {
                $("#cmplCauCdTr").show();           // VOC 요청 정보 - 불만 이유
                $("#custRescLocContTr").hide();     // VOC 요청 정보 - 고객 구조 위치
                $("#revMthContTr").show();          // VOC 처리 - 검토 중인 방안
                $("#addInfoDiv").show();            // 추가 정보
                $("#itemInfoDiv").show();           // 부품 정보
            }
            else {
                $("#cmplCauCdTr").hide();           // VOC 요청 정보 - 불만 이유
                $("#custRescLocContTr").show();     // VOC 요청 정보 - 고객 구조 위치
                $("#revMthContTr").hide();          // VOC 처리 - 검토 중인 방안
                $("#addInfoDiv").hide();            // 추가 정보
                $("#itemInfoDiv").hide();           // 부품 정보
            }

            $("#tendCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm608ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#vocTpSub1Cd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm605ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#vocTpSub2Cd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm606ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#vocTpSub3Cd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm607ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#acptSrcCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm602ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#activeGainPathCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm615ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#cmplCauCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm601ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#prorCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm603ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#procLmtCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm616ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#pconRelCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm030ListObj
                ,optionLabel:"<spring:message code='global.lbl.check'/>"
            });

            $("#dataShipStatCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:crm622ListObj
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

            $("#sPltCd").val(key.pltCd);
            $("#sVocNo").val(key.vocNo);
            $("#vocNo").val(key.vocNo);
            $("#vocStatNm").val(key.vocStatNm);
            $("#vocTpNm").val(key.vocTpNm);
            $("#tendCd").data("kendoExtDropDownList").value(key.tendCd);
            $("#vocTpSub1Cd").data("kendoExtDropDownList").value(key.vocTpSub1Cd);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").value(key.vocTpSub2Cd);
            $("#vocTpSub3Cd").data("kendoExtDropDownList").value(key.vocTpSub3Cd);
            $("#acptSrcCd").data("kendoExtDropDownList").value(key.acptSrcCd);                     // 접수 경로
            $("#activeGainPathCd").data("kendoExtDropDownList").value(key.activeGainPathCd);       // 활동 취득 경로
            $("#cmplCauCd").data("kendoExtDropDownList").value(key.cmplCauCd);                     // 불만 이유
            $("#prorCd").data("kendoExtDropDownList").value(key.prorCd);                           // 중요성
            $("#procLmtCd").data("kendoExtDropDownList").value(key.procLmtCd);                     // 처리 시한
            $("#vocEndDt").val(chgDate2DateTimeStr(key.vocEndDt));                              // Close 시간
            $("#receiveTelNo").val(key.receiveTelNo);                                           // 전화번호
            $("#custNm").val(key.custNm);                                                       // 고객
            $("#pconCustNm").val(key.pconCustNm);                                               // 문의자
            $("#custPrefCommNo").val(key.custPrefCommNo);                                       // 고객 주요 전화번호
            $("#hpNo").val(key.hpNo);                                                           // 고객 이동 전화번호
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
            $("#acptDt").val(key.acptDt);                                                       // 접수 시간
            $("#manufacturer").val(key.manufacturer);                                           // 제조사 / 특약점
            $("#custReqCont").val(key.custReqCont);                                             // 고객 요구
            $("#custRescLocCont").val(key.custRescLocCont);                                     // 고객 구조 위치

            // VOC 처리
            $("#pevalNm").val(key.pevalNm);                                                     // 심사인
            $("#evalAllocDt").val(chgDate2DateTimeStr(key.evalAllocDt));                        // 심사 배정시간
            $("#returnCauCont").val(key.returnCauCont);                                         // 반송 원인
            $("#dataShipStatCd").data("kendoExtDropDownList").value(key.dataShipStatCd);           // 자료배송상태
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
            $("#parOrdYn").val(key.parOrdYn);                                           // 부품 오더 여부
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
            $("#dataShipStatCd").data("kendoExtDropDownList").enable(false);
            $("#pmoCauCd").data("kendoExtDropDownList").enable(false);
            $("#cmplStsfCd").data("kendoExtDropDownList").enable(false);

            // 활동
            $("#detailList").attr("src", "<c:url value='/mob/crm/crq/vocMgmt/selectVocMgmtSubList.do' />");
        }
    }
</script>
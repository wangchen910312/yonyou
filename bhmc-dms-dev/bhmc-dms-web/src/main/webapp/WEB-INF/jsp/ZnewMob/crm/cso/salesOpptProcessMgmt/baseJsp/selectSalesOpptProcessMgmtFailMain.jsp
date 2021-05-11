<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<!-- content -->
<section id="content">
    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.menu.failCustomerDB" /> <spring:message code="global.title.searchCondition" /><!-- 잠재고객 DB 조회조건  --></h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.customer" /><!-- 고객 --></span></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCustNm" data-json-obj="true"/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.prsNm' /></th><!-- 책임자 -->
                        <td>
                           <div class="f_text"><input type="text" id="sMngScId" data-json-obj="true" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.approchLocation' /></th><!-- 리드출처 -->
                        <td>
                            <!-- <div class="f_text"><input id="sInfoPathCd" type="text" data-json-obj="true" /></div> -->
                            <div class="f_text"><input id="sHoldTp" type="text" data-json-obj="true" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.beforeLeadStat' /></th><!-- 실패단계 -->
                        <td>
                            <div class="f_text"><input type="text" id="sBefLeadStatCd" data-json-obj="true" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.infoType' /></th> <!-- 리드유형 -->
                        <td>
                            <div class="f_text"><input type="text" id="sInfoTp" data-json-obj="true" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.submitDt' /></th><!-- 제출일 -->
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sSubmitDtFrom" style="width:140px; background-color:#ffffff;" />
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sSubmitDtTo" style="width:140px; background-color:#ffffff;" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12735" hasPermission="${dms:getPermissionMask('READ')}">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
        <div class="con_btnarea" style="display:none">
            <input id="sLeadStatCd" type="hidden"/>
            <input id="sIntrCarlineCd" type="hidden"/>
            <input id="sIntrFscpModtpCd" type="hidden"/>
            <input id="sBhmcYn" type="hidden"/>
            <input id="sHpNo" type="hidden"/>
            <input id="sMngScIdPopup" type="hidden"/>
            <input id="sTraceGradeCd" type="hidden"/>
        </div>
    </section>
    <!-- //content_seach -->
    <c:import url="/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/listJsp/selectSalesOpptProcessMgmtFailList.jsp"></c:import>

    <!-- content_detail -->
     <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h1><spring:message code='crm.menu.failCustomerDB' /> <spring:message code='global.lbl.dtlInfo' /><!-- 잠재고객 DB 상세정보    --></h1>
                    <div class="title_btn">
                        <dms:access viewId="VIEW-D-13128" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="tbtn" id="addActive"><spring:message code="mob.crm.lbl.trace" /><!-- 추적 --></span>
                        </dms:access>
                        <dms:access viewId="VIEW-D-12732" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="tbtn" id="btnUpdate"><spring:message code="par.btn.update" /><!-- 수정 --></span>
                        </dms:access>
                    </div>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code='crm.menu.failCustomerDB' /><spring:message code='global.lbl.dtlInfo' /><!-- 잠재고객 DB 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr id="trLeadStat">
                                    <th scope="row"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></th>
                                    <td>
                                       <div class="tabarea2 tabarea2_v2">
                                            <ul class="tabmenu">
                                                <li class="disabled" style="display:none;"><span>test</span></li>
                                                <dms:access viewId="VIEW-D-12731" hasPermission="${dms:getPermissionMask('READ')}">
                                                <li class="child2" id="liGubun1" style="width:24%;"><span id="btnCtlGotoStep01" style="display:block; word-break:keep-all; white-space:normal; padding:2px; vertical-align:middle;"><spring:message code='crm.lbl.uploadAdds'/></span></li><!-- 업로드 집객-->
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12730" hasPermission="${dms:getPermissionMask('READ')}">
                                                <li class="child2" id="liGubun2" style="width:24%;"><span id="btnCtlGotoStep02" style="display:block; word-break:keep-all; white-space:normal; padding:2px; vertical-align:middle;"><spring:message code='crm.lbl.activeAppointments'/></span></li><!-- 추출예약 -->
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12729" hasPermission="${dms:getPermissionMask('READ')}">
                                                <li class="child2" id="liGubun3" style="width:24%;"><span id="btnCtlGotoStep04Before" style="display:block; word-break:keep-all; white-space:normal; padding:2px; vertical-align:middle;"><spring:message code='crm.lbl.activeProcessings'/></span></li><!-- 추적추진 -->
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12728" hasPermission="${dms:getPermissionMask('READ')}">
                                                <li class="child3 on" id="liGubun4" style="width:24%;"><span id="potenCustFail" style="display:block; word-break:keep-all; white-space:normal; padding:2px; vertical-align:middle;"><spring:message code='crm.lbl.potenCustFails'/></span></li><!-- 잠재고객(실패) -->
                                                </dms:access>
                                                <li class="disabled" style="display:none;"><span>test</span></li>
                                                <input type="hidden" id="btnNextStep" />
                                                <input type="hidden" id="salesOpptSeq" />
                                                <input type="hidden" id="btnStepChange" />
                                                <input type="hidden" id="befLeadStatCd" />
                                                <input type="hidden" id="oldLeadStatCd" />
                                                <input type="hidden" id="mngScIdCtrl" />
                                            </ul>
                                       </div>
                                    </td>
                                </tr>
                                <tr id ="trGubun">
                                    <th scope="row"><spring:message code='global.lbl.examinTp' /><!-- 심사구분 --></th>
                                    <td>
                                        <div class="tabarea2 tabarea2_v2">
                                            <ul class="tabmenu">
                                                <li class="disabled" style="display:none;"><span>test</span></li>
                                                <li id="standByApproval" style="width:49%;"><span><spring:message code='crm.lbl.standByApproval'/></span></li><!-- 심사대기 -->
                                                <dms:access viewId="VIEW-D-12727" hasPermission="${dms:getPermissionMask('READ')}">
                                                <li id="btnCtlRejectSign" style="width:49%;"><span><spring:message code='crm.btn.rejectSign'/></span></li><!-- 불통과 -->
                                                </dms:access>
                                                <li class="disabled" style="display:none;"><span>test</span></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.beforeLeadStat' /><!-- 실패단계 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="befLeadStatNm" name="befLeadStatNm" data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="befLeadStatCd" name="befLeadStatCd"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="trCustNmC">
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="custNm" name="custNm" data-json-obj="true" disabled="disabled" />
                                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" disabled="disabled" />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 이동전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic" id="relCustHpNo" name="relCustHpNo" data-json-obj="true" disabled="disabled" style="width: 55%"/><img src="<c:url value='/resources/img/mob/btn_popphone2.png' />" style="width: 40%" usemap="#001" class="mapImg">
                                            <map name="001">
                                                <dms:access viewId="VIEW-D-12739" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="0,0,38,38" href="#" id="mapTelc" class="mapTel" />
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12738" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="44,0,82,38" id="mapSMS" />
                                                </dms:access>
                                            </map>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code='crm.lbl.corpPurcMng' /><!-- 구매담당자명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="relCustNm" name="relCustNm" data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.examinTp' /><!-- 심사구분 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="evalNm" name="evalNm" data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="evalCd" name="evalCd"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.btn.transType' /><!-- 전출유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="trsfTpNm" name="trsfTpNm" data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic" id="hpNo" name="hpNo" data-json-obj="true" disabled="disabled" style="width: 55%"/><img src="<c:url value='/resources/img/mob/btn_popphone2.png' />" style="width: 40%" usemap="#001" class="mapImg">
                                            <map name="001">
                                                <dms:access viewId="VIEW-D-12737" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="0,0,38,38" href="#" id="mapTel" class="mapTel" />
                                                </dms:access>
                                                <dms:access viewId="VIEW-D-12736" hasPermission="${dms:getPermissionMask('READ')}">
                                                <area shape="rect" coords="44,0,82,38" id="mapSMS" />
                                                </dms:access>
                                            </map>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" ><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mathDocTp" name="mathDocTp" data-json-obj="true" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                                    <td>
                                        <div class="f_text"><input id="ssnCrnNoC" type="text" value="" class="form_input numberandalpha"  disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="bizcondCdC" data-json-obj="true" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionCarline' /><!-- 의향차종 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intrCarlineNm" name="intrCarlineNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.submitDt' /><!-- 제출일 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="submitDtFormat" name="submitDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <th scope="row"><spring:message code='crm.lbl.infoType' /><!-- 리드유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="infoTpNm" name="infoTpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="infoTp" name="infoTp"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.bhmcLeadyn' /></th><!-- BHMC 리드 여부 -->

                                    <td>
                                        <div class="form_left" style="width:16%">
                                            <input  id="bhmcYn" name="bhmcYn" type="checkbox" class="f_check" /><label for="bhmcYn"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.leadSrc' /><!-- 리드출처 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <!-- <input type="text" id="infoPathNm" name="infoPathNm"  data-json-obj="true" disabled="disabled"/> -->
                                            <input type="text" id="holdTpNm" name="holdTpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="holdTp" name="holdTp"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="holdDetlTpSeq" name="holdDetlTpSeq"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.validCheck' /><!-- 유효성판단 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="validGradeNm" name="validGradeNm" data-json-obj="true" disabled="disabled" >
                                            <input type="hidden" id="validGradeCd" name="validGradeCd">
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sex' /><!-- 성별 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="sexNm" name="sexNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.custTp' /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="custTpNm" name="custTpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="custTp" name="custTp"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.prsNm' /><!-- 책임자 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="mngScNm" name="mngScNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="mngScId" name="mngScId"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="beforeMngScId" name="beforeMngScId"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 유선전화 --></th>
                                    <td>
                                        <div class="f_text"><input id="officeTelNoC" type="number" class="form_input numberic"  data-type="tel" disabled="disabled" /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code='global.lbl.telNo' /><!-- 집전화 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="number" class="numberic" id="telNo" name="telNo"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionVariant' /><!-- 의향차관 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intrFscpModtpNm" name="intrFscpModtpNm"  data-json-obj="true" disabled="disabled"/>
                                            <input type="hidden" id="intrFscpModtpCd" name="intrFscpModtpCd"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향색상 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="intrColorNm" name="intrColorNm"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.wechat' /><!-- 위쳇 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="wechatId" name="wechatId"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.visitAppointDt' /><!-- 방문예약시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitResvDt" name="vsitResvDt"  data-json-obj="true" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.visitDt' /><!-- 방문시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitDt" name="vsitDt" data-json-obj="true" disabled="disabled"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.visitCount' /><!-- 방문인원수 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitPrsnCnt" name="vsitPrsnCnt" data-json-obj="true" disabled="disabled"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.revisitYn' /><!-- 재방문여부 --></th>
                                    <td>
                                         <div class="f_text f_disabled">
                                            <input type="text" id="rvsitYn" name="rvsitYn" data-json-obj="true" disabled="disabled"  >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.goOutTime' /><!-- 떠난시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="vsitEndDt" name="vsitEndDt" data-json-obj="true" disabled="disabled"  >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.payMethod' /><!-- 지불방식 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="payTpNm" name="payTpNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expcPurcDateTime' /><!-- 예상구매시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcPurcHmNm" name="expcPurcHmNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.plateNum' /><!-- 현지번호판예정 --></th>
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left" style="width:16%" >
                                                <input id="localCarRegNoYn" name="localCarRegNoYn" type="checkbox" class="f_check" /><label for="localCarRegNoYn"></label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.estimateInfo' /><!-- 견적정보 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input id="estimateCont" type="text" name="estimateCont" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.promotionCont' /><!-- 판촉내용 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="salesCont" name="salesCont" data-json-obj="true" disabled="disabled" >
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.activeGrade' /><!-- 추적등급 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="traceGradeNm" name="traceGradeNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.invalidReason' /><!-- 무효원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="invalidCauNm" name="invalidCauNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.failReason' /><!-- 전패원인 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="failCauNm" name="failCauNm" data-json-obj="true" disabled="disabled" >
                                            <input type="hidden" id="failCauCd" name="failCauCd" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.failReasonAly' /><!-- 전패원인분석 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="failCauReasonCont" name="failCauReasonCont" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.purchaSelCarline' /><!-- 구매선택차종 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="purcSelCarlineNm" name="purcSelCarlineNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.purchaSelVariant' /><!-- 구매선택차관 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="purcFscpModtpNm" name="purcFscpModtpNm" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expcPurcDt' /><!-- 예상구매일 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcPurcDt" name="expcPurcDt" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expcBpPrice' /><!-- 예상거래가격 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="expcDealPrc" name="expcDealPrc" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>

                                <!-- 추적시간 -->
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.traceDt' /><!-- 추적시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="traceDtFormat" name="traceDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <!-- 다음추적시간 -->
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.nextTraceDt' /><!-- 다음추적시간 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="nextTraceDtFormat" name="nextTraceDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <!-- 신규날짜 -->
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.newRegDt' /><!-- 신규날짜--></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="regDtFormat" name="regDtFormat" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.remark' /><!-- 비고설명 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input type="text" id="remark" name="remark" data-json-obj="true" disabled="disabled" >
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <input type="hidden" id="seq" name="seq" data-json-obj="true" />
                        <iframe id="addressList" class="addressList" border="0" frameborder="0" style="display:none;"></iframe>
                    </div>

                </div>
            </div>

            <!-- 버튼 set -->
            <div class="con_btnarea">
            <dms:access viewId="VIEW-D-13129" hasPermission="${dms:getPermissionMask('READ')}">
                <div><span class="btnd1" id="btnClose"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </dms:access>
            </div>

            <input type="hidden" id="leadStatCd" value="" />
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>

</section>

<script type="text/javascript">
<!--

var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var toDt    = "${toDt}";
var fromDt    = "${fromDt}";
var mngScIdCtrl = "${mngScIdCtrl}";

var pageMode = "insert"; //update

var fromTodoCustNo = "${custNo}";
var fromTodoLeadStatCd = "${leadStatCd}";
var salesOpptPwYn = "${salesOpptPwYn}";

var selectedItem = null;

var addrTpList = [];
var addrTpMap = [];
var yesOrNoList = [];
var yesOrNoMap = [];
var carlineCdList = [];
var carlineCdMap = [];
var mngScIdList = [];
var mngScIdMap = [];
var infoPathCdList = [];
var infoPathCdMap = [];

var leadStatCdList = [];
var befLeadStatCdList = [];
var leadStatCdMap = [];
var modelCdList = [];
var modelCdMap = [];
var activeGradeCdList = [];
var activeGradeCdMap = [];
var failedCdList = [];
var failedCdMap = [];

var holdTpList = [];
var holdTpMap = [];

var infoTpList = [];
var bizcondCdList   = [];
var mathDocTpList = [];

var newCustPopupWindow;
var btnGubun = "";
var cSeq = "";
var status = "";

<c:forEach var="obj" items="${infoTpList}">
    infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${leadStatCdList}">
<c:if test="${obj.remark1 == 'F'}">
    leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:if>
</c:forEach>

<c:forEach var="obj" items="${leadStatCdList}">
<c:if test="${obj.remark1 == 'S'}">
    befLeadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>

<c:forEach var="obj" items="${activeGradeCdList}">
    activeGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${infoPathCdList}">
    infoPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    infoPathCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${holdTpList}">
    holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${mngScIdList}">
    mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    mngScIdMap["${obj.usrId}"] = "${obj.usrNm}";
</c:forEach>



yesOrNoList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
yesOrNoList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
yesOrNoMap["Y"] = "<spring:message code='global.lbl.yes' />";
yesOrNoMap["N"] = "<spring:message code='global.lbl.n' />";

<c:forEach var="obj" items="${addrTpList}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종조회
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//실패사유
<c:forEach var="obj" items="${failedCdList}">
    failedCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    failedCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${mathDocTpList}">
//<c:if test="${obj.remark1 == 'C'}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
//</c:if>
</c:forEach>

<c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {
    $("#sSubmitDtFrom").val("${towMonFromDt}");
    $("#sSubmitDtTo").val("${toDt}");

    // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });

    // 책임자
    $("#sMngScId").kendoExtDropDownList({
        dataTextField:"usrNm"
       ,dataValueField:"usrId"
       ,dataSource:mngScIdList
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

 // 리드출처
    $("#sInfoPathCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:dms.data.cmmCdFilter(infoPathCdList)
        , index:0
    });

    $("#sHoldTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:"<spring:message code='global.lbl.check'/>"
         , dataSource:dms.data.cmmCdFilter(holdTpList)
     });


   // 리드상태
    $("#sLeadStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
        , dataSource:dms.data.cmmCdFilter(leadStatCdList)
        , index:0
    });

    // 실패단계
    $("#sBefLeadStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:dms.data.cmmCdFilter(befLeadStatCdList)
        , index:0
    });

    // 리드유형
    $("#sInfoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , dataSource:infoTpList
    });

    /**
     * 차종 콤보박스
     */
    $("#sIntrCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carlineCdList
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
       ,select:onSelectSearchCarlineCd
    });

    /**
     * 모델 콤보박스
     */
     $("#sIntrFscpModtpCd").kendoExtDropDownList({
         dataTextField:"modelNm"
        ,dataValueField:"modelCd"
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
     });
     $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(false);

     // BHMC 리드 여부
      $("#sBhmcYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
         , dataSource:yesOrNoList
         , index:0
     });

     $("#sMngScIdPopup").kendoExtDropDownList({
         dataTextField:"usrNm"
        ,dataValueField:"usrId"
        ,dataSource:mngScIdList
        , index:0
     });

     $("#sTraceGradeCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:"<spring:message code='global.lbl.check'/>"   // 전체
         , dataSource:dms.data.cmmCdFilter(activeGradeCdList)
     });

     $("#mathDocTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:"<spring:message code='global.lbl.check'/>"
         , dataSource:mathDocTpList
         , index:0
         , enable:true
     });

     $("#bizcondCdC").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         , optionLabel:"<spring:message code='global.lbl.check'/>"
         , dataSource:dms.data.cmmCdFilter(bizcondCdList)
         , index:0
         , enable:true
     });

     /********************************************************************************************************************************************************/

    // 타이틀
    $("#header_title").html("<spring:message code='crm.menu.failCustomerDB' />"); //잠재고객 DB
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

     var sStartRegDt = $("#sSubmitDtFrom").val();
     var sEndRegDt = $("#sSubmitDtTo").val();

     // 실패 조회
     onSelectBtnStepClick('btnStep09');

     if(fromTodoCustNo.length > 0){
     }else{
         listData.read();
     }
     // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initList();
            listData.read();
        }
    });


     //버튼-닫기
     $("#btnClose").click(function(){
         contentListNonRefresh();
     });

     if ( dms.string.isNotEmpty(fromTodoCustNo)){
         contentDetailFromTodo(fromTodoCustNo,fromTodoLeadStatCd);
     };

     //추적이력 추가
     $("#addActive").click(function(){

         var mngScIdCtrl = "${mngScIdCtrl}";

         if(status == "btnStep09"){
             if (mngScIdCtrl == "N") {
                 // 권한이 없습니다.
                    mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                    return false;
             }
         }

         activeAddPop();
     });

     $("#mapSMS").click(function(){
         sendSMSPopup();
     });

     $("#btnCtlGotoStep01").click(function(){
         var custNo = selectedItem.custNo
         , seq = selectedItem.seq
         , leadStatCd = selectedItem.leadStatCd
         , exhvFlakSeq = selectedItem.exhvFlakSeq
         , dataTable = selectedItem.dataTable
         , mngScId = selectedItem.mngScId
         , beforeMngScId = selectedItem.beforeMngScId
         , infoTp = selectedItem.infoTp
         , holdTp = selectedItem.holdTp
         ;

         var loginUsrId = "${loginUsrId}";
         var mngScIdCtrl = "${mngScIdCtrl}";

         if (mngScIdCtrl == "N") {
             //if (loginUsrId != mngScId) {
              // 활성화 할 수 있는 권한이 없습니다. <br> 본인것만 가능합니다.
                 mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                 return false;
             //}
         }


         var url;
         var heightVal = "400";
         var title = "";

         url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";

         editCustPopupWindow = mob.window.popup({
             windowId:"selectEditStep09SalesOpptProcessPopup"
             , content:{
                 url:url
                 , data:{
                     "autoBind":true
                     , "leadType":"01"
                     , "leadStatCd":leadStatCd
                     , "befLeadStatCd":befLeadStatCd
                     , "custNo":custNo
                     , "salesOpptSeq":seq
                     , "showRoomSeq":seq
                     , "exhvFlakSeq":exhvFlakSeq
                     , "dataTable":dataTable
                     , "title":"crm.menu.failCustomerDB"
                     , "callbackFunc":function(data) {

                         if (data[0] != "") {
                             $("#btnSearch").click();
                         }
                     }
                 }
             }
         });
     });
     $("#btnCtlGotoStep02").click(function(){
         var custNo = selectedItem.custNo
         , seq = selectedItem.seq
         , leadStatCd = selectedItem.leadStatCd
         , exhvFlakSeq = selectedItem.exhvFlakSeq
         , dataTable = selectedItem.dataTable
         , mngScId = selectedItem.mngScId
         , beforeMngScId = selectedItem.beforeMngScId
         , infoTp = selectedItem.infoTp
         , holdTp = selectedItem.holdTp
         ;

         var loginUsrId = "${loginUsrId}";
         var mngScIdCtrl = "${mngScIdCtrl}";

         if (mngScIdCtrl == "N") {
             //if (loginUsrId != mngScId) {
              // 활성화 할 수 있는 권한이 없습니다. <br> 본인것만 가능합니다.
                 mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                 return false;
             //}
         }

         var url;
         var heightVal = "400";
         var title = "";

         url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";

         editCustPopupWindow = mob.window.popup({
             windowId:"selectEditStep09SalesOpptProcessPopup"
             , content:{
                 url:url
                 , data:{
                     "autoBind":true
                     , "leadType":"02"
                     , "leadStatCd":leadStatCd
                     , "befLeadStatCd":befLeadStatCd
                     , "custNo":custNo
                     , "salesOpptSeq":seq
                     , "showRoomSeq":seq
                     , "exhvFlakSeq":exhvFlakSeq
                     , "dataTable":dataTable
                     , "callbackFunc":function(data) {
                         if (data[0] != "") {
                             $("#btnSearch").click();
                         }
                     }
                 }
             }
         });
     });
     $("#btnCtlGotoStep04Before").click(function(){
         var custNo = selectedItem.custNo
         , seq = selectedItem.seq
         , leadStatCd = selectedItem.leadStatCd
         , exhvFlakSeq = selectedItem.exhvFlakSeq
         , dataTable = selectedItem.dataTable
         , mngScId = selectedItem.mngScId
         , beforeMngScId = selectedItem.beforeMngScId
         , infoTp = selectedItem.infoTp
         , holdTp = selectedItem.holdTp
         , validGradeCd = selectedItem.validGradeCd
         ;

         var loginUsrId = "${loginUsrId}";
         var mngScIdCtrl = "${mngScIdCtrl}";
         var oldLeadStatCd = $("#befLeadStatCd").val();


         if(status == "btnStep09"){
             if (mngScIdCtrl == "N") {
                  // 활성화 할 수 있는 권한이 없습니다. <br> 본인것만 가능합니다.
                     mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                     return false;
             }
         }else{
             if (mngScIdCtrl == "N") {
                 if (loginUsrId != mngScId) {
                  // 활성화 할 수 있는 권한이 없습니다. <br> 본인것만 가능합니다.
                     mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                     return false;
                 }
             }
         }

         if (oldLeadStatCd != "04") {
             // 이전 단계가 추적추진 단계가 아닙니다. <br> 이 단계로 진행 할 수 없습니다.
             mob.notification.info("<spring:message code='crm.info.cannotThisStep'/>");
             return false;
         }

         var url;
         var heightVal = "400";
         var title = "";

         url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";

         editCustPopupWindow = mob.window.popup({
             windowId:"selectEditStep09SalesOpptProcessPopup"
             , content:{
                 url:url
                 , data:{
                     "autoBind":true
                     , "leadType":"04"
                     , "leadStatCd":leadStatCd
                     , "befLeadStatCd":befLeadStatCd
                     , "custNo":custNo
                     , "salesOpptSeq":seq
                     , "showRoomSeq":seq
                     , "exhvFlakSeq":exhvFlakSeq
                     , "validGradeCd":validGradeCd
                     , "dataTable":dataTable
                     , "callbackFunc":function(data) {

                         if (data[0] != "") {
                             $("#btnSearch").click();
                         }
                     }
                 }
             }
         });
     });

     $("#btnCtlRejectSign").click(function(){
         var custNo = $("#custNo").val();
         var mngScId = $("#mngScId").val();
         var beforeMngScId = $("#beforeMngScId").val();

         var infoTp = $("#infoTp").val();
         var holdTp = $("#holdTp").val();

         var mngScIdCtrl = "${mngScIdCtrl}";

         if (mngScIdCtrl == "N") {
             // 권한이 없습니다.
                mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
                return false;
         }

         // 20170515 hg
         if ($("#befLeadStatCd").val() != "02"
             && $("#befLeadStatCd").val() != "04") {
             mob.notification.info("<spring:message code='crm.info.cannotPrevStep' /> ");
             return false;
         }

         var salesOpptProcParam = {};
         salesOpptProcParam["leadStatCd"] = $("#befLeadStatCd").val();
         //salesOpptProcParam["befLeadStatCd"] = $("#befLeadStatCd").val(); //주의 실재 이전 단계가 아니라 지금 단계입니다. 서비스에서 단계 이력을 남기기 위한 용도임.
         //salesOpptProcParam["evalCd"] = "02";   // 심사대기(01), 불통과(02)
         salesOpptProcParam["evalCd"] = "01";   // 심사대기(01), 불통과(02)

         salesOpptProcParam["seq"] = $("#seq").val();
         salesOpptProcParam["mngScId"] = mngScId;



         $.ajax({
             url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/updateSalesOpptProcessMgmt.do' />"
             ,data:JSON.stringify(salesOpptProcParam)
             ,type:'POST'
             ,dataType:'json'
             ,contentType:'application/json'
             ,error:function(jqXHR,status,error){
                 console.log("error !!!");
                 mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 mob.loading.hide();
                 //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
             },
             success:function(result){
                 mob.loading.hide();


                 $("#formarea").show();

                 mob.notification.success("<spring:message code='global.info.success'/>");

                 var data = [];
                 data.push(result);
                 $("#btnSearch").click();
                 //options.callbackFunc(data);
                 //editCustPopupWindow.close();

             }
         }).done(function(result) {

             $("#formarea").show();
         });

     });


});



//end document ready
 /** [조회조건 영역] ComboBox Select() **/
 // 차종에 따른 모델검색
function onSelectSearchCarlineCd(e){
    $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(true);

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sIntrFscpModtpCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });
    $("#sIntrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
}

function onSelectBtnStepClick(selStep){

     status = selStep;

     var btnStep = selStep;

     if ( dms.string.isEmpty(btnStep)){
         btnStep = $("#stepDiv").children("ul").children("li").eq(0).attr('id');
     }
     var leadStatCd = btnStep.substring(btnStep.length-2,btnStep.length);

     $("#sLeadStatCd").data("kendoExtDropDownList").value(leadStatCd);
     $("#leadStatCd").val(leadStatCd);

     btnGubun = selStep;

     if (selStep == "btnStep08") {
         $("#btnStep09 span").css("background-color","#b4b6bc");
         $("#btnStep09 span").css("border-color","#b4b6bc");
         $("#btnStep08 span").css("background-color","#0052a6");
         $("#btnStep08 span").css("border-color","#0052a6");
         $("#befNTransStat").text("<spring:message code='crm.lbl.transStat'/>");
         $("#gubun").text("<spring:message code='crm.lbl.activeGrade' />");
     } else {
         $("#btnStep09 span").css("background-color","#0052a6");
         $("#btnStep09 span").css("border-color","#0052a6");
         $("#btnStep08 span").css("background-color","#b4b6bc");
         $("#btnStep08 span").css("border-color","#b4b6bc");
         $("#befNTransStat").text("<spring:message code='crm.lbl.beforeLeadStat'/>");
         $("#gubun").text("<spring:message code='global.lbl.examinTp' />");
     }
     if (btnStep == "btnStep00") {
         $("#sLeadStatCd").data("kendoExtDropDownList").enable(true);
     } else {
         $("#sLeadStatCd").data("kendoExtDropDownList").enable(false);
     }
      // 조회 권한에 따라 sMngScId 컬럼을 활성화 / 비활성화
     ///var mngScIdCtrl = "${mngScIdCtrl}";
     $("#btnSearch").click();
}

//상세페이지
function contentDetailFromTodo(_fromTodoCustNo, _fromTodoLeadStatCd) {
     $("#content_list").css("display","none");
     $("#content_search").css("display","none");
     $("#content_detail").css("display","block");

     $("#header_title span").removeAttr("class");
     var pageIndex = 0, pageSize = 100;
     var rowIndex = 0, rowTotal = 1000;
     var params = {};
     params["firstIndex"] = 0;
     params["lastIndex"] = 100;

     params["sCustNo"] = _fromTodoCustNo;

     var dataItem ={};
     $.ajax({
         url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
         ,data:JSON.stringify(params)
         ,type:'POST'
         ,dataType:'json'
         ,contentType:'application/json'
         ,error:function(jqXHR, status, error) {
             //parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
             //app.hideLoading();
         }
         ,success:function(result) {
             if(result.data!=null){
                 dataItem=result.data[0];
                 $("#leadStatNm").val(dataItem.leadStatNm); //리드상태
                 $("#befLeadStatCd").val(dataItem.befLeadStatCd);
                 $("#befLeadStatNm").val(dataItem.befLeadStatNm); //실패단계
                 $("#beforeMngScId").val(dataItem.mngScId);
                 $("#evalNm").val(dataItem.evalNm); //심사구분
                 $("#evalCd").val(dataItem.evalCd);
                 $("#trsfTpNm").val(dataItem.trsfTpNm); //전출유형
                 $("#custNm").val(dataItem.custNm);
                 $("#custNo").val(dataItem.custNo);
                 $("#hpNo").val(dataItem.hpNo);
                 $("#custTpNm").val(dataItem.custTpNm);
                 $("#custTp").val(dataItem.custTp);
                 $("#mngScId").val(dataItem.mngScId);
                 $("#mngScNm").val(dataItem.mngScNm);
                 $("#relCustNm").val(dataItem.purcMngNm);
                 $("#relCustHpNo").val(dataItem.hpNo);
                 try{
                     var userAgent = navigator.userAgent.toLowerCase();
                     if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
                         || (userAgent.search("ipad") > -1))
                     {
                         $(".mapTel").attr("href","telprompt://"+dataItem.hpNo);
                     }else
                     {
                         $(".mapTel").attr("href","tel:"+dataItem.hpNo);
                     }
                 }catch(e){

                 }
                 $("#telNo").val(dataItem.telNo);
                 $("#intrCarlineNm").val(dataItem.intrCarlineNm);
                 $("#intrFscpModtpCd").val(dataItem.intrFscpModtpCd);
                 $("#intrFscpModtpNm").val(dataItem.intrFscpModtpNm);
                 $("#intrColorNm").val(dataItem.intrColorNm);
                 $("#infoTpNm").val(dataItem.infoTpNm);
                 $("#infoTp").val(dataItem.infoTp);

                 $("#bhmcYn").val(dataItem.bhmcYn);
                 $("#holdTpNm").val(dataItem.holdTpNm);
                 $("#holdDetlTpSeq").val(dataItem.holdDetlTpSeq);
                 $("#holdTp").val(dataItem.holdTp);
                 $("#sexNm").val(dataItem.sexNm);
                 $("#wechatId").val(dataItem.wechatId);
                 $("#vsitResvDt").val(kendo.toString(dataItem.vsitResvDt, '<dms:configValue code='dateFormat' /> HH:mm'));
                 $("#vsitDt").val(kendo.toString(dataItem.vsitDt, '<dms:configValue code='dateFormat' /> HH:mm') );
                 $("#vsitPrsnCnt").val(dataItem.vsitPrsnCnt);
                 $("#rvsitYn").val(yesOrNoMap[dataItem.rvsitYnNm]);
                 $("#vsitEndDt").val(kendo.toString(dataItem.vsitEndDt, '<dms:configValue code='dateFormat' /> HH:mm') );
                 $("#payTpNm").val(dataItem.payTpNm);
                 $("#expcPurcHmNm").val(dataItem.expcPurcHmNm);
                 $("#natNofScheNo").val(dataItem.natNofScheNo);
                 $("#estimateCont").val(dataItem.estimateCont);
                 $("#salesCont").val(dataItem.salesCont);
                 $("#remark").val(dataItem.remark);
                 $("#traceGradeNm").val(dataItem.traceGradeNm);
                 $("#validGradeNm").val(dataItem.validGradeNm);
                 $("#validGradeCd").val(dataItem.validGradeCd);
                 $("#invalidCauNm").val(dataItem.invalidCauNm);
                 $("#failCauCd").val(dataItem.failCauCd);
                 $("#failCauNm").val(dataItem.failCauNm);
                 $("#failCauReasonCont").val(dataItem.failCauReasonCont);
                 $("#purcSelCarlineNm").val(dataItem.purcSelCarlineNm);
                 $("#purcFscpModtpNm").val(dataItem.purcFscpModtpNm);
                 $("#expcPurcDt").val(kendo.toString(dataItem.expcPurcDt, '<dms:configValue code='dateFormat' />'));
                 $("#expcDealPrc").val(dataItem.expcDealPrc);

                 $("#emailNm").val(dataItem.emailNm);
                 $("#intrCarlineCd").val(dataItem.intrCarlineCd);
                 $("#intrColorCd").val(dataItem.intrColorCd);
                 $("#intrFscpModtpCd").val(dataItem.intrFscpModtpCd);
                 $("#payTp").val(dataItem.payTp);
                 $("#sexCd").val(dataItem.sexCd);
                 $("#trsfTp").val(dataItem.trsfTp);
                 $("#exhvFlakSeq").val(dataItem.exhvFlakSeq);


                 //추적시간, 다음추적시간, 등록일, 수정일
                 $("#traceDtFormat").val(chgDateFormat(dataItem.traceDt));
                 $("#nextTraceDtFormat").val(chgDateFormat(dataItem.nextTraceDt));
                 $("#regDtFormat").val(chgDateFormat(dataItem.regDt));
                 $("#submitDtFormat").val(chgDateFormat(dataItem.submitDt));
                 /* $("#updtDtFormat").val(chgDateFormat(dataItem.updtDt)); */

                 $("#seq").val(dataItem.seq);

                 $("#mathDocTp").data("kendoExtDropDownList").value(dataItem.mathDocTp);
                 $("#ssnCrnNoC").val(dataItem.ssnCrnNo);
                 $("#bizcondCdC").data("kendoExtDropDownList").value(dataItem.bizcondCd);
                 $("#officeTelNoC").val(dataItem.telNo);

                 /* if (dataItem.localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true); };
                 if (dataItem.bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true); };
                  */

                 if (dataItem.localCarRegNoYn == 'Y'){
                     $("#localCarRegNoYn").attr("checked", true);
                     $("#localCarRegNoYn").attr("disabled","disabled");
                 } else {
                     $("#localCarRegNoYn").attr("checked", false);
                     $("#localCarRegNoYn").attr("disabled","disabled");
                 }

                 if (dataItem.bhmcYn== 'Y'){
                     $("#bhmcYn").attr("checked", true);
                     $("#bhmcYn").attr("disabled","disabled");
                 } else {
                     $("#bhmcYn").attr("checked", false);
                     $("#bhmcYn").attr("disabled","disabled");
                 }

                 //추적기록 리스트
                 //$("#activeHistoryList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmtList.do' />");
                 //최근통화기록 리스트
                 //$("#leadStatusExchangeList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHistList.do' />");

                 var leadStatCd=$("#leadStatCd").val();
                 if(leadStatCd =="01"){
                     $("#trLeadStat li:nth-child(1)").addClass("disabled");
                     $("#trLeadStat li:nth-child(2)").addClass("disabled");
                     $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.uploadAdd' />");
                     $("#trLeadStat li:nth-child(4)").removeClass("disabled");
                 }else if(leadStatCd =="02"){
                     $("#trLeadStat li:nth-child(1)").removeClass("disabled");
                     $("#trLeadStat li:nth-child(1) > span").html("<spring:message code='mob.crm.lbl.failedCustomer' />");
                     $("#trLeadStat li:nth-child(2)").addClass("disabled");
                     $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.activeAppointment' />");
                     $("#trLeadStat li:nth-child(4)").removeClass("disabled");
                 }else if(leadStatCd =="03"){
                     $("#trLeadStat li:nth-child(1)").removeClass("disabled");
                     //$("#trLeadStat li:nth-child(1) > span").html("◁");
                     $("#trLeadStat li:nth-child(2)").addClass("disabled");
                     $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.visitCounsel' />");
                     $("#trLeadStat li:nth-child(4)").removeClass("disabled");
                 }else if(leadStatCd =="04"){
                     $("#trLeadStat li:nth-child(1)").removeClass("disabled");
                     $("#trLeadStat li:nth-child(1) > span").html("<spring:message code='mob.crm.lbl.failedCustomer' />");
                     $("#trLeadStat li:nth-child(2)").removeClass("disabled");
                     $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.activeProcessing' />");
                     //$("#trLeadStat li:nth-child(4)").attr("class","disabled");
                 }

                 if ($("#custTp").val() == "01") {
                     $(".crop").hide();
                     $(".person").show();
                     $('#trCustNmC > th').html('<spring:message code="global.lbl.custNm" />');
                     $("#hpNo").parent().addClass("f_disabled");
                     $("#hpNo" ).prop('readonly', true);
                     /* $("#officeTelNo").parent().removeClass('f_disabled');
                     $("#officeTelNo" ).prop('readonly', false); */
                 } else {
                     $(".crop").show();
                     $(".person").hide();
                     $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
                     $("#officeTelNoC").parent().addClass("f_disabled");
                     $("#officeTelNoC" ).prop('readonly', true);
                     $("#hpNo").parent().removeClass('f_disabled');
                     $("#hpNo" ).prop('readonly', false);
                 }

                 $(".mapImg").height($(".f_text").height()*0.9);
                 $(".mapImg").width($(".f_text").height()*2.1);

                 setHeaderTitle();

             }else{

             }

         }
     });
}

//상세페이지
function fnContentDetail(dataItem) {
     console.log(dataItem);
     selectedItem = dataItem;
     cSeq = dataItem.cSeq;

     $("#leadStatNm").val(dataItem.leadStatNm); //리드상태
     $("#befLeadStatCd").val(dataItem.befLeadStatCd);
     $("#befLeadStatNm").val(dataItem.befLeadStatNm); //실패단계
     $("#beforeMngScId").val(dataItem.mngScId);
     $("#evalNm").val(dataItem.evalNm); //심사구분
     $("#evalCd").val(dataItem.evalCd);
     $("#trsfTpNm").val(dataItem.trsfTpNm); //전출유형
     $("#custNm").val(dataItem.custNm);
     $("#custNo").val(dataItem.custNo);
     $("#hpNo").val(dataItem.hpNo);
     $("#custTpNm").val(dataItem.custTpNm);
     $("#custTp").val(dataItem.custTp);
     $("#mngScId").val(dataItem.mngScId);
     $("#mngScNm").val(dataItem.mngScNm);
     $("#relCustNm").val(dataItem.purcMngNm);
     $("#relCustHpNo").val(dataItem.hpNo);
     try{
         var userAgent = navigator.userAgent.toLowerCase();
         if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
             || (userAgent.search("ipad") > -1)){
             $(".mapTel").attr("href","telprompt://"+dataItem.hpNo);
         }else{
             $(".mapTel").attr("href","tel:"+dataItem.hpNo);
         }
     }catch(e){

     }
     $("#telNo").val(dataItem.telNo);
     $("#intrCarlineNm").val(dataItem.intrCarlineNm);
     $("#intrFscpModtpCd").val(dataItem.intrFscpModtpCd);
     $("#intrFscpModtpNm").val(dataItem.intrFscpModtpNm);
     $("#intrColorNm").val(dataItem.intrColorNm);
     $("#infoTpNm").val(dataItem.infoTpNm);
     $("#infoTp").val(dataItem.infoTp);

     $("#bhmcYn").val(dataItem.bhmcYn);
     $("#holdTpNm").val(dataItem.holdTpNm);
     $("#holdDetlTpSeq").val(dataItem.holdDetlTpSeq);
     $("#holdTp").val(dataItem.holdTp);
     $("#sexNm").val(dataItem.sexNm);
     $("#wechatId").val(dataItem.wechatId);
     $("#vsitResvDt").val(kendo.toString(dataItem.vsitResvDt, '<dms:configValue code='dateFormat' /> HH:mm'));
     $("#vsitDt").val(kendo.toString(dataItem.vsitDt, '<dms:configValue code='dateFormat' /> HH:mm') );
     $("#vsitPrsnCnt").val(dataItem.vsitPrsnCnt);
     $("#rvsitYn").val(dataItem.rvsitYnNm);
     $("#vsitEndDt").val(kendo.toString(dataItem.vsitEndDt, '<dms:configValue code='dateFormat' /> HH:mm') );
     $("#payTpNm").val(dataItem.payTpNm);
     $("#expcPurcHmNm").val(dataItem.expcPurcHmNm);
     $("#natNofScheNo").val(dataItem.natNofScheNo);
     $("#estimateCont").val(dataItem.estimateCont);
     $("#salesCont").val(dataItem.salesCont);
     $("#remark").val(dataItem.remark);
     $("#traceGradeNm").val(dataItem.traceGradeNm);
     $("#validGradeNm").val(dataItem.validGradeNm);
     $("#validGradeCd").val(dataItem.validGradeCd);
     $("#invalidCauNm").val(dataItem.invalidCauNm);
     $("#failCauCd").val(dataItem.failCauCd);
     $("#failCauNm").val(dataItem.failCauNm);
     $("#failCauReasonCont").val(dataItem.failCauReasonCont);
     $("#purcSelCarlineNm").val(dataItem.purcSelCarlineNm);
     $("#purcFscpModtpNm").val(dataItem.purcFscpModtpNm);
     $("#expcPurcDt").val(kendo.toString(dataItem.expcPurcDt, '<dms:configValue code='dateFormat' />'));
     $("#expcDealPrc").val(dataItem.expcDealPrc);

     $("#emailNm").val(dataItem.emailNm);
     $("#intrCarlineCd").val(dataItem.intrCarlineCd);
     $("#intrColorCd").val(dataItem.intrColorCd);
     $("#intrFscpModtpCd").val(dataItem.intrFscpModtpCd);
     $("#payTp").val(dataItem.payTp);
     $("#sexCd").val(dataItem.sexCd);
     $("#trsfTp").val(dataItem.trsfTp);
     $("#exhvFlakSeq").val(dataItem.exhvFlakSeq);


     //추적시간, 다음추적시간, 등록일, 수정일
     $("#traceDtFormat").val(chgDateFormat(dataItem.traceDt));
     $("#nextTraceDtFormat").val(chgDateFormat(dataItem.nextTraceDt));
     $("#regDtFormat").val(chgDateFormat(dataItem.regDt));
     $("#submitDtFormat").val(chgDateFormat(dataItem.submitDt));

     $("#seq").val(dataItem.seq);

     $("#mathDocTp").data("kendoExtDropDownList").value(dataItem.mathDocTp);
     $("#ssnCrnNoC").val(dataItem.ssnCrnNo);
     $("#bizcondCdC").data("kendoExtDropDownList").value(dataItem.bizcondCd);
     $("#officeTelNoC").val(dataItem.telNo);

     if (dataItem.localCarRegNoYn == 'Y'){
         $("#localCarRegNoYn").attr("checked", true);
         $("#localCarRegNoYn").attr("disabled","disabled");
     } else {
         $("#localCarRegNoYn").attr("checked", false);
         $("#localCarRegNoYn").attr("disabled","disabled");
     }

     if (dataItem.bhmcYn== 'Y'){
         $("#bhmcYn").attr("checked", true);
         $("#bhmcYn").attr("disabled","disabled");
     } else {
         $("#bhmcYn").attr("checked", false);
         $("#bhmcYn").attr("disabled","disabled");
     }

     var leadStatCd=$("#leadStatCd").val();
     if(leadStatCd =="01"){
         $("#trLeadStat li:nth-child(1)").addClass("disabled");
         $("#trLeadStat li:nth-child(2)").addClass("disabled");
         $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.uploadAdd' />");
         $("#trLeadStat li:nth-child(4)").removeClass("disabled");
     }else if(leadStatCd =="02"){
         $("#trLeadStat li:nth-child(1)").removeClass("disabled");
         $("#trLeadStat li:nth-child(1) > span").html("<spring:message code='mob.crm.lbl.failedCustomer' />");
         $("#trLeadStat li:nth-child(2)").addClass("disabled");
         $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.activeAppointment' />");
         $("#trLeadStat li:nth-child(4)").removeClass("disabled");
     }else if(leadStatCd =="03"){
         $("#trLeadStat li:nth-child(1)").removeClass("disabled");
         $("#trLeadStat li:nth-child(2)").addClass("disabled");
         $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.visitCounsel' />");
         $("#trLeadStat li:nth-child(4)").removeClass("disabled");
     }else if(leadStatCd =="04"){
         $("#trLeadStat li:nth-child(1)").removeClass("disabled");
         $("#trLeadStat li:nth-child(1) > span").html("<spring:message code='mob.crm.lbl.failedCustomer' />");
         $("#trLeadStat li:nth-child(2)").removeClass("disabled");
         $("#trLeadStat li:nth-child(3) > span").html("<spring:message code='crm.lbl.activeProcessing' />");
     }

     if ($("#custTp").val() == "01") {
         $(".crop").hide();
         $(".person").show();
         $('#trCustNmC > th').html('<spring:message code="global.lbl.custNm" />');
         $("#hpNo").parent().addClass("f_disabled");
         $("#hpNo" ).prop('readonly', true);
     } else {
         $(".crop").show();
         $(".person").hide();
         $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
         $("#officeTelNoC").parent().addClass("f_disabled");
         $("#officeTelNoC" ).prop('readonly', true);
         $("#hpNo").parent().removeClass('f_disabled');
         $("#hpNo" ).prop('readonly', false);
     }

     $(".mapImg").height($(".f_text").height()*0.9);
     $(".mapImg").width($(".f_text").height()*2.1);

     if(btnGubun == "btnStep09"){
         $("#liGubun1").show();
         $("#liGubun2").show();

         $("#liGubun1").css('width', "24%" );
         $("#liGubun2").css('width', "24%" );
         $("#liGubun3").css('width', "24%" );
         $("#liGubun4").css('width', "24%" );

         $("#btnCtlGotoStep04Before").css('padding', "2px");
         $("#potenCustFail").css('padding', "2px");

         $("#trGubun").show();
     }else{
         $("#liGubun1").hide();
         $("#liGubun2").hide();

         $("#liGubun3").css('width', "49%" );
         $("#btnCtlGotoStep04Before").css('padding', "");
         $("#liGubun4").css('width', "49%" );
         $("#potenCustFail").css('padding', "");

         $("#trGubun").hide();
     }

     setHeaderTitle();
     mob.loading.hide();
}
chgDateFormat = function(val){
    var returnVal;
    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm');
    }else{
        returnVal = '';
    }
    return returnVal;
}


function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
}

function setHeaderTitle() {
    var lsCd = $("#leadStatCd").val();
    if (lsCd == "09") {
        $("#potenCustFail").html("<spring:message code='crm.lbl.potenCustFails'/>");
    } else if (lsCd == "08") {
        $("#potenCustFail").html("<spring:message code='crm.lbl.potenCustTranss'/>");
    }

    var evalCd = $("#evalCd").val();
    if (evalCd == "02") {
        $("[id^='btnCtlRejectSign']").attr("class", "child3 on");
        $("[id^='standByApproval']").attr("class", "child2");
    } else {
        $("[id^='standByApproval']").attr("class", "child3 on");
        $("[id^='btnCtlRejectSign']").attr("class", "child2");
    }
}

//주소팝업
/* var zipCodeSearchPopupWin ;
function zipcodeSearchPop(callbackAddr){
     zipCodeSearchPopupWin = mob.window.popup({
     windowId:"zipCodeSearchPopupMain"
     , content:{
         url:"<c:url value='/mob/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
         , data:{
                       "autoBind":false
                       ,"usrNm":""
                       , "callbackFunc":function(data){
                           if (data != null || data != 'undefined') {
                                callbackAddr(data);
                           }
                       }
                   }
               }
     });
 } */

 //고객검색 팝업
var popupWindow;
function custSearchPop(callbackCust,custNm){
     popupWindow = mob.window.popup({
         windowId:"customerSearchPopupMain"
         , content:{
             url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
             , data:{
                 "autoBind":false
                 , "custNm":custNm
                 , "type"  :null
                 , "callbackFunc":function(data){
                     if (data != null) {
                         callbackCust(data);
                     }
                 }
             }
         }
     });
}

//todo 링크
function fn_popuplink(){
    var url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do'/>";
    var heightVal = "400";
    var title = "";
    var leadType = "${befLeadStatCd}";
    if (leadType == "01" || leadType == "02" || leadType == "04") {

        editCustPopupWindow = mob.window.popup({
            windowId:"selectEditStep09SalesOpptProcessPopup"
            , content:{
                url:url
                , data:{
                    "autoBind":true
                    , "leadType" :leadType
                    , "leadStatCd":"${leadStatCd}"
                    , "befLeadStatCd":"${befLeadStatCd}"
                    , "custNo":"${custNo}"
                    , "salesOpptSeq":"${salesOpptSeq}"
                    , "showRoomSeq":"${showRoomSeq}"
                    , "exhvFlakSeq":"${exhvFlakSeq}"
                    , "callbackFunc":function(data) {
                        $("#btnSearch").click();
                    }
                }
            }
        });
    } else {
        console.log("fail");
    }
}

 //버튼 - 수정
$("#btnUpdate").click(function(){
    var mngScIdCtrl = "${mngScIdCtrl}";
    if(status == "btnStep09"){
        if (mngScIdCtrl == "N") {
            // 권한이 없습니다.
               mob.notification.info("<spring:message code='global.lbl.permission' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' /> ");
               return false;
        }
    }
     pageMode = "update";
     var custNo = selectedItem.custNo
     , seq = selectedItem.seq
     , leadStatCd = selectedItem.leadStatCd
     , exhvFlakSeq = selectedItem.exhvFlakSeq
     , dataTable = selectedItem.dataTable;

     var mainLeadStatCd = $("#leadStatCd").val();
     var url = "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessFailPopup.do'/>";

     editCustPopupWindow = mob.window.popup({
         windowId:"selectEditSalesOpptProcessFailPopup"
       , content:{
           url:url
           , data:{
               "autoBind":true
               , "leadStatCd":leadStatCd
               , "custNo":custNo
               , "salesOpptSeq":seq
               , "showRoomSeq":seq
               , "exhvFlakSeq":exhvFlakSeq
               , "dataTable":dataTable
               , "titleStr":"selectSalesOpptProcessMgmtFailMain"
               , "callbackFunc":function(data) {
                   $("#btnSearch").click();
               }
           }
       }
     });
});

$("#btnCheckPwd").kendoButton({
    click:function(e) {
        var usrPw = hex_sha2($("#usrPw").val());

        if (dms.string.isEmpty($("#usrPw").val())) {
            mob.notification.info("<spring:message code='crm.info.emptyPw' />");
            return false;
        }

        var pwParam = {};
        pwParam["sPassword"] = usrPw;
        $.ajax({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
            ,data:JSON.stringify(pwParam)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                console.log("error !!!");
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result){
                if (result === true) {
                    var checkPwDiv = $("#checkPwDiv").data("kendoWindow");
                    checkPwDiv.close();
                    $("#btnStepChange").click();
                } else {
                    mob.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                }
            }
        });
    }
});


//추적이력 팝업
 var activeAddPopupWin;
 function activeAddPop(){
     var custNo = $("#custNo").val()
         , seq = $("#seq").val()
         , leadStatCd = $("#leadStatCd").val();
         activeAddPopupWin = mob.window.popup({
             windowId:"activeAddPopupWin"
             ,width:"100%"
             ,height:"700px"
             ,content:{
                 url:"<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtActivePopup.do'/>"
                 , data:{
                     "autoBind":true
                     ,"usrNm":""
                     , "leadStatCd":leadStatCd
                     , "salesOpptSeq":seq
                     , "custNo":custNo
                     , "traceGradeCd":$("#traceGradeNm").val().substring(0, 1)
                     , "cSeq":cSeq
                     ,"callbackFunc":function(data){
                         if (data.length >= 1) {
                             console.log("Return to User Popup");
                             $("#prsnId").val(data[0].usrId);
                             $("#prsnNm").val(data[0].usrNm);
                         }
                     }
                 }
             }
         });
 }

 //SMS 팝업
 var sendSMSPopupWin;
 function sendSMSPopup(){
     var   smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
         , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
         , smsTmplUserList = []              // sms 전송 대상자 목록
         , refKeyNm = $("#seq").val()
         , refTableNm = "CR_0211T"
         , contactBizCd = "03" //업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07)
     ;

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
                                 mob.notification.success("<spring:message code='global.lbl.send'/>"+"<spring:message code='crm.btn.failed'/>");
                             }else{
                                 mob.notification.success("<spring:message code='global.info.success'/>");
                             }
                         }
                     }
                 }
             }
         });
 }

 function callbackActive(){
     listData.read();
     $("#content_search").css("display","none");
     $("#content_detail").css("display","none");
     $("#content_list").css("display","block");
     $("#header_title span").attr("class","search_open");
 }
</script>

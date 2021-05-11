<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">

    <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h1><spring:message code='global.title.basicInfo' /><!-- 기본정보 --></h1>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr class="personalTr">
                                    <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --> </th>
                                    <td>
                                        <div class="f_text">
                                            <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input" maxlength="30"  />
                                            <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                            <%-- <span class="customer" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span> --%>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custNo" name="custNo" data-json-obj="true" readonly /></div>
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row" class="required"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custTp" name="custTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="number" id="hpNo" name="hpNo" class="form_input numberic getCustDupByKey" maxlength="11" data-type="mobile" pattern="\d" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row"><spring:message code="global.lbl.homeTelNo" /><!-- 집전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="telNo" name="telNo" maxlength="20" data-type="tel" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row"><spring:message code="global.lbl.wechatId" /><!-- Wechat ID --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="wechatId" name="wechatId" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row"><spring:message code='global.lbl.sex' /><!-- 성별 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sexCd" name="sexCd" data-json-obj="true"  /></div>
                                    </td>
                                </tr>
                                <tr class="personalTr">
                                    <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 이메일 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="emailNm" name="emailNm" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>

                                <tr class="corporateTr">
                                    <th scope="row" class="required"><spring:message code="crm.lbl.corporation" /><!-- 법인명 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="custNmSearchC" name="custNmSearchC" type="text" value="" class="form_input" maxlength="30"  />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custNoC" name="custNoC" readonly /></div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custTpC" name="custTpC"/></div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="crm.lbl.corpPurcMng" /><!-- 구매담당자명 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="relCustNm" name="relCustNm" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="number" id="relCustHpNo" name="relCustHpNo" class="form_input numberic getCustDupByKey" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="bizcondCdC"/></div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row" ><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mathDocTpC" name="mathDocTpC"/></div>
                                    </td>
                                </tr>
                                <tr class="corporateTr" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="ssnCrnNoC" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" maxlength="30" />
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.addrNm' /><!-- 주소 --></th>
                                    <td>
                                        <div class="f_text">
                                            <p id="addrNm" name="addrNm" style="min-height: 38px; box-sizing: border-box; padding: 8px" readonly></p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <div class="f_text">
                                            <p id="addrNmDetail" name="addrNmDetail" style="min-height: 38px; box-sizing: border-box; padding: 8px" readonly></p>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!-- //co_group  -->


            <!-- 주소  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='global.lbl.addr' /><!-- 주소 --></h2>
                    <div class="title_btn">
                        <span class="tbtn" id="btnAddAddress" ><spring:message code="global.btn.add" /><!-- 추가 --></span>
                        <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none">
                    <div class="listarea01">
                    <div class="deleteitem listhead">
                        <span style="width:35%"><spring:message code='global.lbl.selectAddr' /><!-- 우편주소 --></span>
                        <span style="width:35%"><spring:message code='global.lbl.type' /><!-- 유형 --></span>
                        <span style="width:100%"><spring:message code='crm.lbl.addr1' /><!-- 소재지 주소 --></span>
                        <span class="clboth" style="width:100%"><spring:message code='global.lbl.detlAddr' /><!-- 상세주소 --></span>
                    </div>
                    <iframe id="addressList" class="addressList" border="0" frameborder="0" width="100%" height="300"></iframe>
                    <div class="deleteitem" style="display:none;" id="addressList_noData"><span></span></div>
                    </div>
                </div>
            </div>
            <!-- // 주소  -->

            <!-- 예상구매정보 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.expcPurcInfo' /></h2>
                    <div class="title_btn">
                         <span class="co_open co_close"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.infoType' /><!-- 정보유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="infoTp" name="infoTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.approchLocation' /><!-- 정보경로 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="holdTp" name="holdTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <div class="f_text">
                                        <input type="text" id="holdDetlTpSeq" name="holdDetlTpSeq" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.payMethod' /><!-- 지불방식 --></th>
                                    <td>
                                        <div class="f_text"><input type="text"  id="payTp" name="payTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expectPureTime' /><!-- 예상구매시간코드/예상구매시간 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="expcPurcHmCd" name="expcPurcHmCd" data-json-obj="true" /></div>
                                    </td>
                                </tr> --%>
                                <tr>
                                    <th scope="row" class="required"><spring:message code='crm.lbl.intentionCarline' /><!-- 의향차종/의향브랜드 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrCarlineCd" name="intrCarlineCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionVariant' /><!-- 의향차관 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrFscpModtpCd" name="intrFscpModtpCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향색상 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrColorCd" name="intrColorCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.plateNum' /><!-- 현지번호판예정 --></th>
                                    <!-- <td>
                                        <div class="f_text"><input type="text" id="natNofScheNo" name="natNofScheNo" data-json-obj="true"  /></div>
                                    </td> -->
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left" style="width:16%" >
                                                <input id="localCarRegNoYn" name="localCarRegNoYn" type="checkbox" class="f_check" /><label for="localCarRegNoYn"></label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 협의정보 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.agrmntInfo' /></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.estimateInfo' /><!-- 견적정보 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="estimateCont" name="estimateCont" maxlength="50" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.promotionCont' /><!-- 판촉내용 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id=salesCont name="salesCont" maxlength="100" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.remark' /><!-- 비고설명 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="remark" name="remark" maxlength="100" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.prsn' /><!-- 담당자 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="mngScId" name="mngScId" data-json-obj="true" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="leadStatCd" name="leadStatCd" data-json-obj="true"  /></div>
                                    </td>
                                </tr>
                                <tr id="usrPwTr" style="display: none;">
                                    <th scope="row"><spring:message code='global.lbl.usrPw'/><!-- 비밀번호 --></th>
                                    <td>
                                        <div class="f_text"><input id="usrPw" name="usrPw" type="password" /></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 추적기록 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.activeHistory" /><!-- 추적기록 --></h2><!-- 추적이력 -->
                    <div class="title_btn">
                        <%-- <span class="tbtn" id="addActive"><spring:message code="global.btn.add" /><!-- 추가 --></span> --%>
                        <span class="co_open co_close" id="activeHistoryListBtn"><span> </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:50%"><spring:message code='crm.lbl.tracer' /><!-- 추적자 --></span>
                            <span style="width:50%"><spring:message code='crm.lbl.traceDt' /><!-- 추적시간 --></span>
                            <span class="clboth" style="width:50%"><spring:message code='crm.lbl.traceMth' /><!-- 추적방식 --></span>
                            <span style="width:50%"><spring:message code='crm.lbl.activeGrade' /><!-- 등급 --></span>
                            <span class="clboth" style="width:50%"><spring:message code='crm.lbl.traceCont' /><!-- 상황 --></span>
                        </div>
                        <iframe id="activeHistoryList" border="0" frameborder="0" width="100%" height="300"></iframe>
                        <div class="deleteitem" style="display:none;" id="activeHistoryList_noData"><span></span></div>
                    </div>
                </div>
            </div><!-- end co_group -->

            <!-- 회전기록 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.leadStatusExchange" /> <!-- 회전기록 流转记录--></h2>
                    <div class="title_btn">
                         <span class="co_open co_close" id="leadStatusExchangeListBtn"><span></span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:50%"><spring:message code='global.lbl.dateTime' /><!-- 일시 --></span>
                            <span style="width:50%"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></span>
                            <span class="clboth" style="width:50%"><spring:message code='crm.lbl.prsNm' /><!-- 담당자 --></span>
                            <span style="width:50%"><spring:message code='global.lbl.handler' /><!-- 조작인 --></span>
                            <span class="clboth" style="width:50%"><spring:message code='global.lbl.message' /><!-- 메세지 --></span>
                        </div>
                        <iframe id="leadStatusExchangeList" border="0" frameborder="0" width="100%" height="300"></iframe>
                        <div class="deleteitem" style="display:none;" id="leadStatusExchangeList_noData"><span></span></div>
                    </div>
                </div>
            </div><!-- end co_group -->

            <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
            <input type="hidden" id="btnCustSearch" />
            <input type="hidden" id="dlrCd" name="dlrCd"  data-json-obj="true" />
            <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
            <input type="hidden" id="exhvFlakSeq" name="exhvFlakSeq" data-json-obj="true" />
            <input type="hidden" id="salesOpptSeq" />
            <input type="hidden" id="btnStepChange" />
            <input type="hidden" id="befLeadStatCd" />
            <input type="hidden" id="oldLeadStatCd" />
            <input type="hidden" id="validGradeCd" />
            <input type="hidden" id="mathDocTp" />
            <input type="hidden" id="beforeMngScId" />
            <input type="hidden" id="titleStr" name="titleStr" disabled="disabled"/>

        </section>
    </div><!--  salesOpptProcForm End  -->

    <!-- 버튼 2개  -->
    <div class="con_btnarea btncount2">
        <div><span class="btnd1t2" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></span></div>
        <div><span class="btnd1" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></span></div>
    </div>
    <!-- //버튼  -->

</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>


<!-- script -->

 <script type="text/javascript">

 var dlrCd  = "${dlrCd}";    // 딜러코드
 var dlrNm  = "${dlrNm}";    // 딜러
 var userId = "${userId}";   // 사용자코드
 var userNm = "${userNm}";   // 사용자

 var mngScIdCtrl = "${mngScIdCtrl}";
 //mngScIdCtrl = "N";
 var salesOpptPwYn = "${salesOpptPwYn}";
 var checkUserPw = false;

     var addrTpList = [];
     var addrTpMap = [];
     var chgBuyYnDS = [];
     var chgBuyYnMap = [];
     var carlineCdList = [];
     var carlineCdMap = [];
     var colorCdList = [];
     var colorCdMap = [];
     var mngScIdList = [];
     var mngScIdMap = [];
     var infoPathCdList = [];
     var infoPathCdMap = [];

     var holdTpList = [];
     var holdTpMap = [];
     var holdDetlTpSeqList = [];
     var holdDetlTpSeqMap = [];

     var leadStatCdList = [];
     var leadStatCdMap = [];
     var sexCdList = [];
     var sexCdMap = [];
     var modelCdList = [];
     var modelCdMap = [];
     var traceMthCdList = [];
     var traceMthCdMap = [];

     var custTpList = [];
     var custTpMap = [];
     var infoTpList = [];
     var payTpList = [];
     var expcPurcHmCdList = [];

     var traceGradeCdList = [];
     var traceGradeCdMap = [];
     var validGradeCdList = [];
     var invalidCauCdList = [];
     var validGradeCdMap = [];
     var invalidCauCdMap = [];


 var bizcondCdList   = [];
 var mathDocTpList = [];
 var usersRoleCrmR02 = [];
 var usersRoleCrmR03 = [];
 var usersRoleCrmR17 = [];
 var usersRoleCrmR18 = [];

 var traceGrdMap = [];

 <c:forEach var="obj" items="${traceGrdList}">
 traceGrdMap["${obj.cmmCd}"] = "${obj.traceIvalDay}";
 </c:forEach>

 <c:forEach var="obj" items="${usersRoleCrmR02}">
 usersRoleCrmR02.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
 </c:forEach>

 <c:forEach var="obj" items="${usersRoleCrmR03}">
 usersRoleCrmR03.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
 </c:forEach>

 <c:forEach var="obj" items="${usersRoleCrmR17}">
 usersRoleCrmR17.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
 </c:forEach>

 <c:forEach var="obj" items="${usersRoleCrmR18}">
 usersRoleCrmR18.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
 </c:forEach>

 <c:forEach var="obj" items="${mathDocTpList}">
    //<c:if test="${obj.remark1 == 'C'}">
        mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    //</c:if>
 </c:forEach>

 <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

     <c:forEach var="obj" items="${traceMthCdList}">
         traceMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         traceMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${traceGradeCdList}">
         traceGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         traceGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${validGradeCdList}">
         validGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         validGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${invalidCauCdList}">
         invalidCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         invalidCauCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${holdTpList}">
         holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${holdDetlTpSeqList}">
        holdDetlTpSeqList.push({"cmmCd":"${obj.holdSeq}" , "cmmCdNm":"${obj.holdDetlTpNm}", "useYn":"${obj.delYn}"});
        holdDetlTpSeqMap["${obj.holdSeq}"] = "${obj.holdDetlTpNm}";
    </c:forEach>

     <c:forEach var="obj" items="${expcPurcHmCdList}">
         expcPurcHmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${payTpList}">
         payTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${infoTpList}">
         infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     <c:forEach var="obj" items="${custTpList}">
         custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${leadStatCdList}">
         leadStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${sexCdList}">
         sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${activeGradeCdList}">
         activeGradeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${infoPathCdList}">
         infoPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         infoPathCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${mngScIdList}">
         mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
         mngScIdMap["${obj.usrId}"] = "${obj.usrNm}";
     </c:forEach>

     chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
     chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
     chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
     chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";

     <c:forEach var="obj" items="${addrTpList}">
         addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     //차종조회
     <c:forEach var="obj" items="${carlineCdList}">
         carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
         carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
     </c:forEach>

     //색상조회
     <c:forEach var="obj" items="${colorCdList}">
         colorCdList.push({extColorNm:"${obj.extColorNm}", extColorCd:"${obj.extColorCd}"});
         colorCdMap["${obj.extColorCd}"] = "${obj.extColorNm}";
     </c:forEach>

     $(document).ready(function() {

         // 숫자
         var onlyNum = new RegExp("[^0-9]","i");
         $(".numberic").keyup(function(e)
         {
             var content = $(this).val();

             if(content.match(onlyNum)){
                 //console.log($(this).val());
                 $(this).val('');
             }
         });

         // 숫자와 알파벳
         var onlyNumAlpha = new RegExp("[^A-Z0-9]");
         $(".numberandalpha").keyup(function(e)
         {

             var contents = $(this).val();
             //console.log(contents);
             //console.log(onlyNumAlpha.test(contents));
             if(onlyNumAlpha.test(contents)){

                 $(this).val('');
             }
         });

      // 조직기구코드
         //var corpNumChk = new RegExp("[^[0-9]{8}-[0-9]$]");
         //var corpNumChk = new RegExp("^[0-9]{8}-[0-9]");
         var corpNumChk = new RegExp("[^a-zA-Z0-9-]");
         $(".corpNumChk").keyup(function(e)
         {

             var contents = $(this).val();
//              console.log(contents);
             if(corpNumChk.test(contents)){
                 $(this).val('');
             }
         });

         // 증거유형 + 증거번호 후 고객 체크 (자동)
         $(".getCustMathDocDupByKey").focusout(function(){
             var idValue = $(this).context.id;
             getCustMathDocDupByKey(idValue);
         });


      // 이메일   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
         //var onlyEmail = new RegExp("^[a-zA-Z0-9]{2,15}@[a-zA-Z0-9]{1,10}(\.[a-zA-Z]{2,3}){1,2}$");
         //var onlyEmail = new RegExp("^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$");
        $(".form_email").keyup(function(e)
        {
            var onlyEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

            var contents = $(this).val();
            //console.log(contents);
            //console.log(onlyEmail.test(contents));
            if(onlyEmail.test(contents)){
                //$(this).val('');
            }
        });

        // 고객명에서 ObKeyDown
        $(".onKey_down").keydown(function(e){
            if (e.keyCode == 13) {
                if($(this).val() != "") {
                    $(".custSearch").click();
                }
            }
        });

        // 고객명에서 ObKeyDown 연계인 검색
        $(".onKey_down_relCust").keydown(function(e){
            if (e.keyCode == 13) {
                if($(this).val() != "") {
                    $(".relCustSearch").click();
                }
            }
        });

        // 업종                  bizcondCdC
        $("#bizcondCdC").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:dms.data.cmmCdFilter(bizcondCdList)
            , index:0
            , enable:true
        });

        // 신분증유형            mathDocTpC       (CRM024)
        $("#mathDocTpC").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:dms.data.cmmCdFilter(mathDocTpList)
            , index:0
            , enable:true
            , change:function(){
                getCustMathDocDupByKey();
            }
        });

        // 고객확보유형1      holdTp      (CRM008)
        $("#holdTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , dataSource:dms.data.cmmCdFilter(holdTpList)
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           //, filter:"contains"
           , filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchHoldTp
       });

        // 고객확보유형2      holdDetlTpSeq   (CRM***)
        $("#holdDetlTpSeq").kendoExtDropDownList({
           dataTextField:"holdDetlTpNm"
           , dataValueField:"holdSeq"
           //, filter:"contains"
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           , enable:false
        });

        $("#infoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
           // , dataSource:infoTpList
            , dataSource:dms.data.cmmCdFilter(infoTpList)
            , index:1
        });

        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:custTpList
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                } else {
                    $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                    $(".personalTr").hide();
                    $(".corporateTr").show();
                }
            }
        });

        $("#custTpC").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dms.data.cmmCdFilter(custTpList)
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                    $(".personalTr").show();
                    $(".corporateTr").hide();
                } else {
                    $("#custTpC").data("kendoExtDropDownList").value(selcmmCd);
                }
            }
        });

        $("#payTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:dms.data.cmmCdFilter(payTpList)
            , index:0
        });

        /**
         * 차종 콤보박스
         */
        $("#intrCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:"<spring:message code='global.lbl.check'/>"
           //, filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
           ,select:onSelectSearchCarlineCd
        });

        /**
         * 모델 콤보박스
         */
         $("#intrFscpModtpCd").kendoExtDropDownList({
             dataTextField:"fscNm"
            ,dataValueField:"fscCd"
            //,filter:"contains"
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
         });
         $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);


        $("#intrColorCd").kendoExtDropDownList({
            dataTextField:"extColorNm"
            , dataValueField:"extColorCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:colorCdList
            , index:0
        });

        $("#mngScId").kendoExtDropDownList({
            dataTextField:"usrNm"
            , dataValueField:"usrId"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:mngScIdList
            , index:0
            //, filter:"contains"
            , filtering:function(e){
                var filter = e.filter;
            }
            , change:function(e){
               if(!dms.string.isEmpty($("#beforeMngScId").val())&&$("#beforeMngScId").val()!==$("#mngScId").val()&&salesOpptPwYn=="Y"){
                   $("#usrPwTr").show();
                   checkUserPw=true;
               }else{
                   $("#usrPwTr").hide();
                   checkUserPw=false;
               }
            }
        });
        //$("#mngScId").data("kendoExtDropDownList").enable(false);

        $("#leadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:dms.data.cmmCdFilter(leadStatCdList)
            , index:0
        });
        $("#leadStatCd").data("kendoExtDropDownList").enable(false);

        $("#sexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:dms.data.cmmCdFilter(sexCdList)
            , index:0
        });

         $("#usersRoleCrmR03").kendoExtDropDownList({
             dataTextField:"usrNm"
             , dataValueField:"usrId"
             , dataSource:usersRoleCrmR03
             , index:0
             , optionLabel:"<spring:message code='global.lbl.check'/>"
             //, filter:"contains"
             , filtering:function(e){
                 var filter = e.filter;
             }
             , change:function(){
                 var sel = this.dataItem(this.select()).usrId;
                // var mngScId = $("#mngScId").val();
                 var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                 var bhmcYn = $("#bhmcYn").val();
                 var beforeMngScId = $("#beforeMngScId").val();
                 if (salesOpptPwYn == "Y"){
                     if ((sel != '') && (sel != beforeMngScId )){
                         $("#usrPw").attr("readonly", false);
                         $("#usrPw").removeClass("form_readonly");
                     } else {
                         $("#usrPw").attr("readonly", true);
                         $("#usrPw").addClass("form_readonly");
                     }
                 }
             }
         });

        /*  if ( $("#bhmcYn").val() == "Y") {
             //판매기회 실행 (ROLE_CRM_R_03)
               $("#usersRoleCrmR03").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
         } else {
               $("#usersRoleCrmR03").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
         } */


         var options = parent.editCustPopupWindow.options.content.data;

         //$("#leadStatCd").val(options.leadStatCd);
/*          $("#befLeadStatCd").val(options.leadStatCd); //주의 실재 이전 단계가 아니라 지금 단계입니다. 서비스에서 단계 이력을 남기기 위한 용도임.
         $("#oldLeadStatCd").val(options.befLeadStatCd);
         $("#leadType").val(options.leadType);
         $("#validGradeCd").val(options.validGradeCd); */
          //setHeaderTitle();


        /* $("#expcPurcHmCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:expcPurcHmCdList
            , index:0
        }); */

        $("#traceMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:traceMthCdList
            , index:0
        });
        $("#nextTraceMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:traceMthCdList
            , index:0
        });
        $("#traceGradeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:traceGradeCdList
            , index:0
        });

        // 버튼 - 이전
       $("#docu_prev").bind("click", function()
       {
           parent.$("#formarea").show();
           if ($("#content_detail").css("display") == "block") { goMain(); }
           //else if ($("#content_pop_search").css("display") == "block") { contentList(); }
           //else if ($("#content_detail").css("display") == "block") { contentList(); }

       });

       //타이틀
       $("#header_title").html("<spring:message code='crm.menu.failCustomerDB' />"); //잠재고객 DB

       //주소리스트
       $("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
       //주소리스트
       $("#btnAddrSearch").click(function(){
          $("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
          //document.getElementById("addressList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
       });

        //추적기록 리스트
        $("#activeHistoryListBtn").click(function(){
            $("#activeHistoryList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmtList.do' />");
        });
        $("#leadStatusExchangeListBtn").click(function(){
            $("#leadStatusExchangeList").attr("src", "<c:url value='/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHistList.do' />");
        });

        //var options = parent.editCustPopupWindow.options.content.data;
        //$("#titleStr").val(options.titleStr);

        //setHeaderTitle();

        $("#btnCustSearch").click(function(){
           var param = {};

           param["sCustNo"] = $("#custNo").val();



           $.ajax({
               url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
               , data:JSON.stringify(param)
               , type:'POST'
               , dataType:'json'
               , contentType:'application/json'
               , error:function(jqXHR,status,error){
                   //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   mob.loading.hide();
                   console.log(jqXHR);

                   mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
               }
           }).done(function(result) {
               mob.loading.hide();

               var leadStatCd = result.data[0].leadStatCd;
               var bhmcYn = result.data[0].bhmcYn;

               $("#bhmcYn").val(result.data[0].bhmcYn);
               $("#dlrCd").val(result.data[0].dlrCd);

               $("#custCd").val(result.data[0].custCd);
               $("#custNm").val(result.data[0].custNm);
               $("#custNmSearch").val(result.data[0].custNm);
               $("#hpNo").val(result.data[0].hpNo);
               $("#telNo").val(result.data[0].telNo);
               $("#officeTelNo").val(result.data[0].officeTelNo);
               $("#wechatId").val(result.data[0].wechatId);
               $("#emailNm").val(result.data[0].emailNm);
               $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);

               $("#holdTp").data("kendoExtDropDownList").value(result.data[0].holdTp);
               if ( dms.string.isNotEmpty(result.data[0].holdDetlTpSeq) ) {
                   onSelectSearchHoldTpSet(result.data[0].holdTp);
                   //$("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([{holdSeq:result.data[0].holdDetlTpSeq, holdDetlTpNm:result.data[0].holdDetlTpSeqNm}]);
                   $("#holdDetlTpSeq").data("kendoExtDropDownList").value(result.data[0].holdDetlTpSeq);
               }

               $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
               $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);

               onSelectSearchCarlineCdSet(result.data[0].intrCarlineCd);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);

               $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
               //$("#localCarRegNoYn").data("kendoExtDropDownList").value(result.data[0].localCarRegNoYn);
               $("#estimateCont").val(result.data[0].estimateCont);
               $("#salesCont").val(result.data[0].salesCont);
               $("#remark").val(result.data[0].remark);
               $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
               $("#beforeMngScId").val(result.data[0].mngScId);
               $("#leadStatCd").data("kendoExtDropDownList").value(leadStatCd);
               $("#befLeadStatCd").val(leadStatCd);
               $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
               $("#seq").val(result.data[0].seq);
               $("#exhvFlakSeq").val(result.data[0].exhvFlakSeq);

               if (result.data[0].localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true) };

               $("#custTp").data("kendoExtDropDownList").value(result.data[0].custTp);
               $("#custTpC").data("kendoExtDropDownList").value(result.data[0].custTp);
               $("#custNmSearchC").val(result.data[0].custNm);
               $("#custNoC").val(result.data[0].custNo);


               console.log("custTp: " + result.data[0].custTp);


               if (result.data[0].custTp == "01") {
                   $(".personalTr").show();
                   $(".corporateTr").hide();
                   //$("#mathDocTpC").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
                   $("#mathDocTp").val(result.data[0].mathDocTp);
                   $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
//                    console.log("personalTr Show ");
               } else {
                   $("#mathDocTpC").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
                   $("#mathDocTp").val(result.data[0].mathDocTp);
                   $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
                   $("#bizcondCdC").data("kendoExtDropDownList").value(result.data[0].bizcondCd);
                   $("#officeTelNoC").val(result.data[0].officeTelNo);
                   $("#wechatIdC").val(result.data[0].wechatId);

//                    console.log("corporateTr Show ");
                   // 연계인 정보 셋팅
                   $("#relCustNm").val(result.data[0].purcMngNm);
                   $("#relCustHpNo").val(result.data[0].hpNo);

                   $(".personalTr").hide();
                   $(".corporateTr").show();
               }

               if (result.data[0].custCd == "02") {
                   $("#custTp").data("kendoExtDropDownList").enable(false);
                   $("#custTpC").data("kendoExtDropDownList").enable(false);
               }

               // 상태에 따른 처리
               if (leadStatCd == "00"
                   || leadStatCd =="01"
                   || leadStatCd =="02"
                   || leadStatCd =="03"
                   || leadStatCd =="04"
                   || leadStatCd =="08"
                   || leadStatCd =="09"
               ) {
                   $("#mngScId").data("kendoExtDropDownList").enable(false);

                   if (leadStatCd == "01"
                       || leadStatCd == "02"
                   ) {
                       //OB실행 VIEW-D-10322
                       $("#mngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR18);
                   } else {
                       //판매기회 실행  VIEW-D-10321
                       $("#mngScId").data("kendoExtDropDownList").setDataSource(usersRoleCrmR03);
                   }

                   if (leadStatCd == "08"
                       || leadStatCd == "09"
                   ) {

                       if (mngScIdCtrl == "Y") {
                           /* $("#mngScId").data("kendoExtDropDownList").enable(true); */
                       } else {
                           $("#mngScId").data("kendoExtDropDownList").enable(false);
                       }
                   }

               }
/*
               // 화면에따라 추가 항목이 다름.
               if ( $("#validGradeCd").length > 0 ) {

                   $("#validGradeCd").data("kendoExtDropDownList").value(result.data[0].validGradeCd);

                   if (result.data[0].validGradeCd == "02") {
                       $("#validGradeCd").data("kendoExtDropDownList").enable(false);
                   }
               }
               if ( $("#invalidCauCd").length > 0 ) {
                   $("#invalidCauCd").data("kendoExtDropDownList").value(result.data[0].invalidCauCd);
               }

               if ( $("#vsitDt").length > 0 ) {
                   $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(result.data[0].vsitDt);
               }
               if ( $("#vsitEndDt").length > 0 ) {
                   $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(result.data[0].vsitEndDt);
               }
               if ( $("#vsitPrsnCnt").length > 0 ) {
                   $("#vsitPrsnCnt").val(result.data[0].vsitPrsnCnt);
               }

               if ( $("#rvsitYn").length > 0 ) {
                   if (result.data[0].rvsitYn == 'Y'){ $("#rvsitYn").prop("checked", true) };
               }

               if ( $("#purcSelCarlineCd").length > 0 ) {
                   $("#purcSelCarlineCd").data("kendoExtDropDownList").value(result.data[0].purcSelCarlineCd);
               }
               if ( $("#purcSelModelCd").length > 0 ) {
                   $("#purcSelModelCd").data("kendoExtDropDownList").setDataSource([{modelNm:result.data[0].purcSelModelNm, modelCd:result.data[0].purcSelModelCd}]);
               }
               if ( $("#purcSelModelCd").length > 0 ) {
                   $("#purcSelModelCd").data("kendoExtDropDownList").value(result.data[0].purcSelModelCd);
               }
               if ( $("#expcPurcDt").length > 0 ) {
                   $("#expcPurcDt").data("kendoExtMaskedDatePicker").value(result.data[0].expcPurcDt);
               }
               if ( $("#expcDealPrc").length > 0 ) {
                   $("#expcDealPrc").val(result.data[0].expcDealPrc);
               }

               if ( $("#failCauCd").length > 0 ) {
                   $("#failCauCd").data("kendoExtDropDownList").value(result.data[0].failCauCd);
               }
               if ( $("#failCauReasonCont").length > 0 ) {
                   $("#failCauReasonCont").val(result.data[0].failCauReasonCont);
               }
               if ( $("#traceGradeCd").length > 0 ) {
                   $("#traceGradeCd").data("kendoExtDropDownList").value(result.data[0].traceGradeCd);
               }
 */

           });

        });

        // 고객명, 휴대전화 입력 후 고객 체크 (자동)
        $(".getCustDupByKey").focusout(function(){
            var idValue = $(this).context.id;
            getCustDupByKey(idValue);
        });

        //고객조회
        $("#custSearch").click(function(){
            var param = {};

            var custTp = $("#custTp").data("kendoExtDropDownList").value();
            var custNm = $("#custNmSearch").val();
            if (custTp == "02") {
                custNm = $("#custNmSearchC").val();
            }

            popupWindow = dms.window.popup({
                windowId:"customerSearchPopupMain"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "custNm":custNm
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if (data.length >= 1) {


                                if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                    $("#custNo").val(data[0].custNo);
                                }
                                popupWindow.close();
                                $("#btnCustSearch").click();
                            }
                        }
                    }
                }
            })

        });

        // 고객조회
        //var custSearch = function() {
         $(".relCustSearch").click(function(){

             var iframe = "selectEditSalesOpptProcessPopup";
             var autoBind = "Y";
             var type = "";
             var custTp = "01";  // 개인
             var custCd = "";
             var custNm = $("#relCustNmSearch").val();
             var dlrMbrYn = "";

             parent.fn_relCustSearchPopUp(iframe, autoBind, type, custTp, custCd, custNm, dlrMbrYn);

         });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.$("#formarea").show();
                parent.editCustPopupWindow.close();
            }
        });

        // 저장 버튼.
        $("#btnSave").kendoButton({
            click:function(e){

                if(checkUserPw){
                    var usrPw = $("#usrPw").val();
                    if (dms.string.isEmpty(usrPw)) {
                        mob.notification.info("<spring:message code='global.lbl.usrPw' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    }
                    var pwParam = {};
                    pwParam["sPassword"] = hex_sha2(usrPw);
                    $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
                        ,data:JSON.stringify(pwParam)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result){
                            if (result === true) {
                                mob.notification.success("<spring:message code='global.info.success'/>");
                                parent.$("#formarea").show();
                                //confirmOpen(confirmMsgSave,'doSave',y,n);
                                doSave();

                            } else {
                                mob.notification.success("<spring:message code='global.err.invalid.idpw'/>");
                            }
                        }
                    });
                }else{
                    parent.$("#formarea").show();
                    //confirmOpen(confirmMsgSave,'doSave',y,n);
                    doSave();
                }
            }
        });

        if (mngScIdCtrl == "N") {

            $("#mngScId").data("kendoExtDropDownList").value(userId);
            $("#mngScId").data("kendoExtDropDownList").enable(false);
        }


        //$("#salesOpptSeq").val(options.salesOpptSeq);

        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }

        //버튼 - 주소  추가
        $("#btnAddAddress").click(function(){
                parent.zipcodeSearchPop(callbackAddr);
        });

        parent.$("#formarea").hide();

     });//end document ready

     /** [조회조건 영역] ComboBox Select() **/
     // 차종에 따른 모델검색
      function onSelectSearchCarlineCd(e){
          $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
          $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(true);

          var dataItem = this.dataItem(e.item);
          if(dataItem.carlineCd == ""){
              $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
              $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);
              return false;
          }

          var responseJson = dms.ajax.getJson({
              url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
              ,data :JSON.stringify({"sCarlineCd":dataItem.carlineCd})
              ,async :false
          });
          $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         /* $("#intrModelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#intrModelCd").data("kendoExtDropDownList").enable(true);

         var dataItem = this.dataItem(e.item);
         if(dataItem.carlineCd == ""){
             $("#intrModelCd").data("kendoExtDropDownList").setDataSource([]);
             $("#intrModelCd").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
             ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
             ,async:false
         });
         $("#intrModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data); */
     }

      /** [조회조건 영역] ComboBox Select() **/
      // 차종에 따른 모델검색
       function onSelectSearchCarlineCdSet(carlineCd){
           $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(true);

           if(carlineCd == ""){
               $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
               ,data :JSON.stringify({"sCarlineCd":carlineCd})
               ,async :false
           });
           $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
          /* $("#intrModelCd").data("kendoExtDropDownList").setDataSource([]);
          $("#intrModelCd").data("kendoExtDropDownList").enable(true);

          if(carlineCd == ""){
              $("#intrModelCd").data("kendoExtDropDownList").setDataSource([]);
              $("#intrModelCd").data("kendoExtDropDownList").enable(false);
              return false;
          }

          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
              ,data:JSON.stringify({"carlineCd":carlineCd})
              ,async:false
          });
          $("#intrModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data); */
       }

      /** [조회조건 영역] ComboBox Select() **/
     // 정보경로에 따른 상세경로 조회
     function onSelectSearchHoldTp(e){
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
         $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

         var dataItem = this.dataItem(e.item);

         if(dataItem.cmmCd == ""){
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
             ,async:false
         });
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);

     }

     /** [조회조건 영역] ComboBox Select() **/
     // 정보경로에 따른 상세경로 조회
     function onSelectSearchHoldTpSet(holdTp){
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
         $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

         if(holdTp == ""){
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
             ,data:JSON.stringify({"sHoldTp":holdTp})
             ,async:false
         });

         if (responseJson.total == 0) {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
         } else {
             $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
     }

     function getCustDupByKey(idVal){
         console.log("getCustDupByKey!!!!");
         var custTp = $("#custTp").data("kendoExtDropDownList").value();

         var custNm = $("#custNmSearch").val();
         var custNo = $("#custNo").val();
         var custCd = $("#custCd").val();
         var hpNo = $("#hpNo").val();
         var mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         var ssnCrnNo = $("#ssnCrnNoC").val();
         var officeTelNo = $("#officeTelNoC").val();
         var oldCustNm = "";
         var oldHpNo = "";
         var oldMathDocTp = "";
         var oldSsnCrnNo = "";
         var chkContinued = false;

         // 법인연계인 (구매담당자)
         var relCustNm = $("#relCustNm").val();
         var relCustHpNo = $("#relCustHpNo").val();

         if ( dms.string.isEmpty(custCd) ) {
             custCd = "01";
         }

         if (custTp == "02") {
             custNm = $("#custNmC").val();
             mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
             ssnCrnNo = $("#ssnCrnNoC").val();
             if (relCustHpNo.length > 1 ) {
                 hpNo = relCustHpNo;
                 chkContinued = true;
             }
         } else {
             if (hpNo.length > 1 ) {
                 chkContinued = true;
             }
         }

         if (chkContinued){

             var param = {};
             param["sCustNo"]       = custNo;
             param["sCustCd"]       = custCd;   // 잠재
             param["sCustTp"]       = custTp;
             param["sCustNm"]       = custNm;

             param["sHpNo"]         = hpNo;
             param["sOfficeTelNo"]         = officeTelNo;
             param["sMathDocTp"]         = mathDocTp;
             param["sSsnCrnNo"]         = ssnCrnNo;
             param["sOldCustNm"]         = oldCustNm;
             param["sOldHpNo"]         = oldHpNo;
             param["sOldMathDocTp"]         = oldMathDocTp;
             param["sOldSsnCrnNo"]         = oldSsnCrnNo;

             //console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectCustDupScreenByKey.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR);
                     //console.log(jqXHR.responseJSON);
                     mob.notification.info(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
//                      console.log("Dup Check. result!!!");
//                      console.log(result);
//                      console.log(result.total);
                 }
             }).done(function(result) {

                 if (result.total == 0 ){
                     mob.notification.info("<spring:message code='global.info.ableToDo' />");
                 } else {

                     // 이미 존재합니다. 확인 하시겠습니까?
                     var custNo = result.data[0].custNo;
                     var msg = "<spring:message code='crm.info.hpNoDupCustConfirm' />";
                     dms.window.confirm({
                         message:msg
                         ,title :"<spring:message code='global.lbl.info' />"
                         ,callback:function(result){
                             if(result){
                                 parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+custNo, "VIEW-D-10272"); // CUST NO
                             }else{
                                 return false;
                             }
                         }
                     });
                 }

             });
         }
     }

     // 증거유형 증거번호 체크
     function getCustMathDocDupByKey(idVal){

         var custTp = $("#custTp").data("kendoExtDropDownList").value();
         var custCd = $("#custCd").val();
         var custNm = $("#custNm").val();
         var custNo = $("#custNo").val();
         var hpNo = $("#hpNo").val();
         var mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         var ssnCrnNo = $("#ssnCrnNoC").val();
         var officeTelNo = "";
         var oldCustNm = $("#oldCustNm").val();
         var oldHpNo = $("#oldHpNo").val();
         var oldMathDocTp = $("#oldMathDocTp").val();
         var oldSsnCrnNo = $("#oldSsnCrnNo").val();
         var chkContinued = false;

         if (custTp == "02") {
             custNm = $("#custNmC").val();
             mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
             ssnCrnNo = $("#ssnCrnNoC").val();
         }

         if (dms.string.isNotEmpty(mathDocTp) && dms.string.isNotEmpty(ssnCrnNo)){

             var param = {};
             param["sCustNo"]        = custNo;
             param["sCustCd"]        = custCd;
             param["sCustTp"]        = custTp;
             param["sCustNm"]        = custNm;
             param["sHpNo"]          = hpNo;
             param["sOfficeTelNo"]   = officeTelNo;
             param["sMathDocTp"]     = mathDocTp;
             param["sSsnCrnNo"]      = ssnCrnNo;
             param["sOldCustNm"]     = oldCustNm;
             param["sOldHpNo"]       = oldHpNo;
             param["sOldMathDocTp"]  = oldMathDocTp;
             param["sOldSsnCrnNo"]   = oldSsnCrnNo;

//              console.log(param);

             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/selectCustMathDocDupByKey.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR);
//                      console.log(jqXHR.responseJSON);
                     mob.notification.info(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
//                      console.log("getCustMathDocDupByKey !!! ");
//                      console.log(result);

                     if (result.total == 0 ){
                         mob.notification.info("<spring:message code='global.info.ableToDo' />");
                     } else {
                         mob.notification.info("<spring:message code='global.info.already' />");
                     }
                 }
             }).done(function(result) {
                 console.log("done!!!!");
             });
         }
     }

    //저장
    function doSave(){

        var custNm = $("#custNmSearch").val();
        var custNmC = $("#custNmSearchC").val();
        var custTp = $("#custTp").data("kendoExtDropDownList").value();
        var hpNo = $("#hpNo").val();
        var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
        var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
        var leadStatCd = $("#leadStatCd").data("kendoExtDropDownList").value();
        //var officeTelNo = $("#officeTelNoC").val();

        var mathDocTpCVal = $("#mathDocTpC").data("kendoExtDropDownList").value();
        var ssnCrnNoCVal = $("#ssnCrnNoC").val();

        // 법인연계인 (구매담당자)
        var relCustNm = $("#relCustNm").val();
        var relCustHpNo = $("#relCustHpNo").val();

        var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

        var custNo = $("#custNo").val();

        if ( dms.string.isEmpty(infoTp) ) {
            mob.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }

        if ( dms.string.isEmpty(holdTp) ) {
            mob.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }

        if ( dms.string.isEmpty(intrCarlineCd) ) {
            mob.notification.warning("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        }

        if (custTp =="01") {
            if ( dms.string.isEmpty(hpNo) ) {
                mob.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }
        } else {

//             if ( dms.string.isEmpty(officeTelNo) ) {
//                 dms.notification.warning("<spring:message code='global.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                 return false;
//             };
            if ( dms.string.isEmpty(relCustNm) ) {
                mob.notification.warning("<spring:message code='crm.lbl.corpPurcMng' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }
            if ( dms.string.isEmpty(relCustHpNo) ) {
                mob.notification.warning("<spring:message code='crm.lbl.corpPurcMngHpno' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            if (mathDocTpCVal == "10") {
                if (ssnCrnNoCVal.length != 18) {
                    mob.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.lengthCheckMsg' arguments='${returnMsg}' />");
                    $("#ssnCrnNoC").focus();
                    return false;
                }
            }

        }

        var salesOpptProcParam =
            $("#salesOpptProcForm").serializeObject(
                    $("#salesOpptProcForm").serializeArrayInSelector("[data-json-obj='true']")
            );

        var dataSource = document.getElementById("addressList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
        var addrGridData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

        var total = addrGridData.deleteList.length + addrGridData.insertList.length + addrGridData.updateList.length;
        if (total != 0){
            $.each(addrGridData.insertList, function(idx, row){
                if(row.addrTp == ""){
                   // 선택하지 않은 주소요형이 있습니다.
                   mob.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                   //dataValidate = true;
                   return false;
                }
            });
        }

        // enable data Assign
        salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
        salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
        salesOpptProcParam["custNm"] = $("#custNmSearch").val();
        salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
        salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
        salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

        if (custTp == "02"){
            salesOpptProcParam["custTp"] = $("#custTpC").data("kendoExtDropDownList").value();
            salesOpptProcParam["custNm"] = $("#custNmSearchC").val();
            salesOpptProcParam["mathDocTp"] = $("#mathDocTpC").data("kendoExtDropDownList").value();
            salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
            salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
            //salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
            salesOpptProcParam["wechatId"] = $("#wechatIdC").val();
        }

        if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };

        var saveData = $.extend(
            {"salesOpptProcessMgmtVO":salesOpptProcParam }
            , {"addressInfoVOList":addrGridData}
        );

        mob.loading.show();
        $.ajax({
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
            ,data:JSON.stringify(saveData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                //console.log("error !!!");
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);

                mob.loading.hide();
                console.log(jqXHR);

                //mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success:function(result){
                mob.loading.hide();

                mob.notification.success("<spring:message code='global.info.success'/>");

                parent.contentListNonRefresh();

            }
        }).done(function(result) {

            //parent.$("#btnStep02").click();
            parent.$("#btnCtlSearch").click();
            parent.editCustPopupWindow.close();

        });

    }

    //주소추가 팝업 callback
     function callbackAddr(data){
        document.getElementById("addressList").contentWindow.addItemSubList1(data);
     }
     //addressList change Event Callback
    function saveAddressList(){
        //nothing
    }

    //고객검색 팝업 callback
    function callbackCust(data){

        if ( dms.string.isNotEmpty(data.custNo) ) {
            $("#custNo").val(data.custNo);
        }
                                //popupWindow.close();
        //$("#btnCustSearch").click();

        var param = {};
        param["sCustNo"] = $("#custNo").val();




       $.ajax({
           url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
           , data:JSON.stringify(param)
           , type:'POST'
           , dataType:'json'
           , contentType:'application/json'
           , error:function(jqXHR,status,error){
               //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);

               console.log("error !!!");

                mob.loading.hide();
                console.log(jqXHR);

                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
           }
       }).done(function(result) {

           $("#dlrCd").val(result.data[0].dlrCd);

           $("#custNm").val(result.data[0].custNm);
           $("#custNmSearch").val(result.data[0].custNm);
           //$("#custTp").data("kendoExtDropDownList").enable(false);
           $("#hpNo").val(result.data[0].hpNo);
           $("#telNo").val(result.data[0].telNo);
           $("#officeTelNo").val(result.data[0].officeTelNo);
           $("#wechatId").val(result.data[0].wechatId);
           $("#emailNm").val(result.data[0].emailNm);
           $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);
           $("#holdTp").data("kendoExtDropDownList").value(result.data[0].holdTp);
           $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([{holdSeq:result.data[0].holdDetlTpSeq, holdDetlTpNm:trimNull(result.data[0].holdDetlTpSeqNm)}]);
           $("#holdDetlTpSeq").data("kendoExtDropDownList").value(result.data[0].holdDetlTpSeq);
           $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
           //$("#expcPurcHmCd").data("kendoExtDropDownList").value(result.data[0].expcPurcHmCd);
           $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
           $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{modelNm:result.data[0].intrFscpModtpNm, modelCd:result.data[0].intrFscpModtpCd}]);
           $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);
           $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
           $("#natNofScheNo").val(result.data[0].natNofScheNo);
           $("#estimateCont").val(result.data[0].estimateCont);
           $("#salesCont").val(result.data[0].salesCont);
           $("#remark").val(result.data[0].remark);
           $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
           $("#leadStatCd").data("kendoExtDropDownList").value(result.data[0].leadStatCd);
           $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
           $("#seq").val(result.data[0].seq);

           //$("#custTp").data("kendoExtDropDownList").value();

           /*if (result.data[0].custTp == "01") {
               $("#hpNo").parent().addClass("f_disabled");
               $("#hpNo" ).prop('readonly', true);
               $("#officeTelNo").parent().removeClass('f_disabled');
               $("#officeTelNo" ).prop('readonly', false);
           } else {
               $("#officeTelNo").parent().addClass("f_disabled");
               $("#officeTelNo" ).prop('readonly', true);
               $("#hpNo").parent().removeClass('f_disabled');
               $("#hpNo" ).prop('readonly', false);
           }*/

           if (result.data[0].custTp == "01") {
                   $(".crop").hide();
                   $(".person").show();
                   $('#trCustNmC > th').html('<spring:message code="global.lbl.custNm" />');
                   /* $("#hpNo").parent().addClass("f_disabled");
                   $("#hpNo" ).prop('readonly', true); */
                   /* $("#officeTelNo").parent().removeClass('f_disabled');
                   $("#officeTelNo" ).prop('readonly', false); */
               } else {
                   $(".crop").show();
                   $(".person").hide();
                   $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
                   $("#officeTelNoC").parent().addClass("f_disabled");
                   $("#officeTelNoC" ).prop('readonly', true);
                   /* $("#hpNo").parent().removeClass('f_disabled');
                   $("#hpNo" ).prop('readonly', false); */
               }

           //$("#addrGrid").data("kendoExtGrid").dataSource.read();
            mob.loading.hide();
       });
    }


    function goMain(){
        parent.editCustPopupWindow.close();
    }


   /*  function setHeaderTitle() {

        var titleStr = $("#titleStr").val();
        if (titleStr == "selectSalesOpptProcessMgmtFailMain") {
            $("#header_title").html("<spring:message code='crm.menu.failCustomerDB' />"); //잠재고객 DB
            $("#edit_title").html("<h1><spring:message code='global.lbl.failCustomerDBEdit' /></h1>"); //잠재고객 DB
        }
    } */

 </script>

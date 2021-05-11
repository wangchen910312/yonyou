<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script> <!-- khs0315 -->
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">

    <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail">
            <div class="co_group">
                <div class="content_title conttitlePrev" id="edit_title">
                    <h1><spring:message code="global.lbl.saleOpptEdit" /><!-- 판매기회 수정 --></h1>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody  >
                                <tr id="trCustNmC">
                                    <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --> </th>
                                    <td>
                                        <div class="f_item01">
                                            <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input onKey_down" <input type="text" onkeyup="return specialCharRemove(event)" />/>
                                            <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                            <!--  <span class="customer" id="custSearch"><spring:message code="global.lbl.custSearch" /> --><!-- 고객조회 --></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custNo" name="custNo" data-json-obj="true" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="custTp" name="custTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" class="numberic" id="hpNo" name="hpNo" maxlength="11" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="crm.lbl.corpPurcMng" /><!-- 구매담당자명 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="relCustNm" name="relCustNm" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" class="numberic" id="relCustHpNo" name="relCustHpNo" maxlength="11" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" ><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mathDocTp" name="mathDocTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code="global.lbl.homeTelNo" /><!-- 집전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="number" class="numberic" id="telNo" name="telNo" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증거번호 --></th>
                                    <td>
                                        <div class="f_text"><input id="ssnCrnNoC" type="text" value="" class="form_input numberandalpha"  pattern="[0-9A-Z]" maxlength="30" /></div>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 회사전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="officeTelNo" name="officeTelNo" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr> --%>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="bizcondCdC" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 회사전화 --></th>
                                    <td>
                                        <div class="f_text"><input id="officeTelNoC" type="number" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.wechatId" /><!-- Wechat ID --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="wechatId" name="wechatId" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.sex' /><!-- 성별 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="sexCd" name="sexCd" data-json-obj="true"  /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 이메일 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="emailNm" name="emailNm" maxlength="40" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.addrNm' /><!-- 주소 --></th>
                                    <td>
                                        <p id="addrNm" name="addrNm" readonly="readonly" style="border-bottom: 1px solid #909090; min-height: 38px; box-sizing: border-box; padding: 8px" ></p>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <p id="addrNmDetail" name="addrNmDetail" readonly="readonly" style="border-bottom: 1px solid #909090; min-height: 38px; box-sizing: border-box; padding: 8px" ></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


            <!-- 주소  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='global.lbl.addr' /><!-- 주소 --></h2>
                    <div class="title_btn">
                    <dms:access viewId="VIEW-D-13125" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="tbtn" id="btnAddAddress" ><spring:message code="global.btn.add" /><!-- 추가 --></span>
                    </dms:access>
                        <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
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

            <!-- 유입경로  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.approchLocation" /></h2>
                    <div class="title_btn">
                        <!-- <span class="co_open co_close" id="btnAddrSearch"><span>상세내용 접기 </span></span> -->
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption>기본정보</caption>
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
                                    <th scope="row"><spring:message code='crm.lbl.intentionColor' /><!-- 의향생상 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="intrColorCd" name="intrColorCd" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <th scope="row"><spring:message code='crm.lbl.expectPureTime' /><!-- 예상구매시간코드/예상구매시간 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="expcPurcHmCd" name="expcPurcHmCd" data-json-obj="true" /></div>
                                    </td>
                                </tr> --%>
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
            <!-- // 유입경로  -->

            <!-- 견적정보  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.estimateInfo' /><!-- 견적정보 --></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption>기본정보</caption>
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
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 견적정보  -->

            <!-- 리드상태  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></h2>
                    <div class="title_btn">
                        <!-- <span class="co_open co_close"><span>상세내용 접기 </span></span> -->
                    </div>
                </div>
                <div class="co_view" style=";">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption>기본정보</caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.prsn' /><!-- 담당자 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="mngScId" name="mngScId" data-json-obj="true" /></div>
                                        <input type="hidden" id="beforeMngScId" name="beforeMngScId" /> <!-- //khs0315 -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="leadStatCd" name="leadStatCd" data-json-obj="true"  /></div>
                                    </td>
                                </tr>
                                <tr id="usrPwTr" style="display: none;"> <!-- //khs0315 -->
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
            <!-- // 기타정보  -->

            <!-- 추적기록 -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.activeHistory" /><!-- 추적기록 --></h2><!-- 추적이력 -->
                    <div class="title_btn">
                        <span class="co_open co_close" id="activeHistoryListBtn"><span></span></span>
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
                            <span style="width:100%"><spring:message code='crm.title.detailCont' /><!-- 상세내용 --></span>
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
            <input type="hidden" id="titleStr" name="titleStr" disabled="disabled"/>

        </section>
    </div><!--  salesOpptProcForm End  -->

    <!-- 버튼 2개  -->
    <div class="con_btnarea btncount2">
    <dms:access viewId="VIEW-D-13127" hasPermission="${dms:getPermissionMask('READ')}">
        <div><span class="btnd1t2" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></span></div>
    </dms:access>
    <dms:access viewId="VIEW-D-13126" hasPermission="${dms:getPermissionMask('READ')}">
        <div><span class="btnd1" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></span></div>
    </dms:access>
    </div>
    <!-- //버튼  -->

</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>


<!-- script -->

 <script type="text/javascript">

 var mngScIdCtrl = "${mngScIdCtrl}";
 var salesOpptPwYn ="${salesOpptPwYn}"; //khs0315
 var checkUserPw = false; //khs0315

 var userId;

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
     var validGradeCdMap = [];


 var bizcondCdList   = [];
 var mathDocTpList = [];

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
     var options;
     $(document).ready(function() {

      // 고객확보유형1      holdTp      (CRM008)
        $("#holdTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , dataSource:holdTpList
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           ,select:onSelectSearchHoldTp
       });

// 고객확보유형2      holdDetlTpSeq   (CRM***)
        $("#holdDetlTpSeq").kendoExtDropDownList({
           dataTextField:"holdDetlTpNm"
           , dataValueField:"holdSeq"
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           , enable:false
        });

        $("#infoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:infoTpList
            , index:0
        });

        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:custTpList
            , index:0
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
             , dataSource:bizcondCdList
             , index:0
             , enable:true
         });

        $("#payTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:payTpList
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
           ,select:onSelectSearchCarlineCd
        });

        /**
         * 모델 콤보박스
         */
         $("#intrFscpModtpCd").kendoExtDropDownList({
             dataTextField:"fscNm"
            ,dataValueField:"fscCd"
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
            , change:function(e){ //khs0315
               if(!dms.string.isEmpty($("#beforeMngScId").val())&&$("#beforeMngScId").val()!==$("#mngScId").val()&&salesOpptPwYn=="Y"){
                   $("#usrPwTr").show();
                   checkUserPw=true;
               }else{
                   $("#usrPwTr").hide();
                   checkUserPw=false;
               }
            }
            , index:0
        });
        //$("#mngScId").data("kendoExtDropDownList").enable(false);

        $("#leadStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:leadStatCdList
            , index:0
        });
        $("#leadStatCd").data("kendoExtDropDownList").enable(false);

        $("#sexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:"<spring:message code='global.lbl.check'/>"
            , dataSource:sexCdList
            , index:0
        });
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

         /* // 숫자
         $('.numberic').on('input', function (event) {
             this.value = this.value.replace(/[^0-9]/g, '');
         }); */

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

        // 버튼 - 이전
       $("#docu_prev").bind("click", function()
       {
           parent.$("#formarea").show();
           if ($("#content_detail").css("display") == "block") { goMain(); }
           //else if ($("#content_pop_search").css("display") == "block") { contentList(); }
           //else if ($("#content_detail").css("display") == "block") { contentList(); }

       });

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



        options = parent.editCustPopupWindow.options.content.data;
        $("#titleStr").val(options.titleStr);

        setHeaderTitle();

        $("#btnCustSearch").click(function(){
           var param = {};

           param["sCustNo"] = $("#custNo").val();

           console.log("btnCustSearch Call !!");
           console.log(param);

           $.ajax({
               url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
               , data:JSON.stringify(param)
               , type:'POST'
               , dataType:'json'
               , contentType:'application/json'
               , error:function(jqXHR,status,error){
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
           }).done(function(result) {
               console.log("result",result);

               var leadStatCd = result.data[0].leadStatCd;


               $("#bhmcYn").val(result.data[0].bhmcYn);

               $("#dlrCd").val(result.data[0].dlrCd);

               $("#custNm").val(result.data[0].custNm);
               $("#custNmSearch").val(result.data[0].custNm);
               $("#custTp").data("kendoExtDropDownList").value(result.data[0].custTp);

               if(result.data[0].custCd == "02"){
                   $("#custTp").data("kendoExtDropDownList").enable(false);
               }

               $("#hpNo").val(result.data[0].hpNo);
               $("#telNo").val(result.data[0].telNo);
               $("#officeTelNo").val(result.data[0].officeTelNo);
               $("#wechatId").val(result.data[0].wechatId);
               $("#emailNm").val(result.data[0].emailNm);
               $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);
               $("#holdTp").data("kendoExtDropDownList").value(result.data[0].holdTp);
               $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([{holdSeq:result.data[0].holdDetlTpSeq, holdDetlTpNm:result.data[0].holdDetlTpSeqNm}]);
               if(result.data[0].holdDetlTpSeq == null || result.data[0].holdDetlTpSeq == "null"){
                   $("#holdDetlTpSeq").data("kendoExtDropDownList").value("");
               }else{
                   if(typeof holdDetlTpSeqMap[result.data[0].holdDetlTpSeq] == "undefined" ){
                       $("#holdDetlTpSeq").data("kendoExtDropDownList").value("");
                   }else{
                       $("#holdDetlTpSeq").data("kendoExtDropDownList").value(trimNull(result.data[0].holdDetlTpSeq));
                   }
               }
               $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
               //$("#expcPurcHmCd").data("kendoExtDropDownList").value(result.data[0].expcPurcHmCd);
               $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{fscNm:result.data[0].intrFscpModtpNm, fscCd:result.data[0].intrFscpModtpCd}]);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);
               $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
               $("#natNofScheNo").val(result.data[0].natNofScheNo);
               $("#estimateCont").val(result.data[0].estimateCont);
               $("#salesCont").val(result.data[0].salesCont);
               $("#remark").val(result.data[0].remark);
               $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
               $("#beforeMngScId").val(result.data[0].mngScId);
               $("#leadStatCd").data("kendoExtDropDownList").value(leadStatCd);
               $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
               $("#seq").val(result.data[0].seq);
               $("#exhvFlakSeq").val(result.data[0].exhvFlakSeq);

               $("#mathDocTp").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
               $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
               $("#bizcondCdC").data("kendoExtDropDownList").value(result.data[0].bizcondCd);
               $("#officeTelNoC").val(result.data[0].officeTelNo);
               $("#relCustNm").val(result.data[0].purcMngNm);
               $("#relCustHpNo").val(result.data[0].hpNo);

               if (result.data[0].localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true) };

               /*$("#validGradeCd").data("kendoExtDropDownList").value(result.data[0].validGradeCd);
               $("#invalidCauCd").data("kendoExtDropDownList").value(result.data[0].invalidCauCd);
*/
               if (result.data[0].validGradeCd == "02") {
                   //$("#validGradeCd").data("kendoExtDropDownList").enable(false);
               }

               //$("#custTp").data("kendoExtDropDownList").value();

/*
               if (result.data[0].custTp == "01") {
                   $("#hpNo").parent().addClass('f_disabled');
                   $("#hpNo" ).prop('readonly', true);
                   $("#officeTelNo").parent().removeClass('f_disabled');
                   $("#officeTelNo" ).prop('readonly', false);
               } else {
                   $("#officeTelNo").parent().addClass('f_disabled');
                   $("#officeTelNo" ).prop('readonly', true);
                   $("#hpNo").parent().removeClass('f_disabled');
                   $("#hpNo" ).prop('readonly', false);
               }*/

               if (result.data[0].custTp == "01") {
                   $(".crop").hide();
                   $(".person").show();
                   $('#trCustNmC > th').html('<spring:message code="global.lbl.custNm" />');
                   //$("#hpNo").parent().addClass("f_disabled");
                   //$("#hpNo" ).prop('readonly', true);
                   /* $("#officeTelNo").parent().removeClass('f_disabled');
                   $("#officeTelNo" ).prop('readonly', false); */
               } else {
                   $(".crop").show();
                   $(".person").hide();
                   $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
                   $("#officeTelNoC").parent().addClass("f_disabled");
                   $("#officeTelNoC" ).prop('readonly', true);
                   //$("#hpNo").parent().removeClass('f_disabled');
                   //$("#hpNo" ).prop('readonly', false);
               }

               // 상태에 따른 처리
               if (leadStatCd == "00" || leadStatCd =="01") {
                   //$("#mngScId").data("kendoExtDropDownList").enable(false);
               }

               //$("#addrGrid").data("kendoExtGrid").dataSource.read();

           });

        });
        //고객조회
        $("#custSearch").click(function(){
           var param = {};

            var custTp = $("#custTp").data("kendoExtDropDownList").value();
            var custNm = $("#custNmSearch").val();
            if (custTp == "02") {
                custNm = $("#custNmSearchC").val();
            }

            parent.custSearchPop(callbackCust,custNm);

        });

        //var options = parent.editCustPopupWindow.options.content.data;

       $("#leadStatCd").data("kendoExtDropDownList").value(options.leadStatCd);

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

                var custNmSearch = $("#custNmSearch").val();
                var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
                var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

                if (dms.string.isEmpty(custNmSearch)) {
                    mob.notification.info("<spring:message code='par.lbl.custNm' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                }

                if (dms.string.isEmpty(infoTp)) {
                    mob.notification.info("<spring:message code='crm.lbl.leadTp' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                }

                if (dms.string.isEmpty(holdTp)) {
                    mob.notification.info("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                }

                if (dms.string.isEmpty(intrCarlineCd)) {
                    mob.notification.info("<spring:message code='crm.lbl.intentionCarline' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                }

                if(checkUserPw){ //khs0315
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
                                confirmOpen(confirmMsgSave,'doSave',y,n);

                            } else {
                                mob.notification.success("<spring:message code='global.err.invalid.idpw'/>");
                            }
                        }
                    });
                }else{
                    parent.$("#formarea").show();
                    confirmOpen(confirmMsgSave,'doSave',y,n);
                }
            }
        });

        if (mngScIdCtrl == "N") {

            $("#mngScId").data("kendoExtDropDownList").value(userId);
            $("#mngScId").data("kendoExtDropDownList").enable(false);
        }

        if($("#leadStatCd").data("kendoExtDropDownList").value() == "05" || $("#leadStatCd").data("kendoExtDropDownList").value() == "06"){
            $("#mngScId").data("kendoExtDropDownList").enable(false);
        }


        //버튼 - 주소  추가onSelectSearchCarlineCd
        var zipCodeSearchPopupWin;
        $("#btnAddAddress").click(function(){
            parent.zipcodeSearchPop(callbackAddr);
        });
        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }
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
             url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do'/>"
             ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
             ,async:false
         });
         $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
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
             ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd, "sSiebelHoldRowIdYn":"N"})
             ,async:false
         });
         $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);

     }

    //저장
    function doSave(){
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

        var custTp = $("#custTp").data("kendoExtDropDownList").value();

        // enable data Assign
        salesOpptProcParam["leadStatCd"] = $("#leadStatCd").data("kendoExtDropDownList").value();
        salesOpptProcParam["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
        salesOpptProcParam["custNm"] = $("#custNmSearch").val();
        salesOpptProcParam["custNo"] = $("#custNo").val();
        salesOpptProcParam["mngScId"] = $("#mngScId").data("kendoExtDropDownList").value();
        salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").data("kendoExtDropDownList").value();
        salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

        if (custTp == "02"){
            salesOpptProcParam["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
            salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
            salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
            salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
            salesOpptProcParam["wechatId"] = $("#wechatId").val();
            salesOpptProcParam["custNm"] = $("#custNmSearch").val();
            salesOpptProcParam["relCustNm"] = $("#relCustNm").val();
            salesOpptProcParam["relCustHpNo"] = $("#relCustHpNo").val();
        }

        if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };


        var saveData = $.extend(
            {"salesOpptProcessMgmtVO":salesOpptProcParam }
            , {"addressInfoVOList":addrGridData}
        );

        console.log("Saving of Request Info. !!");
        console.log(saveData);

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

                console.log("error !!!");

                mob.loading.hide();
                console.log(jqXHR);

                //mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success:function(result){
                mob.loading.hide();
                console.log(result);
                console.log("success!!!!");
                mob.notification.success("<spring:message code='global.info.success'/>");

                var data = [];
                //data.push(result);
                //options.callbackFunc(data);
                //parent.$("#content_detail").hide();

                /*
                if(options.leadStatCd == "05"){
                    parent.$("#btnStep99").click();
                }else{
                    parent.$("#btnStep"+options.leadStatCd).click();
                }
                */
                parent.$("#content_detail").css("display","none");
                parent.$("#btnStep"+parent.btnLeadStatCd).click();
                parent.editCustPopupWindow.close();





            }
        }).done(function(result) {
            console.log("Done!!!!");
            //parent.$("#btnStep02").click();
            /* parent.$("#btnStep"+options.leadStatCd).click();
            parent.editCustPopupWindow.close(); */

        });

    }

    //주소추가 팝업 callback
     function callbackAddr(data){
        document.getElementById("addressList").contentWindow.addItemSubList1(data);
     }


    //고객검색 팝업 callback
    function callbackCust(data){
        console.log(">>>> callbackCust <<<<");
        if ( dms.string.isNotEmpty(data.custNo) ) {
            $("#custNo").val(data.custNo);
        }
                                //popupWindow.close();
        //$("#btnCustSearch").click();

        var param = {};
        param["sCustNo"] = $("#custNo").val();

       console.log("btnCustSearch Call !!");
       console.log(param);

       $.ajax({
           url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
           , data:JSON.stringify(param)
           , type:'POST'
           , dataType:'json'
           , contentType:'application/json'
           , error:function(jqXHR,status,error){

               console.log("error !!!");

                mob.loading.hide();
                console.log(jqXHR);

                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
           }
       }).done(function(result) {
           console.log(result);
           $("#dlrCd").val(result.data[0].dlrCd);

           $("#custNm").val(result.data[0].custNm);
           $("#custNmSearch").val(result.data[0].custNm);
           $("#custTp").data("kendoExtDropDownList").enable(false);
           $("#hpNo").val(result.data[0].hpNo);
           $("#telNo").val(result.data[0].telNo);
           $("#officeTelNo").val(result.data[0].officeTelNo);
           $("#wechatId").val(result.data[0].wechatId);
           $("#emailNm").val(result.data[0].emailNm);
           $("#infoTp").data("kendoExtDropDownList").value(result.data[0].infoTp);
           $("#holdTp").data("kendoExtDropDownList").value(result.data[0].holdTp);
           $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([{holdSeq:result.data[0].holdDetlTpSeq, holdDetlTpNm:trimNull(result.data[0].holdDetlTpSeqNm)}]);
           $("#holdDetlTpSeq").data("kendoExtDropDownList").value(trimNull(result.data[0].holdDetlTpSeq));
           $("#payTp").data("kendoExtDropDownList").value(result.data[0].payTp);
           //$("#expcPurcHmCd").data("kendoExtDropDownList").value(result.data[0].expcPurcHmCd);
           $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
           $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{fcsNm:result.data[0].intrFscpModtpNm, fcsCd:result.data[0].intrFscpModtpCd}]);
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
                   //$("#hpNo").parent().addClass("f_disabled");
                   //$("#hpNo" ).prop('readonly', true);
                   /* $("#officeTelNo").parent().removeClass('f_disabled');
                   $("#officeTelNo" ).prop('readonly', false); */
               } else {
                   $(".crop").show();
                   $(".person").hide();
                   $('#trCustNmC > th').html('<spring:message code="crm.lbl.corpNm" />');
                   $("#officeTelNoC").parent().addClass("f_disabled");
                   $("#officeTelNoC" ).prop('readonly', true);
                   //$("#hpNo").parent().removeClass('f_disabled');
                   //$("#hpNo" ).prop('readonly', false);
               }

           //$("#addrGrid").data("kendoExtGrid").dataSource.read();
            mob.loading.hide();
       });
    }
    function goMain(){
        parent.editCustPopupWindow.close();
    }
    function setHeaderTitle() {

        var titleStr = $("#titleStr").val();
        if (titleStr == "selectSalesOpptProcessMgmtFailMain") {
            $("#header_title").html("<spring:message code='crm.menu.failCustomerDB' />"); //잠재고객 DB
            $("#edit_title").html("<h1><spring:message code='global.lbl.failCustomerDBEdit' /></h1>"); //잠재고객 DB
        }
    }

    function setSubListHeight(){
        $("#leadStatusExchangeList").height(180);
    }

  //<![CDATA[
    //정규식 특수문자 제거하기
    function specialCharRemove(obj) {

        var val = obj.srcElement.value;
        var pattern = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;   // 특수문자 제거

        //var pattern = /[^(0-9)]/gi;   // 숫자이외는 제거

        if(pattern.test(val)){
        obj.value = val.replace(pattern,"");
        }

        return obj;
    }
    //]]>

 </script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<section id="content">
    <div class="content_right" id="salesOpptProcForm">
        <section id="content_detail" class="content_detail">
            <div class="co_group">
                <div class="content_title conttitlePrev ">
                    <h1><spring:message code='global.title.basicInfo' /><!-- 기본정보 --></h1>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption>기본정보</caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody  >
                                <tr id="trCustNmC">
                                    <th scope="row" class="required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --> </th>
                                    <td>
                                        <div class="f_item01 f_disabled">
                                            <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input onKey_down" readonly="readonly" />
                                            <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                            <%-- <span class="customer" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span> --%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                    <td>
                                        <div class="f_text f_disabled   "><input type="text" id="custNo" name="custNo" data-json-obj="true" readonly="readonly" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="required"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="custTp" name="custTp" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="crm.lbl.corpPurcMng" /><!-- 구매담당자명 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="relCustNm" name="relCustNm" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="person">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="number" class="numberic" id="hpNo" name="hpNo" maxlength="20" data-json-obj="true" /></div>
                                    </td>
                                </tr>
                                <tr class="crop" style="display:none;">
                                    <th scope="row" class="required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text"><input type="number" class="numberic" id="relCustHpNo" name="relCustHpNo" maxlength="20" data-json-obj="true" /></div>
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
                                        <div class="f_text"><input type="text" id="telNo" name="telNo" maxlength="20" data-json-obj="true" /></div>
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
                                    <th scope="row" class="required"><spring:message code="global.lbl.officeTelNo" /><!-- 회사전화 --></th>
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
            </div><!-- //co_group  -->

            <!-- 주소  -->
            <c:import url="/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/listJsp/selectCustomerInfoAddressList.jsp"></c:import>
            <!-- // 주소  -->

            <!-- 유입경로  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.expcPurcInfo' /><!-- 예상구매정보 --></h2>
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
            <!-- // 유입경로  -->

            <!-- 기타정보  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code='crm.lbl.estimateInfo' /><!-- 협의정보 --></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 접기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none">
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
            <!-- // 기타정보  -->

            <!-- 리드상태  -->
            <div class="co_group">
                <div class="content_title" style="height:10px">
                <!--
                  <h2><spring:message code='crm.lbl.agrmntInfo' /></h2>
                <div class="title_btn">
                    <span class="co_open co_close" ><span>상세내용 접기 </span></span>
                </div>
                -->
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
                                        <input id="beforeMngScId" name="beforeMngScId" type="hidden" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="leadStatCd" name="leadStatCd" data-json-obj="true"  /></div>
                                    </td>
                                </tr>
                                <tr id="usrPwTr" style="display: none;">
                                    <th scope="row"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
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

            <input type="hidden" id="bhmcYn" name="bhmcYn"  value="N" class="form_input" data-json-obj="true" />
            <input type="hidden" id="btnCustSearch" />
            <input type="hidden" id="dlrCd" name="dlrCd"  data-json-obj="true" />
            <input type="hidden" id="seq" name="seq"  data-json-obj="true" />
            <input type="hidden" id="custSearch" name="custSearch"  class="custSearch" />

        </section>
    </div><!--  salesOpptProcForm End  -->

    <!-- 버튼 2개  -->
    <div class="con_btnarea btncount2">
        <div style="width:50%" ><span class="btnd1t2" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></span></div>
        <div style="width:50%"><span class="btnd1" id="btnCtlFailSendBefore"><spring:message code="crm.btn.trans" /><!-- 전출 --></span></div>
        <input type="hidden" id="btnCtlFailSend" />
    </div>

</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>

 <script type="text/javascript">
 var dateFormat =  '<dms:configValue code="dateFormat" />';
 var dlrCd  = "${dlrCd}";    // 딜러코드
 var dlrNm  = "${dlrNm}";    // 딜러
 var userId = "${userId}";   // 사용자코드
 var userNm = "${userNm}";   // 사용자

 var mngScIdCtrl = "${mngScIdCtrl}";
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
     var activeGradeCdList = [];
     var activeGradeCdMap = [];

     var custTpList = [];
     var custTpMap = [];
     var infoTpList = [];
     var payTpList = [];
     var expcPurcHmCdList = [];

 var bizcondCdList   = [];
 var mathDocTpList = [];

 var options = parent.editCustPopupWindow.options.content.data;

 <c:forEach var="obj" items="${mathDocTpList}">
    //<c:if test="${obj.remark1 == 'C'}">
        mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    //</c:if>
 </c:forEach>

 <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

     <c:forEach var="obj" items="${holdTpList}">
         holdTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${holdDetlTpSeqList}">
     holdDetlTpSeqList.push({"cmmCd":"${obj.holdSeq}" , "cmmCdNm":"${obj.holdDetlTpNm}", "useYn":"${obj.delYn}"});
     holdDetlTpSeqMap["${obj.holdSeq}"] = "${obj.holdDetlTpNm}";
 </c:forEach>

     <c:forEach var="obj" items="${expcPurcHmCdList}">
         expcPurcHmCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${payTpList}">
         payTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${infoTpList}">
         infoTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
     </c:forEach>

     <c:forEach var="obj" items="${custTpList}">
         custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${leadStatCdList}">
         leadStatCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${sexCdList}">
         sexCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${activeGradeCdList}">
         activeGradeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
         activeGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     <c:forEach var="obj" items="${infoPathCdList}">
         infoPathCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
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
         addrTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
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

        // 고객확보유형1      holdTp      (CRM008)
        $("#holdTp").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
           , dataValueField:"cmmCd"
           , dataSource:holdTpList
           , optionLabel:"<spring:message code='global.lbl.check'/>"
           /* , filter:"contains"
           , filtering:function(e){
               var filter = e.filter;
           } */
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
        $("#purcSelCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:"<spring:message code='global.lbl.check'/>"
           /* , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           } */
           ,select:onSelectSearchSelCarlineCd
        });

        /**
         * 모델 콤보박스
         */
        /*  $("#purcFscpModtpCd").kendoExtDropDownList({
             dataTextField:"modelNm"
            ,dataValueField:"modelCd"
            //,filter:"contains"
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
         });
         $("#purcFscpModtpCd").data("kendoExtDropDownList").enable(false); */

        /**
         * 차종 콤보박스
         */
        $("#intrCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:"<spring:message code='global.lbl.check'/>"
           /* , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           } */
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
        $("#mngScId").data("kendoExtDropDownList").enable(false);

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

       $("#btnCustSearch").click(function(){
           var param = {};
           param["sCustNo"] = $("#custNo").val();

           console.log("btnCustSearch Call !!");
           console.log(param);

           mob.loading.show();
           $.ajax({
               url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do' />"
               , data:JSON.stringify(param)
               , type:'POST'
               , dataType:'json'
               , contentType:'application/json'
               , error:function(jqXHR,status,error){
                   mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   mob.loading.hide();
                   console.log(jqXHR);

                   //mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
               }
           }).done(function(result) {
               mob.loading.hide();

               console.log(result);
               $("#dlrCd").val(result.data[0].dlrCd);

               $("#custNm").val(result.data[0].custNm);
               $("#custNmSearch").val(result.data[0].custNm);
               $("#custTp").data("kendoExtDropDownList").value(result.data[0].custTp);
               $("#custTp").data("kendoExtDropDownList").enable(false);
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
               $("#intrCarlineCd").data("kendoExtDropDownList").value(result.data[0].intrCarlineCd);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").setDataSource([{fscNm:result.data[0].intrFscpModtpNm, fscCd:result.data[0].intrFscpModtpCd}]);
               $("#intrFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].intrFscpModtpCd);
               $("#intrColorCd").data("kendoExtDropDownList").value(result.data[0].intrColorCd)
               $("#natNofScheNo").val(result.data[0].natNofScheNo);
               $("#estimateCont").val(result.data[0].estimateCont);
               $("#salesCont").val(result.data[0].salesCont);
               $("#remark").val(result.data[0].remark);
               $("#mngScId").data("kendoExtDropDownList").value(result.data[0].mngScId);
               if (mngScIdCtrl == "N") {
                   //$("#mngScId").data("kendoExtDropDownList").value(userId);
                   $("#mngScId").data("kendoExtDropDownList").enable(false);
               }
               $("#beforeMngScId").val(result.data[0].mngScId);
               $("#leadStatCd").data("kendoExtDropDownList").value(result.data[0].leadStatCd);
               $("#sexCd").data("kendoExtDropDownList").value(result.data[0].sexCd);
               $("#seq").val(result.data[0].seq);
               $("#relCustNm").val(result.data[0].purcMngNm);
               $("#relCustHpNo").val(result.data[0].hpNo);

               $("#mathDocTp").data("kendoExtDropDownList").value(result.data[0].mathDocTp);
               $("#ssnCrnNoC").val(result.data[0].ssnCrnNo);
               $("#relCustNm").val(result.data[0].purcMngNm);
               $("#relCustHpNo").val(result.data[0].hpNo);
               $("#bizcondCdC").data("kendoExtDropDownList").value(result.data[0].bizcondCd);
               $("#officeTelNoC").val(result.data[0].officeTelNo);

               /* $("#purcSelCarlineCd").data("kendoExtDropDownList").value(result.data[0].purcSelCarlineCd);
               $("#purcFscpModtpCd").data("kendoExtDropDownList").setDataSource([{modelNm:result.data[0].purcFscpModtpNm, modelCd:result.data[0].purcFscpModtpCd}]);
               $("#purcFscpModtpCd").data("kendoExtDropDownList").value(result.data[0].purcFscpModtpCd);
               //$("#expcPurcDt").data("kendoExtMaskedDatePicker").value(result.data[0].expcPurcDt);
               $("#expcPurcDt").val(chgDate2Str(result.data[0].expcPurcDt));              //예상구매일

               $("#expcDealPrc").val(result.data[0].expcDealPrc); */

               if (result.data[0].localCarRegNoYn == 'Y'){ $("#localCarRegNoYn").prop("checked", true) };

               if (result.data[0].custTp == "01") {
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

               //$("#addrGrid").data("kendoExtGrid").dataSource.read();

           });
        });




       $("#leadStatCd").data("kendoExtDropDownList").value(options.leadStatCd);

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                // 팝업 닫기.
                parent.$("#formarea").show();
                parent.editCustPopupWindow.close();
            }
        });

        $("#btnCtlFailSendBefore").kendoButton({
            click:function(e) {
                confirmOpen("<spring:message code='sal.lbl.isContinueMsg' />",'doFailSend',y,n);

                var custNo = $("#custNo").val();
                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                var beforeMngScId = $("#beforeMngScId").val();
                //var expcPurcDt = $("#expcPurcDt").val();
                var ssnCrnNo = $("#ssnCrnNoC").val();

                var infoTp = $("#infoTp").data("kendoExtDropDownList").value();
                var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
                var intrCarlineCd = $("#intrCarlineCd").data("kendoExtDropDownList").value();

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

                // 고객번호
                if ( dms.string.isEmpty(custNo) ) {
                    mob.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                // 예상거래일
                /* if ( dms.string.isEmpty(expcPurcDt)) {
                    mob.notification.info("<spring:message code='crm.lbl.expcPurcDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                    return false;
                }; */

                /* if ( dms.string.isEmpty(ssnCrnNo)) {
                    // 증거번호가 없습니다. 수정 하시겟습니까?
                    mob.notification.show("<spring:message code='crm.info.isEmptySsnCrnNo' />","callFunc:goCustomerInfo(\""+$('#custNo').val()+"\")");

                    return false;
                }; */

                var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
                // 담당자지정
                if ( dms.string.isEmpty(mngScId) ) {
                    mob.notification.info("<spring:message code='crm.lbl.prsn' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };

                if (mngScIdCtrl == "N") {
                    $("#btnCtlFailSend").click();
                }else{
                    if (checkUserPw ) {
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
                                    $("#btnCtlFailSend").click();
                                } else {
                                    mob.notification.success("<spring:message code='global.err.invalid.idpw'/>");
                                }
                            }
                        });

                    } else {
                        $("#btnCtlFailSend").click();
                    }
                }
            }
        });

        $("#btnCtlFailSend").kendoButton({
            click:function(e){
                confirmOpen("<spring:message code='sal.lbl.isContinueMsg' />",'doFailSend',y,n);
            }
        });


        //주소리스트
        //$("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
        //주소리스트
        $("#btnAddrSearch").click(function(){
            //$("#addressList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectAddressList.do' />");
            //document.getElementById("addressList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
            subListData.read();
        });

        //버튼 - 주소  추가
        $("#btnAddAddress").click(function(){
            parent.zipcodeSearchPop(callbackAddr);
        });


        if (options.autoBind) {
            $("#custNo").val(options.custNo);
            $("#btnCustSearch").click();
        }

        parent.$("#formarea").hide();

    }); //end document ready

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
     function onSelectSearchSelCarlineCd(e){
        $("#purcFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#purcFscpModtpCd").data("kendoExtDropDownList").enable(true);

        var dataItem = this.dataItem(e.item);
        if(dataItem.carlineCd == ""){
            $("#purcFscpModtpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#purcFscpModtpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
            ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
            ,async:false
        });
        $("#purcFscpModtpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     }

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
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectFsc.do' />"
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
         console.log("dataItem onSelectSearchHoldTp:::::::::::::::::::");
         console.log(dataItem);
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

    //주소추가 팝업 callback
        function callbackAddr(data){
            //document.getElementById("addressList").contentWindow.addItemSubList1(data);
            addrAddItemSubList1(data);
        }

        //addressList change Event Callback
        function saveAddressList(){
            //nothing
        }

 </script>

 <script type="text/javascript">

 function goMain(){
    parent.editCustPopupWindow.close();
 }

 function doFailSend(){
     var custNo = $("#custNo").val();
     var mngScId = $("#mngScId").data("kendoExtDropDownList").value();
     var beforeMngScId = $("#beforeMngScId").val();
     var custTp = $("#custTp").val();

     var infoTp = $("#infoTp").val();
     var holdTp = $("#holdTp").val();

     // 고객번호
     if ( dms.string.isEmpty(custNo) ) {
         mob.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
         return false;
     };

     if ( dms.string.isEmpty(infoTp) ) {
         mob.notification.warning("<spring:message code='crm.lbl.infoType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
         return false;
     };

     if ( dms.string.isEmpty(holdTp) ) {
         mob.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
         return false;
     };


     /* var salesOpptProcParam =
         $("#salesOpptProcForm").serializeObject(
                 $("#salesOpptProcForm").serializeObjectBySelector("[data-json-obj='true']")
         ); */
         var salesOpptProcParam ={};

     var addrParam = {};

     var dataSource = $("#subListView").data("kendoListView").dataSource;//document.getElementById("addressList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;
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
     salesOpptProcParam["leadStatCd"] = "08";;
     salesOpptProcParam["trsfTp"] = "02";; // 전출유형 , 자동(01), 수동(02)
     salesOpptProcParam["evalCd"] = "01";; // 심사상태 , 심사대기(01), 불통과(02)
     salesOpptProcParam["custTp"] = custTp;;
     salesOpptProcParam["custNm"] = $("#custNm").val();;
     salesOpptProcParam["mngScId"] = mngScId;;
     salesOpptProcParam["failCauCd"] = $("#failCauCd").val();;
     salesOpptProcParam["submitDt"] = new Date();;
     salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").val();
     salesOpptProcParam["holdDetlTpSeq"] = $("#holdDetlTpSeq").val();;

     salesOpptProcParam["custNo"] = $("#custNo").val();;
     salesOpptProcParam["hpNo"] = $("#hpNo").val();;
     salesOpptProcParam["telNo"] = $("#telNo").val();;
     salesOpptProcParam["infoTp"] = $("#infoTp").val();;
     salesOpptProcParam["holdTp"] = $("#holdTp").val();;
     salesOpptProcParam["wechatId"] = $("#wechatId").val();;
     salesOpptProcParam["estimateCont"] = $("#estimateCont").val();;
     salesOpptProcParam["salesCont"] = $("#salesCont").val();;
     salesOpptProcParam["remark"] = $("#remark").val();;
     salesOpptProcParam["dlrCd"] = dlrCd;
     salesOpptProcParam["emailNm"] = $("#emailNm").val();;
     salesOpptProcParam["intrCarlineCd"] =$("#intrCarlineCd").val();;
     salesOpptProcParam["intrColorCd"] = $("#intrColorCd").val();;
     salesOpptProcParam["intrFscpModtpCd"] = $("#intrFscpModtpCd").val();;
     salesOpptProcParam["payTp"] = $("#payTp").val();;
     salesOpptProcParam["sexCd"] = $("#sexCd").val();;
     //salesOpptProcParam["trsfTp"] = $("#trsfTp").val();;
     salesOpptProcParam["seq"] = $("#seq").val();;
     salesOpptProcParam["bhmcYn"] = "N";
     salesOpptProcParam["exhvFlakSeq"] = $("#exhvFlakSeq").val();;



     if (custTp == "02"){
         salesOpptProcParam["mathDocTp"] = $("#mathDocTp").data("kendoExtDropDownList").value();
         salesOpptProcParam["ssnCrnNo"] = $("#ssnCrnNoC").val();
         salesOpptProcParam["bizcondCd"] = $("#bizcondCdC").data("kendoExtDropDownList").value();
         salesOpptProcParam["officeTelNo"] = $("#officeTelNoC").val();
         //salesOpptProcParam["wechatId"] = $("#wechatId").val();
         salesOpptProcParam["custNm"] = $("#custNm").val();
         salesOpptProcParam["relCustNm"] = $("#relCustNm").val();
         salesOpptProcParam["relCustHpNo"] = $("#relCustHpNo").val();

     }

     if ($("#localCarRegNoYn").prop("checked")){ salesOpptProcParam["localCarRegNoYn"] = "Y" } else { salesOpptProcParam["localCarRegNoYn"] = "N" };;
     if ($("#bhmcYn").prop("checked")){ salesOpptProcParam["bhmcYn"] = "Y" } else { salesOpptProcParam["bhmcYn"] = "N" };;

     var saveData = $.extend(
         {"salesOpptProcessMgmtVO":salesOpptProcParam }
         , {"addressInfoVOList":addrGridData}
     );

     console.log("Saving of Request Info. !!");
     console.log(saveData);

     $.ajax({
         url:"<c:url value='/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do' />"
         ,data:JSON.stringify(saveData)
         ,type:'POST'
         ,dataType:'json'
         ,contentType:'application/json'
         ,error:function(jqXHR,status,error){
             console.log("error !!!");
             mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
             //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
         },
         success:function(result){
             mob.loading.hide();
             parent.$("#formarea").show();
             mob.notification.success("<spring:message code='global.info.success'/>");

             var data = [];
             data.push(result);
             options.callbackFunc(data);
             parent.editCustPopupWindow.close();
         }
     }).done(function(result) {
         console.log("Done!!!!");
     });
 }
</script>
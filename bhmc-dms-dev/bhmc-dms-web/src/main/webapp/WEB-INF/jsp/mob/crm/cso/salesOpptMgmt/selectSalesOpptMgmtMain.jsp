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
    <section id="content_list"  style="">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.lbl.saleOpptList" /><!-- 대행업무 목록 --></h2>
        </div>

        <div class="skeyarea" >
            <div>
                <table class="slist01">
                    <colgroup>
                        <col style="width:35%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr id="search1Area">
                            <th scope="row"><span><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search2Area">
                            <th scope="row"><span><spring:message code="global.lbl.saleOpptStepCd" /><!-- 판매기회 단계 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search3Area">
                            <th scope="row"><span><spring:message code="global.lbl.trsfStatCd" /><!-- 전출상태 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search4Area">
                            <th scope="row"><span><spring:message code="global.lbl.intrCarLine" /><!-- 관심차종/의향차종 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search5Area">
                            <th scope="row"><span><spring:message code="global.lbl.intrModel" /><!-- 관심모델/의향차형 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search6Area">
                            <th scope="row"><span><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></span></th>
                            <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                        </tr>
                        <tr id="search7Area">
                        <th scope="row"><span><spring:message code="global.lbl.regDt" /><!-- 등록일 --></span></th>
                        <td><span name="searchStr"></span><span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                    </tr>
                    </tbody>
                </table>
                <%--
                <div class="btnarea">
                    <span class="sbtn" onclick="javascript:deleteAllSC();">전체조건 삭제</span>
                </div>
                --%>
            </div>
        </div>

        <div class="listarea">
            <div class="dlistitem listhead">
                <span style="width:35%"><spring:message code="global.lbl.custNm" /><!-- 대행업무구분 --></span>
                <span style="width:30%"><spring:message code="global.lbl.succPrbCd" /><!-- 성공확률 --></span>
                <span style="width:35%"><spring:message code="global.lbl.expcSaleDt" /><!-- 예상판매일자 --></span>
                <span class="clboth"><spring:message code="global.lbl.intrModel" /><!--관심모델 --></span>
                <span class="clboth" style="width:35%"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회 단계/기회단계 --></span>
                <span style="width:30%"><spring:message code="crm.lbl.scId" /><!--판매고문 --></span>
                <span style="width:35%"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.title.salesOpptSearchCondition" /><!-- 판매기회 조회조건  --></h2>
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sCustNm" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /></th><!-- 판매기회 단계 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sSaleOpptStepCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code='global.lbl.trsfStatCd' /></th><!-- 전출상태 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sTrsfStatCd" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.intrCarLine' /></th><!-- 관심차종/의향차종 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sIntrCarLine" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.intrModel' /></th><!-- 관심모델/의향차형 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sIntrModel" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='crm.lbl.scId' /></th><!-- 판매고문 -->
                            <td>
                                <div class="f_text">
                                    <input type="text" id="sScId" data-json-obj="true" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.regDt' /></th><!-- 등록일 -->
                            <td class="f_term">
                                <div class="f_item01 f_disabled">
                                    <input type="search" id="sStartRegDt" value="${sevenDtBf}" data-json-obj="true" readOnly />
                                    <span class="date" onclick="calpicker('sStartRegDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01 f_disabled">
                                    <input type="search" id="sEndRegDt" value="${toDt}" data-json-obj="true" disabled />
                                    <span class="date" onclick="calpicker('sEndRegDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
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
                    <h1><spring:message code='global.lbl.salesOpptDetlInfo' /><!-- 판매기회 상세정보    --></h1>
                </div>
                <div class="co_view">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code='global.lbl.salesOpptDetlInfo' /><!-- 판매기회 상세정보    --></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody  >
                                 <tr>
                                    <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                    <td>
                                        <input type="hidden" id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />
                                        <input type="hidden" id="custNo" name="custNo" data-json-obj="true"/>
                                        <input type="hidden" id="leadNo" name="leadNo" data-json-obj="true" />
                                        <input type="hidden" id="vsitNo" name="vsitNo" />
                                        <div class="f_item01" id="searchCustNo">
                                            <input type="text" id="custNm" name="custNm" data-json-obj="true" />
                                            <span class="search" id="custSearch"><spring:message code='par.lbl.custInfo' /><!-- 고객정보/고객상세 --></span>
                                        </div>
                                        <input type="hidden" id="seq" >
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="number" class="numberic" id="hpNo" name="hpNo" placeholder="" data-json-obj="true"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 기회단계 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="saleOpptStepCd" name="saleOpptStepCd" data-json-obj="true" placeholder="" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.expcSaleDt' /><!-- 예상 판매일자 --></th>
                                    <td>
                                        <div class="f_item01">
                                            <input type="search" id="expcSaleDt" name="expcSaleDt" data-json-obj="true" readonly />
                                            <span class="date" onclick="calpicker('expcSaleDt')"><spring:message code='global.lbl.date' /></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.source' /><!-- 출처 --></th>
                                    <td>
                                         <div class="f_text">
                                            <input type="text" id="saleOpptSrcCd" name="saleOpptSrcCd" data-json-obj="true" placeholder="" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="trsfStatCd" name="trsfStatCd" data-json-obj="true" placeholder="" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.succPrbCd' /><!-- 성공확률 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="succPrbCd" name="succPrbCd" data-json-obj="true" placeholder="">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 판매고문 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input type="text" id="scId" name="scId" data-json-obj="true" placeholder="">
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></th>
                                    <td>
                                        <div class="f_text">
                                            <input id="remark" type="text" name="remark" data-json-obj="true" placeholder="">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input id="regUsrId" type="text" name="regUsrId" data-json-obj="true" placeholder="" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                            <input id="regDt" name="regDt" type="text" data-json-obj="true" disabled="disabled">
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 관심차List  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.lbl.intrCar" /><!-- 관심차--></h2>
                    <div class="title_btn">
                        <span class="tbtn" id="addIntrCarLine"><spring:message code="global.btn.add" /><!-- 추가 --></span>
                        <span class="co_open co_close"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:45%"><spring:message code="global.lbl.intrCarLine" /><!-- 관심차종  --></span>
                            <span style="width:20%"><spring:message code="global.lbl.typicalCar" /><!-- 관심 --></span>
                            <span class="clboth"><spring:message code="global.lbl.intrModel" /><!-- 관심모델--></span>
                        </div>
                        <iframe id="intrList" border="0" frameborder="0" width="100%" height="300"></iframe>
                        <div class="deleteitem" style="display:none;" id="intrList_noData"><span></span></div>
                    </div>
                </div>
            </div>


            <!-- 활동List  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.btn.active" /><!-- 활동--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:35%"><spring:message code="crm.lbl.salesActiveStatCd" /><!-- 활동상태  --></span>
                            <span style="width:65%"><spring:message code="crm.lbl.salesActiveTpCd" /><!-- 영업활용유형/활동형태 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.custNm" /><!-- 고객명--></span>
                            <span style="width:30%"><spring:message code="global.lbl.prefCommNo" /><!-- 선호연락처  --></span>
                            <span style="width:35%"><spring:message code="global.lbl.saleOpptSeq" /><!-- 판매기회번호 --></span>
                            <span class="clboth" style="width:100%"><spring:message code="crm.lbl.activeCont" /><!-- 활동내용 --></span>
                            <span class="clboth" style="width:100%"><spring:message code="global.lbl.activeRsltCont" /><!-- 활동결과 --></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.startDt" /><!-- 시작일자--></span>
                            <span style="width:65%"><spring:message code="global.lbl.endDt" /><!-- 종료일자--></span>
                        </div>
                        <iframe id="activeList" name="activeList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="deleteitem" style="display:none;" id="activeList_noData"><span></span></div>
                    </div>
                </div>
            </div>

            <!-- 메시지이력 List  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.lbl.msgHistory" /><!-- 메시지 이력--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:35%"><spring:message code="global.lbl.contactStatCd" /><!-- 유형  --></span>
                            <span style="width:30%"><spring:message code="global.lbl.contactTp" /><!-- 연락방법 --></span>
                            <span style="width:35%"><spring:message code="global.crm.contactDt" /><!-- 연락일--></span>
                            <span class="clboth" style="width:45%"><spring:message code="global.lbl.contactCont" /><!-- 연락내용  --></span>
                        </div>
                        <iframe id="contactList" name="contactList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="deleteitem" style="display:none;" id="contactList_noData"><span></span></div>
                    </div>
                </div>
            </div>

            <!-- 실패상세정보 List  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.saleOpptFailDetl" /><!-- 실패상세정보--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:35%"><spring:message code="global.lbl.regDt" /><!-- 등록일  --></span>
                            <span style="width:30%"><spring:message code="global.lbl.failTpCd" /><!-- 실패유형 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.failCau1Cd" /><!-- 실패1급원인--></span>
                            <span class="clboth" style="width:35%"><spring:message code="global.lbl.failCau2Cd" /><!-- 실패2급원인  --></span>
                            <span style="width:30%"><spring:message code="global.lbl.failBrandCd" /><!-- 실패브랜드 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.failModelCd" /><!-- 실패차형--></span>
                        </div>
                        <iframe id="failList" name="failList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="deleteitem" style="display:none;" id="failList_noData"><span></span></div>
                    </div>
                </div>
            </div>

            <!-- HISTORY List  -->
            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.title.salesOpptHistory" /><!-- HISTORY--></h2>
                    <div class="title_btn">
                        <span class="co_open co_close"><span>상세내용 보기 </span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:35%"><spring:message code="global.lbl.bhmcyn" /><!-- BHMC여부  --></span>
                            <span style="width:30%"><spring:message code="global.lbl.expcSaleDt" /><!-- 예상판매일자 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.succPrbCd" /><!-- 성공확률--></span>
                            <span class="clboth" style="width:35%"><spring:message code="crm.lbl.saleOpptSrcCd" /><!-- 판매기회출처  --></span>
                            <span style="width:30%"><spring:message code="crm.lbl.saleOpptStepCd" /><!-- 판매기회단계 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.regDt" /><!-- 등록일--></span>
                        </div>
                        <iframe id="historyList" name="historyList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="deleteitem" style="display:none;" id="historyList_noData"><span></span></div>
                    </div>
                </div>
            </div>
            <!-- 버튼 set -->
            <div class="con_btnarea btncount2">
                <div><span class="btnd1t2" id="btnGoActive"><spring:message code='global.btn.active' /><!-- 활동 --></span></div>
                <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
            </div>

        </section>

    </div>

</section>
<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>


<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

//현재일자
var toDate = new Date();

//조회조건 - 판매단계
var saleOpptStepCdList             = [],
saleOpptStepCdObj              = {};
<c:forEach var="obj" items="${saleOpptStepCdList}" varStatus="status">
saleOpptStepCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
saleOpptStepCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//조회조건 - 전출상태 //trsfStatCdList
var trsfStatCdList             = [],
trsfStatCdObj              = {};
<c:forEach var="obj" items="${trsfStatCdList}" varStatus="status">
trsfStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
trsfStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


//조회조건 - 판매고문   //users
 var usersList             = [],
usersObj              = {};
<c:forEach var="obj" items="${users}" varStatus="status">
usersList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
usersObj["${obj.usrId}"] = "${obj.usrNm}";
</c:forEach>

//조회조건 - 성공확률
 var succPrbCdList             = [],
 succPrbCdObj              = {};
 <c:forEach var="obj" items="${succPrbCdList}">
 succPrbCdList.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
 succPrbCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//판매기회 출처
 var saleOpptSrcCdList             = [],
 saleOpptSrcCdObj              = {};
<c:forEach var="obj" items="${saleOpptSrcCdList}">
    saleOpptSrcCdList.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
    saleOpptSrcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

///////////////////////////////////////////////
//##관심차 리스트 그리드 정보 코드
//////////////////////////////////////////////
//조회조건 - 관심차종/의향차종  //carLineCdInfo
var carLineCdInfoList             = [],
carLineCdObj              = {};
<c:forEach var="obj" items="${carLineCdInfo}" varStatus="status">
carLineCdInfoList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

///////////////////////////////////////////////
//##활동 리스트 그리드 정보 코드
//////////////////////////////////////////////
//영업활동상태 DS
var salesActiveStatCdArr = [];
<c:forEach var="obj" items="${salesActiveStatCdList}">
    salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//영업활동유형 DS
var salesActiveTpCdArr = [];
<c:forEach var="obj" items="${salesActiveTpCdList}">
    salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

///////////////////////////////////////////////
//##실패상세정보 리스트 그리드 정보 코드
//////////////////////////////////////////////
// 실패유형 DS
//var failTpCdDs = [];
var failTpCdArr = [];
<c:forEach var="obj" items="${failTpCdList}">
    failTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 실패1급원인 DS
var failCau1CdArr = [];
<c:forEach var="obj" items="${failCau1CdList}">
    failCau1CdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 실패2급원인 DS
//var failCau2CdDs = [];
var failCau2CdArr = [];
<c:forEach var="obj" items="${failCau2CdList}">
    failCau2CdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//등록차량 브랜드 DS
//var brandCdDs = [];
var brandCdArr = [];
<c:forEach var="obj" items="${brandCdList}">
    brandCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>




$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();

    switch(obj.attr("id")){
        case "search1Area" :
            $("#sCustNm").val("");
            break;
        case "search2Area" :
            $("#sSaleOpptStepCd").val("");
            break;
        case "search3Area" :
            $("#sTrsfStatCd").val("");
            break;
        case "search4Area" :
            $("#sIntrCarLine").val("");
            break;
        case "search5Area" :
            $("#sIntrModel").val("");
            break;
        case "search6Area" :
            $("#sScId").val("");
            break;
        case "search7Area" :
            $("#sStartRegDt").val("");
            $("#sEndRegDt").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


//조회조건 초기화
function setSearchBox(){

    var sCustNm     = $("#sCustNm").val();
    var sSaleOpptStepCd      = $("#sSaleOpptStepCd").val();
    var sTrsfStatCd      = $("#sTrsfStatCd").val();
    var sIntrCarLine      = $("#sIntrCarLine").val();
    var sIntrModel      = $("#sIntrModel").val();
    var sScId      = $("#sScId").val();
    var sStartRegDt      = $("#sStartRegDt").val();
    var sEndRegDt      = $("#sEndRegDt").val();

    if(sCustNm == "" && sSaleOpptStepCd == "" && sTrsfStatCd == "" && sIntrCarLine == "" &&
            sIntrModel == "" && sScId == "" && sStartRegDt == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();

        if(sCustNm == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sSaleOpptStepCd == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sTrsfStatCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sIntrCarLine == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sIntrModel == "") $("#search5Area").hide();
        else $("#search5Area").show();
        if(sScId == "") $("#search6Area").hide();
        else $("#search6Area").show();
        if(sStartRegDt == "") $("#search7Area").hide();
        else $("#search7Area").show();
    }
    //setMainListHeight();
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

    //console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;
    modelCdObj = [];
    $.each(modelCdDSList, function(idx, obj){
        modelCdObj[obj.modelCd] = obj.modelNm;
    });

    // s관심모델
    $("#sIntrModel").kendoExtDropDownList({
        dataSource:modelCdDSList
        , autoBind:false
        , dataTextField:"modelNm"
        , dataValueField:"modelCd"
        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        //, index:0
    });
};


$(document).ready(function() {

  //조회조건 - 판매기회단계
    $("#saleOpptStepCd, #sSaleOpptStepCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:saleOpptStepCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

  //조회조건 - 전출상태
    $("#trsfStatCd, #sTrsfStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:trsfStatCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

  //조회조건 - 관심모델 set
    $("#sIntrModel").kendoExtDropDownList({
        autoBind:false
        , dataTextField:"modelNm"
        , dataValueField:"modelCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
        , enable:false
    });

   //조회조건 - 관심차종/의향차종
    $("#sIntrCarLine").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdInfoList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        , enable:true
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).carlineCd;

            if(selcmmCd != "" && selcmmCd != null){
                var responseJson = dms.ajax.getJson({
                    url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
                    ,data:JSON.stringify({"carlineCd":selcmmCd})
                    ,async:false
                });

                modelCdDSList = responseJson.data;

                modelCdObj = [];
            }


            var modelCd = $("#sIntrModel").data("kendoExtDropDownList");

            if(modelCdDSList != null){
                $.each(modelCdDSList, function(idx, obj){
                    modelCdObj[obj.modelCd] = obj.modelNm;
                });

                if(modelCdDSList.length > 0){
                    modelCd.enable(true);
                    $("#sIntrModel").kendoExtDropDownList({
                        autoBind:false
                        , dataTextField:"modelNm"
                        , dataValueField:"modelCd"
                        , optionLabel:"<spring:message code='global.lbl.check'/>"
                        , dataSource:modelCdDSList
                        , index:0
                    });
                }else{
                    modelCd.value("");
                    modelCd.enable(false);
                }
            }else{
                modelCd.value("");
                modelCd.enable(false);
            }
        }

    });

  //조회조건 - 판매고문
    $("#scId, #sScId").kendoExtDropDownList({
         dataTextField:"usrNm"
        ,dataValueField:"usrId"
        ,dataSource:usersList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

  //상세보기 - 성공확률
    $("#succPrbCd").kendoExtDropDownList({
         dataTextField:"text"
        ,dataValueField:"value"
        ,dataSource:succPrbCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

  //상세보기 - 판매기회출처
    $("#saleOpptSrcCd").kendoExtDropDownList({
         dataTextField:"text"
        ,dataValueField:"value"
        ,dataSource:saleOpptSrcCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });


    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='crm.menu.opportunityMng' />"); //판매기회관리
    //$("#header_title").on("click", contentSearch);
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    //$("#sStartRegDt").val(chgServerDate2Str(sevenDtBf));
    //$("#sEndRegDt").val(chgServerDate2Str(toDt));
    //var sStartRegDt = $("#sStartRegDt");
    //var sEndRegDt = $("#sEndRegDt");
    //if(sStartRegDt.val() != "" || sEndRegDt.val() != "") $("#search7Area span[name='searchStr']").html(sStartRegDt.val() + " ~</br> " + sEndRegDt.val());
    //if(sStartRegDt.val() != "" || sEndRegDt.val() != "") $("#search7Area span[name='searchStr']").text(sStartRegDt.val() + " ~ " + sEndRegDt.val());
    //setSearchBox();

    $("#mainList").attr("src", "<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptMgmtsList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            var sCustNm      = $("#sCustNm").val();
            var sSaleOpptStepCd      = $("#sSaleOpptStepCd").data("kendoExtDropDownList").text();
            var sTrsfStatCd      = $("#sTrsfStatCd").data("kendoExtDropDownList").text();
            var sIntrCarLine      = $("#sIntrCarLine").data("kendoExtDropDownList").text();
            var sIntrModel      = $("#sIntrModel").data("kendoExtDropDownList").text();
            var sScId      = $("#sScId").data("kendoExtDropDownList").text()   ;
            var sStartRegDt      = $("#sStartRegDt").val();
            var sEndRegDt      = $("#sEndRegDt").val();

            if(sCustNm != "") $("#search1Area span[name='searchStr']").text(sCustNm);
            if(sSaleOpptStepCd != "") $("#search2Area span[name='searchStr']").text(sSaleOpptStepCd);
            if(sTrsfStatCd != "") $("#search3Area span[name='searchStr']").text(sTrsfStatCd);
            if(sIntrCarLine != "") $("#search4Area span[name='searchStr']").text(sIntrCarLine);
            if(sIntrModel != "") $("#search5Area span[name='searchStr']").text(sIntrModel);
            if(sScId != "") $("#search6Area span[name='searchStr']").text(sScId);
            if(sStartRegDt != "") $("#search7Area span[name='searchStr']").html(sStartRegDt +" ~<br/>"+ sEndRegDt);

            setSearchBox();
            contentList();
        }
    });


    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });

    //고객상세조회
    $("#custSearch").click(function(){

        popupWindow = mob.window.popup({
            windowId:"customerSearchPopupMain"
            , content:{
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"    ///Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){

                        if(data != undefined) {
                            // 초기화
                            initForm();

                            $("#custNo").val(data.custNo);
                            $("#custNm").val(data.custNm);
                            $("#hpNo").val(data.hpNo);
                            $("#scId").data("kendoExtDropDownList").value(data.mngScId);

                        }
                    }
                }
            }
        })
    });

    //관심차종 추가버튼
    $("#addIntrCarLine").click( function(){

        intrCarLinePopupWin = mob.window.popup({
            windowId:"intrCarLinePopupWin"
            ,width:"100%"
            ,height:"300px"
            ,content:{
                url:"<c:url value='/mob/cmm/crm/commonPopup/selectIntrCarLinePopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
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
    });

    //활동 버튼
    $("#btnGoActive").click(function(){
        window.open("<c:url value='/mob/crm/cso/salesActive/selectSalesActiveMgmtMain.do'/>","_self");
     });
});
function addIntrCarLine(carlineCd, modelCd, flagYn){

    document.getElementById("intrList").contentWindow.addItemSubList1(carlineCd, flagYn, modelCd);
}

function initForm(){

    // form data 초기화
    $("#saleOpptNo").val("");
    $("#leadNo").val("");
    $("#vsitNo").val("");
    $("#custNo").val("");
    $("#custNm").val("");
    $("#hpNo").val("");
    $("#remark").val("");
    $("#saleOpptStepCd").data("kendoExtDropDownList").value("");
    $("#trsfStatCd").data("kendoExtDropDownList").value("");
    $("#expcSaleDt").val("");
    $("#succPrbCd").val("");
    $("#scId").data("kendoExtDropDownList").value("");
    $("#saleOpptSrcCd").val();
    $("#regUsrId").val("");
    $("#regDt").val("");

}

function fnOnblur(id){

    var aapAmt = Number($("#cstAmt").val()) + Number($("#profitAmt").val());

    $("#aapAmt").val(aapAmt);

}

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");
  $("#header_title span").attr("class","search_open");

  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
    setTimeout(function(){ setMainListHeight(); },200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  $("#sStartRegDt").val(chgServerDate2Str(sevenDtBf));
  $("#sEndRegDt").val(chgServerDate2Str(toDt));
}

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");

    $("#header_title span").removeAttr("class");


    var saleOpptNo = dataItem.saleOpptNo;

    var param = {
            "sSaleOpptNo":saleOpptNo
            };

    mob.loading.show();
    $.ajax({
            url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtByKey.do' />"
            ,data:JSON.stringify(param)      //파라미터
            ,type:'POST'                        //조회요청
            ,dataType:'json'                  //json 응답
            ,contentType:'application/json'   //문자열 파라미터
            ,async:false
            ,error:function(jqXHR,status,error){
                //mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            }
    }).done(function(body) {
        mob.loading.hide();

        // 초기화
        initForm();

        // data set 시작
        $("#saleOpptNo").val(body.saleOpptNo);
        $("#remark").val(body.remark);
        $("#custNo").val(body.custNo);
        $("#custNm").val(body.custNm);
        $("#hpNo").val(body.hpNo);
        $("#expcSaleDt").val(body.expcSaleDt);
        $("#succPrbCd").val(body.succPrbCd);
        $("#saleOpptSrcCd").val(body.saleOpptSrcCd);
        $("#scId").data("kendoExtDropDownList").value(body.scId);      //판매고문
        $("#saleOpptStepCd").data("kendoExtDropDownList").value(body.saleOpptStepCd);      //판매기회단계
        $("#trsfStatCd").data("kendoExtDropDownList").value(body.trsfStatCd);      //전출상태

        $("#regUsrId").val(body.regUsrNm);
        $("#regDt").val(body.regDt);
        // data set 종료


        // 연관 그리드 조회
        //관심차 리스트
        $("#intrList").attr("src", "<c:url value='/mob/crm/cso/salesOpptMgmt/selectCarLineInfoList.do' />");

        //활동 리스트
        $("#activeList").attr("src", "<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesActivesList.do' />");

        //메시지이력 리스트
        $("#contactList").attr("src", "<c:url value='/mob/crm/cso/salesOpptMgmt/selectMsgHistorysList.do' />");

        //실패상세정보 리스트
        $("#failList").attr("src", "<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptFailDetlMgmtsList.do' />");

        //history 리스트
        $("#historyList").attr("src", "<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptHistorysList.do' />");


    });
  }


//TODO:여기부터
//버튼 - 저장
$("#btnSave").kendoButton({
    click:function(e){
        confirmOpen(confirmMsgSave,'doSave',y,n);
    }
});
function doSave(){
    // validation 시작
    if( dms.string.isEmpty($("#remark").val()) ){
      // 판매기회 개술 / 을(를) 입력해주세요.
      mob.notification.warning("<spring:message code='crm.lbl.saleRemark' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
      return;
    }

    if( dms.string.isEmpty($("#custNo").val()) ){
      // 고객 / 을(를) 선택해주세요.
      mob.notification.warning("<spring:message code='global.lbl.customer' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
      return;
    }

    if( dms.string.isEmpty($("#hpNo").val()) ){
      // 휴대전화/ 을(를) 입력해주세요.
      mob.notification.warning("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
      return;
    }

    if( dms.string.isEmpty($("#saleOpptStepCd").val()) ){
      // 판매기회단계 / 을(를) 선택해주세요.
      mob.notification.warning("<spring:message code='global.lbl.saleOpptStepCd' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
      return;
    }

    if( dms.string.isEmpty($("#scId").val()) ){
      // 판매고문 / 을(를) 입력해주세요.
      mob.notification.warning("<spring:message code='sal.lbl.salesAdvisor' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
      return;
    }

    var saveFormData =
      $("#formarea").serializeObject(
          $("#formarea").serializeArrayInSelector("[data-json-obj='true']")
      );

    saveFormData.expcSaleDt = chgDateTimeStamp($("#expcSaleDt").val());

    //관심차종
    var dataSource = document.getElementById("intrList").contentWindow.$("#subListView1").data("kendoMobileListView").dataSource;

    var saveGridData = getCUDData(dataSource, "insertList", "updateList", "deleteList");

    var insertList = saveGridData.insertList.length;        // grid insert 항목 // 수정일때..
    var gridDataLength;                                     // grid data 수량     // 신규일때(dataSource를 안불러옴), 수정일때 ..
    if( dms.string.isEmpty($("#saleOpptNo").val()) ){
      gridDataLength = 0;
    }else{
      gridDataLength = dataSource._data.length;
    }

    var gridDataChk = parseInt(insertList)+parseInt(gridDataLength);

    /*             // 관심차 필수 체크
          if(gridDataChk < 1 ){
              // 관심차 / 을(를) 선택하여주해주세요.
              mob.notification.warning("<spring:message code='global.lbl.intrCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
              return;
          } */

    var saveData = $.extend(
          {"salesOpptMgmtVO":saveFormData}
          , saveGridData
    )

    mob.loading.show();
    $.ajax({
      url:"<c:url value='/crm/cso/salesOpptMgmt/multiSalesOpptMgmts.do' />"
      ,data:kendo.stringify(saveData)
      ,type:'POST'
      ,dataType:'json'
      ,contentType:'application/json'
      ,success:function(jqXHR, textStatus) {
          mob.loading.hide();

          // 저장완료일경우 해당 데이터를 다시 조회한다.
          if(textStatus == "success" && jqXHR > 0 ){
              // 저장 / 이 완료 되었습니다.
              mob.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

              var saleOpptNo = jqXHR;
              isGridReload = true;
              saleOpptMgmtNo = saleOpptNo;

          }else{
              // 저장정보 / 을(를) 확인하여 주세요.
              mob.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
          }
      }
      ,error:function(jqXHR,status,error) {
          mob.loading.hide();
          mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
      }
    });

    contentListNonRefresh();
}
</script>
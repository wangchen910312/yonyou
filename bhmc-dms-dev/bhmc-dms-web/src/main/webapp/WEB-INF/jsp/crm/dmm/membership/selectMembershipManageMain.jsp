<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->

<c:set value="${policy}" var="membershipStan" /> <!-- C:고객, V:자동차 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
    <h1 class="title_basic"> <spring:message code="crm.menu.membershipMng"/> </h1><!-- 멤버십 관리 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11312" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11313" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11314" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11315" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_print" id="btnPrintMembership" ><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
        </dms:access>
        <!-- 会员管理增加下载excel 功能 贾明 2018-9-28 start -->
        <dms:access viewId="VIEW-D-13281" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" id="btnExcelExport"><spring:message code='global.btn.excelExport' /></button>
        </dms:access>
        <!-- 会员管理增加下载excel 功能 贾明 2018-9-28 end -->
        </div>
    </div>

    <!-- 조회조건 영역 시작 -->
    <div  class="table_form form_width_75per" role="search" data-btnid="btnSearch" >
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                    <td>
                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.membershipNo'/><!-- 멤버십번호 --></th>
                    <td>
                        <input type="text" id="sMembershipNo" name="sMembershipNo" class="form_input" />
                    </td>
            <c:choose>
                <c:when test="${membershipStan eq 'V'}">
                    <th scope="row"><spring:message code='global.lbl.vinNo'/></th><!-- vinNo -->
                    <td>
                        <input type="text" id="sVinNo" name="sVinNo" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.membershipRegistDt" /><!-- 가입일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartDt" name="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </c:when>
                <c:when test="${membershipStan eq 'C'}">
                    <th scope="row"><spring:message code="crm.lbl.membershipRegistDt" /><!-- 가입일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartDt" name="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </c:when>
                <c:otherwise>
                    <th scope="row"></th>
                    <td>
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </c:otherwise>
            </c:choose>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회조건 영역 종료 -->

    <!-- 멤버십가입 목록 그리드 시작 -->
    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->
    <div class="table_grid">
        <div id="membershipGrid" class="resizable_grid"></div>
    </div>
    <!-- 멤버십가입 목록 그리드 종료 -->
</section>
</div>
<section id="membershipManageWindow" class="pop_wrap">
    <section class="group">

        <section class="group">
            <!-- // 탭 시작 -->
            <div id="tabstrip" class="tab_area">
                <ul>
                    <li id ="membershipInfo" class="k-state-active"><spring:message code="global.title.membershipInfo" /><!-- 멤버십 정보 --></li>
                    <li id ="membershipRechargeCard" ><spring:message code="global.title.rechargeCardList" /><!-- 충전카드목록 --></li>
                    <li id ="tabCardList"><spring:message code="global.lbl.rechargeCardHistory" /><!-- 충전카드 이력 --></li>
                    <li id ="tabPoint"><spring:message code="global.lbl.pointHistory" /><!-- 포인트 이력 --></li>
                    <li id ="tabGrade"><spring:message code="global.lbl.gradeHistory" /><!-- 등급변경기록 --></li>
                    <li id ="tabSpecialPoint"><spring:message code="global.lbl.specialPoint" /><!-- 특별포인트 --></li>
                    <li id ="membershipPackageCoupon" ><spring:message code="crm.lbl.coupon" /><!-- 쿠폰 --></li>
                </ul>
                <!-- 멤버십 정보 탭 영역 -->
                <div class="mt0">
                    <div class="header_area">
                        <h2 class="title_basic"> <spring:message code="global.title.membershipInfo" /> </h2><!-- 멤버십 정보 -->
                        <div class="btn_right">
                        <dms:access viewId="VIEW-D-11322" hasPermission="${dms:getPermissionMask('READ')}">
                        <c:if test="${membershipGradeNoneAutoYn eq 'Y'}"><!--  // 회원등급 수동 변경여부 가 Y 인경우에만 등급변경 버튼 노출. 1/4 -->
                            <button type="button" class="btn_s" id="btnMembershipGradeNoneAutoYn"><spring:message code="crm.lbl.membershipGradeChg" /><!-- 등급변경 --></button>
                        </c:if>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11323" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>  <!-- 저장 -->
                        </dms:access>
                        </div>
                    </div>
                    <form id="membershipForm" name="membershipForm" onsubmit="return false;" >
                    <div class="table_form form_width_70per">
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
                                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm'/> </span></th> <!-- 고객명 -->
                                    <td class="required_area">
                                        <input type="hidden" id="stan" name="stan" value="${membershipStan}" data-json-obj="true" />
                                        <div class="form_search">
                                            <input type="text" id="custNm" name="custNm" class="form_input onKey_down" placeholder="<spring:message code='global.lbl.custSearch' />" /><!-- // 고객조회 -->
                                            <input type="hidden" id="searchYn" name="searchYn" value="N"/>
                                            <a href="javascript:;" onclick="javascript:custSearchPopupWindow();" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                        </div>
                                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" />
                                            <input type="hidden" id="fileDocNo" name="fileDocNo" data-json-obj="true"/>
                                            <input type="hidden" id="befGradeCd" name="befGradeCd" data-json-obj="true"/>
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.membershipNo'/></span></th> <!-- 멤버십번호 -->
                                    <td>
                                        <input type="text" id="membershipNo" name="membershipNo" class="form_input form_readonly" maxlength="30" style="width:100%" readOnly data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 -->
                                    <td>
                                        <input id="custTp" name="custTp" class="form_comboBox form_readonly" style="width:100%" readOnly />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.hpNo" /></th> <!-- 휴대전화 -->
                                    <td>
                                        <input id="hpNo" name="hpNo" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 고정(유선)전화 -->
                                    <td>
                                        <input id="telNo" name="telNo" value="" readonly="readonly" class="form_input form_readonly" style="width:100%">
                                    </td>
                                    <th scope="row"><spring:message code="crm.lbl.prefCommMthCd" /></th> <!-- 선호연락방법 -->
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left">
                                                <input id="prefCommMthCd" name="prefCommMthCd" class="form_comboBox form_readonly" readOnly />
                                            </div>
                                            <div class="form_right">
                                                <input id="prefCommNo" name="prefCommNo" value="" readonly="readonly" class="form_input form_readonly" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                    <td>
                                        <input id="emailNm" name="emailNm" readonly="readonly" class="form_input form_readonly" >
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.addr" /></th> <!-- 주소 -->
                                    <td colspan="3"><input id="addrFull" name="addrFull" value="" readonly="readonly" class="form_input form_readonly"></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!-- 증거유형 --></th>
                                    <td>
                                        <input id="mathDocTp" name="mathDocTp" class="form_select" style="width:100%" readonly="readonly" />
                                    </td>
                                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                    <td>
                                        <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input form_readonly" readonly="readonly" />
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>
                                </tr>
                                <c:if test="${membershipStan eq 'V'}">
                                    <tr>
                                        <th scope="row"> <span class="bu_required"><spring:message code='global.lbl.vinNo'/></span></th> <!-- VIN번호 -->
                                        <td class="required_area">
                                            <input type="text" id="vinNo" name="vinNo" class="form_input form_readonly" readonly maxlength="30" style="width:100%" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.carNo" /> </th> <!-- 차량번호 -->
                                        <td>
                                            <input type="text" id="carRegNo" name="carRegNo" value="" class="form_input form_readonly" readonly />
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.carlineNm" />/<spring:message code="global.lbl.modelNm" /></th> <!-- 차종명/모델명 -->
                                        <td>
                                            <input type="text" id="modelNm" name="modelNm" value="" class="form_input form_readonly" readonly />
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.gradeCd'/></span></th> <!-- 등급  -->
                                    <td>
                                        <input id="gradeCd" name="gradeCd" class="form_comboBox" data-json-obj='true' />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.pointCardNo'/></span></th> <!-- 포인트 카드번호 -->
                                    <td class="required_area">
                                        <input id="cardNo" name="cardNo" class="form_input" maxlength="30" data-json-obj="true" />
                                        <input type="hidden" id="bfCardNo" name="bfCardNo" data-json-obj="true" />
                                        <input type="hidden" id="cardTpCd" name="cardTpCd" data-json-obj="true" >
                                    </td>
                                    <th scope="row"><spring:message code='global.lbl.savePoint'/>(<spring:message code='global.lbl.avlbStock'/>)</th> <!-- 적립 포인트(가용) -->
                                    <td>
                                        <input value="" id="lastPointVal" name="lastPointVal" class="form_numeric ar form_readonly" readonly="readonly" pattern="\d" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </form>

                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
                        <div class="btn_right">
                        <dms:access viewId="VIEW-D-11324" hasPermission="${dms:getPermissionMask('READ')}">
                            <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11325" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                        </dms:access>
                        </div>
                    </div>

                    <div class="table_grid">
                        <div id="fileGrid">
                        </div>
                    </div>
                </div>

                <!-- 충전카드목록 탭 영역 -->
                <div class="mt0">
                    <div class="header_area">
                    <h2 class="title_basic"> <spring:message code="global.title.rechargeCardList"/></h2><!-- 충전카드목록 -->
                        <div class="btn_right" id="rchgBtn" style="display:none;">
                        <dms:access viewId="VIEW-D-13048" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnRchgMinus"><spring:message code="crm.btn.extcAmt" /></button><!-- 소멸 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-13049" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnRchg"><spring:message code="crm.btn.rchg" /></button><!-- 충전 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11327" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnRchgReg"><spring:message code="crm.btn.rchgCardReg" /></button><!-- 충전카드등록 -->
                        </dms:access>
                        </div>
                    </div>
                    <!-- 충전카드 목록 그리드 시작 -->
                    <div class="table_grid">
                        <div id="cardListGrid"></div>
                    </div>
                    <!-- 충전카드 목록 그리드 종료 -->
                </div>

                <!--충전 카드 이력 탭 영역 -->
                <div>
                    <div class="btn_right_absolute"></div>
                    <div class="table_grid">
                        <!-- 충전 카드 이력 그리드 -->
                        <div id="tabCardListGrid" ></div>
                        <!-- 충전 카드 이력 그리드 -->
                    </div>
                </div>

                <!-- 포인트 이력 탭 영역 -->
                <div>
                    <div class="btn_right_absolute"></div>
                    <div class="table_grid">
                        <!-- 포인트 그리드 -->
                        <div id="tabPointHisGrid" ></div>
                        <!-- 포인트 그리드 -->
                    </div>

                </div>

                <!--등급변경기록 탭 영역 -->
                <div>
                    <div class="btn_right_absolute"></div>
                    <div class="table_grid">
                        <!-- 등급변경이력 그리드 -->
                        <div id="tabGradeGrid" ></div>
                        <!-- 등급변경이력 그리드 -->
                    </div>
                </div>

                <!--특별포인트 탭 영역-->
                <div class="mt0">
                    <div class="header_area">
                        <div class="btn_right">
                        <dms:access viewId="VIEW-D-13046" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="specialPointDec"><spring:message code="global.btn.specialPointDec" /></button>  <!-- 차감 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-13047" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="specialPoint"><spring:message code="global.btn.specialPointReq" /></button>  <!-- 특별포인트 신청 -->
                        </dms:access>
                        </div>
                    </div>
                    <div class="btn_right_absolute"></div>
                    <div class="table_grid">
                        <!-- 특별포인트 그리드 -->
                        <div id="specialPointGrid" ></div>
                        <!-- 특별포인트 그리드 -->
                    </div>

                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="global.title.signInfo" /><!-- 결재정보 --></h2>
                        <div class="btn_right">
                        <dms:access viewId="VIEW-D-11331" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnApproval"><spring:message code='global.btn.approval' /></button><!-- 승인 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11332" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s" id="btnRollback"><spring:message code='global.btn.appRollback' /></button><!-- 반려 -->
                        </dms:access>
                        </div>
                    </div>
                    <div class="btn_right_absolute"></div>
                    <div class="table_grid">
                        <!-- 결재정보 그리드 -->
                        <div id="signLineGrid" ></div>
                        <!-- 결재정보 그리드 -->
                    </div>
                </div>

                <!-- 패키지 쿠폰목록 탭 영역 -->
                <div class="mt0">
                    <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.lbl.coupon" /><!-- 쿠폰 --></h2>
                    </div>
                    <!-- 패키지 쿠폰 목록 그리드 시작 -->
                    <div class="table_grid">
                        <div id="packageCouponHisGrid"></div>
                    </div>
                    <!-- 패키지 쿠폰 목록 그리드 종료 -->
                </div>

            </div>
            <!-- // 탭 종료 -->
        </section> <!-- end class="group" -->
    </section>
</section> <!-- end  class="pop_wrap" -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     * 데이터 셋업 영역
     *************************************************************/
    var membershipManageWindow;     // 멤버십정보 팝업
    var popupWindow;                // 고객검색 팝업
    var membershipCardSearch;       // 충전카드 팝업
    var specalPopupWindow;          // 특별포인트 팝업

    //카드종류구분 Array
    var cardTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${cardTpCdList}">
        cardTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //카드종류구분 Map
    var cardTpMap = [];
    $.each(cardTpList, function(idx, obj){
        cardTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    // 할인사용구분
    var dcUseTpArr = [];
    <c:forEach var="obj" items="${dcUseTpList}">
        dcUseTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    dcUseTpArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = dcUseTpArr[val];
        }
        return returnVal;
    };

    //고객유형 설정
    var custTpList = [];
    var custTpMap = [];
    <c:forEach var="obj" items="${custTpList}">
        custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //잠재/보유 고객 설정
    var custCdMap = [];
    <c:forEach var="obj" items="${custCdList}">
        custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //선호연락방법설정
    var prefCommMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${prefCommMthCdList}">
        prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //신분증 유형(주요인증문서유형) 설정
    var mathDocTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${mathDocTpList}">
        mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //포인트 코드설정
    var pointCdMap = [];
    <c:forEach var="obj" items="${pointCdList}">
        pointCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //등급 설정
    var gradeCodeList = [];
    <c:forEach var="obj" items="${gradeCodeList}">
        gradeCodeList.push({"gradeSeq":"${obj.gradeSeq}","gradeNm":"${obj.gradeNm}"});
    </c:forEach>
    var gradeCodeListMap = dms.data.arrayToMap(gradeCodeList, function(obj){ return obj.gradeSeq; });

    //결재유형  Array
    var arrSignTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignTp}">
        arrSignTp.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var arrSignTpMap = dms.data.arrayToMap(arrSignTp, function(obj){ return obj.cmmCd; });

    //결재처리코드  Array
    var arrSignProcCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignProcCd}">
        arrSignProcCd.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var arrSignProcCdMap = dms.data.arrayToMap(arrSignProcCd, function(obj){ return obj.cmmCd; });

    stan = '<c:out value="${membershipStan}"/>';

    /**
    * 직무명 조회
    */
    function fn_getTaskNm(usrId) {

        var responseRlt;
        var param = {};
        param["sUsrId"] = usrId;

        $.ajax({
            url:"<c:url value='/crm/mcm/marketingCampaign/selectUsersForTaskName.do' />"
           ,data:kendo.stringify(param)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {
               responseRlt = result;
           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
       });

         return responseRlt;

    };

    // 상세조회 후 팝업오픈
    function viewDetail(membershipNo) {

        // 멤버십 정보가 없으면 빈창을 띄어준다.
        var membershipManageWindow = $("#membershipManageWindow").data("kendoWindow");
        membershipManageWindow.center();
        membershipManageWindow.open();

        if( dms.string.isNotEmpty(membershipNo) ){

            var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
            tabStrip.select(0);
            tabStrip.enable(tabStrip.tabGroup.children(),true);

            $(".form_search").addClass("form_search_disabled");
            $("#rchgBtn").show();
            $("#searchYn").val("N");//고객조회팝업에 대한 open여부

            $.ajax({
                url:"<c:url value='/crm/dmm/membership/selectMembershipJoinByKey.do' />"
                ,data:JSON.stringify({"sMembershipNo":membershipNo})      //파라미터
                ,type:'POST'                        //조회요청
                ,dataType:'json'                  //json 응답
                ,contentType:'application/json'   //문자열 파라미터
                ,async:false
                ,error:function(jqXHR,status,error){
                    dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                }
            }).done(function(body) {

                if ( dms.string.isNotEmpty(body.membershipNo) ) {

                    resetDefaultForm();

                    var dataItem = body;
                    $("#custNo").val(dataItem.custNo);
                    $("#custNm").val(dataItem.custNm);
                    $("#custNm").attr("readonly", true);
                    $("#custNm").addClass("form_readonly");
                    $("#mngScId").val(dataItem.mngScId);//담당영업자
                    $("#membershipNo").val(dataItem.membershipNo);//멤버십 번호
                    $("#cardNo").val(dataItem.cardNo);//포인트 카드 번호
                    $("#bfCardNo").val(dataItem.cardNo);//포인트 카드 번호
                    $("#cardTpCd").val(dataItem.cardTpCd);//포인트 카드 유형
                    $("#custTp").data("kendoExtDropDownList").value(dataItem.custTp);//고객유형
                    $("#addrFull").val(dataItem.addrFull);//주소2
                    $("#telNo").val(dataItem.telNo);//집전화
                    $("#prefCommMthCd").data("kendoExtDropDownList").value(dataItem.custTp);//선호연락방법
                    $("#prefCommNo").val(dataItem.prefCommNo);//선호연락방법
                    $("#hpNo").val(dataItem.hpNo);//핸드폰번호
                    $("#emailNm").val(dataItem.emailNm);//이메일명
                    $("#fileDocNo").val(dataItem.fileDocNo);//파일 일련번호
                    $("#befGradeCd").val(dataItem.gradeCd);//이전등급
                    $("#mathDocTp").data("kendoExtDropDownList").value(dataItem.mathDocTp);//신분증 유형(주요인증문서유형)
                    $("#ssnCrnNo").val(dataItem.ssnCrnNo);//주민사업자등록번호
                    $("#gradeCd").data("kendoExtDropDownList").value(dataItem.gradeCd);//고객등급코드
                    $("#gradeCd").data("kendoExtDropDownList").enable(false);

                    $("#lastPointVal").data("kendoExtNumericTextBox").value(dataItem.lastPointVal);//적립포인트(가용)

                    if ( stan === "V" ){//  C.고객, V.자동차
                        $("#vinNo").val(dataItem.vinNo)
                        $("#modelNm").val(dataItem.carlineNm+" / "+dataItem.modelNm);//차종명/모델명
                        $("#carRegNo").val(dataItem.carRegNo);//차량번호
                    };

                    $("#fileGrid").data("kendoExtGrid").dataSource.read();  //첨부파일

                    // 회원등급 수동 변경여부 가 Y 인경우에만 등급변경 버튼 노출.   2/4
                    <c:if test="${membershipGradeNoneAutoYn eq 'Y'}">
                        $("#btnMembershipGradeNoneAutoYn").data("kendoButton").enable(true);
                    </c:if>

                } else {
                    membershipManageWindow.close();
                    // {멤버십 번호}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='global.lbl.membershipNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                };

            });
            // 상세조회 종료

        };

    };

    // 팝업 종료 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function closePopup(){
        var membershipManageWindow = $("#membershipManageWindow").data("kendoWindow");
        membershipManageWindow.close();
    };

    function membershipCardRchg(pointCd) {

        // 그리드에서 선택된 멤버가 있는지 확인
        var grid = $('#membershipGrid').data('kendoExtGrid');
        var selectedItem = grid.dataItem(grid.select());

        var popupTitle;
        if (pointCd === "99") {
            popupTitle = "<spring:message code='crm.title.cardRchgMinus'/>"   // 카드금액차감
        } else if (pointCd === "10") {
            popupTitle = "<spring:message code='crm.title.cardRchgReg'/>"   // 카드 금액 충전
        } else {
            // {포인트출처}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='crm.lbl.pointCdCont' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        };

        var dlrCd="";
        var membershipNo="";
        if(selectedItem == null){
            //충전카드 등록을 하고자 하는 고객을 선택하여 주십시오.
            dms.notification.info("<spring:message code='crm.info.rchgCardNoCust'/>");
            return;
        }else{
            dlrCd = selectedItem.dlrCd;
            membershipNo = selectedItem.membershipNo;
        }

        var rchgCardGrid = $("#cardListGrid").data('kendoExtGrid');
        var selectedItem2 = rchgCardGrid.dataItem(rchgCardGrid.select());

        var cardNo="";
        var cardTpCd="";
        if(selectedItem2 == null){
            if (pointCd === "99") {
                //소멸하고자 하는 카드를 선택해 주십시오.
                dms.notification.info("<spring:message code='crm.info.extcCardNoSelect'/>");
            } else if (pointCd === "10") {
                //충전하고자 하는 카드를 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.rchgCardNoSelect'/>");
            };
            return;
        }else{
            cardNo = selectedItem2.cardNo;
            cardTpCd = selectedItem2.cardTpCd;
        }

        membershipCardSearch = dms.window.popup({
            windowId:"rechargeCardPopup"
            , width:800
            , height:150
            , title:popupTitle
            , content:{
                url:"<c:url value='/crm/dmm/membership/selectMembershipRechargePopup.do?dlrCd="+dlrCd+"&membershipNo="+membershipNo+"&cardNo="+cardNo+"&cardTpCd="+cardTpCd+"&pointCd="+pointCd+"'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        //패키지 쿠폰 이력 그리드 데이터 조회
                        $("#cardListGrid").data('kendoExtGrid').dataSource.page(1);
                        $("#tabCardListGrid").data('kendoExtGrid').dataSource.page(1);
                    }
                }
            }
        });

    };

    //검색조건 : 등록일 시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
        //if(dms.string.isEmpty($(this).val())){return;}
        if(dms.string.isEmpty(e.data.from.val())){return;}
        if(dms.string.isEmpty(e.data.to.val())){return;}

        var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
        var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
        if(startDt > endDt){
            dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
            $(this).focus();
        }
    }

    function specialPoint(specialPointTp){

        var specialPointTp = specialPointTp;

        if ( dms.string.isEmpty(specialPointTp) ) {

            // TODO 특별포인트 타입을 확인해주세요

        } else {

            var popupTitle;
            if ( specialPointTp === "01" ) {
                popupTitle = "<spring:message code='global.title.specialPointReq'/>"   // 특별포인트 신청
            } else if ( specialPointTp === "02" ) {
                popupTitle = "<spring:message code='global.title.specialPointDec'/>"   // 특별포인트 감소
            };

            // 그리드에서 선택된 멤버가 있는지 확인
            var grid = $('#membershipGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var membershipNo="";
            var cardNo="";
            var cardTpCd="";
            if(selectedItem == null){
                //특별포인트를 지급하고자 하는 고객을 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.specialPoint'/>");
                return;
            }else{
                membershipNo = selectedItem.membershipNo;
                cardNo = selectedItem.cardNo;
                cardTpCd = selectedItem.cardTpCd;
            };

            specalPopupWindow = dms.window.popup({
                windowId:"specialPointPopup"
                , width:800
                , height:180
                , title:popupTitle
                , content:{
                    url:"<c:url value='/crm/dmm/membership/selectSpecialPointPopup.do?membershipNo="+membershipNo+"&cardNo="+cardNo+"&cardTpCd="+cardTpCd+"&specialPointTp="+specialPointTp+"'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data === true){
                                //포인트 이력 그리드 데이터 조회
                                $("#specialPointGrid").data('kendoExtGrid').dataSource.read();
                            };
                        }
                    }
                }
            });

        };

    };

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#membershipGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
        ;

        viewDetail(selectedItem.membershipNo);

    });


    function resetDefaultSearchForm(){
        $("#sCustNo").val("");
        $("#sCustNm").val("");
        $("#sMembershipNo").val("");
        $("#sVinNo").val("");
        $("#sStartDt").data("kendoExtMaskedDatePicker").value();
        $("#sEndDt").data("kendoExtMaskedDatePicker").value();
    }

    function resetDefaultForm(){

        $("#custNo").val("");
        $("#custNm").val("");
        $("#custNm").attr("readonly", false);
        $("#custNm").removeClass("form_readonly");
        $("#membershipNo").val("");//멤버십 번호
        $("#mngScId").val("");//담당영업자
        $("#custTp").data("kendoExtDropDownList").value("")//고객유형
        $("#gradeCd").data("kendoExtDropDownList").enable(true);
        $("#gradeCd").data("kendoExtDropDownList").value("")//고객등급
        //$("#custTp").val(data[0].custTp);
        $("#addrFull").val("");//주소2
        $("#telNo").val("");//집전화
        $("#prefCommMthCd").data("kendoExtDropDownList").select(0);//선호연락방법
        //$("#prefCommMthCd").val(data[0].prefCommMthCd);
        $("#prefCommNo").val("");//선호연락방법
        $("#hpNo").val("");//핸드폰번호
        $("#emailNm").val("");//이메일명
        $("#mathDocTp").data("kendoExtDropDownList").select(0);//신분증 유형(주요인증문서유형)
        $("#ssnCrnNo").val("");//주민사업자등록번호

        if ( stan === "V" ) {
            $("#vinNo").val("");
            $("#carRegNo").val(""); // 차량번호
            $("#modelNm").val(""); //차종명/모델명
        }

        $("#cardNo").val("");//포인트 카드번호
        $("#bfCardNo").val("");//포인트 카드번호
        $("#cardTpCd").val("");//포인트 카드 일련번호
        $("#fileDocNo").val("");//첨부파일 초기화
        $("#custGradeCd").val("");//고객등급코드
        $("#befGradeCd").val("");// 이전등급
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  //파일
        $("#tabPointHisGrid").data("kendoExtGrid").dataSource.data([]);  //포인트이력
        $("#tabCardListGrid").data("kendoExtGrid").dataSource.data([]);  //충전카드이력
        $("#tabGradeGrid").data("kendoExtGrid").dataSource.data([]);  //등급변경이력
        $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);  //충전카드목록
        $("#packageCouponHisGrid").data("kendoExtGrid").dataSource.data([]);  //등급변경이력
        $("#specialPointGrid").data("kendoExtGrid").dataSource.data([]);  //특별포인트 신청 목록
        $("#signLineGrid").data("kendoExtGrid").dataSource.data([]);// 결재정보
        $("#lastPointVal").data("kendoExtNumericTextBox").value(0);

        $("#btnApproval").data("kendoButton").enable(false);
        $("#btnRollback").data("kendoButton").enable(false);

        // 회원등급 수동 변경여부 가 Y 인경우에만 등급변경 버튼 노출.   3/4
        <c:if test="${membershipGradeNoneAutoYn eq 'Y'}">
            //console.log("초기화에 무조건 등급변경 false");
            $("#btnMembershipGradeNoneAutoYn").data("kendoButton").enable(false);
        </c:if>

    };

    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                custSearchPopupWindow();
            }
        }
    });

    function custSearchPopupWindow(){
        if($("#searchYn").val() == 'Y'){
            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , width:900
                , height:505
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "type"  :null
                        , "custNm":$("#custNm").val()
                        , "custCd":null         // null:all, 01:잠재, 02:보유
                        , "dlrMbrYn":"N"
                        , "dlrMbrEnableYn":false
                        , "membershipStan":stan
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {

                                //console.log("고객조회 : ",data)

                                var custNo = data[0].custNo;
                                $("#custNo").val(custNo);
                                $("#custNm").val(data[0].custNm);
                                $("#mngScId").val(data[0].mngScId);//담당영업자
                                $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);//고객유형
                                $("#addrFull").val(data[0].addr1 + data[0].addr2);//주소2
                                $("#telNo").val(data[0].telNo);//집전화
                                $("#prefCommMthCd").data("kendoExtDropDownList").value(data[0].prefCommMthCd);//선호연락방법
                                $("#prefCommNo").val(data[0].prefCommNo);//선호연락방법
                                $("#hpNo").val(data[0].hpNo);//핸드폰번호
                                $("#emailNm").val(data[0].emailNm);//이메일명
                                $("#mathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp);//신분증 유형(주요인증문서유형)
                                $("#ssnCrnNo").val(data[0].ssnCrnNo);//주민사업자등록번호

                                if ( stan === "V" && data.searchTp === "V" ) {

                                        //console.log("차량기준 vin 설정");
                                        $("#vinNo").val(data.vinNo);
                                        $("#carRegNo").val(data.carRegNo);
                                        $("#modelNm").val(data.carlineNm+" / "+data.modelNm);//차종명/모델명

                                };

                                $("#custGradeCd").val(data[0].custGradeCd);//고객등급코드
                                //가입신청서

                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });
        } /* end if */
    };

    occrPointValFormat = function(pointTp, occrPointVal){
        var occrPointStr;
        if ( dms.string.isNotEmpty(pointTp) && occrPointVal > 0 ) {
            occrPointStr = "("+pointTp+") "+kendo.toString(occrPointVal, "n");
        };
        return occrPointStr;
    };

    /**
    * hyperlink in grid event of Customer Information
    */
    $(document).on("click", ".linkCust", function(e){

         var grid = $("#membershipGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
    });
    //会员管理 下载Excel 贾明 2018-9-28  start
     $("#btnExcelExport").kendoButton({
        click:function(e) {
        	if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                    ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
            }else{
                $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sEndDt").focus();
                return false;
            }
            resetDefaultForm();
            
           
            
            var param = $.extend(
                    {"sCustNm"          :$("#sCustNm").val()}
                   ,{"sMembershipNo"    :$("#sMembershipNo").val()}
                   ,{"sVinNo"           :$("#sVinNo").val()}
                   ,{"sStartDt"         :$("#sStartDt").data("kendoExtMaskedDatePicker").value()}
                   ,{"sEndDt"           :$("#sEndDt").data("kendoExtMaskedDatePicker").value()}
               );
          
            $.ajax({
                url:"<c:url value='/crm/dmm/membership/selectMembershipsListCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"              :"membershipService"
                            ,"templateFile"         :"MembershipsList_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='crm.menu.membershipMng' />.xlsx"
                            ,"sCustNm"              :$("#sCustNm").val()
                            ,"sMembershipNo"        :$("#sMembershipNo").val()
                            ,"sVinNo"               :$("#sVinNo").val()
                            ,"sStartDt"             :$("#sStartDt").val()
                            ,"sEndDt"               :$("#sEndDt").val()
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
            
        
       }
      });
    
    //会员管理 下载Excel 贾明 2018-9-28  start
     
    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************/
        $("#membershipManageWindow").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.menu.membershipMng' />"      // 멤버십 관리 메인
            ,width:"950px"
            ,height:"510px"
        }).data("kendoWindow");

        // 탭영역 지정
        $("#tabstrip").kendoExtTabStrip({
            animation:false,
            select: function(e){

                if ( dms.string.isNotEmpty($("#membershipNo").val()) ) {

                    var selectedTabId = $(e.item).attr("id");

                    if(selectedTabId == "membershipInfo"){//멤버십 정보

                    }else if(selectedTabId == "membershipRechargeCard"){ //충전카드목록
                        $("#cardListGrid").data("kendoExtGrid").dataSource.page(1);
                    }else if(selectedTabId == "membershipPackageCoupon"){ //패키지쿠폰목록
                        $("#packageCouponHisGrid").data("kendoExtGrid").dataSource.page(1);
                    }else if(selectedTabId == "tabPoint"){ //포인트 이력
                        $("#tabPointHisGrid").data('kendoExtGrid').dataSource.page(1);
                    }else if(selectedTabId == "tabCardList"){ //충전카드 이력
                        $("#tabCardListGrid").data('kendoExtGrid').dataSource.page(1);
                    }else if(selectedTabId == "tabGrade"){ //등급변경기록
                        $("#tabGradeGrid").data('kendoExtGrid').dataSource.page(1);
                    }else if(selectedTabId == "tabSpecialPoint"){ //특별포인트
                        $("#specialPointGrid").data("kendoExtGrid").dataSource.page(1);  //특별포인트 신청 목록
                    };

                };

            }
        });

        //적립포인트(가용)
        $("#lastPointVal").kendoExtNumericTextBox({
            format:"n0"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        //시간
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sStartDt}' />"
        });
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sEndDt}' />"
        });

        $("#gradeCd").kendoExtDropDownList({
            dataSource:gradeCodeList
            ,dataValueField:"gradeSeq"
            ,dataTextField:"gradeNm"
            ,optionLabel:" "
        });

        // 신분증유형  (CRM024)
        $("#mathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:mathDocTpList
            , index:0
            , enable:false
        });

        // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:custTpList
            , index:0
            , enable:false
        });

         // 선호연락방법       prefCommMthCd (CRM022)
         $("#prefCommMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:prefCommMthCdList
            , index:0
            , enable:false
            , click:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                if (selcmmCd == "01"){
                    $("#prefCommNo").val($("#hpNo"));
                } else {
                    $("#prefCommNo").val("");
                }
            }
        });

        // 추가
        $("#btnAdd").kendoButton({
            click:function(e){
                // 신규 ( 첫번째 탭 선택, 다른 기본탭은 비활성화 )
                var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
                tabStrip.select(0);
                tabStrip.disable(tabStrip.tabGroup.children());
                tabStrip.enable(tabStrip.tabGroup.children().eq(0),true);

                //초기화
                resetDefaultForm();
                resetDefaultSearchForm();
                $("#rchgBtn").hide();
                $("#searchYn").val("Y");//고객조회팝업에 대한 open여부
                $(".form_search").removeClass("form_search_disabled");

                var param = {};

                $.ajax({
                    url:"<c:url value='/crm/dmm/membership/selectMembershipNoSetting.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(result){
                        if (result != ""){
                            $("#membershipNo").val(result);
                            $("#cardNo").val(result);
                        }
                    }
                });

                //팝업오픈
                viewDetail();
            }
        });

        // 상세
        $("#btnDetail").kendoButton({
            click:function(e){
                var grid = $("#membershipGrid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());

                if ( dms.string.isNotEmpty(selectedItem) ){
                    viewDetail(selectedItem.membershipNo);
                } else {
                    // {회원}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='crm.lbl.dealerMember' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                    return;
                }

            }
            ,enable:false
        });

        // 조회
        $("#btnSearch").kendoButton({
            click:function(e){

                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }
                resetDefaultForm();
                $('#membershipGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        // 인쇄
        $("#btnPrintMembership").kendoButton({
            click:function(e){

                var grid = $('#membershipGrid').data('kendoExtGrid');

                var selectedItem = grid.dataItem(grid.select());
                if(dms.string.isNotEmpty(selectedItem) && dms.string.isNotEmpty(selectedItem.membershipNo)) {

                    var idccReportParam =  "&sDlrCd="+selectedItem.dlrCd+"&sMembershipNo="+selectedItem.membershipNo+"&sCustNo="+selectedItem.custNo+"&sDateFormat="+"<dms:configValue code='dateFormat' />";

                    var idccReportUrl;

                    if ( stan === "C" ) {
                        idccReportUrl = "<c:url value='/ReportServer?reportlet=crm/membership/selectMembershipManageMainPrintC.cpt' />"+idccReportParam;
                    } else if ( stan === "V" ) {
                        idccReportUrl = "<c:url value='/ReportServer?reportlet=crm/membership/selectMembershipManageMainPrintV.cpt' />"+idccReportParam;
                    };

                    var newWindow=open(idccReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');

                } else {

                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");

                };
            }
            ,enable:false
        });

        // 저장
        $("#btnSave").kendoButton({
            click:function(e){

               // form 데이터
               var param =
                   $("#membershipForm").serializeObject(
                       $("#membershipForm").serializeArrayInSelector("[data-json-obj='true']")
                   );

               if ( dms.string.isEmpty($("#custNo").val()) ) {
                   //고객명을(를) 입력하여 주십시오.
                   dms.notification.warning("<spring:message code='global.lbl.custNm' var='init' /><spring:message code='global.info.validation.required' arguments='${init}' />");
                   return;
               }

               if ( dms.string.isEmpty($("#membershipNo").val()) ) {
                   //멤버십 번호을(를) 입력하여 주십시오.
                   dms.notification.warning("<spring:message code='global.lbl.membershipNo' var='init' /><spring:message code='global.info.validation.required' arguments='${init}' />");
                   return;
               }

               var gradeCd = $("#gradeCd").data("kendoExtDropDownList").value();
               if ( dms.string.isEmpty(gradeCd) ) {
                   //등급을(를) 선택하세요.
                   dms.notification.warning("<spring:message code='global.lbl.gradeCd' var='init' /><spring:message code='global.info.check.field' arguments='${init}' />");
                   return;
               } else {
                   param.gradeCd = gradeCd;
               };

               if ( dms.string.isEmpty($("#cardNo").val()) ) {
                   //포인트 카드번호을(를) 입력하여 주십시오.
                   dms.notification.warning("<spring:message code='global.lbl.pointCardNo' var='init' /><spring:message code='global.info.validation.required' arguments='${init}' />");
                   return;
               } else {
                   param.cardTpCd = "01"; // 01:포인트카드, 02:충전카드
               };

               if( stan === "V" ) {// C.고객, V.자동차
                   if( dms.string.isEmpty($("#vinNo").val()) ) {// C.고객, V.자동차
                       dms.notification.warning("<spring:message code='global.lbl.vinNo' var='vinNo' /><spring:message code='global.info.validation.required' arguments='${vinNo}' />");
                       return;
                   } else {
                       param.vinNo = $("#vinNo").val();
                   };
               };

               //console.log("param : " ,JSON.stringify(param));
               //return;

               $.ajax({
                   url:"<c:url value='/crm/dmm/membership/multiMembership.do' />"
                   ,data:JSON.stringify(param)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error){
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   },
                   success:function(result){

                       //console.log("result : ", result);
                       if ( result ===  0 ) {
                           dms.notification.error("<spring:message code='global.info.already'/>");
                       } else {
                           dms.notification.success("<spring:message code='global.info.success'/>");
                           resetDefaultForm();
                           closePopup();
                           $('#membershipGrid').data('kendoExtGrid').dataSource.page(1);
                       }

                   }
                   ,beforeSend:function(xhr) {
                       dms.loading.show($("#membershipManageWindow"));
                   }
                   ,complete:function(xhr, status) {
                       dms.loading.hide($("#membershipManageWindow"));
                   }
               });

            }
        });

        // 회원등급 수동 변경여부 가 Y 인경우에만 등급변경 버튼 노출.   4/4
        <c:if test="${membershipGradeNoneAutoYn eq 'Y'}">

            var membershipGradeNoneAutoYn = "${membershipGradeNoneAutoYn}";
            $("#btnMembershipGradeNoneAutoYn").kendoButton({
                click:function(e){

                    if ( membershipGradeNoneAutoYn === "Y" ) {                  //수동변경 : Y 인경우 - // 등급 활성화
                        $("#gradeCd").data("kendoExtDropDownList").enable(true);
                    } else if ( membershipGradeNoneAutoYn === "N" ) {
                        $("#gradeCd").data("kendoExtDropDownList").enable(false);
                    };

                }
                ,enable:false
            });

        </c:if>

        //소멸
        $("#btnRchgMinus").kendoButton({
            click:function(e){
                membershipCardRchg("99");
            }
        });

        //충전
        $("#btnRchg").kendoButton({
            click:function(e){
                membershipCardRchg("10");
            }
        });

        // 충전카드등록
        $("#btnRchgReg").kendoButton({
            click:function(e){
                // 그리드에서 선택된 멤버가 있는지 확인
                var grid = $('#membershipGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                var dlrCd="";
                var membershipNo="";
                var cardNo="";
                if(selectedItem == null){
                    //충전카드 등록을 하고자 하는 고객을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='crm.info.rchgCardNoCust'/>");
                    return;
                }else{
                    dlrCd = selectedItem.dlrCd;
                    membershipNo = selectedItem.membershipNo;
                    cardNo = selectedItem.cardNo;
                }

                membershipCardSearch = dms.window.popup({
                    windowId:"rechargeCardPopup"
                    , title:"<spring:message code='crm.title.rchgCardReg'/>"   // 충전카드 등록
                    , width:800
                    , height:150
                    , content:{
                        url:"<c:url value='/crm/dmm/membership/selectMembershipRechargeCardPopup.do?dlrCd="+dlrCd+"&membershipNo="+membershipNo+"&cardNo="+cardNo+"'/>"
                        , data:{
                            "autoBind":false
                            , "type"  :null
                            , "callbackFunc":function(data){
                                //패키지 쿠폰 이력 그리드 데이터 조회
                                $("#packageCouponHisGrid").data('kendoExtGrid').dataSource.read();
                            }
                        }
                    }
                });
            }
        });

        //차감
        $("#specialPointDec").kendoButton({
            click:function(e){
                // 그리드에서 선택된 멤버가 있는지 확인
                var grid = $('#membershipGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                var membershipNo="";
                var cardNo="";
                var cardTpCd="";
                if(selectedItem == null){
                    //특별포인트를 지급하고자 하는 고객을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='crm.info.specialPoint'/>");
                    return;
                }else{
                    specialPoint("02");     // +:01 / -:02
                };

            }
        });

        //특별포인트 신청
        $("#specialPoint").kendoButton({
            click:function(e){

                // 그리드에서 선택된 멤버가 있는지 확인
                var grid = $('#membershipGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                var membershipNo="";
                var cardNo="";
                var cardTpCd="";
                if(selectedItem == null){
                    //특별포인트를 지급하고자 하는 고객을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='crm.info.specialPoint'/>");
                    return;
                }else{
                    specialPoint("01");     // +:01 / -:02
                };

            }
        });

        //버튼 - 승인
        $("#btnApproval").kendoButton({
            click:function(e) {

                var tempUrl     = "";
                var saveData    = "";
                var lineGrid = $("#signLineGrid").data("kendoExtGrid");
                var selectedItem = lineGrid.dataItem(lineGrid.select());
                var signDocNo = selectedItem.signDocNo;

                if(selectedItem == null) {
                    // 결재선을(를) 선택하여 주십시오.
                    dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(selectedItem.signCont)){
                    // 화면 필수 체크(결재의견)
                    dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(signDocNo)){
                    // 화면 필수 체크(문서번호)
                    dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                var params = {};

                params["signDocId"] = selectedItem.signDocId;
                params["signDocNo"] = selectedItem.signDocNo;
                params["signDocLineNo"] = selectedItem.signDocLineNo;
                params["signCont"] = selectedItem.signCont;
                params["signStatCd"] = "03";
                params["signRsltCd"] = "04";
                params["lastSignYn"] = selectedItem.lastSignYn;

                //console.log("승인 파람:",JSON.stringify(params));
                //return;

                $.ajax({
                    url:"<c:url value='/crm/dmm/membershipTrans/updateSignLineEx.do' />"
                  , data:JSON.stringify(params)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                      dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                        closePopup();

                    }
                });
            }
        });

        //버튼 - 반려
        $("#btnRollback").kendoButton({
            click:function(e) {

                var lineGrid = $("#signLineGrid").data("kendoExtGrid");
                var selectedItem = lineGrid.dataItem(lineGrid.select());
                var signDocNo = selectedItem.signDocNo;

                if(selectedItem == null) {
                    // 결재선을(를) 선택하여 주십시오.
                    dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(selectedItem.signCont)){
                    // 화면 필수 체크(결재의견)
                    dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty(signDocNo)){
                    // 화면 필수 체크(문서번호)
                    dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                var params = {};

                params["signDocNo"] = signDocNo;
                params["signCont"] = selectedItem.signCont;
                params["signDocId"] = selectedItem.signDocId;
                params["signDocLineNo"] = selectedItem.signDocLineNo;
                params["signStatCd"] = "04";
                params["signRsltCd"] = "02";

                //return;

                $.ajax({
                    url:"<c:url value='/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
                  , data:JSON.stringify(params)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
                        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);
                        closePopup();
                    }
                });
            }
        });

        // 멤버십 그리드 ( default : 고객기준 )
        var membershipGridColumn = [
            {field:"rnum", title:"<spring:message code='global.lbl.no' />",hidden:true, width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100,attributes:{"class":"ac"}} // 딜러코드
            ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", width:130,attributes:{"class":"ac"}} // 멤버십 번호
            ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>", hidden:true, width:100,attributes:{"class":"ac"}} //카드번호
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"al"}  //고객명
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                   return spanObj;
               }
            }
            ,{field:"gradeCd", title:"<spring:message code='global.lbl.gradeCd'/>", hidden:true, width:100,attributes:{"class":"al"}}
            ,{field:"gradeNm", title:"<spring:message code='global.lbl.gradeCd'/>", width:100,attributes:{"class":"al"}} //등급
            ,{field:"totMinusRealAmt", title:"<spring:message code='crm.lbl.purcAmt'/>", width:100, sortable:false
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,decimal:0
             }//소비금액
            ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.realTotAmt'/>", width:100, sortable:false
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0
            }//가용금액
            ,{field:"totMinusPointVal", title:"<spring:message code='crm.lbl.consumePoints'/>", width:100, sortable:false
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,decimal:0
             }//소비포인트
            ,{field:"lastPointVal", title:"<spring:message code='global.lbl.savePoint'/>(<spring:message code='global.lbl.avlbStock'/>)", width:100
               ,attributes:{"class":"ar"}
               ,format:"{0:n0}"
               ,decimal:0
            }//적립포인트(가용)
            ,{field:"pointExtcExpcDtFormat", title:"<spring:message code='crm.lbl.pointExtcExpcDt'/>", width:100, sortable:false
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
               ,template:"#if (pointExtcExpcDtFormat !== null ){# #= kendo.toString(data.pointExtcExpcDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }//포인트소멸예정일
            ,{field:"custTp", title:"<spring:message code='global.lbl.custTp' />", width:100,attributes:{"class":"ac"}, sortable:false
               , template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
               , editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       , dataValueField:"cmmCd"
                       , dataSource:custTpList
                   });
                   $('<span class="k-invalid-msg" data-for="custTp"></span>').appendTo(container);
               }
            }
            ,{field:"custCd", title:"<spring:message code='global.lbl.custCd' />", width:100,attributes:{"class":"ac"}, sortable:false
               , template:'#if (custCd !== ""){# #= custCdMap[custCd]# #}#'
            }
            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", width:100,attributes:{"class":"ac"}} //이동전화
            ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo'/>", width:100,attributes:{"class":"ac"}}//고전(유선)전화
            ,{field:"regDtFormat", title:"<spring:message code='crm.lbl.membershipRegistDt'/>", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }//가입일

        ];

<!-- 차량기준일때 그리드에 차량 정보를 보여준다. 제일 뒤에 추가 후 그리드 개인화로 순서를 정렬한다.-->
<c:choose>
     <c:when test="${membershipStan eq 'V'}">
        membershipGridColumn.push(
             {field:"vinNo", title:"<spring:message code='global.lbl.vinNo'/>", width:140,attributes:{"class":"ac"}}//VIN번호
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo'/>", width:100,attributes:{"class":"ac"}}//차량번호
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm'/>", width:100,attributes:{"class":"al"}}//차종명
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm'/>", width:100,attributes:{"class":"al"}}//차관
        );
     </c:when>
</c:choose>

        // 멤버십 그리드
        $("#membershipGrid").kendoExtGrid({
            gridId:"G-CRM-0520-164400"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membership/selectMemberships.do' />"
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
                            params["sMembershipNo"] = $("#sMembershipNo").val();
                            params["sVinNo"] = $("#sVinNo").val();
                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            //console.log(kendo.stringify(params));
                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"membershipNo"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,pointExtcExpcDt:{type:"date", validation:{required:false}}
                            ,pointExtcExpcDtFormat:{type:"date", validation:{required:false}}
                            ,regDt:{type:"date", validation:{required:false}}
                            ,regDtFormat:{type:"date", validation:{required:false}}
                            ,lastPointVal:{type:"number", validation:{required:false}}
                            ,realTotAmt:{type:"number", validation:{required:false}}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                elem.pointExtcExpcDtFormat = kendo.parseDate(elem.pointExtcExpcDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
            }
            ,change:function(e){

                var selectedItem = this.dataItem(this.select());
                if( dms.string.isNotEmpty(selectedItem) ){
                    $("#btnDetail").data("kendoButton").enable(true);
                    $("#btnPrintMembership").data("kendoButton").enable(true);
                };

            }
            ,editable:false
            ,selectable:"row"
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:membershipGridColumn
        });

        //충전카드목록 그리드
        $("#cardListGrid").kendoExtGrid({
            gridId:"G-CRM-0721-141300"
            ,dataSource:{
                transport:{
                   read:{
                       url:"<c:url value='/crm/dmm/membership/selectRechargeCardList.do' />"
                   }
                    ,parameterMap:function(options, operation) {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        params["sMembershipNo"] = $("#membershipNo").val()

                        //console.log("카드목록 : ",kendo.stringify(params))
                        return kendo.stringify(params);
                    }
               }
               ,schema:{
                   model:{
                       id:"membershipNo"
                       ,fields:{
                           rnum:{type:"string", editable:false}
                           ,realTotAmt:{type:"number", validation:{required:false}}
                           ,regDt:{type:"date", validation:{required:false}}
                       }
                   }
               }
           }
           ,height:385
           ,multiSelectWithCheckbox:false
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:fa
           ,editable:false
           ,filterable:false
           ,pageable:false
           ,autoBind:false
           ,scrollable: {
               virtual: true
           }
           ,selectable:"row"
           ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
               ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo'/>", width:150, attributes:{"class":"ac"}}  //카드번호
               ,{field:"realTotAmt", title:"<spring:message code='crm.lbl.realTotAmt'/>", width:100, attributes:{"class":"ar"}  //가용금액
                   ,format:"{0:n2}"
                   ,decimal:0
               }
               ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>" //카드종류
                   ,attributes:{"class":"ac"}
                   ,width:120
                   ,sortable:false
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:cardTpList
                       });
                    }
                   ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
               }
               ,{field:"regDt", title:"<spring:message code='crm.lbl.issueDate'/>", width:100, attributes:{"class":"ac"}    //발급일
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"usrNm", title:"<spring:message code='global.lbl.regUsrId'/>", width:100,attributes:{"class":"ac"}}  //등록자
           ]
        });

        // 충전카드이력 그리드 설정
        $("#tabCardListGrid").kendoExtGrid({
            gridId:"G-CRM-0721-141700"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membership/selectMembershipPointHiss.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCardTpCd"] = "02";
                            params["sMembershipNo"] = $("#membershipNo").val();

                            //console.log("카드이력 : ",kendo.stringify(params))
                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,occrPointVal:{type:"number", validation:{required:false}, editable:false}
                            ,realTotAmt:{type:"number", validation:{required:false}, editable:false}
                        }
                    }
                }
            }
            ,autoBind:false
            ,height:420
            ,editable:false
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,selectable:"row"
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo'/>",width:150,attributes:{"class":"ac"}} //카드번호
                ,{field:"pointCd", title:"<spring:message code='crm.lbl.pointCdCont'/>",width:120,attributes:{"class":"ac"} //포인트 출처
                    ,sortable:false
                    ,template:'#if(pointCd !== ""){# #= pointCdMap[pointCd]# #}#'
                }
                ,{field:"occrPointVal", title:"<spring:message code='global.lbl.amt'/>", width:100,attributes:{"class":"ar"}    //금액
                    ,template:'#if(pointTp !== ""){# #= occrPointValFormat(pointTp, occrPointVal) # #}#'
                }
                ,{field:"lastPointVal", title:"<spring:message code='crm.lbl.realTotAmt'/>", width:100,attributes:{"class":"ar"}  //가용금액
                    ,format:"{0:n2}"
                    ,decimal:0
                }/* 20170602 REAL_TOT_AMT 컬럼 용도 변경 ( 수납금액 입력 ) 함에 따라 최종 금액은 LAST_POINT_VAL을 사용한다. */
                ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"} //발생일
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                }
                ,{field:"remark", title:"<spring:message code='crm.lbl.extcAmtReason'/>", width:100 } //소멸사유
                ,{field:"prsnNm", title:"<spring:message code='crm.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //책임자
                ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />", width:100 , attributes:{"class":"ac"}// 사용처
                    ,sortable:false
                    ,template:"#=dcUseTpArrVal(useTp)#"
                }
                ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"},sortable:false ,width :150}  // 사용번호
            ]

        });

        // 포인트이력 그리드 설정
        $("#tabPointHisGrid").kendoExtGrid({
            gridId:"G-CRM-0721-141600"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membership/selectMembershipPointHiss.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCardTpCd"] = "01";
                            params["sMembershipNo"] = $("#membershipNo").val();

                            //console.log("포인트 : ",kendo.stringify(params))
                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,lastPointVal:{type:"number", validation:{required:false}, editable:false}
                        }
                    }
                }
            }
            ,autoBind:false
            ,height:420
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,editable:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,selectable:"row"
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                ,{field:"pointCd", title:"<spring:message code='crm.lbl.pointCdCont'/>",width:120,attributes:{"class":"ac"} //포인트 출처
                    ,sortable:false
                    ,template:'#if(pointCd !== ""){# #= pointCdMap[pointCd]# #}#'
                }
                ,{field:"occrPointVal2", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ar"} } //발생포인트
                ,{field:"lastPointVal", title:"<spring:message code='crm.lbl.usePoint'/>", width:100,attributes:{"class":"ar"}  //가용포인트
                    ,format:"{0:n0}"
                    ,decimal:0
                }
                ,{field:"occrDt", title:"<spring:message code='global.lbl.arDt'/>", width:150,attributes:{"class":"ac"} //발생일
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                }
                ,{field:"prsnNm", title:"<spring:message code='crm.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //책임자
                ,{field:"useTp", title:"<spring:message code='crm.lbl.useModule' />", width:100 , attributes:{"class":"ac"}// 사용처
                    ,sortable:false
                    ,template:"#=dcUseTpArrVal(useTp)#"
                }
                ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"},sortable:false ,width :150}  // 사용번호
            ]

        });

        // 등급변경기록 그리드 설정
        $("#tabGradeGrid").kendoExtGrid({
            gridId:"G-CRM-0721-141900"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membership/selectMembershipGradeHiss.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sMembershipNo"] = $("#membershipNo").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"gradeChgHisSeq"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,gradeChgDt:{type:"date", validation:{required:false}, editable:false}
                        }
                    }
                }
            }
            ,autoBind:false
            ,height:420
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,editable:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,selectable:"row"
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
                ,{field:"befGradeCd", title:"<spring:message code='crm.lbl.befGradeHisCd' />", width:200, attributes:{"class":"ac"}
                    ,validation:{required:true}
                    ,attributes:{"class":"ac"}
                    ,sortable:false
                    ,template:"# if(gradeCodeListMap[befGradeCd] != null) { # #= gradeCodeListMap[befGradeCd].gradeNm# # }#"
                } //기존등급
                ,{field:"aftGradeCd", title:"<spring:message code='crm.lbl.aftGradeHisCd' />", width:200, attributes:{"class":"ac"}
                    ,validation:{required:true}
                    ,attributes:{"class":"ac"}
                    ,sortable:false
                    ,template:"# if(gradeCodeListMap[aftGradeCd] != null) { # #= gradeCodeListMap[aftGradeCd].gradeNm# # }#"
                } //현등급
                ,{field:"gradeChgTp", title:"<spring:message code='crm.lbl.gradeChgHisTp'/>", width:100 ,attributes:{"class":"ac"}      // 조정유형
                    ,sortable:false
                    ,template:"#if (gradeChgTp === 'A'){# #= '<spring:message code='crm.lbl.custExtrAutoYes'/>' # #} else {# #= '<spring:message code='crm.lbl.custExtrAutoNo'/>' # #}#"
                }
                ,{field:"gradeChgDt", title:"<spring:message code='crm.lbl.gradeChgHisDt' />", width:200
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                } //조정발생시간
                ,{field:"usrNm", title:"<spring:message code='crm.lbl.gradeChgUsrId'/>", width:100,attributes:{"class":"ac"} } //등급변경자
            ]
        });

        // 특별포인트 그리드 설정
        $("#specialPointGrid").kendoExtGrid({
            gridId:"G-CRM-0105-151201"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membership/selectMembershipSpecialPoints.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["sort"] = options.sort;
                            params["sMembershipNo"] = $("#membershipNo").val();

                            //console.log("kendo.stringify(params) : ",kendo.stringify(params))
                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"seq"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,seq:{type:"number", validation:{required:true}, editable:false}
                            ,providePointVal:{type:"number", validation:{required:true}, editable:false}
                            ,regDt:{type:"date", validation:{required:true}, editable:false}
                            ,updtDt:{type:"date", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,change:function(e){

                var selectedItem = this.dataItem(this.select());
                var signDocNo = selectedItem.signDocNo;

                if ( dms.string.isNotEmpty(signDocNo) ) {

                    $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);
                    $("#signDocNo").val(signDocNo);
                };


            }
            ,autoBind:false
            ,height:170
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,editable:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,filterable:false
            ,pageable:false
            ,selectable:"row"
            ,columns:[
                 {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:100,attributes:{"class":"ac"}, hidden:true } //딜러코드
                ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo' />", width:150,attributes:{"class":"ac"}} //멤버십 번호
                ,{field:"seq", title:"<spring:message code='global.lbl.seq' />", width:100,attributes:{"class":"ac"}} //일련번호
                ,{field:"pointCd", title:"<spring:message code='crm.lbl.pointCdCont'/>", width:100,attributes:{"class":"ac"}
                    ,sortable:false
                    ,template:'#if(pointCd !== ""){# #= pointCdMap[pointCd]# #}#'
                } //포인트출처
                ,{field:"providePointVal2", title:"<spring:message code='crm.lbl.providePointVal' />", width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n0}"
                } //부여포인트값
                ,{field:"provideReasonCont", title:"<spring:message code='crm.lbl.provideReasonCont' />", width:150,attributes:{"class":"al"}} //부여사유내용
                ,{field:"signDocNo", title:"<spring:message code='global.lbl.signDocNo' />", width:150,attributes:{"class":"ac"}} //결재문서번호
                ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId'/>", width:150,attributes:{"class":"ac"}} //등록자
                ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>", width:150,attributes:{"class":"ac"}       // 등록일
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                }
                ,{field:"updtUsrId", title:"<spring:message code='global.lbl.updtUsrId'/>", width:150, hidden:true
                    ,attributes:{"class":"al"}
                } //수정자
                ,{field:"updtDt", title:"<spring:message code='global.lbl.updtDt'/>", width:150, hidden:true
                    ,attributes:{"class":"ac"}     //수정일
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                }
            ]
        });

        // 결재상신정보 그리드 설정
        $("#signLineGrid").kendoExtGrid({
            gridId:"G-CRM-0905-131400"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipTrans/selectSignLineExs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var transGrid = $("#specialPointGrid").data("kendoExtGrid");
                            var selectedItem = transGrid.dataItem(transGrid.select());
                            var params = {};
                            params["sSignDocId"] = selectedItem.signDocId;
                            params["sSignDocNo"] = selectedItem.signDocNo;
                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"signDocLineNo"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,signDocId:{type:"string", validation:{required:true}}
                            ,signDocLineNo:{type:"string",editable:false}
                            ,signTp:{type:"string", validation:{required:true}}
                            ,signUsrId:{type:"string", validation:{required:true}}
                            ,signUsrNm:{type:"string", validation:{required:true}}
                            ,signPstiCd:{type:"string", validation:{required:true}}
                            ,signPstiNm:{type:"string", validation:{required:true}}
                            ,signDeptCd:{type:"string", validation:{required:true}}
                            ,signDeptNm:{type:"string", validation:{required:true}}
                            ,signStatCd:{type:"string", editable:false}
                            ,signRsltCd:{type:"string", editable:false}
                            ,signDt    :{type:"date", editable:false}
                            ,signCont  :{type:"string"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,filterable:false
            ,sortable:false
            ,pageable:false
            ,selectable:"row"
            ,edit:function(e) { //그리드에서 수정하려고 들어가는 시점에서 화면 컨트롤
                var data = e.model;

                if ((data.signUsrId != "${userId}" || data.signStatCd != "02") &&
                    e.sender.columns[e.container.index()].field == "signCont") {
                    this.closeCell();
                }

            }
            ,change:function(e){
                var evalDs = this.dataSource;
                var iRowCnt = evalDs.total();
                var selectedItem = this.dataItem(this.select());

                // TODO 결재정보에 상태가 반겨가 있으면 승인/반려 버튼 disabled
                for(var i = 0; i < iRowCnt; i++){
                    if(selectedItem.signUsrId == "${userId}" && selectedItem.signStatCd == "02"){
                        $("#btnApproval").data("kendoButton").enable(true);
                        $("#btnRollback").data("kendoButton").enable(true);
                        break;
                    }else{
                        $("#btnApproval").data("kendoButton").enable(false);
                        $("#btnRollback").data("kendoButton").enable(false);
                    }
                }
            }
            ,dataBound:function (e) { //그리드가 로딩된 후 화면컨트롤 할때 해야 하는 부분

                $("#btnApproval").data("kendoButton").enable(false);
                $("#btnRollback").data("kendoButton").enable(false);

            }
            ,multiSelectWithCheckbox:false
            ,editableOnlyNew:true
            ,editableOnlyNewExcludeColumns:["signUsrNm", "signCont"]
            ,height:170
            ,columns:[
                {field:"signDocId", hidden:true}
                ,{field:"signDocLineNo", title:"<spring:message code='crm.lbl.abbreviationForNumber' />", width:100 ,attributes:{"class":"ac"}}
                ,{field:"signRsltCd", title:"<spring:message code='global.lbl.result' />", width:100
                    ,template:"# if(arrSignProcCdMap[signRsltCd] != null) { # #= arrSignProcCdMap[signRsltCd].cmmCdNm# # }#"
                        ,editor:function(container, options) {
                            $('<input required name="signRsltCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:arrSignProcCd
                            });
                            $('<span class="k-invalid-msg" data-for="signRsltCd"></span>').appendTo(container);
                        }
                }
                ,{field:"signUsrNm", title:"<spring:message code='crm.lbl.prsNm' />", width:200
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input id="signUserNm" type="text" data-bind="value:' + options.field + '" class="form_input" /><a id="btnUserSearch" href="javascript:userSearchPopup();">검색</a></div>')
                        .kendoAutoComplete({
                            minLength:2
                            ,template:"[#:data.usrId#]#:data.usrNm#"
                            ,dataTextField:"usrId"
                            ,dataSource:{
                                serverFiltering:true
                                ,transport:{
                                    read:{
                                         url:"<c:url value='/cmm/sci/user/selectUsersForSuggest.do' />"
                                         ,dataType:"json"
                                         ,type:"POST"
                                         ,contentType:"application/json"
                                    }
                                    ,parameterMap:function(options, operation)
                                    {
                                        if (operation === "read") {
                                            return kendo.stringify({
                                                "sText":$("#signUsrNm").data("kendoAutoComplete").value()
                                                ,"recordCountPerPage":10
                                            });
                                        }
                                    }
                                }
                                ,schema:{
                                    data:"data"
                                    ,total:"total"
                                }
                            }
                        })

                        .appendTo(container)
                        $('<span class="k-invalid-msg" data-for="signUsrNm"></span>').appendTo(container);
                    }
                }
                ,{field:"signCont", title:"<spring:message code='crm.lbl.cont' />", width:600 ,attributes:{"class":"al"}}
                ,{field:"taskNm", title:"<spring:message code='global.lbl.task' />", width:100, attributes:{"class":"ac"}
                    ,template:'#= fn_getTaskNm(signUsrId)#'
                }
                ,{field:"signDt", title:"<spring:message code='global.lbl.dateTime' />", width:200
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                }
            ]

        });

        //고객 쿠폰 그리드 시작
        $("#packageCouponHisGrid").kendoExtGrid({
            gridId:"G-CRM-0320-112401"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membership/selectCustCouponPublishInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCustNo"] = $("#custNo").val();
                            params["sVinNo"] = $("#vinNo").val();

                            //console.log("멤버십-고객 쿠폰 param kjlee : ",params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"publiNo"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                                ,cupnFromDt:{type:"date"}
                                ,cupnToDt:{type:"date"}
                                ,publiDt:{type:"date", editable:false}
                                ,usedDt:{type:"date", editable:false}
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:385
            ,autoBind:false
            ,navigatable:true
            ,sortable:false
            ,editable:false
            ,filterable:false
            ,selectable:"row"
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}, hidden:true}// 일련번호
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm' />", width :150, attributes:{"class":"al"}}  // 쿠폰명
               ,{field:"dcUseTp", title:"<spring:message code='crm.lbl.dcUseTp' />"      // 할인사용구분
                   , width :100
                   , attributes:{"class":"ac"}
                   , template:"#=dcUseTpArrVal(dcUseTp)#"
               }
               ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width :140, attributes:{"class":"ac"}}  // VIN 번호
               ,{field:"publiNo", title:"<spring:message code='crm.lbl.publishNo' />", attributes:{"class":"ac"} , width:180 }  // 발행번호
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", attributes:{"class":"ar"} , width:60   // 유효일자
                   ,template:function(dataItem){
                       var spanObj = dataItem.cupnValidPrid;
                       if (dataItem.cupnValidPrid == 0) {   //
                           spanObj = "-";
                       }
                       return spanObj;
                   }
               }
               ,{field:"cupnFromDt", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :100               // 쿠폰시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"cupnToDt", title:"<spring:message code='crm.lbl.cupnToDt' />", width :100               // 쿠폰종료일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"publiDt", title:"<spring:message code='crm.lbl.publishDt' />", width :100               // 발행일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (data.publiDt !== null ){# #= kendo.toString(data.publiDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"publiUsrNm", title:"<spring:message code='crm.lbl.publisher' />", width :100, attributes:{"class":"ac"}}  // 발행인
               ,{field:"usedDt", title:"<spring:message code='crm.lbl.cupnUseDt' />", width :100               // 쿠폰사용일자
                   ,attributes:{"class":"ac"}
                   ,template:"#if (data.usedDt !== null ){# #= kendo.toString(data.usedDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"dcUseTp", title:"<spring:message code='crm.lbl.useModule' />"
                   , width :100
                   , attributes:{"class":"ac"}
                   , template:"#=dcUseTpArrVal(dcUseTp)#"
               }  // 사용처
               ,{field:"useNum", title:"<spring:message code='crm.lbl.useNumber' />", attributes:{"class":"ac"}, width :150}  // 송장번호
               ,{field:"chkUsrNm", title:"<spring:message code='crm.lbl.chkUsrNm' />", attributes:{"class":"ac"}, width :100}  // 쿠폰집행자
            ]
        });

        //파일업로드3:파일 다운로드  ****************************
        $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
           var grid = $("#fileGrid").data("kendoExtGrid");
           var dataItem = grid.dataItem(grid.select());

           if(dms.string.isNotEmpty(dataItem)){
               dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
           }
        });

        // 파일 그리드 시작 //
        $("#fileGrid").kendoExtGrid({
            gridId:"G-CRM-0519-134702"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    },
                    parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["sFileDocNo"] = $("#fileDocNo").val();
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        fields:{
                            fileDocNo:{type:"string"}
                            ,fileNo:{type:"number"}
                            ,fileNm:{type:"string"}
                            ,fileSize:{type:"number"}
                        }
                    }
                }
            }
           ,autoBind:false
           ,editable:false
           ,height:220
           ,navigatable:false
           ,pageable:false
           ,sortable:false
           ,multiSelectWithCheckbox:true
           ,columns:[
                     {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                         ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                     }
                     ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                         ,attributes:{"class":"ar"}
                         ,template:"#= dms.string.formatFileSize(fileSize) #"
                     }
           ]
        });

        //파일업로드5:스크립트 추가 $(document).ready 안쪽*****
        $("#fileDelete").click(function(){
            var grid = $("#fileGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var deleteList = [];
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
            });

            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                ,data:JSON.stringify(deleteList)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    grid.dataSource._destroyed = [];
                    grid.dataSource.read();

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        });

        // 결재목록에서 참조문서보기 클릭해서 파라미터가지고 페이지 조회한경우 상세조회 팝업을 열어준다
        <c:if test="${!empty membershipNo}">
            viewDetail("${membershipNo}");
        </c:if>

    });// ready종료

    /* *************************************************************************
     **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
     ***************************************************************************/
     //================================
     var r = new Resumable({
         target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize:1 * 1024 * 1024
         ,simultaneousUploads:4
         ,testChunks:true
         ,throttleProgressCallbacks:1
         ,method:"octet"
     });
     r.assignBrowse($('#fileSelect')[0]);

     //파일추가 이벤트
     r.on('fileAdded', function(file) {

         $("#progressWindow").kendoWindow({
             width:"600px"
             ,height:"300px"
             ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
             ,animation:false
             ,draggable:true
             ,visible:false
             ,resizable:false
             ,modal:false
         }).data("kendoWindow").center().open();


         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();

         //파일목록 출력
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         r.upload();

     });
     r.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     r.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#fileDocNo").val())) {
             $.ajax({
                 url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType:"json",
                 type:"get",
                 async:false,
                 cache:false,
                 success:function(id) {
                     _that.opt["query"]["resumableSessionId"] = id;
                     $("#fileDocNo").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 fileDocNo 를 변경해준다
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();   // 파일업로드8:기존꺼에 추가할경우 fileDocNo 설정
         }

         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     r.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();


         $("#progressWindow").data("kendoWindow").close();
         r.files = [];
         $(".resumable-list").html("");
     });
     r.on('fileSuccess', function(file, message) {
         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo:result.fileDocNo
                 ,fileNo:result.fileNo
                 ,fileNm:result.fileNm
                 ,fileSize:result.fileSize //,fileSize:dms.string.formatFileSize(result.fileSize)
             });
         }
     });
     r.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
     });
     r.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
     });
     /* *************************************************************************
     **************************파일업로드4:스크립트 추가 $(document).ready 밖 *****
     ***************************************************************************/


</script>
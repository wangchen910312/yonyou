<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>BHMC-DMS</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.culture.${springLocale}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>

<style type="text/css">
.tbl_list { width:100%;}
.tbl_list th { padding:7px 1px 4px; border:1px solid #ccc; background:#e0e6eb; color:#303030; font-weight:normal; line-height:1.2;}
.tbl_list td { padding:7px 9px 4px; border:1px solid #e5e5e5;}
.tbl_list td a { color:#303030;}
.tbl_list td a.hasLink { color:#1580db; text-decoration:underline;}
.tbl_list tr.trbg { background:#f8f8f8;}
.tbl_list tr.red td, .tbl_list tr.red td a { color:#ed1c24!important;}
.tbl_list tbody tr:nth-child(2n) { background-color:#fafafa;}
h1 { padding:10px 0 5px; font-size:16px;}
</style>
<script type="text/javascript">
    $(document).ready(function(){
       $("[href!='#']").addClass("hasLink");
    });
</script>
</head>
<body>
    <div id="go_top" style="padding:10px;">
        <h1>개발화면 리스트</h1>
        <table class="tbl_list">
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:70%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">1depth</th>
                    <th scope="col">2depth</th>
                    <th scope="col">3depth - 화면링크</th>
                </tr>
            </thead>
            <tbody>


                <!-- 공통영역 시작 -->
                <!-- 회사정보 -->
                <tr>
                    <td>환경설정</td>
                    <td>회사정보</td>
                    <td><a href="<c:url value='/cmm/cmp/dealer/selectDealerMain.do'/>">딜러정보[DCS]</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/cmp/dealer/selectDealerMain2.do'/>">딜러정보[DMS]</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/cmp/plant/selectPlantMain.do'/>">센터정보[DCS]</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/cmp/plant/selectPlantMain2.do'/>">센터정보[DMS]</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/cmp/storage/selectStorageMain.do'/>">창고정보[DCS]</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/cmp/storage/selectStorageMain2.do'/>">창고정보[DMS]</a></td>
                </tr>

                <!-- 시스템기준정보 -->
                <tr>
                    <td></td>
                    <td>시스템기준정보</td>
                    <td><a href="<c:url value='/cmm/sci/systemConfigInfo/selectSystemConfigInfoMain.do'/>">시스템설정관리</a></td>
                </tr>
                <!-- 국가코드 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/sci/country/selectCountryMain.do'/>">국가코드관리</a></td>
                </tr>
                <!-- 언어코드 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/sci/languageCode/selectLanguageCodeMain.do'/>">언어코드관리</a></td>
                </tr>
                <!-- 지역코드 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/sci/distCode/selectDistCodeMain.do'/>">지역코드관리</a></td>
                </tr>
                <!-- 통화코드 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/sci/currency/selectCurrencyMain.do'/>">통화코드관리</a></td>
                </tr>
                <!-- 단위정보 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/sci/unitInfo/selectUnitInfoMain.do'/>">단위정보관리</a></td>
                </tr>


                <!-- 우편번호관리 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/sci/zipCode/selectZipCodeMain.do'/>">우편번호관리</a></td>
                </tr>

                <!-- 공통코드 -->
                <tr>
                    <td></td>
                    <td>공통코드</td>
                    <td><a href="<c:url value='/cmm/sci/commonCode/selectCommonCodeMain.do'/>">공통코드</a></td>
                </tr>

                <!-- 메세지소스 -->
                <tr>
                    <td></td>
                    <td>메세지소스관리</td>
                    <td><a href="<c:url value='/cmm/sci/dbMessageSource/selectDBMessageSourceMain.do'/>">메세지소스관리</a></td>
                </tr>



                <!-- 사용자관리 -->
                <tr>
                    <td></td>
                    <td>사용자관리</td>
                    <td><a href="<c:url value='/cmm/sci/user/selectUserMain.do'/>">사용자관리</a></td>
                </tr>

                <!-- 배치작업관리 -->
                <tr>
                    <td></td>
                    <td>배치작업관리</td>
                    <td><a href="<c:url value='/bat/mgr/batchOper/selectBatchOperMain.do'/>">배치작업관리</a></td>
                </tr>

                <!-- 보호자원관리 -->
                <tr>
                    <td></td>
                    <td>권한관리</td>
                    <td><a href="<c:url value='/cmm/ath/securedResource/selectSecuredResourceMain.do'/>">보호자원관리</a></td>
                </tr>

                <!-- 역할관리 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/ath/role/selectRoleMain.do'/>">역할관리</a></td>
                </tr>

                <!-- 화면관리 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/ath/viewInfo/selectViewInfoMain.do'/>">화면관리</a></td>
                </tr>

                <!-- 템플릿 관리 -->
                <tr>
                    <td></td>
                    <td>메세지 템플릿 관리</td>
                    <td><a href="<c:url value='/cmm/tmp/messageTemplate/selectMessageTemplateMain.do'/>">메세지템플릿관리</a></td>
                </tr>



                <!-- 공통팝업 -->
                <tr>
                    <td>공통기능</td>
                    <td>팝업</td>
                    <td><a href="javascript:countrySearchPopup()">국가조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:userSearchPopup()">사용자조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:dealerSearchPopup()">딜러조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:zipCodeSearchPopup()">우편번호조회팝업</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/cmm/ath/login/selectLogoutAction.do' />">로그아웃</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/samples/selectResumableFileUploadMain.do' />">파일업로드</a></td>
                </tr>



                <!-- 공통영역 종료 -->




                <!-- 형상관리 시작 -->
                <!-- DMS Profile 조회 -->
                <tr>
                    <td>형상관리</td>
                    <td>DMS Profile</td>
                    <td><a href="<c:url value='/dply/dms/dmsProfile/selectDmsProfileMain.do'/>">DMS정보조회</a></td>
                </tr>

                <!-- Spec 조회 -->
                <tr>
                    <td></td>
                    <td>Spec</td>
                    <td><a href="<c:url value='/dply/spec/specList/selectSpecListMain.do'/>">배포정의서조회</a></td>
                </tr>

                <!-- Spec 등록 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/spec/specMng/selectSpecMngMain.do'/>">배포정의서등록</a></td>
                </tr>

                <!-- 배포이력조회 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/spec/dplyHist/selectDplyHistMain.do'/>">배포이력조회</a></td>
                </tr>

                <!-- 대사조회 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/spec/comp/selectCompareBundleMain.do'/>">대사조회</a></td>
                </tr>

                <!-- 건별배포이력조회 조회 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/sync/selectSyncCmdSndRcvHistMain.do'/>">건별배포이력조회</a></td>
                </tr>

                <!-- DASHBOARD -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/dashboard/selectDashboardMain.do'/>">DASHBOARD</a></td>
                </tr>

                <!-- 기준정보등록 조회 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/mng/selectBasicInfoMngMain.do'/>">기준정보등록 조회</a></td>
                </tr>

                <!-- Notification Receiver 등록 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/noti/selectNotificationReceiverMngMain.do'/>">통보수신자등록</a></td>
                </tr>

                <!-- Notification History 조회 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/noti/selectNotificationHistoryMain.do'/>">통보이력조회</a></td>
                </tr>


                <!-- JobSchedule 등록 -->
<!--
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/jobSchMng/selectJobSchMngMain.do'/>">잡스케쥴등록</a></td>
                </tr>
-->

                <!-- Sync Command Send Receive Test -->
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/dply/cmm/sync/selectSyncCmdTestMain.do'/>">Sync Command Send Receive Test</a></td>
                </tr>



                <!-- 형상관리 종료 -->

                <!-- 부품 영역 시작 -->
                <!-- 기준정보 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>부품정보</td>
                    <td>기준정보</td>
                    <td><a href="<c:url value='/par/pmm/itemGroup/selectItemGroupMain.do'/>">품목그룹관리</a></td>
                </tr>
                <%-- <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/issueType/selectIssueTypeMain.do'/>">출고유형관리</a></td>
                </tr> --%>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/movementType/selectMovementTypeMain.do'/>">입출고유형관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/binLocationMaster/selectBinLocationDefineMain.do'/>">로케이션 레벨정의</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterMain.do'/>">로케이션 마스터관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/safetyStock/selectSafetyStockParameterMain.do'/>">안전재고산출 파라미터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/safetyStock/selectSafetyStockCalculateMain.do'/>">안전재고산출</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/safetyStock/selectSafetyStockManageMain.do'/>">안전재고관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/safetyStock/selectSafetyStockMain.do'/>">안전재고조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/stm/stockMovement/selectStorageMain.do'/>">창고간 재고이동</a></td>
                </tr>
                <%-- <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/binLocationMaster/selectBinLocationMasterMaintenanceMain.do'/>">로케이션 유지관리</a></td>
                </tr> --%>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/itemMaster/selectItemMasterMain.do'/>">부품마스터관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/itemMaster/selecComtItemMasterMain.do'/>">공용부품마스터관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/venderMaster/selectVenderMasterMain.do'/>">거래처마스터관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/venderMaster/selectVenderMasterDisableMain.do'/>">거래처마스터조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/partsPriceMaster/selectPartsPriceMasterMain.do'/>">가격마스터관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/partsPriceMaster/selectPartsPriceMasterDisableMain.do'/>">가격마스터조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/partsPriceMaster/selectPartsPriceSalMasterMain.do'/>">판매가 생성 대상선정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/partsPriceMaster/selectPartsPriceSalHistoryMain.do'/>">판매가 히스토리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <a href="<c:url value='/par/stm/stockInOut/selectStockInOut.do'/>">현재고리스트(장은정)</a>
                        <script type="text/javascript">
                        if(location.href.indexOf("localhost") != -1){
                            document.write("<img src=\"<c:url value='/resources/img/rose.jpg'/>\"  width=\"30\" />");
                        }
                        </script>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/mvtDoc/selectMvtDocTest.do'/>">수불테스트</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pmm/mvtDoc/selectMvtDoc.do'/>">수불문서조회</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/stm/investigation/selectInvestigationMain.do'/>">재고실사 대상선정</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/stm/investigation/selectInvestigationManageMain.do'/>">재고실사 결과등록</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/stm/investigation/selectInvestigationList.do'/>">재고실사 현황</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do'/>">재고조정 승인</a></td>
                </tr>

                <!--
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">적정재고 파라미터 관리_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">적정재고산출_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">적정재고관리_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">적정재고조회_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">수불유형관리_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">출고유형관리_(미작업)</a></td>
                </tr> -->
                <tr>
                    <td></td>
                    <td>구매관리</td>
                    <td><a href="<c:url value='/par/pcm/purcRqst/selectPurcRqstMain.do'/>">구매요청조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/purcCost/selectPurcCostCalculateMain.do'/>">구매소요량산출</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/purcCost/selectPurcCostManageMain.do'/>">구매소요량관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/purcCost/selectPurcCostDisableMain.do'/>">구매소요량조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do'/>">구매오더등록</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/purcOrd/selectPurcOrdList.do'/>">구매오더관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/invc/selectInvcMain.do'/>">송장등록</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/invc/selectInvcList.do'/>">송장관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/receive/selectReceiveCnfmMain.do'/>">입고확정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/receive/selectReceiveCnfmList.do'/>">입고현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/claim/selectClaimRegMain.do'/>">클레임등록</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/pcm/claim/selectClaimManageMain.do'/>">클레임관리</a></td>
                </tr>
                <!--
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">구매소요량조회_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">부품별구매현황_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">공급처별구매현황_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">반품송장등록_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">송장현황_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">입고반품확정_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">부품별입고현황_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">클레임결과반영_(미작업)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="#">클레임현황_(미작업)</a></td>
                </tr> -->
                <%-- <tr>
                    <td></td>
                    <td>출고관리</td>
                    <td><a href="<c:url value='/par/ism/issueReq/selectIssueReqMain.do'/>">출고요청관리</a></td>
                </tr> --%>
                <tr>
                    <td></td>
                    <td>출고관리</td>
                    <td><a href="<c:url value='/par/ism/issueReq/selectIssueReqServiceWorkMain.do'/>">출고요청관리</a></td>
                </tr>
                <%-- <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/ism/issueReq/selectIssueReqServiceMain.do'/>">서비스_출고요청_(API)</a></td>
                </tr> --%>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/ism/issueReq/selectIssueReqStatusMain.do'/>">출고요청현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/ism/issueReq/selectIssueReqConfirmMain.do'/>">출고확정관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/ism/issueReq/selectIssueReqConfirmStatusMain.do'/>">출고현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>판매관리</td>
                    <td><a href="<c:url value='/par/ism/issue/selectPartsSaleOrdMain.do'/>">부품판매</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/par/ism/issue/selectPartsSaleOrdList.do'/>">부품판매현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>팝업</td>
                    <td><a href="javascript:venderSearchPopup()">거래처조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:supplierSearchPopup()">공급처조회팝업</a></td>
                </tr>

                <!-- 부품영역 종료 -->

                <!-- 판매영역 시작 -->
                <!-- 기준정보 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>판매</td>
                    <td>기준정보</td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelOcnPriceMain.do'/>">VehicleSpec-FSC Price</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/btc/vehicleSettlementOrder/selectVehicleSettlementOrderMain.do'/>">완성차정산순서</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelMain.do'/>">Vehicle Spec-모델</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectLocalOptionMain.do'/>">Vehicle Spec-로컬옵션</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/localOptionMapping/selectLocalOptionMappingMain.do'/>">Vehicle Spec-모델로컬옵션맵핑</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/localOptionPrice/selectLocalOptionPriceMain.do'/>">Vehicle Spec-로컬옵션 Price</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecOptionMain.do'/>">Vehicle Spec-옵션코드</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/modelPackage/selectModelPackageMain.do'/>">Vehicle Spec-FSC</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecOuterColorMain.do'/>">Vehicle Spec-외장색코드</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecInnerColorMain.do'/>">Vehicle Spec-내장색코드</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelColorMain.do'/>">Vehicle Spec-모델별컬러</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecCarlineMain.do'/>">Vehicle Spec-차종</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/ocn/selectOcnMain.do'/>">Vehicle Spec-OCN구성</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do'/>">차량마스터관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/dsc/judgeStepFix/selectJudgeStepFixMain.do'/>">일상업무등급관리(심사단계설정)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/dsc/authorityFix/selectAuthorityFixMain.do'/>">일상업무 권한 관리(권한설정)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/btc/secondDealer/selectSecondDealerMain.do'/>">2급딜러정보</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/ctl/ddlCtrl/selectDeadlineCtrlMngMain.do'/>">마감시간통계관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/mst/positionsDiscount/selectPositionsDiscountMain.do'/>">직책별 할인금액 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/mst/weeklySchedule/selectWeeklyScheduleMain.do'/>">주간계획</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>마케팅관리</td>
                    <td><a href="<c:url value='/sal/prm/promotion/selectPromotionMain.do'/>">프로모션관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/bsc/financialProductsManagement/selectFinancialProductsManagementMain.do'/>">금융상품관리(할부,리스)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/prm/salesAllowance/selectSalesAllowanceMain.do'/>">Sales Allowance</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>계약관리</td>
                    <td><a href="<c:url value='/sal/cnt/contract/selectContractMain.do'/>">계약품의관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/cnt/contractRe/selectContractReMain.do'/>">계약품의관리(ver.2)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>계약출고관리</td>
                    <td><a href="<c:url value='/sal/cnt/contractCondition/selectProgressStsMain.do'/>">계약품의현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderMain.do'/>">BTO 주문생성</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orm/btoSearchOrder/selectBtoSearchOrderMain.do'/>">BTO 주문조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/cnt/contractCondition/selectProgressMain.do'/>">계약품의진척</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/cnt/contractCondition/selectProgressKanbanMain.do'/>">계약품의진척(간반차트)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/ass/vehicleAssign/selectAssignMngMain.do'/>">배정관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/ctm/deliveryAsk/selectDeliveryAskMain.do'/>">출고요청관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/ctm/deliveryFix/selectDeliveryFixMain.do'/>">출고확정관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/dlv/vehicleDelivery/selectDeliveryMngMain.do'/>">고객인도관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>특수차량주문</td>
                    <td><a href="<c:url value='/sal/svo/askHelpCar/selectAskHelpCarMain.do'/>">구원차/대부차량 신청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svo/askHelpCar/selectAskHelpCarJudgeMain.do'/>">구원차/대부차량 심사</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svo/testDriveVehicle/selectReqTestDriveVehicleMain.do'/>">시승차량 신청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svo/testDriveVehicle/selectTestDriveVehicleInspctMain.do'/>">시승차량 심사</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrderMain.do'/>">미배정 주문조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleMain.do'/>">완성차 입고확정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orm/orderPriorityManagement/selectOrderPriorityManagementMain.do'/>">오더 취소신청 관리</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td>법인</td>
                    <td><a href="<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrMain.do'/>">종합오더현황-딜러</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntCorpMain.do'/>">종합오더현황-법인</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orc/dlrOrderSearch/selectDlrOrderSearchMain.do'/>">딜러주문조회</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svo/packageWork/selectPackageSalesWorkMain.do'/>">집단판매 업무신청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svo/packageWork/selectPackageSalesWorkJudgeMain.do'/>">집단판매 업무심사</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/fas/coercionApproval/selectCoercionApprovalMain.do'/>">강제판매승인</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orm/orderGradeCondition/selectOrderGradeConditionMain.do'/>">오더등급조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesApplicationMain.do'/>">법인 - 집단 판매신청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/svi/groupSalesReview/selectGroupSalesReviewMain.do'/>">법인 - 집단 판매심사</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringMain.do'/>">법인 - TP차량조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/lom/evalInfoDownload/selectEvalInfoDownloadMain.do'/>">평가정보 다운로드</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/lom/evalSearchEdit/selectEvalSearchEditMain.do'/>">평가조회 및 수정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>재고관리</td>
                    <td><a href="<c:url value='/sal/inv/stockState/selectStockStateMain.do'/>">재고상태관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/inv/stockView/selectStockViewMain.do'/>">재고조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/inv/stockCondition/selectStockConditionMain.do'/>">재고현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/lom/tpVehicleMonitoringDlr/selectTpVehicleMonitoringDlrMain.do'/>">딜러 - TP차량조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceMain.do'/>">재고실사</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/cmp/cmpCarRunMng/selectCmpCarRunMngMain.do'/>">회사차운행관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>기타업무</td>
                    <td><a href="<c:url value='/sal/aap/aapMng/selectAapMngMain.do'/>">대행업무관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orm/maintainOrderInquiry/selectMaintainOrderInquiryMain.do'/>">오더유지 및 조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/orm/maintainOrderQueryResults/selectMaintainOrderQueryResultsMain.do'/>">오더유지 결과조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/obt/obtReq/selectVehicleObtainReqMain.do'/>">차량조달신청관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/exc/dlrExc/selectVehicleDlrExcMain.do'/>">딜러간차량교환관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/sal/inc/incJoinInfo/selectIncJoinInfoMain.do'/>">보험가입정보관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>팝업</td>
                    <td><a href="javascript:contractProgStsPopup()">계약조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:vehicleMasterStsPopup()">차량마스터관리 팝업</a></td>
                </tr>
                <!-- 판매영역 종료 -->

                <!-- CRM 영역 시작 -->
                <!-- 기준정보 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>CRM</td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td>고객</td>
                    <td><a href="<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do'/>" target="_blank">고객등록(개인)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cif/customerInfo/selectCustomerInfoCompanyRegMain.do'/>" target="_blank">고객등록(법인)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do'/>" target="_blank">고객관리(개인)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cif/customerGroup/selectCustomerGroupMain.do'/>" target="_blank">그룹관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cif/customerGroup/selectCustomerTagMain.do'/>" target="_blank">태그관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/ass/assign/selectCustomerInfoAssignMain.do'/>" target="_blank">고객배정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:customerSearchPopup()">고객조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:groupSearchPopup()">그룹조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:tagSearchPopup()">태그조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>리드관리</td>
                    <td><a href="<c:url value='/crm/slm/leadInfo/selectLeadInfoMain.do'/>">일반리드등록</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/slm/leadInfo/selectLeadIDCCInfoMain.do'/>">IDCC리드관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/ass/assign/selectLeadAssignMain.do'/>">IDCC리드배분</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>고객흐름관리</td>
                    <td><a href="<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMain.do'/>">내방예약</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:visitCustomerPopup()">내방예약팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMgmtMain.do'/>">내방예약관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cfw/visitCustomerMgmt/selectVisitCustomerMgmtMainOld.do'/>">내방예약관리(old)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>판매기회관리</td>
                    <td><a href="<c:url value='/crm/cso/testDrive/selectTestDriveResvMain.do'/>">시승예약</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:tdrvResvPopup()">시승예약팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/testDrive/selectTestDriveMgmtMain.do'/>">시승예약관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:salesActiveCalPopup()">영업활동캘린더팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarMain.do'/>">영업활동캘린더</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarDayMain.do'/>?viewTp=day">영업활동목록(일별)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMain.do'/>">판매기회관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMainOld.do'/>">판매기회관리(Old)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMain.do'/>">판매기회조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:salesOpptStatPopup()">판매기회상태알림팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:salesOpptFailPopup()">판매기회 실패등록팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/cso/salesOpptFailMgmt/selectSalesOpptFailMgmtMain.do'/>">판매기회 실패관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>만족도 조사</td>
                    <td><a href="<c:url value='/crm/css/surveySatisFaction/selectSurveySatisFactionMain.do'/>">설문 템플릿 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/css/satisFactionManage/selectSatisFactionManageMain.do'/>">만족도 조사 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/css/satisFactionMobile/selectSatisFactionMobileMain.do'/>">만족도 조사(Mobile)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>멤버십 </td>
                    <td><a href="<c:url value='/crm/dmm/membership/selectMembershipMain.do'/>">멤버십 등록(고객)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/dmm/membership/selectSpecialPointPopup.do'/>">특별포인트 신청 팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/dmm/membership/selectMembershipManageMain.do'/>">멤버십 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/dmm/membershipTrans/selectMembershipTransMain.do'/>">멤버십 양도신청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/dmm/membershipTransMng/selectMembershipTransMngMain.do'/>">멤버십 양도관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>멤버십 카드관리</td>
                    <td><a href="<c:url value='/crm/dmm/membershipCard/selectMembershipCardMain.do'/>">멤버십 카드관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>멤버십 등급</td>
                    <td><a href="<c:url value='/crm/dmm/membershipGradeMng/selectMembershipGradeMngMain.do'/>">멤버십 등급조건</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/dmm/membershipGradeChg/selectMembershipGradeChgMain.do'/>">멤버십 등급변경</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>캠페인 관리</td>
                    <td><a href="<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do'/>">캠페인 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/crm/crq/vocMgmt/selectVocMgmtMain.do'/>">VOC 관리</a></td>
                </tr>

                <!-- CRM 영역 종료 -->

                <!-- 정비영역 시작 -->
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>정비</td>
                    <td>기준정보</td>
                    <td><a href="<c:url value='/ser/svi/ccCode/selectCcdCodeManageMain.do'/>">원인코드(CCD 코드) 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/ncCode/selectNcdCodeManageMain.do'/>">현상코드(NCD 코드) 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/insurance/selectInsuranceManageMain.do'/>">보험관리 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/bayManage/selectBayManageMain.do'/>">Bay관리 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/bayManage/selectBayCalendarMain.do'/>">Bay 캘린더 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/workGroupManage/selectWorkGroupManageMain.do'/>">소조관리 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/rateMaster/selectRateMasterMain.do'/>">임률코드 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/rateMaster/selectRateMasterListMain.do'/>">임률검색</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasterMain.do'/>">테크멘 기능관리 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/pDIChkAtc/selectPDIChkAtcMain.do'/>">PDI점검마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/campaign/selectCampaignInfoManageMain.do'/>">캠페인 기본정보 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/campaign/selectCampaignVinManageMain.do'/>">캠페인 빈정보 마스터</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/dcMaster/selectDcMasterMain.do'/>">할인관리</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/packageManage/selectPackageMain.do'/>">적업Package구성</a></td>
                </tr>

                 <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/subBpMaster/selectSubBpMasterMain.do'/>">외주거래처관리</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td>예약</td>
                    <td><a href="<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do'/>">예약접수</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>RO</td>
                    <td><a href="<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do'/>">RO발행</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/ro/preCheck/selectPreCheckMain.do'/>">사전점검</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/ro/workAssign/selectWorkAssignMain.do'/>">작업배정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/ro/workProcess/selectWorkProcessMain.do'/>">작업진도관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/ro/workProcess/selectWorkProcessListMain.do'/>">작업진도조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/laborManage/selectLaborCodeManageMain.do'/>">공임관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Claim</td>
                    <td><a href="<c:url value='/ser/wac/pwaReq/selectPwaRequestMain.do'/>">PWA 요청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/pwaAppr/selectPwaApproveMain.do'/>">PWA 승인</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimReq/selectClaimRequestMain.do'/>">클레임 요청</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td>정산</td>
                    <td><a href="<c:url value='/ser/cal/calculate/selectCalculateMain.do'/>">정산</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>수납</td>
                    <td><a href="<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveMain.do'/>">수납</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>삼포</td>
                    <td><a href="<c:url value='/ser/wac/sanbaoBase/selectSanbaoBaseMain.do'/>">삼포 정책관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/sanbaoLaborManage/selectSanbaoLaborManageMain.do'/>">삼포 공임 등록</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/sanbaoReq/selectSanbaoRequestMain.do'/>">삼포 요청</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/sanbaoAppr/selectSanbaoApproveMain.do'/>">삼포 승인</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/sanbaoTechReq/selectSanbaoTechRequestMain.do'/>">삼포 기술 제출</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveMain.do'/>">삼포 기술 제출 처리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/sanbaoLaborProblem/selectSanbaoLaborProblemMain.do'/>">차량별 동일하자 현황</a></td>
                </tr>
                 <tr>
                    <td></td>
                    <td>보험</td>
                    <td><a href="<c:url value='/ser/ins/insurance/selectInsuranceManageMain.do'/>">보험 통합관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>보증</td>
                    <td><a href="<c:url value='/ser/wac/warranty/selectWarrantyStatusMain.do'/>">보증 현황</a></td>
                </tr>
                <!-- 정비영역 종료 -->
                 <!-- 서비스팝업 -->
                <tr>
                    <td></td>
                    <td>팝업</td>
                    <td><a href="javascript:teckManFnSearchPopup()">테크멘조회팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:ncCdCodeSearchPopup()">현상코드팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:selectlaborCodeSearchPopupWindow()">공임조회팝업</a></td>
                </tr>
                <!-- 정비영역 종료 -->


            </tbody>
        </table>
        <!-- <a href="#go_top" style="position:fixed; right:30px; bottom:20px; padding:8px 9px 6px; border:3px solid #941a2e; background:#f4f4f4; color:#333; font-weight:bold;">Top</a> -->
    </div>

    <div id="s1">
    <input type="text" id="multiselect1" name="multiselect1" data-json-obj="true" />
    <input type="text" id="multiselect2" name="multiselect2" data-json-obj="true" />
    <input type="checkbox" id="multiselect3" name="multiselect3" data-json-obj="true" checked="true" value="1" />
    <input type="checkbox" id="multiselect4" name="multiselect3" data-json-obj="true" checked="true" value="2" />
    </div>

    <input type="text" id="maskedTextBox" />

    <script type="text/javascript">

    var s1 = $("#s1").serializeObjectBySelector();
    console.log(s1);

    var countrySearchPopupWin;
    function countrySearchPopup() {
        countrySearchPopupWin = dms.window.popup({
            windowId:"countrySearchPopupWin"
            ,title:"<spring:message code='cmm.title.country.search'/>"   // 국가 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectCountryPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"cntryNm":""
                    ,"callbackFunc":function(data){
                        dms.notification.info(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var userSearchPopupWin;
    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        dms.notification.info(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var dealerSearchPopupWin;
    function dealerSearchPopup() {
        dealerSearchPopupWin = dms.window.popup({
            windowId:"dealerSearchPopupWin"
            ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"dlrCd":"A07AA"           //dlrCd, dlrNm, dlrGrpCd
                    ,"closeAfterSelect":true
                    ,"callbackFunc":function(data){
                        dms.notification.info(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var zipCodeSearchPopupWin;
    function zipCodeSearchPopup() {
        zipCodeSearchPopupWin = dms.window.popup({
            windowId:"zipCodeSearchPopupWin"
            ,title:"<spring:message code='cmm.title.zipcode.search'/>"   // 우편번호 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        dms.notification.info(JSON.stringify(data));
                    }
                }
            }

        });
    }


    var tdrvResvPopup;
    function tdrvResvPopup() {
        tdrvResvPopup = dms.window.popup({
            windowId:"tdrvResvPopup"
            ,title:"<spring:message code='crm.title.tdrvResv' />" //시승예약
            ,content:{
                url:"<c:url value='/crm/cso/testDrive/selectTestDriveResvPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"cntryNm":""
                    ,"callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var visitCustomerPopup;
    function visitCustomerPopup() {
        visitCustomerPopup = dms.window.popup({
            windowId:"visitCustomerPopup"
            ,title:"<spring:message code='crm.title.visitCustomer' />" //내방예약
            ,content:{
                url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"cntryNm":""
                    ,"callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var salesOpptStatPopup;
    function salesOpptStatPopup() {
        salesOpptStatPopup = dms.window.popup({
            windowId:"salesOpptStatPopup"
            , title:"<spring:message code='global.title.saleOpptStatNoti' />"  // 판매기회 상태알림
            , width:355
            , height:200
            , content:{
                url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptStatPopup.do'/>"
                ,data:{
                    "autoBind":false
                    , "saleOpptSeq"  :"1"
                    , "custNm"       :"홍길동"
                    , "regPrid"      :"1"
                    , "callbackFunc":function(data){

                        console.log("data:",data)
                        if(data == "SUCCESS"){
                            // 판매기회 상태변경 / 이 완료 되었습니다.
                            dms.notification.success("<spring:message code='global.lbl.saleOpptStepUpdt' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                            initForm();
                        }else if(data == "CLOSE"){

                            console.log("판매기회 상태 팝업 종후 실패 팝업 오픈");
                            failPopup(saleOpptSeq);

                        }

                    }
                }
            }
        });



    }

    var salesOpptFailPopup;
    function salesOpptFailPopup() {
        salesOpptFailPopup = dms.window.popup({
            windowId:"salesOpptFailPopup"
            , title:"<spring:message code='global.title.saleOpptFailReg' />"  // 판매기회 실패등록
            //, width:355
            //, height:150
            , content:{
                url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptFailPopup.do'/>"
                ,data:{
                    "autoBind":false
                    , "saleOpptSeq"  :"1"
                    , "callbackFunc":function(data){
                        console.log("data:",data)
                        if(data == "SUCCESS"){
                            // 판매기회 상태변경 / 이 완료 되었습니다.
                            dms.notification.success("<spring:message code='global.lbl.saleOpptStepUpdt' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                            console.log("1111")
                            initForm();

                        }

                    }
                }
            }
        });
    }

    var salesActiveCalPopup;
    function salesActiveCalPopup() {
        salesActiveCalPopup = dms.window.popup({
            windowId:"salesActiveCalPopup"
            ,title:"영업활동" //영업활동
            ,content:{
                url:"<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"cntryNm":""
                    ,"callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var customerSearchPopup;
    function customerSearchPopup() {
        tdrvResvPopup = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    ,"callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var groupSearchPopup;
    function groupSearchPopup() {
        tdrvResvPopup = dms.window.popup({
            windowId:"groupSearchPopup"
                , title:"<spring:message code = 'global.title.custGrpSearch' />"   // 고객그룹 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerGroup/selectGroupPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "grpTp" :"001"
                        , "callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var tagSearchPopup;
    function tagSearchPopup() {
        tdrvResvPopup = dms.window.popup({
            windowId:"groupSearchPopup"
                , title:"<spring:message code = 'global.lbl.tag' />"   // 태그 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerGroup/selectTagPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "grpTp" :"002"
                        , "callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var tecSearchPopup;
    function teckManFnSearchPopup() {
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
                , title:"테크멘 조회"   // 테크멘 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var phenCauCodeWin;
    function ncCdCodeSearchPopup() {
        phenCauCodeWin = dms.window.popup({
            windowId:"teckManFnSearchWin"
                , title:"현상코드 조회"   // 현상코드 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var laborSearchPopup;
    function selectlaborCodeSearchPopupWindow(){

        laborSearchPopup = dms.window.popup({
            windowId:"laborCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.lbrCdSearch'/>"    //
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                , data:{
                  //  "type":"custom1"
                     "autoBind":false
                    ,"sLtsModelCd":"HF**A"
                    ,"sDlrCd":"A07AA"
                    , "callbackFunc":function(data){
                      /*   $("#cauCd").val(data[0].causeCd);
                        $("#cauNm").val(data[0].causeNm);
                        $("#statCd").val(data[0].natrueCd);
                        $("#statNm").val(data[0].natrueNm); */
                    }
                }
            }
        });
    }

    var venderSearchPopupWin;
    function venderSearchPopup() {
        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":""
                        ,"bpNm":""
                        ,"bpTp":""
                        ,"callbackFunc":function(data){
                            console.log(JSON.stringify(data));
                        }
                    }
                }
        });
    }

    var supplierSearchPopupWin;
    function supplierSearchPopup() {
        supplierSearchPopupWin = dms.window.popup({
            windowId:"supplierSearchPopupWin"
                ,title:"<spring:message code='global.title.supplyInfo' />"   // 공급업체 정보
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":""
                        ,"bpNm":""
                        ,"bpTp":""
                        ,"callbackFunc":function(data){
                            console.log(JSON.stringify(data));
                        }
                    }
                }
        });
    }

    var popupWindow;
    function contractProgStsPopup() {
        popupWindow = dms.window.popup({
            windowId:"contractProgStsPopupWin"    // 판매 - 계약조회
                ,title:"<spring:message code='sal.title.contractProg' />"
                ,height:600
                ,content:{
                    url:"<c:url value='/sal/cmm/selectProgressStsPopup.do'/>"
                    ,data:{
                         "type"  :null
                        ,"autoBind":false
                        ,"callbackFunc":function(data){
                            console.log(JSON.stringify(data));
                        }
                    }
                }
        });
    }
    function vehicleMasterStsPopup() {
        popupWindow = dms.window.popup({
            windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
                ,title:"<spring:message code='global.title.vehicleMaster' />"
                ,height:600
                ,content:{
                    url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
                    ,data:{
                         "type"  :null
                        ,"autoBind":false
                        ,"callbackFunc":function(data){
                            console.log(JSON.stringify(data));
                        }
                    }
                }
        });
    }


   $("#maskedTextBox").kendoMaskedTextBox({
       mask:"LL"
    });

    $("#maskedTextBox").bind("keyup", function(){
        var that = $(this).data("kendoMaskedTextBox");
        that.value(that.raw().toUpperCase());
    })

    </script>

</body>
</html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocaleLanguageLanguage" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
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
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.cuspringLocaleLanguagengLocaleLanguage}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>

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
                <!-- 정비영역 시작 -->
                <tr>
                    <td>정비</td>
                    <td>기준정보</td>
                    <td><a href="<c:url value='/ser/svi/ccCode/selectCcdCodeManageMain.do'/>">원인코드 관리 (P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/ncCode/selectNcdCodeManageMain.do'/>">현상코드 관리(P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/insurance/selectInsuranceManageMain.do'/>">보험관리 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/bayManage/selectBayManageMain.do'/>">Bay관리 관리 (P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/bayManage/selectBayCalendarMain.do'/>">Bay 캘린더 관리 (P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/workGroupManage/selectWorkGroupManageMain.do'/>">소조관리 관리 (P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/rateMaster/selectRateMasterMain.do'/>">임률코드 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/rateMaster/selectRateMasterListMain.do'/>">임률검색</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasterMain.do'/>">테크멘 기능관리 관리(P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/pDIChkAtc/selectPDIChkAtcMain.do'/>">PDI점검관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/campaign/selectCampaignInfoManageMain.do'/>">캠페인 기본정보 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/campaign/selectCampaignVinManageMain.do'/>">캠페인 빈정보 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/dcMaster/selectDcMasterMain.do'/>">할인관리</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/packageManage/selectPackageMain.do'/>"> LTS/Package구성 (P)</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/subBpMaster/selectSubBpMasterMain.do'/>">외주거래처관리</a></td>
                </tr>

                <tr>
                    <td></td>
                    <td>예약</td>
                    <td><a href="<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do'/>">예약접수 (P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>RO</td>
                    <td><a href="<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do'/>">RO발행 (P)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/ro/preCheck/selectPreCheckMain.do'/>">사전점검 (P)</a></td>
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
                    <td><a href="<c:url value='/ser/res/rescue/selectRescueMain.do'/>">구원서비스</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/svi/laborManage/selectLaborCodeManageMain.do'/>"> LTS 차종 관리 (P)</a></td>
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
                    <td>고품</td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemMain.do'/>">고품요청조회(DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemApproveMain.do'/>">고품요청관리(DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemRecoveryMain.do'/>">고품회수관리(DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemDeduteMain.do'/>">고품공제관리(DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemOutMain.do'/>">고품출고관리(DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectDlrClaimOldItemManageMain.do'/>">고품출고관리(DMS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/ser/wac/claimOldItemManage/selectDlrClaimOldItemMain.do'/>">고품요청조회(DMS)</a></td>
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
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:selectVehOfCustInfoSearchPopupWindow()">고객차량팝업</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>배치 테스트</td>
                    <td><a href="javascript:sendRoHis()">정비이력전송</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:sendLabor()">공임전송</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:sendPwa()">PWA전송</a></td>
                </tr>

            </tbody>
        </table>
        <!-- <a href="#go_top" style="position:fixed; right:30px; bottom:20px; padding:8px 9px 6px; border:3px solid #941a2e; background:#f4f4f4; color:#333; font-weight:bold;">Top</a> -->
    </div>
    <script type="text/javascript">
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

        var ncCdSearchPopup;
        function ncCdCodeSearchPopup() {
            ncCdSearchPopup = dms.window.popup({
                windowId:"teckManFnSearchWin"
                 , title:"현상코드 조회"   // 테크멘 조회
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
                    // ,"sDlrCd":"A07AA"
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

         var vehOfCustInfoSearchPopup;
        function selectVehOfCustInfoSearchPopupWindow(){

         vehOfCustInfoSearchPopup = dms.window.popup({
             windowId:"vehOfCustInfoSearchPopup"
             , title:"고객차량정보"    //
             , content:{
                 url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                 , data:{
                   //  "type":"custom1"
                      "autoBind":false
                     , "callbackFunc":function(data){
                       console.log(JSON.stringify(data));
                     }
                 }
             }
         });
        }

        function sendLabor(){
            $.ajax({
                    url:"<c:url value='/bat/ser/svi/sendLaborTest.do' />",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });

        }
        function sendRoHis(){
            $.ajax({
                    url:"<c:url value='/bat/ser/ro/sendRoinfoTest.do' />",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });

        }
        var pwajson = {"dlrCd":"A07AA","pwaDocNo":"PW201603-0003"};
        function sendPwa(){
            $.ajax({
                    url:"<c:url value='/ser/wac/pwaReq/insertPwaRequestToIf.do' />",
                    data:JSON.stringify(pwajson),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });

        }
    </script>
</body>
</html>
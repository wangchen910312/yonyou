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

                <!-- 공통영역 -->
                <tr>
                    <td>모바일</td>
                    <td>공통</td>
                    <td><a href="<c:url value='/mob/cmm/login/selectLoginMain.do'/>">로그인</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/main/selectMain.do'/>">메인화면</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/scan/selectSacnMain.do'/>">바코드 스켄</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/camera/selectCameraMain.do'/>">카메라 촬영</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/calendar/selectCalendarMain.do'/>">달력</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/todo/selectTodoMain.do'/>">업무현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/alarm/selectAlarmMain.do'/>">알람</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/cmm/configure/selectConfigureMain.do'/>">설정</a></td>
                </tr>

                <!-- 판매영역 -->
                <tr>
                    <td>판매</td>
                    <td>주문현황</td>
                    <td><a href="<c:url value='/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrMain.do'/>">종합오더현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/sal/orc/crpStock/selectCrpStockMain.do'/>">법인재고현황</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>물류정보관리</td>
                    <td><a href="<c:url value='/mob/sal/lom/dlCarMonitor/selectDlCarMonitorMain.do'/>">배송차량모니터링</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/sal/lom/dlCarMonitor/selectTPCarMonitorMain.do'/>">TP차량모니터링</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>완성차 입고</td>
                    <td><a href="<c:url value='/mob/sal/btc/vehicleSettlementOrder/selectVehicleSettlementOrderMain.do'/>">완성차입고확정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>재고관리</td>
                    <td><a href="<c:url value='/mob/sal/lom/dstbJudge/selectDstbJudeMain.do'/>">물류평가조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/sal/lom/stockStat/selectStockStatMain.do'/>">재고상태관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/sal/lom/cmpCarOper/selectCmpCarOperMain.do'/>">회사차운행관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/sal/inv/stockActual/selectStockActualMain.do'/>">재고실사</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>계약출고관리</td>
                    <td><a href="<c:url value='/mob/sal/cnt/contractCondition/selectProgressStsMain.do'/>">계약품의관리(계약취소)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/sal/cnt/aapWork/selectAapworkMain.do'/>">대행업무관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>중고차관리</td>
                    <td><a href="<c:url value='/mob/sal/uva/tradeIn/selectTradeInMain.do'/>">Trade In 관리(교환이력관리)</a></td>
                </tr>

                <!-- 정비영역 -->
                <tr>
                    <td>정비</td>
                    <td>维修管理</td>
                    <td><a href="<c:url value='/mob/cmm/main/selectMain.do'/>">维修管理</a></td>
                </tr>

                <!-- 부품영역 -->
                <tr>
                    <td>부품</td>
                    <td>마스터관리</td>
                    <td><a href="<c:url value='/mob/par/pmm/itemMaster/selectItemMasterMain.do'/>">품목마스터조회</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>입고관리</td>
                    <td><a href="<c:url value='/mob/par/pcm/receive/selectReceiveCnfmMain.do'/>">모바일입고저장</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>재고관리</td>
                    <td><a href="<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvMain.do'/>">재고실사등록</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>출고관리</td>
                    <td><a href="<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusMain.do'/>">출고확정</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>오더관리</td>
                    <td><a href="<c:url value='/mob/par/pcm/purcOrd/selectPurcOrdMain.do'/>">오더현황조회</a></td>
                </tr>

                <!-- CRM 영역 -->
                <tr>
                    <td>CRM</td>
                    <td>고객정보관리</td>
                    <td><a href="<c:url value='/mob/crm/cif/customerInfo/selectCustomerInfoMain.do'/>">고객정보관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>VOC 관리</td>
                    <td><a href="<c:url value='/mob/crm/voc/voc/selectBhmcVocMain.do'/>">VOC 관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>만족도조사</td>
                    <td><a href="<c:url value='/mob/crm/css/satisFactionManage/selectSatisFactionMobileMain.do'/>">만족도조사(오프라인)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>캠페인관리</td>
                    <td><a href="<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do'/>">캠페인관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>리드관리</td>
                    <td><a href="<c:url value='/mob/crm/slm/leadInfo/selectLeadInfoMain.do'/>">리드관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/crm/slm/leadInfo/selectLeadAllocaMain.do'/>">IDCC 리드배분</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>판매기회관리</td>
                    <td><a href="<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMain.do'/>">판매기회관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>시승관리</td>
                    <td><a href="<c:url value='/mob/crm/cso/testDriveMgmt/selectTestDriveMgmtMain.do'/>">시승관리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="<c:url value='/mob/crm/cso/testDriveCal/selectTestDriveCalMain.do'/>">시승캘린더</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>영업활동관리</td>
                    <td><a href="<c:url value='/mob/crm/cso/salesActiveCal/selectSalesActiveCalMain.do'/>">영업활동시행내역조회</a></td>
                </tr>

            </tbody>
        </table>
        <!-- <a href="#go_top" style="position:fixed; right:30px; bottom:20px; padding:8px 9px 6px; border:3px solid #941a2e; background:#f4f4f4; color:#333; font-weight:bold;">Top</a> -->
    </div>

    <input type="text" id="multiselect" />


    <script type="text/javascript">

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

    var tdrvResvPopup;
    function tdrvResvPopup() {
        tdrvResvPopup = dms.window.popup({
            windowId:"tdrvResvPopup"
            ,title:"<spring:message code='crm.title.tdrvResv' />" //시승예약
            ,content:{
                url:"<c:url value='/mob/crm/cso/testDriveResv/selectTestDriveResvPopup.do'/>"
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
                url:"<c:url value='/mob/crm/cfw/visitCustomer/selectVisitCustomerPopup.do'/>"
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

    var salesActiveCalPopup;
    function salesActiveCalPopup() {
        salesActiveCalPopup = dms.window.popup({
            windowId:"salesActiveCalPopup"
            ,title:"영업활동" //영업활동
            ,content:{
                url:"<c:url value='/mob/crm/sac/salesActiveCal/selectSalesActiveCalPopup.do'/>"
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
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
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
                    url:"<c:url value='/mob/crm/cif/customerGroup/selectGroupPopup.do'/>"
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
                    url:"<c:url value='/mob/crm/cif/customerGroup/selectTagPopup.do'/>"
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
                    url:"<c:url value='/mob/ser/cmm/popup/selectTechManFnPopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "callbackFunc":function(data){
                        console.log(JSON.stringify(data));
                    }
                }
            }

        });
    }

    var ncCcCodeWin;
    function ncCdCodeSearchPopup() {
        ncCcCodeWin = dms.window.popup({
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

    var venderSearchPopupWin;
    function venderSearchPopup() {
        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/mob/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
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
                    url:"<c:url value='/mob/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
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
                    url:"<c:url value='/mob/sal/cmm/selectProgressStsPopup.do'/>"
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

    </script>

</body>
</html>
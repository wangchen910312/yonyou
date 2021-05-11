<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.cuspringLocaleLanguagengLocaleLanguage.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->

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
        <h1>CRM 개발화면 리스트</h1>
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
                <tr>
                    <td></td>
                    <td>IP</td>
                    <td>
                      <a href="#"><%=request.getRemoteAddr()%></a><br>
                    </td>
                </tr>
                <!-- 인터페이스 테스트 시작 -->
                <tr>
                    <td>DMS->Ori</td>
                    <td>고객정보</td>
                    <td><a href="javascript:selectCustomerInfoDmsOriginal()">고객정보 수신(DMS Temp-->Original)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>판매기회</td>
                    <td><a href="javascript:selectSalesOpptDmsOriDup()">판매기회 수신(DMS Temp-->Original)- CR_0211IR -> CR_0218T</a></td>
                </tr>
                <tr>
                    <td>DMS->DCS</td>
                    <td>고객정보(CRM101)</td>
                    <td><a href="javascript:customerInfoDmsDcsInterfaceBatchJobBean()">고객정보 송신 (DMS Temp-->DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>(CRM102)</td>
                    <td><a href="javascript:selectCustomerInfoAddrDmsDcs()">고객정보 주소 송신 (DMS Temp-->DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>(CRM103)</td>
                    <td><a href="javascript:selectCustomerInfoRelCustDmsDcs()">고객정보 연계인 송신 (DMS Temp-->DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>판매기회(CRM118)</td>
                    <td><a href="javascript:selectSalesOpptDmsDcs()">판매기회 송신 (DMS Temp-->DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>전시장유동량(CRM119)</td>
                    <td><a href="javascript:selectShowRoomDmsDcs()">전시장유동량  송신(DMS Temp-->DCS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>고객 요청 송신(CRM108)</td>
                    <td><a href="javascript:sendVocDmsDcs()">고객요청  송신(DCS --> DMS)</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>고객 요청 활동 송신(CRM109)</td>
                    <td><a href="javascript:sendVocActiveDmsDcs()">고객요청활동 송신(DMS -->DCS)</a></td>
                </tr>
                <tr>
                    <td>DCS->DMS</td>
                    <td>캠페인(CRM408, CRM411, CRM412, CRM413, CRM414, CRM415, CRM416)</td>
                    <td><a href="javascript:receiveCampaignDcs()">캠페인 수신(DCS -> DMS)</a></td>
                </tr>
                <tr>
                    <td>판매기회</td>
                    <td>자동전출</td>
                    <td><a href="javascript:selectSalesOpptProcessSubmitCtrl()">자동전출처리</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>다음추적의 TODO 추가</td>
                    <td><a href="javascript:insertSalesOpptProcessNextTraceAlm()">다음추적의 TODO 추가</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>판매기회 추적추진 전달 통계를 위한 정보 수집 (전달 '추적추진' 신규, 전패 카운터 수집)</td>
                    <td><a href="javascript:selectSalesOpptTrackingCollectMonth()">이전 달 추적추진 신규, 전패 카운터 수집</a></td>
                </tr>
                <tr>
                    <td>BM</td>
                    <td></td>
                    <td>
                                            딜러번호:<input type="text" id="dlrCd" value="D0103"/><br>
                                            고객번호:<input type="text" id="custNo" value="CD041120170500012"/><br>
                      VIN:<input type="text" id="vin" value="LBEADAFC8HX155752"/><br>
                                            소비유형:<input type="text" id="consumeType"/> 0:사고차 수리(보통), 1:첫 정비, 2:차량 구매, 3:정기 정비, 8:판금 <br>
                                            소비 포이트:<input type="text" id="consumePoints"/><br>
                                            총 지불비용:<input type="text" id="paymentCost"/> 총 지불비용 ( 할인 후 )<br>
                      totalCost:<input type="text" id="totalCost"/><br>
                                            차형:<input type="text" id="carCategory"/><br>
                                            주행거리:<input type="text" id="mileAge"/><br>
                      RO문서번호:<input type="text" id="roDocNo"/><br>
                                            계약번호:<input type="text" id="contractNo"/><br>
                                            시작일:<input type="text" id="beginDate"/><br>
                                            종료일:<input type="text" id="endDate"/><br>
                                            증거번호:<input type="text" id="identityNumber"/><br>
                                            핸드폰:<input type="text" id="hpNo"/><br>
                                            쿠폰 타입:<input type="text" id="cardType"/><br>
                                            쿠폰 번호:<input type="text" id="cardNo"/><br>
                                            발생포인트 비용:<input type="text" id="consumePointsCost"/> 정비에서 전송 시 계산하여 넣어줌. 테스트 시 '소비 포이트' 의 1/10 넣어서 테스트 진행하면 됨.<br>
                                            <br>
                      쿠폰+포인트 테스트 : CD010320170200011<br>
                      vin : LBEHDAFB6AY355776<br>
                                            쿠폰 : <br>
                            210468537365 X<br>
                            400026251629 X<br>
                            140976159242 X<br>
                            192992272221<br>
                            175549651113
                    </td>
                </tr>
                <tr>
                    <td>BM</td>
                    <td></td>
                    <td id="BMResult">

                    </td>
                </tr>
                <tr>
                    <td>BM</td>
                    <td></td>
                    <td>
                      <a href="javascript:selectMemberUserintegralInfo()">포인트 조회 (CRM503) </a><br>
                      <a href="javascript:insertAddMembersConsume()">포인트 사용 (CRM504)</a><br>
                      <a href="javascript:selectPaymentAccessPoints()">인증대기 목록 조회 (CRM510)</a><br>
                      <a href="javascript:selectCustomCardCodeInfoByDMSInfo()">쿠폰 사용 조회 (CRM5)</a><br>
                      <a href="javascript:selectUseCardAndAddConsume()">쿠폰+포인트 사용 (CRM512)</a><br>
                    </td>
                </tr>
                <tr>
                    <td>CRM Modify Data I/F</td>
                    <td></td>
                    <td>
                      day : <input type="text" id="day"/><br>
                      table : <input type="text" id="table"/><br>
                      <a href="javascript:sendCrmData()">CRM 변경데이터 송신(file)</a><br>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td id="CRM120Result">
                    </td>
                </tr>
                <tr>
                    <td>VOC 알람</td>
                    <td></td>
                    <td>
                      <a href="javascript:selectVocPushSignAlarms()">VOC 알람 배치</a><br>
                    </td>
                </tr>
                <tr>
                    <td>캠페인</td>
                    <td></td>
                    <td>
                      <a href="javascript:selectMakTargetExtract()">캠페인 대상자 추출 배치</a><br>
                    </td>
                </tr>
                <tr>
                    <td>만족도 조사</td>
                    <td></td>
                    <td>
                      <a href="javascript:selectSatisFaction()">만족도 대상자 추출 배치</a><br>
                    </td>
                </tr>
                <tr>
                    <td>고객케어</td>
                    <td></td>
                    <td>
                      <a href="javascript:customerCare()">고객케어 대상자 추출 배치</a><br>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- <a href="#go_top" style="position:fixed; right:30px; bottom:20px; padding:8px 9px 6px; border:3px solid #941a2e; background:#f4f4f4; color:#333; font-weight:bold;">Top</a> -->
    </div>
    <script type="text/javascript">
    function selectSalesOpptTrackingCollectMonth(){
        $.ajax({
                url:"<c:url value='/bat/crm/cso/selectSalesOpptTrackingCollectMonth.do' />",
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

    function insertSalesOpptProcessNextTraceAlm(){
        $.ajax({
                url:"<c:url value='/bat/crm/cso/insertSalesOpptProcessNextTraceAlm.do' />",
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

    function selectSalesOpptProcessSubmitCtrl(){
        $.ajax({
                url:"<c:url value='/bat/crm/cso/selectSalesOpptProcessSubmitCtrl.do' />",
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

    function receiveCampaignDcs(){
            $.ajax({
                    url:"<c:url value='http://10.125.211.116/bhmc-dcs-web/bat/crm/mcm/markingCampaignDcsIfBatchService.do' />",
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
        function selectShowRoomDmsDcs(){
            $.ajax({
                    url:"<c:url value='/bat/crm/dmm/selectShowRoomDmsDcs.do' />",
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
        function selectSalesOpptDmsDcs(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cso/selectSalesOpptDmsDcs.do' />",
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
        function selectCustomerInfoRelCustDmsDcs(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cif/selectCustomerInfoRelCustDmsDcs.do' />",
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
        function selectCustomerInfoAddrDmsDcs(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cif/selectCustomerInfoAddrDmsDcs.do' />",
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
        function customerInfoDmsDcsInterfaceBatchJobBean(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cif/customerInfoDmsDcsInterfaceBatchJobBean.do' />",
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
        function selectSalesOpptDmsOriDup(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cso/selectSalesOpptDmsOriDup.do' />",
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
        function selectCustomerInfoDmsOriginal(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cif/selectCustomerInfoDmsOriginal.do' />",
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

        function sendVocDmsDcs(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cif/sendVocDmsDcs.do' />",
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

        function sendVocActiveDmsDcs(){
            $.ajax({
                    url:"<c:url value='/bat/crm/cif/sendVocActiveDmsDcs.do' />",
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

        function selectMemberUserintegralInfo(){
            var paramData = {};
            paramData["custNo"] = $("#custNo").val();
            paramData["vin"] = $("#vin").val();
            alert("selectMemberUserintegralInfo");
            $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/selectMemberUserintegralInfo.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    $("#BMResult").html(jqXHR.responseJSON.errors);
                },
                success:function(result) {
                    console.log(result);
                     if(result.IsSuccess){
                         $("#BMResult").html("Address:"+result.Data.Address+"<br>"
                                 + "Amount:"+result.Data.Amount+"<br>"
                                 + "Birthday:"+result.Data.Birthday+"<br>"
                                 + "BlueMembership_Id:"+result.Data.BlueMembership_Id+"<br>"
                                 + "BlueMembership_No:"+result.Data.BlueMembership_No+"<br>"
                                 + "BlueMembership_YN:"+result.Data.BlueMembership_YN+"<br>"
                                 + "Email:"+result.Data.Email+"<br>"
                                 + "Gender:"+result.Data.Gender+"<br>"
                                 + "IdentityNumber:"+result.Data.IdentityNumber+"<br>"
                                 + "MaxConsumInte:"+result.Data.MaxConsumInte+"<br>"
                                 + "Mlevel:"+result.Data.Mlevel+"<br>"
                                 + "PhoneNumber:"+result.Data.PhoneNumber+"<br>"
                                 + "Point:"+result.Data.Point+"<br>"
                                 + "RealName:"+result.Data.RealName+"<br>"
                                 + "ReceivedCardCount:"+result.Data.ReceivedCardCount+"<br>"
                                 + "Scale:"+result.Data.Scale+"<br>"
                                 + "TotalPoint:"+result.Data.TotalPoint+"<br>"
                                 + "UserName:"+result.Data.UserName+"<br>"
                                 + "UserValue:"+result.Data.UserValue+"<br>"
                                 + "mLevelBeginDate:"+result.Data.mLevelBeginDate+"<br>"
                                 + "mLevelInvalidDate:"+result.Data.mLevelInvalidDate+"<br>"
                                 + "regDt:"+result.Data.regDt);
                     }else{
                         $("#BMResult").html(result.Message);
                     }
                }//end success
            })//end ajax
        }

        function insertAddMembersConsume(){
            var paramData = {};
            paramData["custNo"] = $("#custNo").val();
            paramData["vin"] = $("#vin").val();
            paramData["consumeType"] = $("#consumeType").val();
            paramData["consumePoints"] = $("#consumePoints").val();
            paramData["totalCost"] = $("#totalCost").val();
            paramData["roDocNo"] = $("#roDocNo").val();
            paramData["contractNo"] = $("#contractNo").val();

            $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/insertAddMembersConsume.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    $("#BMResult").html(jqXHR.responseJSON.errors);
                },
                success:function(result) {
                    console.log(result);
                     if(result.IsSuccess){
                         $("#BMResult").html("Point:"+result.Data.Point+"<br>"
                                 + "PointSeq:"+result.Data.PointSeq+"<br>");
                     }else{
                         $("#BMResult").html(result.Message);
                     }
                }//end success
            })//end ajax
        }

        function selectPaymentAccessPoints(){
            var paramData = {};
            paramData["beginDate"] = $("#beginDate").val();
            paramData["endDate"] = $("#endDate").val();

            $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/selectPaymentAccessPoints.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    $("#BMResult").html(jqXHR.responseJSON.errors);
                },
                success:function(result) {
                    console.log(result);
                     if(result.IsSuccess){
                         var strResult = "";
                         for(var i=0; i<result.Data.length; i++){
                             strResult = strResult
                                       + "DealerId:"+result.Data[i].DealerId+"<br>"
                                       + "Tel:"+result.Data[i].Tel+"<br>"
                                       + "IdentityNumber:"+result.Data[i].IdentityNumber+"<br>"
                                       + "Amount:"+result.Data[i].Amount+"<br>"
                                       + "Name:"+result.Data[i].Name+"<br>"
                                       + "Ispay:"+result.Data[i].Ispay+"<br>"
                                       + "PayNumber:"+result.Data[i].PayNumber+"<br>"
                                       + "createtime:"+result.Data[i].createtime+"<br>"
                                       + "Status:"+result.Data[i].Status+"<br><br>";
                         }
                         $("#BMResult").html(strResult);
                     }else{
                         $("#BMResult").html(result.Message);
                     }
                }//end success
            })//end ajax
        }

        function sendCrmData(){
            alert("sendCrmData");
            var paramData = {};
            paramData["day"] = $("#day").val();
            paramData["table"] = $("#table").val();

            $.ajax({
                url:"<c:url value='/bat/crm/cif/sendCrmData.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    $("#CRM120Result").html("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                },
                success:function(result) {
                    console.log(result);
                    $("#CRM120Result").html("Success");
                }
            });
        }

        function selectCustomCardCodeInfoByDMSInfo(){
            var paramData = {};
            paramData["custNo"] = $("#custNo").val();
            paramData["cardType"] = $("#cardType").val();//CardType
            paramData["cardNo"] = $("#cardNo").val();//CardNo
            paramData["vin"] = $("#vin").val();//Vin

            alert("selectCustomCardCodeInfoByDMSInfo");
            $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/selectCustomCardCodeInfoByDMSInfo.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    $("#BMResult").html("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                },
                success:function(result) {
                    console.log(result);
                    if(result.IsSuccess){
                        var strResult = "Msg:"+result.Data.Msg+"<br>"
                                      + "IfResult:"+result.Data.IfResult+"<br>"
                                      + "ReduceCost:"+result.Data.ReduceCost+"<br>"
                                      + "CardCategory:"+result.Data.CardCategory+"<br>"
                                      + "Tel:"+result.Data.Tel+"<br>"
                                      + "CardBeginDate:"+result.Data.CardBeginDate+"<br>"
                                      + "CardEndDate:"+result.Data.CardEndDate+"<br>"
                                      + "CardRemark:"+result.Data.CardRemark+"<br>";
                        $("#BMResult").html(strResult);
                    }else{
                        $("#BMResult").html(result.Message);
                    }
                }
            });
        }

        function selectUseCardAndAddConsume(){
            var paramData = {};
            paramData["custNo"] = $("#custNo").val();
            paramData["cardType"] = $("#cardType").val();//CardType
            paramData["cardNo"] = $("#cardNo").val();//CardNo
            paramData["vin"] = $("#vin").val();//Vin
            paramData["dlrCd"] = $("#dlrCd").val();
            paramData["consumeType"] = $("#consumeType").val();
            paramData["consumePoints"] = $("#consumePoints").val();
            paramData["paymentCost"] = $("#paymentCost").val();
            paramData["totalCost"] = $("#totalCost").val();
            paramData["cardNo"] = $("#cardNo").val();//CardNo
            paramData["carCategory"] = $("#carCategory").val();//carCategory
            paramData["mileAge"] = $("#mileAge").val();//mileAge
            paramData["roDocNo"] = $("#roDocNo").val();

            alert("selectUseCardAndAddConsume");
            $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/updateUseCardAndAddConsume.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    $("#BMResult").html("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                },
                success:function(result) {
                    console.log(result);
                    if(result.IsSuccess){
                        var strResult = "Msg:"+result.Data.Msg+"<br>"
                                      + "IfResult:"+result.Data.IfResult+"<br>"
                                      + "Point:"+result.Data.Point+"<br>"
                                      + "PointSeq:"+result.Data.PointSeq+"<br>"
                                      + "ResultMsg:"+result.Data.ResultMsg+"<br>";
                        $("#BMResult").html(strResult);
                    }else{
                        $("#BMResult").html(result.Message);
                    }
                } // kjlee
            });
        }

        function selectVocPushSignAlarms(){
            alert("VocPushSignAlarms");
            $.ajax({
                url:"<c:url value='/bat/crm/crq/selectVocPushSignAlarms.do' />",
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

        function selectMakTargetExtract(){
            alert("selectMakTargetExtract");
            $.ajax({
                url:"<c:url value='/bat/crm/mcm/markingCampaignBatchService.do' />",
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

        function selectSatisFaction(){
            alert("selectSatisFaction");
            $.ajax({
                url:"<c:url value='/bat/crm/css/selectSatisFaction.do' />",
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
        function customerCare(){
            alert("customerCare");
            $.ajax({
                url:"<c:url value='/bat/crm/cif/customerCareBatchService.do' />",
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
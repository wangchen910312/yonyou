<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script>

    /* 콜센터 상태 호출 ------------------------------------------------------------------------------------------------------------ */
    var XMLHttpReq;
    var XMLHttpReq2;


    var CALL_IS_NEW = true;     // IB / 부재중일때 신규인지 확인
    var CALL_MISS_CNT = 0;      // 부재중 전화
    var CALL_IS_PC = true;         // 콜센터 PC여부

    // 디바이스 상태를 초기화한다. TODO param 변경.
    function callDeviceInit() {

        CALL_IS_NEW = true;
        CALL_MISS_CNT = 0;

        var params = "event_type=99&line=1&device_id=86209574&device_ip=10.125.228.48&device_port=4700";
        params += "&callFileNm=&callHisSeq=&callHm=&callPassHm=";

        $.ajax({
            url:"<c:url value='/crm/cal/callCenter/callReceive.do' />?"+params
            ,type:'GET'                        //조회요청
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors);
            }
        }).done(function(jqXHR, textStatus) {

            //console.log("jqXHR : ", jqXHR)  // 0000
            //console.log("textStatus : ", textStatus)    // success

        });

    };

    function createXMLHttpRequest() {
        if(window.XMLHttpRequest) { //Mozilla
            XMLHttpReq = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { //IE
            try {
                XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }

    // 서버에 상태 호출.
    function sendRequest() {
        createXMLHttpRequest();
        var url = "<c:url value='/crm/cal/callCenter/callStatus.do' />";

        XMLHttpReq.open("POST", url, true);
        XMLHttpReq.onreadystatechange = processResponse;
        XMLHttpReq.send(null);
    };

    // 5초마다 호출.
    function processResponse() {
        if (XMLHttpReq.readyState == 4) {
            if (XMLHttpReq.status == 200) {
                console.log("CALL_IS_PC : ",CALL_IS_PC);

                if ( CALL_IS_PC ) {
	                showJSONStatus(XMLHttpReq.responseText);
                    setTimeout("sendRequest()", 5000);
                };

            } else {
                // error
            }
        }
    };

    // 상태 호출후 응답.
    function showJSONStatus(status) {

        var callInfo = JSON.parse(status);
        var callHisSeq          = callInfo.callHisSeq;
        var callStatCd          = callInfo.callStatCd;
        var callFileNm          = callInfo.callFileNm;
        var callHm              = callInfo.callHm;
        var callStartDt         = callInfo.callStartDt;
        var callTelNo           = callInfo.callTelNo;       // 수신 전화번호
        var callRingCnt         = callInfo.callRingCnt;     // 수신 밸카운트
        var isCallPc            = callInfo.callPc;          // 연결된 디바이스에서 호출된 정보를 받기위함.
        var callDevicePc        = callInfo.callDevicePc;    // 디바이스가 연결된 피시여부

        if ( !callDevicePc ) {
            CALL_IS_PC = false;
        };

        if ( CALL_IS_PC ) {

            $("#btnCall1").removeClass("hidden");
            $("#btnCall2").removeClass("hidden");

        } else {

            $("#btnCall1").addClass("hidden");
            $("#btnCall2").addClass("hidden");

        }

//         console.log("callInfo : ",callInfo);
//         console.log("callStatCd : "+callStatCd+" / isCallPc : "+isCallPc);

        // 디바이스와 연결된 PC IP 와 클라이언트 IP 확인 후 처리 시작
        if ( !isCallPc ) {



        } else if ( isCallPc ) {        // 연결된 디바이스에서 호출된 정보만 받아서 처리한다.

            // 상태에 따른 처리 시작.
            if ( dms.string.isEmpty(callStatCd) ) {
                // {콜센터 장비 상태}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='crm.lbl.callStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");

            } else if ( dms.string.isNotEmpty(callStatCd) ) {

                if ( callStatCd !== "5" && callStatCd !== "9" && callStatCd !== "11"  ) {
                    CALL_IS_NEW = true;
                };

                if ( callStatCd === "999" ) {
                    // TODO {콜센터 장비 상태}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='crm.lbl.callStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");

                } else if ( callStatCd === "3" ) {      // 수화기듬

                    $("#callStartDt").data("kendoExtMaskedDateTimePicker").value(callStartDt);
                    $("#callEndDt").data("kendoExtMaskedDateTimePicker").value("");

                } else if ( callStatCd === "9" ) {      // OB 통화 완료 - callHisSeq , callFileNm, callHm

                    console.log("CALL_IS_NEW : ",CALL_IS_NEW)
                    if ( CALL_IS_NEW ) {

                        // 종료시간 / 녹음파일명 / callHisSeq 설정.
                        var callStartDtDDL = $("#callStartDt").data("kendoExtMaskedDateTimePicker");
                        var callStartDtDDLValue = callStartDtDDL.value();
                        var chgMinutes;

                        console.log("callStartDtDDLValue ::: ",callStartDtDDLValue)
                        console.log("callStartDt ::: ",callStartDt)

                        if ( dms.string.isEmpty(callStartDtDDLValue) ) {             // 통화 시작 시간 설정.

                            callStartDtDDL.value(callStartDt);

                        } else if ( dms.string.isNotEmpty(callStartDtDDLValue) ) {         // 통화 종료 시간 설정.
                            chgMinutes = callStartDtDDLValue.getSeconds() + (Number(callHm));
                            callStartDtDDLValue.setSeconds(chgMinutes);
                            $("#callEndDt").data("kendoExtMaskedDateTimePicker").value(callStartDtDDLValue);
                        };

                        $("#callCont").val(callHisSeq);
                        $("#callHisSeq").val(callHisSeq);
                        $("#recFileId").val(callFileNm);

                        CALL_IS_NEW = false;

                    };

                } else if ( callStatCd === "14" || callStatCd === "5" ) {      // 수신자 정보 -> 밸소리 울림

                    if ( CALL_IS_NEW ) {

                        // TODO 메시지
                        var callReceiveMsg = "전화왔습니다. <br /><br />연락처 : "+callTelNo;

                        dms.window.confirm({
                            message:callReceiveMsg
                            ,callback:function(result){
                                if(result){

                                    window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custcareMng' />", "<c:url value='/crm/crq/vocMgmt/selectVocMgmtMain.do' />?callTelNo="+callTelNo, "VIEW-D-10269");

                                }else{
                                    //취소버튼 클릭 로직
                                    return;
                                }
                            }
                        });

                        CALL_IS_NEW = false;

                    };

                } else if ( callStatCd === "11" ) {      // 부재중 알람

                    console.log("CALL_IS_NEW : ",CALL_IS_NEW)
                    console.log("CALL_MISS_CNT : ",CALL_MISS_CNT)

                    if ( CALL_IS_NEW ) {

                        CALL_MISS_CNT = (Number(CALL_MISS_CNT)) + 1;

                        // TODO 메시지
                        var callReceiveMsg = "["+CALL_MISS_CNT+"] 건의 부재중 전화가 있습니다.<br /><br />연락처 : "+callTelNo;

                        dms.window.confirm({
                            message:callReceiveMsg
                            ,callback:function(result){
                                if(result){

                                    window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custcareMng' />", "<c:url value='/crm/crq/vocMgmt/selectVocMgmtMain.do' />?callTelNo="+callTelNo, "VIEW-D-10269");

                                }else{
                                    //취소버튼 클릭 로직
                                    return;
                                }
                            }
                        });

                        CALL_IS_NEW = false;
                        CALL_MISS_CNT = CALL_MISS_CNT;

                    };

                };

            };
            // 상태에 따른 처리 종료.

        };
        // 디바이스와 연결된 PC IP 와 클라이언트 IP 확인 후 처리 종료

    };

    // 전화걸기.
    function callSend() {

        var number = $("#number").val();        // TODO 추후 수정
        number = "801";

        if ( dms.string.isNotEmpty(number) ) {

            location.href = "openIE:line=1number="+number;

        } else {
            // {고객 이동 전화번호}을(를) 확인하여 주세요.
            dms.notification.warring("<spring:message code='crm.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
        };

    };

    // 콜상태 호출
    sendRequest();

    /* 콜센터 상태 호출 ------------------------------------------------------------------------------------------------------------ */
</script>
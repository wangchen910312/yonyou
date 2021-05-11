
    /* 콜센터 상태 호출 ------------------------------------------------------------------------------------------------------------ */
    var XMLHttpReqIB;

    var _isCallPcIB = true;         // 콜센터 PC여부
    var _isCallNewIB = true;        // 상태 : IB 일때 신규인지 확인
    var _isCallNewRsltIB = true;    // 상태 : IB 종료정보를 받을때 신규인지 확인
    var _isCallMissIB = true;       // 상태 : 부재중 일때 신규인지 확인
    var _isCallMissCntIB = 0;       // 부재중 전화 수량
    var _callIBSeqBF = "";          // ibSeq
    var _callDeviceIpNo = "";
    var _callStatCd = "";
    var _userId = "";

    // 기본은 OB실행으로 설정.
    var _callViewId = "VIEW-D-10277";
    var _callViewUrl = "";
    var _callViewTitle = "";

    function createXMLHttpRequestIB() {
        if(window.XMLHttpRequest) { //Mozilla
            XMLHttpReqIB = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { //IE
            try {
                XMLHttpReqIB = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReqIB = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }

    // 서버에 상태 호출.
    function sendRequestIB() {
        createXMLHttpRequestIB();
        var url = _contextPath + "/crm/cal/callCenter/callStatus.do";

        XMLHttpReqIB.open("POST", url, true);
        XMLHttpReqIB.onreadystatechange = processResponseIB;
        XMLHttpReqIB.send(null);
    };

    // 1초마다 호출.
    function processResponseIB() {
        if (XMLHttpReqIB.readyState == 4) {
            if (XMLHttpReqIB.status == 200) {

                console.log("IB:",_isCallPcIB+" | userId:"+_userId+" | Status:"+_callStatCd);
                if ( _isCallPcIB ) {
                    showJSONStatusIB(XMLHttpReqIB.responseText);
                    setTimeout("sendRequestIB()", 1000);
                };

            } else {
                // error
            }
        }
    };

    // 상태 호출후 응답.
    function showJSONStatusIB(status) {

        var callInfo            = JSON.parse(status);
        var callHisSeq          = callInfo.callHisSeq;
        var callStatCd          = callInfo.callStatCd;
        var callFileNm          = callInfo.callFileNm;
        var callHm              = callInfo.callHm;
        var callStartDt         = callInfo.callStartDt;
        var callTelNo           = callInfo.callTelNo;       // 수신 전화번호
        var callRingCnt         = callInfo.callRingCnt;     // 수신 밸카운트
        var callDevicePc        = callInfo.callDevicePc;    // 디바이스가 연결된 피시여부
        var callDeviceIpNo      = callInfo.callDeviceIpNo;  // 디바이스 line 번호
        var callIBSeq           = callInfo.callIBSeq;       // ibSeq
        var callIsGroup         = false;                    // 같은 콜 그룹 여부
        var callViewId          = callInfo.callViewId;      // callViewId

        _userId = callInfo.userId;    // 초기화 번수선언
        _callStatCd = callStatCd;    // 초기화 번수선언

        if ( !callDevicePc ) {      // 콜센터 PC 인지 확인

            _isCallPcIB = false;

        } else if ( callDevicePc && dms.string.isNotEmpty(callIBSeq) ) {        //&& IB 이벤트가 발생할 경우 처리 시작.

            _callDeviceIpNo = callInfo.callDeviceIpNo;    // 초기화 번수선언
            _callStatCd = callInfo.callStatCd;    // 초기화 번수선언

            if ( dms.string.isNotEmpty(callViewId) ) {
                _callViewId = callViewId;
            };

            if ( dms.string.isEmpty(callStatCd) ) {
                dms.notification.error(dms.settings.callCenterMessage.confirmCallStatCd);     // {콜센터 장비 상태}을(를) 확인하여 주세요.
            } else if ( dms.string.isNotEmpty(callStatCd) ) {

                if ( callStatCd === "14" || callStatCd === "5" || callStatCd === "10" || callStatCd === "11" ) {
                    _callIBSeqBF = "";                                  // 콜 종료 정보를 받았으면 callIBSeqBF 값을 초기화해준다.
                };

                if ( dms.string.isEmpty(_callIBSeqBF) ) {
                    _callIBSeqBF = callIBSeq;
                };

                if ( callIBSeq === _callIBSeqBF ) {
                    callIsGroup = true;
                };

                if ( callStatCd !== "14" && callStatCd !== "5" ) {      // IB 알림을 띄어주기 위해서 팝업 변수 초기화.
                    _isCallNewIB = true;
                };

                if ( callStatCd !== "11"  ) {                           // 부재중 알림을 띄어주기 위해서 팝업 변수 초기화.
                    _isCallMissIB = true;
                };

                if ( callIsGroup ) {                                    // 콜그룹에 따른 처리 시작

                    if ( callStatCd === "5" ) {                         // 전화 알람 표시 시작 - 밸소리 울림면 전화왔습니다. 알람 표시.

                        if ( _isCallNewIB ) {

                            var callReceiveMsg = dms.settings.callCenterMessage.phoneCall+" <br /><br /> "+dms.settings.callCenterMessage.hpNo+" : "+callTelNo;

                            dms.window.confirm({
                                message:callReceiveMsg
                                ,modal:false
                                ,callback:function(result){

                                    _callIBSeqBF = "";                  // 콜 종료 정보를 받았으면 callIBSeqBF 값을 초기화해준다.
                                    _isCallMissIB = true;

                                    IBcallDeviceInit();                 // [0226]콜장비 상태 초기화

                                    if(result){
                                        callOpenTabMenu(callTelNo);
                                    }else{
                                        return;
                                    }

                                }
                            });

                            _isCallNewIB = false;            //IB 알람 중복 팝업 안되게끔 설정

                        };

                    } else if ( callStatCd === "11" ) {      // 부재중 알람

                        if ( _isCallMissIB ) {

                            _isCallMissCntIB = (Number(_isCallMissCntIB)) + 1;

                            var callReceiveMsg = "["+_isCallMissCntIB+"] "+dms.settings.callCenterMessage.phoneMissCall+"<br /><br />"+dms.settings.callCenterMessage.hpNo+" : "+callTelNo;

                            IBcallDeviceInit();                 // [0226]콜장비 상태 초기화

                            dms.window.confirm({
                                message:callReceiveMsg
                                ,modal:false
                                ,callback:function(result){

                                    _callIBSeqBF = "";                   // 콜 종료 정보를 받았으면 callIBSeqBF 값을 초기화해준다.
                                    _isCallNewIB = true;

                                    if(result){
                                        callOpenTabMenu(callTelNo);
                                    }else{
                                        return;
                                    }
                                }
                            });

                            _isCallMissIB = false;            //부재중 알람 중복 팝업 안되게끔 설정
                            _isCallMissCntIB = _isCallMissCntIB;    //부재중 알람 횟수

                        };

                    } else if ( callStatCd === "10" ) {      // 콜 정보 VOC 저장

                        var _dupTabMenuFrameId;

                        if ( _isCallNewRsltIB ) {

                            var _dupTabMenu = false;
                            var isFromHidden = true;

                            //탭메뉴 갯수 체크
                            _tabMenuList = _tabMenu.tabGroup.children("li");

                            //탭메뉴 오픈 체크
                            if(dms.string.isNotEmpty(_callViewId)){

                                _tabMenuCheck = true;
                                //탭메뉴 체크
                                _tabMenuList.each(function(idx, obj){

                                    if ( _tabMenuList.length <= 1 ) {
                                        _tabMenuCheck = false;
                                        return;
                                    }

                                    if($(this).data("viewId") === _callViewId){
                                        _tabMenu.select(this);
                                        _dupTabMenuFrameId = $(this).data("id");
                                        _dupTabMenu = true;
                                        return false;
                                    }
                                });

                                // [0226]
                                if ( !_tabMenuCheck ) {
                                    IBcallDeviceInit();
                                    return;
                                }

                                //히든탭 메뉴 체크
                                $("#hiddenTabMenuList").children("li").each(function(idx, obj){
                                    data = $(this).data();

                                    if(data.viewId === _callViewId){
                                        $(this).remove();
                                        _addTabMenu(data.title, data.url, data.tCd, data.viewId);
                                        _dupTabMenu = true;
                                        isFromHidden = true;
                                        return false;
                                    }
                                });

                            };

                            // [0226]
                            if ( _callViewId === "VIEW-D-10316" ) {                       // 판매기회

                                $("#"+_dupTabMenuFrameId).get(0).contentWindow.sendToOpptCallInfo(callHisSeq, callFileNm, callDeviceIpNo, callStartDt, callHm);

                            } else if ( _callViewId === "VIEW-D-10277" ) {                       // VOC

                                $("#"+_dupTabMenuFrameId).get(0).contentWindow.sendToVocCallInfo(callHisSeq, callFileNm, callDeviceIpNo, callStartDt, callHm);

                            };

                        };

                    };  // 전화 알람 표시 종료

                };  // 콜그룹에 따른 처리 종료

            };  // 상태에 따른 처리 종료.

        };  // 디바이스와 연결된 PC IP 와 클라이언트 IP 확인 후 처리 종료

    };  // 상태 호출후 응답.

    // 콜상태 호출
    sendRequestIB();

    // [0226] 디바이스 상태를 대기 상태로 초기화한다.
    function IBcallDeviceInit() {

        if ( _isCallPcIB ) {

            var params = "event_type=8&line=1&ibseq=&obseq=&device_id=&device_ip=&caller=&RingCnt=&device_port=&duration=&TimeLong=&FilePath=&date=&userId="+_userId;

            $.ajax({
                url: _contextPath + "/crm/cal/callCenter/callReceive.do?"+params
                ,type:'GET'                        //조회요청
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
            }).done(function(jqXHR, textStatus) {

            });

        }

    };

    // [0226] viewId를 가지고 메뉴 오픈
    function callOpenTabMenu(callTelNo) {

        if ( _isCallPcIB ) {

            var param = {};
            param.sViewId = _callViewId;

            $.ajax({
                 url:_contextPath + "/crm/cal/callCenter/selectViewInfo.do"
                ,data:JSON.stringify(param)
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
            }).done(function(jqXHR, textStatus) {

                var viewUrl = jqXHR.viewUrl;
                var viewId = jqXHR.viewId;
                var viewTitle = "";

                if ( viewId === "VIEW-D-10313" ) {                              // OB 실행
                    viewTitle = dms.settings.callCenterMessage.obMng;
                } else if ( viewId === "VIEW-D-10316" ) {                       // 판매기회
                    viewTitle = dms.settings.callCenterMessage.opportunityMng
                } else if ( viewId === "VIEW-D-10277" ) {                       // VOC
                    viewTitle = dms.settings.callCenterMessage.vocMng;
                    viewUrl = viewUrl+"?callTelNo="+callTelNo;
                };

                window.parent._createOrReloadTabMenu(viewTitle , _contextPath + viewUrl, viewId);

            });

        };

    };

    /* 콜센터 상태 호출 ------------------------------------------------------------------------------------------------------------ */
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <section id="window" class="pop_wrap">

        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.title.OBcall" /><!-- 전화걸기 --></h1>
            <div class="btn_right">
                <button id="btnVocOBcallSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="numberpicker mt0">
            <div class="form_number">
                <input type="text" id="hpNo" name="hpNo" type="tel" maxlength="15" />
            </div>
            <p class="txt_msg al">
                <strong>
                    <spring:message code="crm.lbl.callStartDt" /><!-- 통화시작시간 --> : <span id="callStartDtTxt"></span><br>
                    <spring:message code="crm.lbl.callEndDt" /><!-- 통화끝난시간 --> : <span id="callEndDtTxt"></span><br>
                </strong>
                <input type="hidden" id="callStartDt" name="callStartDt" />
                <input type="hidden" id="callEndDt" name="callEndDt" />
                <input type="hidden" id="callHisSeq" name="callHisSeq" />
                <input type="hidden" id="callFileNm" name="callFileNm" />
            </p>
            <ul class="number_button">
                <li><button id="dialBtn1" type="button" value="1" class="dialBtn" >1</button></li>
                <li><button id="dialBtn2" type="button" value="2" class="dialBtn" >2<!-- <span>ABC</span> --></button></li>
                <li><button id="dialBtn3" type="button" value="3" class="dialBtn" >3<!-- <span>DEF</span> --></button></li>
                <li><button id="dialBtn4" type="button" value="4" class="dialBtn" >4<!-- <span>GHI</span> --></button></li>
                <li><button id="dialBtn5" type="button" value="5" class="dialBtn" >5<!-- <span>JKL</span> --></button></li>
                <li><button id="dialBtn6" type="button" value="6" class="dialBtn" >6<!-- <span>MNO</span> --></button></li>
                <li><button id="dialBtn7" type="button" value="7" class="dialBtn" >7<!-- <span>PQRS</span --></button></li>
                <li><button id="dialBtn8" type="button" value="8" class="dialBtn" >8<!-- <span>TUV</span> --></button></li>
                <li><button id="dialBtn9" type="button" value="9" class="dialBtn" >9<!-- <span>WXYZ</span> --></button></li>
                <li><button id="dialBtn*" type="button" value="*" class="dialBtn sbtn_star" ><span>*</span></button></li>
                <li><button id="dialBtn0" type="button" value="0" class="dialBtn" >0</button></li>
                <li><button id="dialBtn#" type="button" value="#" class="dialBtn sbtn_sharp" ><span>#</span></button></li>
                <li><button id="dialBtnD" type="button" value="D" class="sbtn_back" ><span>backspace</span></button></li>
                <li><button id="dialBtnS" type="button" value="S" class="sbtn_call" style="width:126px;"><spring:message code='crm.btn.OBcall' /><!-- 전화걸기 --></button></li>
                <%-- <li><button id="dialBtnC" type="button" value="C" class="sbtn_callOff" ><spring:message code='crm.lbl.end' /><!-- 종료 --></button></li> --%>
            </ul>
        </div>
    </section>

    <script type="text/javascript">
        $(document).ready(function() {
            var options;
            if(parent.obCallPopupWindow){
                options = parent.obCallPopupWindow.options.content.data;
                $("#hpNo").val(options.hpNo);       // 전화번호 설정
            }

            // 다이얼 번호 세팅
            $(".dialBtn").kendoButton({
                click:function(e) {
                    var character = e.sender.element[0].value;
                    var pos = $("#hpNo").getCursorPosition();
                    var hpNoValue = $("#hpNo").val();
                    $("#hpNo").val([hpNoValue.slice(0, pos), character, hpNoValue.slice(pos)].join(''));
                    pos++;//+1 cursor
                    $("#hpNo").setCursorPosition(pos);
                }
            });

            // 전화번호 지우기
            $("#dialBtnD").kendoButton({
                click:function(e) {
                    var pos = $("#hpNo").getCursorPosition();
                    // 전화번호 전체 선택후 지우기 버튼 누르면 복사가되므로 전체선택시 ( pos : 0 ) 예외처리
                    if ( pos > 0 ) {
                        var hpNoValue = $("#hpNo").val();
                        $("#hpNo").val([hpNoValue.slice(0, pos-1), hpNoValue.slice(pos)].join(''));
                        pos--; //-1 cursor
                        $("#hpNo").setCursorPosition(pos);
                    };
                }
            });

            // 전화걸기
            $("#dialBtnS").kendoButton({
                click:function(e) {
                    callSend();
                }
            });

//             전화종료
//             $("#dialBtnC").kendoButton({
//                 click:function(e) {
//                     console.log("통화종료")
//                     location.href = "openIE:line=1number=stopdial";
//                 }
//             });

            // 통화완료
            $("#btnVocOBcallSave").kendoButton({
                click:function(e) {

                    var saveData = {
                        callHisSeq : $("#callHisSeq").val()
                        ,callFileNm : $("#callFileNm").val()
                        ,callStartDt : $("#callStartDt").val()
                        ,callEndDt : $("#callEndDt").val()
                        ,callDialNum : $("#hpNo").val()
                    };
                    options.callbackFunc(saveData);

                }
                ,enable:false
            });

        });

        /*****************************************************************************
         ******************************* 콜센터 상태호출 *********************************
         *****************************************************************************/
        var XMLHttpReqOB;


        // 전화걸기.
        function callSend() {

            var number = $("#hpNo").val();
            //number = "802";     // TODO 추후 삭제

            $("#callStartDtTxt").text("");
            $("#callEndDtTxt").text("");
            $("#callStartDt").val("");
            $("#callEndDt").val("");
            $("#callHisSeq").val("");
            $("#callFileNm").val("");

            if ( dms.string.isNotEmpty(number) ) {
                location.href = "openIE:line=1number="+number;
            } else {
                // {고객 이동 전화번호}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='crm.lbl.hpNo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            };

        };

        function createXMLHttpRequestOB() {
            if(window.XMLHttpRequest) { //Mozilla
                XMLHttpReqOB = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) { //IE
                try {
                    XMLHttpReqOB = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        XMLHttpReqOB = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {}
                }
            }
        }

        // 서버에 상태 호출.
        function sendRequestOB() {
            createXMLHttpRequestOB();
            var url = "<c:url value='/crm/cal/callCenter/callStatus.do' />";
            XMLHttpReqOB.open("POST", url, true);
            XMLHttpReqOB.onreadystatechange = processResponseOB;
            XMLHttpReqOB.send(null);
        };

        // 5초마다 호출.
        function processResponseOB() {
            if (XMLHttpReqOB.readyState == 4) {
                if (XMLHttpReqOB.status == 200) {

                    var callStatus = JSON.parse(XMLHttpReqOB.responseText);
                    console.log("Dial:",callStatus.callDevicePc+" | userId:"+callStatus.userId+" | Stat:"+callStatus.callStatCd);

                    if ( callStatus.callDevicePc ) {
                        showJSONStatusOB(XMLHttpReqOB.responseText);
                        setTimeout("sendRequestOB()", 1000);
                    };

                } else {
                    // error
                }
            }
        };

        // 상태 호출후 응답처리 시작
        function showJSONStatusOB(status) {

            var callInfo            = JSON.parse(status);
            var callHisSeq          = callInfo.callHisSeq;
            var callStatCd          = callInfo.callStatCd;
            var callFileNm          = callInfo.callFileNm;
            var callHm              = callInfo.callHm;
            var callStartDt         = kendo.parseDate(callInfo.callStartDt, "<dms:configValue code='dateTimeFormat' />");
            var callEndDt           = kendo.parseDate(callInfo.callStartDt, "<dms:configValue code='dateTimeFormat' />");
            var callTelNo           = callInfo.callTelNo;       // 수신 전화번호
            var callRingCnt         = callInfo.callRingCnt;     // 수신 밸카운트
            var callDevicePc        = callInfo.callDevicePc;    // 디바이스가 연결된 피시여부
            var callHisLineNo       = callInfo.callHisLineNo;   // 디바이스 line 번호
            var callOBSeq           = callInfo.callOBSeq;       // obSeq
            var callIsGroup         = true;                    // 같은 콜 그룹 여부

            // 상태값이 없거나 OB event가 아닌경우 return
            if ( dms.string.isEmpty(callStatCd) && dms.string.isEmpty(callOBSeq)) {
                // {콜센터 장비 상태}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='crm.lbl.callStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;

            } else {

                if( dms.string.isEmpty(callHm) ) {
                    callHm = 0;
                };

                // 통화 종료후 종료 정보 설정
                if ( callStatCd === "9" ) {

                    callEndDt.setSeconds(callEndDt.getSeconds() + (Number(callHm)));        // 종료시간 설정
                    $("#callStartDtTxt").text(kendo.toString(callStartDt,"<dms:configValue code='dateTimeFormat' />"));
                    $("#callEndDtTxt").text(kendo.toString(callEndDt,"<dms:configValue code='dateTimeFormat' />"));
                    $("#callStartDt").val(kendo.toString(callStartDt,"<dms:configValue code='dateTimeFormat' />"));
                    $("#callEndDt").val(kendo.toString(callEndDt,"<dms:configValue code='dateTimeFormat' />"));
                    $("#callHisSeq").val(callHisSeq);
                    $("#callFileNm").val(callFileNm);
                    $("#hpNo").val(callTelNo);
                    $("#btnVocOBcallSave").data("kendoButton").enable(true);
                    $("#btnVocOBcallSave").click();

                } else {

                    // 수화기 들어서 통화정보가 새로 만들어질때
                    $("#callStartDtTxt").text("");
                    $("#callEndDtTxt").text("");
                    $("#callStartDt").val("");
                    $("#callEndDt").val("");
                    $("#callHisSeq").val("");
                    $("#callFileNm").val("");

                };

            };

        };
        // 상태 호출후 응답처리 종료

        // 콜상태 호출
        sendRequestOB();
        /*****************************************************************************
         ******************************* 콜센터 상태호출 *********************************
         *****************************************************************************/
         // GET CURSOR POSITION
         jQuery.fn.getCursorPosition = function(){
             if(this.lengh == 0) return -1;
             return $(this).getSelectionStart();
         }

         jQuery.fn.getSelectionStart = function(){
             if(this.lengh == 0) return -1;
             input = this[0];

             var pos = input.value.length;

             if (input.createTextRange) {
                 var r = document.selection.createRange().duplicate();
                 r.moveEnd('character', input.value.length);
                 if (r.text == '')
                 pos = input.value.length;
                 pos = input.value.lastIndexOf(r.text);
             } else if(typeof(input.selectionStart)!="undefined")
             pos = input.selectionStart;

             return pos;
         }

         //SET CURSOR POSITION
         jQuery.fn.setCursorPosition = function(pos) {
           this.each(function(index, elem) {
             if (elem.setSelectionRange) {
               elem.setSelectionRange(pos, pos);
             } else if (elem.createTextRange) {
               var range = elem.createTextRange();
               range.collapse(true);
               range.moveEnd('character', pos);
               range.moveStart('character', pos);
               range.select();
             }
           });
           return this;
         };
    </script>
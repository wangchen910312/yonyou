(function($){
    $.fn.nodoubletapzoom = function() {
        $(this).bind('touchstart', function preventZoom(e){
            var t2 = e.timeStamp;
            var t1 = $(this).data('lastTouch') || t2;
            var dt = t2 - t1;
            var fingers = e.originalEvent.touches.length;
            $(this).data('lastTouch', t2);
            if (!dt || dt > 500 || fingers > 1){
                return; // not double-tap
            }
            e.preventDefault(); // double tap - prevent the zoom
            // also synthesize click events we just swallowed up
            //console.log(e.target);
            //console.log("dblclick");
            $(e.target).trigger('dblclick');
        });
    };


})(jQuery);


var originalHeight=$(window).height();

$(document).on('pageinit',function(e){
    $("body").nodoubletapzoom();
});

var _focusTimeout;
//입력폼[input]에 포커스가 될때 입력값 선택
$(document).on('focus','input, textarea', function() {
	var input = $(this);
    _focusTimeout = setTimeout(function () {
    	input.select();
    	clearTimeout(_focusTimeout);
    });


    //khskhs 문제시 삭제 : 태블릿 키보드 안가라게 스크롤하는거 textArea, iPad 용 코드 추가 필요 할 것 같음
    try{
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
            || (userAgent.search("ipad") > -1))
        {

        }else
        {
            var _this=this;
            setTimeout(function(){
                var offset = $(_this).offset();
                var py = offset.top - $(window).scrollTop();
                if($(window).height()<(py+$(_this).height())){
                    $(window).scrollTop($(window).scrollTop()+py+$(_this).height()-$(window).height()+$(_this).height());
                }
           },500);
        }
    }catch(e){

    }
    //khskhs 문제시 삭제


});
//입력폼[input]에 포커스가 될때 입력값 선택
$(document).ready(function(){
    $("input").focus(function(){
        this.select();
    });
});

(function(window, document, $) {

	'use strict';

	/**
	 *
	 */
	$.ajaxSetup({
	    headers:{
	        "X-AjaxRequest":"1"
	        ,"Client-TimeZone-Offset":-(new Date().getTimezoneOffset())
	    }
	    ,beforeSend:function(xhr) {
	        //$("#ajaxProcessing").show();
	    }
	    ,complete:function(xhr, status) {
            //$("#ajaxProcessing").hide();
        }
	    ,error: function (xhr, status, errors) {
        }
	});

	$(document).on("mousemove", function(e){
	    dms.mouse.X = e.pageX;
	    dms.mouse.Y = e.pageY;
	});

	var dms = window.dms? window.dms:{};

	dms.mouse = {
	    X:0
	    ,Y:0
	};

	dms.browser = {
            /**
             * 사용자의 브라우저 종류를 확인하여 리턴한다.<br>
             * @return {String} 브라우저 종류
             */
            getBrowserType:function() {
                var userAgent = navigator.userAgent.toLowerCase();

                if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (userAgent.indexOf("msie") != -1) ) {
                    return "msie";
                } else if (userAgent.indexOf("chrome") > -1) {
                    return "chrome";
                } else if (userAgent.indexOf("safari") > -1) {
                    return "safari";
                } else if (userAgent.indexOf("firefox") > -1) {
                    return "firefox";
                } else if (userAgent.indexOf("opera") > -1) {
                    return "opera";
                } else {
                    return "unknown";
                }
            },

            /**
             * 사용자의 브라우저가 MicroSoft Internet Explorer 인지 확인
             * @returns {Boolean}
             */
            isMsie:function() {
                return (this.getBrowserType() == "msie") ? true:false;
            },

            /**
             * 사용자의 브라우저가 Chrome 인지 확인
             * @returns {Boolean}
             */
            isChrome:function() {
                return (this.getBrowserType() == "chrome") ? true:false;
            },

            /**
             * 사용자의 브라우저가 Safari 인지 확인
             * @returns {Boolean}
             */
            isSafari:function() {
                return (this.getBrowserType() == "safari") ? true:false;
            },

            /**
             * 사용자의 브라우저가 Firefox 인지 확인
             * @returns {Boolean}
             */
            isFirefox:function() {
                return (this.getBrowserType() == "firefox") ? true:false;
            },

            /**
             * 사용자의 브라우저가 Opera 인지 확인
             * @returns {Boolean}
             */
            isOpera:function() {
                return (this.getBrowserType() == "opera") ? true:false;
            },

            /**
             * 사용자의 브라우저가 msie, chrome, safari, firefox, opera 중 하나가 아니면 true return
             * @returns {Boolean}
             */
            isUnknown:function() {
                return (this.getBrowserType() == "unknown") ? true:false;
            },

            isMobile:function() {

                var isMobile = false;

                if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) {
                    isMobile = true;
                }

                return isMobile;
	        }
    };

	dms.notification = {
	    notification:null,
	    messageTemplate:"<section id=\"template\">" +
                   "<div class=\"k-notification-wrap\">" +
                   "    <h3 class=\"notification_title\">#= title #</h3>" +
                   "    <div class=\"notification_msgBox\">" +
                   "        <p>#= message #</p>" +
                   "    </div>" +
                   "    <span class=\"k-icon k-i-close\">Hide</span>" +
                   "</div>" +
                   "</section>",

        /**
         * Displays a notification.
         * @param data The string content for the notification; or the object with the values for the variables inside the notification template; or the function, which returns the required string or an object.
         * @param notificationType The notification type. Built-in types include 'info', 'success', 'warning', 'error'
         * @author Kang Seok Han
         * @since 2016. 1. 27.
         * @Modification Information
         * <pre>
         *     since          author              description
         *  ===========    =============    ===========================
         *  2016. 1. 27.     Kang Seok Han     최초 생성
         * </pre>
         */
        show:function(messages, notificationType, options) {

            var msg = "";

            if (typeof messages === "string") {
                msg = messages;
            } else if(typeof messages === "object") {
                $(messages).each(function(idx, error){
                    msg += "<p>" + error.errorMessage + "</p>";
                 });
            } else if(typeof messages === "function") {
                msg = messages.call();
            }

            if (notificationType == "popup") {
//TODO [한강석] 메세지출력 POPUP 구현필요
                alert(msg);
            } else if (notificationType == "alert") {
                alert(msg);
            } else {


                var settings = {
                    stacking: "up"
                    ,button: true
                    ,position: {
                        bottom: 35,
                        right: 12
                    }
                    ,hideOnClick: false
                    ,autoHideAfter: 10000
//                    ,show: function(e){
//                        가운데 출력
//                        var element = e.element.parent();
//                        var eWidth = element.width();
//                        var eHeight = element.height();
//                        var wWidth = $(window).width();
//                        var wHeight = $(window).height();
//                        var offsetTop = (e.sender.getNotifications().length - 1) * 147;
//                        var newTop;
//                        var newLeft;
//
//                        newLeft = Math.floor(wWidth/2 - eWidth/2);
//                        newTop = Math.floor(wHeight/2 - eHeight/2) - offsetTop;
//
//                        e.element.parent().css({
//                            top: newTop
//                            ,left: newLeft
//                        });

//                    }
                  ,templates: [
                      {type: "info", template: this.messageTemplate}
                      ,{type: "warning", template: this.messageTemplate}
                      ,{type: "error", template: this.messageTemplate}
                      ,{type: "success", template: this.messageTemplate}
                  ]
                };

                if(options){
                	$.extend(true, settings, options);
                }

                if(this.notification == null) {
                    var element;

                    if (window.parent) {
                        element = window.parent.$("#globalFooterNotification");
                    } else {
                        element = $("#globalFooterNotification");
                    }

                    this.notification = element.kendoNotification(settings).data("kendoNotification");
                }

                this.notification.show({title:notificationType, message:msg}, notificationType);
            }

        },

        info:function(messages, options) {
            this.show(messages, "info", options);
        },

        success:function(messages, options) {
            this.show(messages, "success", options);
        },

        warning:function(messages, options) {
            this.show(messages, "warning", options);
        },

        error:function(messages, options) {
            this.show(messages, "error", options);
        }

	};

	dms.window = {
        popup:function(options){
            this.settings = {
                 width:950
                ,height:500
                ,animation:false
                ,draggable:true
                ,visible:false
                ,resizable:false
                ,title:"POPUP"
                ,modal:false
                ,pinned:true
                ,content:{
                    data:{
                        "type":"default"
                        ,"autoBind":true
                        ,"selectable":"row"
                        ,"callbackFunc":function(data){
                        }
                    }
                }
                ,iframe:true
                ,deactivate:function() {
                    this.destroy();
                }
                ,open:function(e){
                    //팝업창을 오픈할때 iframe이 로드 될때까지 로딩 이미지를 출력한다.
                    if(e.sender.options.iframe){
                        var iframeLoader = $("<div/>");
                        iframeLoader.css({
                            position:"absolute"
                                ,top:0
                                ,left:0
                                ,width:e.sender.options.width
                                ,height:e.sender.options.height
                                ,background:"#ffffff url('"+_contextPath+"/resources/img/loading-image.gif') no-repeat scroll 50% 50%"
                        });

                        var iframe = $("iframe", e.sender.element);
                        //iframe.hide();

                        iframe.load(function(){
                            iframeLoader.remove();
                            //iframe.show();
                        });

                        iframeLoader.appendTo(e.sender.element);
                    }
                }
            };

            if (options.deactivate) {
                var deactivate = options.deactivate;
                options["deactivate"] = function(){
                    deactivate.call(this);
                    this.destroy();
                };
            } else {
                options["deactivate"] = function(){
                    this.destroy();
                };
            }

            $.extend(true, this.settings, options);

            var _popupWindowContainer = $("<div/>");
            _popupWindowContainer.attr("id", this.settings.windowId);
            _popupWindowContainer.appendTo("body");

            var _popupWindow = _popupWindowContainer.kendoWindow(this.settings).data("kendoWindow");
            _popupWindow.center().open();

            if(window.parent) {

                var _parent = $(window.parent);
                //khs 문제시 삭제
                var _top;
                if(_parent.height()<originalHeight){
                    _top= (originalHeight - _popupWindow.options.height)/2 + _parent.scrollTop() - 70 ;
                }else{
                    _top= (_parent.height() - _popupWindow.options.height)/2 + _parent.scrollTop() - 70 ;
                }
                //khs 문제시 삭제

                _popupWindowContainer.closest(".k-window").css({
                    top:_top
                });
            }

            return _popupWindow;
        },

        /**
         * options.title : 확인창 타이틀(optional)
         * options.message : 확인메세지(required)
         * options.width : 확인창 넓이(optional)
         * options.confirmBtnText : 확인버튼 텍스트(optional)
         * options.cancelBtnText : 취소버튼 텍스트(optional)
         * options.callback : 버튼클릭 콜백 함수(required)
         *
         * dms.window.confirm({
         *     message:"삭제 하시겠습니까?"
         *     ,width:300
         *     ,confirmBtnText:"예"
         *     ,cancelBtnText:"아니오"
         *     ,callback:function(result){
         *         if(result){
         *             //확인버튼 클릭
         *         }else{
         *             //취소버튼 클릭
         *         }
         *     }
         * });
         */
        confirm:function(options){

            var settings = {
                title:dms.settings.defaultMessage.confirmWindowTitle
                ,message:""
                ,width:300
                ,confirmBtnText:dms.settings.defaultMessage.confirmBtnText
                ,cancelBtnText:dms.settings.defaultMessage.cancelBtnText
                ,callback:function(flag){}
                ,modal:true
                ,displayCancelBtn:true
            };

            $.extend(true, settings, options);

            var kendoWindow = $("<div />").kendoWindow({
                title:settings.title
                ,width:settings.width
                ,resizable:false
                ,modal:settings.modal
            });

            var confirmBtn = "<button class=\"confirm-yes k-button\" style=\"margin-right:10px;\">"+settings.confirmBtnText+"</button>";
            var cancelBtn = "<button class=\"confirm-no k-button\" style=\"margin-left:10px;\">"+settings.cancelBtnText+"</button>";

            if(!settings.displayCancelBtn){
                cancelBtn = "";
            }

            kendoWindow.data("kendoWindow")
                .content("<p class=\"conform-message\" style=\"margin:20px 10px;text-align:center;\">"+settings.message+"</p><p style=\"text-align:center;margin:20px;\">"+confirmBtn+cancelBtn+"</p>")
                .center()
                .open();

            kendoWindow
                .find(".confirm-yes,.confirm-no")
                .click(function() {
                    var result = false;
                    if ($(this).hasClass("confirm-yes")) {
                        result = true;
                    }

                    kendoWindow.data("kendoWindow").close();

                    settings.callback(result);
                })
                .end();
        }
	};

	dms.cookie = {
	   setCookie:function(cookieName, cookieValue, expireDays){
	       var exdate = new Date();
           exdate.setDate(exdate.getDate() + expireDays);
           document.cookie = cookieName + "=" + escape(cookieValue) + ((expireDays == null)? "":";expires=" + exdate.toGMTString());
	   },

	   removeCookie:function(cookieName){
	       this.setCookie(cookieName, '', -1);
	   },

	   getCookie:function(cookieName){
            if (document.cookie.length > 0){
                var startIdx = document.cookie.indexOf(cookieName + "=");
                var endIdx;

                if (startIdx != -1) {
                    startIdx = startIdx + cookieName.length + 1;
                    endIdx = document.cookie.indexOf(";", startIdx);

                    if (endIdx == -1) {
                        endIdx = document.cookie.length;
                    }

                    return unescape(document.cookie.substring(startIdx, endIdx));
                }
            }

            return "";
	   }
	};

    dms.string = {

        /**
         * String 일 경우 좌우측 여백 삭제
         * Array일 경우 빈 index 삭제 후 재할당
         * @param obj - 넘겨줄 값
         * @returns {Object}
         */
        trim:function(obj) {
            if(typeof obj === "string"){
                return obj.replace(/(^\s*)|(\s*$)/g, "");
            }
            else if(obj.constructor === Array) {
                var param = [];
                var j = 0;
                for(var i=0; i < obj.length; i++){
                    if(dms.string.isNotEmpty(obj[i])){
                        param[j++] = obj[i];
                    }
                }
                return param;
            }
        },

        /**
         * 자열 str 가 null 이거나 "" 이면 defaultStr 그렇지 않다면 str을 반환한다.
         */
        defaultString:function(str, defaultStr){
            if(this.isEmpty(str))  return defaultStr;
            return str;
        },

        /**
         * 문자열 str 가 null 이거나 trim(str) 결과가 "" 와 같다면 true, 아니면 false 를 리턴한다.
         * @param str
         * @returns {Boolean}
         */
        isEmpty:function(str) {

            if (str == undefined || str == null || this.trim(str) == "") {
                return true;
            } else {
                return false;
            }
        },

        /**
         * 문자열 str 가 null 이거나 trim(str) 결과가 "" 와 다르다면 true, 아니면 false 를 리턴한다.
         * @param str
         * @returns {Boolean}
         */
        isNotEmpty:function(str) {
            return !this.isEmpty(str);
        },

        /**
         * 문자열 str 가 null, undefined 일때 ""값을 리턴한다.
         * @param str
         * @returns str
         */
        strNvl:function(str) {
            if (str == undefined || str == null || this.trim(str) == "") {
                return "";
            } else {
                return str;
            }
        },

        /**
         * 언더바 문자열을 카멜 표기법으로 변환
         * 예> var result=dms.string.under2camel('kaudo_ahndoori');
         *     result = 'kaudoAhndoori';
         */
        under2camel:function(str){
            return str.toLowerCase().replace(/(\_[a-z])/g, function(arg)
            {
                return arg.toUpperCase().replace('_', '');
            });
        },

        /**
         * 카멜 표기법을 언더바 문자로 변환
         * 예> var result=dms.string.under2camel('ahndooriKaudo');
         *     result = 'AHNDOORI_KAUDO ';
         */
        camel2under:function(str){
            return str.replace(/([A-Z])/g, function(arg)
            {
                return "_" + arg.toLowerCase();
            }).toUpperCase();
        },

        /**
         * 헥사코드를 RGB 코드로 변환
         * 예> var result=dms.string.hexToRgb('#ffffff').r;
         *     result = '255';
         */
        hexToRgb:function(hex) {
            var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
            return result ? {
                r: parseInt(result[1], 16),
                g: parseInt(result[2], 16),
                b: parseInt(result[3], 16)
            }:null;
        },

        /**
         * RGB 코드를 헥사코드로 변환
         * 예> var result=dms.string.rgbToHex('255','255','255');
         *     result = '#ffffff';
         */
        rgbToHex:function(r, g, b) {
            return "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
        },

        /**
         * 금액 천단위 구분(,) 표시
         * 예> var result=dms.string.addThousandSeparatorCommas(1000000);
         *     result = '1,000,000';
         */
        addThousandSeparatorCommas:function(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        },

        /**
         * 날짜 Format변경(checkDate 함수에서 사용.)
         * 예> var result=dms.string.setDateFormat('2014', '05', '20', 'MMDDYYYY', '/');
         *     result = '05/20/2014';
         */
        setDateFormat: function(y, m, d, format, gb) {
            format = format.split("YYYY").join(y + gb);
            format = format.split("MM").join(m + gb);
            format = format.split("DD").join(d);
            return format.substr(0,10);
        },

        /**
         * 날짜 Validation 체크: Input박스에서 입력된 날짜 값에 대한 Validation 체크
         * 예> var result=dms.string.checkDate(obj, '20150513', 'date', '/', 'MMDDYYYY');
         *     result = '05/13/2015';
         */
        checkDate:function(obj, strings, type, gbn, fmt) {
            var year_data = "",
                month_data = "",
                date_data = "",
                rt_date = "",
                mnthst,
                mnth,
                dy,
                strValue,
                resultObj = {result: true, resultMsg: '', resultArgs: ''},
                i;


            if(dms.string.isEmpty(gbn)){
                gbn = '-';
            }

            if(dms.string.isEmpty(fmt)){
                fmt = 'YYYYMMDD';
            }

            strValue = strings.replace(/[^\d]/g, '');
            for (i = 0; i < 8; i++) {
                var c = strValue.charAt(i);
                if (c < '0' || c > '9') {
                    //alert('날짜형식에 맞는지 확인하세요!');
                    obj.focus();
                    resultObj.result = false;
                    return (resultObj);
                }

                if (i < 4)
                    year_data += c;
                else if (i >= 4 && i < 6)
                    month_data += c;
                else if (i >= 6)
                    date_data += c;
            }

            mnthst = month_data;
            mnth   = parseInt(mnthst, 10);
            dy     = parseInt(date_data);

            if (mnth > 12 || mnth < 1) {
                //alert("날짜가 잘못 입력되었습니다.");
                obj.focus();
                resultObj.result = false;
                return (resultObj);
            }

            if (mnth != 2) {
                if (mnth == 4 || mnth == 6 || mnth == 9 || mnth == 11) {
                    if (dy > 30 || dy < 1) {
                        //alert("날짜가 30일을 초과할수가 없습니다.");
                        var exceedDt = '30';
                        obj.focus();
                        resultObj.result = false;
                        resultObj.resultArgs = exceedDt;
                        return (resultObj);
                    }
                } else if (mnth == 1 || mnth == 3 || mnth == 5 || mnth == 7 || mnth == 8 || mnth == 10 || mnth == 12) {
                    if (dy > 31 || dy < 1) {
                        //alert("날짜가 31일을 초과할수가 없습니다.");
                        var exceedDt = '31';
                        obj.focus();
                        resultObj.result = false;
                        resultObj.resultArgs = exceedDt;
                        return (resultObj);
                    }
                }
            } else {
                var yr1 = parseInt(year_data);
                var leapYrTest = yr1 % 4;
                var maxdy;
                if ((yr1 % 400 == 0) || ((yr1 % 4 == 0) && (yr1 % 100 != 0))) {
                    maxdy = 29;
                } else {
                    maxdy = 28;
                }

                if (dy > maxdy) {
                    //alert("날짜가 " + maxdy + "일을 초과할수가 없습니다.");
                    obj.focus();
                    resultObj.result = false;
                    resultObj.resultArgs = maxdy;
                    return (resultObj);
                }
            }

            if (type === 'date') {
                if(resultObj.result === true){
                    resultObj.resultMsg = this.setDateFormat(year_data, month_data, date_data, fmt, gbn);
                }

                return resultObj;
            } else {

                return (resultObj);
            }
        },

        /**
         * input박스에 숫자만 입력받기
         */
        numberHandler: function(e) {
            var e = e || window.event, keyId = (e.which) ? e.which:e.keyCode;
            if ((keyId >= 48 && keyId <= 57) || (keyId >= 96 && keyId <= 105) || keyId == 35 || keyId == 36 || keyId == 37 || keyId == 39 // 방향키
                    // 좌우,home,end
                    || keyId == 8 || keyId == 46 || keyId == 9 // del, back space,
            // tab
            ) {
                return;
            } else {
                return false;
            }
        },

        /**
         * 왼쪽 채움
         * lpad('1234', '0', 8);     // 00001234
         */
        lpad: function(s, c, n) {
            if (! s || ! c || s.length >= n) {
                return s;
            }

            var max = (n - s.length)/c.length;
            for (var i = 0; i < max; i++) {
                s = c + s;
            }

            return s;
        },

        /**
         * 오른쪽 채움
         * rpad('1234', '0', 8);     // 12340000
         */
        rpad: function(s, c, n) {
            if (! s || ! c || s.length >= n) {
                return s;
            }

            var max = (n - s.length)/c.length;
            for (var i = 0; i < max; i++) {
                s += c;
            }

            return s;
        },

        /**
         * 파일사이즈 포맷
         */
        formatFileSize: function(size){
            if (size < 1024) {
                return size + ' bytes';
            } else if (size < 1024 * 1024) {
                return (size / 1024.0).toFixed(0) + ' KB';
            } else if (size < 1024 * 1024 * 1024) {
                return (size / 1024.0 / 1024.0).toFixed(1) + ' MB';
            } else {
                return (size / 1024.0 / 1024.0 / 1024.0).toFixed(1) + ' GB';
            }
        },

        /**
         *
         */
        parseClipboardDataToExcelFormat:function(){
            var data = [];
            var value = $.trim(window.clipboardData.getData("Text"));

            if(value === "parseClipboardDataToExcelFormat")
                value = "";

            if(!dms.string.isEmpty(value)){
                var rows = value.split("\r\n");

                for(var i=0; i<rows.length; i++) {
                   data[i] = rows[i].split("\t");
                }
            }

            return data;
        },

        /**
         * 문자열의 byte수를 반환한다.
         */
        byteLength:function(s,b,i,c) {
            for(b=i=0; c=s.charCodeAt(i++); b+=c>>11?3:c>>7?2:1);
            return b;
        },

        /**
         * 문자열의 HTML 문자를 치환한다.
         */
        htmlEscape:function(str) {
            return str
                .replace(/&/g, '&amp;')
                .replace(/"/g, '&quot;')
                .replace(/'/g, '&#39;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;');
        },

        /**
         *
         */
        htmlUnescape:function(str){
            return str
                .replace(/&quot;/g, '"')
                .replace(/&#39;/g, "'")
                .replace(/&lt;/g, '<')
                .replace(/&gt;/g, '>')
                .replace(/&amp;/g, '&');
        }

    };

    dms.date = {
        isValidPeriod:function(fromDate, toDate, errorCallback){
        	//var callback = errorCallback||function(fromDate, toDate){};

        	if(fromDate == null || toDate == null){
        		return true;
        	}

        	if(typeof fromDate != typeof toDate){
        		return false;
        	}

        	if(fromDate > toDate){
        		//callback(fromDate, toDate);
        		return false;
        	}

        	return true;
        }
    };

    dms.idGen = {
    	rand : Math.floor(Math.random() * 26) + Date.now()
    	,getId : function(){
    		return this.rand++;
    	}
    };

    dms.resize = {
        tabContentIframResize:function(){
            try {
                var tabIframe = jQuery(parent.document).find("iframe[name=tabContentIframe]");

                if(tabIframe.length > 0) dms.resize.iFrameResize(tabIframe);
            } catch(e) {}
        },

        iFrameResize:function(target){
            var iframe = jQuery(target);

            try{
                iframe.contents().height();
            }catch(error)
            {
                iframe.height(600);
                return;
            }

            var windowHeight = jQuery(window).height();
            var conHeight = iframe.contents().height();

/*              if(windowHeight > conHeight){
                    iframe.height(windowHeight-5);
                }else{*/
                iframe.height(conHeight+20);
/*              }*/

            return conHeight;
        }
    };

    dms.loading = {
        show:function(target, backgroundColor){

            var cssObj = {
                top:0
                ,left:0
                ,width:"100%"
                ,height:"100%"
                ,zIndex:50000
                ,position:"fixed"
            };

            if(target === "undefined" || target == null){
                target = $("body")[0];

                if(backgroundColor){
                    cssObj.backgroundColor = backgroundColor;
                }
            }else{
                var position = target.position();
                cssObj.top = position.top;
                cssObj.left = position.left;

                if(target.css("width")){
                    cssObj.width = target.css("width");
                }else{
                    cssObj.width = target.innerWidth();
                }

                if(target.css("height")){
                    cssObj.height = target.css("height");
                }else{
                    cssObj.height = target.innerHeight();
                }

                if(backgroundColor){
                    cssObj.backgroundColor = backgroundColor;
                }
            }

            $("<div/>").appendTo(target)
                .css(cssObj)
                .addClass("k-loading-mask")
                .addClass("dms-loading-mask")
                .append("<span class=\"k-loading-text\">Loading...</span>")
                .append("<div class=\"k-loading-image\"></div>")
                .append("<div class=\"k-loading-color\"></div>");
        },
        hide:function(target) {
            if(target === "undefined" || target == null){
                target = $("body")[0];
            }

            $(target).find("div.dms-loading-mask").remove();
        },
        gridNoData:function(gridId, msg) {
            var grid = $("#"+gridId).data("kendoGrid");
            if (grid.dataSource.data().length === 0) {
                dms.loading.appendNoDataDiv($("#"+gridId+" div.k-grid-content"), msg);
            }else{
                dms.loading.removeNoDataDiv($("#"+gridId+" div.k-grid-content"));
            }
        },
        appendNoDataDiv:function($target, msg) {
            $('<div class=\"empty-grid\" style=\"width:auto;\">'+msg+'<div/>').appendTo($target);

            var left  = $target.innerWidth()/2-77;
            if(left < 0){
                left = 5;
            }
            $target.find("div.empty-grid").css({position:"absolute", left:left, top:$target.innerHeight()/2-8, width:"auto", height:"auto"});
        },
        removeNoDataDiv:function($target) {
            $target.find("div.empty-grid").remove();
        }
    };

    dms.ajax = {
        getJson:function(settings){
            this.options = {
                type:"post"
                ,dataType:"json"
                ,contentType:"application/json"
                ,async:true
            };

            $.extend(true, this.options, settings);

            return $.parseJSON($.ajax(this.options).responseText);
        },


        excelExport:function(params) {

        	var excelExportId = dms.idGen.getId();
            var queryString = "excelExportId="+excelExportId;

            $.each(params, function(key, value){
                queryString += "&" + key + "=" + encodeURIComponent(value);
            });

            dms.loading.show();

            location.href = _contextPath + "/cmm/sci/excelDownload.do?" + queryString;

            var interval = setInterval(function(){
            	$.ajax({
                    url:_contextPath + "/cmm/sci/excelDownloadStatus.do?excelExportId="+excelExportId
                    ,type:'GET'
                    ,dataType:'json'
                    ,error:function(jqXHR, status, error) {
                    	clearInterval(interval);
                    	dms.loading.hide();
                    }
                    ,success:function(jqXHR, textStatus) {
                    	if(jqXHR.status != 1 && jqXHR.status != 2){
                    		clearInterval(interval);
                    		dms.loading.hide();
                    	}
                    }
                });
            }, 500);
        },

        excelProgressExport:function(params, maxRow, fileCnt, downCnt) {

            console.log("excel Export");
            var excelExportId = dms.idGen.getId();
            var queryString = "excelExportId="+excelExportId;

            $.each(params, function(key, value){
                queryString += "&" + key + "=" + encodeURIComponent(value);
            });

            if (!$(this).hasClass("k-state-disabled")) {
                $(this).addClass("k-state-disabled");
            }
            var pb = $("#progressBar").data("kendoProgressBar");
            pb.options.max = maxRow;
            pb.value(0);


            dms.loading.show();

            location.href = _contextPath + "/cmm/sci/excelDownload.do?" + queryString;

            var interval = setInterval(function(){
                $.ajax({
                    url:_contextPath + "/cmm/sci/excelDownloadStatus.do?excelExportId="+excelExportId
                    ,type:'GET'
                    ,dataType:'json'
                    ,error:function(jqXHR, status, error) {
                        clearInterval(interval);
                        dms.loading.hide();
                        pb.value(maxRow);
                    }
                    ,success:function(jqXHR, textStatus) {
                        if(jqXHR.status != 1 && jqXHR.status != 2){
                            clearInterval(interval);
                            dms.loading.hide();

                            pb.value(maxRow);
                            hideProgressBar();
                            downCnt++;
                            //console.log("fileCnt : "+fileCnt +", downCnt : "+ downCnt);
                            if(downCnt < fileCnt){
                                callExcelDownload(maxRow*downCnt, maxRow*(downCnt+1), maxRow, fileCnt, downCnt);
                            }
                        }
                        if (pb.value() < maxRow) {
                            pb.value(pb.value() + (maxRow/150));
                        }
                    }
                });
            }, 3000);
        }


    };

	dms.data = {

	    /**
	     * 배열을 맵으로 변환한다.
	     * @param arr 배열
	     * @param keyNameHandler 맵의 키값을 반환하는 펑션
	     * ex) dms.data.arrayToMap(arr, function(obj){ return obj.cmmCd; })
	     */
	    arrayToMap:function(arr, keyNameHandler){
	        var result = arr.reduce(function(map, obj){
	            map[keyNameHandler(obj)] = obj;
	            return map;
	        }, {});

	        return result;
	    },

	    arrayFilter:function(arr, callback) {
	       return arr.filter(callback);
	    },

	    cmmCdFilter:function(arr) {
	       return this.arrayFilter(arr, function(element, index, array){
	           return element.useYn !== "N";
	       });
	    },

	    /**
	     * 공통코드 데이터를 조회한다.
	     */
	    getCmmCdList:function(settings){

	        this.options = {
	            async:true
	            ,isAppendEmptyData:false
	            ,useYn:"Y"
	            ,cmmGrpCd:""
	            ,remark1:""
	            ,remark2:""
	            ,remark3:""
	            ,remark4:""
	            ,remark5:""
	            ,remark6:""
	            ,remark7:""
	            ,remark8:""
	            ,remark9:""
	            ,remark10:""
	        };

	        $.extend(this.options, settings);

	        var responseJson = dms.ajax.getJson({
	           async:false
	           ,url:_contextPath + "/cmm/sci/commonCode/selectCommonCodes.do"
	           ,data:JSON.stringify({
                   "sCmmGrpCd":this.options.cmmGrpCd
                   ,"sUseYn":this.options.useYn
                   ,"sRemark1":this.options.remark1
                   ,"sRemark2":this.options.remark2
                   ,"sRemark3":this.options.remark3
                   ,"sRemark4":this.options.remark4
                   ,"sRemark5":this.options.remark5
                   ,"sRemark6":this.options.remark6
                   ,"sRemark7":this.options.remark7
                   ,"sRemark8":this.options.remark8
                   ,"sRemark9":this.options.remark9
                   ,"sRemark10":this.options.remark10
               })
	        });


//	        var response = $.ajax({
//                url:_contextPath + "/cmm/sci/commonCode/selectCommonCodes.do"
//                ,data: JSON.stringify({
//                    "sCmmGrpCd":this.options.cmmGrpCd
//                    ,"sUseYn":this.options.useYn
//                    ,"sRemark1":this.options.remark1
//                    ,"sRemark2":this.options.remark2
//                    ,"sRemark3":this.options.remark3
//                    ,"sRemark4":this.options.remark4
//                    ,"sRemark5":this.options.remark5
//                    ,"sRemark6":this.options.remark6
//                    ,"sRemark7":this.options.remark7
//                    ,"sRemark8":this.options.remark8
//                    ,"sRemark9":this.options.remark9
//                    ,"sRemark10":this.options.remark10
//                })
//                ,type: "POST"
//                ,dataType:"json"
//                ,contentType:"application/json"
//                ,async:this.options.async
//            }).responseText;

	        if(this.options.isAppendEmptyData){
                return [{
                    "cmmGrpCd":this.options.cmmGrpCd
                    ,"cmmCd":""
                    ,"cmmCdNm":""
                    ,"useYn":"Y"
                    ,"sortOrder":"0"
                    ,"remark1":""
                    ,"remark2":""
                    ,"remark3":""
                    ,"remark4":""
                    ,"remark5":""
                    ,"remark6":""
                    ,"remark7":""
                    ,"remark8":""
                    ,"remark9":""
                    ,"remark10":""
                //}].concat($.parseJSON(response).data);
	            }].concat(responseJson.data);
            }

            return responseJson.data;
	    }

	};


	dms.format = {
		currency: function(amt, currencyCode, isDisplaySymbol){
			var currencyObj;
			var currencyFormat;

			if (typeof currencyCode === "undefined" || currencyCode === null) {
				currencyCode = dms.settings.defaultCurrency;
			}
			if (typeof isDisplaySymbol === "undefined" || isDisplaySymbol === null) {
				isDisplaySymbol = false;
			}

			currencyCode = currencyCode.toUpperCase();

			if(dms.settings.currency[currencyCode]){
				currencyObj = dms.settings.currency[currencyCode];
			}else{
				currencyObj = dms.settings.currency[dms.settings.defaultCurrency];
			}

			if(currencyObj.decimals == 0){
				currencyFormat = kendo.format("\#{0}\#\#\#", currencyObj.numberSymbol);
			}else{
				currencyFormat = kendo.format("\#{0}\#\#\#{1}{2}", currencyObj.numberSymbol, currencyObj.decimalSymbol, dms.string.lpad('0', '0', currencyObj.decimals));
			}

			if(isDisplaySymbol){
				if(currencyObj.position == "P"){
					return kendo.format("{0}{1:"+currencyFormat+"}", currencyObj.symbol, amt);
				}else{
					return kendo.format("{0:"+currencyFormat+"}{1}", amt, currencyObj.symbol);
				}
			}

			return kendo.format("{0:"+currencyFormat+"}", amt);
		},

		currencyFormat: function(currencyCode){
			var currencyObj;
			var currencyFormat;

			if (typeof currencyCode === "undefined" || currencyCode === null) {
				currencyCode = dms.settings.defaultCurrency;
			}

			currencyCode = currencyCode.toUpperCase();

			if(dms.settings.currency[currencyCode]){
				currencyObj = dms.settings.currency[currencyCode];
			}else{
				currencyObj = dms.settings.currency[dms.settings.defaultCurrency];
			}

			if(currencyObj.decimals == 0){
				currencyFormat = kendo.format("\#{0}\#\#\#", currencyObj.numberSymbol);
			}else{
				currencyFormat = kendo.format("\#{0}\#\#\#{1}{2}", currencyObj.numberSymbol, currencyObj.decimalSymbol, dms.string.lpad('0', '0', currencyObj.decimals));
			}

			return currencyFormat;
		}
	};

	dms.fileManager = {
        download:function(fileDocNo, fileNo){
            if(!dms.fileManager.exist(fileDocNo, fileNo)){
                dms.notification.error(dms.settings.defaultMessage.fileNotFound);
                return;
            }

            location.href = _contextPath + "/cmm/sci/fileUpload/selectFileDownload.do?fileDocNo=" + fileDocNo + "&fileNo=" + fileNo;
        }
	    ,preview:function(fileDocNo, fileNo, popupWidth, popupHeight, popupTitle){
	        if(!dms.fileManager.exist(fileDocNo, fileNo)){
	            dms.notification.error(dms.settings.defaultMessage.fileNotFound);
	            return;
            }

	        var title = popupTitle || dms.settings.defaultMessage.preview;
	        var width = popupWidth || 950;
	        var height = popupHeight || 500;

	        dms.window.popup({
	            windowId:"filePreviewPopup"
	            ,width:width
	            ,height:height
	            ,title:title
	            ,modal:true
	            ,content:{
	                url:_contextPath + "/cmm/sci/fileUpload/selectFileDownload.do?fileDocNo=" + fileDocNo + "&fileNo=" + fileNo + "&inline=true"
	            }
	        });
	    }
	    ,exist:function(fileDocNo, fileNo){
	        var result = false;
	        $.ajax({
                url:_contextPath + "/cmm/sci/fileUpload/selectExistFile.do"
                ,data:"fileDocNo="+fileDocNo+"&fileNo="+fileNo
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,error:function(jqXHR, status, error) {
                }
                ,success:function(data, textStatus, jqXHR) {
                    result = data;
                }
            });

	        return result;
	    }
    };

	dms.utils = {
        // Copies a string to the clipboard. Must be called from within an
        // event handler such as click. May return false if it failed, but
        // this is not always possible. Browser support for Chrome 43+,
        // Firefox 42+, Safari 10+, Edge and IE 10+.
        // IE: The clipboard feature may be disabled by an administrator. By
        // default a prompt is shown the first time the clipboard is
        // used (per session).
	    copyToClipboard:function(text) {
	        if(window.clipboardData && window.clipboardData.setData){
	            // IE specific code path to prevent textarea being shown while dialog is visible.
	            return clipboardData.setData("Text", text);
	        }else if(document.queryCommandSupported && document.queryCommandSupported("copy")){
	            var textarea = document.createElement("textarea");
	            textarea.textContent = text;
	            textarea.style.position = "fixed";        // Prevent scrolling to bottom of page in MS Edge.
	            document.body.appendChild(textarea);
	            textarea.select();
	            try{
	                return document.execCommand("copy");  // Security exception may be thrown by some browsers.
	            }catch(ex){
	                console.warn("Copy to clipboard failed.", ex);
	                return false;
	            }finally{
	                document.body.removeChild(textarea);
	            }
	        }
	    }
	};

	dms.fineReport = {
	    /***
	     * 파인리포트 빠른인쇄 기능 제공
	     * @params url 리포트 URL
	     * @params isPopUp 파인리포트 인쇄설정 팝업 출력여부
	     * @params isAutoZoom 종이크기에따라 축소 여부
	     */
	    print:function(url, isPopUp, isAutoZoom){
	        var fineReportPrintFrame = $("#fineReportPrintFrame");

	        if(fineReportPrintFrame.length == 0){
	            fineReportPrintFrame = $("<iframe />");
	            fineReportPrintFrame.css({"position":"absolute","margin-left":"-150px"});
	            fineReportPrintFrame.attr("width", 100);
	            fineReportPrintFrame.attr("height", 100);
	            fineReportPrintFrame.attr("src", _contextPath + "/finereport_print.jsp");
	            $("body").append(fineReportPrintFrame);

	            fineReportPrintFrame.load(function(){
	                fineReportPrintFrame[0].contentWindow.doPrint(url, isPopUp, isAutoZoom);
	            });
	        }else{
	            fineReportPrintFrame[0].contentWindow.doPrint(url, isPopUp, isAutoZoom);
	        }
	    }
	};

	dms.parts = {
        /***
         * 부품가격 계산(보증판매가)
         * @params itemPrc 부품원가
         * @params markUp 마크업
         * @params itemQty 아이템수량
         * @params tax 세율
         */
	    calculate:function(itemPrc, markUp, itemQty, tax){

            if(markUp == null || markUp == ""){
                markUp = 117;
            }

	        var itemSalePrc = ((itemPrc * (markUp / 100) * itemQty).toFixed(2) * (1 + tax)).toFixed(2);

	        return itemSalePrc;
	    }
	};

	window.dms = dms;
}(window, document, jQuery));

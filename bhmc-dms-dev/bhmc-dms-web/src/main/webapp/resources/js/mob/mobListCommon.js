/**
 * Supported Browser : MSIE, Chrome , FireFox
 *
 * Object       : mobListCommon.js.js
 * Description  : DMS 모바일 공통 스크립트
 * Author       : JongHee Lim
 * Since        : 2016. 6. 10.
 * Version      : 1.0
 *
 * Modification Information
 *     since          author              description
 *  ===========    =============    ===========================
 *  JongHee Lim     2016. 6. 10.     최초 생성
 */




/**
 * Null 값을 "" 으로 변환하는 함수
 */
function trimNull(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = val;
    }
    return returnVal;
}


// 소수점 절사
function chgInt(value){
    if(value == null){
        return 0;
    }else if(value == ""){
        return 0;
    }else{
        return (parseInt(value));
    }
}


// 미사용
function fnFixNum(strValue, strType){
    var iType = parseInt(strType);
    switch(iType){
        case 0 : // 절사
            return (parseInt(strValue));
            break;
        case 1 : // 반올림
            if(strValue<0){ // 음수일 경우
                if((Math.abs(strValue)+0.5) - (parseInt(Math.abs(strValue)+0.5))==0){
                    return ((parseInt(Math.abs(strValue)+0.5)*-1)+1);
                }else{
                    return (parseInt(Math.abs(strValue)+0.5)*-1);
                }
            }else{ // 양수일 경우
                return (parseInt(strValue+0.5));
            }
            break;
        case 2: // 올림
            if((value - parseInt(strValue)) >= 0.1){
                return (parseInt(strValue) + 1);
            }
            if((value - parseInt(strValue)) <= 0.1){
                return (parseInt(strValue) -1);
            }
            break;
    }
}


/**
 * Statements
 * @param objName
 *@param strDf : <dms:configValue code='dateFormat' /> ---> 각 contents 페이지 전역 변수로 변경 dateFormat
 */
//function calpicker(objName, strDf){

/** 문자열 -> Date 변환함수
 * param : 문자열 yyyy-mm-dd
 * return : date형
 */
function chgDate(obj){
     if(obj != null && obj != ""){
         var year = obj.substring(0,4);
         var month = obj.substring(5,7);
         var day = obj.substring(8,10);
         var date = new Date(Number(year),Number(month)-1,Number(day));
         return date;
      }else{
        return null;
      }
}

/** 문자열 -> Date 변환함수
 * param : 문자열 yyyy-mm-dd hh:MM:ss
 * return : date형
 */
function chgDateTimeStamp(obj){
     if(obj != null && obj != ""){
         var year = obj.substring(0,4);
         var month = obj.substring(5,7);
         var day = obj.substring(8,10);
         var time = obj.substring(11,13);
         var minute = obj.substring(14,16);
         var second = obj.substring(17,19);

         var date = new Date(Number(year),Number(month)-1,Number(day),Number(time),Number(minute),Number(second));
         return date;
      }else{
        return null;
      }
}

/** 문자열 -> Date 변환함수
 * param : 문자열 yyyy-mm-dd hh:MM
 * return : date형
 */
function chgDateTimeStamphhMM(obj){
     if(obj != null && obj != ""){
         var year = obj.substring(0,4);
         var month = obj.substring(5,7);
         var day = obj.substring(8,10);
         var time = obj.substring(11,13);
         var minute = obj.substring(14,16);

         var date = new Date(Number(year),Number(month)-1,Number(day),Number(time),Number(minute));
         return date;
      }else{
        return null;
      }
}
/** Date -> 문자열 변환함수
 * param : 문자열 yyyy-mm-dd
 * return : date형 String
 */
function chgDate2Str(obj){
     if(obj != null && obj != "" && 10 < obj.length){
         return obj.substring(0,4) +"-" + obj.substring(5,7)+"-"+obj.substring(8,10);
      }else{
        return "";
      }
}

/** Date -> 문자열 변환함수(hh:MM)
 * param : 문자열 yyyy-mm-dd hh:MM:ss
 * return : date형 String
 */
/*function chgDate2TimeStr(obj){
     if(obj != null && obj != "" &&  15 < obj.length){
         return obj.substring(11,13) +":" + obj.substring(14,16);
      }else{
        return "";
      }
}*/
function chgDate2TimeStr(obj){
    if(obj != null && obj != ""){
        var _date = dateGenerator(obj);
        var hh = _date.getHours();
        if(hh < 10){
            hh = "0" + hh;
        }

        var mi = _date.getMinutes();
        if(mi < 10){
            mi = "0" + mi;
        }

        var se = _date.getSeconds();
        if(se < 10){
            se = "0" + se;
        }

        return hh+":"+mi;
    }else{
        return "";
    }
}

/** Date -> 문자열 변환함수(hh:MM)
 * param : 문자열 yyyy-mm-dd hh:MM:ss
 * return : date형 String
 */
function chgDate2DateTimeStr(obj){
     if(obj != null && obj != "" &&  15 < obj.length){
         return chgDate2Str(obj) +" "+chgDate2TimeStr(obj);
      }else{
        return "";
      }
}



/** Server Date -> 문자열 변환함수
 * param : date형
 * return : 문자열 yyyy-mm-dd
 */
function chgServerDate2Str(obj){
    if(obj != null && obj != ""){
        var _date = dateGenerator(obj);
        var yy = _date.getFullYear();
        var mm = _date.getMonth() + 1;
        if(mm < 10){
            mm = "0" + mm;
        }
        var dd = _date.getDate();
        if(dd < 10){
            dd = "0" + dd;
        }
        return yy+"-"+mm+"-"+dd;
    }else{
        return "";
    }
}

function dateGenerator(date) {
    var _date;
    try{
        if(typeof date == "string") {
            var s = date.replace(/[ :]/g, "-").split("-");
            switch(s.length) {
                case 6:
                    _date = new Date(s[0], (parseInt(s[1])-1)+"", s[2], s[3], s[4], s[5]);   //yyyy, MM, dd, hh, mi, se
                    break;
                case 5:
                    _date = new Date(s[0], (parseInt(s[1])-1)+"", s[2], s[3], s[4]);     //yyyy, MM, dd, hh, mi
                    break;
                case 3:
                    _date = new Date(s[0], (parseInt(s[1])-1)+"", s[2]);           //yyyy, MM, dd
                    break;
                default :
                    _date = new Date(date);
            }
        }else {
            _date = new Date(date);
        }
        return _date;
    }catch(e){

    }
}

//HH:MM형식에서 24시간초과 데이터에 대하여 00시로 변환
function changeTimeToZero(str){
    if(str.indexOf("24:") > -1){
        str = str.replace("24:","00:");
    }
    return str;
}


var mob = {};

$(document).ready(function() {


    // menu active
    $("#gnb > li > span, #gnb > li.nav_allmenu > ul > li > ul > li > span").click(function(){
        $(this).parent().toggleClass("active");
    });
    $("#gnb > li.nav_allmenu > ul > li > span").click(function(){
        if($(this).parent().hasClass("active") === true){
            $(this).parent().removeClass("active");
        }
        else{
            $(this).parent().siblings().removeClass("active");
            $(this).parent().addClass("active");
        }
    });

    //btn_favorites toggle
    $("#gnb .btn_favorites").click(function(){
        $(this).toggleClass("active");
    });



    mob.notification = {
        show : function(messages, notificationType) {
            var tapTimer, isTapHold = false;
            var layerPopStr = "";
            layerPopStr += '<section id="lay_pop" class="lay_pop">';
            layerPopStr += '    <div class="lay_cont">';
            layerPopStr += '        <span class="date"></span>';
            layerPopStr += '        <span class="contents"></span>';
            layerPopStr += '    </div>';
            layerPopStr += '    <div class="btnarea">';
            //layerPopStr += "        <a onclick='layerClose(\"lay_pop\");'><spring:message code='global.btn.close'/>\r\n</a>"; // 메시지코드 적용적용안됨
            layerPopStr += "        <span class='btnd1' onclick='layerClose(\"#lay_pop\");'>关闭</span>";
            layerPopStr += '    </div>';
            layerPopStr += '</section>';
            $("#mwrap").append(layerPopStr);

            if(notificationType=="info"){
                //$(".lay_cont .date").text("<spring:message code='global.lbl.info'/>");// 메시지코드 적용적용안됨
                $(".lay_cont .date").text("提醒");
            }
            $(".lay_cont .contents").text(messages);
            //pushLayer('300','220');
            parent.pushLayer('#lay_pop');

        },
        info : function(messages) {
            this.show(messages, "info");
        },
        success : function(messages) {
            this.show(messages, "success");
        },
        warning : function(messages) {
            this.show(messages, "warning");
        },
        error : function(messages) {
            this.show(messages, "error");
        }
    };


    mob.window = {
        popup : function(options){
            this.settings = {
                width: "100%"
                ,height: "100%"
                ,animation: false
                ,draggable : false
                ,visible : false
                ,resizable : false
                ,title : false
                ,modal : true
                ,content : {
                    data : {
                        "type" : "default"
                        ,"autoBind" : true
                        ,"selectable" : "single"
                        ,"callbackFunc" : function(data){
                            console.log(data);
                        }
                    }
                }
                ,iframe : true
                ,deactivate : function() {
                    this.destroy();
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

            $("body").append("<div id='" + this.settings.windowId + "' k-window-titleless ></div>");

            var _popupWindow = $("#" + this.settings.windowId).kendoWindow(this.settings).data("kendoWindow");
            _popupWindow.center().open();


            if(window.parent) {

                var _parent = $(window.parent);
                var _top = (_parent.height() - _popupWindow.options.height)/2 + _parent.scrollTop() - 70 ;

                //var _top = 0 ;

                $("#" + this.settings.windowId).closest(".k-window").css({
                    top : _top,
                    // left : -2,
                    "border-width" : "0"

                });
            }

            return _popupWindow;
        }
    };


    mob.format = {
            currency: function(amt, currencyCode){
                if(amt == null || amt == ""){
                    return "0";
                }else{
                    if (typeof currencyCode === "undefined" || currencyCode === null) {
                        return dms.format.currency(amt);
                    }else{
                        return dms.format.currency(amt, currencyCode);
                    }
                }
            }
    };

});



function setKendoMobApp(){
    //var app = new kendo.mobile.Application();
    var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
    //var app = new kendo.mobile.Application($(document.body),{platform:"android-light", useNativeScrolling:true});
    return app;
}


function setKendoMobAppForNativeScroll(){
    //var app = new kendo.mobile.Application();
    //var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
    var app = new kendo.mobile.Application($(document.body),{platform:"android-light", useNativeScrolling:true});
    return app;
}

/*
function checklistCnt(id,cnt,msg) {

    if(cnt == 0){
        if(id == "listarea_noData") {
            parent.$("#"+id).html("<div class='list_nodata'><p>No Result</p></div>");
            parent.$("#"+id).show();
            parent.checklistCntFullDisp(id);

            var listheadH=parent.$("#"+id).siblings(".listhead").height();
            parent.$("#"+id).height(parent.$("#mainList").height());


        } else {
            parent.$("#"+id).html("<div class='list_nodata2'><p>No Result</p></div>");
            parent.$("#"+id).show();


        }
        parent.$("#"+id).parent().find("iframe").css("display", "none");
        //$(".list_nodata > p").css("background-image","none");
    }else{
        //$(".dlistitem").attr("id","listarea_noData2");
        parent.$("#"+id).hide();
        parent.$("#"+id).hide();
        parent.$("#"+id).hide();
        parent.$("#"+id).css("display", "block");
        parent.$("#"+id).parent().find("iframe").css("display", "block");
        //console.log(parent.$("#"+id).parent().find("iframe").html());
        console.log($(".dlistitem").height());
        console.log($(".dlistitem").html());
    }
}
*/
function checklistCnt(id,cnt,msg) {
    //console.log("id : "+id);
    if(cnt == 0){
        if(id == "listarea_noData") {
            //parent.$("#"+id).html("<div class='list_nodata'><p>No Result</p></div>");
            parent.$("#"+id).html("<div class='list_nodata'><p>"+msg+"</p></div>");
            parent.$("#"+id).show();
            parent.checklistCntFullDisp(id);

            var listheadH=parent.$("#"+id).siblings(".listhead").height();
            parent.$("#"+id).height(parent.$("#mainList").height());


        } else if(id == "listarea_noData5"){
            parent.$("#"+id).html("<div class='list_nodata'><p>"+msg+"</p></div>");
            parent.$("#"+id).show();
            parent.checklistCntFullDisp(id);
            var tempHeight=parent.$("#listarea_noData5").siblings("iframe").height();
            parent.$("#listarea_noData5").height(tempHeight);


            var listheadH=parent.$("#"+id).siblings(".listhead").height();
            parent.$("#"+id).height(parent.$("#mainList").height());
        }else if(id == "listarea_noData9"){
            parent.$("#"+id).html("<div class='list_nodata'><p>"+msg+"</p></div>");
            parent.$("#"+id).show();
            parent.checklistCntFullDisp(id);

            var listheadH=parent.$("#"+id).siblings(".listhead").height();
            parent.$("#"+id).height(parent.$("#mainList").height());
        }else {
            //parent.$("#"+id).html("<div class='list_nodata2'><p>No Result</p></div>");
            parent.$("#"+id).html("<div class='list_nodata2'><p>"+msg+"</p></div>");
            parent.$("#"+id).show();


        }
        parent.$("#"+id).parent().find("iframe").css("display", "none");
    }else{
        parent.$("#"+id).hide();
        parent.$("#"+id).parent().find("iframe").css("display", "block");
        console.log(parent.$("#"+id).parent().find("iframe").html());
        console.log($(".dlistitem").height());
        console.log($(".dlistitem").html());
    }
}




function comma(str) {
    if(str == null || str == ""){
        return "";
    }

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//콤마찍기 공백시 0
function commaZero(str) {
    if(str == null || str == ""){
        return "0";
    }
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function checkResultForChrom(cnt) {
    if(cnt>0){
        parent.$("#listarea_noData").remove();
        parent.$("#mainList").show();
    }else{

        parent.$("#mainList").hide();
        var mainListH=parent.$("#mainList").height()-50;
        parent.$("#listarea_noData").remove();
        parent.$( "<div class='dlistitem bgNone' style='height: "+mainListH+"px;' id='listarea_noData'><div class='list_nodata'><p>No Result</p></div></div>" ).insertAfter( "#mainList" );

    }
}
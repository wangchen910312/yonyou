$(window).resize(function(){
    //gnbMenu();
    setMainListHeight();
    checklistCntFullDisp('listarea_noData');
});

/**
 * Supported Browser : MSIE, Chrome , FireFox
 *
 * Object       : mobCommon.js.js
 * Description  : DMS 모바일 공통 스크립트
 * Author       : JongHee Lim
 * Since        : 2016. 4. 14.
 * Version      : 1.0
 *
 * Modification Information
 *     since          author              description
 *  ===========    =============    ===========================
 *  JongHee Lim     2016. 4. 14.     최초 생성
 */


// popup
function pushLayer(layerName){
    var layerName = $(layerName);
    var layWidth = layerName.width();
    var layHeight = layerName.height();
    var left=($(window).width()-layWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-layHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("body").append("<div class='blind' onclick='layerClose(" + layerName.attr("id") + ")'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(layerName).css({"left":left,"top":top,"display":"block"});
}
function layerClose(layerName){
    $(layerName).css("display","none");
    //$(".lay_pop").css("display","none");
    $(".blind").animate({opacity:'0'},200).queue(function(){$(".blind").remove();});
}

// 바코드 스캔 START
var isAndroid = false;
window.onload = function(){
    if(/(iPhone|iPod|iPad)/i.test(navigator.userAgent))
    {
        isAndroid = false;
    }else{
        isAndroid = true;
    }
    // form common - focus event
    $("input, select").focus(function(){
        $(this).parent("div").addClass("f_focus");
    }).blur(function(){
        $(this).parent("div").removeClass("f_focus");
    })
};


function openBarcodeReader(rtnFunc){
    if(isAndroid){
        window.wjcp.openBarcodeReader(rtnFunc);
    }else{
        location.href = "wjcp://openBarcodeReader"+encodeURI("?#"+rtnFunc);
    }
};
//바코드 스캔 END


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


var objCal;
/**
 * Statements
 * @param objName
 *@param strDf : <dms:configValue code='dateFormat' /> ---> 각 contents 페이지 전역 변수로 변경 dateFormat
 */
//function calpicker(objName, strDf){
function calpicker(objName){
    objCal = $("#" + objName);
    var currDate = objCal.val();
    //var dt_curr = (currDate == null || currDate == "" || currDate.length < 10 ?  new Date() : kendo.parseDate(currDate, strDf));
    var dt_curr = (currDate == null || currDate == "" || currDate.length < 10 ?  new Date() : kendo.parseDate(currDate, dateFormat));
    setCalendar(dt_curr);
    var pickerWidth = $(".m_calpicker").innerWidth();
    var pickerHeight = $(".m_calpicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_calpicker").css({"left":left,"top":top,"display":"block"});
}


/**
 *
 * Statements
 * @param objName
 * @param strY - mobile.lbl.year ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strM - mobile.lbl.month ---> defaultMobTemplate페이지 전역 변수로 변경
 * @returns
 */
//function datepicker(objName, strY, strM){
function datepicker(objName){
    objCal = $("#" + objName);
    var currDate = objCal.val();
    var selYear = (currDate == null || currDate == "" || currDate.length) < 6 ?  (new Date()).getFullYear() : parseInt(currDate.substring(0, 4));
    $("#prevYear2").text((parseInt(selYear) - 1) + " " + strY);
    $("#selectYear2").text(selYear + " " + strY);
    $("#nextYear2").text((parseInt(selYear) + 1) + " " + strY);
    var selMonth = (currDate == null || currDate == "" || currDate.length < 6) ? ((new Date()).getMonth() + 1) : parseInt(currDate.substring(currDate.length - 2));
    $("#prevMonth2").text(((parseInt(selMonth) - 1) + (((parseInt(selMonth) - 1) < 1) ? 12 : 0 )) + " " + strM);
    $("#selectMonth2").text(selMonth + " " + strM);
    $("#nextMonth2").text(((parseInt(selMonth) + 1) - (((parseInt(selMonth) + 1) > 12) ? 12 : 0 )) + " " + strM);
    var pickerWidth = $(".m_datepicker").innerWidth();
    var pickerHeight = $(".m_datepicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_datepicker").css({"left":left,"top":top,"display":"block"});

    $("#btnMonthConfirm").unbind("click");
    //datepickerCallBack(objName,callBackFnc) 함수와 공통사용으로 unbind후 재bind 사용
    $("#btnMonthConfirm").bind("click", function() {
        var selYear = $("#selectYear2").text().split(" ");
        var selMonth = $("#selectMonth2").text().split(" ");

        dt_curr = selYear[0] + "-" + (selMonth[0].length > 1 ? "" : "0") + selMonth[0];
        objCal.val(dt_curr);
        pickerClose();
    });
}

/**
*
* Statements
* @param objName
* @param strY - mobile.lbl.year ---> defaultMobTemplate페이지 전역 변수로 변경
* @param strM - mobile.lbl.month ---> defaultMobTemplate페이지 전역 변수로 변경
* @returns
*/
////datepickerCallBack(objName) 함수에서 callback함수 추가
function datepickerCallBack(objName,callBackFnc){

    objCal = $("#" + objName);
    var currDate = objCal.val();
    var selYear = (currDate == null || currDate == "" || currDate.length) < 6 ?  (new Date()).getFullYear() : parseInt(currDate.substring(0, 4));
    $("#prevYear2").text((parseInt(selYear) - 1) + " " + strY);
    $("#selectYear2").text(selYear + " " + strY);
    $("#nextYear2").text((parseInt(selYear) + 1) + " " + strY);
    var selMonth = (currDate == null || currDate == "" || currDate.length < 6) ? ((new Date()).getMonth() + 1) : parseInt(currDate.substring(currDate.length - 2));
    $("#prevMonth2").text(((parseInt(selMonth) - 1) + (((parseInt(selMonth) - 1) < 1) ? 12 : 0 )) + " " + strM);
    $("#selectMonth2").text(selMonth + " " + strM);
    $("#nextMonth2").text(((parseInt(selMonth) + 1) - (((parseInt(selMonth) + 1) > 12) ? 12 : 0 )) + " " + strM);

    var pickerWidth = $(".m_datepicker").innerWidth();
    var pickerHeight = $(".m_datepicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;

    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_datepicker").css({"left":left,"top":top,"display":"block"});

    //datepickerCallBack(objName) 함수와 공통사용으로 unbind후 재bind 사용
    $("#btnMonthConfirm").unbind("click");
    $("#btnMonthConfirm").bind("click", function() {
        var selYear = $("#selectYear2").text().split(" ");
        var selMonth = $("#selectMonth2").text().split(" ");

        dt_curr = selYear[0] + "-" + (selMonth[0].length > 1 ? "" : "0") + selMonth[0];
        objCal.val(dt_curr);
        callBackFnc(dt_curr);
        pickerClose();
    });
}

/**
 * Statements
 * @param objName
 * @param strPm - mobile.lbl.pm ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strAm - mobile.lbl.am ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strHour - mobile.lbl.hour ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strMinute - mobile.lbl.minute ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strSecond - mobile.lbl.second ---> defaultMobTemplate페이지 전역 변수로 변경
 */
//function timepicker(objName, strPm, strAm, strHour, strMinute, strSecond){
function timepicker(objName){

    objCal = $("#" + objName);
    var currDate = objCal.val();
    var ampm = "";
    var hours = 0;
    var minutes = 0;
    var seconds = 0;
    if (currDate == null || currDate == "" || currDate.split(" ").length < 2) {
        var dt_datetime = new Date();
        hours = dt_datetime.getHours();
        ampm = hours >= 12 ? strPm : strAm;
        hours = hours % 12 ? hours % 12 : 12;
        minutes = dt_datetime.getMinutes();
        seconds = dt_datetime.getSeconds();
    }
    else {
        var currDates = currDate.split(" ");
        var currTimes = currDates[1].split(":");
        ampm = currDates[0];
        hours = currTimes[0];
        minutes = currTimes[1];
        seconds = currTimes[2];
    }
    $("#selectAMPM").text(ampm);
    $("#selectHour").text(hours + " " + strHour);
    $("#selectMinute").text(minutes + " " + strMinute);
    $("#selectSecond").text(seconds + " " + strSecond);
    var pickerWidth = $(".m_timepicker").innerWidth();
    var pickerHeight = $(".m_timepicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;

    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_timepicker").css({"left":left,"top":top,"display":"block"});
}
/**
 * Statements
 * @param objName
 * @param strPm - mobile.lbl.pm ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strAm - mobile.lbl.am ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strHour - mobile.lbl.hour ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strMinute - mobile.lbl.minute ---> defaultMobTemplate페이지 전역 변수로 변경
 * @param strSecond - mobile.lbl.second ---> defaultMobTemplate페이지 전역 변수로 변경
 */
function timepicker2(objName){

    objCal = $("#" + objName);
    var currDate = objCal.val();
    var ampm = "";
    var hours = 0;
    var minutes = 0;
    var seconds = 0;
    //hh:mm:ss
    if (currDate == null || currDate == "") {
        var dt_datetime = new Date();
        hours = dt_datetime.getHours();
        ampm = hours >= 12 ? strPm : strAm;
        hours = hours % 12 ? hours % 12 : 12;
        minutes = dt_datetime.getMinutes();
    }
    else {
        var currTimes = currDate.split(":");
        if(currTimes.length == 3) { //hh:mm:ss
            hours = currTimes[0];
            minutes = currTimes[1];
            seconds = currTimes[2];
        } else { //hh:mm
            hours = currTimes[0];
            minutes = currTimes[1];
        }
        //ampm = hours >= 12 ? strPm : strAm;
        ampm = hours > 12 ? strPm : strAm;
        if(ampm == strPm){
            hours = hours % 12 ? hours % 12 : 12;
        }
    }

    $("#selectAMPM2").text(ampm);
    $("#selectHour2").text(parseInt(hours) + " " + strHour);
    $("#selectMinute2").text(parseInt(minutes) + " " + strMinute);
    var pickerWidth = $(".m_timepicker2").innerWidth();
    var pickerHeight = $(".m_timepicker2").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=($(window).height()-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;

    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_timepicker2").css({"left":left,"top":top,"display":"block"});


}
function pickerClose(){
    $(".m_calpicker").css("display","none");
    $(".m_datepicker").css("display","none");
    $(".m_timepicker").css("display","none");
    $(".m_timepicker2").css("display","none");
    $(".blind").animate({opacity:'0'},200).queue(function(){$(".blind").remove();});
}

function setCalendar(dt_datetime){
    $("#selectYear").text(dt_datetime.getFullYear());
    $("#selectMonth").text(dt_datetime.getMonth() + 1);
    $("#selectDate").text(dt_datetime.getDate());

    var dt_today = new Date();
    var dt_firstday = new Date(dt_datetime.getFullYear(), dt_datetime.getMonth(), dt_datetime.getDate());
    dt_firstday.setDate(1);
    dt_firstday.setDate(1 - (dt_firstday.getDay() % 7));

    var dt_current_day = new Date(dt_firstday.getFullYear(), dt_firstday.getMonth(), dt_firstday.getDate());
    for (var ridx = 0; ridx < 6; ridx++) {
        for (var cidx = 0; cidx < 7; cidx++) {
            $("#r" + ridx + "c" + cidx + "td").unbind("click");
            $("#r" + ridx + "c" + cidx + "td").attr("class", "");
            $("#r" + ridx + "c" + cidx + "t").attr("class", "");
            $("#r" + ridx + "c" + cidx + "d").css("color", "");
            $("#r" + ridx + "c" + cidx + "d").text("");
        }
    }

    var ridx = 0;
    while (dt_current_day.getMonth() == dt_datetime.getMonth() || dt_current_day.getMonth() == dt_firstday.getMonth()) {
        for (var cidx = 0; cidx < 7; cidx++) {
            $("#r" + ridx + "c" + cidx + "d").text(dt_current_day.getDate());
            //if (dt_current_day.getDay() == 0) $("#r" + ridx + "c" + cidx + "d").css("color", "red");  //css에서 색 변경 처리로 제거
            //if (dt_current_day.getDay() == 6) $("#r" + ridx + "c" + cidx + "d").css("color", "blue");  //css에서 색 변경 처리로 제거
            if (dt_today.getFullYear() == dt_current_day.getFullYear() && dt_today.getMonth() == dt_current_day.getMonth() && dt_today.getDate() == dt_current_day.getDate()) $("#r" + ridx + "c" + cidx + "t").attr("class", "today");
            if (dt_current_day.getFullYear() == dt_datetime.getFullYear() && dt_current_day.getMonth() == dt_datetime.getMonth() && dt_current_day.getDate() == dt_datetime.getDate()) $("#r" + ridx + "c" + cidx + "td").attr("class", "event");

            if (dt_current_day.getMonth() == dt_datetime.getMonth()) {
                $("#r" + ridx + "c" + cidx + "td").bind("click", function()
                {
                    $("#selectMonth").text(parseInt($("#selectMonth").text()) - 1);
                    $("#selectDate").text(this.innerText);
                    dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
                    if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
                    setCalendar(dt_curr);
                });
            }
            else if (dt_current_day.getMonth() == dt_firstday.getMonth()) {
                $("#r" + ridx + "c" + cidx + "td").bind("click", function()
                {
                    $("#selectMonth").text(parseInt($("#selectMonth").text()) - 2);
                    $("#selectDate").text(this.innerText);
                    dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
                    if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
                    setCalendar(dt_curr);
                });
            }
            else {
                $("#r" + ridx + "c" + cidx + "td").bind("click", function()
                {
                    $("#selectDate").text(this.innerText);
                    dt_curr = new Date($("#selectYear").text(), $("#selectMonth").text(), $("#selectDate").text());
                    if (dt_curr.getDate() != parseInt($("#selectDate").text())) dt_curr.setDate(0);
                    setCalendar(dt_curr);
                });
            }

            dt_current_day.setDate(dt_current_day.getDate()+1);
        }
        ridx++;
    }
}

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

function chgDateTimeStampKendo(obj){
    if(obj != null && obj != ""){
        var year = obj.substring(0,4);
        var month = obj.substring(5,7);
        var day = obj.substring(8,10);
        var time = obj.substring(11,13);
        var minute = obj.substring(14,16);
        var second = obj.substring(17,19);

        var date = new Date(Number(year),Number(month)-1,Number(day),Number(time),Number(minute),Number(second));
        return date.toISOString();
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
function chgDate2TimeStr(obj){
     if(obj != null && obj != "" &&  15 < obj.length){
         return obj.substring(11,13) +":" + obj.substring(14,16);
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
         var _date = new Date(obj);
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

/** Server Date -> 문자열 변환함수
 * param : date형
 * return : 문자열 yyyy-mm-dd hh:mi:ss
 */
function chgServerDateTime2Str(obj){
    if(obj != null && obj != ""){
        var _date = new Date(obj);
        var yy = _date.getFullYear();
        var mm = _date.getMonth() + 1;
        if(mm < 10){
            mm = "0" + mm;
        }
        var dd = _date.getDate();
        if(dd < 10){
            dd = "0" + dd;
        }

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

        return yy+"-"+mm+"-"+dd + " "+hh+":"+mi+":"+se;
    }else{
        return "";
    }
}




/** Server Date -> 문자열 변환함수
 * param : date형
 * return : 문자열 yyyy-mm-dd hh:mi
 */
function chgServerDateTime2Str2(obj){
    if(obj != null && obj != ""){
        var _date = new Date(obj);
        var yy = _date.getFullYear();
        var mm = _date.getMonth() + 1;
        if(mm < 10){
            mm = "0" + mm;
        }
        var dd = _date.getDate();
        if(dd < 10){
            dd = "0" + dd;
        }

        var hh = _date.getHours();
        if(hh < 10){
            hh = "0" + hh;
        }

        var mi = _date.getMinutes();
        if(mi < 10){
            mi = "0" + mi;
        }

        return yy+"-"+mm+"-"+dd + " "+hh+":"+mi
    }else{
        return "";
    }
}


/** Server Date -> 문자열 변환함수
 * param : date형
 * return : 문자열 hh:mi
 */
function chgDate2TimeStr(obj){
    if(obj != null && obj != ""){
        var _date = new Date(obj);
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



var mob = {};

$(document).ready(function() {

    // 리스트 상세화면 확인버튼 클릭시 첫 리스트화면으로 이동
    $("#detailConfirmBtn").click(function(){
        //contentList();

        contentListNonRefresh();
    });

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


    $(".sumtitle > span.st_open").click(function(){
        if($(this).hasClass("st_close") === true){
            $(this).removeClass("st_close");
            $(this).html("상세내용 접기");
            $(this).parent().next(".sumCont").show();
        }else{
            $(this).addClass("st_close");
            $(this).html("상세내용 보기");
            $(this).parent().next(".sumCont").hide();
        }
    });


    mob.notification = {
        show : function(messages, notificationType) {
            var tapTimer, isTapHold = false;
            var layerPopStr = "";
            //기존에 존재하던 메세지 삭제 , 재 호출시 기존 메세지 표시 되는 오류 수정
            $('#lay_pop').remove();
            layerPopStr += '<section id="lay_pop" class="lay_pop">';
            if(notificationType=="info"){
                layerPopStr += '    <div class="lay_title">';
                layerPopStr += '        <h1>提醒</h1>';
                layerPopStr += '    </div>';
            }
            if (typeof messages == "string") {
                layerPopStr += '    <div class="lay_cont2">';
                layerPopStr += '        <span class="contents">'+messages+'</span>';
            } else if(typeof messages == "object") {
                layerPopStr += '    <div class="lay_cont2 al">';
                layerPopStr += '        <span class="contents">';
                $.each(messages, function(idx, error){
                    layerPopStr +=  error + "<br/>";
                });
                layerPopStr += '		</span>';
            }
            layerPopStr += '    	</div>';
            layerPopStr += '    	<div class="btnarea">';
            layerPopStr += "        	<span class='btnd1' onclick='layerClose(\"#lay_pop\");'>关闭</span>";
            layerPopStr += '    	</div>';
            layerPopStr += '</section>';
            $("#mwrap").append(layerPopStr);

            pushLayer('#lay_pop');

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



    mob.loading = {

            show : function($target){

                var cssObj = {
                        top : 0
                        ,left : 0
                        ,width : "100%"
                        ,height : "100%"
                };

                if($target === "undefined" || $target == null){
                    //$target = $("body")[0];
                    $target = $("body");
                    cssObj["position"] = "fixed";
                }else{
                    var position = $target.position();
                    cssObj.top = position.top;
                    cssObj.left = position.left;
                    cssObj.width = $target.innerWidth();
                    cssObj.height = $target.innerHeight();
                }

                $("<div/>").appendTo($target)
                    .css(cssObj)
                    .addClass("k-loading-mask")
                    .addClass("dms-loading-mask")
                    .append("<span class=\"k-loading-text\">Loading...</span>")
                    .append("<div class=\"k-loading-image\"></div>")
                    .append("<div class=\"k-loading-color\"></div>");
            },
            hide : function($target) {

                if($target === "undefined" || $target == null){
                    //$target = $("body")[0];
                    $target = $("body");
                }

                $target.find("div.dms-loading-mask").remove();
            },
            gridNoData : function(gridId, msg) {
                var grid = $("#"+gridId).data("kendoGrid");
                if (grid.dataSource.data().length === 0) {
                    dms.loading.appendNoDataDiv($("#"+gridId+" div.k-grid-content"), msg);
                }else{
                    dms.loading.removeNoDataDiv($("#"+gridId+" div.k-grid-content"));
                }
            },
            appendNoDataDiv : function($target, msg) {
                $('<div class=\"empty-grid\" style=\"width:auto;\">'+msg+'<div/>').appendTo($target);

                var left  = $target.innerWidth()/2-77;
                if(left < 0){
                    left = 5;
                }
                $target.find("div.empty-grid").css({position:"absolute", left:left, top:$target.innerHeight()/2-8, width:"auto", height:"auto"});
            },
            removeNoDataDiv : function($target) {
                $target.find("div.empty-grid").remove();
            }
    };


    function msgDelBack(){
        var msgLi = $('.alarmlist li').removeClass("delete");
        msgLi.children(".message").animate({left:0}, 400);
        msgLi.children(".delete").animate({right:-80}, 400);
    }

    function msgDelete(thisMsg){
        if(thisMsg.hasClass("delete") === true){
           msgDelBack();
        }
        else{
           thisMsg.addClass("delete");
           thisMsg.children(".message").animate({left:-80}, 400);
           thisMsg.children(".delete").animate({right:0}, 400);
           thisMsg.siblings().children(".message").animate({left:0}, 400);
           thisMsg.siblings().children(".delete").animate({right:-80}, 400);
        }
    }

    // 컨텐츠 열기 접기
    $(".content_title > .title_btn > span.co_open").click(function(){
        $(this).parent().parent().next(".co_view").toggle();
        $(this).toggleClass('co_close');
    });

});


//iframe 높이값 계산
function setMainListHeight() {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_list > .content_title").outerHeight() - 10;
        if( $(".skeyarea").is(':visible') ){ lsitareaHeight -= $(".skeyarea").outerHeight(); }
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
        if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
        $("#mainList").parent(".listarea").css("height",lsitareaHeight);
        $("#mainList").css("height", lsitareaHeight - $("#mainList").prev(".listhead").outerHeight());
        if($("#detailList").length > 0){ // 부품리스트
            var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_itemList > .content_title").outerHeight() - 10;
            if( $(".skeyarea").is(':visible') ){ lsitareaHeight -= $(".skeyarea").outerHeight(); }
            if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
            if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
            $("#detailList").parent(".listarea").css("height",lsitareaHeight);
            $("#detailList").css("height", lsitareaHeight - $("#detailList").prev(".listhead").outerHeight());
            /*
            console.log("content_right>.content_title="+$("#content_right > .content_title").outerHeight());
            console.log("btnfixed="+$(".btnfixed").outerHeight());
            console.log("listhead="+$("#detailList").prev(".listhead").outerHeight());
            */
        }
    }catch(e){}
        if($("#detailList").length > 0){ // 부품리스트
    }
}


//iframe 높이값 계산
function setPopUpListHeight() {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_pop_list > .content_title").outerHeight() - 10;
        if( $(".skeyarea").is(':visible') ){ lsitareaHeight -= $(".skeyarea").outerHeight(); }
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
        if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
        $("#comonPopupList").parent(".listarea").css("height",lsitareaHeight);
        $("#comonPopupList").css("height", lsitareaHeight - $("#comonPopupList").prev(".listhead").outerHeight());



    }catch(e){}
}
//iframe 높이값 계산
function setPopUpListObjHeight(obj) {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#"+obj+" > .content_title").outerHeight() - 10;
        if( $(".skeyarea").is(':visible') ){ lsitareaHeight -= $(".skeyarea").outerHeight(); }
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
        if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
        $("#"+obj).parent(".listarea").css("height",lsitareaHeight);
        $("#"+obj).css("height", lsitareaHeight - $("#comonPopupList").prev(".listhead").outerHeight());
    }catch(e){}
}

function setKendoMobApp(){
    //var app = new kendo.mobile.Application();
    var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
    return app;
}

//searchBox 표시 공통처리
function setSearchBoxCommon(searchArr){
    var s,search,d,i,j;
    var skeyareaHide = true;
    for (i = 0; i < searchArr.length ; i++){
        if(searchArr[i] != ""){
            skeyareaHide = false; //조회 입력값이 하나라도 존재하는 경우
            break;
        }
    }
    if(skeyareaHide){
        $(".skeyarea").hide();
        return;
    } else {
        $(".skeyarea").show();
    }

    for(i = 0; i < searchArr.length ; i++){
        j = i+1;
        s = eval("$('#s"+j+"')");
        search = eval("$('#search"+j+"')");
        d = eval("$('#d"+j+"')");
        if(searchArr[i] =="") {
            s.hide(); search.hide(); d.hide();
        } else {
            s.show(); search.show(); d.show();
        }
    }
}
//dms.window = { 복사후 수정
function openCommonWindow(options){
    popupWindow = mob.window.popup({
        windowId : "confirmWearingPopup"
        ,title : ""   //
        ,width :500
        ,height:285
        ,resizable: false
        ,content : {
            url : "<c:url value='/sal/lom/evalSearchEdit/selectEvalSearchEditPopupMain.do'/>"
            ,data : {
                "type" : "custom1"
                ,"autoBind" : false
                ,"strVinNo" : strVinNo                  //
                ,"callbackFunc" : function(data){
                    if (data.msg == "save"){
                        save(data.result);
                    }

                }
            }
        }

    });
}
//HH:MM형식에서 24시간초과 데이터에 대하여 00시로 변환
function changeTimeToZero(str){
    if(str.indexOf("24:") > -1){
        str = str.replace("24:","00:");
    }
    return str;
}

/**
 * kendo.data.DataSource의 추가/수정/삭제 데이터를 반환한다.
 * ex)
 * var cudData = getCUDData(dataSource);
 * cudData["_inserted"] => 추가된 데이터 목록
 * cudData["_updated"] => 수정된 데이터 목록
 * cudData["_deleted"] => 삭제된 데이터 목록
 */
function getCUDData(dataSource, insertedPropName, updatedPropName, deletedPropName){

    var i = insertedPropName? insertedPropName : "_inserted";
    var u = updatedPropName? updatedPropName : "_updated";
    var d = deletedPropName? deletedPropName : "_deleted";

    var o = {};
    o[i] = [];
    o[u] = [];
    o[d] = [];

    o[d] = dataSource._destroyed;
    $(dataSource._flatData(dataSource._data)).each(function(idx, value){
        if(this.isNew()){
            o[i].push(value);
        }else if(this.dirty){
            o[u].push(value);
        }
    });

    return o;
}

//popup



function checkInputFormDisabled(){
    $(".f_text>input, .f_item01>input, .f_item02>input, .f_select select").each(function(index,arrInput){
        if(arrInput.parentNode.nodeName =="DIV"){
            var orgClassName = arrInput.parentNode.className;
            if(arrInput.disabled ==false){
                arrInput.parentNode.className = orgClassName.replace(/f_disabled/gi,"");
            }else{
                arrInput.parentNode.className = orgClassName + " f_disabled";
            }
        }
    });
    // kendoDropDown 콤보박스 대응
    $(".f_text>span>input").each(function(index,arrInput){
        if(arrInput.parentNode.parentNode.nodeName =="DIV"){
            var orgClassName = arrInput.parentNode.parentNode.className;
            if(arrInput.disabled ==false){
                arrInput.parentNode.parentNode.className = orgClassName.replace(/f_disabled/gi,"");
            }else{
                arrInput.parentNode.parentNode.className = orgClassName + " f_disabled";
            }
        }
    });
}

//iframe 컨텐츠 높이만큼 설정하기
function setFullSizeListView(listView){
    $("#"+listView).load(function() {
     //var h = $(this).contents().height();
     //$(this).height( h );
        var h = $("#"+listView).contents().height();
        $("#"+listView).height( h );
    });
}


function setSubListHeightNew(iframeId, rCnt, rowCnt){
    try{
        if(rowCnt > 0 ){
            var h =  parseInt(rowCnt) * ((20 * rCnt)+20) ;
            $("#"+iframeId).height(h);
        }else{
            $("#"+iframeId).height(0);
        }
    }catch(e){}
}




// 상세화면 - 서브리스트 높이지정 함수
function setSubListHeight(iframeId, rowCnt){
    try{

        $("#"+iframeId).parent().parent().show();
        var h2 = $("#"+iframeId).contents().find("div.dlistitem").outerHeight();


        if(rowCnt > 0 ){
            var h =  (parseInt(rowCnt) +0.2) * (h2) ;
            $("#"+iframeId).height(h);
        }else{
            $("#"+iframeId).height(0);
        }
        $("#"+iframeId).parent().parent().hide();
    }catch(e){}
}

function setSubListHeight2(iframeId, rowCnt, showYn){
    try{

        $("#"+iframeId).parent().parent().show();
        var h2 = $("#"+iframeId).contents().find("div.deleteitem").outerHeight();
        if(rowCnt > 0 ){
            var h =  (parseInt(rowCnt) +0.2) * (h2) ;
            $("#"+iframeId).height(h);
        }else{
            $("#"+iframeId).height(0);
        }

        if(showYn == "N"){
            $("#"+iframeId).parent().parent().hide();
        }
    }catch(e){}
}

function setSubListHeight3(iframeId, rowCnt, showYn){
    try{

        $("#"+iframeId).parent().parent().show();
        var h2 = $("#"+iframeId).contents().find("div.dlistitem").outerHeight();
        if(rowCnt > 0 ){
            var h =  (parseInt(rowCnt) +0.2) * (h2) ;
            $("#"+iframeId).height(h);
        }else{
            $("#"+iframeId).height(0);
        }

        if(showYn == "N"){
            $("#"+iframeId).parent().parent().hide();
        }
    }catch(e){}
}


//kendoMobExtValidator 기능 추가
//ExtValidator
(function ($) {
  var kendo = window.kendo,
      ui = kendo.ui,
      Widget = ui.Validator,
      CHANGE = "change",
      VALIDATE = "validate",
      //NS = ".kendoExtValidator";
      NS = ".kendoExtMobValidator";

  var ExtMobValidator = Widget.extend({
      init : function (element, options) {
          var that = this;

          Widget.fn.init.call(this, element, options);

          that.bind(VALIDATE, function(e){

             /* var html = "";
              if (!e.valid) {
                  var errors = this.errors();

                  html += "<ul>";

                  $.each(errors, function(idx, error){
                      html += "<li>" + error + "</li>";
                  });
                  html += "</ul>";

                  dms.notification.info(html);
              }
              */
              var msg = "";
              if (!e.valid) {
                  var errors = this.errors();

                  $.each(errors, function(idx, error){
                      msg +=  error + "<br/>";
                  });


                  mob.notification.info(errors);
              }
          });
      }
      ,options: {
          name: "ExtMobValidator"
          ,errorTemplate: ''
          ,messages: {
              required: dms.settings.validationMessage.required,
              pattern: dms.settings.validationMessage.pattern,
              min: dms.settings.validationMessage.min,
              max: dms.settings.validationMessage.max,
              step: dms.settings.validationMessage.step,
              email: dms.settings.validationMessage.email,
              url: dms.settings.validationMessage.url,
              date: dms.settings.validationMessage.date
          }
          ,events : [
              CHANGE
              ,VALIDATE
          ]
      }
      ,_extractMessage: function(input, ruleKey) {
          var that = this,
              customMessage = that.options.messages[ruleKey],
              fieldName = input.data("name") || input.attr("name");

          customMessage = kendo.isFunction(customMessage) ? customMessage(input) : customMessage;

          return kendo.format(input.attr(kendo.attr(ruleKey + "-msg")) || input.attr("validationMessage") || input.attr("title") || customMessage || "", fieldName, input.attr(ruleKey));
      }
  });

  ui.plugin(ExtMobValidator);

})(window.kendo.jQuery);

//confirm 창 확인
function confirmOpen(message,callBackFnc,y,n){
    var layerPopStr = "";
    //기존에 존재하던 메세지 삭제 , 재 호출시 기존 메세지 표시 되는 오류 수정
    $('#lay_pop').remove();
    layerPopStr += '<section class="lay_pop" id="lay_pop">';
    layerPopStr += '      <div class="lay_cont2">                                                 ';
    layerPopStr += message;
    layerPopStr += '      </div>                                                                  ';
    layerPopStr += '      <div class="btnarea">                                                   ';
    layerPopStr += "          <span class='btnd1' onclick='layerClose(\"#lay_pop\");'>"+n+"</span>    ";
    layerPopStr += "          <span class='btnd1' onclick='layerClose(\"#lay_pop\");"+callBackFnc+"();'>"+y+"</span>    ";
    layerPopStr += '      </div>                                                                  ';
    layerPopStr += '</section>     ';

    $("#mwrap").append(layerPopStr);

    pushLayer('#lay_pop');
}




function moveSearch() {
    if($("#content_search").css("display")=="block"){
        //contentList();

        $("#content_search").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
        $("#header_title span").attr("class","search_open");


        //$("#header_title span").attr("class","search_open");
    }else if($("#content_list").css("display")=="block"){
        contentSearch();
        $("#header_title span").attr("class","search_close");
    }
}

//검색조건 전체삭제
function deleteAllSC(){
    $("#content_search").find("input").each(function(i,d){
        $(this).val("");
    });

    setSearchBox();
    contentList();
}


function contentListNonRefresh() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
}

//콤마찍기
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
//콤마찍기(#,###.## 대응)
function commaPointPlus(str) {
    if(str == null || str == ""){
        return "";
    }

    var num = parseFloat(str);
    return kendo.format("{0:#,###.00}", num);
}

//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function uncommaPointPlus(str) {
    str = String(str);
    return str.replace(/[^0-9.]+/g, '');
}

//input box에서 사용자 입력시 바로 콤마를 찍어주기 위한 함수도 추가 한다.
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
//<input type="text" onblur="inputNumberFormat(this)" />

//input box에서 사용자 입력시 바로 콤마를 찍어주기 위한 함수도 추가 한다.(#,###.## 대응)
function inputNumberFormatPointPlus(obj) {
    obj.value = commaPointPlus(uncommaPointPlus(obj.value));
}
//<input type="text" onblur="inputNumberFormatPointPlus(this)" />

//ExtMultiSelectDropDownList (kendo.ui.ext-1.0.js)함수 모바일에서 커스터마이징
//ExtMobileMultiSelectDropDownList
(function ($) {

    var kendo = window.kendo,
    ui = kendo.ui,
    Widget = ui.DropDownList,
    CHANGE = "change",
    proxy = $.proxy,
    ns = ".kendoExtMobileMultiSelectDropDownList";

    var ExtMobileMultiSelectDropDownList = Widget.extend({

        init: function (element, options) {
            var that = this;

            options.template = kendo.template(
                kendo.format('<label for="{0}_#= {1} #"><input type="checkbox" name="{0}" id="{0}_#= {1} #" value="#= {1} #" />&nbsp;<span>#= {2} #</span></label>',
                    element.id + "_option_" + options.dataValueField,
                    options.dataValueField,
                    options.dataTextField
                )
            );

            options.selectedAllText = options.selectedAllText || "";

            Widget.fn.init.call(that, element, options);

            that.popup.bind('close', function () {
                var values = that.ul.find(":checked")
                            .map(function () { return this.value; })
                            .toArray();

                if (values < that.selectedIndexes || values > that.selectedIndexes) {
                    that._setText();
                    that._setValues();
                    that.trigger(CHANGE);
                }
            });
        },

        options: {
            name: "ExtMobileMultiSelectDropDownList"
            ,selectedAllText : ""
        },

        selectedIndexes: [],

        _accessor: function (vals, idx) {
            var that = this;
            if (vals === undefined) {
                return that.selectedIndexes;
            }
        },

        value: function (vals) {
            var that = this;
            if (vals === undefined) {
                return that._accessor();
            } else {
                var checkboxes = that.ul.find("input[type='checkbox']");
                if (vals.length > 0) {

                    var valArray = $(vals)
                        .map(function() { return this + ''; })
                        .toArray();

                    checkboxes.each(function () {
                        this.checked = $.inArray(this.value, valArray) !== -1;
                    });

                    that._setText();
                    that._setValues();
                } else {
                    that.text("");
                    that.selectedIndexes = [];
                    checkboxes.each(function () {
                        this.checked = false;
                    });
                }
            }
        },

        _select: function(li) { },
        _blur: function () { },

        _setText: function () {
            var that = this;
            var text = that.ul.find(":checked")
                .map(function () { return $(this).siblings("span").text(); })
                .toArray();

            if (that.dataSource._total == that.ul.find(":checked").length) {
                if(that.options.selectedAllText == "") {
                    that.text(text.toString().replace(/,/g, ', '));
                } else {
                    that.text(that.options.selectedAllText);
                }
            } else {
                that.text(text.toString().replace(/,/g, ', '));
            }

        },
        _setValues: function () {
            var that = this;
            var values = that.ul.find(":checked")
                .map(function () { return this.value; })
                .toArray();
            that.selectedIndexes = values;
        }

    });

    ui.plugin(ExtMobileMultiSelectDropDownList);

})(window.kendo.jQuery);



function checklistCntFullDisp(id){
         var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_list > .content_title").outerHeight() - 10;
        if( $(".skeyarea").is(':visible') ){ lsitareaHeight -= $(".skeyarea").outerHeight(); }
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
        if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
        $("#"+id).parent(".listarea").css("height",lsitareaHeight);
        $("#"+id).css("height", lsitareaHeight - $("#"+id).prev(".listhead").outerHeight());
}



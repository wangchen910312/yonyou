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
    var top;
    if(window.innerHeight+20<=screen.height){
        top=($(window).height()-layHeight+sctop)/2;
    }else{
        top=($(window).height()-screen.height/2-layHeight);
    }
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("#content").prepend("<div class='blind' onclick='layerClose(" + layerName.attr("id") + ")'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(layerName).css({"left":left,"top":top,"display":"block"});
}
function calLayerPopupPostion(layerId){
    var layerName = $(layerId);
    var layWidth = layerName.width();
    var layHeight = layerName.height();
    var left=($(window).width()-layWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top;
    if(window.innerHeight+20<=screen.height){
        top=($(window).height()-layHeight+sctop)/2;
    }else{
        top=($(window).height()-screen.height/2-layHeight);
    }
    $(layerName).css({"left":left,"top":top,"display":"block"});
}
function layerClose(layerName){
    $(layerName).css("display","none");
    //$(".lay_pop").css("display","none");
    $(".blind").animate({opacity:'0'},200).queue(function(){$(".blind").remove();});
}
function layerClose2(layerName){
    $(layerName).css("display","none");
    //$(".lay_pop").css("display","none");
    $(".blind").hide();
}
/*function goWhere(url){
    if(url=="A")goAlarm();
    else if(url=="T")goTodo("1");
}*/

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
    });
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
var objCal2;//khs
var objTm="no";//khs
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
    var top=(screen.height-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_calpicker").css({"left":left,"top":top,"display":"block"});
}

function calpickerWithTime(objDate, objTime){
    //init Time
    objTm="no";

    //DATE
    objCal = $("#" + objDate);
    var currDate = objCal.val();
    //var dt_curr = (currDate == null || currDate == "" || currDate.length < 10 ?  new Date() : kendo.parseDate(currDate, strDf));
    var dt_curr = (currDate == null || currDate == "" || currDate.length < 10 ?  new Date() : kendo.parseDate(currDate, dateFormat));
    setCalendar(dt_curr);
    var pickerWidth = $(".m_calpicker").innerWidth();
    var pickerHeight = $(".m_calpicker").innerHeight();
    var left=($(window).width()-pickerWidth)/2;
    var sctop=$(window).scrollTop()*2;
    var top=(screen.height-pickerHeight+sctop)/2;
    var height=document.getElementsByTagName("body")[0].scrollHeight;
    $("body").append("<div class='blind' onclick='pickerClose()'></div>");
    $(".blind").show().animate({opacity:'0.4'},500);
    $(".m_calpicker").css({"left":left,"top":top,"display":"block"});

    //TIME
    objCal2 = $("#" + objTime);
    var currDate2 = objCal2.val();
    if(!currDate2) {
        var hours = 0;
        var minutes = 0;
        //var seconds = 0;
        var dt_datetime = new Date();
        hours = dt_datetime.getHours().toString();
        minutes = dt_datetime.getMinutes().toString();
        var strHours=(hours.length > 1 ? hours : "0"+hours);
        var strMinutes=(minutes.length > 1 ? minutes : "0"+minutes);

        objTm=strHours+":"+strMinutes;
    }

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
    var top=(screen.height-pickerHeight+sctop)/2;
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
    var top=(screen.height-pickerHeight+sctop)/2;
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
    var top=(screen.height-pickerHeight+sctop)/2;
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
    var top=(screen.height-pickerHeight+sctop)/2;
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
function chgDate2TimeStr2(obj){
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

/** Server Date -> 문자열 변환함수
 * param : date형
 * return : 문자열 yyyy-mm-dd hh:mi:ss
 */
function chgServerDateTime2Str(obj){
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

        var hh = _date.getHours();
        if(hh < 10){
            hh = "0" + hh;
        }

        var mi = _date.getMinutes();
        if(mi < 10){
            mi = "0" + mi;
        }

        return yy+"-"+mm+"-"+dd + " "+hh+":"+mi;
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


/**
 *
 * IOS날짜 'NAN'출력문제 솔루션 - jhg
 * @param date형 or string형
 * @returns date형
 */
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



var mob = {};

$(document).ready(function() {

    mob.notification = {
        show : function(messages, notificationType) {
            var tapTimer, isTapHold = false;
            var layerPopStr = "";
            //기존에 존재하던 메세지 삭제 , 재 호출시 기존 메세지 표시 되는 오류 수정
            $('#lay_pop').remove();
            layerPopStr += '<section id="lay_pop" class="lay_pop">';
            if(notificationType=="info" || notificationType=="confrim"){
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
            if(notificationType.indexOf("callFunc:") > -1){
                var funcArr=notificationType.split(":");
                layerPopStr += '        <div class="btnarea">';
                layerPopStr += "            <span class='btnd1' onclick='layerClose(\"#lay_pop\");' style='width:40%; margin-right: 10px;'>关闭</span><span class='btnd1' onclick='"+funcArr[1]+";' style='width:40%; margin-left: 10px;'>查看</span>";
            }else{
                layerPopStr += '        <div class="btnarea">';
                layerPopStr += "            <span class='btnd1' onclick='layerClose(\"#lay_pop\");'>关闭</span>";
            }

            layerPopStr += '    	</div>';
            layerPopStr += '</section>';

            if(notificationType != "none"){
                $("body").append(layerPopStr);
            }
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
        },
        confrim : function(messages) {
            this.show(messages, "confrim");
        },
        none :  function(messages) {
            this.show(messages, "none");
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

    // 숫자만 for MOBILE
    $('.numberic').on('input', function (event) {
        this.value = this.value.replace(/[^0-9]/g, '');
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
function setMainListHeight2() {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_list2 > .content_title").outerHeight() - 10;
        $("#mainList2").parent(".listarea").css("height",lsitareaHeight);
        $("#mainList2").css("height", lsitareaHeight - 79);
        if($("#detailList").length > 0){ // 부품리스트
            var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_itemList > .content_title").outerHeight() - 10;
            //if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
            $("#detailList").parent(".listarea").css("height",lsitareaHeight);
            $("#detailList").css("height", lsitareaHeight - $("#detailList").prev(".listhead").outerHeight());

        }
    }catch(e){}
        if($("#detailList").length > 0){ // 부품리스트
    }
}
//iframe 높이값 계산
function setMainListHeightId(id,h) {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_list > .content_title").outerHeight() - h;
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
        if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
        $(id).parent(".listarea").css("height",lsitareaHeight);
        $(id).css("height", lsitareaHeight - $(id).prev(".listhead").outerHeight());
    }catch(e){
    }
}
//iframe 높이값 계산
function setMainListHeightId3(id,h,hh) {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_list > .content_title").outerHeight() - h-5;
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
        if( $(".removeArea_ifr").is(':visible') ){ lsitareaHeight -= $(".removeArea_ifr").outerHeight(); }
        $(id).parent(".listarea").css("height",lsitareaHeight);
        $(id).css("height", lsitareaHeight - hh);
    }catch(e){
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
function setPopUpListHeight2() {
    try{
        var lsitareaHeight = $(window).height() - $("#header").outerHeight() - $("#content_pop_list > .content_title").outerHeight() - 300;
        if( $(".btnfixed").is(':visible') ){ lsitareaHeight -= $(".btnfixed").outerHeight(); }
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
            console.log("AA");
            var h =  parseInt(rowCnt) * ((20 * rCnt)+20) ;
            $("#"+iframeId).height(h);
        }else{
            console.log("BB");
            $("#"+iframeId).height(0);
        }
    }catch(e){console.log("CC");}
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

    $("#content").append(layerPopStr);

    pushLayer('#lay_pop');
}

function moveSearch() {
    if($("#content_search").css("display")=="block"){
        $("#content_search").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
        $("#header_title span").attr("class","search_open");

    }else if($("#content_list").css("display")=="block"){
        contentSearch();
        $("#header_title span").attr("class","search_close");
    }
}

function moveSearch2(n) {//판매 재고실사, 완성차입고확정에서 쓴다.
    if($("#content_search").css("display")=="block"){
        //contentList();
        $("#content_search").css("display","none");
        $("#content_detail").css("display","none");
        $("#content_list_1").css("display","none");
        $("#content_list_2").css("display","none");
        $("#content_list_3").css("display","none");
        $("#content_list_5").css("display","none");
        $("#header_title span").attr("class","search_open");
        $("#content_list_"+n).css("display","block");
    }else{
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
function contentListNonRefresh2() {
    $("#content_search").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_list2").css("display","block");
    $("#header_title span").attr("class","search_open");
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

function setDetailData(dData, selTargetElement){//khs input의 id와  data의 key가 같으면 세팅해준다.  selTargetElement는 input이 들어가 있는 범위 selectPartReservationMain.jsp 참고

    var dListKeys=Object.keys(dData);
    $(selTargetElement).val("");
    var idArr=$(selTargetElement+"[id]").map(function(){return this.id;}).get();

    for(var i=0; i<dListKeys.length; i++){
        for(var j=0; j<idArr.length; j++){
            if(dListKeys[i]==idArr[j]){
                $("#"+idArr[j]).val(dData[idArr[j]]);
                break;
            }
        }
    }
}

function setDetailData2(dData, selTargetElement, _str){//khs input의 id와  data의 key가 같으면 세팅해준다.  selTargetElement는 input이 들어가 있는 범위selectReceiveCnfmMain.jsp참고

    var dListKeys=Object.keys(dData);
    $(selTargetElement).val("");
    var idArr=$(selTargetElement+"[id]").map(function(){return this.id;}).get();

    for(var i=0; i<dListKeys.length; i++){
        for(var j=0; j<idArr.length; j++){
            if(_str+dListKeys[i]==idArr[j]){
                $("#"+idArr[j]).val(dData[dListKeys[i]]);
                break;
            }
        }
    }
}

function setDetailData3(keyMapArr, dData, selTargetElement){// html에 값을 넣고 type에 따라 val을 변경 selectPartReservationMain.jsp, selectPartReservationList.jsp 참조

    var dListKeys=[];
    for(var i=0; i<keyMapArr.length; i++){
        dListKeys.push({key:keyMapArr[i].key,type:keyMapArr[i].type});
    }

    $(selTargetElement).val("");
    var idArr=$(selTargetElement+"[id]").map(function(){return this.id;}).get();

    for(var i=0; i<dListKeys.length; i++){
        for(var j=0; j<idArr.length; j++){
            if(dListKeys[i].key==idArr[j]){
                if(dListKeys[i].type =="strDate"){
                    $("#"+idArr[j]).val(chgDate2DateTimeStr(dData[dListKeys[i].key]));
                }else if(dListKeys[i].type =="strDateOnly"){
                    $("#"+idArr[j]).val(chgServerDate2Str(dData[dListKeys[i].key]));
                }else if(dListKeys[i].type =="strAmt"){
                    $("#"+idArr[j]).val(kendo.toString(dData[dListKeys[i].key],'n2'));
                }else if(dListKeys[i].type =="strDist"){
                    $("#"+idArr[j]).val(commaZero(dData[dListKeys[i].key]));
                }else{
                    $("#"+idArr[j]).val(dData[dListKeys[i].key]);
                }
                break;
            }
        }
    }
}

function makeDetailHtml(obj,keyMapArr, defaultSeletorId, hiddenSeletorId){//상세html을 만들어준다 selectPartReservationMain.jsp, selectPartReservationList.jsp 참조
    if(obj.length>0){
        var _html="";
        var dListKeys=Object.keys(obj[0]);
        for(var i=0; i<keyMapArr.length; i++){
            for(var j=0; j<dListKeys.length; j++){
                if(keyMapArr[i].key == dListKeys[j] && keyMapArr[i].temp == "s" ){
                    _html+="<tr><th scope='row'>"+keyMapArr[i].txt+"</th>"
                    +"<td>"
                        +"<div class='f_text f_disabled'><input id='"+dListKeys[j]+"' type='text' disabled='disabled'/></div>"
                    +"</td>"
                    +"</tr>";
                    break;
                }
            }
        }
        $(defaultSeletorId).html(_html);

        _html="";
        for(var i=0; i<keyMapArr.length; i++){
            for(var j=0; j<dListKeys.length; j++){
                if(keyMapArr[i].key == dListKeys[j] && keyMapArr[i].temp == "h" ){
                    _html+="<tr><th scope='row'>"+keyMapArr[i].txt+"</th>"
                    +"<td>"
                        +"<div class='f_text f_disabled'><input id='"+dListKeys[j]+"' type='text' disabled='disabled'/></div>"
                    +"</td>"
                    +"</tr>";
                    break;
                }
            }
        }
        $(hiddenSeletorId).html(_html);
    }

    return false;
}
function numValidate(evt){
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode( key );
    var regex = /[0-9]/;
    if( !regex.test(key) ) {
      theEvent.returnValue = false;
      if(theEvent.preventDefault) theEvent.preventDefault();
    }
}
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

    var dms = window.dms? window.dms:{};
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

    window.dms = dms;
}(window, document, jQuery));
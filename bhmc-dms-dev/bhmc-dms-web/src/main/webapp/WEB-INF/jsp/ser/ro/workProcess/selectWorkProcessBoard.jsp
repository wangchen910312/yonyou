<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.vticker.js"/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.css"/>">
<style type="text/css">

 .waitRepair {
   color:#F79646; 
   font-size:26px;
   padding-left:5px;
   border:1px solid #FFFFFF; <!--#366092;-->
   padding: 0px 0px 0px 8px;
 }
 
 .maintenance {
   color:#4BACC6; 
   font-size:26px;
   text-align:left;
   border:1px solid #FFFFFF;
   padding-left:5px;
   padding: 0px 0px 0px 8px;
 }
 
  .deliInspec {
   color:#9BBB59; 
   font-size:26px;
   text-align:left;
   border:1px solid #FFFFFF;
   padding-left:5px;
   padding: 0px 0px 0px 8px;
 }
 
.board_header h1 {
    height: 46px;
    font-size: 38px;
    color: #5be2ff;
    margin-top: -6px;
 }

</style>
<!-- 서비스예약 -->
<div class="content">

    <div class="board_header">
        <div class="board_logo"></div>
        <h1><spring:message code="ser.title.assignBoard" /><!-- 서비스 진도 보드 --></h1>
        <div class="date_time"></div>
    </div>  
</div>

<div class="portlet_area portlet_area_x3">
    <section class="portlet">
        <div>
            <!--等待维修-->
            <h1 style="color:#F79646; font-size:30px;text-align:center;"><spring:message code="ser.lbl.lbrReady" />(<span class="readyCnt">0</span>)</h1>
        </div>
        </br>
        <div>
            <!--bgcolor ="#1F497D"-->
            
            <table style="border-collapse:separate; border-spacing:6px 8px;" width="100%" align="center">
                   <colgroup>
                     <col width="33%"/>
                     <col width="34%"/>
                     <col width="33%"/>
                   </colgroup>
                   <tbody id="template"></tbody>
             </table>
        </div>
    </section>

    <section class="portlet" >
        <div>
            <!--维修进行-->
             <h1 style="color:#4BACC6;font-size:30px;text-align:center;"><spring:message code="ser.lbl.lbrStart" />(<span class="prcStartCnt">0</span>)</h1>
        </div>
        </br>  
        <div>
            <!--bgcolor = "#16365C"-->
             <table width="100%" align="center" style="border-collapse:separate; border-spacing:6px 8px;">
                   <colgroup>
                     <col width="33%"/>
                     <col width="34%"/>
                     <col width="33%"/>
                   </colgroup>
                   <tbody id="template1"></tbody> 
              </table>
        </div>
    </section>

    <section class="portlet" >
        <div>
            <!--交车检查-->
            <h1 style ="color:#9BBB59;font-size:30px;text-align:center;"><spring:message code="ser.lbl.dlvConf" />(<span class="dlConfCnt">0</span>)</h1>
        </div>
       </br>
        <div>
             <!--bgcolor = bgcolor = "#0F243E"-->
             <table width="100%" align="center" style="border-collapse:separate; border-spacing:6px 8px;" >
                   <colgroup>
                     <col width="33%"/>
                     <col width="34%"/>
                     <col width="33%"/>
                   </colgroup>
                   <tbody id="template2"></tbody> 
             </table>
        </div>
    </section>
    
    <div style="display:none;">
            <a id="stopScroll" href="#">Stop</a>
            <a id="startScroll" href="#">Start</a>
    </div>
    
</div>

<!--等待维修-->
<script id="workProcessBoardTemplate" type="text/x-kendo-template">
    # var readyCnt = 0; #
    # var totalCnt = data.length; #
    #console.log("数据量",totalCnt)#
    # for (var i = 0; i < data.length; i++) { #
    # var resV = i/3; #
    # if(resV % 1 === 0) { #
       <tr class = "waitRepair">
          # if(i+1 <= data.length) { #
          <td class = "waitRepair"> #= data[i] # </td>
          #}#
           # if(i+2 <= data.length) { #
          <td class = "waitRepair"> #= data[i + 1] # </td>
          #}#
           # if(i+3 <= data.length) { #
          <td class = "waitRepair"> #= data[i + 2] # </td>
          #}#
       </tr>
     # } #
    # } #
    # $(".readyCnt").html(totalCnt); #
</script>

<!--维修进行-->
<script id="workProcessBoardTemplate1" type="text/x-kendo-template">
    # var readyCnt = 0; #
    # var totalCnt = data.length; #
    # for (var i = 0; i < data.length; i++) { #
    # var resV = i/3; #
    # if(resV % 1 === 0) { #
       <tr class = "maintenance">
          # if(i+1 <= data.length) { #
          <td class = "maintenance"> #= data[i] # </td>
          #}#
           # if(i+2 <= data.length) { #
          <td class = "maintenance"> #= data[i + 1] # </td>
          #}#
           # if(i+3 <= data.length) { #
          <td class = "maintenance"> #= data[i + 2] # </td>
          #}#
       </tr>
     # } #
    # } #
    # $(".prcStartCnt").html(totalCnt); #
</script>

<!--交车检查-->
<script id="workProcessBoardTemplate2" type="text/x-kendo-template">
    # var readyCnt = 0; #
    # var totalCnt = data.length; #
    # for (var i = 0; i < data.length; i++) { #
    # var resV = i/3; #
    # if(resV % 1 === 0) { #
       <tr class = "deliInspec">
          # if(i+1 <= data.length) { #
          <td class = "deliInspec"> #= data[i] # </td>
          #}#
           # if(i+2 <= data.length) { #
          <td class = "deliInspec"> #= data[i + 1] # </td>
          #}#
          # if(i+3 <= data.length) { #
          <td class = "deliInspec"> #= data[i + 2] # </td>
          #}#
       </tr>
     # } #
    # } #
    # $(".dlConfCnt").html(totalCnt); #
</script>


<script type="text/javascript">
//csr 106 服务进度看板展示更改 贾明 2020-6-8 start
var waitRep = new Array();//等待维修
var mainten = new Array();//维修进行
var delinp  = new Array();//交车相检查
//csr 106 服务进度看板展示更改 贾明 2020-6-8 end
var sysDate = new Date("<c:out value='${sysDate}' />");
var dlrCd = "${dlrCd}";
var minRefreshCnt = 9;
var setTimeOut;

var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

show_clock = function() {
    var date = new Date();
    $(".date_time").html(formatToday + " " + date.toLocaleTimeString());

    setTimeout("show_clock()",1000);
};


$(document).ready(function() {
    refresh();
    show_clock();

    var wHeight, header1, header2;
    wHeight = $(window).height();
    header1 = $("div.board_header").outerHeight();
    header2 = $("div.table_header").outerHeight();
    $("div.table_scroll").css("max-height", (wHeight - header1 - header2 - 1 - 40)  + "px");
    
    //$("#waitRepair").css("height",wHeight +"px");
    //$("#maintenance").css("height",wHeight +"px");
    //$("#deliInspec").css("height",wHeight +"px");

    $("#template").totemticker({
        message      : 'Ticker Loaded'
        ,row_height  : '30px'
        ,stop        : '#stopScroll'
        ,start       : '#startScroll'
        ,speed       : 300
        ,interval    : 3000
        ,max_items   : 1
        ,mousestop   : false
        ,direction   : 'up'
    });
    
     $("#template1").totemticker({
        message      : 'Ticker Loaded'
        ,row_height  : '30px'
        ,stop        : '#stopScroll'
        ,start       : '#startScroll'
        ,speed       : 300
        ,interval    : 3000
        ,max_items   : 1
        ,mousestop   : false
        ,direction   : 'up'
    });
    
     $("#template2").totemticker({
        message      : 'Ticker Loaded'
        ,row_height  : '30px'
        ,stop        : '#stopScroll'
        ,start       : '#startScroll'
        ,speed       : 300
        ,interval    : 3000
        ,max_items   : 1
        ,mousestop   : false
        ,direction   : 'up'
    });
   
});


//判断整理
function isInteger(obj) {
 return typeof obj === 'number' && obj%1 === 0
}

/**
 * 扩展Array方法, 去除数组中空白数据
 */
Array.prototype.notempty = function() {
    var arr = [];
    this.map(function(val, index) {
        //过滤规则为，不为空串、不为null、不为undefined，也可自行修改
        if (val !== "" && val != undefined) {
            arr.push(val);
        }
    });
    return arr;
}

function refresh() {
    //selectWorkProcessBoardList.do(原先事件) selectServiceProgressList.do 
   
    $.ajax({
        url:"<c:url value='/ser/ro/workProcess/selectServiceProgressList.do' />"
        ,data:JSON.stringify({sExpcDlDt:sysDate, sDlrCd:dlrCd})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
        	//2020.8.3 解决出现重复(车牌)数据问题
        	$("#template").html("");
        	$("#template1").html("");
        	$("#template2").html("");
        	//2020.8.3 解决出现重复(车牌)数据问题
        console.log("1",result);
            var maxCnt = result.data.length < minRefreshCnt ? minRefreshCnt : result.data.length;
            setTimeOut = setTimeout(refresh, Number(maxCnt) * 3000);
            var workProcessBoardTemplate = kendo.template($("#workProcessBoardTemplate").html());
            var workProcessBoardTemplate1 = kendo.template($("#workProcessBoardTemplate1").html());
            var workProcessBoardTemplate2 = kendo.template($("#workProcessBoardTemplate2").html());
            //$("#template").html(workProcessBoardTemplate(result.data));
            
           
            //csr 106 服务进度看板展示更改 贾明 2020-6-8 start
            waitRep.length = 0;
            mainten.length = 0;
            delinp.length = 0;
           for(var i = 0; i < result.data.length; i++ ){
                 
                 //等待维修  waitRep
                 if('01' == result.data[i].roStatCd){
                     waitRep[i] = result.data[i].carRegNo;
                 }
                 //维修进行 mainten
                 if('02' == result.data[i].roStatCd){
                     mainten[i] = result.data[i].carRegNo;
                 }
                 //交车相检查 delinp
                 if('06' == result.data[i].roStatCd){
                     delinp[i] = result.data[i].carRegNo;
                 }
            }
            console.log("13",waitRep.length);
            waitRep = waitRep.notempty();
            console.log("1r3",waitRep.length);
            $("#template").html(workProcessBoardTemplate(waitRep));
            console.log(waitRep);
            mainten = mainten.notempty();
            $("#template1").html(workProcessBoardTemplate1(mainten));
           //交车相检查 delinp
           delinp = delinp.notempty();
            $("#template2").html(workProcessBoardTemplate2(delinp));
         
            
            if(result.data.length <= minRefreshCnt){
                $("#stopScroll").click();
            }else{
                $("#startScroll").click();
            }
        }
    });
}

</script>

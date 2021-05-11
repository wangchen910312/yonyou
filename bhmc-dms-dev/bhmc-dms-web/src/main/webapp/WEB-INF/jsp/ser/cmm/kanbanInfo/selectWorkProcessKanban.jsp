<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="slide_menu">
    <div id="slide-in-share" class="slide-in-share">
        <a id="slide-in-handle" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.workProBoard" /></span></a><!-- 정비관리보드 -->
        <div class="slide-content">
            <div id="processDiv" class="table_list3 table_list_v2 mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="bg_blue1" style="height:30px"><spring:message code="ser.lbl.carNo" />(<span class="totalCnt">0</span>)</th><!-- 차량번호 -->
                            <th scope="col" class="bg_blue1"><spring:message code="ser.lbl.roWrtrNm" /></th><!-- RO발행자 -->
                            <th scope="col" class="bg_blue1"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                            <th scope="col" class="bg_red"><spring:message code="ser.lbl.lbrReady" />(<span class="readyCnt">0</span>)</th><!-- 정비대기 -->
                            <th scope="col" class="bg_orange2"><spring:message code="ser.lbl.underRepair" />(<span class="prcStartCnt">0</span>)</th><!-- 정비진행 -->
                            <th scope="col" class="bg_yellow2"><spring:message code="ser.lbl.lbrStop" />(<span class="prcStopCnt">0</span>)</th><!-- 정비중지 -->
                            <th scope="col" class="bg_green3"><spring:message code="ser.lbl.qtTest" />(<span class="qtTestCnt">0</span>)</th><!-- 품질검사 -->
                            <th scope="col" class="bg_blue2"><spring:message code="ser.lbl.carDlReady" />(<span class="dlReadyCnt">0</span>)</th><!-- 인도대기 -->
                            <th scope="col" class="bg_blue3"><spring:message code="ser.lbl.deliveryChk" />(<span class="dlConfCnt">0</span>)</th><!-- 인도확인 -->
                        </tr>
                    </thead>
                    <tbody id="workProcessTemplate"></tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="slide-in-share1" class="slide-in-share" style="display:none;">
        <a id="slide-in-handle1" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.title.rpirMngBoard" /></span></a><!-- 정비진도보드 -->
        <div class="slide-content">
            <div id="scheduler1"></div>
        </div>
    </div>
</section>

<div id="tooltipDiv"></div>
<script type="text/javascript">

var sysDate = new Date("<c:out value='${sysDate}' />");
var userSearchPopupWin;

$(document).ready(function() {

    var height = $(window).height();
    $("#processDiv").css("height", height - 30);

    var formatToday = kendo.toString(new Date(sysDate), "yyyy") + "<spring:message code='ser.lbl.yy' />";
    formatToday += kendo.toString(new Date(sysDate), "MM") + "<spring:message code='ser.lbl.monday' />";
    formatToday += kendo.toString(new Date(sysDate), "dd") + "<spring:message code='ser.lbl.day' />";
    formatToday += " " + kendo.toString(new Date(sysDate), "dddd");

    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";
    var toDay = new Date();

    // 스케줄러 툴팁
    $("#workProcessTemplate").kendoTooltip({
        filter:".sc_event",
        position:"left",
        width:120,
        height:60,
        content:function(e){
            var target = e.target;
            var roDocNo = target.text();
            return getToolTipData(roDocNo);
        }
    });

    getToolTipData = function(roDocNo) {
        var returnTooltip = "";
        $.ajax({
            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderInfoByKey.do' />"
            ,data:JSON.stringify({sRoDocNo:roDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                var wrkEndDt = result.wrkEndDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.wrkEndDt));
                var qtTestStartDt = result.qtTestStartDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.qtTestStartDt));
                var qtTestEndDt = result.qtTestEndDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.qtTestEndDt));
                var expcDlDt = result.expcDlDt == null ? "" : kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.expcDlDt));

                returnTooltip += '<div><div class="carDetail_popup" style="top:20%; left:-30%; width:200px"><div class="clfix"><div class="txt_area"><ul>';
                returnTooltip += '<li><spring:message code="ser.lbl.roDocNo" /> : ' + result.roDocNo + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.roWrtrNm" /> : ' + result.regUsrNm + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.roDt" /> : ' + kendo.format('{0:<dms:configValue code="dateFormat" /> HH:mm}', kendo.parseDate(result.roDt)) + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.expcDlvDt" /> : ' + expcDlDt + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.roTp" /> : ' + dms.string.strNvl(result.roTpNm) + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.roStatus" /> : ' + dms.string.strNvl(result.roStatNm) + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.assignEndDt" /> : ' + wrkEndDt + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.qtTestStartDt" /> : ' + qtTestStartDt + '</li>';
                returnTooltip += '<li><spring:message code="ser.lbl.qtTestEndDt" /> : ' + qtTestEndDt + '</li>';
                returnTooltip += '</ul></div></div></div></div>';
            }
        });
        return returnTooltip;
    }

    $("#scheduler1").kendoScheduler({
        date:sysDate
        ,startTime:new Date(startTime)
        ,endTime:new Date(endTime)
        ,editable:false
        ,footer:false
        ,allDaySlot:false
        ,autoBind:false
        ,eventTemplate:$("#preChkInfoView").html()
        ,views:[
            { type:"day" }
        ]
        ,navigate:function(e){
            diagToDay = new Date(e.date);
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        }
        ,dataSource:{
            batch:true
            ,transport:{
                read:{
                    url:"<c:url value='/ser/ro/preCheck/selectPreChkKanbans.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sFromDt"] = kendo.parseDate(kendo.toString(toDay, "yyyy-MM-dd"));
                        params["sRegUsrNm"] = $("#sRegUsrNm").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                data:"data"
                ,total:"total"
                ,model:{
                    id:"diagDocNo"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,diagDocNo:{type:"string"}
                        ,resvDocNo:{type:"string"}
                        ,start:{type:"date" , from:"preChkDt" }
                        ,end:{type:"date" , from:"preChkEndDt" }
                        ,roGrpNo:{type:"string"}
                        ,tecId:{type:"string"}
                        ,tecNm:{type:"string" }
                        ,title:{type:"string", from:"carRegNo"}
                        ,vinNo:{type:"string", from:"vinNo"}
                        ,carOwnerNm:{type:"string"}
                        ,grpNo:{type:"string"}
                    }
                }
            }
        }
        ,group:{
            resources:["PC"]
        }
        ,resources:[
            {
                field:"grpNo"
                ,name:"PC"
                ,title:"PC"
                ,dataTextField:""
                ,dataValueField:"grpNo"
                ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/ser/ro/preCheck/selectPreChkKanbanRows.do' />"
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        data:"data"
                        ,total:"total"
                        ,model:{
                            id:"grpNo"
                            ,fields:{
                                 grpNo:{type:"string"}
                            }
                        }
                    }
                }
            }
        ]
        ,dataBound:function() {
            toDay = new Date($("#scheduler1").data("kendoScheduler")._model.selectedDate);
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
            $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
            $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
            $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  " + formatToday);

        }
    });

    $("#scheduler1 > .k-scheduler-toolbar ul > li:nth-child(4)").after('<span class="scheduler_search_form"><spring:message code="ser.lbl.preChkNm" /><div id="preSearch" class="form_search" style="float:right;width:120px;height:23px;margin-left:10px;"><input type="text" id="sRegUsrNm" name="sRegUsrNm" class="form_input" /><a href="#" onclick="userSearch(\'scheduler1\',\'sRegUsrNm\')" ></a></span>');
    var slide = kendo.fx($("#slide-in-share")).slideIn("right"),
    visible = true;

    $("#slide-in-handle").click(function(e) {

        $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
        $("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
        $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("");
        $("#scheduler1 > .k-scheduler-toolbar ul:first .k-nav-today a").text("<spring:message code='ser.lbl.today' />  "+ formatToday);
        scheduler.element.height($(".slide_menu").height()-23);

        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible) {
            slide.reverse();
            refresh();
        } else {
            slide.play();
        }
        visible = !visible;
        e.preventDefault();
    });

    // 입고점검 스케줄러
    var scheduler = $("#scheduler1").data("kendoScheduler");

    var slide1 = kendo.fx($("#slide-in-share1")).slideIn("right"),
    visible1 = true;

    $("#slide-in-handle1").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible1) {
            slide1.reverse();
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        } else {
            slide1.play();
        }
        visible1 = !visible1;
        e.preventDefault();
    });
});

$("#sRegUsrNm").keypress(function(e){
    //$("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(1)").hide();
    //$("#scheduler1 > .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
    if(e.keyCode === 13 && dms.string.strNvl($("#sRegUsrNm").val()) != ""){
        e.preventDefault();
        $("#scheduler1").data("kendoScheduler").dataSource.read();
    }
});

searchPreChk = function(){

    if(dms.string.strNvl($("#sRegUsrNm").val()) != ""){
        $("#scheduler1").data("kendoScheduler").dataSource.read();
    }
}

userSearch = function(schedulerId , fieldNm){
    techManSearchPopupWin = dms.window.popup({
        windowId:"techManSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectTechManSearchPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0){

                        $("#"+fieldNm).val(data[0].tecNm);//ser.lbl.preChkNm
                        $("#"+schedulerId).data("kendoScheduler").dataSource.read();

                    }
                }
            }
        }
    });
};


function refresh() {
    $.ajax({
        url:"<c:url value='/ser/ro/workProcess/selectWorkProcessBoardList.do' />"
        ,data:JSON.stringify({sExpcDlDt:sysDate})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(result, textStatus){
            var workProcessBoardTemplate = kendo.template($("#workProcessBoardTemplate").html());
            $("#workProcessTemplate").html(workProcessBoardTemplate(result.data));
        }
    });
}
</script>

<!-- //script -->

<script id="preChkInfoView" type="text/x-kendo-template">

    #if(dms.string.strNvl(useYn) == 'N') { #
        <div class="noresvtp">
            #if(dms.string.strNvl(title) != ''){#
                #= title# </span>
            #} else {#
                #= driverNm#
            #}#
                <br>
            #=diagDocNo#
        </div>
    #} else { #
         <div id="preChkItem" style="display:table-cell;text-align:center;vertical-align:middle">
            #if(dms.string.strNvl(title) != ''){#
                #= title#
            #} else {#
                #= driverNm#
            #}#
                <br>
            #=diagDocNo#
        </div>
    #}#
</script>

<script id="workProcessBoardTemplate" type="text/x-kendo-template">
    # var readyCnt = 0; #
    # var prcStartCnt = 0; #
    # var prcStopCnt = 0; #
    # var qtTestCnt = 0; #
    # var dlReadyCnt = 0; #
    # var dlConfCnt = 0; #
    # var totalCnt = data.length; #
    # for (var i = 0; i < data.length; i++) { #
    # var roStatCd = data[i].roStatCd; #
    # var expcDlDt = data[i].expcDlDt == null ? "" : kendo.format('{0:MM-dd HH:mm}', kendo.parseDate(data[i].expcDlDt)); #
    <tr>
        <th scope="row" style="height:30px">#= dms.string.strNvl(data[i].carRegNo) #</th>
        <td>#= dms.string.strNvl(data[i].regUsrNm) #</td>
        <td>#= dms.string.strNvl(expcDlDt) #</td>
        # if(data[i].roStatCd == '01') { #
        <td class="bg_red sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        # readyCnt++; #
        # } else if(data[i].roStatCd == '02') { #
        <td></td>
        <td class="bg_orange2 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        # prcStartCnt++; #
        # } else if(data[i].roStatCd == '03') { #
        <td></td>
        <td></td>
        <td class="bg_yellow2 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        <td></td>
        # prcStopCnt++; #
        # } else if(data[i].roStatCd == '04') { #
        <td></td>
        <td></td>
        <td></td>
        <td class="bg_green3 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        <td></td>
        # qtTestCnt++; #
        # } else if(data[i].roStatCd == '05') { #
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="bg_blue2 sc_event">#= data[i].roDocNo #</td>
        <td></td>
        # dlReadyCnt++; #
        # } else if(data[i].roStatCd == '06') { #
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="bg_blue3 sc_event">#= data[i].roDocNo #</td>
        # dlConfCnt++; #
        # } else {#
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        # } #
    </tr>
    # } #

    # for (var i = 0; i < 18 - data.length; i++) { #
    <tr>
        <th scope="row" style="height:30px"></th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    # } #
    # $(".totalCnt").html(totalCnt); #
    # $(".readyCnt").html(readyCnt); #
    # $(".prcStartCnt").html(prcStartCnt); #
    # $(".prcStopCnt").html(prcStopCnt); #
    # $(".qtTestCnt").html(qtTestCnt); #
    # $(".dlReadyCnt").html(dlReadyCnt); #
    # $(".dlConfCnt").html(dlConfCnt); #
</script>

<style>

    #slide-in-share { width:940px; margin-right:-940px;}
    #slide-in-share1 { width:940px; margin-right:-940px;}
    #slide-in-share1 .slide-in-handle { top:102px;}

    #scheduler1 .k-scheduler-content .k-scheduler-table, #scheduler1 .k-scheduler-header {
           width: 1360px
    }
    #scheduler1 > .k-scheduler-layout {
    table-layout: fixed;
    }

    #scheduler1 > .k-scheduler-layout > tbody > tr > td:first-child {
        width: 100px;
    }
    #scheduler1 .k-scheduler-table td {
        height: 22px !important;
    }

</style>
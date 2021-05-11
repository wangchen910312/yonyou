<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/mob/mobCommon.js"/>"></script>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<style>
*{
-webkit-touch-callout : none;
-webkit-user-select : none;
}
.k-scheduler-edit-form .k-edit-form-container,.k-scheduler-timezones .k-edit-form-container
    {
    width:520px;
}

    padding:1em 0;
}

.k-edit-form-container .k-edit-buttons {
    display:block;
}
.k-pager-numbers{display: none;}
#_overlay{background-repeat: no-repeat; background-position: 50% 45%; background-size: 48px 48px;}
</style>
<div id="_overlay" class="k-overlay" style="display: block; z-index: 10002; opacity: 0.5; background-image:url('<c:url value="/resources/img/loading-image_t.gif"/>')"></div>
<div class="header_area">
    <h1 class="title_basic"><spring:message code="ser.menu.assignMng" /><!-- 작업배분 --></h1>
    <div class="btn_right">
        <%--
        <div class="cal_state">
            <span class="s1">대기 15<!--ser.lbl.resvReady 대기--></span> <span class="s2">진행 15<!--global.lbl.progress 진행--></span>
            <span class="s3">연기 15<!--연기--></span> <span class="s4">완료 0<!--global.lbl.complete 완료--></span>
        </div>
        <button class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
        --%>
    </div>
</div>

<div class="work_scheduler">
    <!-- details_area -->
    <div class="details_area">
        <a href="javascript:;" class="details_btn">
            <!-- details_btn -->
        </a>
        <div class="details_body">
            <div class="details_top">
                <div class="form_search">
                    <input type="text" id="sRoDocNo" class="form_input" />
                    <a id="btnSearchRoList"></a>
                </div>
            </div>
            <div class="details_con">
                <input type="hidden" id="dlrCd" /> <input type="hidden" id="roGrpNo" /> <input type="hidden" id="roDocNo" />
                <div class="table_grid wa_grid">
                    <div id="roListGrid"></div>
                </div>

                <div class="table_grid wa_grid2">
                    <div id="workAssignGrid"></div>
                </div>


            </div>
        </div>
    </div>
    <!-- //details_area -->

    <!-- scheduler_area -->
    <div class="scheduler_area">
        <div id="scheduler"></div>
    </div>
    <!-- //scheduler_area -->

     <%-- <table id="bayAreaTable"><tr><th scope="row"><span class="bu_required"><spring:message code="ser.lbl.bayNm" /></span></th><td>
     <input id="bayNo" name="bayNo" data-json-obj="true" class="form_comboBox"></td></table>  rpirNm--%>


</div>

<script id="groupHeaderTemplate" type="text/x-kendo-template">
    <div class="groupHeader_th">
        <span class="th_txt">#=text#</span>
    </div>
</script>


 <script id="work_event_template" type="text/x-kendo-template">
      <div class="work_event_template" style="background-color: #=getTimelineColor(wrkStatCd)#;" >#:rpirNm # <input type="hidden" class="isLocalSaved" value="0"></div>
</script>

<section id="window_sa" class="pop_wrap" >
        <div id="scheduler_viewTooltip_" ></div>
    </section>

<script>


var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자

//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });


//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//수리유형 Array
var rpirStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});


//bay
var bayList = [];
<c:forEach var="obj" items="${bayCdList}">
bayList.push({
    "bayNo":"${obj.bayNo}"
    , "bayNm":"${obj.bayNm}"
});
</c:forEach>

/* //공통코드:bay
var bayList = [{"bayNo":"", "bayNm":""}];
<c:forEach var="obj" items="${bayList}">
bayList.push({"bayNo":"${obj.bayNo}", "bayNm":"${obj.bayNm}"});
</c:forEach> */

rpirStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rpirStatMap[val] != undefined)
        returnVal = rpirStatMap[val].cmmCdNm;
    }
    return returnVal;
}

getTimelineColor = function(val){
    var returnVal;
    if(val == '01'){
        returnVal="#a8c2d7";
    }else if(val == '02'){
        returnVal="green";
    }else if(val == '03'){
        returnVal="silvar";
    }else if(val == '04'){
        returnVal="orange";
    }else if(val == '05'){
        returnVal="pink";
    }else{
        returnVal="black";
    }
    return returnVal;
}



var sysDate = new Date("<c:out value='${sysDate}' />");


var _time = new Date();
var hour = _time.getHours()+1;
var minute = _time.getMinutes();

//var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " "+hour+":00";
var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 23:59";


var diffStartTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
var diffEndTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 23:59";
var schedulerDate=_time;

var tecId;
var row = 0;
var saveYn = false;

var currentTimeLine;
var currentLocalSaveDataArr=[];
var currentEvent;

//var currentBay="";

$(document).ready(function() {

    $(".title_basic").hide();
    $("#_overlay").hide();

    $("#bayNo").kendoExtDropDownList({
        dataSource:bayList
        ,dataValueField:"bayNo"
        ,dataTextField:"bayNm"
        ,template:"#=bayNo#[#=bayNm#]"
        ,optionLabel:" "
        ,height :200
        ,index:0
    });

    //sa kendowindow
    $("#window_sa").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        //,title:"<spring:message code="ser.lbl.preChkRemark" />" // 사전 점검 비고
        ,width:"270px"
        ,height:"200px"
    }).data("kendoWindow");


    $(".grid").kendoGrid({
        height:283
    });
    $(".grid2").kendoGrid();


    var workAssignDs = new kendo.data.DataSource({ //작업리스트
        transport:{
            read:{
                url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read" && $("#roDocNo").val() != "") {
                    var params = {};
                    params["sort"] = options.sort;
                    //params["sDlrCd"] = $("#dlrCd").val();
                    params["sDlrCd"] = dlrCd;
                    params["sRoDocNo"] = $("#roDocNo").val();
                    return kendo.stringify(params);
                } else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            data:"data",
            total:"total",
            model:{
                id:"lineNo"
                ,fields:{
                    rpirCd:{type:"string", editable:false}
                    ,roStatCd:{type:"string", editable:false}
                    ,rpirNm:{type:"string", editable:false}
                    ,wrkStatCd:{type:"string", editable:false}
                    ,rpirTp:{type:"string", editable:false}
                }
            }
        }
    });


    /*전체 리스트를 전부 가져온다  그리고 start와 end로 나눈다 */
    var workAssignScheduleDs = new kendo.data.SchedulerDataSource({//타임라인
        transport:{
            read:{
                url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
            },
            update:{},
            create:{},
            destroy:{}
            ,parameterMap:function(options, operation) {
                if (operation === "read" ) {
                    var params = {};
                    params["sort"] = options.sort;
                    params["sDlrCd"] = dlrCd;
                    //params["sRoDocNo"] = $("#roDocNo").val();
                    params["assignYn"] = "Y";
                    params["allocStartDt"] = chgDateTimeStampKendo(startTime);
                    params["allocEndDt"] = chgDateTimeStampKendo(endTime);
                    return kendo.stringify(params);
                }
                else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            data:"data",
            total:"total",
            model:{
                id:"rpirCd"
                ,fields:{
                    rpirCd:{type:"string"}
                    ,roStatCd:{type:"string"}
                    ,start:{ type:"date", from:"allocStartDt"}
                    ,end:{ type:"date", from:"allocEndDt"}
                }
            }
        }
    });


    // 담당자 DataSource
    var techManDs = new kendo.data.DataSource({
        transport:{
            read:function (options) {
                var params = {};
                params["sort"] = options.sort;
                $.ajax({
                    url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                    ,data:JSON.stringify(params)        //파라미터
                    ,type:'POST'                       //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    ,error:function(jqXHR,status,error){
                        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                    }
                }).done(function(body) {
                    options.success(body);
                });
            }
        }
        ,schema:{
             data:"data"
            ,total:"total"
            ,model:{
                id:"realTecId"
                ,fields:{
                    realTecId:{type:"string", from:"tecId"}
                    ,dlrCd:{type:"string"}
                    ,rnum:{type:"string"}
                    ,tecNm:{type:"string", form:"tecNm"}
                    ,tecMfnNm:{type:"string"}
                    ,tecSfnNm1:{type:"string"}
                    ,tecSfnNm2:{type:"string"}
                    ,tecSfnNm3:{type:"string"}
                }
            }
        }
    });





    //scheduler
    $("#scheduler").kendoScheduler({
        date:sysDate,
        height:600,
        startTime:new Date(startTime),
        endTime:new Date(endTime),
        //showWorkHours:true,
        allDaySlot:false,
        selectable:true,
        //autoBind:false,
        footer:false,
        messages:{
            today:"<spring:message code='ser.lbl.today' />"
        },
        views:[{
            type:"timeline",
            eventHeight:60, //34
            columnWidth:28,
            minorTickCount:6,
            eventTemplate:$("#work_event_template").html()
        }],
        moblie:"tablet",
        editable:{
            create:false,
            update:false,
            destroy:false,
            move:true,
            window:{
                animation:false
            }
        },
        dataSource:workAssignScheduleDs,

        moveEnd:function(e) {
            if(e.start<_time){
                dms.notification.info("<spring:message code='ser.info.assign.beforeTime'/>");//khs
                e.preventDefault();
            }else{
                for(var i=0; i<techManDs._data.length; i++){
                    if(techManDs._data[i].realTecId == e.resources.realTecId){
                        e.event.realTecId = techManDs._data[i].realTecId;
                        e.event.realTecNm = techManDs._data[i].tecNm;
                        e.event.tecId = techManDs._data[i].realTecId;
                        e.event.tecNm = techManDs._data[i].tecNm;
                        break;
                    }
                }
            }
        },
        /*
        resizeStart:function(e){
            //scheduler = $("#scheduler").getKendoScheduler();

            if(e.start<_time){
                dms.notification.info("<spring:message code='ser.info.assign.beforeTime'/>");//khs
                e.preventDefault();
            }
        },
        resizeEnd:function(e) {
            //scheduler = $("#scheduler").getKendoScheduler();

            if(e.start<_time){
                dms.notification.info("<spring:message code='ser.info.assign.beforeTime'/>");//khs
                e.preventDefault();
            }
        }, */
        navigate:function(e){
            schedulerDate=e.date;

            startTime = printDate(e.date) + " 08:00";
            endTime = printDate(e.date) + " 23:59";

            scheduler.setOptions({startTime: new Date(diffStartTime)});
            scheduler.setOptions({endTime: new Date(diffEndTime)});
            $("#scheduler").data("kendoScheduler").dataSource.read();

        },
        group:{
            resources:["LINE"],
            orientation:"vertical"
        },
        groupHeaderTemplate:$("#groupHeaderTemplate").html(),
        resources:[{
            field:"realTecId"
           ,name:"LINE"
           ,dataTextField:"tecNm"
           ,dataValueField:"realTecId"
           ,dataSource:techManDs // 담당자 DataSource
           ,title:"LINE"
        }]
        ,change:function(e){

        }
        ,dataBound:function(e){
            var timeLines=$(".k-event");
            for(var i=0; i<currentLocalSaveDataArr.length; i++){
                for(var j=0; j<timeLines.length; j++){
                    if(currentLocalSaveDataArr[i].uid == timeLines[j].dataset.uid){
                        timeLines[j].style.border="2px red dotted";
                    }
                }
            }

        }
    });


    var scheduler = $("#scheduler").data("kendoScheduler");
    $("a.details_btn").on("click", function(){
        var detailArea = $(this).parent("div.details_area");
        if(detailArea.hasClass("closed")){
            detailArea.removeClass("closed");
        }else{
            detailArea.addClass("closed");
        }
        scheduler.refresh();
    });



    // 그리드 설정
    $("#roListGrid").kendoExtGrid({
        gridId:"G-SER-160728-172625"
        ,height:345
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sListType"] = "AL";
                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                data:"data",
                total:"total",
                 model:{
                    id:"saId",
                    fields:{
                        dlrCd:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,vinNo:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,saNm:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,expcDlDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,roStatCd:{type:"string"}
                        ,saId:{type:"string" }
                    }
                }
            }
        }
        ,editable:false
        //,selectable:"row"
        ,selectable:"row"
        //,pageable:false
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            if(dataItem != null){
                $("#roDocNo").val(dataItem.roDocNo);
                $("#dlrCd").val(dataItem.dlrCd);
                workAssignDs.read();
                $(".grid-checkAll").prop("checked", false);
            }
        }
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        //,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        //,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        //,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        //,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,dataBound:function(e) {
            //if(saveYn){
                e.sender.select(e.sender.tbody.find("tr")[row]);
            //}
            $(".k-scheduler-times tr:eq(1) th").text('<spring:message code="global.lbl.bayNm" /> / <spring:message code="ser.lbl.dt" />').css("text-align","center").css("background-color","#f7f7f7").css("color","black");
            $(".k-pager-numbers").hide();
            $(".k-pager-sizes").css("margin-left","8%");
            var timeLine = $(".k-current-time").attr("style").split(";");
            var leftVal = timeLine[0].split(":");
            var scrollLeftVal = leftVal[1].split(".");

            $("div.k-scheduler-content","#scheduler").animate({
                scrollLeft: scrollLeftVal[0] - 50
            });
        }
        ,columns :
            [
             {field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' /><br/><spring:message code='ser.lbl.vinNo' />",
                template:'#=roDocNo#<br/>#=vinNo#', width:150
                }
             ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' /><br/><spring:message code='ser.lbl.repairStat' />",
                template:'#=trimNull(carRegNo)#<br/>#=roStatCdGrid(roStatCd)#', width:100//차량등록번호
                ,attributes:{"class":"ac"},
                headerAttributes:{ "class":"ac" }
             }
            ]
    });


    // 그리드 설정
    $("#workAssignGrid").kendoExtGrid({
        gridId:"G-SER-160728-172927"
            ,dataSource:workAssignDs
            ,change:function(e){}
            ,height:169
            ,pageable:false
            ,sortable:false
            ,editable:false
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,selectable:"row"
            //,selectable:"row"
            //,multiSelectWithCheckbox:true     //멀티선택 적용. default:false

            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,autoBind:false
            , edit:function(e){
                var eles = e.container.find("input"),
                rows = e.sender.select(),
                selectedItem = e.sender.dataItem(rows[0]),
                grid = this,
                input = e.container.find(".k-input"),
                pVal,
                orgVal,
                fieldName = grid.columns[e.container.index()].field;

                if(fieldName === "chk"){
                    this.closeCell();
                }

            }
            ,dataBound:function(e) {
                console.log(e);
            }

            ,columns:[
                  {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                      ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                      ,sortable:false
                      ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                  },
                {field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />",  width:70//공임코드
                    ,attributes:{"class":"ac"}
                }
                ,{field:"rpirNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:150//정비항목
                    ,attributes:{"class":"ac"}
                }
                <%--
                ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />' />",  width:50//수리구분
                    ,template:"#=rpirStatGrid(rpirTp)#"
                }
                --%>
            ]
    });

    //details item show/hide
    $(".details_item>.item_top").on("click", function(){
        if($(this).hasClass("active")){
            $(this).removeClass("active").next(".item_con").hide();
        }else{
            $(this).addClass("active").next(".item_con").show();
        }
    });


    $("#scheduler").on("click", '.k-scheduler-table td', function(e) {
        scheduler = $("#scheduler").getKendoScheduler();

        if(scheduler._selection.start<_time){
            dms.notification.info("<spring:message code='ser.info.assign.beforeTime'/>");//khs
            return;
        }

        var tecId;
        var roDocNo;
        var rpirCd;
        var rpirNm;
        var roStatCd;
        var lineNo = "";
        var bayNo="";

        var scheduler;
        var element;
        var event;
        var startT;
        var endT="";

        var chkRow;
        var grid;
        var rows;




        //scheduler = $("#scheduler").getKendoScheduler();
        element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
        event = scheduler.occurrenceByUid(element.data("uid"));

        startT = chgDate2TimeStr(scheduler._selection.start);
        endT = chgDate2TimeStr(scheduler._selection.end);

        console.log("startT="+startT);
        console.log("endT="+endT);

        //scheduler._selection.end.setMinutes(scheduler._selection.end.getMinutes() + 20);
        //scheduler._selection.end.setMinutes(scheduler._selection.start.getMinutes() + 20);
        tecId = "";
        var tecNm = "";
        var groupIdx = 0;
        groupIdx = scheduler._selection.groupIndex;
        tecId = scheduler.resources[0].dataSource._data[groupIdx].realTecId;
        tecNm = scheduler.resources[0].dataSource._data[groupIdx].tecNm;
        var gd = $('#workAssignGrid').data('kendoExtGrid');

        /*
        var rows = gd.select();
        var selecLeng = gd.select().length;
        */
        grid          = $("#workAssignGrid").data("kendoExtGrid"),
        rows          = grid.tbody.find("tr");

        rows.each(function(index, row) {
            //var gdItem = gd.dataItem(row);
            var gdItem = grid.dataSource.at(index);
            chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

            if(gdItem==null||gdItem==""){
                 dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                 return;
            }

            if(chkRow === true){
                gdItem.saId = userId;
                gdItem.saNm = userNm;
                gdItem.tecId = tecId;
                gdItem.tecNm = tecNm;
                roDocNo = gdItem.roDocNo;
                var scheduleDs = $("#scheduler").data('kendoScheduler').dataSource;

                var isAlloc = false;
                if(gdItem.tecId != null && gdItem.tecId != ""){ // 배정건일 경우
                    for(var i=0; i< scheduleDs._data.length; i++){
                        if( (scheduleDs._data[i].roDocNo == gdItem.roDocNo) &&
                                (scheduleDs._data[i].rpirCd == gdItem.rpirCd) ){

                            scheduleDs._data[i].realTecId = tecId;
                            scheduleDs._data[i].realTecNm = tecNm;
                            scheduleDs._data[i].start = scheduler._selection.start;
                            scheduleDs._data[i].end = scheduler._selection.end;

                            var tempDate = new Date();

                            tempDate = scheduleDs._data[i].end;
                            //tempDate.setMinutes(tempDate.getMinutes() + Number((Number(gdItem.planHm) * 60))); // khskhs 일부러 한 것 입니까?
                            scheduleDs._data[i].end = tempDate;
                            scheduler._selection.end = scheduleDs._data[i].end;

                            isAlloc = true;
                        }
                    }

                }


                if(!isAlloc){
                scheduler._selection.end.setMinutes(scheduler._selection.end.getMinutes() + Number((Number(gdItem.planHm) * 60) - 10));
                var tempDs={
                        "dlrCd":gdItem.dlrCd               //딜러코드
                        ,"roDocNo":gdItem.roDocNo            //RO문서번호
                        ,"lineNo":gdItem.lineNo              //라인번호
                        ,"bayNo":gdItem.bayNo               //베이번호
                        ,"rpirTp":gdItem.rpirTp              //수리유형
                        ,"rpirCd":gdItem.rpirCd              //수리코드
                        ,"rpirNm":gdItem.rpirNm              //수리명
                        ,"rpirDstinCd":gdItem.rpirDstinCd        //수리구분코드
                        ,"wrkStatCd":gdItem.wrkStatCd          //작업상태코드
                        ,"carWashStatCd":gdItem.carWashStatCd     //세차상태코드
                        ,"paintStatCd":gdItem.paintStatCd        //페인트상태코드
                        ,"qtTestStatCd":gdItem.qtTestStatCd      //품질검사상태코드
                        ,"qtTestCd":gdItem.qtTestCd           //품질검사코드
                        ,"realTecId":tecId
                        ,"realTecNm":tecNm
                        ,"tecId":tecId
                        ,"tecNm":tecNm
                        ,"wrkStartDt":chgDateTimeStampKendo(chgServerDateTime2Str(scheduler._selection.start))
                        ,"wrkEndDt":chgDateTimeStampKendo(chgServerDateTime2Str(scheduler._selection.end))
                        ,"planHm":gdItem.planHm              //계획시간
                        ,"allocHm":gdItem.allocHm             //계획시간
                        ,"shtCnt":gdItem.shtCnt              //판금건수
                        ,"paintCnt":gdItem.paintCnt            //페인트건수
                        ,"lbrCnt":gdItem.lbrCnt              //공임계수
                        ,"diffVal":gdItem.diffVal             //난의도
                        ,"allocStatCd":gdItem.allocStatCd        //배정상태
                        ,"allocStartDt":chgDateTimeStampKendo(gdItem.allocStartDt)
                        ,"allocEndDt":chgDateTimeStampKendo(gdItem.allocEndDt)
                        ,"regUsrId":gdItem.regUsrId          //수정자ID
                        ,"regDt":gdItem.regDt               //등록일자
                        ,"updtUsrId":gdItem.updtUsrId          //수정자ID
                        ,"updtDt":gdItem.updtDt              //수정일자
                        ,"pauseCauCd":gdItem.pauseCauCd         //중지원인코드
                        ,"pauseCauRmk":gdItem.pauseCauRmk        //중지비고
                        ,"wkgrpNo":gdItem.wkgrpNo             //소조번호
                        ,"wkgrpNm":gdItem.wkgrpNm             //소조명
                        ,"start":scheduler._selection.start
                        ,"end":scheduler._selection.end
                        };
                scheduleDs.add(tempDs);

            }
            }
        });

        $("#scheduler").data('kendoScheduler').refresh();

        var grid = $("#workAssignGrid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");
        $(".grid-checkAll").prop("checked", false);
        grid.clearSelection();
        rows.each(function(index, row) {
            $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
        });

    });

  //khskhs doubletab
  var tapedTwice = false;
  $("#scheduler").on('touchend','.k-event', function(e){
      if(!tapedTwice){
          tapedTwice=true;
          setTimeout(function(){tapedTwice = false;},500);
      }else{
          e.preventDefault();
          currentTimeLine = e.currentTarget;
          var roDocNo;
          var rpirCd;
          var rpirNm;
          var lineNo = "";
          var bayNo="";

          var scheduler;
          var element;
          var event;
          var startT;
          var endT;

          scheduler = $("#scheduler").getKendoScheduler();
          element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
          event = scheduler.occurrenceByUid(element.data("uid"));

          startT = chgDate2TimeStr(scheduler._selection.start);
          endT = chgDate2TimeStr(scheduler._selection.end);

          if ( event ) {      // 수정 / 삭제
              roDocNo = event.roDocNo;
              rpirCd = event.rpirCd;
              rpirNm = event.rpirNm;
              lineNo = event.lineNo;
              bayNo = event.bayNo;

              var win = $("#window_sa").data("kendoWindow");
              $("#open_saInput_textarea").val($("#open_saInput").text());
              $("#baySelect").val("");
              win.center();
              win.open();
              currentEvent=event;
          }
          setDetailInfo(roDocNo, rpirCd, rpirNm, lineNo, startT, endT, bayNo);
       }

   });
   //khskhs doubletab

    $("#btnSearchRoList").click(function(){
        $("#roListGrid").data("kendoExtGrid").dataSource.read();
        if($("#sRoDocNo").val() != null || $("#sRoDocNo").val() != ""){
            $("#roDocNo").val($("#sRoDocNo").val());
        }
        $("#workAssignGrid").data("kendoExtGrid").dataSource.read();
        $(".grid-checkAll").prop("checked", false);
    });

    $(document).on('change','#baySelect', function(){
        var currentBay=$(this).val();
        var currnetRoDocNo=$(".scheduler_viewLayer #currnetRoDocNo").val();
        var currnetlineNo=$(".scheduler_viewLayer #currnetlineNo").val();

        var scheduleDs = $("#scheduler").data('kendoScheduler').dataSource;
        var dataItem = scheduleDs.data();

        for(var i=0; i<dataItem.length; i++){
            if(dataItem[i].roDocNo == currnetRoDocNo && dataItem[i].lineNo == currnetlineNo){
                dataItem[i].bayNo=currentBay;
                break;
            }
        }
    });

    $(".k-scheduler-toolbar").append('<button type="button" id="saveAll" class="btn_m btn_save"><spring:message code="ser.btn.confirm" /></button>');
    $("#scheduler .k-scheduler-navigation").css("padding-top","8px");

    $(document).on('click','#saveAll', function(){
        if(currentLocalSaveDataArr.length < 1){
            return false;
        }
        $("#_overlay").show();
        var workAssignData = [];
        for(var i=0; i<currentLocalSaveDataArr.length; i++){
            var insertData = {};
            insertData.dlrCd=currentLocalSaveDataArr[i].dlrCd;               //딜러코드
            insertData.roDocNo=currentLocalSaveDataArr[i].roDocNo;            //RO문서번호
            insertData.lineNo=currentLocalSaveDataArr[i].lineNo;              //라인번호
            insertData.bayNo=currentLocalSaveDataArr[i].bayNo;               //베이번호
            insertData.rpirTp=currentLocalSaveDataArr[i].rpirTp;              //수리유형
            insertData.rpirCd=currentLocalSaveDataArr[i].rpirCd;              //수리코드
            insertData.rpirNm=currentLocalSaveDataArr[i].rpirNm;              //수리명
            insertData.rpirDstinCd=currentLocalSaveDataArr[i].rpirDstinCd;        //수리구분코드
            insertData.wrkStatCd=currentLocalSaveDataArr[i].wrkStatCd;          //작업상태코드
            insertData.carWashStatCd=currentLocalSaveDataArr[i].carWashStatCd;     //세차상태코드
            insertData.paintStatCd=currentLocalSaveDataArr[i].paintStatCd;        //페인트상태코드
            insertData.qtTestStatCd=currentLocalSaveDataArr[i].qtTestStatCd;      //품질검사상태코드
            insertData.qtTestCd=currentLocalSaveDataArr[i].qtTestCd;           //품질검사코드
            insertData.realTecId = currentLocalSaveDataArr[i].realTecId;
            insertData.realTecNm = currentLocalSaveDataArr[i].realTecNm;
            insertData.planHm=currentLocalSaveDataArr[i].planHm;              //계획시간
            insertData.allocHm=currentLocalSaveDataArr[i].allocHm;             //계획시간
            insertData.shtCnt=currentLocalSaveDataArr[i].shtCnt;              //판금건수
            insertData.paintCnt=currentLocalSaveDataArr[i].paintCnt;            //페인트건수
            insertData.lbrCnt=currentLocalSaveDataArr[i].lbrCnt;              //공임계수
            insertData.diffVal=currentLocalSaveDataArr[i].diffVal;             //난의도
            insertData.allocStatCd="03";        //배정상태
            insertData.allocStartDt = chgDateTimeStampKendo(chgServerDateTime2Str(currentLocalSaveDataArr[i].start));//chgDateTimeStampKendo(currentLocalSaveDataArr[i].allocStartDt);
            insertData.allocEndDt = chgDateTimeStampKendo(chgServerDateTime2Str(currentLocalSaveDataArr[i].end));//chgDateTimeStampKendo(currentLocalSaveDataArr[i].allocEndDt);
            insertData.regUsrId=currentLocalSaveDataArr[i].regUsrId;          //수정자ID
            insertData.regDt=chgDateTimeStampKendo(currentLocalSaveDataArr[i].regDt);               //등록일자
            insertData.updtUsrId=currentLocalSaveDataArr[i].updtUsrId;          //수정자ID
            insertData.updtDt=currentLocalSaveDataArr[i].updtDt;              //수정일자
            insertData.pauseCauCd=currentLocalSaveDataArr[i].pauseCauCd;         //중지원인코드
            insertData.pauseCauRmk=currentLocalSaveDataArr[i].pauseCauRmk;        //중지비고
            insertData.wkgrpNo=currentLocalSaveDataArr[i].wkgrpNo;             //소조번호
            insertData.wkgrpNm=currentLocalSaveDataArr[i].wkgrpNm;             //소조명
            insertData.saNm=userNm; //배정자
            insertData.saId=userId; //배정자
            workAssignData.push(insertData);
        }


        var jsonData = {"insertList":[],"updateList":[],"deleteList":[]};
        jsonData.insertList = workAssignData;

        for(var i=0; i<jsonData.insertList.length; i++){
            console.log(jsonData.insertList[i]);
        }

        /* $.ajax({
            url:"<c:url value='/ser/ro/workAssign/insertWorkAssigns.do' />",
            data:JSON.stringify(jsonData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                currentLocalSaveDataArr.length=0;
                scheduler.refresh();
                dms.notification.error(jqXHR.responseJSON.errors);
                $("#_overlay").hide();
            },
            success:function(jqXHR, textStatus) {
                currentLocalSaveDataArr.length=0;
                scheduler.refresh();
                dms.notification.success("<spring:message code='global.info.success'/>");
                $("#_overlay").hide();
            }
        }); */

    });

});




function setDetailInfo(roDocNo, rpirCd, rpirNm, lineNo, startT, endT, bayNo){
    var strHtml =
        '<div class="scheduler_viewLayer" style="width:250px; height:200px;">'
        +'  <div class="views_con" style="width:250px; height:200px; margin-top:10px; ">'
        +'      <h3>'+roDocNo+'</h3>'
        +'      <p class="views_txt">'+rpirCd+'('+rpirNm+')'+'</p>'
        +'      <div class="views_time">'
        +'          <p class="start_time">'+startT+'</p>'
        +'          <p class="end_time">'+endT+'</p>'
        +'          <input type="hidden" id="currnetRoDocNo" value='+roDocNo+'>'
        +'          <input type="hidden" id="currnetlineNo" value='+lineNo+'>'
        +'      </div>'
        +'      <div id="bayArea" style="margin-top:10px;">'
        +'      </div>'
        +'      <ul class="views_btn">'
        +'          <li class="btn_save"><a id="btnSave" class="k-tooltip-button" onclick="saveEvent('+"'"+roDocNo+"','"+lineNo+"'"+');"></a></li>'
        +'          <li class="btn_detail"><a class="k-tooltip-button" onclick="detailEvent('+"'"+roDocNo+"'"+');"></a></li>'
        +'          <li class="btn_cancel"><a class="k-tooltip-button" onclick="deleteEvent('+"'"+roDocNo+"','"+lineNo+"'"+');"></a></li>'
        +'      </ul>'
        +'  </div>'
        //+'  <a href="javascript:;" class="views_close k-tooltip-button">close</a>'
        +'</div>';
    $("#window_sa").html(strHtml);


    var i=0;
    var bayAreaHtml='<div class="views_time"><span class="bu_required" style="font-size: 15px;"><spring:message code="ser.lbl.bayNm" /></span><select id="baySelect" style="float:right;height: 25px;">'
    for(i=0; i<bayList.length; i++){
        if(bayNo==bayList[i].bayNo){
            bayAreaHtml+='<option value='+bayList[i].bayNo+' selected>'+bayList[i].bayNm+'</option>';
        }else{
            bayAreaHtml+='<option value='+bayList[i].bayNo+'>'+bayList[i].bayNm+'</option>';
        }
    }
    bayAreaHtml+='</select></div>';
    $("#bayArea").html(bayAreaHtml);
}


function updateEventTime(roDocNo, rpirCd, start, end, tecId){
    var dataItem = $("#scheduler").data('kendoScheduler').dataSource.data();
    var jsonData = {"insertList":[],"updateList":[],"deleteList":[]}
    var resourceData = $("#scheduler").data('kendoScheduler').resources[0].dataSource.data();

    var tecNm = "";
    for(var i = 0; i < resourceData.length; i++){
        if( resourceData[i].realTecId == tecId ){
            tecNm = resourceData[i].realTecNm;
        }
    }

    var scheduleDs = $("#scheduler").data('kendoScheduler').dataSource;

    for(var i=0; i< scheduleDs._data.length; i++){
        if( (scheduleDs._data[i].roDocNo == roDocNo) &&
                (scheduleDs._data[i].rpirCd == rpirCd) ){
            scheduleDs._data[i].realTecId = tecId;
            scheduleDs._data[i].realTecNm = tecNm;
            scheduleDs._data[i].start = start;
            scheduleDs._data[i].end = end;
        }
    }
}

function saveEvent(roDocNo,lineNo){
    if($("#baySelect").val() == null || $("#baySelect").val() == ""){
        dms.notification.info("<spring:message code='ser.lbl.bayNm' var='bayNm' /><spring:message code='global.info.required.field' arguments='${bayNm}' />");
        return false;
    }

    if(currentLocalSaveDataArr.length == 0){
        currentLocalSaveDataArr.push(currentEvent);
    }else{
        var isNew="y";
        for(var i=0; i<currentLocalSaveDataArr.length; i++){
            if(currentLocalSaveDataArr[i].uid==currentEvent.uid){
                currentLocalSaveDataArr[i]=currentEvent;//같으면 바꾸기
                isNew="n";
            }
        }
        if(isNew=="y"){
            currentLocalSaveDataArr.push(currentEvent);
        }
    }

    currentTimeLine.style.border="2px red dotted";
    $("#window_sa").data("kendoWindow").close();

}


function detailEvent(roDocNo){
    if(roDocNo == null || roDocNo == ""){
        return false;
    }
    var roDsData = $('#roListGrid').data('kendoExtGrid').dataSource._data;
    var roIdx = 0;
    for(var i=0; i < roDsData.length; i++){
        if(roDsData[i].roDocNo == roDocNo){
            roIdx = i;
        }
    }
    detailPop = dms.window.popup({
        windowId:"detailPop"
        ,width:"950px"
        ,height:"340px"
        ,title:"RO <spring:message code='sal.lbl.detailSearch' />"   // RO 상세조회
        ,content:{
            url:"<c:url value='/mob/waSer/ro/workAssign/selectWaWorkAssignRoDetailPopup.do'/>"
            ,data:{
                "roDocNo":roDocNo // ro번호
                ,"driverNm":roDsData[roIdx].driverNm // 고객명
                ,"carRegNo":roDsData[roIdx].carRegNo // 차량번호
                ,"roStatCdNm":roStatCdGrid(roDsData[roIdx].roStatCd) // 수리상태
                ,"roDt":chgServerDateTime2Str2(roDsData[roIdx].roDt) // Ro 생성일자
                ,"roTpNm":roTpCdGrid(roDsData[roIdx].roTp) // Ro 유형
            }
        }
    });
}


function deleteEvent(roDocNo, lineNo){
    if(roDocNo == null || roDocNo == ""){
        return false;
    }
    var roDsData = $("#scheduler").data('kendoScheduler').dataSource._data;
    var delIdx=-1;
    for(var i=0; i < roDsData.length; i++){
        if( (roDsData[i].roDocNo == roDocNo) && (roDsData[i].lineNo == lineNo) ){
            delIdx = i;
        }
    }
    var insertData = {};
    //if(delIdx != "" && delIdx != null){
        insertData.dlrCd=roDsData[delIdx].dlrCd;               //딜러코드
        insertData.roDocNo=roDsData[delIdx].roDocNo;            //RO문서번호
        insertData.lineNo=roDsData[delIdx].lineNo;              //라인번호
        insertData.bayNo=roDsData[delIdx].bayNo;               //베이번호
        insertData.rpirTp=roDsData[delIdx].rpirTp;              //수리유형
        insertData.rpirCd=roDsData[delIdx].rpirCd;              //수리코드
        insertData.rpirNm=roDsData[delIdx].rpirNm;              //수리명
        insertData.rpirDstinCd=roDsData[delIdx].rpirDstinCd;        //수리구분코드
        insertData.wrkStatCd=roDsData[delIdx].wrkStatCd;          //작업상태코드
        insertData.carWashStatCd=roDsData[delIdx].carWashStatCd;     //세차상태코드
        insertData.paintStatCd=roDsData[delIdx].paintStatCd;        //페인트상태코드
        insertData.qtTestStatCd=roDsData[delIdx].qtTestStatCd;      //품질검사상태코드
        insertData.qtTestCd=roDsData[delIdx].qtTestCd;           //품질검사코드
        insertData.realTecId = roDsData[delIdx].realTecId;
        insertData.realTecNm = roDsData[delIdx].realTecNm;
        insertData.wrkStartDt = chgDateTimeStampKendo(chgServerDateTime2Str(roDsData[delIdx].start));
        insertData.wrkEndDt = chgDateTimeStampKendo(chgServerDateTime2Str(roDsData[delIdx].end));
        insertData.planHm=roDsData[delIdx].planHm;              //계획시간
        insertData.allocHm=roDsData[delIdx].allocHm;             //계획시간
        insertData.shtCnt=roDsData[delIdx].shtCnt;              //판금건수
        insertData.paintCnt=roDsData[delIdx].paintCnt;            //페인트건수
        insertData.lbrCnt=roDsData[delIdx].lbrCnt;              //공임계수
        insertData.diffVal=roDsData[delIdx].diffVal;             //난의도
        insertData.allocStatCd=roDsData[delIdx].allocStatCd;        //배정상태
        insertData.allocStartDt = chgDateTimeStampKendo(roDsData[delIdx].allocStartDt);
        insertData.allocEndDt = chgDateTimeStampKendo(roDsData[delIdx].allocEndDt);
        insertData.regUsrId=roDsData[delIdx].regUsrId;          //수정자ID
        insertData.regDt=chgDateTimeStampKendo(roDsData[delIdx].regDt);               //등록일자
        insertData.updtUsrId=roDsData[delIdx].updtUsrId;          //수정자ID
        insertData.updtDt=roDsData[delIdx].updtDt;              //수정일자
        insertData.pauseCauCd=roDsData[delIdx].pauseCauCd;         //중지원인코드
        insertData.pauseCauRmk=roDsData[delIdx].pauseCauRmk;        //중지비고
        insertData.wkgrpNo=roDsData[delIdx].wkgrpNo;             //소조번호
        insertData.wkgrpNm=roDsData[delIdx].wkgrpNm;             //소조명
    //}

    $.ajax({
        url:"<c:url value='/mob/waSer/ro/workAssign/deleteWorkAssign.do' />",
        data:JSON.stringify(insertData),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {
            /* $("#roListGrid").data("kendoExtGrid").dataSource.read();
            $("#scheduler").data('kendoScheduler').dataSource._destroyed = [];
            $("#scheduler").data('kendoScheduler').dataSource.read(); */

            $("#scheduler").data('kendoScheduler').dataSource._data.splice(delIdx,1);
            $("#window_sa").data("kendoWindow").close();

            $("#scheduler").data('kendoScheduler').refresh();
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}


//RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
}

//RO상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
}


//scheduler_viewLayer tooltip addClass
function add_class() {
    this.popup.element.addClass("scheduler_tooltip");
}




$(document).on("click", ".grid-checkAll", function(e){
    var grid = $("#workAssignGrid").data("kendoExtGrid");
    var checked = $(this).is(":checked");
    var rows = grid.tbody.find("tr");
    if(checked){
        rows.each(function(index, row) {
            grid.select($(this));
            $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
        });
    }else{
        grid.clearSelection();
        rows.each(function(index, row) {
            $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
        });
    }
});


//khskhs doubletab
/* (function($){

    $.event.special.doubletap = {
      bindType: 'touchend',
      delegateType: 'touchend',

      handle: function(event) {
        var handleObj   = event.handleObj,
            targetData  = jQuery.data(event.target),
            now         = new Date().getTime(),
            delta       = targetData.lastTouch ? now - targetData.lastTouch : 0,
            delay       = delay == null ? 300 : delay;

        if (delta < delay && delta > 30) {
          targetData.lastTouch = null;
          event.type = handleObj.origType;
          ['clientX', 'clientY', 'pageX', 'pageY'].forEach(function(property) {
            event[property] = event.originalEvent.changedTouches[0][property];
          })

          // let jQuery handle the triggering of "doubletap" event handlers
          handleObj.handler.apply(this, arguments);
        } else {
          targetData.lastTouch = now;
        }
      }
    };

  })(jQuery); */
//khskhs doubletab
function printDate(date){
    var dateStr = padStr(date.getFullYear())+"/"+padStr(1+date.getMonth())+"/"+padStr(date.getDate());
    return dateStr;
}
function padStr(i){
    return(i<10) ? "0"+i : ""+i;
}
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="slide_menu">
    <div id="slide-in-share" class="slide-in-share">
        <a id="slide-in-handle" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.resvBoard" /><!-- 예약현황보드 --></span></a>
        <div id="scheduler"></div>
    </div>
    <c:if test="${(preFixId ne 'RE') && (preFixId ne 'PC')}">
        <div id="slide-in-share1" class="slide-in-share">
            <a id="slide-in-handle1" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.preInsBoard" /><!-- 사전점검보드 --></span></a>
            <div class="slide-content"><div id="scheduler1"></div></div>
        </div>
        <div id="slide-in-share2" class="slide-in-share">
            <a id="slide-in-handle2" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.guideBoard" /><!-- 인도현황보드 --></span></a>
            <div class="slide-content"><div id="scheduler2"></div><spring:message code="ser.lbl.guideBoard" /></div>
        </div>
    </c:if>
    <c:if test="${preFixId eq 'RO'}">
        <div id="slide-in-share3" class="slide-in-share">
            <a id="slide-in-handle3" class="slide-in-handle" href="#"><span class="txt_middle"><spring:message code="ser.lbl.guideBoard" /><!-- 인도현황보드 --></span></a>
            <div class="slide-content">
                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip2" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active"><spring:message code="ser.menu.reservMng"/></li><!-- 예약관리 -->
                        <li><spring:message code="ser.menu.partResvCreate" /></li><!-- 부품예약 -->
                        <li><spring:message code="ser.menu.estCreate" /></li><!-- 견적등록 -->
                        <li><spring:message code="ser.title.helpService" /></li> <!-- 구원서비스 -->
                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 예약관리 -->
                    <div class="mt0" style="height:150px;">
                        <div class="header_area">
                            <%-- <div class="btn_right">
                                <button type="button" class="btn_s btn_roCreate"><spring:message code="ser.menu.roCreate"/></button> <!-- RO등록 -->
                            </div> --%>
                        </div>
                        <div class="table_grid">
                            <div id="resvGrid"></div>
                        </div>
                    </div>
                    <!-- //예약관리 -->

                    <!-- 부품예약 -->
                    <div class="table_grid mt0" style="height:150px;">
                        <div class="header_area">
                            <%-- <div class="btn_right">
                                <button type="button" class="btn_s btn_roCreate"><spring:message code="ser.menu.roCreate"/></button> <!-- RO등록 -->
                            </div> --%>
                        </div>
                        <div id="partResvGrid"></div>
                    </div>

                    <!-- //부품예약 -->

                    <!-- 견적등록 -->
                     <div class="table_grid mt0" style="height:150px;">
                        <div class="header_area">
                            <%-- <div class="btn_right">
                                <button type="button" class="btn_s btn_roCreate"><spring:message code="ser.menu.roCreate"/></button> <!-- RO등록 -->
                            </div> --%>
                        </div>
                        <div id="estGrid"></div>
                    </div>
                    <!-- //견적등록 -->

                    <!-- 구원서비스 -->
                    <div class="table_grid mt0" style="height:150px;">
                        <div class="header_area">
                            <%-- <div class="btn_right">
                                <button type="button" class="btn_s btn_roCreate"><spring:message code="ser.menu.roCreate"/></button> <!-- RO등록 -->
                            </div> --%>
                        </div>
                        <div id="helpSvcGrid"></div>
                    </div>
                    <!-- //구원서비스 -->
                </div>
                <!-- //탭메뉴 전체 영역 -->
           </div>
        </div>
    </c:if>
</section>


<script id="info-confirmation" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='ser.lbl.resvInfo' var='resvInfo' /><spring:message code='global.info.callSelectItem' arguments='${resvInfo},' /></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<script id="info-init" type="text/x-kendo-template">
<div class="pop_wrap">
    <div class="msg_box">
        <p><spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /></p>
    </div>
    <div class="btn_bottom">
        <button type="button" class="btn_m btn_yes"><spring:message code='global.lbl.yes'/></button>
        <button type="button" class="btn_m btn_no"><spring:message code='global.lbl.n'/></button>
    </div>
</div>
</script>

<!-- 스케쥴러에 나타나는  예약 정보 -->
<script id="resvInfoView" type="text/x-kendo-template">
    #if(noResvTp == '02') {#
        <div class="noresvtp">
            #=title#:<spring:message code="ser.lbl.doNotResv" />
        </div>
    #} else {#
        <div id="resvItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #title#:#=carOwnerNm#
            <br>
            #=resvDocNo#
        </div>
    #}#
</script>

<script id="resvItemTooltip" type="text/x-kendo-template">
    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#

    #if(model) {#

        <div>
            <div class="carDetail_popup" style="top:-80%; left:5%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            #if(model.noResvTp != '02') {#
                            <li><spring:message code="ser.lbl.carRegNo" />:#=model.title#</li>
                            <li><spring:message code="sal.lbl.usrNm" />:#=model.driverNm#</li>
                            <li><spring:message code="ser.lbl.custRemark" />:#=model.custRemark#</li>
                            #}#
                            <li><spring:message code="ser.lbl.resvDt" />:#=kendo.format('{0:HH:mm}', model.start)# ~ #=kendo.format('{0:HH:mm}', model.end)#</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    #}#

</script>

<!-- 스케쥴러에 나타나는  사전점검 정보 -->
<script id="preChkInfoView" type="text/x-kendo-template">
        <div id="preChkItem" style="display:table-cell;text-align:center;vertical-align:middle;">
            #title == 'null' ? '':title#:#=driverNm#
            <br>
            #=diagDocNo#
        </div>
</script>

<script id="preChkTooltip" type="text/x-kendo-template">

    #var uid = target.attr("data-uid");#
    #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
    #var model = scheduler.occurrenceByUid(uid);#

        <div>
            <div class="carDetail_popup" style="top:-80%; left:5%; width:240px">
                <div class="clfix">
                    <div class="txt_area">
                        <ul>
                            <li><spring:message code="ser.lbl.vinNo" />:#=model.vinNo#</li>
                            <li><spring:message code="ser.lbl.preInsNo" />:#=model.diagDocNo#</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

</script>

<script type="text/javascript">


//Confirm Modal
var confirmWindow = $("<div/>").kendoWindow({
    title:""
    ,resizable:false
    ,modal:true
    ,width:300
});

//공통코드:예약상태
var resvStatList = [];
<c:forEach var="obj" items="${resvStatDs}">
resvStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var resvStatMap = dms.data.arrayToMap(resvStatList, function(obj){return obj.cmmCd});


// 예약상태
setResvStatMap= function(value){
    var resultVal = "";
    if( dms.string.isNotEmpty(value)){
        if(resvStatMap[value] != undefined)
        resultVal = resvStatMap[value].cmmCdNm;
    }
    return resultVal;
};

var estTpList = [];
<c:forEach var="obj" items="${estTpDs}">
estTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var estTpMap = dms.data.arrayToMap(estTpList, function(obj){return obj.cmmCd});


// 예약상태
setEstpMap= function(value){
    var resultVal = "";
    if( dms.string.isNotEmpty(value)){
        if(estTpMap[value] != undefined)
        resultVal = estTpMap[value].cmmCdNm;
    }
    return resultVal;
};

$(document).ready(function() {

    // 초기화
    $("#resvInit").kendoButton({
        click:function(e) {
            confirmWindow.data("kendoWindow")
            .title("<spring:message code='global.btn.init'/>")
            .content($("#info-init").html())
            .center().open();

            $(".btn_yes, .btn_no").click(function(){

                if($(this).hasClass("btn_yes")){

                    initAll();
                }

                confirmWindow.data("kendoWindow").close();

            }).end();
        }
    });

    /********************** 예약현황보드 **********************/
    var sysDate = new Date("<c:out value='${sysDate}' />");

    var startTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 08:00";
    var endTime = kendo.toString(sysDate, "yyyy/MM/dd") + " 18:00";


    var slide = kendo.fx($("#slide-in-share")).slideIn("right"),
    visible = true;

    $("#slide-in-handle").click(function(e) {
        slidePlay();
        $(".k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
        scheduler.element.height($(".slide_menu").css("height"));

        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        e.preventDefault();
    });


    $("#scheduler").kendoScheduler({
        date:sysDate
       ,startTime:new Date(startTime)
       ,endTime:new Date(endTime)
       ,editable:false
       ,footer:false
       ,allDaySlot:false
       ,eventTemplate:$("#resvInfoView").html()
       ,views:[
           { type:"day" }
       ]
       ,dataSource:{
           batch:true
           ,transport:{
               read:{
                   url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceipts.do' />"
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["sDlrCd"] = "${dlrCd}";
                       params["sResvStatCd"] = $("#sResvStatCd").val();

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
                   id:"resvDocNo"
                   ,fields:{
                       dlrCd:{type:"string"}
                       ,resvDocNo:{type:"string"}
                       ,carOwnerId:{type:"string"}
                       ,carOwnerNm:{type:"string"}
                       ,driverNm:{type:"string"}
                       ,saId:{type:"string"}
                       ,bayNo:{type:"string"}
                       ,start:{type:"date", from:"serResvStartDt"}
                       ,end:{type:"date", from:"serResvEndDt"}
                       ,title:{type:"string", from:"carRegNo"}
                       ,vinNo:{type:"string", from:"vinNo"}
                       ,noResvTp:{type:"string"}
                       ,custRemark:{type:"string"}
                   }
               }
           }
       }
       ,autoBind:false
       ,selectable:true
       ,group:{
           resources:["BAY"]
       }
       ,resources:[
           {
               field:"bayNo"
               ,name:"BAY"
               ,title:"BAY"
               ,dataTextField:"bayNm"
               ,dataValueField:"bayNo"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                           ,dataType:"json"
                           ,type:"POST"
                           ,contentType:"application/json"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               params["sDlrCd"] = "${dlrCd}";

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
                           id:"bayNo"
                           ,fields:{
                               dlrCd:{type:"string"}
                               ,bayNo:{type:"string"}
                               ,bayNm:{type:"string"}
                           }
                       }
                   }
               }
           }
       ]
       ,autoBind:false
       ,change:function(event) {

           <c:if test="${preFixId eq 'RE'}">
               var start = event.start;
               var end = event.end;
               var resource = event.resources;

               $("#scheduler").on("dblclick", '.k-scheduler-table td, .k-event' , function(e) {

                   var scheduler = $("#scheduler").getKendoScheduler();
                   var element = $(e.target).is(".k-event") ? $(e.target):$(e.target).closest(".k-event");
                   var uid = scheduler.occurrenceByUid(element.data("uid"));

                   if ( uid ) {

                   } else {            // 신규

                       $("#bayNo").val(resource.bayNo);
                       $("#serResvStartDt").data("kendoExtMaskedDatePicker").value(start);
                       slidePlay();

                   }
               });
           </c:if>
       }
   });

    // 예약스케줄러
    var scheduler = $("#scheduler").data("kendoScheduler");

    // 스케줄러 툴팁
    $("#scheduler").kendoTooltip({
        filter:".k-event",
        position:"top",
        width:200,
        height:60,
        content:kendo.template($('#resvItemTooltip').html())
    });

    // 스케줄 원클릭 이벤트
    scheduler.wrapper.on("mouseup touchend", ".k-scheduler-table td, .k-event", function(e) {

        var target = $(e.currentTarget);

        if (target.hasClass("k-event")) {

            e.preventDefault();

            var event = scheduler.occurrenceByUid(target.data("uid"));

            // 예약불가가 아닐경우에만 팝업 오픈
            if(event.noResvTp != "02"){
                confirmWindow.data("kendoWindow")
                .content($("#info-confirmation").html())
                .center().open();
            }

            $(".btn_yes, .btn_no").click(function(){

                if($(this).hasClass("btn_yes")){

                    detailSet(event,true); // 상세 정보
                }

                confirmWindow.data("kendoWindow").close();

            }).end();
        }
    });

    slidePlay = function(){
        if (visible) {
            slide.reverse();
            $("#scheduler").data("kendoScheduler").dataSource.read();
        } else {
            slide.play();
        }
        visible = !visible;
    };

    /********************** 사전점검보드 **********************/

    <c:if test="${(preFixId ne 'RE') && (preFixId ne 'PC')}">
    var endTime1 = kendo.toString(sysDate, "yyyy/MM/dd") + " 20:00";

    $("#scheduler1").kendoScheduler({
         date:sysDate
        ,startTime:new Date(startTime)
        ,endTime:new Date(endTime1)
        ,editable:false
        ,footer:false
        ,allDaySlot:false
        ,eventTemplate:$("#preChkInfoView").html()
        ,views:[
            { type:"day" }
        ]
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
                    }
                }
            }
        }
        ,autoBind:false
    });

    var slide1 = kendo.fx($("#slide-in-share1")).slideIn("right"),
    visible1 = true;

    $("#slide-in-handle1").click(function(e) {

        slidePlay1();
        $("#scheduler1 .k-scheduler-layout tr:first .k-scheduler-table tr:nth-child(2)").hide();
        scheduler1.element.height($(".slide_menu").css("height"));

        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        /* if (visible1) {
            slide1.reverse();
        } else {
            slide1.play();
        }
        visible1 = !visible1; */
        e.preventDefault();
    });

    // 예약스케줄러
    var scheduler1 = $("#scheduler1").data("kendoScheduler");

    // 스케줄러 툴팁
    $("#scheduler1").kendoTooltip({
        filter:".k-event"
        ,position:"top"
        ,width:200
        ,height:50
        ,content:kendo.template($('#preChkTooltip').html())
    });

    // 스케줄 원클릭 이벤트
    scheduler1.wrapper.on("mouseup touchend", ".k-scheduler-table td, .k-event", function(e) {

        var target = $(e.currentTarget);

        if (target.hasClass("k-event")) {
            e.preventDefault();

            var event = scheduler1.occurrenceByUid(target.data("uid"));


            if(confirm("<spring:message code='ser.lbl.preChkInfo' var='preChkInfo' />"+
                    "<spring:message code='global.info.callSelectItem' arguments='${preChkInfo}' />")){

                detailSet(event,false); // 상세 정보
                slidePlay1();

                confirmWindow.data("kendoWindow").close();

            }
        }
    });

    slidePlay1 = function(){
        if (visible1) {
            slide1.reverse();
            $("#scheduler1").data("kendoScheduler").dataSource.read();
        } else {
            slide1.play();
        }

        visible1 = !visible1;
    };

    /********************** 인도현황보드 **********************/
    var slide2 = kendo.fx($("#slide-in-share2")).slideIn("right"),
    visible2 = true;

    $("#slide-in-handle2").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible2) {
            slide2.reverse();
        } else {
            slide2.play();
        }
        visible2 = !visible2;
        e.preventDefault();
    });
    </c:if>

    <c:if test="${preFixId eq 'RO'}">
    var slide3 = kendo.fx($("#slide-in-share3")).slideIn("right"),
    visible3 = true;

    $("#slide-in-handle3").click(function(e) {
        $(".slide-in-share").removeClass("z-index-top");
        $(this).parent().addClass("z-index-top");
        if (visible3) {
            slide3.reverse();
            if(dms.string.isNotEmpty($("#vinNo").val())){
                $("#resvGrid").data("kendoExtGrid").dataSource.read();
                $("#partResvGrid").data("kendoExtGrid").dataSource.read();
                $("#estGrid").data("kendoExtGrid").dataSource.read();
            }
        } else {
            slide3.play();
        }
        visible3 = !visible3;
        e.preventDefault();
    });

    //예약 그리드
    $("#resvGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfReseveInfos.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#vinNo").val();
                        params["sPreFixId"] = $("#preFixId").val();
                        params["sSerResvStartDt"] = new Date("${sysDate}");
                       // params["sResvDocNo"] = $("#resvDocNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum :{ type:"number" }
                       ,resvDt:{ type:"date"}
                       ,serResvStartDt:{ type:"date"}
                    }
                }
            }
          }
        ,pageable:false
        ,editable:false
        ,height:500
        ,autoBind:false
        ,selectable:"row"
        ,change:function(e) {

            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());
                var resvDocNo = selectedVal.resvDocNo;
                var data = {"resvDocNo":resvDocNo};
                listType = "RE";
                detailSet(data, false);
            };
        }
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:80,attributes:{"class":"al"}}//
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.resvNm' />", width:80, attributes:{"class":"al"}}//
            ,{field:"resvStatCd", title:"<spring:message code='ser.lbl.resvStat' />", width:60, attributes:{"class":"ac"}
                ,template:"#=setResvStatMap(resvStatCd)#"
                ,editor:function(container, options){
                    $('<input required name="resvStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:resvStatList
                    });
                }
            }//
            ,{field:"resvDt", title:"<spring:message code='ser.lbl.resvCreateDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//
            ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", attributes:{"class":"al"}, width:100}//
            ,{field:"serResvStartDt", title:"<spring:message code='ser.lbl.serResvDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }//
            ,{field:"resvRemark", title:"<spring:message code='ser.lbl.custRemark' />", attributes:{"class":"al"}, width:100}//
        ]

    });

    //부품예약 그리드
    $("#partResvGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/rev/partReservation/selectPartReservations.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#vinNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,parResvDt:{ type:"date"}
                    }
                }
            }
          }
        ,pageable:false
        ,editable:false
        ,height:500
        ,autoBind:false
        ,selectable:"row"
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:80,attributes:{"class":"al"}}//
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.resvNm' />", width:80, attributes:{"class":"al"}}//
            ,{field:"parResvStatCd", title:"<spring:message code='ser.lbl.statNm' />", width:40, attributes:{"class":"ac"}
                ,template:"#=setResvStatMap(parResvStatCd)#"
                ,editor:function(container, options){
                    $('<input required name="resvStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:resvStatList
                    });
                }
            }//
            ,{field:"parResvDt", title:"<spring:message code='ser.lbl.resvCreateDt' />", width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//
            ,{field:"parResvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", attributes:{"class":"ac"}, width:100}//

        ]

    });

    //견적 그리드
    $("#estGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/est/estimate/selectEstimateListMains.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;


                        params["sVinNo"] = $("#vinNo").val();
                        params["sFromDt"] = new Date("${sysDate}");

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,estDt:{ type:"date"}
                    }
                }
            }
          }
        ,pageable:false
        ,height:500
        ,autoBind:false
        ,editable:false
        ,selectable:"row"
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:80,attributes:{"class":"al"}}//
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"al"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.resvNm' />", width:80, attributes:{"class":"al"}}//
            ,{field:"estTp", title:"<spring:message code='ser.lbl.serTp' />", width:50, attributes:{"class":"ac"}
                ,template:"#=setEstpMap(estTp)#"
                ,editor:function(container, options){
                    $('<input required name="estTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:resvStatList
                    });
                }
            }//
            ,{field:"estDocNo", title:"<spring:message code='ser.lbl.estDocNo' />", attributes:{"class":"al"}, width:80}//
            ,{field:"estDt", title:"<spring:message code='ser.lbl.estDt' />" , width:40
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//
        ]

    });

    //구원서비스 그리드
    $("#helpSvcGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#vinNo").val();
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd :{ type:"string" }
                       ,pkgItemCd:{ type:"string"}
                       ,lineNo:{ type:"string"}
                       ,lbrCd:{ type:"string",editable:false}
                    }
                }
            }
          }
        ,pageable:false
        ,height:500
        ,autoBind:false
        ,editable:false
        ,selectable:"row"
        ,columns:[
             {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:80,attributes:{"class":"ac"}}//
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:80,attributes:{"class":"ac"}}//
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.resvNm' />", width:40, attributes:{"class":"ac"}}//
            ,{field:"resvStatCd", title:"<spring:message code='ser.lbl.resvStat' />", width:40, attributes:{"class":"ac"}}//
            ,{field:"carAcceptDt", title:"<spring:message code='ser.lbl.resvCreateDt' />", width:40,attributes:{"class":"ac"}}//
            ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", attributes:{"class":"ac"}, width:40}//
            ,{field:"serResvStartDt", title:"<spring:message code='ser.lbl.serResvDt' />", attributes:{"class":"ac"}, width:40}//
            ,{field:"resvRemark", title:"<spring:message code='ser.lbl.custRemark' />", attributes:{"class":"ac"}, width:40}//
        ]

    });

    </c:if>
});
</script>
<style>
    #slide-in-share { width:600px; margin-right:-600px;}
    #slide-in-share1 { width:600px; margin-right:-600px;}
    #slide-in-share1 .slide-in-handle { top:102px;}
    #slide-in-share2 { width:600px; margin-right:-600px;}
    #slide-in-share2 .slide-in-handle { top:205px;}
    #slide-in-share3 { width:600px; margin-right:-600px;}
    #slide-in-share3 .slide-in-handle { top:308px;}
</style>

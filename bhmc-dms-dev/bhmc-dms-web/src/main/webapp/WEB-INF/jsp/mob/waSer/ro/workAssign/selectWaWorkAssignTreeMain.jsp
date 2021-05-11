<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>


<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<style>
.k-scheduler-edit-form .k-edit-form-container, .k-scheduler-timezones .k-edit-form-container { width:520px;}
.k-window>div.k-popup-edit-form { padding:1em 0;}
.k-edit-form-container .k-edit-buttons { display:block;}
</style>

        <!-- content -->
        <section id="content">


            <!-- 작업할당 -->
            <div class="header_area">
                <h1 class="title_basic">작업할당</h1>
                <div class="btn_right">
                    <div class="cal_state">
                        <span class="s1">대기 15</span>
                        <span class="s2">진행 15</span>
                        <span class="s3">연기 15</span>
                        <span class="s4">완료 0</span>
                    </div>
                    <button class="btn_m btn_search">조회</button>
                </div>
            </div>

            <div class="work_scheduler">
                <!-- details_area -->
                <div class="details_area">
                    <div class="details_top">
                        <div class="form_search">
                            <input type="text" value="" class="form_input">
                            <a href="javascript:;">검색</a>
                        </div>
                    </div>
                    <div class="details_con">
                        <!-- details_item -->
                        <input type="hidden" id="dlrCd">
                        <input type="hidden" id="roGrpNo">
                        <input type="hidden" id="roDocNo">
                        <div class="details_item" id="roListGrid">
                        </div>
                        <!-- //details_item -->
                        <div id="workAssignGrid"></div>
                    </div>
                </div>
                <!-- //details_area -->

                <!-- scheduler_area -->
                <div class="scheduler_area">
                    <div id="scheduler"></div>
                </div>
                <!-- //scheduler_area -->
            </div>
            <!-- //작업할당 -->
        </section>

<!-- script -->
<script id="work_event_template" type="text/x-kendo-template">
    <div class="work_event_template">#:title #</div>
</script>

<script id="scheduler_viewTooltip" type="text/x-kendo-template">
    <div class="scheduler_viewLayer">
        <div class="views_con">
            <h3>경NZ1234</h3>
            <p class="views_txt">DMS_8668</p>
            <div class="views_time">
                <p class="start_time">14:00</p>
                <p class="end_time">15:00</p>
            </div>
            <ul class="views_btn">
                <li class="btn_save"><a href="javascript:;">저장</a></li>
                <li class="btn_modify"><a href="javascript:;">수정</a></li>
                <li class="btn_detail"><a href="javascript:;">상세정보</a></li>
                <li class="btn_add"><a href="javascript:;"></a>추가</li>
                <li class="btn_cancel"><a href="javascript:;">취소</a></li>
            </ul>
        </div>
        <a href="javascript:;" class="views_close k-tooltip-button">close</a>
    </div>
</script>

<script>


var row = 0;
var saveYn = false;


$(document).ready(function() {
    $(".grid").kendoGrid({
        height:283
    });
    $(".grid2").kendoGrid();

    var roTreeDs = new kendo.data.TreeListDataSource({
        transport:{
            read:{
                url:"<c:url value='/mob/ser/ro/repairOrder/selectTreeRepairOrders.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {
                    var params = {};
                    params["sort"] = options.sort;
                    console.log(kendo.stringify(params))
                    return kendo.stringify(params);
                }
            }
            ,batch:true
            ,schema:{
                model:{
                   id:"rnum"
                   ,expanded:true
                   ,fields:{
                       rnum:{type:"number"}
                       ,dlrCd:{type:"string"}
                       ,roDocNo:{type:"string"}
                   }
               }
           }
        }
    });

    $("#roListGrid").kendoTreeList({
        dataSource:roTreeDs
        ,height:200
        ,selectable:"row"
        ,recorderable:true
        ,autoBind:true
        ,editable:false
        ,sortable:true
        ,columns:[
                    {field:"rnum", hidden:true }
                    ,{field:"roDocNo", title:"<spring:message code='global.lbl.locTree'/>", width:210 }  //로케이션계층
              ]
      });

});

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 배치작업 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.batchOperMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-11396" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.batOperNm" /></th>
                    <td>
                        <input id="sBatOperNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.batPrgmNm" /></th>
                    <td>
                        <input id="sBatPrgmNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.batTp" /></th>
                    <td>
                        <input id="sBatTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.batEnabledYn" /></th>
                    <td>
                        <input id="sBatEnabledYn" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-11397" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnBatchOperSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11399" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnBatchOperAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11400" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnBatchOperDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11398" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnBatchOperCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
	        </dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="batchOperGrid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="batchScheduleTab" class="k-state-active"><spring:message code="global.lbl.batchSchedule" /><!-- 배치스케쥴 --></li>
            <li id="batchResultTab"><spring:message code="global.lbl.batchResult" /><!-- 배치결과 --></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 배치스케쥴 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
	                <dms:access viewId="VIEW-D-11403" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchScheduleSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11401" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchScheduleAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11402" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchScheduleDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11404" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchScheduleCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11405" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchScheduleExecute"><spring:message code="global.btn.batchExecute" /><!-- 배치실행 --></button>
	                </dms:access>
                </div>
            </div>
            <div class="table_grid">
                <div id="batchScheduleGrid"></div>
            </div>
        </div>
        <!-- //배치스케쥴 -->

        <!-- 배치결과 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
	                <dms:access viewId="VIEW-D-11408" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchResultSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11407" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchResultDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11409" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchResultCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
	                </dms:access>
	                <dms:access viewId="VIEW-D-11406" hasPermission="${dms:getPermissionMask('READ')}">
	                    <button type="button" class="btn_xs" id="btnBatchResultRefresh"><spring:message code="global.btn.refresh" /><!-- 새로고침 --></button>
	                </dms:access>
                </div>
            </div>
            <div class="table_grid">
                <div id="batchResultGrid"></div>
            </div>
        </div>
        <!-- //배치결과 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
</div>

<script type="text/javascript">
var selectedBatOperId = "";

//배치유형
var batTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${batTpList}">
batTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}" ,"useYn":"${obj.useYn}"});
</c:forEach>
var batTpMap = dms.data.arrayToMap(batTpList, function(obj){ return obj.cmmCd; });

//배치수행상태
var batOperRsltCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${batOperRsltCdList}">
batOperRsltCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}" ,"useYn":"${obj.useYn}"});
</c:forEach>
var batOperRsltCdMap = dms.data.arrayToMap(batOperRsltCdList, function(obj){ return obj.cmmCd; });

//타임존
var timezoneIdList = [
	{"timezoneId":"Asia/Shanghai", "timezoneTxt":"上海"}
	,{"timezoneId":"Asia/Seoul", "timezoneTxt":"首尔"}
];
var timezoneIdMap = dms.data.arrayToMap(timezoneIdList, function(obj){ return obj.timezoneId; });

$(document).ready(function() {
    //버튼 - 배치작업 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#batchOperGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 배치작업 저장
    $("#btnBatchOperSave").kendoButton({
        click:function(e) {
            var batchOperGrid = $("#batchOperGrid").data("kendoExtGrid");

            var saveData = batchOperGrid.getCUDData("insertList", "updateList", "deleteList");
            if (batchOperGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (batchOperGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/bat/mgr/batchOper/multiBatchOpers.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        batchOperGrid.dataSource._destroyed = [];
                        batchOperGrid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 배치작업 추가
    $("#btnBatchOperAdd").kendoButton({
        click:function(e) {
            $.ajax({
                url:"<c:url value='/bat/mgr/batchOper/selectNextBatchOperId.do' />",
                type:'GET',
                dataType:'json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    $('#batchOperGrid').data('kendoExtGrid').dataSource.insert(0, {
                        "batOperId":jqXHR.batOperId     //배치작업ID
                        ,"batOperNm":""                 //배치작업명
                        ,"batTp":"01"                   //배치유형
                        ,"batPrgmNm":""                 //배치프로그램
                        ,"batParamVal":""               //배치파라메터
                        ,"batEnabledYn":"N"             //배치활성여부
                    });
                }
            });
        }
    });

    //버튼 - 배치작업 삭제
    $("#btnBatchOperDel").kendoButton({
        click:function(e) {
            var batchOperGrid = $("#batchOperGrid").data("kendoExtGrid");
            var rows = batchOperGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                batchOperGrid.removeRow(row);
            });
        }
    });

    //버튼 - 배치작업 취소
    $("#btnBatchOperCancel").kendoButton({
        click:function(e) {
            $('#batchOperGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 배치스케쥴 저장
    $("#btnBatchScheduleSave").kendoButton({
        click:function(e){
            var batchScheduleGrid = $("#batchScheduleGrid").data("kendoExtGrid");

            var saveData = batchScheduleGrid.getCUDData("insertList", "updateList", "deleteList");
            if (batchScheduleGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (batchScheduleGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/bat/mgr/batchSchedule/multiBatchSchedules.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        batchScheduleGrid.dataSource._destroyed = [];
                        batchScheduleGrid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 배치스케쥴 추가
    $("#btnBatchScheduleAdd").kendoButton({
        click:function(e){
            var batchOperGrid = $("#batchOperGrid").data("kendoExtGrid");
            if (batchOperGrid.select().length == 0) {
                //배치작업을 먼저 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.lbl.batchOper' var='batOperMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${batOperMsg}' />");
                return;
            }

            var dataItem = batchOperGrid.dataItem(batchOperGrid.select());

            $.ajax({
                url:"<c:url value='/bat/mgr/batchSchedule/selectNextBatchScheduleId.do' />",
                type:'GET',
                dataType:'json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    $('#batchScheduleGrid').data('kendoExtGrid').dataSource.insert(0, {
                        "batOperId":dataItem.batOperId          //배치작업ID
                        ,"batOperNm":dataItem.batOperNm         //배치작업명
                        ,"batScheduleId":jqXHR.batScheduleId    //배치유형
                        ,"timezoneId":"Asia/Shanghai"       //타임존
                    });
                }
            });
        }
    });

    //버튼 - 배치스케줄 삭제
    $("#btnBatchScheduleDel").kendoButton({
        click:function(e){
            var batchScheduleGrid = $("#batchScheduleGrid").data("kendoExtGrid");
            var rows = batchScheduleGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                batchScheduleGrid.removeRow(row);
            });
        }
    });

    //버튼 - 배치스케쥴 취소
    $("#btnBatchScheduleCancel").kendoButton({
        click:function(e){
            $('#batchScheduleGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 배치실행
    $("#btnBatchScheduleExecute").kendoButton({
        click:function(e){
            var batchScheduleGrid = $("#batchScheduleGrid").data("kendoExtGrid");
            var rows = batchScheduleGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            if (rows.length != 1) {
                //목록을 1개만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectOne'/>");
                return;
            }

            var dataItem = batchScheduleGrid.dataItem(rows);

            $.ajax({
                url:"<c:url value='/bat/mgr/batchSchedule/updateExecuteImmediatelyBatchSchedule.do' />"
                ,data:"batScheduleId="+dataItem.batScheduleId
                ,type:'POST'
                ,dataType:'json'
               	,beforeSend:function(xhr) {
           	        dms.loading.show($("#batchScheduleGrid"));
           	    }
           	    ,complete:function(xhr, status) {
                    dms.loading.hide($("#batchScheduleGrid"));
                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    $("#batchResultGrid").data("kendoExtGrid").dataSource.read();
                }
            });

        }
    });

    //버튼 - 배치결과 삭제목록 저장
    $("#btnBatchResultSave").kendoButton({
        click:function(e){
            var batchResultGrid = $("#batchResultGrid").data("kendoExtGrid");

            var saveData = batchResultGrid.getCUDData("insertList", "updateList", "deleteList");
            if (batchResultGrid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/bat/mgr/batchResult/deleteBatchResults.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    batchResultGrid.dataSource._destroyed = [];
                    batchResultGrid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //버튼 - 배치결과 삭제
    $("#btnBatchResultDel").kendoButton({
        click:function(e){
            var batchResultGrid = $("#batchResultGrid").data("kendoExtGrid");
            var rows = batchResultGrid.select();

            if (rows.length < 0) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                batchResultGrid.removeRow(row);
            });
        }
    });

    //버튼 - 배치결과 취소
    $("#btnBatchResultCancel").kendoButton({
        click:function(e){
            $('#batchResultGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 배치결과 새로고침
    $("#btnBatchResultRefresh").kendoButton({
        click:function(e){
            $("#batchResultGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //조회조건 - 배치활성여부
    $("#sBatEnabledYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });

    //조회조건 - 배치유형
    $("#sBatTp").kendoExtDropDownList({
        dataSource:batTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //배치스케쥴,배치결과 탭 설정
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var selectTabId = e.item.id;

            $(".btn_tabstrip").hide();

            if(selectTabId == "batchScheduleTab"){
                if($("#batchOperGrid").data("kendoExtGrid").select().length > 0){
                    $("#batchScheduleGrid").data("kendoExtGrid").dataSource.read();
                }
            } else if(selectTabId == "batchResultTab"){
                if($("#batchOperGrid").data("kendoExtGrid").select().length > 0){
                    $("#batchResultGrid").data("kendoExtGrid").dataSource.read();
                }
            }
        }
    });

    //배치작업 그리드
    $("#batchOperGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/bat/mgr/batchOper/selectBatchOpers.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBatOperNm"] = $("#sBatOperNm").val();
                        params["sBatPrgmNm"] = $("#sBatPrgmNm").val();
                        params["sBatEnabledYn"] = $("#sBatEnabledYn").val();
                        params["sBatTp"] = $("#sBatTp").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,batOperId:{type:"string", validation:{required:true}}
                        ,batOperNm:{type:"string", validation:{required:true}}
                        ,batTp:{tyhpe:"string", validation:{required:true}}
                        ,batPrgmNm:{type:"string", validation:{required:true}}
                        ,batParamVal:{type:"string"}
                        ,batEnabledYn:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["batOperNm","batTp","batPrgmNm","batParamVal","batEnabledYn"]
        ,dataBinding:function(e) {
            $("#batchScheduleGrid").data("kendoExtGrid").dataSource.data([]);
            $("#batchResultGrid").data("kendoExtGrid").dataSource.data([]);
            selectedBatOperId = "";
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.isNew()) {
                $("#batchScheduleGrid").data("kendoExtGrid").dataSource.data([]);
                $("#batchResultGrid").data("kendoExtGrid").dataSource.data([]);
            } else if (selectedBatOperId != dataItem.batOperId) {
                var kendoTab = $("#tabstrip").data("kendoExtTabStrip").select();

                if(kendoTab[0].id == "batchScheduleTab"){
                    $("#batchScheduleGrid").data("kendoExtGrid").dataSource.read();
                }else if(kendoTab[0].id == "batchResultTab"){
                    $("#batchResultGrid").data("kendoExtGrid").dataSource.read();
                }
            }

            selectedBatOperId = dataItem.batOperId;
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"batOperId", title:"<spring:message code='global.lbl.batOperId' />", width:110          //배치작업ID
                ,attributes:{"class":"ac"}
            }
            ,{field:"batOperNm", title:"<spring:message code='global.lbl.batOperNm' />", width:300}         //배치작업명
            ,{field:"batTp", title:"<spring:message code='global.lbl.batTp'/>", width:100                   //배치유형
                ,attributes:{"class":"ac"}
                ,template:"# if(batTpMap[batTp] != null) { # #= batTpMap[batTp].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input required name="batTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:batTpList
                    });
                    $('<span class="k-invalid-msg" data-for="batTp"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:batTpList
	                            ,dataTextField:"cmmCdNm"
	                            ,dataValueField:"cmmCd"
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"batPrgmNm", title:"<spring:message code='global.lbl.batPrgmNm' />"}                    //배치프로그램
            ,{field:"batParamVal", title:"<spring:message code='global.lbl.batParamVal' />", width:200}     //배치파라메터
            ,{field:"batEnabledYn", title:"<spring:message code='global.lbl.batEnabledYn' />", width:100    //활성여부
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="batEnabledYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y", "N"]
                        ,index:0
                    });
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
        ]
    });

    //배치스케쥴 그리드
    $("#batchScheduleGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/bat/mgr/batchSchedule/selectBatchSchedules.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;

                        var batchOperGrid = $("#batchOperGrid").data("kendoExtGrid");
                        if (batchOperGrid.select().length > 0) {
                            params["sBatOperId"] = batchOperGrid.dataItem(batchOperGrid.select()).batOperId;
                        } else {
                            params["sBatOperId"] = "dummy";
                        }

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,batOperId:{type:"string", editable:false}
                        ,batOperNm:{type:"string", editable:false}
                        ,batScheduleId:{type:"string", validation:{required:true}}
                        ,cronExpressionTxt:{type:"string", validation:{required:true}}
                        ,timezoneId:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,autoBind:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["cronExpressionTxt","timezoneId"]
        ,pageable:false
        ,height:280
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"batOperId", title:"<spring:message code='global.lbl.batOperId' />", width:110, sortable:false      //배치작업ID
                ,attributes:{"class":"ac"}
            }
            ,{field:"batOperNm", title:"<spring:message code='global.lbl.batOperNm' />", width:300, sortable:false}     //배치작업명
            ,{field:"batScheduleId", title:"<spring:message code='global.lbl.batScheduleId'/>", width:100               //배치스케쥴ID
                ,attributes:{"class":"ac"}
            }
            ,{field:"cronExpressionTxt", title:"<spring:message code='global.lbl.cronExpressionTxt'/>", width:200}      //배치실행주기
            ,{field:"timezoneId", title:"<spring:message code='global.lbl.timezoneId'/>", width:200                     //타임존ID
                ,template:"#=timezoneIdMap[timezoneId].timezoneTxt#"
                ,editor:function(container, options) {
                    $('<input required name="timezoneId" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"timezoneTxt"
                        ,dataValueField:"timezoneId"
                        ,dataSource:timezoneIdList
                    });
                    $('<span class="k-invalid-msg" data-for="timezoneId"></span>').appendTo(container);
                }
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:timezoneIdList
	                            ,dataTextField:"timezoneTxt"
	                            ,dataValueField:"timezoneId"
	                            ,valuePrimitive:true
	                            ,optionLabel:" "
	                        });
	                    }
	                }
	        	}
            }
        ]
    });

    //배치결과 그리드
    $("#batchResultGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/bat/mgr/batchResult/selectBatchResults.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        var batchOperGrid = $("#batchOperGrid").data("kendoExtGrid");

                        if (batchOperGrid.select().length > 0) {
                            params["sBatOperId"] = batchOperGrid.dataItem(batchOperGrid.select()).batOperId;
                        } else {
                            params["sBatOperId"] = "dummy";
                        }

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"batRsltId"
                    ,fields:{
                        rnum:{type:"number"}
                        ,batRsltId:{type:"string"}
                        ,batOperId:{type:"string"}
                        ,batScheduleId:{type:"string"}
                        ,batOperRsltCd :{type:"string"}
                        ,errMesgTxt:{type:"string"}
                        ,batStartTm:{type:"string"}
                        ,batEndTm:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,autoBind:false
        ,editable:false
        ,height:280
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"batRsltId", title:"<spring:message code='global.lbl.batRsltId' />", width:150            //배치결과ID
                ,attributes:{"class":"ac"}
            }
            ,{field:"batOperRsltCd", title:"<spring:message code='global.lbl.batOperRsltCd' />", width:100     //배치수행상태
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    //실패
                    if (dataItem.batOperRsltCd == "F") {
                        return "<span class='txt_label bg_red'>" + batOperRsltCdMap[dataItem.batOperRsltCd].cmmCdNm + "</span>";
                    //실행중
                    } else if (dataItem.batOperRsltCd == "R") {
                        return "<span class='txt_label bg_yellow'>" + batOperRsltCdMap[dataItem.batOperRsltCd].cmmCdNm + "</span>";
                    //성공
                    } else if (dataItem.batOperRsltCd == "S") {
                        return "<span class='txt_label bg_blue'>" + batOperRsltCdMap[dataItem.batOperRsltCd].cmmCdNm + "</span>";
                    }

                    return "";
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:batOperRsltCdList
	                            ,dataTextField:"cmmCdNm"
	                            ,dataValueField:"cmmCd"
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"errMesgTxt", title:"<spring:message code='global.lbl.errMesgTxt' />"}                      //에러메세지
            ,{field:"batStartTm", title:"<spring:message code='global.lbl.batStartTm' />", width:120          //배치시작시간
                ,attributes:{"class":"ac"}
            }
            ,{field:"batEndTm", title:"<spring:message code='global.lbl.batEndTm' />", width:120              //배치종료시간
                ,attributes:{"class":"ac"}
            }
        ]
    });
});
</script>
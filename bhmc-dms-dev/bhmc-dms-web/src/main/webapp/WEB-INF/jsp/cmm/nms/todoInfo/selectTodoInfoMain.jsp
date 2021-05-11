<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.todoListMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10905" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-10906" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_save" id="btnCompletion"><spring:message code="global.btn.completion" /><!-- 완료 --></button>
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
                    <th scope="row"><spring:message code="global.lbl.hndlYn" /></th>
                    <td>
                        <input id="sHndlYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.hndlDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartHndlDt" name="sStartHndlDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndHndlDt" name="sEndHndlDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.openYn" /></th>
                    <td>
                        <input id="sOpenYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.openDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartOpenDt" name="sStartOpenDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndOpenDt" name="sEndOpenDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 완료
    $("#btnCompletion").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var selectedRows = grid.select();
            var list = [];

            if (selectedRows.length == 0) {
                //목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }

            selectedRows.each(function(idx, obj){
                list.push(grid.dataItem(obj).todoNo);
            });

            $.ajax({
                url:"<c:url value='/cmm/nms/todoInfo/updateTodoInfoHndl.do' />",
                data:JSON.stringify(list),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });
    
    //조회조건-처리여부
    $("#sHndlYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
    });
    $("#sHndlYn").data("kendoExtDropDownList").value("N");

    //조회조건-처리일자 조회시작일
    $("#sStartHndlDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건-처리일자 조회종료일
    $("#sEndHndlDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건-확인여부
    $("#sOpenYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
    });

    //조회조건-확인일자 조회시작일
    $("#sStartOpenDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건-확인일자 조회종료일
    $("#sEndOpenDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/todoInfo/selectTodoInfos.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sActionTargetTp"] = "02";                                                       //액션타켓 구분[웹]
                        params["sHndlYn"] = $("#sHndlYn").data("kendoExtDropDownList").value();                    //처리여부
                        params["sStartHndlDt"] = $("#sStartHndlDt").data("kendoExtMaskedDatePicker").value();   //처리일자 조회시작일
                        params["sEndHndlDt"] = $("#sEndHndlDt").data("kendoExtMaskedDatePicker").value();       //처리일자 조회종료일
                        params["sOpenYn"] = $("#sOpenYn").data("kendoExtDropDownList").value();                    //확인여부
                        params["sStartOpenDt"] = $("#sStartOpenDt").data("kendoExtMaskedDatePicker").value();   //확인일자 조회시작일
                        params["sEndOpenDt"] = $("#sEndOpenDt").data("kendoExtMaskedDatePicker").value();       //확인일자 조회종료일

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"todoNo"
                    ,fields:{
                        rnum:{type:"number"}
                        ,todoNo:{type:"string"}
                        ,todoPolicyId:{type:"string"}
                        ,todoDesc:{type:"string"}
                        ,regUsrId:{type:"string"}
                        ,regDt:{type:"date"}
                        ,regDtFormat:{type:"date"}
                        ,openYn:{type:"string"}
                        ,openUsrId:{type:"string"}
                        ,openDt:{type:"date"}
                        ,openDtFormat:{type:"date"}
                        ,hndlYn:{type:"string"}
                        ,hndlUsrId:{type:"string"}
                        ,hndlDt:{type:"date"}
                        ,hndlDtFormat:{type:"date"}
                    }
                }
	            ,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.openDtFormat = kendo.parseDate(elem.openDt, "<dms:configValue code='dateFormat' />");
	                        elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
	                        elem.hndlDtFormat = kendo.parseDate(elem.hndlDt, "<dms:configValue code='dateFormat' />");
	                    });
	                }
	                return d;
	            }
            }
        }
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,editable:false
        ,dataBound:function(e) {
            var grid = e.sender;
            $(grid.tbody).on("click", "td", function (e) {
                var row = $(this).closest("tr");
                var colIdx = $("td", row).index(this);

                //Todo 내역을 클릭한 경우
                if(colIdx == 2){
                    var dataItem = grid.dataItem(row);

                    //확인여부/처리여부 등 Todo 정책에 따라 후 처리 진행한다.
                    $.ajax({
                        url:"<c:url value='/cmm/nms/todoInfo/updateActionTodoInfo.do' />",
                        data:"todoNo="+dataItem.todoNo,
                        type:'POST',
                        dataType:'json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            var viewId = jqXHR.viewId;
                            var viewNm = jqXHR.viewNm;
                            var viewUrl = jqXHR.viewUrl;
                            var tCd = jqXHR.tCd
                            var viewParams = jqXHR.viewParams;
                            var needReload = jqXHR.needReload;
                            var needPostAction = jqXHR.needPostAction;

                            //Todo 리스트 그리드 릴로드
                            if(needReload === true){
                                grid.dataSource.read();
                            }

                            //Todo 액션URL 메뉴 생성
                            if(needPostAction === true){
                                if(viewParams){
                                    viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + viewParams);
                                }

                                parent._addTabMenu(viewNm, _contextPath + viewUrl, tCd, viewId, false, true);
                            }
                        }
                    });
                }
            });
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"todoDesc", title:"<spring:message code='global.lbl.todoDesc' />", width:500}
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150
                ,attributes:{"class":"ac"}
                ,template:"#= dms.string.defaultString(kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />'), '')#"
            }
            ,{field:"openDtFormat", title:"<spring:message code='global.lbl.openDt' />", width:150
                ,attributes:{"class":"ac"}
            	,template:"#= dms.string.defaultString(kendo.toString(data.openDt, '<dms:configValue code='dateTimeFormat' />'), '')#"
            }
            ,{field:"hndlDtFormat", title:"<spring:message code='global.lbl.hndlDt' />", width:150
                ,attributes:{"class":"ac"}
            	,template:"#= dms.string.defaultString(kendo.toString(data.hndlDt, '<dms:configValue code='dateTimeFormat' />'), '')#"
            }
        ]
    });
});
</script>
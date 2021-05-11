<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="btn_right">
    <dms:access viewId="VIEW-D-10906" hasPermission="${dms:getPermissionMask('READ')}">
        <button type="button" class="btn_m btn_save" id="btnCompletion"><spring:message code="global.btn.completion" /></button>
    </dms:access>
    </div>
</div>

<div class="table_grid">
    <div id="ptl-chart-1"></div>
</div>

<script>
    $(document).ready(function() {

        //버튼 - 처리완료
        $("#btnCompletion").kendoButton({
            click:function(e) {

                var grid = $("#ptl-chart-1").data("kendoExtGrid");
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

        $("#ptl-chart-1").kendoExtGrid({
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
                           //params["sort"] = options.sort;

                           params["sActionTargetTp"] = "02";           //액션타켓 구분[웹]
                           params["sHndlYn"] = "N";                    //확인여부

                           return kendo.stringify(params);

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
                           ,hndlYn:{type:"string"}
                           ,hndlUsrId:{type:"string"}
                           ,hndlDt:{type:"date"}
                           ,openYn:{type:"string"}
                           ,openUsrId:{type:"string"}
                           ,openDt:{type:"date"}
                           ,regUsrId:{type:"string"}
                           ,regDt:{type:"date"}
                       }
                   }
               }
           }
           ,multiSelectWithCheckbox:true
           ,appendEmptyColumn:true
           ,editable:false
           ,filterable:false
           ,dataBound:function(e) {
               var grid = e.sender;
               $(grid.tbody).on("dblclick", "td", function (e) {
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

                               //Todo 리스트 그리드 리로드
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
           ,height:180
           ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                   ,filterable:false
                   ,attributes:{"class":"ac"}
               }
               ,{field:"todoDesc", title:"<spring:message code='global.lbl.todoDesc' />", width:525}
               ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150
                   ,attributes:{"class":"ac"}
                   ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"openDt", title:"<spring:message code='global.lbl.openDt' />", width:150
                   ,attributes:{"class":"ac"}
                   ,template:"#if (openDt !== null ){# #= kendo.toString(data.openDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"hndlDt", title:"<spring:message code='global.lbl.hndlDt' />", width:150
                   ,attributes:{"class":"ac"}
                   ,template:"#if (hndlDt !== null ){# #= kendo.toString(data.hndlDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
               }
           ]
       });

    });
</script>

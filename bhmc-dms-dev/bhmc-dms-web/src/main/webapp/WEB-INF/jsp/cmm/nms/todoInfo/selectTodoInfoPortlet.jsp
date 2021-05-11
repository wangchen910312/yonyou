<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div class="table_grid" id="ptl-todolist">
    <div id="todoListGrid" style="border:none;"></div>
</div>

<script type="text/javascript">
//연결된 페이지를 오픈한다.
function openTodoTargetUrl(actionUrlWeb, actionParams){
    if (!dms.string.isEmpty(actionUrlWeb)) {
        $.ajax({
            url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoByTcd.do' />"
            ,data:JSON.stringify({
                "tCd":actionUrlWeb
            })
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        }).done(function(viewData) {
            if(viewData != null && !dms.string.isEmpty(viewData.viewUrl)){
                var viewUrl = viewData.viewUrl;

                if(dms.string.isNotEmpty(actionParams)){
                    viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + actionParams);
                }
                parent.parent._addTabMenu(viewData.viewNm, _contextPath + viewUrl, viewData.tCd, viewData.viewId, false, true);
            }
        });
    }
}

$(document).ready(function() {

    $("#todoListGrid").kendoExtGrid({
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
       ,enableTooltip:true
       ,tooltipPosition:"bottom"
       ,multiSelectWithCheckbox:true
       ,editable:false
       ,filterable:false
       ,height:227
       ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, attributes:{"class":"ac"}}
           ,{field:"todoDesc", title:"<spring:message code='global.lbl.todoDesc' />"
               ,template:function(dataItem){
                   if(dms.string.isEmpty(dataItem.actionUrlWeb)){
                       return dataItem.todoDesc;
                   }

                   return "<a href=\"javascript:void(0);\" onclick=\"openTodoTargetUrl('"+dataItem.actionUrlWeb+"','"+dataItem.actionParams+"')\" style=\"text-decoration:underline;\">"+dataItem.todoDesc+"</a>";
               }
               ,attributes:{"class":"tooltip-enabled"}
           }
           ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:90
               ,attributes:{"class":"ac"}
               ,template:"#=kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />')#"
           }
       ]
   });

   parent.applyEtcButton({
    	id:window.frameElement.name
    	,buttons:[
    		{
    			iconClass:"po_completion"
    			,click:function(e){
    				var grid = $("#todoListGrid").data("kendoExtGrid");
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
    		}
    	]
    });

});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="table_grid" id="ptl-notification">
    <div id="notificationListGrid" style="border:none;"></div>
</div>

<script type="text/javascript">
//연결된 페이지를 오픈한다.
function openPortletTargetUrl(actionUrlWeb, actionParams){
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

                if(actionParams){
                    viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + actionParams);
                }

                parent.parent._addTabMenu(viewData.viewNm, _contextPath + viewUrl, viewData.tCd, viewData.viewId, false, true);
            }
        });
    }

/*
    $.ajax({
        url:"<c:url value='/cmm/nms/notificationMessage/updateActionNotificationInfo.do' />",
        data:"mesgId="+dataItem.mesgId,
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
*/
}

$(document).ready(function() {
    //그리드 설정
    $("#notificationListGrid").kendoExtGrid({
        gridId :"G-CMM-0323-13070001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationMessage/selectNotifications.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReceiveYn"] = "N";	//수신여부-미수신
                        params["sMesgTp"] = "W";	//메세지유형-웹Push

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgId"
                    ,fields:{
                        rnum:{type:"number"}
                        ,mesgCont:{type:"string"}
                        ,sendYn:{type:"string"}
                        ,receiveUsrId:{type:"string"}
                        ,sendDt:{type:"date"}
                        ,receiveYn:{type:"string"}
                        ,receiveDt:{type:"date"}
                        ,regUsrId:{type:"string"}
                        ,mesgCreDt:{type:"date"}
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
            ,{field:"mesgCont", title:"<spring:message code='global.lbl.notificationList' />"
                ,template:function(dataItem){
                    if(dms.string.isEmpty(dataItem.actionUrlWeb)){
                        return dataItem.mesgCont;
                    }

                    return "<a href=\"javascript:void(0);\" onclick=\"openPortletTargetUrl('"+dataItem.actionUrlWeb+"', '"+dataItem.actionParams+"')\" style=\"text-decoration:underline;\">"+dataItem.mesgCont+"</a>";
                }
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"mesgCreDt", title:"<spring:message code='global.lbl.regDt' />", width:90
                ,attributes:{"class":"ac"}
                ,template:"#= kendo.toString(data.mesgCreDt, '<dms:configValue code='dateFormat' />')#"
            }
        ]
    });

    parent.applyEtcButton({
    	id:window.frameElement.name
    	,buttons:[
    		{
    			iconClass:"po_completion"
    			,click:function(e){
    				var grid = $("#notificationListGrid").data("kendoExtGrid");
    	            var selectedRows = grid.select();
    	            var list = [];

    	            if (selectedRows.length == 0) {
    	                //목록을 선택하여 주십시오.
    	                dms.notification.warning("<spring:message code='global.info.required.select' />");
    	                return;
    	            }

    	            selectedRows.each(function(idx, obj){
    	                list.push(grid.dataItem(obj).mesgId);
    	            });

    	            $.ajax({
    	                url:"<c:url value='/cmm/nms/notificationMessage/updateNotificationInfoRcve.do' />",
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
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="group">
	<div class="header_area">
	    <h1 class="title_basic"><spring:message code="cmm.title.logManagement" /></h1>
	</div>
	
	<div id="mainTab" class="tab_area">
        <ul>
            <li id="receiveSetting" class="k-state-active">
                <span><spring:message code="cmm.title.receiveInterface" /></span>
            </li>
            <li id="sendSetting">
                <span><spring:message code="cmm.title.sendInterface" /></span>
            </li>
        </ul>
    
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-13274" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="receiveBtnCtlSearch" class="btn_m btn_search btnStep08 btnStep09"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_form form_width_100per" role="search" data-btnid="receiveBtnCtlSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width: 8%;">
                            <col style="width: 15%;">
                            <col style="width: 8%;">
                            <col style="width: 15%;">
                            <col style="width: 8%;">
                            <col style="width: 15%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="cmm.lbl.interfaceCode" /></th>
                                <td><input id="sInterfaceCode" name="sInterfaceCode" class="form_comboBox" /></td>
                                <th scope="row"><spring:message code="cmm.lbl.interfaceName" /></th>
                                <td><input id="sInterfaceName" name="sInterfaceName" class="form_comboBox" /></td>
                                <th scope="row"><spring:message code="cmm.lbl.receiveDate" /></th>
                                <td>
									<div class="form_float">
			                            <div class="date_left">
			                                <input id="sReceiveTimeStart" value="" class="form_datepicker ac">
			                                <span class="txt_from">~</span>
			                            </div>
			                            <div class="date_right">
			                                <input id="sReceiveTimeEnd" value="" class="form_datepicker ac">
			                            </div>
			                        </div>
								</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid">
                    <div id="receiveGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-13274" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="sendBtnCtlSearch" class="btn_m btn_search btnStep08 btnStep09"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_form form_width_100per" role="search" data-btnid="sendBtnCtlSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width: 8%;">
                            <col style="width: 15%;">
                            <col style="width: 8%;">
                            <col style="width: 15%;">
                            <col style="width: 8%;">
                            <col style="width: 15%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="cmm.lbl.interfaceCode" /></th>
                                <td><input id="sInterfaceCode" name="sInterfaceCode" class="form_comboBox" /></td>
                                <th scope="row"><spring:message code="cmm.lbl.interfaceName" /></th>
                                <td><input id="sInterfaceName" name="sInterfaceName" class="form_comboBox" /></td>
                                <th scope="row"><spring:message code="cmm.lbl.sendDate" /></th>
                                <td>
									<div class="form_float">
			                            <div class="date_left">
			                                <input id="sSendTimeStart" value="" class="form_datepicker ac">
			                                <span class="txt_from">~</span>
			                            </div>
			                            <div class="date_right">
			                                <input id="sSendTimeEnd" value="" class="form_datepicker ac">
			                            </div>
			                        </div>
								</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid">
                    <div id="sendGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        
    </div>
</section>
<script type="text/javascript">
var windowHeight = $(window).innerHeight();

$(document).ready(function() {
	
	// 清空查询条件
	var init = function (){
		$("#sInterfaceCode").val("");
        $("#sInterfaceName").val("");
        $("#sReceiveTimeStart").val("");
        $("#sReceiveTimeEnd").val("");
	}
	
	// 标签页选择
	$("#mainTab").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "receiveSetting") {                // 接收接口日志
            	init();
            	$('#receiveGrid').data('kendoExtGrid').dataSource.page(1);
            }else if (selectTabId === "sendSetting"){		// 发送接口日志
            	init();
            	$('#sendGrid').data('kendoExtGrid').dataSource.page(1);
            }
        }
    });
	
	// 接收接口日志查询按钮
    $("#receiveBtnCtlSearch").kendoButton({
        click:function(e) {
        	$('#receiveGrid').data('kendoExtGrid').dataSource.page(1);
           }
    });
	
 // 发送接口日志查询按钮
    $("#sendBtnCtlSearch").kendoButton({
        click:function(e) {
        	$('#sendGrid').data('kendoExtGrid').dataSource.page(1);
           }
    });
	
 	// 接收日期起始
    $("#sReceiveTimeStart").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
	});
	
 	// 接收日期结束
    $("#sReceiveTimeEnd").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
	});
 	
 	// 发送日期起始
    $("#sSendTimeStart").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
	});
	
 	// 发送日期结束
    $("#sSendTimeEnd").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
	});
	
 	// 接收接口日志查询请求
	$("#receiveGrid").kendoExtGrid({
		gridId: "",
		dataSource: {
			transport: {
				read: { 
					url: "<c:url value='/cmm/log/logManagement/selectReceiveInterfaceLog.do' />"
				},
				parameterMap: function(options, operation){
					if (operation === "read"){
						var params = {};
						
						params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["interfaceCode"] = $("#sInterfaceCode").val();
                        params["interfaceName"] = $("#sInterfaceName").val();
                        params["receiveTimeStart"] = $("#sReceiveTimeStart").val();
                        params["receiveTimeEnd"] = $("#sReceiveTimeEnd").val();
                        
                        return kendo.stringify(params);
					}else if (operation !== "read" && options.models){
						return kendo.stringify(options.models);
					}
				}
			},
			schema: {
				errors: "error",
				data: "data",
				total: "total",
				model: {
					id: "order",
					fields: { 
						receiveInterfaceLogId: {type:"number"},
						interfaceCode: {type: "String"}, 
						interfaceName: {type: "String"},
						resultStatus: {type: "String"},
						receiveTime: {type: "Date"}
					}
				}
			}
		},
		columns: [
			{ field:"receiveInterfaceLogId", title:"<spring:message code='cmm.lbl.interfaceId' />", width:40 // 接口ID
                ,attributes:{"class":"ac"}
            },
            { field:"interfaceCode", title:"<spring:message code='cmm.lbl.interfaceCode' />", width:50 // 接口代码
                ,attributes:{"class":"ac"}
            },
			{ field:"interfaceName", title:"<spring:message code='cmm.lbl.interfaceName' />", width:120 // 接口名称
                ,attributes:{"class":"ac"}
            },
            { field:"resultStatus", title:"<spring:message code='cmm.lbl.interfaceStatusCode' />", width:50 // 接口状态码
                ,attributes:{"class":"ac"}
            },
            { field:"receiveTime", title:"<spring:message code='cmm.lbl.receiveDate' />", width:150 // 接收日期
                ,attributes:{"class":"ac"}
            	,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            },
            { field:"ctlPanel", title:"<spring:message code='par.lbl.itemOper' />", width:90 //  操作
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='receiveBtnModify'><span class='txt_label bg_blue'><spring:message code='crm.lbl.dtlInfo' /></span></a>";
                    return spanObj;
                }
            },
		]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,editable:false
        ,height: windowHeight - 200
	});
 	
	// 接收接口日志详情-操作按钮
	$(document).on("click", ".receiveBtnModify", function(e){
		kendo.ui.progress($(document.body), true);
        var grid = $("#receiveGrid").data("kendoExtGrid")
            , selectedItem = grid.dataItem(grid.select())
            , receiveInterfaceLogId = selectedItem.receiveInterfaceLogId
        ;
        var receiveInterfaceLog = {};
        var params = {};
		params["receiveInterfaceLogId"] = receiveInterfaceLogId;
		$.ajax({
            url:"<c:url value='/cmm/log/logManagement/selectReceiveInterfaceLogById.do'/>",
             data:JSON.stringify(params),
             type:'POST',
             dataType:'json',
             contentType:'application/json',
             error:function(jqXHR,status,error) {
                 dms.notification.error("<spring:message code='cmm.error.detailsQueryFailed' />");
                 return ;
             },
             success:function(jqXHR, textStatus) {
            	 receiveInterfaceLog = jqXHR[0];
            	 var gotoUrl = "<c:url value='/cmm/log/logManagement/selectReceiveInterfaceLogEdit.do'/>";
                 var heightVal = windowHeight - 100;

                 kendo.ui.progress($(document.body), false);
                 receiveInterfaceLogEdit = dms.window.popup({
                    windowId:"selectReceiveInterfaceLogEdit"
                    , width:"80%"
                    , height:heightVal
                    , title:"<spring:message code='cmm.title.interfaceLogDetails' />"    // 정보입력 信息?入
                    , content:{
                        url:gotoUrl
                        , data:{
                            "autoBind":true
                            , "receiveInterfaceLog":receiveInterfaceLog
                            , "type":"receive"
                            , "callbackFunc":function(data) {
                            }
                        }
                    }
                });
             }
         });
        
    });
	
	// 发送接口日志查询请求
	$("#sendGrid").kendoExtGrid({
		gridId: "",
		dataSource: {
			transport: {
				read: { 
					url: "<c:url value='/cmm/log/logManagement/selectSendInterfaceLog.do' />"
				},
				parameterMap: function(options, operation){
					if (operation === "read"){
						var params = {};
						
						params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["interfaceCode"] = $("#sInterfaceCode").val();
                        params["interfaceName"] = $("#sInterfaceName").val();
                        params["receiveTimeStart"] = $("#sSendTimeStart").val();
                        params["receiveTimeEnd"] = $("#sSendTimeEnd").val();
                        
                        return kendo.stringify(params);
					}else if (operation !== "read" && options.models){
						return kendo.stringify(options.models);
					}
				}
			},
			schema: {
				errors: "error",
				data: "data",
				total: "total",
				model: {
					id: "order",
					fields: { 
						receiveInterfaceLogId: {type:"number"},
						interfaceCode: {type: "String"}, 
						interfaceName: {type: "String"},
						resultStatus: {type: "String"},
						resendCount: {type: "String"},
						sendTime: {type: "Date"},
						returnResultTime: {type: "Date"}
					}
				}
			}
		},
		columns: [
			{ field:"sendInterfaceId", title:"<spring:message code='cmm.lbl.interfaceId' />", width:40 // 接口ID
                ,attributes:{"class":"ac"}
            },
            { field:"interfaceCode", title:"<spring:message code='cmm.lbl.interfaceCode' />", width:50 // 接口代码
                ,attributes:{"class":"ac"}
            },
			{ field:"interfaceName", title:"<spring:message code='cmm.lbl.interfaceName' />", width:120 // 接口名称
                ,attributes:{"class":"ac"}
            },
            { field:"resultStatus", title:"<spring:message code='cmm.lbl.interfaceStatusCode' />", width:50 // 接口状态码
                ,attributes:{"class":"ac"}
            },
            { field:"resendCount", title:"<spring:message code='cmm.lbl.sendCount' />", width:50 // 发送数量
                ,attributes:{"class":"ac"}
            },
            { field:"sendTime", title:"<spring:message code='cmm.lbl.sendDate' />", width:150 // 发送日期
                ,attributes:{"class":"ac"}
            	,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            },
            { field:"returnResultTime", title:"<spring:message code='cmm.lbl.returnResultTime' />", width:150 // 返回结果日期
                ,attributes:{"class":"ac"}
            	,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            },
            { field:"ctlPanel", title:"<spring:message code='par.lbl.itemOper' />", width:90 //  操作
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='sendBtnModify'><span class='txt_label bg_blue'><spring:message code='crm.lbl.dtlInfo' /></span></a>";
                    return spanObj;
                }
            },
		]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,editable:false
        ,height: windowHeight - 200
	});
 	
	// 接收接口日志详情-操作按钮
	$(document).on("click", ".sendBtnModify", function(e){
		kendo.ui.progress($(document.body), true);
        var grid = $("#sendGrid").data("kendoExtGrid")
            , selectedItem = grid.dataItem(grid.select())
            , sendInterfaceId = selectedItem.sendInterfaceId
        ;
        var receiveInterfaceLog = {};
        var params = {};
		params["sendInterfaceId"] = sendInterfaceId;
		$.ajax({
            url:"<c:url value='/cmm/log/logManagement/selectSendInterfaceLogById.do'/>",
             data:JSON.stringify(params),
             type:'POST',
             dataType:'json',
             contentType:'application/json',
             error:function(jqXHR,status,error) {
                 dms.notification.error("<spring:message code='cmm.error.detailsQueryFailed' />");
                 return ;
             },
             success:function(jqXHR, textStatus) {
            	 receiveInterfaceLog = jqXHR[0];
            	 var gotoUrl = "<c:url value='/cmm/log/logManagement/selectReceiveInterfaceLogEdit.do'/>";
                 var heightVal = windowHeight - 100;

                 kendo.ui.progress($(document.body), false);
                 receiveInterfaceLogEdit = dms.window.popup({
                    windowId:"selectReceiveInterfaceLogEdit"
                    , width:"80%"
                    , height:heightVal
                    , title:"<spring:message code='cmm.title.interfaceLogDetails' />"    // 정보입력 信息?入
                    , content:{
                        url:gotoUrl
                        , data:{
                            "autoBind":true
                            , "receiveInterfaceLog":receiveInterfaceLog
                            , "type":"send"
                            , "callbackFunc":function(data) {
                            }
                        }
                    }
                });
             }
         });
        
    });
	
});

</script>
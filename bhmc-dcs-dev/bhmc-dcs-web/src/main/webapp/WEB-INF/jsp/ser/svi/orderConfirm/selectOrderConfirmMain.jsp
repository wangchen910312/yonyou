<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="group">
	<div class="header_area">
	    <h1 class="title_basic"><spring:message code="ser.title.orderConfirm" /></h1>
	</div>
	
	<div id="mainTab" class="tab_area">
        <ul>
            <li id="dlrSetting" class="k-state-active">
                <span><spring:message code="cmm.lbl.dlrSetting" /></span>
            </li>
            <li id="pcDstinSetting">
                <span><spring:message code="cmm.lbl.carlineSetting" /></span>
            </li>
            <li id="carlineSetting">
                <span><spring:message code="cmm.lbl.pcDstinSetting" /></span>
            </li>
        </ul>
    
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-13263" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnCtlSearch" class="btn_m btn_search btnStep08 btnStep09"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_form form_width_100per" role="search" data-btnid="btnCtlSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width: 5%;">
                            <col style="width: 15%;">
                            <col style="width: 5%;">
                            <col style="width: 15%;">
                            <col style="width: 5%;">
                            <col style="width: 15%;">
                            <col style="width: 5%;">
                            <col style="width: 15%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="cmm.lbl.divi" /></th>
                                <td><input id="sDiviCd" name="sDiviCd" class="form_comboBox" /></td>
                                <th scope="row"><spring:message code="sal.lbl.distOffice" /></th>
                                <td><input id="sOffCd" name="sOffCd" class="form_comboBox" /></td>
                                <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                                <td><input id="sDlrCd" name="sDlrCd" class="form_input" /></td>
                                <th scope="row"><spring:message code="global.lbl.dlrNm" /></th>
                                <td><input id="sDlrNm" name="sDlrNm" class="form_input" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid">
                    <div id="dealerGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-13264" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="carlineBtnSave" class="btn_s btn_s_min5"><spring:message code="par.btn.save" /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_grid">
                    <div id="carLineGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
	                    <dms:access viewId="VIEW-I-13264" hasPermission="${dms:getPermissionMask('READ')}">
	                        <button type="button" id="pcDstinBtnSave" class="btn_s btn_s_min5"><spring:message code="par.btn.save" /></button>
                        </dms:access>
                    </div>
                </div>
                <div class="table_grid">
                    <div id="vehicleUseGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
    </div>
</section>
<script type="text/javascript">
var windowHeight = $(window).innerHeight();
var regionList = [];
<c:forEach var="obj" items="${regionList}">
    regionList.push({"diviCd":"${obj.diviCd}", "diviNm":"${obj.diviNm}"});
</c:forEach>
var officeList = [];
<c:forEach var="obj" items="${officeList}">
    officeList.push({"offCd":"${obj.offCd}", "offNm":"${obj.offNm}", "diviCd":"${obj.diviCd}"});
</c:forEach>
var useYnList = [{"useYn": "Y"},{"useYn": "N"}];
	
$(document).ready(function() {
	$("#mainTab").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "dlrSetting") {                // 经销商设置页
                $("#dealerGrid").data("kendoExtGrid").dataSource.page(1);
            } else if (selectTabId === "pcDstinSetting") {       // 车种设置（全网）页
            	$("#carLineGrid").data("kendoExtGrid").dataSource.page(1);
            } else if (selectTabId === "carlineSetting") {      // 车辆用途设置（全网）页
            	$("#vehicleUseGrid").data("kendoExtGrid").dataSource.page(1);
            };
        }
    });

	// 办事处查询条件下拉列表
    var offCd = $("#sOffCd").kendoExtDropDownList({
    	dataTextField:"offNm" ,
    	dataValueField:"offCd",
    	dataSource: officeList,
        optionLabel:" ",
        filter:"contains",
        change: function (e) {
        	var list = [];
        	var sOffCd = $("#sOffCd").val();
        	var sDiviCd = "";
        	if (sOffCd != null && sOffCd != ""){ // 判断办事处是否为空
        		officeList.forEach(function (element) {
        			if (element.offCd == sOffCd){ // 拿到该办事处对应的区域代码
        				sDiviCd = element.diviCd;
        			}
        		})
        		regionList.forEach(function (element) {
        			if (element.diviCd == sDiviCd){ // 拿到该区域代码的区域信息
        				list.push(element);
        			}
        		})
        		// 重新给区域下拉框list赋值
        		$("#sDiviCd").data("kendoExtDropDownList").setDataSource(list);
        		$("#sDiviCd").data("kendoExtDropDownList").value(sDiviCd);
        	}else{
        		$("#sDiviCd").data("kendoExtDropDownList").setDataSource(regionList);
        	}
        }
    });
    
	// 区域查询条件下拉列表
    var diviCd = $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm" ,
        dataValueField:"diviCd",
        dataSource: regionList,
        optionLabel:" ",
        filter:"contains",
        change: function (e) {
        	var sDiviCd = $("#sDiviCd").val();
        	var list = [];
        	if (sDiviCd != null && sDiviCd != ""){ // 判断区域代码是否为空
        		officeList.forEach(function (element) {
        			if (element.diviCd == sDiviCd){ // 拿到该区域代码对应的所有办事处
        				list.push(element);
        			}
        		})
        		// 重新给办事处下拉框list赋值
        		$("#sOffCd").data("kendoExtDropDownList").setDataSource(list);
        	}else{
        		$("#sOffCd").data("kendoExtDropDownList").setDataSource(officeList);
        	}
        	
        }
    });

	// 查询按钮
    $("#btnCtlSearch").kendoButton({
        click:function(e) {
            $('#dealerGrid').data('kendoExtGrid').dataSource.page(1);
           }
    });
    
	// 车种设置（全网）页 - 保存按钮
    $("#carlineBtnSave").kendoButton({
        click:function(e) {
            var grid = $("#carLineGrid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList","deleteList");
            saveData["updateType"] = "carline";
            var rows = grid.select();
            for (var i = 0; i < rows.length; i++){
                saveData.updateList.push(grid.dataItem(rows[i]));
            }
            
            if (saveData.updateList.length == 0) {
                // 提示没有变更消息.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            
            $.ajax({
                url:"<c:url value='/ser/svi/orderConfirm/updateAllOrderConfirm.do'/>",
                 data:JSON.stringify(saveData),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(jqXHR, textStatus) {
                     grid.dataSource._destroyed = [];
                     grid.dataSource.page(1);
                     if (jqXHR == true){
                         // 操作成功.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }else{
                    	 dms.notification.info("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                     }
                 }
             });
        }
    });
    
    // 车辆用途设置（全网）页 - 保存按钮
    $("#pcDstinBtnSave").kendoButton({
        click:function(e) {
            var grid = $("#vehicleUseGrid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList","deleteList");
            saveData["updateType"] = "pcDstin";
            var rows = grid.select();
            for (var i = 0; i < rows.length; i++){
                saveData.updateList.push(grid.dataItem(rows[i]));
            }
            
            if (saveData.updateList.length == 0) {
                // 提示没有变更信息.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            
            $.ajax({
                url:"<c:url value='/ser/svi/orderConfirm/updateAllOrderConfirm.do'/>",
                 data:JSON.stringify(saveData),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(jqXHR, textStatus) {
                     grid.dataSource._destroyed = [];
                     grid.dataSource.page(1);
                     if (jqXHR == true){
                         // 操作成功.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }else{
                         dms.notification.info("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                     }
                 }
             });
        }
    });

    // 经销商查询请求
	$("#dealerGrid").kendoExtGrid({
		gridId: "G-SER-2021-040401",
		dataSource: {
			transport: {
				read: { 
					url: "<c:url value='/ser/svi/orderConfirm/findAllDlr.do' />"
				},
				parameterMap: function(options, operation){
					if (operation === "read"){
						var params = {};
						
						params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["diviCd"] = $("#sDiviCd").val();
                        params["offCd"] = $("#sOffCd").val();
                        params["dlrCd"] = $("#sDlrCd").val();
                        params["dlrNm"] = $("#sDlrNm").val();
                        
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
						rnum: {type:"number"},
						diviNm: {type: "String"}, 
						offNm: {type: "String"},
						dlrCd: {type: "String"},
						dlrNm: {type: "String"}
					}
				}
				,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.rnum = d.total - elem.rnum + 1;
	                    });
	                }
	                return d;
	            }
			}
		},
		columns: [
			{ field:"diviNm", title:"<spring:message code='cmm.lbl.divi' />", width:90 // 区域
                ,attributes:{"class":"ac"}
            },
            { field:"offNm", title:"<spring:message code='sal.lbl.distOffice' />", width:90 // 办事处
                ,attributes:{"class":"ac"}
            },
			{ field:"dlrCd", title:"<spring:message code='mis.lbl.dlrCd' />", width:90 // 经销商代码
                ,attributes:{"class":"ac"}
            },
            { field:"dlrNm", title:"<spring:message code='mis.lbl.dlrNm' />", width:200 // 经销商名称
                ,attributes:{"class":"ac"}
            },
            { field:"ctlPanel", title:"<spring:message code='cmm.lbl.carlineSet' />", width:90 // 车种设置  操作
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='carlinBtnModify'><span><spring:message code='cmm.lbl.setting' /></span></a>";
                    return spanObj;
                }
            },
            { field:"ctlPanel", title:"<spring:message code='cmm.lbl.pcDstinSet' />", width:120 // 车辆用途设置  操作
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='pcDstinBtnModify'><span><span><spring:message code='cmm.lbl.setting' /></span></a>";
                    return spanObj;
                }
            }
		]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,editable:false
        ,height: windowHeight - 200
	});
	
	
	// 全网车种查询请求
	$("#carLineGrid").kendoExtGrid({
        gridId: "G-SER-2021-040402",
        dataSource: {
            transport: {
                read: { url: "<c:url value='/ser/svi/orderConfirm/finAllCarline.do' />"},
                parameterMap: function(options, operation){
                    if (operation === "read"){
                        var params = {};
                        
                        params["sort"] = options.sort;
                        
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
                    	rnum: {type:"number",editable:false},
                    	carlineCd: {type: "String",editable:false}, 
                    	carlineNm: {type: "String",editable:false}, 
                    	carlineEnNm: {type: "String",editable:false}, 
                    	useYn: {type: "String"}
                    }
		            ,parse:function(d) {
		                if(d.data){
		                    $.each(d.data, function(idx, elem) {
		                        elem.rnum = d.total - elem.rnum + 1;
		                    });
		                }
		                return d;
		            }
                }
            }
        },
        columns: [
            { field:"carlineCd", title:"<spring:message code='ser.lbl.carLine' />", width:90 // 车种
                ,attributes:{"class":"ac"}
            },
            { field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:90 // 车种名称
                ,attributes:{"class":"ac"}
            },
            { field:"carlineEnNm", title:"<spring:message code='global.lbl.carlineEnNm' />", width:90 // 车种英文
                ,attributes:{"class":"ac"}
            },
            { field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:90 // 是否使用
                ,attributes:{"useYn":"ac"}
	            ,editor:function(container, options) {
	                $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
	                .appendTo(container)
	                .kendoExtDropDownList({
	                    autoBind:false
	                    ,dataSource:useYnList
	                    ,dataTextField:"useYn"
	                    ,dataValueField:"useYn"
	                })
	                $('<span class="k-invalid-msg" data-for="bundleNm"></span>').appendTo(container);
	            }
            }
        ]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,height: windowHeight - 200
    });
	
	// 全网车辆用途查询请求
	$("#vehicleUseGrid").kendoExtGrid({
        gridId: "G-SER-2021-040403",
        dataSource: {
            transport: {
                read: { url: "<c:url value='/ser/svi/orderConfirm/finAllPcDstin.do' />"},
                parameterMap: function(options, operation){
                    return null;
                }
            },
            schema: {
                errors: "error",
                data: "data",
                total: "total",
                model: {
                    id: "order",
                    fields: {
                    	rnum:{type:"number", editable:false},
                    	pcDstinNm: {type: "String", editable:false},
                    	useYn: {type: "String"},
                    }
                }
	            ,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.rnum = d.total - elem.rnum + 1;
	                    });
	                }
	                return d;
	            }
            }
        },
        columns: [
            { field:"pcDstinNm", title:"<spring:message code='global.lbl.vehicleUse' />", width:90 // 车辆用途
                ,attributes:{"class":"ac"}
            },
            { field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:90 // 是否使用
                ,attributes:{"class":"ac"}
	            ,editor:function(container, options) {
	                $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
	                .appendTo(container)
	                .kendoExtDropDownList({
	                    autoBind:false
	                    ,dataSource:useYnList
	                    ,dataTextField:"useYn"
	                    ,dataValueField:"useYn"
	                })
	                $('<span class="k-invalid-msg" data-for="bundleNm"></span>').appendTo(container);
	            }
            }
        ]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,pageable: false
        ,height: windowHeight - 200
    });
	
	// 经销商设置页面-车种设置-操作按钮
	$(document).on("click", ".carlinBtnModify", function(e){
        var grid = $("#dealerGrid").data("kendoExtGrid")
            , selectedItem = grid.dataItem(grid.select())
            , dlrCd = selectedItem.dlrCd
        ;
        
        var gotoUrl = "<c:url value='/ser/svi/orderConfirm/selectOrderConfirmToCarline.do'/>";
        var heightVal = windowHeight - 100;

        orderConfirmToCarline = dms.window.popup({
           windowId:"selectOrderConfirmToCarline"
           , width:"80%"
           , height:heightVal
           , title:"选择车种信息"    // 정보입력 信息?入
           , content:{
               url:gotoUrl
               , data:{
                   "autoBind":true
                   , "dlrCd":dlrCd
                   , "callbackFunc":function(data) {
                   }
               }
           }
       });
    });
	
	// 经销商设置页面-车辆用途设置-操作按钮
	$(document).on("click", ".pcDstinBtnModify", function(e){
        var grid = $("#dealerGrid").data("kendoExtGrid")
            , selectedItem = grid.dataItem(grid.select())
            , dlrCd = selectedItem.dlrCd
        ;
        var gotoUrl = "<c:url value='/ser/svi/orderConfirm/selectOrderConfirmToPcDstin.do'/>";
        var heightVal = windowHeight - 100;

        orderConfirmToPcDstin = dms.window.popup({
           windowId:"selectOrderConfirmToPcDstin"
           , width:"80%"
           , height:heightVal
           , title:"选择车辆用途信息"    // 정보입력 信息?入
           , content:{
               url:gotoUrl
               , data:{
                   "autoBind":true
                   , "dlrCd":dlrCd
                   , "callbackFunc":function(data) {
                   }
               }
           }
       });
    });
});
</script>
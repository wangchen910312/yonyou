<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<style type="text/css">
    #content {min-width: 100%;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
	        <dms:access viewId="VIEW-I-13265" hasPermission="${dms:getPermissionMask('READ')}">
	            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="vehicleUseGrid" class="resizable_grid"></div>
    </div>
</section>

<script type="text/javascript">
var dlrCd = parent.orderConfirmToPcDstin.options.content.data.dlrCd;
var windowHeight = $(window).innerHeight();

$(document).ready(function() {
	
	// 确认按钮
	$("#btnSelect").kendoButton({
        click:function(e) {
        	var grid = $("#vehicleUseGrid").data("kendoExtGrid");
        	var saveData = grid.getCUDData("insertList", "updateList","deleteList");
        	saveData["dlrCd"] = dlrCd;
        	saveData["updateType"] = "pcDstin";
        	var rows = grid.select();
            for (var i = 0; i < rows.length; i++){
                saveData.updateList.push(grid.dataItem(rows[i]));
            }
        	
        	if (saveData.updateList.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
        	
        	$.ajax({
	            url:"<c:url value='/ser/svi/orderConfirm/updateOrderConfirmByDlr.do'/>",
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
	                 //정상적으로 반영 되었습니다.
	                 dms.notification.success("<spring:message code='global.info.success'/>");
	             }
	         });
      	}
    });
	
	// 页面加载默认查询按钮
	$("#vehicleUseGrid").kendoExtGrid({
	    gridId: "",
	    dataSource: {
	        transport: {
	            read: { url: "<c:url value='/ser/svi/orderConfirm/finPcDstinByDlr.do' />"},
	            parameterMap: function(options, operation){
	                if (operation === "read"){
	                    var params = {};
	                    params["dlrCd"] = dlrCd;
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
	                    rnum:{type:"number"},
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
	        { field:"pcDstinNm", title:"<spring:message code='global.lbl.vehicleUse' />", width:"40%" // 车辆用途
	            ,attributes:{"class":"ac"}
	        }
	        ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:"40%" ,attributes:{"class":"ac"}
	            ,editor:function(container, options) {
	                $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
	                .appendTo(container)
	                .kendoExtDropDownList({
	                    autoBind:false,
	                    dataSource:['Y','N'],
	                    index:0
	                });
	                $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
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
        ,height: windowHeight - 100
	});
});
</script>
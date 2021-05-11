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
        <div id="carLineGrid" class="resizable_grid"></div>
    </div>
</section>

<script type="text/javascript">

var windowHeight = $(window).innerHeight();
var dlrCd = parent.orderConfirmToCarline.options.content.data.dlrCd;
var useYnList = [{"useYn": "Y"},{"useYn": "N"}];

$(document).ready(function() {
	
	// 确认按钮
	$("#btnSelect").kendoButton({
        click:function(e) {
            var grid = $("#carLineGrid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList","deleteList");
            saveData["dlrCd"] = dlrCd;
            saveData["updateType"] = "carline";
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
    $("#carLineGrid").kendoExtGrid({
        gridId: "G-SER-2021-040501",
        dataSource: {
            transport: {
                read: { url: "<c:url value='/ser/svi/orderConfirm/finCarlineByDlr.do' />"},
                parameterMap: function(options, operation){
                    if (operation === "read"){
                        var params = {};
                        params["sort"] = options.sort;
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
                        rnum: {type:"number"},
                        carlineCd: {type: "String", editable:false}, 
                        carlineNm: {type: "String", editable:false}, 
                        carlinrEnNm: {type: "String", editable:false}, 
                        useYn: {type: "String", editable:true}
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
            { field:"carlineCd", title:"<spring:message code='ser.lbl.carLine' />", width:"20%" // 车种
                ,attributes:{"class":"ac"}
            },
            { field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:"20%" // 车种名称
                ,attributes:{"class":"ac"}
            },
            { field:"carlineEnNm", title:"<spring:message code='global.lbl.carlineEnNm' />", width:"20%" // 车种英文
                ,attributes:{"class":"ac"}
            },
            { field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:"20%" // 是否使用
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
        ,height: windowHeight - 100
    });
});
</script>
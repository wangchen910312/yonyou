<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
            <button id="btnSelect" class="btn_m"><spring:message code='global.btn.select' /></button>  <!-- 선택 -->
        </div>
    </div>
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</section>
<!-- // 팝업 -->

<script>

var subParam = {};

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 대행업무유형 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
    
    // 대행업무유형 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            }else{
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });
    
    // 대행업무유형 Grid
    $("#grid").kendoExtGrid({
        dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/aap/aapInfo/selectAapItemSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        return;
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema :{
                model :{
                    id :"cmmCd",
                    fields :{
                         cmmCd      :{type :"string", editable:false} //코드
                        ,cmmCdNm    :{type :"string"}                   //명칭
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:true
       ,pageable :false
       ,height :280
       ,editable  :false
       ,resizable :true
       ,autoBind :true
       ,sortable:false
       ,editable:false
       ,columns :[
          {field:"cmmCd",    title:"<spring:message code='sal.lbl.incTp' />", hidden:true, width:100}
          ,{field:"cmmCdNm", title:"<spring:message code='sal.lbl.incTp' />", attributes:{"class":"al"}, width:100}  //保险类型
       ]
   });

    
});
</script>
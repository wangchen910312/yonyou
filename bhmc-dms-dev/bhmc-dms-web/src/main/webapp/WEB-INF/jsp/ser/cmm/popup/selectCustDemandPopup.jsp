<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 고객요청사항 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="custConfirm" class="btn_s btn_s_min5"><spring:message code="ser.btn.confirm" /><!-- 확인 --></button>
            <button type="button" id="custDel" class="btn_s btn_delete btn_s_min5" ><spring:message code="global.btn.del" /></button>
            <%-- <button type="button" id="custCancel" class="btn_s btn_cancel" ><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>
    <div class="table_grid">
        <div id="custRemarkGrid" class="grid"></div>
    </div>
</section>
<!-- //고객요청사항 팝업 -->

<script type="text/javascript">

$(document).ready(function(){

    var parentData = parent.custDemandPopup.options.content.data;

    /**############################ 버튼 설정##################################**/
    /** 요청사항 삭제  **/
    $("#custDel").kendoButton({
        click:function (e){
            var grid = $("#custRemarkGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    /** 확인  **/
    $("#custConfirm").kendoButton({
        click:function (e){
            var grid = $("#custRemarkGrid").data("kendoExtGrid");
            parentData.callbackFunc(grid.dataSource.data());
            parent.custDemandPopup.close();
        }
    });

    // 고객요청사항 그리드
    $("#custRemarkGrid").kendoExtGrid({
        gridId:"G-SER-1011-000014"
        ,dataSource:null
        ,height:130
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
             {field:"lineNo", title:"<spring:message code='ser.lbl.custReqCd' />", width:50}
            ,{field:"custReqCont", title:"<spring:message code='ser.lbl.reqCont' />", width:400}
            ,{field:"preFixId" ,title:"preFixId", hidden:true, width:100}
            ,{field:"dlrCd" ,title:"dlrCd", hidden:true, width:100}
        ]
    });

    var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
    grid.insert(0,{
         "lineNo":""
        ,"custReqCont" :""
    });

});

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.lbl.roSearch" /></h1><!-- 고객조회 -->
        <div class="btn_right">
            <%-- <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> --%>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>
<%-- 
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input"/>
                    </td>
                    <th scope="row"></th> 
                    <td class="bor_none">
                    </td>
                    <th scope="row"></th> 
                    <td class="bor_none">
                    </td>
                </tr> 
            </tbody>
        </table>
    </div> --%>

    <input type="hidden" id="sVinNo" name="sVinNo" class="form_input"/>
    <input type="hidden" id="sDlrCd" name="sDlrCd" class="form_input"/>
    <input type="hidden" id="sItemCd" name="sItemCd" class="form_input"/>
    <input type="hidden" id="sRoDocNo" name="sRoDocNo" class="form_input"/>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>
<script type="text/javascript">

$(document).ready( function(){
    

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    
    var parentData = parent.befRoNoPopupWindow.options.content.data;
    
    $("#sVinNo").val(parentData.vinNo);
    $("#sDlrCd").val(parentData.dlrCd);
    $("#sItemCd").val(parentData.itemCd);
    $("#sRoDocNo").val(parentData.roDocNo);
    
    
    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
         $("#btnSelect").click();
    });
    
    
    /************************************************************
        기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
              $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
    
    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            
            
            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
            
                parentData.callbackFunc(data);
                parent.befRoNoPopupWindow.close();
            }
        }
    });
    
    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
              parent.befRoNoPopupWindow.close();
        }
    });

    
/************************************************************
    그리드 설정
*************************************************************/
    $("#grid").kendoExtGrid({
        dataSource:{
         transport:{
            read:{
                url:"<c:url value='/ser/ro/repairOrder/selectPreRepairOrder.do' />"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {
        
                    var params = {};
        
                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;
        
                    params["sVinNo"] = $("#sVinNo").val();
                    params["sDlrCd"] = $("#sDlrCd").val();
                    params["sItemCd"] = $("#sItemCd").val();
                    params["sRoDocNo"] = $("#sRoDocNo").val();
        
                    return kendo.stringify(params);
        
                } else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            model:{
                id:"rnum"
                ,fields:{
                     rnum:{type:"number", editable:false}
                    ,roDocNo:{type:"string"}
                    ,roDt:{type:"date"}
                    ,runDistVal:{type:"number"}
                }
            }
         }
        }
        ,autoBind:false
        ,multiSelectWithCheckbox:true
        ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
        ,editable:false 
        ,height:280
        ,columns:[
              {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
             ,{field:"roDocNo", title:"<spring:message code='global.lbl.roDocNo' />", width:200 ,attributes:{"class":"ac"}}
             ,{field:"roDt", title:"<spring:message code='ser.lbl.roDate' />", width:100
                 , attributes :{"class":"ac"}
                 , format:"{0:<dms:configValue code='dateFormat' />}"      
             }
             ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:120
                 , attributes :{"class":"ar"}
                 , editor:function(container, options){
                     $('<input required name="runDistVal" id="runDistVal" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         format:"n0"                // n0:###,###, n2:###,###.##
                        ,decimals:0                // 소숫점
                        ,min:1
                        ,value:0
                        ,spinners:false
                     });
                     $('<span class="k-invalid-msg" data-for="runDistVal"></span>').appendTo(container);
                  }        
             }
        ]
    });
    
    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }
    
});
</script>
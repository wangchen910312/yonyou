<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">
<div id="resizableContainer">
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.lbl.check" /><!-- 선택 --></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsCd" /><!-- 용품코드 --></th>
                    <td>
                        <input type="text" id="sItemCd" name="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.goodsNm" /><!-- 용품명 --></th>
                    <td>
                        <input type="text" id="sItemNm" name="sItemNm" class="form_input" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</div>
</section>

 <script type="text/javascript">
$(document).ready(function() {
    //팝업옵션
    var popupWindow = parent.$("#accessoryItemMasterSearchPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //조회조건 설정
//     $("#sBpCd").val(dms.string.defaultString(popupOptions.bpCd, ""));
//     $("#sBpNm").val(dms.string.defaultString(popupOptions.bpNm, ""));
    $("#sItemCd").val(dms.string.defaultString(popupOptions.itemCd, ""));
    $("#sItemNm").val(dms.string.defaultString(popupOptions.itemNm, ""));

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length > 0){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                popupOptions.callbackFunc(data);
            }
        }
    });

    //그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    //용품조회 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0207-165001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasters.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json;"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpCd"] = dms.string.defaultString(popupOptions.bpCd, "");
                        params["sBpNm"] = dms.string.defaultString(popupOptions.bpNm, "");
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sItemDstinCd"] = "20";              //품목구분(판매용품)

                        return kendo.stringify(params);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:true
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd:{type:"string"}          //딜러코드
                        ,itemCd:{type:"string"}         //용품코드
                        ,itemNm:{type:"string"}         //용품명
                        ,stockUnitCd:{type:"string"}    //단위
                        ,salePrcAmt:{type:"number"}     //매입기준가
                        ,lastGrAmt:{type:"number"}      //최근입고가
                        ,stockQty:{type:"number"}       //가용재고
                    }
                }
            }
        }
        ,selectable:popupOptions.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true
        ,multiSelectWithCheckbox:true
        ,height:190
        ,columns:[
             {field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:120}  //용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:250}   //용품명
            ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:60, attributes:{"class":"ac"}} //단위
            ,{field:"salePrcAmt", title:"<spring:message code='sal.lbl.salePrcAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}  //매입기준가
            ,{field:"lastGrAmt", title:"<spring:message code='sal.lbl.lastGrAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}   //최근입고가
            ,{field:"stockQty" ,title:"<spring:message code='sal.lbl.stockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:70} //가용재고
        ]
    });

    if(popupOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});
 </script>



<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="global.lbl.mesgTmplGrpId" /></th>
                    <td>
                        <input id="sMesgTmplGrpId" name="sMesgTmplGrpId" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.mesgTmplGrpNm" /></th>
                    <td>
                        <input id="sMesgTmplGrpNm" name="sMesgTmplGrpNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.mesgTmplTp" /></th>
                    <td>
                        <input id="sMesgTmplTp" name="sMesgTmplTp" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
//메세지템플릿 유형 Array
var mesgTmplTpList = [];
<c:forEach var="obj" items="${mesgTmplTpList}">
mesgTmplTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//메세지템플릿 유형 Map
var mesgTmplTpMap = dms.data.arrayToMap(mesgTmplTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    /**
     * 팝업 옵션
     */
     var popupWindow = parent.$("#messageTemplateSearchPopupWin").data("kendoWindow");
     var popupOptions = popupWindow.options.content.data;


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

                popupOptions.callbackFunc(data);
                if(popupOptions["closeAfterSelect"]!=false) {
                    popupWindow.close();
                }
            }
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    
  	//조회조건 메세지템플릿그룹구분
    $("#sMesgTmplTp").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(mesgTmplTpList)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });
    
    if (popupOptions.sMesgTmplGrpId) {
        $("#sMesgTmplGrpId").val(popupOptions.sMesgTmplGrpId);
    }
    if (popupOptions.sMesgTmplGrpNm) {
        $("#sMesgTmplGrpNm").val(popupOptions.sMesgTmplGrpNm);
    }
    if (popupOptions.sMesgTmplTp) {
        $("#sMesgTmplTp").data("kendoExtDropDownList").value(popupOptions.sMesgTmplTp);
    }

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/tmp/messageTemplate/selectMessageTemplates.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sMesgTmplGrpId"] = $("#sMesgTmplGrpId").val();
                        params["sMesgTmplGrpNm"] = $("#sMesgTmplGrpNm").val();
                        params["sMesgTmplTp"] = $("#sMesgTmplTp").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"mesgTmplNo"
                    ,fields:{
                        rnum:{type:"number"}
                        ,mesgTmplGrpId:{type:"string"}
                        ,mesgTmplGrpNm:{type:"string"}
                        ,mesgTmplNo:{type:"number"}
                        ,mesgTmplTp:{type:"string"}
                        ,mesgTmplNm:{type:"string"}
                        ,mesgTmplCont:{type:"string"}
                        ,defaultYn:{type:"string"}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,selectable:popupOptions.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,height:407
        ,columns:[
            {field:"mesgTmplGrpId", title:"<spring:message code='global.lbl.mesgTmplGrpId' />", width:100, sortable:false, attributes:{"class":"ac"}}
            ,{field:"mesgTmplGrpNm", title:"<spring:message code='global.lbl.mesgTmplGrpNm' />", width:300}
            ,{field:"mesgTmplTp", title:"<spring:message code='global.lbl.mesgTmplTp' />", width :150
            	,template:"# if(mesgTmplTpMap[mesgTmplTp] != null) { # #= mesgTmplTpMap[mesgTmplTp].cmmCdNm# # }#"	
            }
            ,{field:"mesgTmplNm", title:"<spring:message code='global.lbl.mesgTmplNm' />"}
        ]

    });

    if(popupOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

   <div class="table_form form_width_20per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:40%;">
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.searchCondition" /></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left" style="width:45%;">
                                <input id="sGubun" type="text" class="form_comboBox">
                            </div>
                            <div class="form_right" style="width:55%;">
                                <input id="sValue" type="text" class="form_input">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="cmm.lbl.resourceTp" /></th>
                    <td>
                        <input id="sResourceTp" type="text" class="form_comboBox" style="width:50%;">
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

    //보호자원유형  Array
    var arrResourceTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrResourceTp}">
    arrResourceTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var resourceTpMap = dms.data.arrayToMap(arrResourceTp, function(obj){ return obj.cmmCd; });

    $(document).ready(function() {

        var arrGubun = [
            {text:"<spring:message code='cmm.lbl.resourceId' />", value:"01"}
           ,{text:"<spring:message code='cmm.lbl.resourceNm' />", value:"02"}
           ,{text:"<spring:message code='cmm.lbl.resourcePattern' />", value:"03"}
           ,{text:"<spring:message code='cmm.lbl.resourceDetlCont' />", value:"04"}
        ];

        // 검색유형 드랍다운 리스트.
        $("#sGubun").kendoExtDropDownList({
            dataTextField:"text"
            ,dataValueField:"value"
            ,dataSource:arrGubun
            ,autoBind:false
            ,index:0
        });



        // 보호자원유형 드랍다운 리스트.
        $("#sResourceTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:arrResourceTp
            ,index:0
        });

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var popupWindow = parent.$("#securedResourcePopupWin").data("kendoWindow");
        var options = popupWindow.options.content.data;


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

                    options.callbackFunc(data);
                    if(options["closeAfterSelect"]!=false) {
                        popupWindow.close();
                    }
                }
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
//         if (options.cntryNm) {
//             $("#sCntryNm").val(options.cntryNm);
//         }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/ath/securedResource/selectSecuredResources.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sGubun"] = $("#sGubun").val();
                            params["sValue"] = $("#sValue").val();
                            params["sResourceTp"] = $("#sResourceTp").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,pageSize:0
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,resourceId:{type:"string", validation:{required:true}, editable:false}
                            ,resourceNm:{type:"string", validation:{required:true}, editable:false}
                            ,resourcePattern:{type:"string", validation:{required:true}, editable:false}
                            ,resourceDetlCont:{type:"string", validation:{required:true}, editable:false}
                            ,resourceTp:{type:"string", validation:{required:true}, editable:false}
                            ,sortOrder:{type:"string", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,pageable:false
            ,height:407
            ,columns:[
                {field:"resourceId", title:"<spring:message code='cmm.lbl.resourceId' />", width:120, attributes:{"class":"ac"} }
                ,{field:"resourceNm", title:"<spring:message code='cmm.lbl.resourceNm' />", width:200}
                ,{field:"resourcePattern", title:"<spring:message code='cmm.lbl.resourcePattern' />"}
//                 ,{field:"resourceDetlCont", title:"<spring:message code='cmm.lbl.resourceDetlCont' />"}
                ,{field:"resourceTp", title:"<spring:message code='cmm.lbl.resourceTp' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"# if(resourceTpMap[resourceTp] != null) { # #= resourceTpMap[resourceTp].cmmCdNm# # }#"
                    ,editor:function(container, options) {
                        $('<input required name="resourceTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:arrResourceTp
                        });
                        $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                    }
                }
            ]

        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>










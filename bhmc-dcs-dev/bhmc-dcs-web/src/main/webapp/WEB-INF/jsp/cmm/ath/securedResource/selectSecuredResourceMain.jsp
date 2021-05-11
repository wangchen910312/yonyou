<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 보호자원 관리 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.resourceMng" /></h1>
        <div class="btn_right">
<%--             <button class="btn_m btn_batch_upload" id="btnBatchUpload"><spring:message code="global.btn.batchUpload" /></button> --%>
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
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
                    <th scope="row"><spring:message code="global.lbl.searchCondition" /></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <input id="sGubun" type="text" class="form_comboBox" />
                            </div>
                            <div class="form_right">
                                <input id="sValue" type="text" class="form_input">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="cmm.lbl.resourceTp" /></th>
                    <td>
                        <input id="sResourceTp" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->




    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">

//보호자원유형  Array
var arrResourceTp = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${arrResourceTp}">
arrResourceTp.push({
    "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
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
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0);
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/ath/securedResource/multiSecuredResources.do' />",
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
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }



        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });


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

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGubun"] = $("#sGubun").val();
                        params["sValue"] = $("#sValue").val();



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
                        rnum:{type:"string", editable:false}
                        ,resourceId:{type:"string", validation:{required:true}}
                        ,resourceNm:{type:"string", validation:{required:true}}
                        ,resourcePattern:{type:"string", validation:{required:true}}
                        ,resourceDetlCont:{type:"string", validation:{required:true}}
                        ,resourceTp:{type:"string", validation:{required:true}}
                        ,sortOrder:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["resourceNm","resourcePattern","resourceDetlCont","resourceTp","sortOrder"]
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"resourceId", title:"<spring:message code='cmm.lbl.resourceId' />", width:100, attributes:{"class":"ac"} }
            ,{field:"resourceNm", title:"<spring:message code='cmm.lbl.resourceNm' />", width:200}
            ,{field:"resourcePattern", title:"<spring:message code='cmm.lbl.resourcePattern' />", width:500 }
            ,{field:"resourceDetlCont", title:"<spring:message code='cmm.lbl.resourceDetlCont' />", width:250}
            ,{field:"resourceTp", title:"<spring:message code='cmm.lbl.resourceTp' />", width:100
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
            , attributes:{"class":"ac"}}
            ,{field:"sortOrder", title:"<spring:message code='global.lbl.sortOrder' />", width:100, attributes:{"class":"ac"}}
            ,{title:""}
        ]

    });

});

</script>








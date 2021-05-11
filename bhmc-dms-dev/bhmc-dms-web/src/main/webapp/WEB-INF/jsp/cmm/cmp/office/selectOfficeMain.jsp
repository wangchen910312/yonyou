<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 사무소 관리 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.officeMng" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.diviCd" /></th>
                    <td>
                        <input id="sDiviCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.diviNm" /></th>
                    <td>
                        <input id="sDiviNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.offCd" /></th>
                    <td>
                        <input id="sOffCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.offNm" /></th>
                    <td>
                        <input id="sOffNm" type="text" class="form_input" >
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-CMM-0809-161500"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/cmp/office/selectOffices.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDiviCd"] = $("#sDiviCd").val();
                        params["sDiviNm"] = $("#sDiviNm").val();
                        params["sOffCd"] = $("#sOffCd").val();
                        params["sOffNm"] = $("#sOffNm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"diviCd"
                    ,fields:{
                        rnum:{type:"number"}
                        ,diviCd:{type:"string"}
                        ,diviNm:{type:"string"}
                        ,offCd:{type:"string"}
                        ,offNm:{type:"string"}
                    }
                }
            }
        }
        ,enableTooltip:true
        ,appendEmptyColumn:true
        ,editable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"diviCd", title:"<spring:message code='global.lbl.diviCd' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"diviNm", title:"<spring:message code='global.lbl.diviNm' />", width:200}
            ,{field:"offCd", title:"<spring:message code='global.lbl.offCd' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"offNm", title:"<spring:message code='global.lbl.offNm' />", width:200}
        ]

    });
});

</script>








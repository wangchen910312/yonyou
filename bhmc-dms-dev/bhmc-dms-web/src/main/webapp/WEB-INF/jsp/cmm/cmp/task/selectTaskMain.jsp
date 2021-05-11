<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 직무정보 관리 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.taskMng" /></h1>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.cmpTp" /></th>
                    <td>
                        <input id="sCmpTp" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.tskCd" /></th>
                    <td>
                        <input id="sTskCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.tskNm" /></th>
                    <td>
                        <input id="sTskNm" type="text" class="form_input" >
                    </td>
                    <td></td>
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

var cmpTpList = [];
<c:forEach var="obj" items="${cmpTpList}">
cmpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// var cmpTpMap = dms.data.arrayToMap(cmpTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    //조회조건 - 단위유형
    $("#sCmpTp").kendoExtDropDownList({
        dataSource:cmpTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-CMM-0809-162201"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/cmp/task/selectTasks.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCmpTp"] = $("#sCmpTp").data("kendoExtDropDownList").value();
                        params["sTskCd"] = $("#sTskCd").val();
                        params["sTskNm"] = $("#sTskNm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"tskCd"
                    ,fields:{
                        rnum:{type:"number"}
                        ,cmpTp:{type:"string"}
                        ,cmpTpNm:{type:"string"}
                        ,tskCd:{type:"string"}
                        ,tskNm:{type:"string"}
                    }
                }
            }
        }
        ,enableTooltip:true
        ,appendEmptyColumn:true
        ,editable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"cmpTp", title:"<spring:message code='global.lbl.cmpTp' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"cmpTpNm", title:"<spring:message code='global.lbl.cmpTpNm' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />", width:350}
        ]
    });
});

</script>








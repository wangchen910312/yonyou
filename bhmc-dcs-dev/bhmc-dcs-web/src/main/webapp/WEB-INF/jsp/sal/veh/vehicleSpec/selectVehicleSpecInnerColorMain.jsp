<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-내장색 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">内色信息</h1><!-- VehicleSpec - 내장색 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12021" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
		</dms:access>
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
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColor" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColorNm' /></th><!-- 내장색명 -->
                    <td>
                        <input id="sIntColorNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.useYn' /></th><!-- 사용여부 -->
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>




<!-- script -->
<script>
var intColorList = [{"userCdNm":"", "userCd":""}];
<c:forEach var="obj" items="${intColorNames}">
intColorList.push({userCdNm:"${obj.intColorCdNm}", userCd:"${obj.intColorCd}"});
</c:forEach>


$(document).ready(function() {

    //조회조건 - 내장색선택
    $("#sIntColor").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:intColorList
        ,select:onSelectIntColorCd
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        ,index:0
    });

    /**
     * 내장색에 따른 화면 컨트롤
     */
    function onSelectIntColorCd(e) {
         var dataItem = this.dataItem(e.item);

    };


    //조회조건 - 사용여부선택
    $("#sUseYn").kendoExtDropDownList({
        dataTextField:"codeNm",
        dataValueField:"codeCd",
        dataSource:[{"codeCd":"","codeNm":""}
                    ,{"codeCd":"Y","codeNm":"Y"}
                    ,{"codeCd":"N","codeNm":"N"}
                    ]
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115908"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecInnerColor.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sIntColorCd"] = $("#sIntColor").val();
                        params["sIntColorNm"] = $("#sIntColorNm").val();
                        params["sUseYn"] = $("#sUseYn").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"outerColorCd"
                    ,fields:{
                        intColorCd   :{type:"string"}
                        ,intColorNm  :{type:"string"}
                        ,intColorEnNm:{type:"string"}
                        ,useYn       :{type:"string"}
                        ,regUsrId    :{type:"string"}
                        ,regDt       :{type:"date"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        ,height:485
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
            {field:"intColorCd",   title:"<spring:message code='global.lbl.colorCode' />",  width:100, attributes:{"class":"al"}} //컬러코드
            ,{field:"intColorNm",  title:"<spring:message code='sal.lbl.intColorNm' />",    width:150,attributes:{"class":"al"}}  //내장컬러명
            ,{field:"intColorEnNm",title:"<spring:message code='sal.lbl.intColorEnNm' />",  width:150,attributes:{"class":"al"}}  //내장컬러영문명
            ,{field:"useYn",       title:"<spring:message code='global.lbl.useYn' />",      width:100, attributes:{"class":"ac"}} //사용여부
         ]
    });



});
</script>
<!-- //script -->











<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- VehicleSpec-외장색 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">外色信息</h1><!-- VehicleSpec - 외장색 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12020" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColor" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.extColorNm' /></th><!-- 외장색명 -->
                    <td>
                        <input id="sExtColorNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.colorTp' /></th><!-- 색상유형 -->
                    <td>
                        <input id="sColorTpNm" type="text" class="form_comboBox">
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
var extColorList = [{"userCdNm":"", "userCd":""}];
<c:forEach var="obj" items="${extColorNames}">
extColorList.push({userCdNm:"${obj.extColorCdNm}", userCd:"${obj.extColorCd}"});
</c:forEach>


//색상유형 Array
var colorTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${colorTpList}">
colorTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//색상유형 Map
var colorTpMap = dms.data.arrayToMap(colorTpList, function(obj){ return obj.cmmCd; });


$(document).ready(function() {

    //조회조건 - 외장색선택
    $("#sExtColor").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:extColorList
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });



    //조회조건 - 색상유형
    $("#sColorTpNm").kendoExtDropDownList({
        dataSource:colorTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 사용여부선택
    $("#sUseYn").kendoExtDropDownList({
        dataTextField:"codeNm"
        ,dataValueField:"codeCd"
        ,dataSource:[{"codeCd":"","codeNm":""}
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
        gridId:"G-SAL-0721-115914"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecOuterColor.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sExtColorCd"] = $("#sExtColor").val();
                        params["sExtColorNm"] = $("#sExtColorNm").val();
                        params["sColorTp"] = $("#sColorTpNm").val();
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
                        extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,extColorEnNm:{type:"string"}
                        ,colorTp   :{type:"string"}
                        ,twoToneYn :{type:"string"}
                        ,useYn     :{type:"string"}
                        ,regUsrId  :{type:"string"}
                        ,regDt     :{type:"date"}
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
            {field:"extColorCd",    title:"<spring:message code='global.lbl.colorCode' />",    width:50,  attributes:{"class":"ac"}} //컬러코드
            ,{field:"extColorNm",   title:"<spring:message code='global.lbl.extColorNm' />",   width:150, attributes:{"class":"al"}} //외장색명
            ,{field:"extColorEnNm", title:"<spring:message code='global.lbl.extColorEnNm' />", width:150, attributes:{"class":"al"}} //외장색영문명
            ,{field:"colorTp",      title:"<spring:message code='sal.lbl.colorTp' />",         width:50,  attributes:{"class":"al"}
              ,template:"# if(colorTpMap[colorTp] != null){# #= colorTpMap[colorTp].cmmCdNm# #}#"
             } //색상유형
            ,{field:"twoToneYn",    title:"<spring:message code='sal.lbl.twoToneYn' />",       width:50,  attributes:{"class":"ac"}} //투톤여부
            ,{field:"useYn",        title:"<spring:message code='global.lbl.useYn' />",        width:50,  attributes:{"class":"ac"}} //사용여부
        ]
    });



});
</script>
<!-- //script -->











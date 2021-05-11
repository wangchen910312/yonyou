<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-모델별컬러 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.vehicleSpecModMapClr" /></h1><!-- VehicleSpec - 모델별컬러 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11281" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModel" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.modelNm' /></th><!-- 모델명 -->
                    <td>
                        <input id="sModelNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.applyDate' /></th><!-- 적용일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.useYn' /></th><!-- 사용여부 -->
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorNm" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorNm" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
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

//모델 데이터셋
var modelList = [{"userCdNm":"", "userCd":""}];
<c:forEach var="obj" items="${modelNames}">
modelList.push({userCdNm:"${obj.modelCdNm}", userCd:"${obj.modelCd}"});
</c:forEach>

//외장색 데이터셋
var extColorList = [{"userCdNm":"", "userCd":""}];
<c:forEach var="obj" items="${extColorNames}">
extColorList.push({userCdNm:"${obj.extColorCdNm}", userCd:"${obj.extColorCd}"});
</c:forEach>

//내장색 데이터셋
var intColorList = [{"userCdNm":"", "userCd":""}];
<c:forEach var="obj" items="${intColorNames}">
intColorList.push({userCdNm:"${obj.intColorCdNm}", userCd:"${obj.intColorCd}"});
</c:forEach>


$(document).ready(function() {

    //조회조건 - 모델선택
    $("#sModel").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:modelList
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 외장색선택
    $("#sExtColorNm").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:extColorList
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });




    //조회조건 - 내장색선택
    $("#sIntColorNm").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:intColorList
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 적용시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //조회조건 - 적용종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


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
            if( !($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null) ){
                if($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //적용일을 모두 입력해 주세요
                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                    return false;
                }
            }
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115909"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelColor.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sModelCd"] = $("#sModel").val();
                        params["sModelNm"] = $("#sModelNm").val();
                        params["sExtColorCd"] = $("#sExtColorNm").val();
                        params["sIntColorCd"] = $("#sIntColorNm").val();
                        params["sStartDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["sEndDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();
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
                        carlineCd  :{type:"string"}
                        ,carlineNm :{type:"string"}
                        ,modelCd   :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,startDt   :{type:"date"}
                        ,endDt     :{type:"date"}
                        ,useYn     :{type:"string"}
                        ,regUsrId  :{type:"string"}
                        ,regDt     :{type:"date"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        ,height:463
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
            {field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",    width:80, attributes:{"class":"ac"}} //차종
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />",  width:120, attributes:{"class":"al"}} //차종명
            ,{field:"modelCd",   title:"<spring:message code='global.lbl.modelCode' />",  width:120, attributes:{"class":"ac"}} //모델코드
            ,{field:"modelNm",   title:"<spring:message code='global.lbl.modelNm' />",    width:300, attributes:{"class":"al"}} //모델명
            ,{field:"extColorCd",title:"<spring:message code='global.lbl.extColor' />",   width:80, attributes:{"class":"ac"}} //외장색
            ,{field:"extColorNm",title:"<spring:message code='global.lbl.extColorNm' />", width:180, attributes:{"class":"al"}} //외장색명
            ,{field:"intColorCd",title:"<spring:message code='global.lbl.intColor' />",   width:80, attributes:{"class":"ac"}} //내장색
            ,{field:"intColorNm",title:"<spring:message code='global.lbl.intColorNm' />", width:180, attributes:{"class":"al"}} //내장색명
            ,{field:"startDt",   title:"<spring:message code='sal.lbl.startDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //적용시작일
            ,{field:"endDt",     title:"<spring:message code='sal.lbl.endDt' />",      width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //적용종료일
            ,{field:"useYn",     title:"<spring:message code='global.lbl.useYn' />",   width:60, attributes:{"class":"ac"}} //사용여부
            //,{field:"regUsrId",  title:"<spring:message code='global.lbl.regUsrId' />",width:100, attributes:{"class":"ac"}} //등록자
            //,{field:"regDt",     title:"<spring:message code='global.lbl.regDt' />",   width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
        ]
    });



});

</script>
<!-- //script -->

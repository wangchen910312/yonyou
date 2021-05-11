<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-옵션 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.vehicleSpecOcn" /></h1><!-- VehicleSpec - 옵션 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11278" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <th scope="row"><spring:message code='global.lbl.optionNm' /></th><!-- 옵션명 -->
                    <td>
                        <input id="sOptionNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.applyDate' /></th><!-- 적용일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" type="text" data-type="maskDate" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" type="text" data-type="maskDate" class="form_datepicker">
                            </div>
                        </div>
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


$(document).ready(function() {


    //조회조건 - 적용시작일
    var sStartDtPicker = $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }).data("kendoDatePicker");


    //조회조건 - 적용종료일
    var sEndDtPicker = $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }).data("kendoDatePicker");



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
        gridId:"G-SAL-0721-115913"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecOption.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["option"] = $("#sOptionNm").val();
                        params["startDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["endDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carlineCd"
                    ,fields:{
                        optionCd   :{type:"string"}
                        ,optionNm  :{type:"string"}
                        ,optionEnNm:{type:"string"}
                        ,startDt   :{type:"date"}
                        ,endDt     :{type:"date"}
                        ,regUsrId  :{type:"string"}
                        ,regDt     :{type:"date"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
            {field:"optionCd",    title:"<spring:message code='global.lbl.optionCode' />", width:100,  attributes:{"class":"al"}} //옵션코드
            ,{field:"optionNm",   title:"<spring:message code='global.lbl.optionNm' />",   width:200, attributes:{"class":"al"}} //옵션명
            ,{field:"optionEnNm", title:"<spring:message code='global.lbl.optionEnNm' />", width:200, attributes:{"class":"al"}} //옵션영문명
            ,{field:"startDt",    title:"<spring:message code='sal.lbl.startDt' />",       width:100,  attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //적용시작일
            ,{field:"endDt",      title:"<spring:message code='sal.lbl.endDt' />",         width:100,  attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //적용종료일
            ,{field:"regUsrId",   title:"<spring:message code='global.lbl.regUsrId' />",   width:120,  attributes:{"class":"ac"}} //등록자
            ,{field:"regDt",      title:"<spring:message code='global.lbl.regDt' />",      width:150, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateTimeFormat' />}"} //등록일
        ]
    });



});
</script>
<!-- //script -->











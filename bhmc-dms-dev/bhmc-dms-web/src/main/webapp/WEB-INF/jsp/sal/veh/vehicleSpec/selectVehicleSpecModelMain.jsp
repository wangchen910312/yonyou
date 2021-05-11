<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-모델 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.vehicleSpecModel" /></h1><!-- VehicleSpec - 모델 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11277" hasPermission="${dms:getPermissionMask('READ')}">
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
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.modelNm' /></th><!-- 모델명 -->
                    <td>
                        <input id="sModelNm" type="text" class="form_input">
                    </td>
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
/**
 * 차종 콤보
 */
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//승/상용구분 Array
var pcDstinTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pcDstinTpList}">
    pcDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//승/상용구분 Map
var pcDstinTpMap = dms.data.arrayToMap(pcDstinTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function () {

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 모델 콤보박스
     */
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"fscNm"
        ,dataValueField:"fscCd"
        ,optionLabel:" "  // 전체
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115910"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModel.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarlineCd"] = $("#sCarlineCd").val();
                        params["sFscCd"] = $("#sModelCd").val();
                        params["sFscNm"] = $("#sModelNm").val();

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
                        carlineCd  :{type:"string"}
                        ,carlineNm :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,modelEnNm :{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:true
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,sortable:false
        ,columns:[
            {field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",   width:100, attributes:{"class":"ac"}} //차종
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:150, attributes:{"class":"al"}} //차종명
            ,{field:"fscpModtpCd",   title:"<spring:message code='global.lbl.modelCd' />",   width:150,attributes:{"class":"al"}} //모델명
            ,{field:"modelNm",   title:"<spring:message code='global.lbl.modelNm' />",   width:150,attributes:{"class":"al"}} //모델명
            ,{field:"modelEnNm", title:"<spring:message code='global.lbl.modelEnNm' />", width:150,attributes:{"class":"al"}} //모델영문명
        ]
    });



});
</script>
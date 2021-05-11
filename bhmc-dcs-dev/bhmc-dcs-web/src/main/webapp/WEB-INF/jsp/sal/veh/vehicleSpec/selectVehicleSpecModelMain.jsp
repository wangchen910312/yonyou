<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-모델 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">车型信息</h1><!-- VehicleSpec - 모델 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12016" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineNm" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModel" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.modelNm' /></th><!-- 모델명 -->
                    <td>
                        <input id="sModelNm" type="text" class="form_input">
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
/**
 * 차종 콤보
 */
 var carlineList = [{"carlineNm":"", "carlineCd":""}];
 <c:forEach var="obj" items="${carlineNames}">
  carlineList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>


//승/상용구분 Array
var pcDstinTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pcDstinTpList}">
    pcDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//승/상용구분 Map
var pcDstinTpMap = dms.data.arrayToMap(pcDstinTpList, function(obj){ return obj.cmmCd; });



$(document).ready(function () {

    /**
    * 차종 콤보박스
    */
    $("#sCarlineNm").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineList
        ,select:onSelectCarlineCd
        ,optionLabel:" "  // 전체
    });
    /**
     * 모델 콤보박스
     */
    $("#sModel").kendoExtDropDownList({
        dataTextField:"modelCdNm"
        ,dataValueField:"modelCd"
        ,select:onSelectModelCd
        ,optionLabel:" "  // 전체
    });



    /**
     * 차종에 따른 모델 조회
     */
     function onSelectCarlineCd(e) {
         var dataItem = this.dataItem(e.item);
         //alert(kendo.stringify(dataItem.carlineCd)+"/"+kendo.stringify(dataItem.carlineNm)); //-- 데이터 제대로 select 함.
         //alert(kendo.stringify(this.options.dataSource[this.selectedIndex])); //-- 데이터 제대로 select 못함.
         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelList.do'/>"
             ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
             ,async:false
         });

         $("#sModel").data("kendoExtDropDownList").setDataSource(responseJson.data);

     };
     /**
     * 모델에 따른 OCN 조회
     */
     function onSelectModelCd(e) {
         var dataItem = this.dataItem(e.item);
         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/sal/veh/modelPackage/selectModelPackageOcn.do'/>"
             ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sModelCd":dataItem.modelCd})
             ,async:false
         });

     };


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

                        params["carlineCd"] = $("#sCarlineNm").val();
                        params["modelCd"] = $("#sModel").val();
                        params["modelNm"] = $("#sModelNm").val();

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
                        ,modelCd   :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,modelEnNm :{type:"string"}
                        ,pcDstinTp :{type:"string"}
                        ,useYn     :{type:"string"}
                        ,salePsbYn :{type:"string"}
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
        ,columns:[
            {field:"carlineCd",  title:"<spring:message code='global.lbl.carLine' />",   width:40, attributes:{"class":"ac"}} //차종
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:70, attributes:{"class":"ac"}} //차종명
            ,{field:"modelCd",   title:"<spring:message code='crm.lbl.mi' />",     width:100,attributes:{"class":"ac"}} //모델
            ,{field:"modelNm",   title:"<spring:message code='crm.lbl.miNm' />",   width:120,attributes:{"class":"al"}} //모델명
            ,{field:"modelEnNm", title:"<spring:message code='crm.lbl.miEnNm' />", width:130,attributes:{"class":"al"}} //모델영문명
            ,{field:"pcDstinTp", title:"<spring:message code='sal.lbl.pcDstinTp' />",    width:70, attributes:{"class":"ac"}
              ,template:"# if(pcDstinTp !== ''){# #= pcDstinTpMap[pcDstinTp].cmmCdNm# #}#"
             } //승/상용
            ,{field:"useYn",     title:"<spring:message code='global.lbl.useYn' />",     width:55, attributes:{"class":"ac"}} //사용여부
            ,{field:"salePsbYn", title:"<spring:message code='sal.lbl.saleYn' />",       width:70, attributes:{"class":"ac"}} //판매가능여부
        ]
    });



});
</script>
<!-- //script -->











<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-옵션 -->
<section class="group">
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>


<!-- script -->
<script>


$(document).ready(function() {

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115607"
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

                        /* params["option"] = $("#sOptionNm").val();
                        params["startDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["endDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value(); */

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
        ,pageable:false
        ,editable:false
        ,autoBind:false
        ,height:219
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,filterable:false
        ,columns:[
            {field:"a",    title:"<spring:message code='global.lbl.carNo' />",    width:50,  attributes:{"class":"ac"}} //차량번호
            ,{field:"b",   title:"<spring:message code='global.lbl.carNm' />",    width:150, attributes:{"class":"al"}} //차량명
            ,{field:"c",   title:"<spring:message code='sal.lbl.documentName' />",width:150, attributes:{"class":"al"}} //자료명칭
            ,{field:"d",   title:"<spring:message code='sal.lbl.uploadStatus' />",width:80,  attributes:{"class":"ac"}} //업로드상태
            ,{field:"e",   title:"<spring:message code='par.lbl.itemOper' />",    width:80,  attributes:{"class":"ac"}} //조작
        ]
    });



});
</script>
<!-- //script -->











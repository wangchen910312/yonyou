<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name:selectOrderGradeConditionMain.jsp
    Description:오더등급을 조회한다.
    author Lee Seungmin
    since 2016. 4. 6.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 4. 6.     Lee Seungmin     최초 생성
--%>

<!-- 오더등급조회 -->
<div id="resizableContainer">
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.OrderGradeSearch" /></h1><!-- 오더등급조회 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10965" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox">
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><span><spring:message code="global.lbl.ocn" /></span></th> <!-- OCN -->
                    <td>
                        <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>

</section>
</div>

<script>

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var subParam = {};

/**
 * 차종 콤보
 */
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

/*************************** 검색조건 END ******************************************/

$(document).ready(function() {
    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,change:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#hiddenFscCode").val("");

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

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "   // 전체
       ,change:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#hiddenFscCode").val("");

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,change:function(e){

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#hiddenFscCode").val("");

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                ,data:JSON.stringify({"sModelCd":e.dataItem.modelCd})
                ,async:false
                ,success:function(data) {
                    $("#hiddenFscCode").val(e.dataItem.modelCd);
                }
            });

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
        dataTextField: "extColorNm"
       ,dataValueField:"extColorCd"
       ,optionLabel:" "   // 전체
   });
   $("#sExtColorCd").data("kendoExtDropDownList").enable(false);


    //버튼 - 조회
     $("#btnSearch").kendoButton({
        click:function(e){
/*             if( !($("#sContractStartDt").val() == '' && $("#sContractEndDt").val() == '') ){
                if($("#sContractStartDt").val() == '' || $("#sContractEndDt").val() == ''){
                    //적용일을 모두 입력해 주세요
                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                    return false;
                }
            }
*/
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115000"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/orm/orderGradeCondition/selectOrderGradeCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";

                        /*Paging Param Start~!*/
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        /*Paging Param End~!*/

                        /*Screen Param Start~!*/
                        params["sCarlineCd"] = $("#sCarlineCd").val();                      //차종코드

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델

                        params["sOcnCd"] = $("#sOcnCd").val();                              //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").val();                    //외장색코드
                        /*Screen Param End~!*/

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
                         carlineCd     :{type:"string"}
                        ,carlineNm     :{type:"string"}
                        //,modelCd       :{type:"string"}
                        ,modelNm       :{type:"string"}
                        ,ocnCd         :{type:"string"}
                        ,ocnNm         :{type:"string"}
                        ,extColorCd    :{type:"string"}
                        ,extColorNm    :{type:"string"}
                        ,intColorCd    :{type:"string"}
                        //,intColorNm    :{type:"string"}
                        ,ordGradeCd    :{type:"string"}
                        ,regDt         :{type:"date"}
                        ,updtDt        :{type:"date"}
                    }
                }
            }
        }
        ,pageable:{
            refresh:true
            ,pageSize:100
            ,pageSizes:[ "100", "300", "500", "All" ]
            ,buttonCount:5
            ,input:false
            ,numeric:true
            ,info:true
            ,messages:{
                itemsPerPage:""
                ,display:"{0}-{1} of {2}"
                ,empty:""
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        //,appendEmptyColumn:true          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,editable:false
        ,autoBind:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,sortable:false
        ,columns:[
             {field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80, attributes:{"class":"ac"}} //차종code
            ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"al"}} //차종description
            //,{field:"modelCd",       title:"<spring:message code='global.lbl.modelCd' />",        width:140, attributes:{"class":"ac"}} //모델code
            ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",        width:120, attributes:{"class":"al"}} //모델description
            ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",          width:80, attributes:{"class":"ac"}} //OCNcode
            ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}} //OCNdescription
            ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80, attributes:{"class":"al"}} //외장색code
            ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80, attributes:{"class":"al"}} //외장색description
            ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80, attributes:{"class":"al"}} //내장색code
            //,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",     width:150, attributes:{"class":"al"}} //내장색description
            ,{field:"ordGradeCd",    title:"<spring:message code='global.lbl.orderGrade' />",   width:85, attributes:{"class":"ac"}} //오더등급
            ,{field:"regDt",         title:"<spring:message code='global.lbl.carRegDt' />"  ,   width:80 , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // 등록일
            ,{field:"updtDt",        title:"<spring:message code='global.lbl.updtDt' />"  ,   width:80 , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // 수정일
        ]
    });

});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <div class="header_area">
    <%-- 
         <h1 class="title_basic"><spring:message code='sal.title.evalHistory' /></h1> <!-- 평가정보이력 -->
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>         <!-- 조회 -->
        </div>
     --%>
    </div>
    <div class="table_grid">
        <input id="sVinNo" type="hidden" class="form_input">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>

</section>
</div>

<script type="text/javascript">

var sVinNo  = "${sVinNo}";

/************* 차량상태(입고확정상태) SELECT BOX  *******************/
var carStatCdList = [];
<c:forEach var="obj" items="${carStatCdInfo}">
    carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd});

/************* 물류 서비스 평가 SELECT BOX  *******************/
var dstbSerEvalList = [];
<c:forEach var="obj" items="${dstbSerEvalInfo}">
  dstbSerEvalList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var dstbSerEvalArr = dms.data.arrayToMap(dstbSerEvalList, function(obj){return obj.cmmCd});

/************* 기사만족도 SELECT BOX  *******************/
var driverStsfList = [];
<c:forEach var="obj" items="${driverStsfInfo}">
  driverStsfList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var driverStsfArr = dms.data.arrayToMap(driverStsfList, function(obj){return obj.cmmCd});

/************* 차량 교부시간 SELECT BOX  *******************/
 var carIssueHmList = [];
<c:forEach var="obj" items="${carIssueHmInfo}">
  carIssueHmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var carIssueHmArr = dms.data.arrayToMap(carIssueHmList, function(obj){return obj.cmmCd});

/************* 차량 교부질량 SELECT BOX  *******************/
var carIssueMassList = [];
  <c:forEach var="obj" items="${carIssueMassInfo}">
    carIssueMassList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:forEach>

var carIssueMassArr = dms.data.arrayToMap(carIssueMassList, function(obj){return obj.cmmCd});
/************* 주문유형 SELECT BOX  *******************/

$(document).ready(function() {

    $("#sVinNo").val(sVinNo);

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0120-190001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/lom/evalSearchEdit/selectEvalHistorySearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sVinNo"] = $("#sVinNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"seq",
                    fields:{
                         rnum:{type:"number"}
                        ,vinNo:{type:"string"}
                        ,pltGiDt:{type:"date"}
                        ,dstbSerEvalVal:{type:"string"}
                        ,driverStsfVal:{type:"string"}
                        ,carIssueHmVal:{type:"string"}
                        ,carIssueMassVal:{type:"string"}
                        ,otherCont:{type:"string"}
                    }
                }
            }
        }
       ,autoBind:true
       ,pageable:false
       ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,editable:false
       ,sortable:false
       ,columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                     ,attributes:{"class":"ac"}
                 }
                 ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />"
                     ,width:110
                     ,headerAttributes:{style:"text-align:center;"}
                     ,attributes:{ "style":"text-align:center"}
                 }  // Vin No
                 ,{field:"dlrEvalDt", title:"<spring:message code='global.lbl.evalScheDt' />"
                     ,width:80
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,headerAttributes:{style:"text-align:center;"}
                     ,attributes:{ "style":"text-align:center"}
                 }  // 평가일자
                 ,{field:"dstbSerEvalVal", title:"<spring:message code='sal.lbl.dstbSerEval' />"
                     ,width:70
                     ,template:"#if(dstbSerEvalArr[dstbSerEvalVal] != null){# #= dstbSerEvalArr[dstbSerEvalVal].cmmCdNm# #}#"
                     ,headerAttributes:{style:"text-align:center;"}
                 }  // 물류 서비스 평가
                 ,{field:"driverStsfVal", title:"<spring:message code='sal.lbl.driverStsf' />"
                     ,width:70
                     ,template:"#if(driverStsfArr[driverStsfVal] != null){# #= driverStsfArr[driverStsfVal].cmmCdNm# #}#"
                     ,headerAttributes:{style:"text-align:center;"}
                 }  // 기사 만족도
                 ,{field:"carIssueHmVal", title:"<spring:message code='sal.lbl.carIssueHm' />"
                     ,width:70
                     ,template:"#if(carIssueHmArr[carIssueHmVal] != null){# #= carIssueHmArr[carIssueHmVal].cmmCdNm# #}#"
                     ,headerAttributes:{style:"text-align:center;"}
                 }  // 차량 교부시간
                 ,{field:"carIssueMassVal", title:"<spring:message code='sal.lbl.carIssueMass' />"
                     ,width:70
                     ,template:"#if(carIssueMassArr[carIssueMassVal] != null){# #= carIssueMassArr[carIssueMassVal].cmmCdNm# #}#"
                     ,headerAttributes:{style:"text-align:center;"}
                 }  // 차량 교부질량
                 ,{field:"otherCont", title:"<spring:message code='sal.lbl.otherCont' />"
                     ,width:160
                     ,headerAttributes:{style:"text-align:center;"}
                 }  // 기타신고 및 의견
       ]
   });
});


</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 재고조회 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.stockView' /></h1> <!-- 재고조회 -->
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form form_width_70per">
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
                    <th scope="row"><spring:message code='global.lbl.stockCd' /></th>       <!-- 재고유형 -->
                    <td>
                        <input id="sStockTpDS" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>       <!-- 회사차여부 -->
                    <td>
                        <!-- <input id="sCmpCarYn" class="form_comboBox" /> -->
                    </td>
                    <th scope="row"></th>       <!-- 회사차구분 -->
                    <td>
                        <!-- <input id="sCmpCarDstinCd" class="form_comboBox" /> -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>         <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" class="form_input" maxlength="16" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.strge' /></th>          <!-- 창고 -->
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.location' /></th>       <!-- 위치 -->
                    <td>
                        <input id="sLocCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                     <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                    <td class="bor_none">
                        <input id="sIntColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th>       <!-- 판매고문 -->
                    <td>
                        <input type="checkbox" id="salMng" class="form_check" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="mainGrid"></div>
    </div>


    <div class="table_grid mt10">
        <div id="subGrid"></div>
    </div>
</section>
<!-- //재고조회 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var subParam = {};
var salMng = "";

//재고유형 SAL074
var stockDSList = [];
var stockTpObj = {};
<c:forEach var="obj" items="${stockTpDS}">
    stockDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    stockTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//회사차구분 SAL053
var cmpCarDstinCdDSList = [];
var cmpCarDstinCdObj = {};
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
    cmpCarDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    cmpCarDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 위치
var locDSList = [];
var locCdObj = {};
<c:forEach var="obj" items="${locDSList}">
    locDSList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
</c:forEach>

// 차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


// 차량상태 SAL001
var carStatCdObj = {};
<c:forEach var="obj" items="${carStatCdDS}">
    carStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 보유상태 SAL149
var ownStatCdObj = {};
<c:forEach var="obj" items="${ownStatCdDS}">
    ownStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 오더유형 SAL137
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 합격증 저당코드:SAL052
var certSecuList = [];
var certSecuObj = {};
<c:forEach var="obj" items="${certSecuDs}">
    certSecuList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    certSecuObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            salMng = $("#salMng").prop('checked') == true ? "Y":"N";
            $('#mainGrid').data('kendoExtGrid').dataSource.read();

            // 상세화면 전체조회 요청.
            subGridView("", "", "", "", "", "");

        }
    });

    // 재고유형
    $("#sStockTpDS").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stockDSList
       ,optionLabel:" "           //선택
    });

    // 회사차여부
    /*
    $("#sCmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,optionLabel:" "           //선택
    });
    */

    // 회사차구분
    /*
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cmpCarDstinCdDSList
       ,optionLabel:" "           //선택
    });
    */

    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택
       ,select:function (e){
           var dataItem = this.dataItem(e.item);
           $("#sLocCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sLocCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.cmmCd == ""){
               $("#sLocCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sLocCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
               ,data:JSON.stringify( dataItem.cmmCd )
               ,async:false
           });
           $("#sLocCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 위치
    $("#sLocCd").kendoExtDropDownList({
        dataTextField :"locNm"
       ,dataValueField:"locCd"
       //,dataSource:locDSList
       ,optionLabel:" "           //선택
    });
    $("#sLocCd").data("kendoExtDropDownList").enable(false);

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

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
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
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
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
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 메인 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113906"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/inv/stockView/selectStockView.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //재고유형
                        params["sStockTpDS"] = $("#sStockTpDS").data("kendoExtDropDownList").value();

                        //회사차여부
                        //params["sCmpCarYn"] = $("#sCmpCarYn").data("kendoExtDropDownList").value();
                        // 회사차구분
                        //params["sCmpCarDstinCd"] = $("#sCmpCarDstinCd").data("kendoExtDropDownList").value();

                        // vin
                        params["sVinNo"] = $("#sVinNo").val();
                        // 창고
                        params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();
                        // 위치
                        params["sLocCd"] = $("#sLocCd").data("kendoExtDropDownList").value();

                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                        params["salMng"] = $("#salMng").prop('checked') == true ? "Y":"N";

                        //console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carlineCd",
                    fields:{
                        carlineCd :{type:"string", editable:false}
                        ,carlineNm:{type:"string"}
                        ,modelCd:{type:"string"}
                        ,modelNm:{type:"string"}
                        ,ocnCd:{type:"string"}
                        ,ocnNm:{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,cntTot      :{type:"number"}
                        ,avlbStock   :{type:"number"}
                        ,policyStock :{type:"number"}
                        ,damageStock :{type:"number"}
                        ,displayStock:{type:"number"}
                        ,longStock   :{type:"number"}
                        ,dlrStock    :{type:"number"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:250
       ,editable:false
       ,autoBind:false
       //,pageable:false
       ,navigatable:true
       ,selectable:"row"
       ,columns:[
           {field:"carlineCd",  title:"<spring:message code='global.lbl.carLine' />",     width:80,   attributes:{"class":"ac"}}    // 차종
          ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:150,  attributes:{"class":"al"}}    // 차종명
          ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",       width:100,  attributes:{"class":"ac"}}    // 모델
          ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:250,  attributes:{"class":"al"}}     // 모델명
          ,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",         width:100,  attributes:{"class":"ac"}}    // OCN
          ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:250,  attributes:{"class":"al"}}    // OCN명
          ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",    width:100,  attributes:{"class":"ac"}}    // 외장색
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:200,  attributes:{"class":"al"}}    // 외장색명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",    width:100,  attributes:{"class":"ac"}}    // 내장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:200,  attributes:{"class":"al"}}    // 내장색명
          ,{field:"cntTot",       title:"<spring:message code='global.lbl.stockTot' />", width:70, attributes:{"class":"ar"}, format:"{0:n0}"}   //재고총수량
          ,{   //가용
               field:"avlbStock"
              ,title:"<spring:message code='global.lbl.avlbStock' />"
              ,width:70
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,template:"<a href=\"javascript:subGridView(\'#=carlineCd#\', \'#=modelCd#\', \'#=ocnCd#\', \'#=extColorCd#\', \'#=intColorCd#\', \'01\');\">#=avlbStock#</a>"

          }
          ,{   //정책
               field:"policyStock"
              ,title:"<spring:message code='global.lbl.policyStock' />"
              ,width:70
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,template:"<a href=\"javascript:subGridView(\'#=carlineCd#\', \'#=modelCd#\', \'#=ocnCd#\', \'#=extColorCd#\', \'#=intColorCd#\', \'03\');\">#=policyStock#</a>"
          }
          ,{   //손상
               field:"damageStock"
              ,title:"<spring:message code='global.lbl.damageStock' />"
              ,width:70
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,template:"<a href=\"javascript:subGridView(\'#=carlineCd#\', \'#=modelCd#\', \'#=ocnCd#\', \'#=extColorCd#\', \'#=intColorCd#\', \'05\');\">#=damageStock#</a>"
          }
          ,{   //전시차
               field:"displayStock"
              ,title:"<spring:message code='global.lbl.displayStock' />"
              ,width:70
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,template:"<a href=\"javascript:subGridView(\'#=carlineCd#\', \'#=modelCd#\', \'#=ocnCd#\', \'#=extColorCd#\', \'#=intColorCd#\', \'02\');\">#=displayStock#</a>"
          }
          ,{   //장기
               field:"longStock"
              ,title:"<spring:message code='global.lbl.longStock' />"
              ,width:70
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,template:"<a href=\"javascript:subGridView(\'#=carlineCd#\', \'#=modelCd#\', \'#=ocnCd#\', \'#=extColorCd#\', \'#=intColorCd#\', \'04\');\">#=longStock#</a>"
          }
          ,{   //딜러오픈
               field:"dlrStock"
              ,title:"<spring:message code='global.lbl.dlrStock' />"
              ,width:70
              ,attributes:{"class":"ar"}
              ,format:"{0:n0}"
              ,template:"<a href=\"javascript:subGridView(\'#=carlineCd#\', \'#=modelCd#\', \'#=ocnCd#\', \'#=extColorCd#\', \'#=intColorCd#\', \'06\');\">#=dlrStock#</a>"
          }
       ]
   });


   // 수량 클릭
   subGridView = function (carlineCd, modelCd, ocnCd, extColorCd, intColorCd, commonCd){

       subParam = {
                   "sCarlineCd":carlineCd
                 , "sModelCd":modelCd
                 , "sOcnCd":ocnCd
                 , "sExtColorCd":extColorCd
                 , "sIntColorCd":intColorCd
                 , "sStockTpDS":commonCd
       };

       // 상세정보 Grid 조회
       $('#subGrid').data('kendoExtGrid').dataSource.page(1);
   }

   // 상세 그리드
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-113907"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/inv/stockView/selectStockViewSub.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       subParam["recordCountPerPage"] = options.pageSize;
                       subParam["pageIndex"] = options.page;
                       subParam["firstIndex"] = options.skip;
                       subParam["lastIndex"] = options.skip + options.take;
                       subParam["sort"] = options.sort;

                       subParam["salMng"] = salMng;

                       //console.log('subParam:',kendo.stringify(subParam) );
                       return kendo.stringify(subParam);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"vinNo",
                   fields:{
                        vinNo :{type:"string", editable:false} // 차대번호
                       ,ncarDstinCd:{type:"string", editable:false}            // 신차량구분코드

                       ,stockTp:{type:"string", editable:false}                // 재고유형
                       //,cmpCarYn:{type:"string", editable:false}               // 회사차여부
                       //,cmpCarDstinCd:{type:"string", editable:false}          // 회사차구분
                       ,strgeCd:{type:"string", editable:false}                // 창고
                       ,locCd:{type:"string", editable:false}                  // 위치

                       ,carlineCd :{type:"string", editable:false}
                       ,carlineNm:{type:"string", editable:false}
                       ,modelCd:{type:"string", editable:false}
                       ,modelNm:{type:"string", editable:false}
                       ,ocnCd:{type:"string", editable:false}
                       ,ocnNm:{type:"string", editable:false}
                       ,extColorCd:{type:"string", editable:false}
                       ,extColorNm:{type:"string", editable:false}
                       ,intColorCd:{type:"string", editable:false}
                       ,intColorNm:{type:"string", editable:false}
                       ,carStatCd:{type:"string", editable:false}
                       ,ownStatCd:{type:"string", editable:false}
                       ,ordTp:{type:"string", editable:false}
                       ,enginModelCd:{type:"string", editable:false}
                       ,certNo:{type:"string", editable:false}
                       ,grDt:{type:"date", editable:false}
                       ,dlrCd:{type:"string", editable:false}
                       ,preGiYn:{type:"string", editable:false}
                       ,rfidNo :{type:"string", editable:false}
                       ,certSecu2Cd:{type:"string", editable:false}
                   }
               }
           }
       }
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,height:300
      ,autoBind:false
      //,pageable:false
      ,editable:true
      ,columns:[
          {field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:160, attributes:{"class":"ac"}}       // vin no
         ,{field:"ncarDstinCd", hidden:true}           // 신차량구분코드
         ,{ // 재고유형
             field:"stockTp"
            ,title:"<spring:message code='global.lbl.stockCd' />"
            ,width:100
            ,attributes:{"class":"ac"}
            ,template:"#=dms.string.strNvl(stockTpObj[stockTp])#"
         }
         /*
         ,{ // 회사차여부
              field:"cmpCarYn"
             ,title:"<spring:message code='global.lbl.cmpCarYn' />"
             ,width:100
             ,attributes:{"class":"ac"}
         }
         ,{    // 회사차구분
              field:"cmpCarDstinCd"
             ,title:"<spring:message code='global.lbl.cmpCarDstinCd' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl(cmpCarDstinCdObj[cmpCarDstinCd])#"
         }
         */
         ,{ // 창고
              field:"strgeCd"
             ,title:"<spring:message code='global.lbl.strge' />"
             ,width:100
             ,attributes:{"class":"al"}
             ,template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"
         }
         ,{ // 위치
              field:"locCd"
             ,title:"<spring:message code='sal.lbl.location' />"
             ,width:100
             ,attributes:{"class":"al"}
             ,template:"#= dms.string.strNvl(locCdObj[locCd]) #"
         }
         ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carLine' />",      width:80,  attributes:{"class":"ac"}}    // 차종
         ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:150, attributes:{"class":"al"}}    // 차종
         ,{field:"modelCd",       title:"<spring:message code='global.lbl.model' />",        width:100, attributes:{"class":"ac"}}    // 모델
         ,{field:"modelNm",       title:"<spring:message code='global.lbl.modelNm' />",      width:250, attributes:{"class":"al"}}    // 모델
         ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocn' />",          width:100, attributes:{"class":"ac"}}    // OCN
         ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:250, attributes:{"class":"al"}}    // OCN
         ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColor' />",     width:100, attributes:{"class":"ac"}}    // 외장색
         ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",   width:200, attributes:{"class":"al"}}    // 외장색명
         ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColor' />",     width:100, attributes:{"class":"ac"}}    // 내장색
         ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",   width:200, attributes:{"class":"al"}}    // 내장색명
         ,{field:"carStatCd",     title:"<spring:message code='global.lbl.vinSts' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(carStatCdObj[carStatCd]) #"}       // 차량상태
         ,{field:"ownStatCd",     title:"<spring:message code='global.lbl.ownStatCd' />", width:100, attributes:{"class":"al"}, template:"#= ownStatCdObj[ownStatCd] #"}    // 보유상태
         ,{field:"ordTp",         title:"<spring:message code='global.lbl.orderType' />", width:140, attributes:{"class":"al"}, template:"#= ordTpObj[ordTp] #"}            // 주문유형
         ,{field:"enginModelCd",  title:"<spring:message code='sal.lbl.engNo' />", width:100, attributes:{"class":"al"}}                          // 엔진번호
         ,{field:"certNo",        title:"<spring:message code='global.lbl.certNo' />", width:100, attributes:{"class":"al"}}                      // 합격증번호
         ,{field:"grDt",          title:"<spring:message code='global.lbl.grDt' />", width:100, attributes:{"class":"al"}, format:"{0:"+vDtyyyyMMdd+"}"}     // 입고일
         ,{field:"dlrCd",         hidden:true}  // 딜러코드
         ,{
             field:"preGiYn", title:"<spring:message code='sal.lbl.preGiYn' />", attributes:{"class":"al"}, width:80
             ,template:"#=dms.string.strNvl(ynObj[preGiYn])#"
         }       // 선출고여부
         ,{field:"rfidNo", title:"<spring:message code='global.lbl.rfidNo' />", width:150}               // RFID NO
         ,{
             field:"certSecu2Cd", title:"<spring:message code='global.lbl.certNo' />", attributes:{"class":"al"}, width:150
             ,template:"#=dms.string.strNvl(certSecuObj[certSecu2Cd])#"
         }               // 합격증상태
      ]
  });



});
</script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 완성차재고현황(Location별) -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.stockCondition' /></h1> <!-- 완성차재고현황(Location별) -->
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
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.strge' /></span></th>          <!-- 창고 -->
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.location' /></th>       <!-- 위치 -->
                    <td class="bor_none">
                        <input id="sLocCd" class="form_comboBox" />
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
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
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="clfix">
        <!-- Location -->
        <section class="location_left">
            <div class="header_area">
                <h2 class="title_basic">Location</h2>
                <div class="btn_right">
                    <button id="btnExpand" type="button" class="btn_s btn_up"><spring:message code="global.btn.up" /></button><!-- 위로  -->
                    <button id="btnCollapse" type="button" class="btn_s btn_down"><spring:message code="global.btn.down" /></button><!-- 아래로  -->
                </div>
            </div>
            <div class="table_grid">
                <div id="treelist"></div>
            </div>
        </section>
        <!-- //Location -->

        <!-- 재고정보 -->
        <section class="location_right">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="global.lbl.stockInfo" /></h2>       <!-- 재고정보 -->
            </div>
            <div class="table_grid">
                <div id="subGrid"></div>
            </div>
        </section>
        <!-- //재고정보 -->
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
/*
<c:forEach var="obj" items="${locDSList}">
    locDSList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
</c:forEach>
*/

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


//트리 리스트 확장/축소
function treelistExpanded(bFlag){
    var treelist = $("#treelist").data("kendoTreeList");
    var dataItems = treelist.dataSource.data();
    $.each(dataItems, function(idx,item){
        item.expanded = bFlag;
    });
    treelist.dataSource.data(dataItems);
}


$(document).ready(function() {
    subParam["sCarlineCd"]  = "";
    subParam["sModelCd"]    = "";
    subParam["sOcnCd"]      = "";
    subParam["sExtColorCd"] = "";
    subParam["sIntColorCd"] = "";
    subParam["sStrgeCd"]    = "";
    subParam["sLocCd"]      = "";


    $("#btnExpand").kendoButton({       // 위로 버튼
        click:function(e){
            treelistExpanded(false);
        }
    });

    $("#btnCollapse").kendoButton({     // 아래로 버튼
        click:function(e){
            treelistExpanded(true);
        }
    });

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            if($("#sStrgeCd").data("kendoExtDropDownList").value() != ""){
                treeDataSource.read();
                //$('#subGrid').data('kendoExtGrid').dataSource.read();
                $("#subGrid").data('kendoExtGrid').dataSource.data([]);
            }else{
                //strge selected message
                dms.notification.info("<spring:message code='sal.lbl.strgeCd' var='strge' /><spring:message code='global.info.chkSelectItemMsg' arguments='${strge}' />");
            }
        }
    });

    // 재고유형
    $("#sStockTpDS").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stockDSList
       ,optionLabel:" "
    });

    // 회사차여부
    $("#sCmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,optionLabel:" "
    });

    // 회사차구분
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cmpCarDstinCdDSList
       ,optionLabel:" "
    });

    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "
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
               url:"<c:url value='/sal/inv/stockCondition/selectLocation.do' />"
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
       ,optionLabel:" "
    });
    $("#sLocCd").data("kendoExtDropDownList").enable(false);

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
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


    // 트리
    var treeDataSource = new kendo.data.TreeListDataSource({
        transport:{
            read:{
                url:"<c:url value='/sal/inv/stockCondition/selectStockCondition.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};
                    params["sort"] = options.sort;

                    //params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();

                    var sStrgeCd = $("#sStrgeCd").data("kendoExtDropDownList").value() == "" ? "X":$("#sStrgeCd").data("kendoExtDropDownList").value();
                    params["sStrgeCd"] = sStrgeCd;
                    params["sLocCd"] = $("#sLocCd").data("kendoExtDropDownList").value();
                    params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                    params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                    params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                    params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                    params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                    //console.log('params:',kendo.stringify(params) );
                    return kendo.stringify(params);
                }
            }
            ,batch:true
            ,schema:{
                model:{
                    id:"id"
                    ,expanded:true
                    ,fields:{
                        id:{type :"number"}
                       ,lvlId:{type :"number"}
                       ,locCd:{type :"string"}
                       ,locNm:{type :"string"}
                       ,mainLocYn:{type :"string"}
                       ,strgeCd:{type :"string"}
                       ,upperLocId:{type :"string"}
                       ,parentId:{type :"number", nullable:true}
                       ,tot:{type :"number"}
                    }
                }
            }
            , aggregate:[{field:"tot", aggregate:"max"}]

        }
    });
    $("#treelist").kendoTreeList({
        dataSource:treeDataSource
        ,height:380
        ,selectable:"row"
        ,recorderable:true
        ,autoBind:true
        ,editable:false
        ,change:function(e) {
            var selectedRows = this.select();

            if(selectedRows.length > 0){
                var dataItem = this.dataItem(selectedRows[0]);

                subParam["sCarlineCd"]  = $("#sCarlineCd").data("kendoExtDropDownList").value();
                subParam["sModelCd"]    = $("#sModelCd").data("kendoExtDropDownList").value();
                subParam["sOcnCd"]      = $("#sOcnCd").data("kendoExtDropDownList").value();
                subParam["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                subParam["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();
                subParam["sStrgeCd"]    = dataItem.strgeCd;
                subParam["sLocCd"]      = dataItem.locCd;

                $('#subGrid').data('kendoExtGrid').dataSource.read();
            }
        }
        ,columns:[
             {field:"id", hidden:true }      // row id
            ,{field:"lvlId", hidden:true }
            ,{field:"locCd", hidden:true }
            ,{field:"locNm", title:"<spring:message code='global.lbl.locTree'/>", width:210 }  //로케이션계층
            ,{field:"mainLocYn", hidden:true }
            ,{field:"strgeCd", hidden:true }
            ,{field:"upperLocId", hidden:true }
            ,{field:"parentId", hidden:true }
            ,{field:"tot", title:"<spring:message code='global.lbl.qty'/>", attributes:{"class":"ar"} }   //수량
        ]

    });

   // 상세 그리드
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-113903"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/inv/stockCondition/selectStockConditionSub.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       subParam["sort"] = options.sort;

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
                       ,cmpCarYn:{type:"string", editable:false}               // 회사차여부
                       ,cmpCarDstinCd:{type:"string", editable:false}          // 회사차구분
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
                   }
               }
           }
       }
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,appendEmptyColumn:false          //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,height:382
      ,autoBind:false
      ,pageable:false
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
         ,{ // 창고
              field:"strgeCd"
             ,title:"<spring:message code='global.lbl.strge' />"
             ,width:100
             ,attributes:{"class":"al"}
             ,template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"
         }
         ,{ // 위치
              field:"locCd"
             ,title:"<spring:message code='global.lbl.location' />"
             ,width:100
             ,attributes:{"class":"al"}
             ,template:"#= dms.string.strNvl(locCdObj[locCd]) #"
         }
         ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}    // 차종
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
         ,{field:"ownStatCd",     title:"<spring:message code='global.lbl.ownStatCd' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(ownStatCdObj[ownStatCd]) #"}    // 보유상태

         ,{field:"ordTp",         title:"<spring:message code='global.lbl.orderType' />", hidden:true, attributes:{"class":"al"}, template:"#= ordTpObj[ordTp] #"}            // 주문유형
         ,{field:"enginModelCd",  title:"<spring:message code='global.lbl.engnNo' />", hidden:true, attributes:{"class":"al"}}                      // 엔진번호
         ,{field:"certNo",        title:"<spring:message code='global.lbl.certNo' />", hidden:true, attributes:{"class":"al"}}                      // 합격증번호
         ,{field:"grDt",          title:"<spring:message code='global.lbl.grDt' />", hidden:true, attributes:{"class":"al"}, format:"{0:"+vDtyyyyMMdd+"}"}     // 입고일
         ,{field:"dlrCd",         hidden:true}  // 딜러코드
      ]
  });



});
</script>


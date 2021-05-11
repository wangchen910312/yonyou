<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 재고상태관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.stockState' /></h1> <!-- 재고상태관리 -->
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
                    <th scope="row"><spring:message code='global.lbl.cmpCarYn' /></th>       <!-- 회사차여부 -->
                    <td>
                        <input id="sCmpCarYn" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /></th>       <!-- 회사차구분 -->
                    <td>
                        <input id="sCmpCarDstinCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>         <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.strge' /></th>          <!-- 창고 -->
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.location' /></th>       <!-- 위치 -->
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

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_s"><spring:message code='global.btn.save' /></button>       <!-- 저장 -->
            <button id="btnAllChange" class="btn_s"><spring:message code='sal.btn.stockStateAllChange' /></button>       <!-- 일괄변경 -->
        </div>
    </div>
    <div class="table_grid">
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

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var popupWindow;

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.read();
            $('#subGrid').data('kendoExtGrid').dataSource.data([]);
            $("#btnAllChange").data("kendoButton").enable(false);
        }
    });

    $("#btnAllChange").kendoButton({ // 일괄변경
        click:function(e){
            var grid = $("#subGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            popupWindow = dms.window.popup({
                windowId:"stockStateAllChangePopup"
                ,title:"<spring:message code='sal.title.stockStateAllChange' />"   // 일괄변경
                ,width :350
                //,height :
                , modal:true
                ,content:{
                    url:"<c:url value='/sal/inv/stockState/selectStockStateAllChangePopup.do'/>"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        ,"callbackFunc":function(data){

                            if(data.state == "01"){

                                rows.each(function(index, row) {
                                    var uid = row.attributes["data-uid"].nodeValue;
                                    var dataSourceRow = grid.dataSource.getByUid(uid);

                                    dataSourceRow.set("stockTp", dms.string.strNvl(data.stockTp));
                                    dataSourceRow.set("cmpCarYn", dms.string.strNvl(data.cmpCarYn));
                                    dataSourceRow.set("cmpCarDstinCd", dms.string.strNvl(data.cmpCarDstinCd));
                                    dataSourceRow.set("strgeCd", dms.string.strNvl(data.strgeCd));
                                    dataSourceRow.set("locCd", dms.string.strNvl(data.locCd));
                                    dataSourceRow.set("locNm", dms.string.strNvl(data.locNm));
                                    dataSourceRow.set("dirty", true);
                                });

                                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                                $.ajax({
                                    url:"<c:url value='/sal/inv/stockState/multiStockState.do' />"
                                    ,data:JSON.stringify(saveData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                        popupWindow.close();
                                    }
                                    ,success:function(jqXHR, textStatus) {
                                        $("#btnAllChange").data("kendoButton").enable(false);
                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);

                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                        popupWindow.close();
                                    }
                                });
                            }else{
                                popupWindow.close();
                            }

                        }
                    }
                }
            });

        }
    });

    $("#btnAllChange").data("kendoButton").enable(false);


    $("#btnSave").kendoButton({ // 저장
        enable:true,
        click:function(e){
            var grid = $("#subGrid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/inv/stockState/multiStockState.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        $("#btnAllChange").data("kendoButton").enable(false);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }


        }
    });

    // 재고유형
    $("#sStockTpDS").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(stockDSList)
       ,optionLabel:" "           //선택
    });

    // 회사차여부
    $("#sCmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,optionLabel:" "           //선택
    });

    // 회사차구분
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(cmpCarDstinCdDSList)
       ,optionLabel:" "           //선택
    });

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


    var params = {};
    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113904"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/inv/stockState/selectStockState.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        params = {};        // 재 조회시때 초기화
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //재고유형
                        params["sStockTpDS"] = $("#sStockTpDS").data("kendoExtDropDownList").value();
                        //회사차여부
                        params["sCmpCarYn"] = $("#sCmpCarYn").data("kendoExtDropDownList").value();
                        // 회사차구분
                        params["sCmpCarDstinCd"] = $("#sCmpCarDstinCd").data("kendoExtDropDownList").value();
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
                        ,cnt:{type:"number"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:250
       ,editable:false
       ,autoBind:false
       //,pageable:false
       ,navigatable:true
       ,selectable:"row"
       ,columns:[
           {field:"carlineCd",  title:"<spring:message code='global.lbl.carLine' />",     width:70,   attributes:{"class":"ac"}}    // 차종
          ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:80,  attributes:{"class":"al"}}    // 차종명
          ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",       width:120,  attributes:{"class":"ac"}}    // 모델
          ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:140,  attributes:{"class":"al"}}    // 모델명
          ,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",         width:90,  attributes:{"class":"ac"}}    // OCN
          ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:170,  attributes:{"class":"al"}}    // OCN명
          ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",    width:80,  attributes:{"class":"ac"}}    // 외장색
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:100,  attributes:{"class":"al"}}    // 외장색명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",    width:80,  attributes:{"class":"ac"}}    // 내장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:140,  attributes:{"class":"al"}}    // 내장색명
          ,{field:"cnt",       title:"<spring:message code='global.lbl.qty'/>",       width:80, attributes:{"class":"ar"}, format:"{0:n0}"}   //수량
       ]
   });

   // 그리드 더블클릭
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       if(selectedItem != null){
           subParam = {
                   "sCarlineCd":selectedItem.carlineCd
                 , "sModelCd":selectedItem.modelCd
                 , "sOcnCd":selectedItem.ocnCd
                 , "sExtColorCd":selectedItem.extColorCd
                 , "sIntColorCd":selectedItem.intColorCd

                 , "sStockTpDS":params["sStockTpDS"]
                 , "sCmpCarYn":params["sCmpCarYn"]
                 , "sCmpCarDstinCd":params["sCmpCarDstinCd"]
                 , "sVinNo":params["sVinNo"]
                 , "sStrgeCd":params["sStrgeCd"]
                 , "sLocCd":params["sLocCd"]
                 , "salMng":params["salMng"]
            };

           console.log("##", subParam);

           // 위치 초기화
           locDSList = [];
           locCdObj = {};
           $("#btnAllChange").data("kendoButton").enable(false);

           // 상세정보 Grid 조회
           $('#subGrid').data('kendoExtGrid').dataSource.read();
       }
   });

   // 상세 그리드
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-113905"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/inv/stockState/selectStockStateSub.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       subParam["sort"] = options.sort;
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

                       ,stockTp:{type:"string"}                // 재고유형
                       ,cmpCarYn:{type:"string"}               // 회사차여부
                       ,cmpCarDstinCd:{type:"string"}          // 회사차구분
                       ,strgeCd:{type:"string"}                // 창고
                       ,locCd:{type:"string"}                  // 위치
                       ,locNm:{type:"string"}                  // 위치명

                       ,bfStockTp:{type:"string", editable:false}       // 재고유형(변경전)
                       ,bfCmpCarYn:{type:"string", editable:false}      // 회사차여부(변경전)
                       ,bfCmpCarDstinCd:{type:"string", editable:false} // 회사차구분(변경전)
                       ,bfStrgeCd:{type:"string", editable:false}       // 창고(변경전)
                       ,bfLocCd:{type:"string", editable:false}         // 위치(변경전)

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

                       ,mmCnt:{type:"number", editable:false}
                       ,ordDlrYyMmDt  :{type:"string", editable:false}
                       ,manufactYyMmDt:{type:"string", editable:false}
                       ,carVinAllocDt :{type:"date", editable:false}
                       ,pltGiDt       :{type:"date", editable:false}
                       ,retlPrc       :{type:"number", editable:false}
                       ,whslPrc       :{type:"number", editable:false}
                       ,ddctRate      :{type:"number", editable:false}
                       ,lv2DlrStockYn :{type:"string", editable:false}
                       ,contractNo    :{type:"string", editable:false}
                       ,rfidNo        :{type:"string", editable:false}
                   }
               }
           }
       }
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:true    //멀티선택 적용. default:false
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,height:300
      ,autoBind:false
      ,pageable:false
      ,select:function(e){
          console.log(e);

      }
      ,change:function(e) {
          var grid = $("#subGrid").data("kendoExtGrid");
          var rows = grid.select();
          if(rows.length >= 2){
              $("#btnAllChange").data("kendoButton").enable(true);
          }else{
              $("#btnAllChange").data("kendoButton").enable(false);
          }
      }
      ,columns:[
          {field:"vinNo",         title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}       // vin no
         ,{field:"ncarDstinCd", hidden:true}           // 신차량구분코드
         ,{ // 재고유형
             field:"stockTp"
            ,title:"<spring:message code='global.lbl.stockCd' />"
            ,width:90
            ,attributes:{"class":"ac"}
            ,template:"#=dms.string.strNvl(stockTpObj[stockTp])#"
            ,editor:function (container, options){
                $('<input required name="stockTp" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoExtDropDownList({
                    autoBind:false
                    , dataTextField: "cmmCdNm"
                    , dataValueField:"cmmCd"
                    , dataSource:dms.data.cmmCdFilter(stockDSList)
                    , valuePrimitive:true
                });
                $('<span class="k-invalid-msg" data-for="stockTp"></span>').appendTo(container);
             }
         }
         ,{ // 회사차여부
              field:"cmpCarYn"
             ,title:"<spring:message code='global.lbl.cmpCarYn' />"
             ,width:80
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl(ynObj[cmpCarYn])#"
             ,editor:function (container, options){
                 $('<input required name="cmpCarYn" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                       autoBind:false
                     , dataTextField: "cmmCdNm"
                     , dataValueField:"cmmCd"
                     , dataSource:dms.data.cmmCdFilter(ynList)
                 });
                 $('<span class="k-invalid-msg" data-for="cmpCarYn"></span>').appendTo(container);
             }
         }
         ,{    // 회사차구분
              field:"cmpCarDstinCd"
             ,title:"<spring:message code='global.lbl.cmpCarDstinCd' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl(cmpCarDstinCdObj[cmpCarDstinCd])#"
             ,editor:function (container, options){
                 $('<input required name="cmpCarDstinCd" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     autoBind:false
                     , dataTextField: "cmmCdNm"
                     , dataValueField:"cmmCd"
                     , dataSource:dms.data.cmmCdFilter(cmpCarDstinCdDSList)
                 });
                 $('<span class="k-invalid-msg" data-for="cmpCarDstinCd"></span>').appendTo(container);
             }
         }
         ,{ // 창고
              field:"strgeCd"
             ,title:"<spring:message code='global.lbl.strge' />"
             ,width:100
             ,attributes:{"class":"al"}
             ,template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"
             ,editor:function (container, options){
                 $('<input required name="strgeCd" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     autoBind:false
                     , dataTextField: "cmmCdNm"
                     , dataValueField:"cmmCd"
                     , dataSource:storageDSList

                    /*  , select:function(e){
                         var dataItem = this.dataItem(e.item);
                         if(dms.string.strNvl(dataItem.cmmCd) == ""){
                             locDSList = [];
                             locCdObj = {};
                             options.model.locCd = "";
                             options.model.locNm = "";
                             return false;
                         }

                         var responseJson = dms.ajax.getJson({
                             url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
                             ,data:JSON.stringify(dms.string.strNvl(dataItem.cmmCd))
                             ,async:false
                         });

                         //console.log("selectGridCarlineCd", responseJson.data);
                         locDSList = responseJson.data;

                         locCdObj = {};
                         $.each(locDSList, function(idx, obj){
                             locCdObj[obj.locCd] = obj.locNm;
                         });
                     } */

                 });
                 $('<span class="k-invalid-msg" data-for="strgeCd"></span>').appendTo(container);
             }
         }
         ,{ // 위치
              field:"locCd"
             ,title:"<spring:message code='global.lbl.location' />"
             ,width:100
             ,attributes:{"class":"al"}
             ,template:"#= bf_selectLoc(locCd, locNm) #"
             ,editor:function (container, options){

                 if(dms.string.strNvl(options.model.strgeCd) == ""){return false;}

                 if(locDSList == null || locDSList.length == 0){
                     var responseJson = dms.ajax.getJson({
                         url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
                         ,data:JSON.stringify(dms.string.strNvl(options.model.strgeCd))
                         ,async:false
                     });
                     locDSList = responseJson.data;

                     locCdObj = {};
                     $.each(locDSList, function(idx, obj){
                         locCdObj[obj.locCd] = obj.locNm;
                     });
                 }

                 $('<input required name="locCd" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     autoBind:false
                     , dataTextField :"locNm"
                     , dataValueField:"locCd"
                     , dataSource:locDSList
                     ,select:function(e){
                         var dataItem = this.dataItem(e.item);
                         //var grid = $("#subGrid").data("kendoExtGrid");
                         //var selectRow = grid.dataItem(grid.select());
                         //selectRow.locNm = dataItem.locNm;
                         options.model.locNm = dataItem.locNm;
                     }
                 });
                 $('<span class="k-invalid-msg" data-for="locCd"></span>').appendTo(container);

                 locDSList = [];
                 locCdObj = {};
             }
         }
         ,{field:"locNm",           hidden:true}
         ,{field:"bfStockTp",       hidden:true}
         ,{field:"bfCmpCarYn",      hidden:true}
         ,{field:"bfCmpCarDstinCd", hidden:true}
         ,{field:"bfStrgeCd",       hidden:true}
         ,{field:"bfLocCd",         hidden:true}
         ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carLine' />",      width:70,  attributes:{"class":"ac"}}    // 차종
         ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:80, attributes:{"class":"al"}}    // 차종
         ,{field:"modelCd",       title:"<spring:message code='global.lbl.model' />",        width:120, attributes:{"class":"ac"}}    // 모델
         ,{field:"modelNm",       title:"<spring:message code='global.lbl.modelNm' />",      width:140, attributes:{"class":"al"}}    // 모델
         ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocn' />",          width:90, attributes:{"class":"ac"}}    // OCN
         ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:170, attributes:{"class":"al"}}    // OCN
         ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColor' />",     width:80, attributes:{"class":"ac"}}    // 외장색
         ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",   width:100, attributes:{"class":"al"}}    // 외장색명
         ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColor' />",     width:80, attributes:{"class":"ac"}}    // 내장색
         ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",   width:140, attributes:{"class":"al"}}    // 내장색명
         ,{field:"carStatCd",     title:"<spring:message code='global.lbl.vinSts' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(carStatCdObj[carStatCd]) #"}       // 차량상태
         ,{field:"ownStatCd",     title:"<spring:message code='global.lbl.ownStatCd' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(ownStatCdObj[ownStatCd]) #"}    // 보유상태
         ,{field:"ordTp",         title:"<spring:message code='global.lbl.orderType' />", width:200, attributes:{"class":"al"}, template:"#= dms.string.strNvl(ordTpObj[ordTp]) #"}            // 주문유형
         ,{field:"enginModelCd",  title:"<spring:message code='global.lbl.engnNo' />", width:100, attributes:{"class":"al"}}                      // 엔진번호
         ,{field:"certNo",        title:"<spring:message code='global.lbl.certNo' />", width:100, attributes:{"class":"al"}}                      // 합격증번호
         ,{field:"grDt",          title:"<spring:message code='global.lbl.grDt' />", width:100, attributes:{"class":"al"}, format:"{0:"+vDtyyyyMMdd+"}"}     // 입고일
         ,{field:"dlrCd",         hidden:true}  // 딜러코드
         ,{
             field:"mmCnt", title:"<spring:message code='global.lbl.stockMonth' />", attributes:{"class":"ar"  , "style":"background-color:#=mmCntColor#"   }, width:80
             ,format:"{0:n0}"
             //, template:"<div style='width:100%;margin:0;background-color:#=mmCntColor#;'>#= mmCnt #</div>"       // css단 마진처리로 attributes의 background로 변경
         }
         ,{field:"ordDlrYyMmDt", title:"<spring:message code='global.lbl.ordDt' />", attributes:{"class":"ac"}, width:100
             , template:"#= bf_yyyyMMddString(ordDlrYyMmDt,ordMmDt) #"
         }   // 주문일자
         ,{field:"manufactYyMmDt", title:"<spring:message code='global.lbl.creYm' />", attributes:{"class":"ac"}, width:100
             , template:"#= bf_yyyMMString(manufactYyMmDt) #"
         }   // 생산년월
         ,{field:"carVinAllocDt", title:"<spring:message code='global.lbl.assignDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 배정일자
         ,{field:"pltGiDt", title:"<spring:message code='global.lbl.giDocRegDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 출고일자

         ,{field:"retlPrc", title:"<spring:message code='sal.lbl.purcPrc' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 구매가격
         ,{field:"whslPrc", title:"<spring:message code='sal.lbl.guideAmt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 지도가격
         ,{field:"ddctRate", title:"<spring:message code='global.lbl.deductionRate' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 공제비율

         ,{
             field:"lv2DlrStockYn", title:"<spring:message code='sal.lbl.lv2DlrStockYn' />", attributes:{"class":"ar"}, width:90
             , template:"#= dms.string.strNvl(ynObj[lv2DlrStockYn]) #"
         }   // 2급딜러 재고여부
         ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:150}       // 계약번호
         ,{field:"rfidNo", title:"<spring:message code='global.lbl.rfidNo' />", attributes:{"class":"al"}, width:150}               // RFID NO
      ]
  });

});

// 위치 templeate 정의
function bf_selectLoc(locCd, locNm){
    if(locNm != ""){
        return locNm;
    }
    if(locCd == ""){
        return "";
    }
    return dms.string.strNvl(locCdObj[locCd]);
}

// templeate 정의
function bf_yyyMMString(yyyymm){
    var dt = dms.string.strNvl(yyyymm);

    if(dt.length > 4){
        return dt.substring(0,4) + "-" + dt.substring(4,6);
    }else if(dt != ""){
        return dt;
    }else{
        return "";
    }
}

// templeate 정의
function bf_yyyyMMddString(yyyymm, dd){
    var dt1 = dms.string.strNvl(yyyymm);
    var dt2 = dms.string.strNvl(dd);

    if(dt1.length > 4){
        return dt1.substring(0,4) + "-" + dt1.substring(4,6) + dt2 != "" ? "-" + dt2:"";
    }else if(dt1 != ""){
        return dt1 + dt2 != "" ? "-" + dt2:"";
    }else{
        return "" + dt2 != "" ? dt2:"" ;
    }
}


</script>


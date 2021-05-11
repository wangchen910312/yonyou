<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- VehicleSpec-모델 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">OCN信息</h1><!-- VehicleSpec - 모델별OCN Price -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12043" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
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
                        <input id="sModelNm" type="text" class="form_comboBox">
                    </td>
                    <th scope="row">OCN</th><!-- OCN -->
                    <td>
                        <input id="sOcnNm" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
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
                    <th scope="row"><span><spring:message code="global.lbl.modelNm" /></span></th> <!-- 모델명 -->
                    <td>
                        <input name="sModelNmIpt" id="sModelNmIpt" type="text" class="form_input">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>

    <div class="clfix">
        <section class="left_areaStyle" style="width:49%;margin-right:1%;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="sal.title.optionConfHis" /></h2> <!-- 옵션 구성 내역 -->
            </div>
            <div class="table_grid">
                <div id="grid2"></div>
            </div>
        </section>
        <section class="left_areaStyle" style="width:24.5%;">
            <div class="header_area">
                <h2 class="title_basic">外色内容</h2><!-- 외장색 내역 -->
            </div>
            <div class="table_grid">
                <div id="grid3"></div>
            </div>
        </section>
        <section class="right_areaStyle" style="width:24.5%;">
            <div class="header_area">
                <h2 class="title_basic">内色内容</h2><!-- 내장색 내역 -->
            </div>
            <div class="table_grid">
                <div id="grid4"></div>
            </div>
        </section>
    </div>
</section>

<!-- script -->
<script>
/**
 * 차종 콤보
 */
 var carlineList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
  carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

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
    $("#sModelNm").kendoExtDropDownList({
        dataTextField:"modelCdNm"
        ,dataValueField:"modelCd"
        ,select:onSelectModelCd
        ,optionLabel:" "  // 전체
    });
    $("#sModelNm").data("kendoExtDropDownList").enable(false);

     /**
      * OCN 콤보박스
      */
    $("#sOcnNm").kendoExtDropDownList({
        dataTextField:"ocnCdNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "  // 전체
    });
    $("#sOcnNm").data("kendoExtDropDownList").enable(false);

    /**
    * 차종에 따른 모델 조회
    */
    function onSelectCarlineCd(e) {
        $("#sModelNm").data("kendoExtDropDownList").setDataSource([]);
        $("#sModelNm").data("kendoExtDropDownList").enable(true);

        $("#sOcnNm").data("kendoExtDropDownList").setDataSource([]);   // OCN data
        $("#sOcnNm").data("kendoExtDropDownList").enable(false);       // OCN 닫음

        var dataItem = this.dataItem(e.item);
        if(dataItem.carlineCd == ""){
            $("#sModelNm").data("kendoExtDropDownList").enable(false);
            return false;
        }
        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/sal/veh/vehicleSpec/selectVehicleSpecModelList.do"
            ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
            ,async:false
        });

        $("#sModelNm").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };
    /**
    * 모델에 따른 OCN 조회
    */
    function onSelectModelCd(e) {
        $("#sOcnNm").data("kendoExtDropDownList").setDataSource([]);
        $("#sOcnNm").data("kendoExtDropDownList").enable(true);

        var dataItem = this.dataItem(e.item);
        if(dataItem.modelCd == ""){
            $("#sOcnNm").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/sal/veh/modelPackage/selectModelPackageOcn.do"
            ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.modelCd})
            ,async:false
        });

        $("#sOcnNm").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };


    //조회조건 - 적용시작일
    var sStartDtPicker = $("#sStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");


    //조회조건 - 적용종료일
    var sEndDtPicker = $("#sEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sStartDt").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");


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

            $('#grid4').data('kendoExtGrid').dataSource.data([]);
            $('#grid3').data('kendoExtGrid').dataSource.data([]);
            $('#grid2').data('kendoExtGrid').dataSource.data([]);
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // Main그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115911"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelOcnPrice.do' />"
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
                        params["fscCd"] = $("#sModelNm").val();
                        params["ocnCd"] = $("#sOcnNm").val();
                        params["startDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["endDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();
                        params["modelNm"] = $("#sModelNmIpt").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    dms.notification.info("<spring:message code='global.info.searchSuccess' />");
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
                        ,ocnCd     :{type:"string"}
                        ,ocnNm     :{type:"string"}
                        ,startDt   :{type:"date"}
                        ,endDt     :{type:"date"}
                        ,whPrc     :{type:"double"}
                        ,msPrc     :{type:"double"}
                        ,useYn     :{type:"string"}
                        ,regDt     :{type:"date"}
                    }
                }
            }
        }
        ,change:function(e){
            $("#grid2").data("kendoExtGrid").dataSource.read();
            $("#grid3").data("kendoExtGrid").dataSource.read();
            $("#grid4").data("kendoExtGrid").dataSource.read();
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,editable:false
        ,autoBind:false
        ,columns:[
            {field:"carlineCd",  title:"<spring:message code='global.lbl.carLine' />"
                ,width:40, attributes:{"class":"ac"}} //차종
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />"
                ,width:70, attributes:{"class":"al"}} //차종명
            ,{field:"modelCd",   title:"<spring:message code='global.lbl.model' />"
                    , hidden:true  ,width:100,attributes:{"class":"ac"}} //모델
            ,{field:"modelNm",   title:"<spring:message code='sal.lbl.modelCm' />"
                    ,width:120,attributes:{"class":"al"}}
            ,{field:"ocnCd",     title:"<spring:message code='global.lbl.ocnCode' />"
                ,width:60, attributes:{"class":"ac"}} //OCN코드
            ,{field:"ocnNm",     title:"<spring:message code='sal.lbl.ocnDesc' />"
                ,width:130,attributes:{"class":"al"}} //OCN명
            ,{field:"startDt",   title:"<spring:message code='sal.lbl.startDt' />"
                ,width:70, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"} //적용시작일
            ,{field:"endDt",     title:"<spring:message code='sal.lbl.endDt' />"
                ,width:80, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"} //적용종료일
            ,{field:"whPrc",     title:"<spring:message code='global.lbl.wholesalePrice' />"
                ,width:55, attributes:{"class":"ar"}, hidden:true
                ,format:"{0:n2}"} //도매가격
            ,{field:"msPrc",     title:"<spring:message code='global.lbl.retailPrice' />"
                ,width:55, attributes:{"class":"ar"}
                ,format:"{0:n2}"} //소매가격
            ,{field:"useYn",     title:"<spring:message code='global.lbl.useYn' />"
                ,width:55, attributes:{"class":"ac"}} //사용여부
            ,{field:"regDt",     title:"<spring:message code='global.lbl.regDt' />"
                ,width:80, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
        ]
    });


    //옵션 구성내역 Grid
    $("#grid2").kendoExtGrid({
        gridId:"G-SAL-0721-115912"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelOcnOption.do' />",
                }
               ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var grid = $("#grid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var gridData = grid.dataItem(rows[grid.select().index()]);

                        var params = {};
                        params["sort"] = options.sort;

                        params["modelCd"] = gridData.modelCd;
                        params["ocnCd"] = gridData.ocnCd;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
           ,error:function(e){

            }
           ,schema:{
                data:"data"
               ,model:{
                    id:"modelCd"
                   ,fields:{
                        carlineCd:{type:"string",  editable:false}
                       ,modelCd:{type:"string",  editable:false}
                       ,modelNm:{type:"string",  editable:false}
                       ,ocnCd:{type:"string",  editable:false}
                       ,optionCd:{type:"string",  editable:false}
                       ,optionNm:{type:"string",  editable:false}
                       //,startDt:{type:"date",  editable:false}
                       //,endDt:{type:"date",  editable:false}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:150
       ,autoBind:false
       ,scrollable:true
       ,pageable:false
       ,columns:[
            {
                title:"<spring:message code='global.lbl.carLine' />" //차종
               ,field:"carlineCd"
               ,sortable:false
               ,width:70
               ,attributes:{ "style":"text-align:center"}
            }
           ,{   field:"modelNm"
               ,title:"<spring:message code='global.lbl.modelNm' />"
               ,width:150
               ,attributes:{"class":"al"}} //모델명
           ,{
                title:"<spring:message code='global.lbl.ocn' />" //OCN
               ,field:"ocnCd"
               ,sortable:false
               ,width:100
               ,attributes:{ "style":"text-align:center"}
            }
           ,{
                title:"<spring:message code='global.lbl.optionCode' />" //옵션코드
               ,field:"optionCd"
               ,width:100
               ,attributes:{ "style":"text-align:center"}
            }
           ,{
                title:"<spring:message code='global.lbl.optionNm' />" //옵션명
               ,field:"optionNm"
               ,width:130
               ,attributes:{ "style":"text-align:left"}
            }
        ]
    });

    //외장색 내역 Grid
    $("#grid3").kendoExtGrid({
        gridId:"G-SAL-0722-134100"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelOcnExtColor.do' />",
                }
               ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var grid = $("#grid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var gridData = grid.dataItem(rows[grid.select().index()]);

                        var params = {};
                        params["sort"] = options.sort;

                        params["modelCd"] = gridData.modelCd;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
           ,error:function(e){

            }
           ,schema:{
                data:"data"
               ,model:{
                    id:"extColorCd"
                   ,fields:{
                        modelCd:{type:"string"}
                       ,modelNm:{type:"string"}
                       ,extColorCd:{type:"string"}
                       ,extColorNm:{type:"string"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:150
       ,autoBind:false
       ,scrollable:true
       ,pageable:false
       ,editable   :false
       ,columns:[
            {field:"modelCd", title:"<spring:message code='global.lbl.model' />", width:60, hidden:true, attributes:{"class":"ac"}}
           ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:130, attributes:{"class":"al"}} //모델명
           ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />", width:100, hidden:true, attributes:{"class":"ac"}}
           ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:130, attributes:{"class":"al"}}  //외장색
        ]
    });

    //내장색 내역 Grid
    $("#grid4").kendoExtGrid({
        gridId:"G-SAL-0722-134110"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelOcnIntColor.do' />",
                }
               ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var grid = $("#grid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var gridData = grid.dataItem(rows[grid.select().index()]);

                        var params = {};
                        params["sort"] = options.sort;

                        params["modelCd"] = gridData.modelCd;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
           ,error:function(e){

            }
           ,schema:{
                data:"data"
               ,model:{
                    id:"intColorCd"
                   ,fields:{
                       modelCd:{type:"string"}
                       ,modelNm:{type:"string"}
                       ,intColorCd:{type:"string"}
                       ,intColorNm:{type:"string"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:150
       ,autoBind:false
       ,scrollable:true
       ,editable   :false
       ,pageable:false
       ,columns:[
           {field:"modelCd", title:"<spring:message code='global.lbl.model' />", width:60, hidden:true, attributes:{"class":"ac"}}
          ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:130, attributes:{"class":"al"}} //모델명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />", width:100, hidden:true, attributes:{"class":"ac"}}  //내장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:130, attributes:{"class":"ac"}}  //내장색
        ]
    });
});
</script>
<!-- //script -->
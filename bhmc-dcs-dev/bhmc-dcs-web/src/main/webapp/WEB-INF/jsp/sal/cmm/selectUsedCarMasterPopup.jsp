<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<!-- 차량마스터관리 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                    <td>
                        <input id="sCarStatCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.corpCarDstin' /></th>         <!-- 자사차여부 -->
                    <td>
                        <input id="sCorpCarDstinCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr class="corpCar_01">
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox"  />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.ocn" /></th>   <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr class="corpCar_01">
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row">
                    <td></td>
                </tr>
                <tr class="corpCar_02">
                    <th scope="row"><spring:message code='global.lbl.brand' /></th><!-- 브랜드 -->
                    <td>
                        <input id="sCarBrandCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNm' /></th><!-- 차량명 -->
                    <td>
                        <input id="sCarNm" type="text" class="form_input" />
                    </td>
                    <th scope="row">
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
    <!-- 그리드 종료 -->
</section>
<!-- //차량마스터관리 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var dlrCd     = "${dlrCd}";     // 딜러코드

//차량상태 SAL157
var carStatDs = [];
var carStatObj = {};
<c:forEach var="obj" items="${carStatList}">
    carStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//자사차여부:SAL118
var corpCarDstinCdList = [];
var corpCarDstinObj = {};
<c:forEach var="obj" items="${corpCarDstinCdDS}">
    corpCarDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    corpCarDstinObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//브랜드 COM019
var carBrandList = [];
var carBrandObj = {};
<c:forEach var="obj" items="${carBrandDS}">
    carBrandList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carBrandObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

$(document).ready(function() {

    $(".corpCar_01").hide();        // 임시 TOBE 변경
    $(".corpCar_02").hide();        // 임시 TOBE 변경

    //차량상태
    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatDs
        ,optionLabel:" "
    });

    // 자사차여부
    $("#sCorpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:corpCarDstinCdList
       //,select:function(e){
       //    var dataItem = this.dataItem(e.item);
       //    corpBrand = dataItem.cmmCd;
       //}
       ,optionLabel:" "
    });

    //브랜드
    $("#sCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carBrandList
        ,optionLabel:" "
    });



/*************************** 검색 조건 영역 END **************************************************/


    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            var corp = $("#sCorpCarDstinCd").data("kendoExtDropDownList").value();
            var grid = $('#grid').data('kendoExtGrid');

            // 01:자사 , 02:타사
            var corpDS = [ {corp:"01", value:"carlineNm"}
                            , {corp:"01", value:"modelNm"}
                            , {corp:"01", value:"ocnNm"}
                            , {corp:"01", value:"extColorNm"}
                            , {corp:"01", value:"intColorNm"}
                            , {corp:"02", value:"carBrandCd"}
                            , {corp:"02", value:"carNm"}
                         ];

            if(corp != ""){
                $.each(corpDS, function(index, row){
                    if(corp == row.corp){
                        grid.showColumn(row.value);
                    }else{
                        grid.hideColumn(row.value);
                    }
                });
            }else{
                $.each(corpDS, function(index, row){
                    grid.showColumn(row.value);
                });
            }


            grid.dataSource.page(1);
        }
    });


    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            } else {
                dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cmm/selectUsedCarMasterPopupSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sVinNo"] = $("#sVinNo").val();                                                 // 빈넘버
                        params["sCarStatCd"] = $("#sCarStatCd").data("kendoExtDropDownList").value();             // 차량상태
                        params["sCorpCarDstinCd"] = $("#sCorpCarDstinCd").data("kendoExtDropDownList").value();   // 자사차여부

                        /*
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종
                        params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();            // 모델
                        params["sOcnCd"]     = $("#sOcnCd").data("kendoExtDropDownList").value();              // OCN
                        params["sExtColorCd"]= $("#sExtColorCd").data("kendoExtDropDownList").value();         // 외장색
                        params["sIntColorCd"]= $("#sIntColorCd").data("kendoExtDropDownList").value();         // 내장색

                        params["sCarBrandCd"]= $("#sCarBrandCd").data("kendoExtDropDownList").value();         // 브랜드
                        params["sCarNm"]= $("#sCarNm").val();                                               // 차량명
                        */

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
                    id:"carId"
                    ,fields:{
                        carId          :{type:"string"}
                        ,vinNo         :{type:"string"}
                        ,carStatCd     :{type:"string"}
                        ,corpCarDstinCd:{type:"string"}       //자사차량여부
                        ,carBrandCd    :{type:"string"}       //차량브랜드코드
                        ,carNm         :{type:"string"}
                        ,carlineCd     :{type:"string"}
                        ,carlineNm     :{type:"string"}
                        ,modelCd       :{type:"string"}
                        ,modelNm       :{type:"string"}
                        ,ocnCd         :{type:"string"}
                        ,ocnNm         :{type:"string"}
                        ,extColorCd    :{type:"string"}
                        ,extColorNm    :{type:"string"}
                        ,intColorCd    :{type:"string"}
                        ,intColorNm    :{type:"string"}
                        ,strgeCd       :{type:"string"}
                        ,locCd         :{type:"string"}
                        ,locNm         :{type:"string"}
                        ,manufactYyMmDt:{type:"date"}       //제작년월
                        ,carDispQty    :{type:"number"}       //배기량
                        ,carRunDistVal :{type:"number"}       //주행거리
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,selectable:"row"
        ,height  :236
        ,columns:[
             {field:"carId", hidden:true}
            ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:150, attributes:{"class":"ac"}} //Vin NO
            ,{
                field:"carStatCd", title:"<spring:message code='global.lbl.vinSts' />", width:100, attributes:{"class":"ac"}
                , template:"#=dms.string.strNvl(carStatObj[carStatCd])#"
            }   // 차량상태
            ,{
                field:"corpCarDstinCd", title:"<spring:message code='sal.lbl.corpCarYn' />", width:100, attributes:{"class":"ac"}
                , template:"#=dms.string.strNvl(corpCarDstinObj[corpCarDstinCd])#"
            }   // 자사차량여부
            ,{field:"carBrandCd", title:"<spring:message code='sal.lbl.carBrand' />", width:100, attributes:{"class":"ac"}}      // 차량브랜드
            ,{field:"carNm", title:"<spring:message code='global.lbl.carNm' />", width:180, attributes:{"class":"ac"}}           // 차량명
            ,{field:"carlineCd",  hidden:true}    // 차종
            ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:80,  attributes:{"class":"al"}}     // 차종명
            ,{field:"modelCd",    hidden:true}    // 모델
            ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:150,  attributes:{"class":"al"}}    // 모델명
            ,{field:"ocnCd",      hidden:true}     // OCN
            ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:170,  attributes:{"class":"al"}}    // OCN명
            ,{field:"extColorCd", hidden:true}     // 외장색
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:100,  attributes:{"class":"al"}}    // 외장색명
            ,{field:"intColorCd", hidden:true}     // 내장색
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:140,  attributes:{"class":"al"}}    // 내장색명
            ,{
                field:"strgeCd", title:"<spring:message code='sal.lbl.strgeCd' />", width:100, attributes:{"class":"ac"}
                ,template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"
            }   // 창고
            ,{field:"locCd", hidden:true}
            ,{field:"locNm", title:"<spring:message code='global.lbl.location' />", width:100, attributes:{"class":"ac"}}      // 위치
            ,{field:"manufactYyMmDt", title:"<spring:message code='sal.lbl.manufactYyMmDt' />", width:100, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}     //제작년월
            ,{field:"carDispQty", title:"<spring:message code='global.lbl.carDispQty' />", width:100, attributes:{"class":"ac"}, format:"{0:n0}"}           // 배기량
            ,{field:"carRunDistVal", title:"<spring:message code='global.lbl.runDist' />", width:100, attributes:{"class":"ac"}, format:"{0:n0}"}           // 주행거리

        ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});
</script>
<!-- //script -->
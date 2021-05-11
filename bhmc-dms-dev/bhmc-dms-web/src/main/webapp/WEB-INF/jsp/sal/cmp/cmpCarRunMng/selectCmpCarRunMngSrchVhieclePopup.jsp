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
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox">
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.ocn" /></th>   <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                    <td>
                        <input id="sCarStatCd" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /></th><!-- 회사차구분 -->
                    <td>
                        <input id="sCpnCarTp" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" maxlength="17" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input" />
                    </td>
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

<script>

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//차량상태 SAL001
var carStatDs = [];
var carStatObj = {};
<c:forEach var="obj" items="${carStatList}">
    <c:if test="${obj.cmmCd eq '50' || obj.cmmCd eq '60' || obj.cmmCd eq '70'}">
        carStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    carStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//회사차구분 Array
var cmpCarDstinCd = [];
<c:forEach var="obj" items="${cmpCarDstinCdList}">
    cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

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
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

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
        ,select:function(e){
            if(this.dataItem(e.item).modelCnt > 1){

                dms.notification.info("<spring:message code='sal.info.modelOcnDupWrrMsg'/>");

                return false;
            }

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

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
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColorCombo.do' />"
                ,data:JSON.stringify({"sModelCd":$("#hiddenFscCode").val()})
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

    //차량상태
    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatDs
        ,optionLabel:" "  // 전체
    });

    //조회조건 - 회사차유형
    $("#sCpnCarTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd,
        optionLabel:" "                        // 전체
    });

    $("#sVinNo").bind("keyup", function() {
        $(this).val($(this).val().toUpperCase());
    });

/*************************** 검색 조건 영역 END **************************************************/

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;
    var data = options.dataInfo;

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
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

                    if(grid.dataItem(row).cpnCarTp == "99"){
                        data.push(grid.dataItem(row));

                        options.callbackFunc(data);
                        parent.popupWindow.close();

                    }else{
                        dms.notification.error("<spring:message code='sal.err.alreadyCpnVehicle'/>");

                        return;
                    }
                });
            } else {
                dms.notification.info("<spring:message code='global.lbl.car' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
    	gridId:"G-SAL-1020-024402"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/selectVehicleMasterPopupSrch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();                                              // 빈넘버
                        params["sCarStatCd"] = $("#sCarStatCd").data("kendoExtDropDownList").value();          // 차량상태
                        params["sCpnCarTp"]= $("#sCpnCarTp").data("kendoExtDropDownList").value();         // 회사차유형
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델
                        params["sOcnCd"]     = $("#sOcnCd").data("kendoExtDropDownList").value();              // OCN
                        params["sExtColorCd"]= $("#sExtColorCd").data("kendoExtDropDownList").value();         // 외장색
                        params["sIntColorCd"]= $("#sIntColorCd").data("kendoExtDropDownList").value();         // 내장색
                        params["sCarRegNo"]  = $("#sCarRegNo").val();                                       // 차량번호


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo        :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carStatCd    :{type:"string"}
                        ,carlineCd    :{type:"string"}
                        ,carlineNm    :{type:"string"}
                        ,modelCd      :{type:"string"}
                        ,modelNm      :{type:"string"}
                        ,ocnCd        :{type:"string"}
                        ,ocnNm        :{type:"string"}
                        ,extColorCd   :{type:"string"}
                        ,extColorNm   :{type:"string"}
                        ,intColorCd   :{type:"string"}
                        ,intColorNm   :{type:"string"}
                        ,carRegNo     :{type:"string"}
                        ,ordTp        :{type:"string"}
                        ,enginSerialNo:{type:"string"}
                        ,cpnCarTp     :{type:"string"}
                        ,cpnCarTpNm   :{type:"string"}
                    }
                }
            }
        }
        ,change:function(e) {
            var that = this;
            var rows = this.select();

            if(e.sender.dataItem(e.sender.select()) != null ){
                var selectItem = that.dataItem(rows);
                if(dms.string.trim(selectItem.cpnCarTp) != "99"){
                    this.clearSelection();
                    return;
                }
            }
         }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);
                if(dms.string.trim(dataItem.cpnCarTp) != "99") {
                    $(row).css("background-color", "#E0E0E0");
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }
            });
        }
    	,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
    	,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
    	,enableTooltip:true               //Tooltip 적용, default:false
        ,editable:false
        ,height:370
        ,selectable:"row"
        ,columns:[
             {field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:150, attributes:{"class":"ac"}} //Vin NO
            ,{field:"ncarDstinCd", hidden:true}
            ,{field:"dlrCd", hidden:true}
            ,{field:"carStatCd",  title:"<spring:message code='global.lbl.vinSts' />",      width:100, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(carStatObj[carStatCd]) #"}         //차량상태
            ,{field:"cpnCarTpNm",  title:"<spring:message code='global.lbl.cmpCarDstinCd' />",  width:90,   attributes:{"class":"al"}}    // 회사차유형
            ,{field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",   width:70,   attributes:{"class":"ac"}}    // 차종
            ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:80,  attributes:{"class":"al"}}     // 차종명
            ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",       width:120,  attributes:{"class":"ac"}}    // 모델
            ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:150,  attributes:{"class":"al"}}    // 모델명
            ,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",         width:90,  attributes:{"class":"ac"}}     // OCN
            ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:170,  attributes:{"class":"al"}}    // OCN명
            ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",    width:80,  attributes:{"class":"ac"}}     // 외장색
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:100,  attributes:{"class":"al"}}    // 외장색명
            ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",    width:80,  attributes:{"class":"ac"}}     // 내장색
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:140,  attributes:{"class":"al"}}    // 내장색명
            ,{field:"carRegNo",title:"<spring:message code='global.lbl.carNo' />",  width:100, attributes:{"class":"ac"}}     // 차량번호
        ]
    });

    if (options.autoBind) {
        $("#btnSearch").click();
    }

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});


</script>
<!-- //script -->

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
                        <input id="sVinNo" type="text" class="form_input" maxlength="17" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                    <td>
                        <input id="sCarStatCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ownStatCd' /></th><!-- 보유상태 -->
                    <td>
                        <input id="sOwnStatCd" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
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
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.cmpCarDstin' /></th><!-- 회사차구분 -->
                    <td>
                        <input id="sCmpCarYn" type="hidden" class="form_input" />
                        <input id="sCmpCarDstinCd" type="text" class="form_comboBox"  />
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

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//차관
var fscCdDSList = [];
var fscCdObj = {};
var modelCdDSList = [];
var modelCd;

//ocn
var ocnCdDSList = [];
var ocnCdObj = {};
//외장
var extColorCdDSList = [];
var extColorCdObj = {};

//차량상태 SAL001
var carStatDs = [];
var carStatObj = {};
<c:forEach var="obj" items="${carStatList}">
    carStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차량보유상태 SAL149
var ownStatDs = [];
var ownStatObj = {};
<c:forEach var="obj" items="${ownStatList}">
    ownStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ownStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//재고유형 SAL074
var stockDSList = [];
var stockTpObj = {};
<c:forEach var="obj" items="${stockTpDS}">
    stockDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    stockTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
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


//회사차구분 Array
var cmpCarDstinCd = [];
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
    cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    //조회조건 - 회사차구분
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd
        ,optionLabel:" "  // 전체
    });


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
           modelCd = "";
           //$("#sModelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
           var params = {"sCarlineCd":dataItem.carlineCd};
           carlineDataSet(params);
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

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var params = {"carlineCd":$("#sCarlineCd").val(), "fscCd":dataItem.fscCd}
           fscCdDataSet(params);
       },enable:false
    });

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

            var params = {"modelCd":this.dataItem(e.item).modelCd, "ocnCd":this.dataItem(e.item).ocnCd};
            modelCd = this.dataItem(e.item).modelCd;
            ocnCdDataSet(params);

        },enable:false
    });

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
           // $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#sModelCd").data("kendoExtDropDownList").value()));
            var params = {"modelCd": modelCd, "ocnCd": $("#sOcnCd").data("kendoExtDropDownList").value(), "extColorCd": this.dataItem(e.item).extColorCd };
            extColorCdDataSet(params);
        }
       ,enable:false
    });

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
        ,enable:false
    });

  //모델코드 조회
    function carlineDataSet(params){

        $.ajax({
            url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            async:false,
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus){
                if(result.data.length > 0 ){
                   // setFieldClear("01");
                    fscCdDSList = [];
                    fscCdObj = {};
                    $.each(result.data , function(index , obj){
                        fscCdDSList.push({fscNm:obj.fscNm, fscCd:obj.fscCd})
                        fscCdObj[obj.fscCd] = obj.fscNm;
                    })
                }
                $("#sModelCd").data("kendoExtDropDownList").setDataSource(fscCdDSList);
            }
        });
    }

    //차관 코드 조회
    function fscCdDataSet(params) {

        $.ajax({
            url:"<c:url value='/sal/orm/btoCreateOrder/selectStrN1BlockOcn.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            async:false,
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus){
                if(result.data.length > 0 ){
                    ocnCdDSList = [];
                    ocnCdObj = {};
                    //setFieldClear("02");
                    modelCdDSList = [];
                    $.each(result.data , function(index , obj){
                        ocnCdDSList.push({ocnNm:obj.ocnNm, ocnCd:obj.ocnCd , modelCd:obj.modelCd, modelCnt:obj.modelCnt})
                        modelCdDSList.push({ modelNm:obj.modelCd, modelCd:obj.modelCd })
                        ocnCdObj[obj.ocnCd] = obj.ocnNm;
                    });

                    $("#sOcnCd").data("kendoExtDropDownList").setDataSource(ocnCdDSList);
                }
            }
        });
    };


    //OCN 조회
    function ocnCdDataSet(params) {

        $.ajax({
            url:"<c:url value='/sal/svo/askHelpCar/selectExtColor.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            async:false,
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus){
                if(result.total > 0 ){
                    extColorCdDSList = [];
                    extColorCdObj = {};
                    //setFieldClear("03");

                    $.each(result.data , function(index , obj){
                        extColorCdDSList.push({extColorNm : obj.extColorNm, extColorCd : obj.extColorCd })
                        extColorCdObj[obj.extColorCd] = obj.extColorNm;
                    });
                    $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(extColorCdDSList);
                }
            }
        });

    };

    //외장색 조회
    function extColorCdDataSet(params) {

        $.ajax({
            url:"<c:url value='/sal/svo/askHelpCar/selectIntColor.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            async:false,
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus){
                if(result.total > 0 ){
                    intColorCdDSList = [];
                    intColorCdObj = {};
                    //setFieldClear("04");
                    $.each(result.data , function(index , obj){
                        intColorCdDSList.push({intColorCd : obj.intColorCd, intColorNm : obj.intColorNm })
                        intColorCdObj[obj.intColorCd] = obj.intColorNm;
                    });
                    $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(intColorCdDSList);
                }
            }
        });
    };
    //차량보유상태
    $("#sOwnStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ownStatDs
        ,optionLabel:" "  // 전체
    });

    //차량상태
    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatDs
        ,optionLabel:" "  // 전체
    });

    $("#sVinNo").bind("keyup", function() {
        $(this).val($(this).val().toUpperCase());
    });


/*************************** 검색 조건 영역 END **************************************************/


    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;
    var data = options.dataInfo;


    var pageGubun;
    if(options.cmpCarYn != "" && options.cmpCarYn != null){
        $("#sCmpCarYn").val(options.cmpCarYn);
    }

    if(data != undefined){
        pageGubun = dms.string.strNvl(data.pageGubun);

        var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList");
        if(data.carlineCd != null &&  data.carlineCd != ""){
            sCarlineCd.value(data.carlineCd); // 차종
        }

        var sModelCd = $("#sModelCd").data("kendoExtDropDownList");
        if(data.modelCd != null &&  data.modelCd != ""){

            var modelDS = setModelDataSource(data.carlineCd);
            if(modelDS != null){
                sModelCd.setDataSource( modelDS );
                sModelCd.enable(true);
            }else{
                modelCd.setDataSource([]);
                sModelCd.enable(false);
            }
            sModelCd.value(data.modelCd); // 모델

        }else {
            $("#sModelCd").data("kendoExtDropDownList").value("");
        }

        var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList");
        if(data.ocnCd != null &&  data.ocnCd != ""){

            var ocnDS = setOcnDataSource(data.carlineCd, data.modelCd);
            if(ocnDS != null){
                sOcnCd.setDataSource(ocnDS);
                sOcnCd.enable(true);
            }else{
                sOcnCd.setDataSource([]);
                sOcnCd.enable(false);
            }
            sOcnCd.value(data.ocnCd); // OCN
        }else {
            $("#sOcnCd").data("kendoExtDropDownList").value("");
        }

        var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList");
        if(data.extColorCd != null &&  data.extColorCd != ""){

            var extColorDS = setExtColorDataSource(data.modelCd);
            if(extColorDS != null){
                sExtColorCd.setDataSource(extColorDS);
                sExtColorCd.enable(true);
            }else{
                sExtColorCd.setDataSource([]);
                sExtColorCd.enable(false);
            }
            sExtColorCd.value(data.extColorCd);
        }else {
            $("#sExtColorCd").data("kendoExtDropDownList").value("");
        }

        var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList");
        if(data.intColorCd != null &&  data.intColorCd != ""){
            var intColorDS = setIntColorDataSource(data.modelCd);
            if(intColorDS != null){
                sIntColorCd.setDataSource(intColorDS);
                sIntColorCd.enable(true);
            }else{
                sIntColorCd.setDataSource([]);
                sIntColorCd.enable(false);
            }
            sIntColorCd.value(data.intColorCd);
        }else {
            $("#sIntColorCd").data("kendoExtDropDownList").value("");
        }

        //모델,ocn,외장색,내장색 다시 disabled 해준다.
        //sCarlineCd.enable(dms.string.isNotEmpty(data.carlineCd)?true:false);
        sCarlineCd.enable(true);
        sModelCd.enable(dms.string.isNotEmpty(data.modelCd)?true:false);
        sOcnCd.enable(dms.string.isNotEmpty(data.ocnCd)?true:false);
        sExtColorCd.enable(dms.string.isNotEmpty(data.extColorCd)?true:false);
        sIntColorCd.enable(dms.string.isNotEmpty(data.intColorCd)?true:false);

        if(data.ownStatCd != null && data.ownStatCd != ""){
            $("#sOwnStatCd").data("kendoExtDropDownList").value(data.ownStatCd);
            $("#sOwnStatCd").data("kendoExtDropDownList").enable(false);
        }
        if(data.carStatCd != null && data.carStatCd != ""){
            $("#sCarStatCd").data("kendoExtDropDownList").value(data.carStatCd);
            $("#sCarStatCd").data("kendoExtDropDownList").enable(false);
        }

        if(data.vinNo != null && data.vinNo != ""){
            $("#sVinNo").val(data.vinNo);
        }

    }else {
        $("#sVinNo").val("");
        $("#sCarlineCd").data("kendoExtDropDownList").value("");
        $("#sModelCd").data("kendoExtDropDownList").value("");
        $("#sOcnCd").data("kendoExtDropDownList").value("");
        $("#sExtColorCd").data("kendoExtDropDownList").value("");
        $("#sIntColorCd").data("kendoExtDropDownList").value("");
    }

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
                    data.push(grid.dataItem(row));
                })
                options.callbackFunc(data);
                parent.popupWindow.close();
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
                    url:"<c:url value='/sal/cmm/selectVehicleMasterSts.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;                                                           // 딜러
                        params["sVinNo"] = $("#sVinNo").val();                                              // 빈넘버
                        params["sCarStatCd"] = $("#sCarStatCd").data("kendoExtDropDownList").value();          // 차량상태
                        params["sOwnStatCd"] = $("#sOwnStatCd").data("kendoExtDropDownList").value();          // 보유상태
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종
                        params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();            // 모델
                        params["sOcnCd"]     = $("#sOcnCd").data("kendoExtDropDownList").value();              // OCN
                        params["sExtColorCd"]= $("#sExtColorCd").data("kendoExtDropDownList").value();         // 외장색
                        params["sIntColorCd"]= $("#sIntColorCd").data("kendoExtDropDownList").value();         // 내장색
                        params["sCarRegNo"]  = $("#sCarRegNo").val();                                       // 차량번호
                        params["sCmpCarYn"]  = $("#sCmpCarYn").val();           							// 회사차여부
                        params["sCmpCarDstinCd"]= $("#sCmpCarDstinCd").data("kendoExtDropDownList").value();   // 회사차구분
                        params["sPageGubun"]= pageGubun;                                                    // 페이지구분


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
/*                 if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                } */
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo        :{type:"string"}
                        ,ncarDstinCd  :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carStatCd    :{type:"string"}
                        ,ownStatCd    :{type:"string"}
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
                        ,stockTp      :{type:"string"}
                        ,strgeCd      :{type:"string"}
                        ,locCd        :{type:"string"}
                        ,cmpCarYn     :{type:"string"}
                        ,cmpCarDstinCd:{type:"string"}
                        ,carRegNo     :{type:"string"}
                        ,ordTp        :{type:"string"}
                        ,enginSerialNo:{type:"string"}
                    }
                }
            }
        }
	    ,dataBound:function(e) {
	        /*
	        var grid          = $("#grid").data("kendoExtGrid");
	        var gridDataSource = grid.dataSource;

	        if (gridDataSource._data.length == 1) {
	            selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
	            grid.select(selectRow);
	            $("#btnSelect").click();
	        }
	        */
	    }
    	,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
    	,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
    	,enableTooltip:true               //Tooltip 적용, default:false
        ,editable:false
        ,height:321
        ,columns:[
             {field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:150, attributes:{"class":"ac"}} //Vin NO
            ,{field:"ncarDstinCd", hidden:true}
            ,{field:"dlrCd", hidden:true}
            ,{field:"carStatCd",  title:"<spring:message code='global.lbl.vinSts' />",      width:100, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(carStatObj[carStatCd]) #"}         //차량상태
            ,{field:"ownStatCd",  title:"<spring:message code='global.lbl.ownStatCd' />",   width:100, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(ownStatObj[ownStatCd]) #"}         //보유상태
            ,{field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",     width:70,   attributes:{"class":"ac"}}    // 차종
            ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:80,  attributes:{"class":"al"}}     // 차종명
            ,{field:"fscCd",    title:"<spring:message code='global.lbl.model' />",       width:120,  attributes:{"class":"ac"}}    // 모델
            ,{field:"fscNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:150,  attributes:{"class":"al"}}    // 모델명
            ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",       width:120,  attributes:{"class":"ac"},hidden:true}    // 모델
            ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:150,  attributes:{"class":"al"},hidden:true}    // 모델명
            ,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",         width:90,  attributes:{"class":"ac"}}     // OCN
            ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:170,  attributes:{"class":"al"}}    // OCN명
            ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",    width:80,  attributes:{"class":"ac"}}     // 외장색
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:100,  attributes:{"class":"al"}}    // 외장색명
            ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",    width:80,  attributes:{"class":"ac"}}     // 내장색
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:140,  attributes:{"class":"al"}}    // 내장색명
            ,{field:"stockTp",    title:"<spring:message code='global.lbl.stockCd' />",     width:100, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(stockTpObj[stockTp])#"}     //재고유형
            ,{field:"strgeCd",    title:"<spring:message code='global.lbl.strge' />",       width:100, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"}     //창고
            ,{field:"locCd",      title:"<spring:message code='global.lbl.location' />",    width:100, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(locCdObj[locCd]) #"}       //위치
            ,{field:"cmpCarYn",   title:"<spring:message code='sal.lbl.cmpCarYn' />",       width:100, attributes:{"class":"ac"}}     // 회사차여부
            ,{field:"cmpCarDstinCd",title:"<spring:message code='sal.lbl.cmpCarDstin' />",  width:100, attributes:{"class":"ac"}      // 회사차구분
              ,template:"# if(cmpCarDstinCdMap[cmpCarDstinCd] != null) { # #= cmpCarDstinCdMap[cmpCarDstinCd].cmmCdNm# # }#"
             }
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

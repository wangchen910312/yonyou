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
                    <th scope="row"><spring:message code='sal.lbl.cmpCarYn' /></th><!-- 회사차여부 -->
                    <td>
                        <input id="sCmpCarYn" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.cmpCarDstin' /></th><!-- 회사차구분 -->
                    <td>
                        <input id="sCmpCarDstinCd" type="text" class="form_comboBox" disabled />
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

    //조회조건 - 회사차여부
    $("#sCmpCarYn").kendoExtDropDownList({
        dataTextField:"codeNm",
        dataValueField:"codeCd",
        dataSource:[{"codeCd":"Y","codeNm":"Y"}
                    ,{"codeCd":"N","codeNm":"N"}
                    ]
        ,optionLabel:" "  // 전체
        ,change:function(e) {
             var dataItem = this.dataSource.data();
             var selectIndex = this.select();
             if(selectIndex == 0){
                 $("#sCmpCarDstinCd").data("kendoExtDropDownList").value("");
                 $("#sCmpCarDstinCd").data("kendoExtDropDownList").enable(false);
             }else if(selectIndex == 1 || selectIndex == 2){
                 var codeCd = dataItem[selectIndex-1].codeCd;
                 if(codeCd == 'Y'){
                     $("#sCmpCarDstinCd").data("kendoExtDropDownList").enable(true);
                 }else {
                     $("#sCmpCarDstinCd").data("kendoExtDropDownList").value("");
                     $("#sCmpCarDstinCd").data("kendoExtDropDownList").enable(false);
                 }
             }
        }
    });


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

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
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
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
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
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
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
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
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

/*************************** 검색 조건 영역 END **************************************************/


    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;
    var data = options.dataInfo;


    var pageGubun;
    if(options.cmpCarYn != "" && options.cmpCarYn != null){

        $("#sCmpCarYn").data("kendoExtDropDownList").value(options.cmpCarYn);
        $("#sCmpCarYn").data("kendoExtDropDownList").enable(false);

    }

    if(data != undefined){
        pageGubun = data.pageGubun;

        var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList");
        if(data.carlineCd != null &&  data.carlineCd != ""){
            sCarlineCd.value(data.carlineCd); // 차종
        }

        var sModelCd = $("#sModelCd").data("kendoExtDropDownList");
        if(data.modelCd != null &&  data.modelCd != ""){
            sModelCd.setDataSource([{modelNm:data.modelNm, modelCd:data.modelCd}]);
            sModelCd.enable(true);
            sModelCd.value(data.modelCd); // 모델
        }else {
            $("#sModelCd").data("kendoExtDropDownList").value("");
        }

        var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList");
        if(data.ocnCd != null &&  data.ocnCd != ""){
            sOcnCd.setDataSource([{ocnNm:data.ocnNm, ocnCd:data.ocnCd}]);
            sOcnCd.enable(true);
            sOcnCd.value(data.ocnCd); // OCN
        }else {
            $("#sOcnCd").data("kendoExtDropDownList").value("");
        }

        var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList");
        if(data.extColorCd != null &&  data.extColorCd != ""){
            sExtColorCd.setDataSource([{extColorNm:data.extColorNm, extColorCd:data.extColorCd}]);
            sExtColorCd.enable(true);
            sExtColorCd.value(data.extColorCd); // 외장색
        }else {
            $("#sExtColorCd").data("kendoExtDropDownList").value("");
        }

        var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList");
        if(data.intColorCd != null &&  data.intColorCd != ""){
            sIntColorCd.setDataSource([{intColorNm:data.intColorNm, intColorCd:data.intColorCd}]);
            sIntColorCd.enable(true);
            sIntColorCd.value(data.intColorCd); // 내장색
        }else {
            $("#sIntColorCd").data("kendoExtDropDownList").value("");
        }


        //모델,ocn,외장색,내장색 다시 disabled 해준다.
        if(data.carlineCd != null && data.carlineCd != ""){ sCarlineCd.enable(false); }
        if(data.modelCd != null && data.modelCd != ""){ sModelCd.enable(false); }
        if(data.ocnCd != null && data.ocnCd != ""){sOcnCd.enable(false);}
        if(data.extColorCd != null && data.extColorCd != ""){sExtColorCd.enable(false);}
        if(data.intColorCd != null && data.intColorCd != ""){sIntColorCd.enable(false);}


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
    /*
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#customerGrid').data('kendoExtGrid');
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
                dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });
*/

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
        dataSource:{
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
                        params["sCmpCarYn"]  = $("#sCmpCarYn").data("kendoExtDropDownList").value();           // 회사차여부
                        params["sCmpCarDstinCd"]= $("#sCmpCarDstinCd").data("kendoExtDropDownList").value();   // 회사차구분
                        params["sPageGubun"]= pageGubun;                                                    // 페이지구분


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
                    }
                }
            }
        }
        ,filterable:false
        ,editable:false
        //,autoBind:false
        ,height  :236
        ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:150, attributes:{"class":"ac"}} //Vin NO
            ,{field:"ncarDstinCd", hidden:true}
            ,{field:"dlrCd", hidden:true}
            ,{field:"carStatCd",  title:"<spring:message code='global.lbl.vinSts' />",      width:100, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(carStatObj[carStatCd]) #"}         //차량상태
            ,{field:"ownStatCd",  title:"<spring:message code='global.lbl.ownStatCd' />",   width:100, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(ownStatObj[ownStatCd]) #"}         //보유상태
            ,{field:"carlineCd",  title:"<spring:message code='global.lbl.carLine' />",     width:70,   attributes:{"class":"ac"}}    // 차종
            ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:80,  attributes:{"class":"al"}}     // 차종명
            ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",       width:120,  attributes:{"class":"ac"}}    // 모델
            ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:150,  attributes:{"class":"al"}}    // 모델명
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

});
</script>
<!-- //script -->






















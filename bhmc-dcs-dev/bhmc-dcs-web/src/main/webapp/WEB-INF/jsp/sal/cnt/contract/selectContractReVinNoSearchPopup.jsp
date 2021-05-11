<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약 차량조회(차량마스터) 팝업 -->
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
                        <input id="sExtColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>
                    <td>
                        <input id="sVinNo" type="text" value="" maxlength="17" class="form_input">
                    </td>
                </tr>
                <tr style="display:none;">
                    <th scope="row"><spring:message code="global.lbl.vinNum1" /></th><!-- VIN NO1 -->
                    <td>
                        <input id="sVinNo1" type="text" value="" maxlength="11" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNum2" /></th><!-- VIN NO2 -->
                    <td>
                        <input id="sVinNo2" type="text" value="" maxlength="6" class="form_input">
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


    <span style="display:none">
        <!-- 딜러코드 -->
        <input type="hidden" id="sDlrCd"  />
    </span>

</section>
<!-- //계약 차량조회(차량마스터) 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

//차량보유상태 SAL149
var ownStatDs = [];
var ownStatObj = {};
<c:forEach var="obj" items="${ownStatList}">
    ownStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ownStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차량상태 SAL001
var carStatList = [];
var carStatObj = {};
<c:forEach var="obj" items="${carStatList}">
    carStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;


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


    $("#sDlrCd").val(options.sDlrCd);
    $("#sVinNo2").val(options.sVinNo2);
    $("#sVinNo").val(options.sVinNo);

    if(dms.string.strNvl(options.sCarlineCd) != ""){
        $("#sCarlineCd").data("kendoExtDropDownList").value(dms.string.strNvl(options.sCarlineCd));
    }
    if(dms.string.strNvl(options.sModelCd) != ""){
        var sModelCd = $("#sModelCd").data("kendoExtDropDownList");
        sModelCd.setDataSource([{modelNm:options.sModelNm, modelCd:options.sModelCd}]);
        sModelCd.value(options.sModelCd); // 모델
    }
    if(dms.string.strNvl(options.sOcnCd) != ""){
        var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList");
        sOcnCd.setDataSource([{ocnNm:options.sOcnNm, ocnCd:options.sOcnCd}]);
        sOcnCd.value(options.sOcnCd); // OCN
    }
    if(dms.string.strNvl(options.sExtColorCd) != ""){
        var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList");
        sExtColorCd.setDataSource([{extColorNm:options.sExtColorNm, extColorCd:options.sExtColorCd}]);
        sExtColorCd.value(options.sExtColorCd); // 외장색
    }
    if(dms.string.strNvl(options.sIntColorCd) != ""){
        var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList");
        sIntColorCd.setDataSource([{intColorNm:options.sIntColorNm, intColorCd:options.sIntColorCd}]);
        sIntColorCd.value(options.sIntColorCd); // 내장색
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
                });
                options.callbackFunc(data);
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractRe/selectContractReVinNoSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]      = $("#sDlrCd").val();
                        params["sCarlineCd"]  = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sModelCd"]    = $("#sModelCd").data("kendoExtDropDownList").value();
                        params["sOcnCd"]      = $("#sOcnCd").data("kendoExtDropDownList").value();
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();
                        params["sVinNo1"]     = $("#sVinNo1").val();
                        params["sVinNo2"]     = $("#sVinNo2").val();
                        params["sVinNo"]      = $("#sVinNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                   // dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"carId"
                    ,fields:{
                         carId         :{type:"string"}
                        ,vinNo         :{type:"string"}
                        ,carStatCd     :{type:"string"}
                        ,mmCnt         :{type:"number"}       //재고월령
                        ,msPrc         :{type:"number"}       //지도가(msPrc로 지도가 변경)
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
                    }
                }
            }
        }
        ,pageable:{
            refresh:true
            ,pageSize:20
            ,pageSizes:[ "20", "40", "80", "100", "all" ]
        }
        ,editable:false
        ,sortable:false
        ,autoBind:true
        ,selectable:"row"
        ,height  :236
        ,columns:[
             {field:"carId", hidden:true}
            ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:150, attributes:{"class":"ac"}} //Vin NO
            ,{
                field:"carStatCd", title:"<spring:message code='global.lbl.vinSts' />", width:100, attributes:{"class":"ac"}
                , template:"#=dms.string.strNvl(carStatObj[carStatCd])#"
            }   // 차량상태
            ,{field:"mmCnt", title:"<spring:message code='global.lbl.stockMonth' />", width:70, attributes:{"class":"ar"}, format:"{0:n0}"}     // 재고월령
            ,{field:"msPrc", title:"<spring:message code='sal.lbl.carRetlAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}     // 지도가
            ,{field:"carlineCd",  hidden:true}    // 차종
            ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:90,  attributes:{"class":"al"}}     // 차종명
            ,{field:"modelCd",    hidden:true}    // 모델
            ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:150,  attributes:{"class":"al"}}    // 모델명
            ,{field:"ocnCd",      hidden:true}     // OCN
            ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:170,  attributes:{"class":"al"}}    // OCN명
            ,{field:"extColorCd", hidden:true}     // 외장색
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:100,  attributes:{"class":"al"}}    // 외장색명
            ,{field:"intColorCd", hidden:true}     // 내장색
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:140,  attributes:{"class":"al"}}    // 내장색명
        ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});
</script>
<!-- //script -->
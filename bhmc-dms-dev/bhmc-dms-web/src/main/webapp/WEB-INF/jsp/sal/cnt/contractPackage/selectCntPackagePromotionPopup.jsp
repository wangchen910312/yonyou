<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 프로모션 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSelect" class="btn_m"><spring:message code="global.btn.select" /></button>  <!-- 선택 -->
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dealer" /></th>     <!-- 딜러 -->
                    <td>
                        <input id="sDlrCd" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractType' /></th>       <!-- 계약유형 -->
                    <td>
                        <input id="sContractTp" readonly class="form_comboBox form_readonly">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th> <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <input id="sCustNo" readonly class="form_input form_readonly">
                            </div>
                            <div class="form_right">
                                <input id="sCustNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>       <!-- 차종 -->
                    <td>
                        <input id="sCarlineNm" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="sModelNm" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                    <td class="readonly_area">
                        <input id="sContractDt" readonly class="form_datepicker form_readonly">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="dlrPromotionGrid"></div>
    </div>

    <!-- hidden값  -->
    <span style="display:none">
        <input type="hidden" id="sCarlineCd" />
        <input type="hidden" id="sModelCd" />
        <input type="hidden" id="sRetlPrc" />       <!-- 차량가격 -->
    </span>

</section>
<!-- //프로모션 팝업 -->

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var contractTpList = [];
var contractTpObj = {};        // 계약유형
<c:forEach var="obj" items="${contractTpDS}">
    contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//프로모션 적용방법 :SAL132
var applyTpObj = {};
<c:forEach var="obj" items="${applyTpDS}">
    applyTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    $(document).keypress(function(event){
        if(event.which == "13"){
            return false;
        }
    });

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;


    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){

            var grid = $('#dlrPromotionGrid').data('kendoExtGrid');
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
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    // 계약유형
    $("#sContractTp").kendoExtDropDownList({
         dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractTpList
        ,optionLabel:" "
    });

    // 계약일
    $("#sContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sDlrCd").val(options.dlrCd);
    $("#sContractTp").data("kendoExtDropDownList").value(options.contractTp);
    $("#sCustNo").val(options.custNo);
    $("#sCustNm").val(options.custNm);
    $("#sCarlineCd").val(options.carlineCd);
    $("#sCarlineNm").val(options.carlineNm);
    $("#sModelCd").val(options.modelCd);
    $("#sModelNm").val(options.modelNm);
    $("#sContractDt").data("kendoExtMaskedDatePicker").value(options.contractDt);
    $("#sRetlPrc").val(Number(options.retlPrc));

    // 딜러 프로모션 그리드
    $("#dlrPromotionGrid").kendoExtGrid({
         dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/sal/cnt/contractRe/selectPromotionSearch.do' />"
                 },
                 parameterMap:function(options, operation) {
                     if (operation === "read") {
                         var params = {};

                         params["sDlrCd"] = $("#sDlrCd").val();
                         params["sModelCd"] = $("#sModelCd").val();
                         params["sStartContractDt"] = $("#sContractDt").data("kendoExtMaskedDatePicker").value();   // 계약일
                         params["sContractTp"] = $("#sContractTp").data("kendoExtDropDownList").value();
                         params["sContractCustNo"] =  $("#sCustNo").val();       // 고객코드
                         params["sPromotionOwnCd"] = "02";        // 딜러 02

                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,batch:false
             ,requestEnd:function(e){
                 if(e.type =="read" && e.response.total > 0){
                     //console.log(e.sender._data);
                 }
             }
             ,schema:{
                 model:{
                     id:"promotionCd",
                     fields:{
                            promotionCd :{type:"string", editable:false}
                          , promotionNm:{type:"string", editable:false}
                          , promotionTp:{type:"string", editable:false}
                          , modelCd    :{type:"string", editable:false}
                          , startDt    :{type:"date", editable:false}
                          , endDt      :{type:"date", editable:false}
                          , applyTp    :{type:"string", editable:false}
                          , promotionAmt:{type:"number", editable:false}
                          , dcAmt      :{type:"number"}
                          , imsBudnRate:{type:"number", editable:false}
                          , dlrBudnRate:{type:"number", editable:false}
                          , contractTp :{type:"string", editable:false}
                     }
                 }
             }
         }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            var carAmt = Number($("#sRetlPrc").val())
              , sDcAmt = 0;

             $.each(rows, function(idx, row){
                 var item = e.sender.dataItem(row);

                 if(typeof(item) != "undefined" ){
                     // 비율(R), 금액(F)
                     if( item.applyTp == "R"){
                         sDcAmt = carAmt * (Number(item.promotionAmt) / 100 );
                     }else{
                         sDcAmt += Number(item.promotionAmt);
                     }

                     item.set("dcAmt", sDcAmt);
                 }
             });
        }
        ,edit:function(e){
            var cell = e.container.find("input");
            var fieldName;
            if(cell.length > 1){
                fieldName = cell[cell.length-1].getAttribute("name");
            }else{
                fieldName = cell.attr("name");
            }

            if(fieldName === "dcAmt"){
                 this.closeCell();
            }
        }
        ,multiSelectWithCheckbox:false
        ,height:180
        ,pageable:false
        //,editable:false
        ,resizable:true
        ,selectable:"row"
        ,autoBind:true
        ,sortable:false
        ,columns:[
             {field:"promotionCd",  width:10, hidden:true} //프로모션

            ,{field:"promotionNm", title:"<spring:message code='global.lbl.promotionNm' />", width:250, attributes:{"class":"al"}} //프로모션명
            ,{field:"promotionTp", hidden:true} //프로모션 유형
            ,{field:"modelCd",     hidden:true}
            ,{field:"startDt",     hidden:true} //시작일
            ,{field:"endDt",       hidden:true} //종료일
            ,{field:"applyTp",     title:"<spring:message code='global.lbl.applyTp' />", width:80, attributes:{"class":"ac"}, template:"#= applyTpObj[applyTp] #"} //적용방법
            ,{field:"promotionAmt", hidden:true, title:"<spring:message code='global.lbl.amt' />/<spring:message code='global.lbl.dcRate' />", width:100,  attributes:{"class":"ar"},format:"{0:##,###.0}"} //금액/할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100,  attributes:{"class":"ar"}, format:"{0:n2}"}      //할인금액
            ,{field:"imsBudnRate", hidden:true}
            ,{field:"dlrBudnRate", hidden:true}
            ,{field:"contractTp", hidden:true}
        ]
    });

    // 그리드 더블 클릭 이벤트.
    $("#dlrPromotionGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });
});
</script>
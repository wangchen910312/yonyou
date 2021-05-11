<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약품의현황 팝업 -->
<section id="window" class="pop_wrap">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
            <%-- <button  id="btnClose" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /></button> --%> <!-- 취소 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:28%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" type="text" class="form_input">
                                    <a href="javascript:;"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" type="text" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sale.lbl.saleEmpNo' /></th><!-- 판매사원 -->
                    <td colspan="5">
                        <input id="sSaleEmpNo" type="text" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                    <td>
                        <input id="sContractTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th><!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sContractStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sContractEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row">OCN</th>
                    <td>
                        <input id="sOcnCd" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td class="bor_none">
                        <input id="sIntColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row" class="bor_none"></th>
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


<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd     = "${dlrCd}";     // 딜러코드
var userId    = "${userId}";    // 사용자코드
var userNm    = "${userNm}";    // 사용자
var toDay     = "${toDay}";     // 현재일자
var oneDay    = "${oneDay}";    // 해당월 1일
var sevenDtBf = "${sevenDtBf}"; // 7일전

/**
 * 차종 콤보
 */
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//계약유형 SAL003
var contractTpDSList = [];
var contractTpObj = {};
<c:forEach var="obj" items="${contractTpDS}">
    contractTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//계약상태 SAL002 (배정, 출고요청 만 표시)
var contractStatDSList = [];
var contractStatObj = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            
            var fromDt = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                $("#sContractStartDt").focus();
                return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
                dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                $("#sContractEndDt").focus();
                return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
                dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                $("#sContractEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sContractEndDt").focus();
                return false;
            }
            
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

             if(Number(selectVal.contractStatCd) > 20){
                dms.notification.info("<spring:message code='global.lbl.contractStat' var='globalLblContractStat' /><spring:message code='global.info.confirmMsgParam' arguments='${globalLblContractStat}' />");
             }else{
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
                     dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 }
             }
        }
    });

    // 닫기 버튼
    /*$("#btnClose").kendoButton({
        click:function(e){
            parent.popupWindow.close();
        }
    });*/

    //조회조건 - 계약유형
    $("#sContractTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractTpDSList
        ,optionLabel:" "  // 전체
    });

    //조회조건 - 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractStatDSList
        ,optionLabel:" "  // 전체
    });

    //조회조건 - 계약일(기간)- START
    $("#sContractStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 계약시작일은 계약종료일보다 클수가 없다.
    //$("#sContractStartDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);
    //$("#sContractEndDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);
    
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


    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cmm/selectProgressSts.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();                    //계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();            //고객번호
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").val();                      //판매사원코드
                        params["sContractTp"] = $("#sContractTp").data("kendoExtDropDownList").value();                //판매유형
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();        //계약상태
                        params["sContractStartDt"] = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();   //계약일(시작일) TOBE 계약품의 현황 의 DATE객체 변경시 변경 요망.
                        params["sContractEndDt"] = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();       //계약일(종료일) TOBE 계약품의 현황 의 DATE객체 변경시 변경 요망.
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();                  //차종코드
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();                      //모델코드
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();                          //OCN코드
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();                //외장색코드
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();                //내장색코드

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
                    id:"contractNo"
                    ,fields:{
                        contractNo     :{type:"string"}
                        ,contractTp    :{type:"string"}
                        ,contractDt    :{type:"date"}
                        ,contractStatCd:{type:"string"}
                        ,contractCustNo:{type:"string"}
                        ,saleEmpNo     :{type:"string"}
                        ,carlineCd     :{type:"string"}
                        ,modelCd       :{type:"string"}
                        ,ocnCd         :{type:"string"}
                        ,extColorCd    :{type:"string"}
                        ,intColorCd    :{type:"string"}
                        ,carAmt        :{type:"number"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,columns:[
            {field:"contractNo",     title:"<spring:message code='global.lbl.contractNo' />",   width:130, attributes:{"class":"al"}} //계약번호
            ,{field:"contractTp",    title:"<spring:message code='global.lbl.saleType' />",     width:130, attributes:{"class":"al"}, template:"#= contractTpObj[contractTp] #"}         //계약유형
            ,{field:"contractDt",    title:"<spring:message code='global.lbl.contractDate' />", width:130, attributes:{"class":"al"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //계약일
            ,{field:"contractStatCd",title:"<spring:message code='global.lbl.contractStat' />", width:130, attributes:{"class":"al"}, template:"#= contractStatObj[contractStatCd] #"} //계약상태
            ,{field:"contractCustNo",title:"<spring:message code='global.lbl.customer' />",     width:130, attributes:{"class":"al"}} //고객
            ,{field:"saleEmpNo",     title:"<spring:message code='sale.lbl.saleEmpNo' />",      width:130, attributes:{"class":"al"}} //영업사원
            ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:130, attributes:{"class":"al"}} //차종
            ,{field:"modelCd",       title:"<spring:message code='global.lbl.model' />",        width:130, attributes:{"class":"al"}} //모델
            ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocn' />",          width:130, attributes:{"class":"al"}} //OCN
            ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColor' />",     width:130, attributes:{"class":"al"}} //외장색
            ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColor' />",     width:130, attributes:{"class":"al"}} //내장색
            ,{field:"carAmt",        title:"<spring:message code='global.lbl.vehiclePrice' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}"} //차량가격
        ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {

        var grid = $("#grid").data("kendoExtGrid");
        var selectIdx = grid.select().index();
        var data = grid.dataSource.view();
        var selectVal = data[selectIdx];

         if(Number(selectVal.contractStatCd) > 20){
            dms.notification.info("<spring:message code='global.lbl.contractStat' var='globalLblContractStat' /><spring:message code='global.info.confirmMsgParam' arguments='${globalLblContractStat}' />");
         }else{
            var grid = $("#grid").data("kendoExtGrid");
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

});

</script>
<!-- //script -->
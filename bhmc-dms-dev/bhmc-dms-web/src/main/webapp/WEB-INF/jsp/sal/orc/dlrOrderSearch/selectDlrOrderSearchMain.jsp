<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />

<!-- 딜러주문조회 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.menu.dlrOrderSearch' /></h1> <!-- 딜러주문조회 -->
        <div class="btn_right">
                <button class="btn_m btn_excel" type="button" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
            <%-- <dms:access viewId="VIEW-D-13078" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
            <%-- </dms:access> --%>
        </div>
    </div>
    <div class="table_form form_width_70per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:16%;">
                <col style="width:8%;">
                <col style="width:17%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.orderType' /></th> <!-- 주문유형 -->
                    <td>
                        <input type="text" id="sOrdTpList" class="form_comboBox" />
                    </td>
                    <th scope="row"><input type="radio" id="sRadioY" name="sRadio" value="Y" onclick="javascript:changedRadio(true);" checked class="form_check" /><spring:message code='sal.lbl.ordSetDt' /></th>   <!-- 오더배정일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sOrdStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sOrdEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><input type="radio" id="sRadioN" name="sRadio" value="N" onclick="javascript:changedRadio(false);" class="form_check" /><spring:message code='sal.lbl.evalConfMth' /></th>   <!-- 심사평가월 -->
                    <td>
                        <div class="form_float">
                            <input id="sYyMm" class="form_datepicker"/>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ordStat' /></th> <!-- 주문상태 -->
                    <td>
                        <input id="sOrdStatCd" class="form_comboBox" />
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
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>

                    <th scope="row"><spring:message code='sal.lbl.extIntColor' /></th>        <!-- 외장/내장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox" style="width:49%"/>
                        <input id="sIntColorCd" class="form_comboBox" style="width:49%"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.ordSetDtInfo' /></th>        <!-- 오더배정일자정보 -->
                    <td class="readonly_area" colspan="7">
                        <input name="ordLst" id="ordLst" type="text" value="" readonly class="form_input">
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
<!-- sal.lbl.ordSetDtInfo -->

    <div class="header_area">
        <div class="btn_left">
            <ul class="txt_total">
                <li>
                     <span class="form_numeric font_bold"><spring:message code='sal.lbl.totNo' />&nbsp;:&nbsp;<span id="mainTot" name="mainTot">0</span></span>     <!-- 건수:-->
                </li>
            </ul>
        </div>
    </div>

    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
</section>
</div>
<!-- //딜러주문조회 -->

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd   = "${dlrCd}";    // 딜러코드
var dlrNm   = "${dlrNm}";    // 딜러
var userId  = "${userId}";   // 사용자코드
var userNm  = "${userNm}";   // 사용자
var toDay   = "${toDay}";     // 현재일자
var oneDay  = "${oneDay}";   // 해당월 1일
var lastDay = "${lastDay}"; // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

var ordTpList = [];
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>

//주문상태 SAL150
var ordStatCdList = [];
var ordStatCdObj = {};
<c:forEach var="obj" items="${ordStatCdDS}">
    <c:if test="${obj.cmmCd ne 'A' && obj.cmmCd ne 'B' && obj.cmmCd ne 'O' && obj.cmmCd ne 'R' && obj.cmmCd ne 'S'}">
        ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//주문상태 SAL135
var ordStatCdInfoList = [];
var ordStatCdInfoObj = {};
<c:forEach var="obj" items="${ordStatCdInfoDS}">
    ordStatCdInfoList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordStatCdInfoObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//주문조회용상태 SAL198
var ordSrchStatCdInfoList = [];
var ordSrchStatCdInfoObj = {};
<c:forEach var="obj" items="${ordSrchStatCdDS}">
    ordSrchStatCdInfoList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordSrchStatCdInfoObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/**
 * 차종 콤보
 */
 var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
   carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

//하치장 SAL152
var vinmVlocCdList = [];
var vinmVlocCdObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  vinmVlocCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var subParam = {};

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            var fromDt = $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sOrdStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sOrdEndDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sOrdEndDt").focus();
               return false;
            }


            var chekingFromYyyyMm = ($("#sOrdStartDt").val().replace("-", "")).substring(0,6);
            var chekingToYyyyMm = ($("#sOrdEndDt").val().replace("-", "")).substring(0,6);

            // 검색시작월과 검색종료월 다른 경우 검색불가 함
            //Q21032200008 已分配订单查询的订单分配日期不能选择跨月查询 jiaMing 2021-3-22 
            //if(chekingFromYyyyMm != chekingToYyyyMm){
                // 검색시작년월과 검색종료년월은 동일해야합니다.
                //dms.notification.warning("<spring:message code='sal.info.srchYyyyMmCompare'/>");
                //return false;
            //}
            
            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 엑셀다운로드
    $("#btnExcel").kendoButton({
        click:function(e) {

            var fromDt = $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sOrdStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sOrdEndDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sOrdEndDt").focus();
               return false;
            }

            var chekingFromYyyyMm = ($("#sOrdStartDt").val().replace("-", "")).substring(0,6);
            var chekingToYyyyMm = ($("#sOrdEndDt").val().replace("-", "")).substring(0,6);

            // 검색시작월과 검색종료월 다른 경우 검색불가 함
           // Q21032200008 已分配订单查询的订单分配日期不能选择跨月查询 jiaMing 2021-3-22 
            
            //if(chekingFromYyyyMm != chekingToYyyyMm){
                // 검색시작년월과 검색종료년월은 동일해야합니다.
                //dms.notification.warning("<spring:message code='sal.info.srchYyyyMmCompare'/>");
                //return false;
            //}
             
            dms.ajax.excelExport({
                "beanName":"dlrOrderSearchService"
                ,"templateFile":"OrderFund_sal_Tpl.xlsx"
                //,"fileName":"OrderFundDownload.xlsx"
                //CSR 171  下载文件英文名 更改成中文 已分配订单查询 2021-1-22 sart
                ,"fileName": "<spring:message code='sal.menu.dlrOrderSearch' />.xlsx"
                //CSR 171  下载文件英文名 更改成中文 已分配订单查询      2021-1-22 end
                ,"sOrdTpList":$("#sOrdTpList").data("kendoExtMultiSelectDropDownList").value()
                ,"sOrdStatCd":$("#sOrdStatCd").data("kendoExtDropDownList").value()
                ,"sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value()
                ,"sModelCd":$("#sModelCd").data("kendoExtDropDownList").value()
                ,"sOcnCd":$("#sOcnCd").data("kendoExtDropDownList").value()
                ,"sExtColorCd":$("#sExtColorCd").data("kendoExtDropDownList").value()
                ,"sIntColorCd":$("#sIntColorCd").data("kendoExtDropDownList").value()
                ,"sFscCd":$("#sModelCd").data("kendoExtDropDownList").value()
                ,"sOrdStartDtstr":$("#sOrdStartDt").val().replace(/-/gi, "")
                ,"sOrdEndDtstr":$("#sOrdEndDt").val().replace(/-/gi, "")
                ,"sConfirmDt":$("#sYyMm").val().replace(/-/gi, "")
            });
        }
    });
    // 주문유형
    $("#sOrdTpList").kendoExtMultiSelectDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
    });

    // 주문상태
    $("#sOrdStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordStatCdList
       ,optionLabel:" "
    });

    // 주문상태-그리드
    $("#ordStatCdInfoCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordStatCdList
       ,optionLabel:" "
    });

    // 시작일
    $("#sOrdStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
       ,change:function(e){
           //getOrdLst();Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
       }
   });

    // 종료일
    $("#sOrdEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
       ,change:function(e){
           //getOrdLst();Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
       }
    });

    //조회 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:function(e){
           getOrdLst(); //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
       }
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

    $("#sRadioY").prop("checked", true);
    changedRadio(true);

    // 메인 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-1031-172701"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/orc/dlrOrderSearch/selectDlrOrderSearchs.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";
                        var srchTp = $('input:radio[name=sRadio]:checked').val();

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //주문유형
                        params["sOrdTpList"] = $("#sOrdTpList").data("kendoExtMultiSelectDropDownList").value();
                        //주문상태
                        params["sOrdStatCd"] = $("#sOrdStatCd").data("kendoExtDropDownList").value();

                        if(srchTp == 'Y'){
                         // 주문일자
                            params["sOrdStartDtstr"] = $("#sOrdStartDt").val().replace(/-/gi, "");
                            params["sOrdEndDtstr"] = $("#sOrdEndDt").val().replace(/-/gi, "");
                        }else{
                         // 심사평가월
                            params["sConfirmDt"] = $("#sYyMm").val().replace(/-/gi, "");
                        }

                        // 차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델

                        // OCN
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                        // 외장색
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                        // 내장색
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"ordNo",
                    fields:{
                         carlineCd:{type:"string"}    //차종코드
                        ,carlineNm:{type:"string"}     //차종명
                        ,modelNm:{type:"string"}       //차관명
                        ,ocnCd         :{type:"string"}               //OCN코드
                        ,ocnNm:{type:"string"}         //OCN명
                        ,extColorCd    :{type:"string"}               //외색코드
                        ,extColorNm:{type:"string"}    //외색명
                        ,intColorNm:{type:"string"}    //내색명
                        ,ordQty:{type:"number"}        //주문요청수량
                        ,ordTp:{type:"string"}         //주문유형
                        ,ordStatCd:{type:"string"}     //주문상태
                        ,ordSeq:{type:"string"}        //주문번호
                        ,ordDate:{type:"date"}         //주문등록일자
                        ,chrgCd:{type:"string"}        //주문자
                        ,vinmVloc:{type:"string"}      //공장
                        ,pdiDt:{type:"date"}           //심사평가일자
                        ,vinDt:{type:"date"}           //vin배정일
                        ,retailDt:{type:"date"}        //출고일자
                        ,vinNo:{type:"string"}         //VIN NO
                        ,srchTotCnt:{type:"number"}    //조회건수
                        ,dlrGrDt:{type:"date"}         //딜러입고일자
                        ,custSaleDt:{type:"date"}      //고객판매일자
                        ,emont:{type:"string"}         //심사평가월
                        ,dcRate:{type:"number"}        //할인율
                        ,mdpr:{type:"number"}          //지도가
                        ,damt:{type:"number"}          //할인금액
                        ,aamt:{type:"number"}         //공제금액
                        ,misSetDt:{type:"string"}        //임무배정일
                        ,tranSetDt:{type:"string"}       //운송계획일
                        ,ordDt:{type:"date"}       //운송계획일
                    }
                }
            }
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();
            $("#mainTot").text(addcomma(Number(e.sender.pager.dataSource._total)));
        }
       ,editable:false
       ,indvColumnVisible:true      //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true  //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:true     //빈컬럼 적용. default:false
       ,enableTooltip:true          //Tooltip 적용, default:false
       ,autoBind:true
       ,navigatable:true
       ,selectable:"row"
       ,pageable :{
           refresh :true
           ,pageSize :500
           ,pageSizes :[ "500", "1000", "1500", "2000"]
       }
       ,columns:[
                 {field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
                 ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"al"}}//차종description
                 ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:120, attributes:{"class":"al"}} //모델description
                 ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
                 ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}} //OCNdescription
                 ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
                 ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}} //외장색description
                 ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code
                 ,{field:"ordQty",     title:"<spring:message code='global.lbl.qty' />",        width:80,   attributes:{"class":"ar"}, format:"{0:n0}"}//수량
                 ,{field:"ordTp"     , title:"<spring:message code='global.lbl.orderType' />" , width:120,  attributes:{"class":"al"}, template:"#= dms.string.strNvl(ordTpObj[ordTp]) #"}         // 주문유형
                 ,{field:"ordStatCd" , title:"<spring:message code='global.lbl.ordStat' />"   , width:100,   attributes:{"class":"al"}, template:"#= dms.string.strNvl(ordStatCdObj[ordStatCd]) #"} // 주문상태
                 ,{field:"ordDt"    ,title:"<spring:message code='global.lbl.chrgDt' />"  ,   width:100  , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // 주문일자
                 ,{field:"saleRgstId"     ,title:"<spring:message code='sal.lbl.salesAdvisor' />"  ,   width:90  , attributes:{"class":"al"}}                                                    // 판매고문
                 ,{field:"ordSeq"     ,title:"<spring:message code='global.lbl.ordNo' />"   ,   width:90  , attributes:{"class":"al"}}                                                    // 주문번호
                 ,{field:"vinmVloc"   ,title:"<spring:message code='sal.lbl.plant' />"      ,   width:90  , attributes:{"class":"al"}, template:"#=dms.string.strNvl(vinmVlocCdObj[vinmVloc])#"}    // 공장
                 ,{field:"emont"      ,title:"<spring:message code='sal.lbl.evalConfMth' />"   ,   width:90 , attributes:{"class":"ac"}} // 심사평가월
                 ,{field:"pdiDt"      ,title:"<spring:message code='global.llbl.pdiDt' />"  ,   width:100 , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // PDI배정일
                 ,{field:"misSetDt"   ,title:"<spring:message code='sal.lbl.misSetDt' />"  ,   width:100 , attributes:{"class":"ac"}} // 임무배정일
                 ,{field:"tranSetDt"  ,title:"<spring:message code='sal.lbl.tranSchDt' />"  ,   width:100 , attributes:{"class":"ac"}} // 운송계획일
                 ,{field:"vinDt"      ,title:"<spring:message code='global.lbl.vinDt' />"   ,   width:100 , attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // VIN배정일
                 ,{field:"retailDt"   ,title:"<spring:message code='sal.lbl.factoryOutDate' />", width:100,  attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // 출고일자
                 ,{field:"dlrGrDt"    ,title:"<spring:message code='sal.lbl.grDt' />", width:100,  attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // 딜러입고일자
                 ,{field:"custSaleDt" ,title:"<spring:message code='sal.lbl.saleDt' />", width:100,  attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} // 판매일자
                 ,{field:"vinNo"      ,title:"<spring:message code='global.lbl.vinNo' />"   ,   width:160 , attributes:{"class":"al"}}                                              // VIN
                 ,{field:"mdpr"       ,title:"<spring:message code='sal.lbl.carRetlAmt' />" ,width:90 ,headerAttributes:{style:"text-align:center;"},format:"{0:n2}",attributes:{"class":"ar"}} //지도가
                 ,{field:"dcRate"     ,title:"<spring:message code='sal.lbl.saleRate' />(%)" ,width:80 ,headerAttributes:{style:"text-align:center;"},format:"{0:n2}",attributes:{"class":"ar"}} //할인율
                 ,{field:"damt"       ,title:"<spring:message code='sal.lbl.bDcAmt' />" ,width:90 ,headerAttributes:{style:"text-align:center;"},format:"{0:n2}",attributes:{"class":"ar"}} //할인금액
                 ,{field:"aamt"      ,title:"<spring:message code='global.lbl.deductionAmt' />" ,width:90 ,headerAttributes:{style:"text-align:center;"},format:"{0:n2}",attributes:{"class":"ar"}} //공제금액
       ]
   });
   // Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start
    /** 
    $("#sOrdStartDt").keyup(function(e){
        getOrdLst();
    });

    $("#sOrdEndDt").keyup(function(e){
        getOrdLst();
    });
    **/
    $("#sYyMm").keyup(function(e){
        getOrdLst();
    });
   //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 end

});

//오더종류가져오기
function getOrdLst(){
          //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
   /**
    var chekingFromYyyyMmLength = $("#sOrdStartDt").val().length;
    var chekingToYyyyMmLength = $("#sOrdEndDt").val().length;
    var chekingFromYyyyMm = ($("#sOrdStartDt").val().replace("-", "")).substring(0,6);
    var chekingToYyyyMm = ($("#sOrdEndDt").val().replace("-", "")).substring(0,6);

    var responseJson = {};

    if(Number(chekingFromYyyyMmLength)+Number(chekingToYyyyMmLength) == 20){
        if(chekingFromYyyyMm == chekingToYyyyMm){
           responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/orc/dlrOrderSearch/selectMonthDlrOrderTypes.do' />"
               ,data:JSON.stringify({"sConfirmDtVar":chekingFromYyyyMm})
               ,async :false
           });
           $("#ordLst").val(responseJson.data[0].ordLst);
        }else{
           $("#ordLst").val("");
        }
    }
    **/
    var responseJson = {};
    var sYyMm = ($("#sYyMm").val().replace("-", "")).substring(0,6);
     responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/orc/dlrOrderSearch/selectMonthDlrOrderTypes.do' />"
               ,data:JSON.stringify({"sConfirmDtVar":sYyMm})
               ,async :false
           });
           $("#ordLst").val(responseJson.data[0].ordLst);
 //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
    
}

// radio 버튼 처리
 function changedRadio(flg){
    if(flg){
        $("#sYyMm").data("kendoExtMaskedDatePicker").enable(false);
        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").enable(true);

        $("#sYyMm").data("kendoExtMaskedDatePicker").value('');

        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value(oneDay);
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value(toDay);
        //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
        //getOrdLst();
         $("#ordLst").val("");
       //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 end 
        
    }else{
        $("#sYyMm").data("kendoExtMaskedDatePicker").enable(true);
        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").enable(false);

        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value('');
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value('');

        $("#sYyMm").data("kendoExtMaskedDatePicker").value(oneDay);
       //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 start 
         getOrdLst();
         //$("#ordLst").val("");
       //Q21012900015 已分配订单查询页面条件关联调整 DMS已分配订单查询页面，订单分配日期和考评月份是两个二选一的必选条件，当点选订单分配日期时，考核订单类型不参与限制查询结果。当点选考评月份时，考核订单类型需要参与查询。目前情况正好相反。 jiaMing 2021-2-26 end 
       
    }
}

//문자를 받아서 3자리마다 콤마를 찍어 반환한다.
function addcomma(arg) {
    var v = arg.toString();

    tmp=v.split('.');
    var str=new Array();
    var v=tmp[0].replace(/,/gi,''); //콤마를 빈문자열로 대체

    for(var i=0;i<=v.length;i++){ //문자열만큼 루프를 돈다.

        str[str.length]=v.charAt(v.length-i); //스트링에 거꾸로 담음

        if(i%3==0&&i!=0&&i!=v.length){ //첫부분이나, 끝부분에는 콤마가 안들어감
            str[str.length]='.'; //세자리마다 점을 찍음 - 배열을 핸들링할때 쉼표가 들어가면 헛갈리므로
        }
    }

    str=str.reverse().join('').replace(/\./gi,','); //배열을 거꾸로된 스트링으로 바꾼후에, 점을 콤마로 치환

    if(str.substring(0,1) == "-" && str.substring(1,2) == ","){
        str = "-" + str.substring(2);
    }

    //return (tmp.length==2 && parseInt(tmp[1]) > 0)?str+'.'+tmp[1]:str;
    return str;
}

//콤마 빼기
function deletecomma(str)
{
    if((str.toString()).indexOf(",") < 0) return str;
    if (str == '') str = "0";
    return str.replace(/(.:)*[,]/gi,"");
}

</script>
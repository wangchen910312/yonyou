<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 재고관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.stockiMgmt' /></h1> <!-- 재고관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10952" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row">&nbsp;</th>
                    <td colspan="3">
                        <label class="label_check"><input id="tStockTp01" name="tStockTp" type="radio" value="1" class="form_check"> <spring:message code='sal.lbl.stock' /><!-- 재고 --> </label>
                        <label class="label_check"><input id="tStockTp02" name="tStockTp" type="radio" value="2" class="form_check"> <spring:message code='sal.lbl.trsf' /><!-- 운송중 --> </label>
                        <label class="label_check"><input id="tStockTp03" name="tStockTp" type="radio" value="3" checked="checked" class="form_check"> <spring:message code='sal.lbl.all' /><!-- 전부 --></label>
                        <input type="hidden" id="tStockTp" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.strge' /></th>       <!-- 창고 -->
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>         <!-- VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>          <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>       <!-- 모델 -->
                    <td>
                        <input id="sFscCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                     <th scope="row"><spring:message code='sal.lbl.grDts' /></th>        <!-- 입고일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartGrDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndGrDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.enginNo' /></th>        <!-- 엔진번호 -->
                    <td class="bor_none">
                        <input type="text" id="sEnginNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.block' /></th>       <!-- 고정(block) -->
                    <td>
                        <input id="sBlockYn" class="form_comboBox" />
                    </td>

                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10951" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSave" class="btn_s"><spring:message code='global.btn.save' /></button>       <!-- 저장 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10950" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnAllChange" class="btn_s" style="display:none"><spring:message code='sal.btn.stockStateAllChange' /></button>       <!-- 일괄변경 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10949" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnOpenStock" class="btn_s"><spring:message code='sal.btn.openStockSetting' /></button>       <!-- 공개재고설정 -->
            </dms:access>
            <!-- 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 start -->
            <!--<dms:access viewId="VIEW-D-10948" hasPermission="${dms:getPermissionMask('READ')}"> -->
            <!--   <button id="btnBeforeStockAsk" class="btn_s"><spring:message code='sal.btn.stockStrategyAsk' /></button>       <!-- 전략출고신청 -->
            <!-- </dms:access> -->
            <!-- 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 end -->
            <dms:access viewId="VIEW-D-10953" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnExcelExport" type="button" class="btn_s" ><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
            </dms:access>
        </div>
    </div>

    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
</section>
</div>
<!-- //재고조회 -->

<!-- script -->
<script type="text/javascript">
<!--
//yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";

var toDay = "${toDay}";         // 현재일자
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";

//판매사원 리스트
var selectSaleEmpDSList = [{saleEmpNm:"", saleEmpCd:""}];
var selectSaleEmpObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
    selectSaleEmpObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//재고용차량상태 SAL192
var carStatCdObj = {};
<c:forEach var="obj" items="${carStatCdDS}">
    carStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//보유상태 SAL149
var ownStatCdObj = {};
<c:forEach var="obj" items="${ownStatCdDS}">
    ownStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//update by lyy 查询下载增加承兑汇票信息 2018-12-19 start
//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//update by lyy 查询下载增加承兑汇票信息 2018-12-19 end

//전략출고 여부
var strStatYnList = [];
strStatYnList.push({"cmmCd":"A", "cmmCdNm":"待审批", "useYn":"Y"});
strStatYnList.push({"cmmCd":"Y", "cmmCdNm":"是", "useYn":"Y"});
strStatYnList.push({"cmmCd":"N", "cmmCdNm":"否", "useYn":"Y"});

var strStatYnObj = {"A":"待审批", "Y":"是", "N":"否"};

//손상여부 SAL049
var damageList = [];
var damageObj = {};
<c:forEach var="obj" items="${damageDS}">
    damageList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    damageObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    <c:if test="${obj.strgeTp eq '02'}">
        storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    </c:if>
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//위치
//var locDSList = [];
//var locCdObj = {};

//회사차구분 SAL053
var cmpCarDstinCdDSList = [];
var cmpCarDstinCdObj = {};
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
    cmpCarDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    cmpCarDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var popupWindow;

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            var fromDt = $("#sStartGrDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sEndGrDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartGrDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndGrDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndGrDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndGrDt").focus();
               return false;
            }
            
            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"stockMntService"
                ,"templateFile":"StockMnt_Tpl.xlsx"
                ,"fileName":"StockMnt_Tpl.xlsx"
                ,"tStockTp":$("#tStockTp").val()
                ,"sStrgeCd":$("#sStrgeCd").data("kendoExtDropDownList").value()
                ,"sVinNo":$("#sVinNo").val()
                ,"sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value()
                ,"sFscCd":$("#sFscCd").data("kendoExtDropDownList").value()
                ,"sEnginNo":$("#sEnginNo").val()
                ,"sBlockYn":$("#sBlockYn").data("kendoExtDropDownList").value()
                ,"sStartGrDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sStartGrDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sEndGrDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sEndGrDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
            });
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
                windowId:"stockMntAllChangePopup"
                ,title:"<spring:message code='sal.title.stockStateAllChange' />"   // 일괄변경
                ,width:350
                ,height:400
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
            var grid = $("#mainGrid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/inv/stockMnt/multiStockMnt.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }else{
                            dms.notification.error(error);
                        }
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

    //공개재고설정
    $("#btnOpenStock").kendoButton({
        click:function(e){
            
            if($("#mainGrid").data("kendoExtGrid").select().length == 0){
                dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
                return false;
            }
            
            popupWindow = dms.window.popup({
                windowId:"stockStateAllChangePopup"
                ,title:"<spring:message code='sal.btn.openStockSetting' />"   // 공개재고설정
                ,width:900
                ,height:500
                , modal:true
                ,content:{
                    url:"<c:url value='/sal/inv/stockMnt/selectStockOpenSearchPopup.do'/>"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        ,"callbackFunc":function(data){

                            if( typeof(data) != "undefined" && data != null && data.length > 0){

                                var grid = $("#mainGrid").data("kendoExtGrid");
                                var rows = grid.select();

                                var saveList = [];
                                rows.each(function(index, row) {
                                   var dataItem = grid.dataItem(row);
                                   saveList.push(dataItem);
                                });
                                var param = {"insertCarList":saveList, "insertList":data};

                                $.ajax({
                                    url:"<c:url value='/sal/inv/stockOpen/insertStockOpenDlr.do' />"
                                    ,data:JSON.stringify(param)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                        popupWindow.close();
                                    }
                                    ,success:function(jqXHR, textStatus) {
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

    //전략출고신청
    $("#btnBeforeStockAsk").kendoButton({
        click:function(e){

            if($("#mainGrid").data("kendoExtGrid").select().length == 0){
                dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
                return false;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.info.stockStrategyMsg' />"  // 전략출고를 하겠습니까?
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        var grid = $("#mainGrid").data("kendoExtGrid");
                        var rows = grid.select();

                        var saveList = []
                          , isStrYn = false
                          , isReqIng = false;
                        rows.each(function(index, row) {
                           var dataItem = grid.dataItem(row);

                           if(dms.string.strNvl(dataItem.strYn) == "Y"){
                               isStrYn = true;
                           }

                           if(dms.string.strNvl(dataItem.reqStatCd) == "R"){
                               isReqIng = true;
                           }

                           saveList.push(dataItem);
                        });

                        if(isStrYn){
                            //처리건이 존재합니다.
                            dms.notification.info("<spring:message code='sal.info.CoercionApprovChkMsg' />");
                            return false;
                        }
                        
                        if(isReqIng){
                            //이상출고처리 심사중입니다.
                            dms.notification.info("<spring:message code='sal.info.excpDelivery' />");
                            return false;
                        }

                        var param = {"insertList":saveList};

                        $.ajax({
                            url:"<c:url value='/sal/inv/stockMnt/insertStockStrategyAsk.do' />"
                            ,data:JSON.stringify(param)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }else{
                                    dms.notification.error(error);
                                }
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
                        return false;
                    }
                }
            });
        }
    });

    // 재고
    $("#tStockTp01").click(function(){
        $("#tStockTp").val("1");
        var grid = $("#mainGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
        //$("#sStartGrDt").data("kendoExtMaskedDatePicker").value(threeMonthDay);
        //$("#sEndGrDt").data("kendoExtMaskedDatePicker").value(toDay);
    });
    // 운송중
    $("#tStockTp02").click(function(){
        $("#tStockTp").val("2");
        var grid = $("#mainGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
        //$("#sStartGrDt").data("kendoExtMaskedDatePicker").value("");
        //$("#sEndGrDt").data("kendoExtMaskedDatePicker").value("");
    });
    // 전부
    $("#tStockTp03").click(function(){
        $("#tStockTp").val("3");
        var grid = $("#mainGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
        //$("#sStartGrDt").data("kendoExtMaskedDatePicker").value("");
        //$("#sEndGrDt").data("kendoExtMaskedDatePicker").value("");
    });

    $("#tStockTp").val("3");
    $("#tStockTp03").prop("checked", true);

    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택
    });

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,optionLabel:" "
       ,select:function(e){
            $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sFscCd").data("kendoExtDropDownList").enable(true);
            
            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sFscCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
                ,data :JSON.stringify({"sCarlineCd":dataItem.carlineCd})
                ,async :false
            });
            $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 모델 콤보박스
     */
     $("#sFscCd").kendoExtDropDownList({
         dataTextField:"fscNm"
        ,dataValueField:"fscCd"
        ,optionLabel:" "
     });
     $("#sFscCd").data("kendoExtDropDownList").enable(false);

    // 입고일자 시작일
    $("#sStartGrDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:threeMonthDay
    });

    // 입고일자 종료일
    $("#sEndGrDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    // 고정
    $("#sBlockYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,optionLabel:" "           //선택
    });

    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-1123-093101"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/inv/stockMnt/selectStockMntSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["tStockTp"] = $("#tStockTp").val();
                        params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sFscCd"] = $("#sFscCd").data("kendoExtDropDownList").value();
                        params["sEnginNo"] = $("#sEnginNo").val();
                        params["sBlockYn"] = $("#sBlockYn").data("kendoExtDropDownList").value();
                        params["sStartGrDt"] = $("#sStartGrDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndGrDt"]   = $("#sEndGrDt").data("kendoExtMaskedDatePicker").value();

                        //console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carId",
                    fields:{
                        carId :{type:"string", editable:false}   // 차량ID
                        ,carStatNm:{type:"string", editable:false}  // 차량상태(재고유형)
                        ,vinNo :{type:"string", editable:false}  // 차대번호
                        ,ncarDstinCd:{type:"string", editable:false}            // 신차량구분코드
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
                        ,ordTp:{type:"string", editable:false}
                        ,ordTpNm:{type:"string", editable:false}
                        ,strYn:{type:"string", editable:false}
                        ,strStatCd:{type:"string", editable:false}
                        ,damageCd:{type:"string"}               // 이상여부
                        ,blockYn:{type:"string"}                // 블락여부
                        ,blockSaleAdvNo:{type:"string"}         // 판매고문
                        ,strgeCd:{type:"string"}                // 창고
                        ,locCd:{type:"string"}                  // 위치
                        ,locNm:{type:"string"}                  // 위치명
                        ,cmpCarYn:{type:"string"}               // 회사차여부
                        ,cmpCarDstinCd:{type:"string"}          // 회사차구분
                        ,bfDamageCd:{type:"string", editable:false}       // 이상여부(변경전)
                        ,bfBlockYn:{type:"string", editable:false}        // 블락여부(변경전)
                        ,bfBlockSaleAdvNo:{type:"string", editable:false} // 판매고문(변경전)
                        ,bfStrgeCd:{type:"string", editable:false}        // 창고(변경전)
                        ,bfLocCd:{type:"string", editable:false}          // 위치(변경전)
                        ,bfCmpCarYn:{type:"string", editable:false}       // 회사차여부(변경전)
                        ,bfCmpCarDstinCd:{type:"string", editable:false}  // 회사차구분(변경전)
                        ,openYn:{type:"string", editable:false}
                        ,retlPrc:{type:"number", editable:false}
                        ,usedAmtTpNm:{type:"string", editable:false}
                        ,bankNm:{type:"string", editable:false}
                        ,vinmBkcm:{type:"number", editable:false}
                        ,vinmBkwb:{type:"string", editable:false}
                        ,vinmRepayYn:{type:"string", editable:false}
                        ,relDt:{type:"date", editable:false}
                        ,bankNm:{type:"string", editable:false}
                        ,signoffDt:{type:"date", editable:false}
                        ,pltGiDt:{type:"date", editable:false}
                        ,dlrGrDt:{type:"date", editable:false}
                        ,enginModelCd:{type:"string", editable:false}
                        ,certNo:{type:"string", editable:false}
                        ,carStatCd:{type:"string", editable:false}
                        ,ownStatCd:{type:"string", editable:false}
                        ,mmCnt:{type:"number", editable:false}
                        ,giDdCnt:{type:"number", editable:false}
                        ,grDdCnt:{type:"number", editable:false}
                        ,whslPrc:{type:"number", editable:false}
                        ,contractNo:{type:"string", editable:false}
                        ,dlrCd  :{type:"string", editable:false}
                        ,dlrNm  :{type:"string", editable:false}
                        ,vinmF20010  :{type:"string", editable:false}
                        ,temp2  :{type:"string", editable:true}
                        ,signoffDtFormat:{type:"date", editable:false}
                        ,pltGiDtFormat:{type:"date", editable:false}
                        ,dlrGrDtFormat:{type:"date", editable:false}
                        
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.signoffDtFormat = kendo.parseDate(elem.signoffDt, "<dms:configValue code='dateFormat' />");
                            elem.pltGiDtFormat = kendo.parseDate(elem.pltGiDt, "<dms:configValue code='dateFormat' />");
                            elem.dlrGrDtFormat = kendo.parseDate(elem.dlrGrDt, "<dms:configValue code='dateFormat' />");
                            
                        });
                    }
                    return d;
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:470
        ,autoBind:true
        ,pageable :{
            refresh :true
            ,pageSize :100
            ,pageSizes :[ "100", "150", "200", "250"]
        }
        ,edit :function(e){
            var eles = e.container.find("input")
              , rows = e.sender.select()
              , selectedItem = e.sender.dataItem(rows[0])
              , fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");
            var selectedItem = e.sender.dataItem(e.sender.select()[0]);

            if( dms.string.isEmpty(selectedItem) ){
                this.closeCell();
                return ;
            }
            if(fieldName == "blockYn"){
                this.closeCell();
            }

            if(fieldName == "cmpCarDstinCd" && selectedItem.cmpCarYn != "Y" ){
                this.closeCell();
            }
        }
        ,change:function(e) {
           var grid = $("#mainGrid").data("kendoExtGrid");
           var rows = grid.select();

           if(rows.length >= 2){
               $("#btnAllChange").data("kendoButton").enable(true);
           }else{
               $("#btnAllChange").data("kendoButton").enable(false);
           }

           // 위치 초기화
           //locDSList = [];
           //locCdObj = {};

           var that = this;
           var cols = e.sender.tbody.find("tr");
           cols.each(function(idx, row){
               if(that.dataItem(row).carStatCd == "50"){
                   $(this).find(".grid-checkbox-item").prop("checked", false);
                   $(row).removeClass("k-state-selected");
               }else{
                   if($(this).hasClass("k-state-selected")){
                       $(this).find(".grid-checkbox-item").prop("checked", true);
                   }else{
                       $(this).find(".grid-checkbox-item").prop("checked", false);
                   }
               }
           });
           allCheckRow(grid);
           

           var isStrYn = false
             , isReqIng = false;
           $.each(rows, function(idx, row){
               var dataItem = grid.dataItem(row);
               if(dms.string.strNvl(dataItem.strYn) == "Y"){
                   isStrYn = true;
               }
               if(dms.string.strNvl(dataItem.reqStatCd) == "R"){
                   isReqIng = true;
               }
           })
           if(isStrYn || isReqIng){
               $("#btnBeforeStockAsk").data("kendoButton").enable(false);
           }else{
               $("#btnBeforeStockAsk").data("kendoButton").enable(true);
           }

        }
        ,dataBound:function(e) {

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.carStatCd == "50"){
                    //$(row).css("background-color", "#E0E0E0");
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }
            });
        }
        ,columns:[
          {field:"carId", hidden:true}
          , {
              _field:"_multiSelectWithCheckbox"
               ,title:"&nbsp;", width:30, sortable:false, filterable:false, locked:false
               ,headerAttributes:{"class":"ac"}
               ,attributes:{"class":"ac"}
               ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" />'
               ,headerTemplate :"<input type='checkbox' class='checkAll'/>"
           }
          ,{field:"carStatNm",     title:"<spring:message code='global.lbl.stockCd' />", width:90, attributes:{"class":"al"}}      // 재고유형
          ,{field:"vinNo",         title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}       // vin no
          ,{field:"ncarDstinCd", hidden:true}           // 신차량구분코드
          ,{field:"vinmF20010",    title:"<spring:message code='global.lbl.factoryModelCd' />", width:100, attributes:{"class":"ac"}}       // 공장모델코드
          ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:70,  attributes:{"class":"ac"}}    // 차종
          ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:80, attributes:{"class":"al"}}    // 차종
          ,{field:"modelCd",       title:"<spring:message code='global.lbl.model' />",        width:120, attributes:{"class":"ac"}, hidden:true}    // 모델
          ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",      width:170, attributes:{"class":"al"}}    // 모델
          ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocn' />",          width:90, attributes:{"class":"ac"}}    // OCN
          ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:170, attributes:{"class":"al"}}    // OCN
          ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80, attributes:{"class":"ac"}}   // 외장색코드
          ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",   width:100, attributes:{"class":"al"}}    // 외장색명
          ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColor' />",     width:80, attributes:{"class":"ac"}}    // 내장색
          ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",   width:140, attributes:{"class":"al"}, hidden:true}    // 내장색명
          ,{field:"ordTp", hidden:true}    // 오더유형
          ,{field:"ordTpNm",       title:"<spring:message code='global.lbl.orderType' />",   width:140, attributes:{"class":"al"}}    // 오더유형
         /*
          ,{field:"strYn"
             ,title:"<spring:message code='sal.lbl.strYn' />"
             ,width:90
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl(ynObj[strYn])#"
             ,hidden:true
          } // 전략여부
          */
          ,{field:"strStatCd"
              ,title:"<spring:message code='sal.lbl.strYn' />"
              ,width:90
              ,attributes:{"class":"al"}
              ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:strStatYnList
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
          	}
              ,template:"#=dms.string.strNvl(strStatYnObj[strStatCd])#"
          }
          ,{field:"damageCd"
              ,title:"<spring:message code='sal.lbl.vehicleStat' />"
              ,width:90
              ,attributes:{"class":"al"}
              ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(damageList)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }

              ,template:"#=dms.string.strNvl(damageObj[damageCd])#"
              ,editor:function (container, options){
                  $('<input name="damageCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                        autoBind:false
                      , valuePrimitive:true
                      , dataTextField: "cmmCdNm"
                      , dataValueField:"cmmCd"
                      , dataSource:dms.data.cmmCdFilter(damageList)
                      , select:function(e){
                          var dataItem = this.dataItem(e.item);
                          var grid = $("#mainGrid").data("kendoExtGrid");
                          var selectRow = grid.dataItem(grid.select());

                          var blockSaleAdvNo = dms.string.strNvl(selectRow.blockSaleAdvNo);
                          var ownStatCd = dms.string.strNvl(selectRow.ownStatCd);

                          if(dataItem.cmmCd == "01"){
                              selectRow.set("blockYn", "Y");
                              selectRow.set("dirty", "true");
                          }else{
                              // 판매고문 , 임시배정
                              if(blockSaleAdvNo != "" || ownStatCd == "A"){
                                  selectRow.set("blockYn", "Y");
                              }else{
                                  selectRow.set("blockYn", "N");
                              }
                              selectRow.set("dirty", "true");
                          }
                      }
                  });
                  $('<span class="k-invalid-msg" data-for="damageCd"></span>').appendTo(container);
              }
           } // 차량상태
           ,{_field:"_lockKind", title:"<spring:message code='sal.lbl.lockKind' />", width:200, attributes:{"class":"al"}, template:"#=bf_selectlockNm(data)#", sortable:false}
           ,{field:"blockYn"
               ,title:"<spring:message code='sal.lbl.block' />"
               ,width:90
               ,attributes:{"class":"al"}
               ,template:"#=dms.string.strNvl(ynObj[blockYn])#"
               ,filterable:{
   	                cell:{
   	                    showOperators:false
   	                    ,template: function (e) {
                               e.element.kendoExtDropDownList({
                                   dataSource:ynList
                                   ,dataTextField:"cmmCdNm"
                                   ,dataValueField:"cmmCd"
                                   ,valuePrimitive:true
                                   ,optionLabel:" "
                               });
                           }
   	                }
   	        	}
               ,editor:function (container, options){
                   $('<input name="blockYn" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                         autoBind:false
                       , dataTextField: "cmmCdNm"
                       , dataValueField:"cmmCd"
                       , dataSource:dms.data.cmmCdFilter(ynList)
                   });
                   $('<span class="k-invalid-msg" data-for="blockYn"></span>').appendTo(container);
               }
            } // Block상태
            ,{  // 판매고문
                field:"blockSaleAdvNo"
                ,title:"<spring:message code='sal.lbl.salesAdvisor' />"
                ,width:90
                ,attributes:{"class":"al"}
                ,filterable:{
                    cell:{
                        showOperators:false
                        ,template: function (e) {
                               e.element.kendoExtDropDownList({
                                   dataSource:dms.data.cmmCdFilter(selectSaleEmpDSList)
                                   ,dataTextField:"saleEmpNm"
                                   ,dataValueField:"saleEmpCd"
                                   ,valuePrimitive:true
                                   ,optionLabel:" "
                               });
                           }
                    }
                }

                ,template:"#=dms.string.strNvl(selectSaleEmpObj[blockSaleAdvNo])#"
                ,editor:function (container, options){
                    $('<input name="blockSaleAdvNo" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                          autoBind:false
                        , valuePrimitive:true
                        , dataTextField: "saleEmpNm"
                        , dataValueField:"saleEmpCd"
                        , dataSource:dms.data.cmmCdFilter(selectSaleEmpDSList)
                        , select:function(e){
                            var dataItem = this.dataItem(e.item);
                            var grid = $("#mainGrid").data("kendoExtGrid");
                            var selectRow = grid.dataItem(grid.select());

                            var damageCd = dms.string.strNvl(selectRow.damageCd);
                            var ownStatCd = dms.string.strNvl(selectRow.ownStatCd);

                            if( dms.string.isNotEmpty(dataItem.saleEmpCd) ){
                                selectRow.set("blockYn", "Y");
                                selectRow.set("dirty", "true");
                            }else{

                                if(damageCd != "02" || ownStatCd == "A"){
                                    selectRow.set("blockYn", "Y");
                                }else{
                                    selectRow.set("blockYn", "N");
                                }
                                selectRow.set("dirty", "true");
                            }
                        }

                    });
                    //$('<span class="k-invalid-msg" data-for="blockSaleAdvNo"></span>').appendTo(container);
                }
            }
            ,{ // 창고
                field:"strgeCd"
               ,title:"<spring:message code='global.lbl.strge' />"
               ,width:100
               ,attributes:{"class":"al"}
               ,filterable:{
                   cell:{
                       showOperators:false
                       ,template: function (e) {
                              e.element.kendoExtDropDownList({
                                  dataSource:storageDSList
                                  ,dataTextField:"cmmCdNm"
                                  ,dataValueField:"cmmCd"
                                  ,valuePrimitive:true
                                  ,optionLabel:" "
                              });
                          }
                   }
               }
               ,template:"#=dms.string.strNvl(strgeCdObj[strgeCd])#"
               ,editor:function (container, options){
                   $('<input name="strgeCd" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       , valuePrimitive:true
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
               ,filterable:false
               ,hidden:true
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

                   $('<input name="locCd" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       , valuePrimitive:true
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
           ,{field:"temp2",title:"<spring:message code = 'sal.lbl.strgeRemark'/>",width:100,sortable:false,attributes:{"class":"al"}} //창고비고
          ,{ // 회사차여부
               field:"cmpCarYn"
              ,title:"<spring:message code='global.lbl.cmpCarYn' />"
              ,hidden:true
              ,width:80
              ,attributes:{"class":"al"}
              ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(ynList)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
              ,template:"#=dms.string.strNvl(ynObj[cmpCarYn])#"
              ,editor:function (container, options){
                  $('<input name="cmpCarYn" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                        autoBind:false
                      , valuePrimitive:true
                      , dataTextField: "cmmCdNm"
                      , dataValueField:"cmmCd"
                      , dataSource:dms.data.cmmCdFilter(ynList)
                      , select:function(e){
                          var dataItem = this.dataItem(e.item);
                          var grid = $("#mainGrid").data("kendoExtGrid");
                          var selectRow = grid.dataItem(grid.select());

                          if(dataItem.cmmCd == "N"){
                              selectRow.set("cmpCarDstinCd", "");
                              selectRow.set("dirty", "true");
                          }
                      }
                  });
                  $('<span class="k-invalid-msg" data-for="cmpCarYn"></span>').appendTo(container);
              }
          }
          ,{    // 회사차구분
               field:"cmpCarDstinCd"
              ,title:"<spring:message code='global.lbl.cmpCarDstinCd' />"
              ,hidden:true
              ,width:100
              ,attributes:{"class":"al"}
              ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(cmpCarDstinCdDSList)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
              ,template:"#=dms.string.strNvl(cmpCarDstinCdObj[cmpCarDstinCd])#"
              ,editor:function (container, options){
                  $('<input name="cmpCarDstinCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      , valuePrimitive:true
                      , dataTextField: "cmmCdNm"
                      , dataValueField:"cmmCd"
                      , dataSource:dms.data.cmmCdFilter(cmpCarDstinCdDSList)
                  });
                  $('<span class="k-invalid-msg" data-for="cmpCarDstinCd"></span>').appendTo(container);
              }
          }
          ,{field:"locNm",            hidden:true}
          ,{field:"bfDamageCd",       hidden:true}
          ,{field:"bfBlockYn",        hidden:true}
          ,{field:"bfBlockSaleAdvNo", hidden:true}
          ,{field:"bfStrgeCd",        hidden:true}
          ,{field:"bfLocCd",          hidden:true}
          ,{field:"bfCmpCarYn",       hidden:true}
          ,{field:"bfCmpCarDstinCd",  hidden:true}
          ,{field:"openYn"
              ,title:"<spring:message code='sal.lbl.openYn' />"
              ,width:90
              ,attributes:{"class":"al"}
              ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:ynList
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }

              ,template:"#=dms.string.strNvl(ynObj[openYn])#"
           } // 공개여부
           ,{
               field:"retlPrc", title:"<spring:message code='sal.lbl.retlPrcUse' />", attributes:{"class":"ar"}, width:80
               ,format:"{0:n2}", hidden:true
           }    // 사용자금
          ,{field:"usedAmtTpNm", title:"<spring:message code='sal.lbl.retlPrcUse' />", attributes:{"class":"ac"}, width:100}  // 사용자금유형
          ,{field:"bankNm",     title:"<spring:message code='sal.lbl.bank' />", width:120, attributes:{"class":"al"}}       //은행
          ,{field:"vinmBkwb",     title:"<spring:message code='sal.lbl.vinmBkwb' />", width:120, attributes:{"class":"al"}}       //은행
          ,{field:"vinmRepayYn"
              ,title:"<spring:message code='sal.lbl.vinmRepayYn' />"
              ,width:90
              ,attributes:{"class":"al"}
              ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:ynList
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }

              ,template:"#=dms.string.strNvl(ynObj[vinmRepayYn])#"
           }
          //liuxueying add start
          ,{field:"relDt", title:"<spring:message code='global.lbl.relDt' />", attributes:{"class":"ac tooltip-enabled"}, width:100
              ,template:"#= dms.string.strNvl(kendo.toString(data.relDt, '<dms:configValue code='dateFormat' />')) #" } //还款日期
          //liuxuyieng add end 
          ,{field:"signoffDtFormat", title:"<spring:message code='global.lbl.creDt' />", attributes:{"class":"ac tooltip-enabled"}, width:100
              ,template:"#= dms.string.strNvl(kendo.toString(data.signoffDt, '<dms:configValue code='dateFormat' />')) #" } //생산일자
          ,{field:"pltGiDtFormat", title:"<spring:message code='sal.lbl.pltGiDt' />", attributes:{"class":"ac tooltip-enabled"}, width:100
              ,template:"#= dms.string.strNvl(kendo.toString(data.pltGiDt, '<dms:configValue code='dateFormat' />')) #" } //출고일자
          ,{field:"dlrGrDtFormat", title:"<spring:message code='global.lbl.grDt' />", attributes:{"class":"ac tooltip-enabled"}, width:100
                  , template:"#= dms.string.strNvl(kendo.toString(data.dlrGrDt, '<dms:configValue code='dateFormat' />')) #"} //입고일자
          ,{field:"enginModelCd", title:"<spring:message code='global.lbl.engnNo' />", width:100, attributes:{"class":"al"}}       //엔진번호
          ,{field:"certNo", title:"<spring:message code='sal.lbl.certNo' />", width:100, attributes:{"class":"al"}}       //합격증번호
          ,{field:"carStatCd", title:"<spring:message code='global.lbl.vinSts' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(carStatCdObj[carStatCd]) #", hidden:true}       // 차량상태
          ,{field:"ownStatCd", title:"<spring:message code='sal.lbl.ownStatsCd' />", width:100, attributes:{"class":"al"}, template:"#= dms.string.strNvl(ownStatCdObj[ownStatCd]) #", hidden:true}      // 보유상태
          ,{field:"mmCnt", title:"<spring:message code='global.lbl.stockMonth' />", attributes:{"class":"ar"  , "style":"background-color:#=mmCntColor#"   }, width:80
            ,format:"{0:n0}" , hidden:true
            //,template:"<div style='width:100%;margin:0;background-color:#=mmCntColor#;'>#= mmCnt #</div>"       // css단 마진처리로 attributes의 background로 변경
          }
          ,{
               field:"giDdCnt", title:"<spring:message code='sal.lbl.giDdCnt' />", attributes:{"class":"ar"}, width:110
               ,format:"{0:n0}"
           }      //재고일령(공장출고)
          ,{
               field:"grDdCnt", title:"<spring:message code='sal.lbl.grDdCnt' />", attributes:{"class":"ar"}, width:110
               ,format:"{0:n0}"
           }      //재고일령(입고)
          ,{field:"whslPrc", title:"<spring:message code='sal.lbl.carRetlAmt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 지도가격
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:120}
          ,{field:"dlrCd",         hidden:true}  // 딜러코드
          ,{field:"dlrNm",         hidden:true}  // 딜러코드
        ]
   });
   resizeGrid();
   // 그리드 더블클릭
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       if(selectedItem != null){
           // 위치 초기화
           locDSList = [];
           locCdObj = {};
           $("#btnAllChange").data("kendoButton").enable(false);
       }
   });

   $("#mainGrid").on("click", ".checkAll", function(e) {
       var grid = $("#mainGrid").data("kendoExtGrid")
         , checked = $(this).is(":checked")
         , rows = grid.tbody.find("tr");

       if(checked){
           rows.each(function(index, row) {
               if(grid.dataItem(row).carStatCd != "50"){
                   grid.select($(this));
                   $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
               }
           });
       }else{
           grid.clearSelection();
           rows.each(function(index, row) {
               $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
           });
       }
   });
   
   /**
    * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
    */
    $("#mainGrid").on("click", ".grid-checkbox-item", function(e){
        var grid = $("#mainGrid").data("kendoExtGrid");
        var row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");
        
        if($(this).is(":checked")){
            grid.select(row);
        }else{
            //$(e.currentTarget).closest("tr").removeClass("k-state-selected");
            $(row).removeClass("k-state-selected");
        }
        allCheckRow(grid);
    });
   
   
   if(parent != null && typeof(parent.lodinghide) != "undefined" ){
       parent.lodinghide();
   }
});

// 전체선택 
function allCheckRow(grid){
    var view = grid.dataSource.view()
      , totLength = 0;
    
    $.each(view, function(idx, row){
        if(row.carStatCd != "50"){ totLength++; }
    });
    
    if(grid.select().length == totLength){
        $(".checkAll").prop("checked", true);
    }else{
        $(".checkAll").prop("checked", false);
    }
}

//Lock종류
function bf_selectlockNm(obj){
    var str = "";

    //재고
    if(dms.string.strNvl(obj.blockSaleAdvNo) != ""
        && dms.string.strNvl(obj.blockSaleAdvNo) != userId
    ){
        str += "<spring:message code='sal.lbl.blockSaleEmp' />";
    }
    //손상
    if(dms.string.strNvl(obj.damageCd) == "01"){
        str += str.length>0 ? ", <spring:message code='sal.lbl.blokDamage' />" : "<spring:message code='sal.lbl.blokDamage' />";
    }
    //계약
    if(dms.string.strNvl(obj.ownStatCd) == "A"
    //   || (dms.string.strNvl(obj.expAprYn) == "Y" && dms.string.strNvl(obj.expAprYn) == "R")
    ){
        str += str.length>0 ? ", <spring:message code='sal.lbl.blokCont' />" : "<spring:message code='sal.lbl.blokCont' />"
    }
    return str;
}

// 위치 templeate 정의
function bf_selectLoc(locCd, locNm){
    if(locNm != ""){
        return dms.string.strNvl(locNm);
    }
    if(locCd == ""){
        return "";
    }
    return dms.string.strNvl(locCdObj[locCd]);
}


//그리드 화면 맞춤
function resizeGrid(){
    var resizableGrid = $("div.resizable_grid");

    if(resizableGrid.length == 1){
        var resizableContainer = $("#resizableContainer");
        var offsetHeight = resizableContainer.data("offsetheight")||0;

        if(resizableContainer.length == 1){
            var grid = resizableGrid.data("kendoExtGrid");
            var windowHeight = $(window).innerHeight();
            var resizableContainerHeight = resizableContainer.height();
            var gridHeight = grid.element.height();
            var gridHeaderHeight = $("div.k-grid-header", grid.element).height();
            var gridPagerHeight = $("div.k-grid-pager", grid.element).length == 0? 0:$("div.k-grid-pager", grid.element).height();

            grid.element.height(windowHeight - resizableContainerHeight + gridHeight - 10 + offsetHeight);
            $("div.k-grid-content", grid.element).height(grid.element.height() - gridHeaderHeight - gridPagerHeight - 12 + offsetHeight);
        }
    }
}
//-->
</script>
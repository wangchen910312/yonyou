<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- TP차량모니터링 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.tpVehicleMonitoring" /> </h1> <!-- 운송중위치조회:TP차량모니터링 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10934" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:7%;">
                <col style="width:25%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th> <!-- VIN -->
                    <td>
                        <div class="form_float">
                            <!--
                            <div class="form_left" style="width:55%;">
                                <input id="sVinNo1" type="text" value="" maxlength="11" class="form_input">
                            </div>
                            <div class="form_right" style="width:45%;">
                                <input id="sVinNo2" type="text" value="" maxlength="6" class="form_input">
                            </div>
                             -->

                            <input id="sVinNo" type="text" value="" maxlength="17" class="form_input">

                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.realDlDts' /></th> <!-- 발차일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sSrchFrDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sSrchToDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-10935" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" type="button"  id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
            </dms:access>
            </div>
        </div>
    <!-- 그리드 기능 버튼 종료 -->


    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<!-- script -->
<script type="text/javascript">

//현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

var dlrCd = "${dlrCd}";

var popupWindow;
function viewPopup(vinNo){
    var sVinNo = "";

    if(typeof(vinNo) != "undefined" ){
        sVinNo = vinNo;
    }

    popupWindow = dms.window.popup({
        windowId:"askHelpCarPopup"
        ,title:"운송내역 상세조회 팝업"   // 운송내역 상세조회 팝업
        ,width :600
        ,height:500
        ,resizable:false
        ,content:{
            url:"<c:url value='/sal/lom/tpVehicleMonitoringDlr/selectTpVehicleMonitoringDlrDetailPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sVinNo":sVinNo   // vin No
                ,"callbackFunc":function(data){
                    popupWindow.close();
                }
            }
        }
    });
}

$(document).ready(function() {

    // 등록일자 시작일
    $("#sSrchFrDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:oneDay
    });

    // 등록일자 종료일
    $("#sSrchToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    //버튼 - 엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"tpVehicleMonitoringService"
                ,"templateFile":"TpVehicleMonitoring_Tpl.xlsx"
                ,"fileName":"ExcelDown.xlsx"
                ,"sDlrCd":dlrCd
                ,"sVinNo":$("#sVinNo").val()
                //,"sSrchFrDtStr":$("#sSrchFrDt").val().replace(/-/gi, "")
                //,"sSrchToDtStr":$("#sSrchToDt").val().replace(/-/gi, "")
                ,"sSrchFrDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sSrchFrDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sSrchToDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sSrchToDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
            });
        }
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sSrchFrDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sSrchToDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sSrchFrDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sSrchToDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sSrchToDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sSrchToDt").focus();
               return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-114103"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/lom/tpVehicleMonitoringDlr/selectTpVehicleMonitoringDlrCondition.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        /*Paging Param Start~!*/
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        /*Paging Param End~!*/

                        /*Screen Param Start~!*/
                        //params["sVinNo1"] = $("#sVinNo1").val();        //VIN_NO1
                        //params["sVinNo2"] = $("#sVinNo2").val();        //VIN_NO2
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sSrchFrDt"] = $("#sSrchFrDt").data("kendoExtMaskedDatePicker").value();   //발차일자FROM
                        params["sSrchToDt"] = $("#sSrchToDt").data("kendoExtMaskedDatePicker").value();   //발차일자TO
                        /*Screen Param End~!*/

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo:{type:"string"}
                        ,carlineCd :{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,fscCd:{type:"string"}
                        ,fscNm:{type:"string"}
                        ,ocnCd:{type:"string"}
                        ,ocnNm:{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,dstbCmpNm:{type:"string"}
                        ,trsfCarNo:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,pltGiDt:{type:"date"}
                        ,dstbCmpDlDt:{type:"date"}
                        ,trsfLocCd:{type:"string"}
                        ,trsfStatCd:{type:"string"}
                        ,preAlrtNtceCont:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,driverTelNo:{type:"string"}
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:450
        ,editable:false
        //,autoBind:false
        ,columns:[
             {field:"vinNo", title:"<spring:message code='global.lbl.vinNum' />", width:150, attributes:{"class":"ac"}} //VIN
            ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", width:80, attributes:{"class":"ac"}} //차종code
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:120, attributes:{"class":"al"}} //차종description
            ,{field:"fscCd", title:"<spring:message code='global.lbl.model' />", width:120, attributes:{"class":"ac"}, hidden:true}    // 모델
            ,{field:"fscNm", title:"<spring:message code='global.lbl.model' />", width:170, attributes:{"class":"al"}}    // 모델
            ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />", width:80, attributes:{"class":"ac"}} //OCNcode
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />", width:140, attributes:{"class":"al"}} //OCNdescription
            ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", width:80, attributes:{"class":"al"}} //외장색code
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", width:80, attributes:{"class":"al"}} //외장색description
            ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", width:80, attributes:{"class":"al"}} //내장색code
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />", width:140, attributes:{"class":"al"}, hidden:true}    // 내장색명
            ,{field:"dstbCmpNm", title:"<spring:message code='global.lbl.logisticsCmpn' />", width:100, attributes:{"class":"al"}} //물류회사
            ,{field:"trsfCarNo", title:"<spring:message code='global.lbl.tpCarNo' />", width:100, attributes:{"class":"al"}} //트럭번호
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />", width:90, attributes:{"class":"al"}}  //번호판
            ,{field:"pltGiDt", title:"<spring:message code='global.lbl.realDlDts' />", width:130, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"} //발차일자
            ,{field:"dstbCmpDlDt", title:"<spring:message code='sal.lbl.expcArriveDt' />", width:130, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"} //예상도착일
            ,{field:"trsfLocCd", title:"<spring:message code='sal.lbl.trsfLoc' />", width:100, attributes:{"class":"al"}}  //운송위치
            ,{field:"trsfStatCd", title:"<spring:message code='global.lbl.statNm' />", width:80, attributes:{"class":"ac"}}  //상태
            ,{field:"preAlrtNtceCont", title:"<spring:message code='global.lbl.preAltNoti' />", width:120, attributes:{"class":"al"}}  //조기경보통지
            ,{field:"driverNm", title:"<spring:message code='global.lbl.driver' />", width:100, attributes:{"class":"al"}}  //운전기사
            ,{field:"driverTelNo", title:"<spring:message code='sal.lbl.driverTel' />", width:100, attributes:{"class":"al"}}  //전화번호
        ]
    });

    // 그리드 더블클릭.
/*     $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        viewPopup(selectedItem.vinNo);
    }); */
});

</script>
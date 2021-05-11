<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 전략출고관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.stockStrategyMnt' /></h1> <!-- 전략출고관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10947" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnStrCancel" class="btn_m"><spring:message code='sal.btn.stockStrategyCancel' /></button>    <!-- 전략출고취소 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10946" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnExcelExport" class="btn_m btn_excel"><spring:message code="global.btn.excelExport" /></button><!-- 엑셀Export -->
                <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.StrStat' /></th>   <!-- 심사상태 -->
                    <td>
                        <input id="sStrStat" class="form_comboBox" />
                    </td>

                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>       <!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStrAskStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sStrAskEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>          <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>         <!-- VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <span style="display:none;">
        <!-- 심사일자 조회조건 -->
        <input id="sStrConfirmStartDt" class="form_datepicker" />
        <input id="sStrConfirmEndDt" class="form_datepicker" />
    </span>
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

//전략출고 심사상태 SAL190
var strStatList = [];
<c:forEach var="obj" items="${strStatDS}">
    <c:if test="${obj.cmmCd ne 'D' and obj.cmmCd ne 'E' and obj.cmmCd ne 'X' }">
        strStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            var fromDt = $("#sStrConfirmStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sStrConfirmEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStrConfirmStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sStrConfirmEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sStrConfirmEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sStrConfirmEndDt").focus();
               return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //전략출고취소
    $("#btnStrCancel").kendoButton({
        click:function(e){

            if($("#grid").data("kendoExtGrid").select().length == 0){
                dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
                return false;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.info.stockStrategyCancelMsg' />"     // 전략출고취소를 하시겠습니까?
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        var grid = $("#grid").data("kendoExtGrid");
                        var rows = grid.select();
                        var saveList = [];

                        rows.each(function(index, row) {
                           var dataItem = grid.dataItem(row);
                           saveList.push(dataItem);
                        });
                        var param = {"updateList":saveList};

                        $.ajax({
                            url:"<c:url value='/sal/inv/stockStrategy/cancelStockStrategy.do' />"
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

    //버튼 - 엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"stockStrategyService"
                ,"templateFile":"StockStrategy_Tpl.xlsx"
                ,"fileName":"DownloadExcel.xlsx"
                ,"sStrStat":$("#sStrStat").data("kendoExtDropDownList").value()
                ,"sStrAskStartDt":kendo.toString(kendo.parseDate($("#sStrAskStartDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")
                ,"sStrAskEndDt":kendo.toString(kendo.parseDate($("#sStrAskEndDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")
                ,"sStrConfirmStartDt":kendo.toString(kendo.parseDate($("#sStrConfirmStartDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")
                ,"sStrConfirmEndDt":kendo.toString(kendo.parseDate($("#sStrConfirmEndDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")
                ,"sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value()
                ,"sVinNo":$("#sVinNo").val()
            });
        }
    });

    // 심사상태
    $("#sStrStat").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:strStatList
       ,optionLabel:"<spring:message code='sal.lbl.all' />"    //전부
    });
    // 신청일자 시작일
    $("#sStrAskStartDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    // 신청일자 종료일
    $("#sStrAskEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    // 심사일자 시작일
    $("#sStrConfirmStartDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:threeMonthDay
    });

    // 심사일자 종료일
    $("#sStrConfirmEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,optionLabel:" "
    });

    // 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1124-203001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/inv/stockStrategy/selectStockStrategySearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStrStat"] = $("#sStrStat").data("kendoExtDropDownList").value();
                        params["sStrAskStartDt"] = $("#sStrAskStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sStrAskEndDt"] = $("#sStrAskEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sStrConfirmStartDt"] = $("#sStrConfirmStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sStrConfirmEndDt"]   = $("#sStrConfirmEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sVinNo"] = $("#sVinNo").val();
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
                        carId:{type:"string", editable:false}
                        ,rnum:{type:"number", editable:false}
                        ,strNo:{type:"string", editable:false}
                        ,strStat:{type:"string", editable:false}
                        ,strStatNm:{type:"string", editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,strConfirmDt:{type:"date", editable:false}
                        ,strAskDt:{type:"date", editable:false}
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
                        ,custNm:{type:"string", editable:false}
                        ,regUsrId:{type:"string", editable:false}
                        ,dlrCd  :{type:"string", editable:false}
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:450
        ,autoBind:true
        ,pageable :{
            refresh :true
            ,pageSize :100
            ,pageSizes :[ "100", "150", "200", "250"]
        }
        ,change:function(e) {
           var that = this;
           var rows = this.select();
           var sysYyyyMM = toDay.replace("-", "").substring(0,6);
           $.each(rows, function(idx, row){
               if(dms.string.trim(that.dataItem(row).strStat) != "B"){
                   that.clearSelection(row);
               }

               var strAskYyyyMM = kendo.toString(that.dataItem(row).strAskDt, "yyyyMM");

               if(Number(strAskYyyyMM) != Number(sysYyyyMM)){ //이월신청건인지체크 2017.04.09 Lee.K
                   that.clearSelection(row);
               }
           });
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);
                if(dms.string.trim(dataItem.strStat) != "B"){
                    $(row).css("background-color", "#E0E0E0");
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }

                if (dms.string.isNotEmpty(dataItem.strAskDt) ) { //이월신청건인지체크 2017.04.09 Lee.K
                    var strAskYyyyMM = kendo.toString(dataItem.strAskDt, "yyyyMM");
                    var sysYyyyMM = toDay.replace("-", "").substring(0,6);
                     if(Number(strAskYyyyMM) != Number(sysYyyyMM)){
                        $(row).css("background-color", "#E0E0E0");
                        $(".grid-checkbox-item", row).each(function(){
                            $(this).prop("disabled", true);
                        });
                    }
                }
            });
        }
        ,columns:[
          {field:"carId", hidden:true}
          ,{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, attributes:{"class":"ar"}, sortable:false ,format:"{0:n0}"}       // 번호
          ,{field:"strNo", hidden:true}       // 번호
          ,{field:"strStat", hidden:true}       // 전략출고 심사상태
          ,{field:"strStatNm", title:"<spring:message code='sal.lbl.StrStat' />",        width:150, attributes:{"class":"ac"}}       // 전략출고 심사상태
          ,{field:"vinNo",     title:"<spring:message code='global.lbl.vinNo' />",       width:150, attributes:{"class":"ac"}}       // vin no
          ,{field:"strAskDt", title:"<spring:message code='global.lbl.fincReqDt' />",    width:90, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} //전략출고 신청일자
          ,{field:"strConfirmDt", title:"<spring:message code='sal.lbl.confirmDt' />",   width:90, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} //전략출고 심사일자
          ,{field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",    width:70, attributes:{"class":"ac"}}    // 차종
          ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",  width:80, attributes:{"class":"al"}}    // 차종
          ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",      width:120, attributes:{"class":"ac"}, hidden:true}    // 모델
          ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",    width:140, attributes:{"class":"al"}}    // 모델
          ,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",        width:90, attributes:{"class":"ac"}}    // OCN
          ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",      width:170, attributes:{"class":"al"}}    // OCN
          ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",   width:80, attributes:{"class":"ac"}}    // 외장색
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", width:100, attributes:{"class":"al"}}    // 외장색명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",   width:80, attributes:{"class":"ac"}}    // 내장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />", width:140, attributes:{"class":"al"}, hidden:true}    // 내장색명
          ,{field:"ordTp", hidden:true}    // 오더유형
          ,{field:"ordTpNm",    title:"<spring:message code='global.lbl.orderType' />",   width:120, attributes:{"class":"al"}}    // 오더유형
          ,{field:"custNm",     title:"<spring:message code='sal.lbl.publNm' />", width:120, attributes:{"class":"al"}, hidden:true}    // 고객이름
          ,{field:"regUsrId",   title:"<spring:message code='global.lbl.handler' />",   width:120, attributes:{"class":"al"}}    // 조작인
        ]
   });
   resizeGrid();

   if(parent != null && typeof(parent.lodinghide) != "undefined" ){
       parent.lodinghide();
   }
});

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
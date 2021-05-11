<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 완성차 입고확정 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.confirmWearingVehicle" /></h1> <!-- 완성차 입고확정 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10938" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnReceiveCnfrm"><spring:message code="par.btn.receiveCnfm" /></button> <!-- 입고확정 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10937" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnReceiveCncl"><spring:message code="global.btn.receiveCncl" /></button> <!-- 입고취소 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10936" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.vinSts" /></span></th> <!-- 차량상태 -->
                        <td>
                            <label for="sVinmStatus60" class="label_check onKey_down">
                                <input type="radio" id="sVinmStatus60" name="sVinmStatus" value="50" checked class="form_check onKey_down" onClick="slcRadio(2);"/>
                                <spring:message code="global.lbl.notReceive" />
                            </label> <!-- 미입고 -->
                            <label for="sVinmStatus50" class="label_check onKey_down">
                                <input type="radio" id="sVinmStatus50" name="sVinmStatus" value="60" class="form_check onKey_down" onClick="slcRadio(1);"/>
                                <spring:message code="par.lbl.receive" />
                            </label> <!-- 입고 -->
                        </td>
                        <th scope="row"><span><spring:message code="par.lbl.purcOrdTp" /></span></th> <!-- 오더유형 -->
                        <td>
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.vinNo" /></span></th> <!-- VIN -->
                        <td>
                            <input name="sVinNo" id="sVinNo" type="text" maxlength="17" class="form_input">
                        </td>
                        <th scope="row"><span id="orderRegNm"><spring:message code="sal.lbl.grDts" /></span></th> <!-- 입고일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdDtS" id="sOrdDtS"  class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdDtE" id="sOrdDtE"  class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.carLine" /></span></th> <!-- 차종 -->
                        <td>
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.model" /></span></th> <!-- 모델 -->
                        <td>
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                            <input id="hiddenFscCode" type="hidden" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-10939" hasPermission="${dms:getPermissionMask('READ')}">
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


<script  type="text/javascript">
     var oneDay = "${oneDay}";
     var toDay = "${toDay}";

     /************* 주문유형 SELECT BOX [SAL138]  *******************/
	 var ordTpList = [];
     <c:forEach var="obj" items="${ordTpInfo}">
     var cmmCdNm = "[" + "${obj.cmmCd}" + "]" + "${obj.cmmCdNm}";
     ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":cmmCdNm, "useYn":"${obj.useYn}"});
     </c:forEach>

     var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd;});
     /************* 주문유형 SELECT BOX  *******************/

     //하치장 Array[SAL152]
     var carDumpCdList = [];
     <c:forEach var="obj" items="${carDumpCdInfo}">
     carDumpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     //하치장 Map
     var carDumpCdArr = dms.data.arrayToMap(carDumpCdList, function(obj){ return obj.cmmCd;});

     /************* 차량상태(입고확정상태) SELECT BOX [SAL001] *******************/
     var carStatCdList = [];
     <c:forEach var="obj" items="${carStatCdInfo}">
     carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd;});

     //사용자금종류 Array[SAL152]
     var usedAmtTypeList = [];
     <c:forEach var="obj" items="${usedAmtTypeInfo}">
       usedAmtTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     //하치장 Map
     var usedAmtTypeObj = dms.data.arrayToMap(usedAmtTypeList, function(obj){ return obj.cmmCd; });

     /**
      * 차종 콤보
      */
     var carLineCdList = [];
     <c:forEach var="obj" items="${carLineCdInfo}">
         carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
     </c:forEach>

     save = function(cnfrmInfo, carStatCd, prty) {
         var saveData;
         var saveFlag = true;

         var arrSave = [];

         var grid = $("#grid").data("kendoExtGrid");
         var rows = grid.select();

         if(rows.length  == 0 ){
             //차량을 선택해주세요.
             dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
             return false;
         }else{

             // 입고취소 유효성 체크
             if(carStatCd === "50"){

                 // 입고상태확인
                 var isSaveCar = false;

                 // 전략출고 신청중, 통과된 차량은 입고취소 못함.
                 var strVin = "", isStrVin = false;

                 rows.each(function(index, row){
                     var item = grid.dataItem(row);
                     if(dms.string.strNvl(item.vinNoStr) != "NONE"){
                         strVin += "<p>" + item.vinNoStr + "</p>";
                         isStrVin = true;
                     }

                     if(item.carStatCd != "60"){
                         isSaveCar = true;
                     }
                 });
                 if(isStrVin){
                     //전략출고차량은신청할수없습니다.
                     strMsg = "<spring:message code='sal.info.vehicleConfirmCalcleStrMsg' />";
                     strMsg += strVin;
                     dms.notification.warning(strMsg);
                     return false;
                 }
                 if(isSaveCar){
                     // 입고확정 상태에서만  입고취소 처리를 할 수 있습니다.
                     dms.notification.info("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='sal.lbl.receiveCncl' var='cancel' /><spring:message code='sal.info.chkStatConfirm' arguments='${confirm},${cancel},' />");
                     return false;
                 }
             }

             rows.each(function(index, row) {
                 var dataItem = grid.dataItem(row);
                 arrSave.push(dataItem);
             });
         }

         if( saveFlag ){
             var saveData = {};

             if( cnfrmInfo != null ){
                 saveData = { "carStatCd":carStatCd
                             ,"prty":prty
                             ,"updateList":arrSave
                             ,"popupVO":cnfrmInfo};
             }else{
                 saveData = { "carStatCd":carStatCd
                             ,"prty":prty
                             ,"updateList":arrSave};
             }

             var msg = "";

             if(carStatCd == "60"){
                 msg = "<spring:message code='sal.info.confDlrDlvAgr'/>";
             }else{
                 msg = "<spring:message code='sal.info.confDlrDlvCnclAgr'/>";
             }


             dms.window.confirm({
                 message:msg
                 ,title :"<spring:message code='global.lbl.info' />"
                 ,callback:function(result){
                     if(result){
                         //dms.loading.show();
                         $.ajax({
                             url:"<c:url value='/sal/sti/confirmWearingVehicle/updateConfirmWearingVehicle.do' />",
                             data:JSON.stringify(saveData),
                             type:'POST',
                             dataType:'json',
                             contentType:'application/json',
                             error:function(jqXHR,status,error){
                                 if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                 }else{
                                     dms.notification.error(error);
                                 }
                                 $("#grid").data("kendoExtGrid").dataSource.page(1);
                             },
                             success:function(jqXHR, textStatus){
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
     }

  // 집단판매 차량적용 팝업
     var popupWindow;
     function selectConfirmWearingPopupWindow(strVinNo){

         popupWindow = dms.window.popup({
             windowId:"confirmWearingPopup"
             ,title:""   //
             ,width :500
             ,height:235
             ,resizable:false
             ,content:{
                 url:"<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehiclePopupMain.do'/>"
                 ,data:{
                     "type":"custom1"
                     ,"autoBind":false
                     ,"strVinNo":strVinNo                  //
                     ,"callbackFunc":function(data){
                         if (data.msg == "save"){
                             save(data.result, "60", "D");
                         }

                     }
                 }
             }

         });
     }

     function fnChkVehiclePopup(){

         var grid = $('#grid').data('kendoExtGrid');
         var rows = grid.select();
         if(rows.length  == 0 ){
             //목록을 선택하여 주십시오.
             dms.notification.info("<spring:message code='global.info.required.select'/>");
             return false;
         }

         var strVinNo = "";
         var strCarStatCd = "";
         var checkFlag = true;

         if( rows.length > 1){
             rows.each(function(index, row) {
                 var gridData = grid.dataItem(rows[index]);

                 if( gridData.carStatCd == "60" ){
                     // 이미 입고확정 되었습니다.
                     dms.notification.info("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.usedMsg' arguments='${confirm},' />");

                     checkFlag = false;
                     return false;
                 }
                 //RFID 체크 로직   :  VIN 상태 코드가 'A' 일경우만 입고  가능
                 /* if( gridData.statCd != "A" ){
                     // 스캔정보가 없습니다. 매핑 후 입고 가능합니다.
                     dms.notification.info("<spring:message code='sal.info.notRfidInfo' />");
                     checkFlag = false;
                     return false;
                 } */

             });

             if( checkFlag ){
                 console.log("strVinNo="+strVinNo)
                 selectConfirmWearingPopupWindow(strVinNo);
             }
         }else if( rows.length == 1){
             var gridData = grid.dataItem(rows[0]);
             strVinNo = gridData.vinNo;
             strCarStatCd = gridData.carStatCd;

             //RFID 체크 로직   :  VIN 상태 코드가 'A' 일경우만 입고  가능
             /* if( gridData.statCd != "A" ){
              // 스캔정보가 없습니다. 매핑 후 입고 가능합니다.
                 dms.notification.info("<spring:message code='sal.info.notRfidInfo' />");
                 checkFlag = false;
                 return false;
             } */

             if( strCarStatCd == "60" ){
                 // 이미 입고확정 되었습니다.
                 dms.notification.info("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.usedMsg' arguments='${confirm},' />");
                 return;

             }else if( strCarStatCd == "50" ){
                 // 입고확정 처리를 하시겠습니까?
                 //if( !confirm("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.cnfrmMessage' arguments='${confirm},' />")){
                 //    return;
                 //}

                 //save(null, "60", "D")
                 //}else{
                 selectConfirmWearingPopupWindow(strVinNo);
             }
         }else{
             // 차량을 선택해주세요.
             dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.usedMsg' arguments='${car},' />");
             return false;
         }
     }

	$(document).ready(function () {

	    $("#sOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ordTpList
           ,optionLabel:" "  // 선택
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
	           $("#hiddenFscCode").val("");
	       }
	    });
	    $("#sModelCd").data("kendoExtDropDownList").enable(false);

        /**
         * 시작일자 (From)
         */
         $("#sOrdDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,value:oneDay
         });

         /**
         * 종료일자 (From)
         */
         $("#sOrdDtE").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
             //,value:toDay
         });

         /*********************************************** 검색 조건 영역 END ************************************************************/

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {
	            var fromDt = $("#sOrdDtS").data("kendoExtMaskedDatePicker").value();
	            var toDt = $("#sOrdDtE").data("kendoExtMaskedDatePicker").value();

	            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
	               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
	               $("#sOrdDtS").focus();
	               return false;
	            }
	            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
	               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
	               $("#sOrdDtE").focus();
	               return false;
	            }

	            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
	               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
	               $("#sOrdDtE").data("kendoExtMaskedDatePicker").value(new Date(''));
	               $("#sOrdDtE").focus();
	               return false;
	            }

	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

	    //버튼 - 입고확정
        $("#btnReceiveCnfrm").kendoButton({
            enable:true,
            click:function(e) {
                fnChkVehiclePopup();
            }
        });

        //버튼 - 입고취소
        $("#btnReceiveCncl").kendoButton({
            enable:false,
            click:function(e) {
                save(null, "50", "F");
            }
        });

        //버튼 - 엑셀다운로드
        $("#btnExcelExport").kendoButton({
            click:function(e) {

                var excelParam = {
                             "beanName":"confirmWearingVehicleService"
                            ,"templateFile":"ConfirmWearingVehicle_Tpl.xlsx"
                            ,"fileName":"ConfirmWearingVehicleDownload.xlsx"
                            ,"sOrdTp":$("#sOrdTp").data('kendoExtDropDownList').value()
                            ,"sVinNo":$("#sVinNo").val()
                            ,"sCarlineCd":$("#sCarlineCd").data('kendoExtDropDownList').value()
                            ,"sModelCd":$("#sModelCd").data('kendoExtDropDownList').value()
                            ,"sCarStatCd":$("#sVinmStatus50").is(':checked')==true?"60":"50"
                        };
                var scrhStartDt = kendo.toString(kendo.parseDate($("#sOrdDtS").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />");
                var scrhEndDt   = kendo.toString(kendo.parseDate($("#sOrdDtE").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />");
                if($("#sVinmStatus50").is(':checked')){
                    excelParam["sGrDtStart"]  = scrhStartDt;
                    excelParam["sGrDtEnd"]    = scrhEndDt;
                    excelParam["sCarStatCd"]   = '60';
                }else{
                    excelParam["sOrdDtStart"]  = scrhStartDt;
                    excelParam["sOrdDtEnd"]    = scrhEndDt;
                    excelParam["sCarStatCd"]  = '50';
                }

                dms.ajax.excelExport(excelParam);
            }
        });


      //RFID 체크 로직   :  VIN 상태 코드가 'A' 일경우만 입고  가능
      //그리드 헤더CheckBox 클릭이벤트
     /*  $("#grid").on("click", ".checkAll", function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var checked = $(this).is(":checked");
            var uid = $(this).attr("data-uid");
            var rows = grid.tbody.find("tr");
            //var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");
            if(checked){
                rows.each(function(index, row) {
                    var dataItem = grid.dataSource._data;
                    var chkRows = grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]");

                    if((dms.string.trim(dataItem[index].contractNo) != "NONE" &&
                            $("#sVinmStatus50").is(':checked')) ||
                            dataItem[index].statCd == 'A'){

                        $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                        //$(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                    }else{
                        $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                        chkRows.removeClass("k-state-selected");
                    }
                });
            }else{
                grid.clearSelection();
                rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").removeClass("k-state-selected");
                });
            }

        }); */

        /*********************************************** 버튼영역 END ************************************************************/

        //그리드
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-115006"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicle.do' />"
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

                             params["sOrdTp"] = $("#sOrdTp").data('kendoExtDropDownList').value();
                             params["sVinNo"] = $("#sVinNo").val();

                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();


                             if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                                 sModelCd = $("#hiddenFscCode").val();
                             }else{
                                 sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                             }

                             params["sFscCd"]   = sFscCd;    // fsc코드
                             params["sModelCd"]   = sModelCd;    // 모델

                             var scrhStartDt = $("#sOrdDtS").data('kendoExtMaskedDatePicker').value();
                             var scrhEndDt   = $("#sOrdDtE").data('kendoExtMaskedDatePicker').value();

                             params["sGrDtStart"]  = scrhStartDt;
                             params["sGrDtEnd"]    = scrhEndDt;

                             if($("#sVinmStatus50").is(':checked')){
                                 params["sCarStatCd"]   = '60';
                             }else{
                                 params["sCarStatCd"]  = '50';
                             }

                             //console.log(kendo.stringify(params));
                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"carId"
                          ,fields:{
                               carId:{type:"string"}
                              ,vinNo1:{type:"string", hidden:true}
                              ,vinNo2:{type:"string", hidden:true}
                              ,carStatCd:{type:"string"}
                              ,dstbCmpNm:{type:"string"}
                              ,carRegNo:{type:"string"}
                              ,ordNo:{type:"string"}
                              ,vinNo:{type:"string"}
                              ,carDumpCd:{type:"string"}
                              ,carlineCd:{type:"string"}    //차종코드
                              ,carlineNm:{type:"string"}    //차종명
                              ,modelNm:{type:"string"}      //차관명
                              ,ocnCd         :{type:"string"}               //OCN코드
                              ,ocnNm         :{type:"string"}               //OCN명
                              ,extColorCd    :{type:"string"}               //외색코드
                              ,extColorNm:{type:"string"}   //외색명
                              ,intColorCd    :{type:"string"}               //내색코드
                              ,ordTp:{type:"string"}
                              ,manufactYyMmDt:{type:"date"}
                              ,asdyXls:{type:"date"}
                              ,grDtXls:{type:"date"}
                              ,asdy:{type:"date"}
                              ,grDt:{type:"date"}
                              ,enginNo:{type:"string"}
                              ,certNo:{type:"string"}
                              ,chrgCd:{type:"string"}
                              ,rfidNo:{type:"string"}
                              ,bankNm:{type:"string"}
                              ,usedAmtTp:{type:"string"}
                              ,regNm:{type:"string"}
                              ,contractNo:{type:"string"}
                              ,statCd:{type:"string"}
                              ,vinmCpgm:{type:"string"}

                          }
                     }
                 }
            }
            ,change:function(e) {
                var that = this;
                var rows = this.select();

                if( e.sender.dataItem(e.sender.select()) != null ){
                    var selectItem = that.dataItem(rows);
                    if( dms.string.trim(selectItem.contractNo) != "NONE" && $("#sVinmStatus50").is(':checked') ){
                        $(".grid-checkbox-item[data-uid=" + selectItem.uid + "]").prop("checked", false);
                        this.clearSelection();
                        return;
                    }
                }

              //RFID 체크 로직   :  VIN 상태 코드가 'A' 일경우만 입고  가능
               /*  var grid = $("#grid").data("kendoExtGrid");
                var dataItem = that.dataItem(rows);
                if(dataItem != null){
                    if((dms.string.trim(dataItem.contractNo) != "NONE" && $("#sVinmStatus50").is(':checked')) || dataItem.statCd != 'A'){
                        var chkRows = grid.tbody.find("tr[data-uid=" + dataItem.uid + "]");
                        $(".grid-checkbox-item[data-uid=" + dataItem.uid + "]").prop("checked", false);
                       // that.clearSelection(rows);
                    }
                } */

             }
            ,dataBound:function(e) {
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);

                    if(dms.string.trim(dataItem.contractNo) != "NONE" && $("#sVinmStatus50").is(':checked') ) {
                        $(row).css("background-color", "#E0E0E0");
                        $(".grid-checkbox-item", row).each(function(){
                            $(this).prop("disabled", true);
                        });
                    }

                    //RFID 체크 로직   :  VIN 상태 코드가 'A' 일경우만 입고  가능
                    /*
                       if( (dms.string.trim(dataItem.contractNo) != "NONE" && $("#sVinmStatus50").is(':checked')) || (dataItem.statCd != 'A' )){
                        $(row).css("background-color", "#E0E0E0");
                        $(".grid-checkbox-item", row).each(function(){
                            $(this).prop("disabled" ,"disabled");
                        });
                    } */

                });
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
    	    //,autoBind:false
            ,editable:false
            ,pageable :{
                refresh :true
                ,pageSize :50
                ,pageSizes :[ "50", "100", "150", "200", "250"]
            }
            ,columns:[
                 {field:"carId"    ,hidden:true}  // CAR_ID
                ,{field:"vinNo1"   ,hidden:true}  // VIN_NO1
                ,{field:"vinNo2"   ,hidden:true}  // VIN_NO2
                ,{field:"carStatCd" ,title:"<spring:message code='global.lbl.vinSts' />", width:70 ,attributes:{"class":"ac"}
                ,filterable:{
                    cell:{
                        showOperators:false
                        ,template: function (e) {
                               e.element.kendoExtDropDownList({
                                   dataSource:carStatCdList
                                   ,dataTextField:"cmmCdNm"
                                   ,dataValueField:"cmmCd"
                                   ,valuePrimitive:true
                                   ,optionLabel:" "
                               });
                           }
                    }
              }
             ,template:"# if(carStatCdArr[carStatCd] != null) { # #= carStatCdArr[carStatCd].cmmCdNm# # }#"
             }  // 차량상태
                ,{field:"dstbCmpNm", title:"<spring:message code='global.lbl.logisticsCmpn' />"       ,width:70 ,attributes:{"class":"al"}}  // 물류회사
                ,{field:"statCd", title:"<spring:message code='sal.lbl.rfidScanStat' />"       ,width:70 ,attributes:{"class":"ac"} // RFID SCAN 상태
                    ,template: function(dataItem){
                        var objResult="";
                        if(dataItem.statCd == "A"){
                            objResult = "<spring:message code='sal.lbl.rfidScan' />"
                        }
                        return objResult;
                    }
                    ,hidden:true
                }
                ,{field:"vinmCpgm", title:"<spring:message code='sal.lbl.rfidScanDt' />"       ,width:70 ,attributes:{"class":"al"}// RFID SCAN 일자
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,hidden:true
                }
                ,{field:"carRegNo"         ,title:"<spring:message code='global.lbl.licensePlt' />"          ,width:70 ,attributes:{"class":"al"}}  // 번호판
                ,{field:"ordNo"            ,title:"<spring:message code='global.lbl.ordNo' />"               ,width:100 ,attributes:{"class":"ac"}}  // 주문번호
                ,{field:"vinNo"            ,title:"<spring:message code='sal.lbl.vinNo' />"                  ,width:170 ,attributes:{"class":"ac"}}  // VIN번호
                ,{field:"carStatCd",hidden:true}  // 차량상태
                ,{field:"carDumpCd"        ,title:"<spring:message code='global.lbl.yard' />"                ,width:140 ,attributes:{"class":"ac"}
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:carDumpCdList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                  }
                 ,template:"# if(carDumpCdArr[carDumpCd] != null) { # #= carDumpCdArr[carDumpCd].cmmCdNm# # }#"
                 }  // 하차장
                ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />",      width:80, attributes:{"class":"al"}}//차종description
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />",          width:120, attributes:{"class":"al"}} //모델description
                ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}} //OCNdescription
                ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}} //외장색description
                ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code
                ,{field:"rfidNo", title:"RFID",width:120, attributes:{"class":"a'"}}  // RFID NO
                ,{field:"ordTp", title:"<spring:message code='par.lbl.purcOrdTp' />",       width:120 ,attributes:{"class":"al"}
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:ordTpList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                  }
                    ,template:"# if(ordTpArr[ordTp] != null) { # #= ordTpArr[ordTp].cmmCdNm# # }#"
                 }  // 주문유형
                ,{field:"manufactYyMmDt", title:"<spring:message code='global.lbl.creDt' />"               ,width:100 ,attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                }  // 생산년월
                ,{field:"asdyXls", title:"<spring:message code='global.lbl.corporationRealseDt' />" ,width:100 ,attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                 }  // 법인출고일자
                ,{field:"grDtXls", title:"<spring:message code='sal.lbl.grDt' />"                   ,width:100 ,attributes:{"class":"al"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                 }  // 입고일자
                ,{field:"enginNo", title:"<spring:message code='global.lbl.engnNo' />"              ,width:120 ,attributes:{"class":"al"}}  // 엔진번호
                ,{field:"certNo", title:"<spring:message code='global.lbl.vehicleWarrant' />"      ,width:120 ,attributes:{"class":"al"}}  // 차량합격증
                ,{field:"usedAmtTp", title:"<spring:message code='sal.lbl.retlPrcUse' />"             ,width:100 ,attributes:{"class":"al"}
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:usedAmtTypeList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                  }
                   ,template:"# if(usedAmtTypeObj[usedAmtTp] != null) { # #= usedAmtTypeObj[usedAmtTp].cmmCdNm# # }#"
                }  // 사용자금유형
                ,{field:"bankNm", title:"<spring:message code='sal.lbl.bank' />"      ,width:80 ,attributes:{"class":"al"}}  // 은행명
                ,{field:"regNm", title:"<spring:message code='global.lbl.chrgCd' />"      ,width:80 ,attributes:{"class":"al"}}  // 주문자
                // 在途车入库处理画面的“物流公司交车日期” 字段名和数据有误，应该是物流科excel上传的“预计到店时间”。 lyy 2019-2-12 start
                //,{field:"asdyXls",title:"<spring:message code='sal.lbl.masdyDt' />" ,width:100 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  // 물류회사인도일자
                ,{field:"dstbCmpDlDt",title:"<spring:message code='sal.lbl.expcArriveDt' />" ,width:100 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  // 물류회사인도일자
                // 在途车入库处理画面的“物流公司交车日期” 字段名和数据有误，应该是物流科excel上传的“预计到店时间”。 lyy 2019-2-12 end
            ]
    	});

        $("#sOrdDtS").data('kendoExtMaskedDatePicker').enable(false);
        $("#sOrdDtE").data('kendoExtMaskedDatePicker').enable(false);

	}); //document.ready End

	//그리드 헤더CheckBox 클릭이벤트
    $("#grid").on("click", ".checkAll", function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");
        //var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");
        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                var chkRows = grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]");

                if((dms.string.trim(dataItem[index].contractNo) != "NONE" &&
                        $("#sVinmStatus50").is(':checked'))){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                    chkRows.removeClass("k-state-selected");
                }else{
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").removeClass("k-state-selected");
            });
        }

    });


	slcRadio = function(val){
	    switch(val){
	        case 1:
	            // 입고일자
	            //$("#orderRegNm").html("<spring:message code="sal.lbl.grDts" />");

                $("#sOrdDtS").data('kendoExtMaskedDatePicker').enable(true);
                $("#sOrdDtE").data('kendoExtMaskedDatePicker').enable(true);

                $("#sOrdDtS").data('kendoExtMaskedDatePicker').value('');
                $("#sOrdDtE").data('kendoExtMaskedDatePicker').value('');

                $("#btnReceiveCnfrm").data("kendoButton").enable(false);
                $("#btnReceiveCncl").data("kendoButton").enable(true);
	            break;
	        case 2:
	            // 주문등록일
	            //$("#orderRegNm").html("<spring:message code="global.lbl.orderRegDt" />");
	            $("#sOrdDtS").data('kendoExtMaskedDatePicker').value('');
	            $("#sOrdDtE").data('kendoExtMaskedDatePicker').value('');

                $("#sOrdDtS").data('kendoExtMaskedDatePicker').enable(false);
                $("#sOrdDtE").data('kendoExtMaskedDatePicker').enable(false);

                $("#btnReceiveCnfrm").data("kendoButton").enable(true);
                $("#btnReceiveCncl").data("kendoButton").enable(false);
	            break;
	        default:
	            $("#btnReceiveCnfrm").data("kendoButton").enable(false);
	            $("#btnReceiveCncl").data("kendoButton").enable(false);
	            break;
	    }
	    $('#grid').data('kendoExtGrid').dataSource.page(1);
	}

	// 상하좌우
	$(".onKey_down").keydown(function(e){
	    e = (e?e:window.event);
	    var key = (e.keyCode ? e.keyCode : (e.which ? e.which : false));
	    if(key){
	        if(e.preventDefault){
	            //e.preventDefault();
	        }else{
	            //e.returnValue = false;
	        }
	    }
	    if(e.keyCode == "37" || e.keyCode == "38" || e.keyCode == "39" || e.keyCode == "40"){
	        return false;
	    }
	});
</script>
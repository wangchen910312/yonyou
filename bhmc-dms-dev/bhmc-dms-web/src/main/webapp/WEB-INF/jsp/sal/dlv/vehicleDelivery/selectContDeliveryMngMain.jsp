<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 고객인도관리 -->
<div id="resizableContainer">
<section class="group">

	<!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.contractDeliveryMng" /></h1><!-- 고객인도관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13150" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnDelivery"><spring:message code="global.btn.deliveryHandle" /><!-- 인도처리 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13151" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->
	<!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>    <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" name="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer('search', 'vContractCustNm');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.telNo" /></th> <!-- 전화번호 -->
                    <td>
                        <input id="sHpNo" type="text" class="form_input" maxlength="18">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                    <td>
                        <input id="sSaleRgstId" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <div class="clfix">
    	<div class="left_areaStyle" style="width:35%;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.lbl.contractList' /></h2><!-- 계약목록 -->
            </div>
            <section class="group">
                <!-- 그리드 시작 -->
                <div class="table_grid">
                    <div id="grid" ></div>
                </div>
                <!-- 그리드 종료 -->
            </section>
        </div>

    	<div class="right_areaStyle" style="width:64%;" >
    		<div class="header_area">
                <h2 class="title_basic"><spring:message code='global.lbl.custInfo' /></h2><!-- 고객정보 -->
            </div>
    		<!-- 고객정보 -->
			<div class="table_form">
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
			            <tr><input id="contractNo" type="hidden" >
			                <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
			                <td>
			                    <input id="contractCustNm" type="text" readonly class="form_input form_readonly">
			                </td>
			                <th scope="row" class="th_form"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
			                <td>
			                   <input id="carlineCdNm" name="carlineCdNm" type="text" readonly class="form_input form_readonly">
			                </td>
			                <th scope="row" class="th_form"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
			                <td colspan="3">
			                    <input id="ocnCdNm" name="ocnCdNm" type="text" readonly class="form_input form_readonly">
			                </td>
			            </tr>
			            <tr>
			                <th scope="row"><spring:message code='sal.lbl.tempAssignVinNo' /></th><!-- 임시적용 VIN -->
			                <td>
			                    <input id="contractVinNo" name="contractVinNo" type="text" readonly class="form_input form_readonly">
			                </td>
			                <th scope="row" class="th_form"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 -->
			                <td>
			                   <input id="saleEmpNo" name="saleEmpNo" type="text" class="form_comboBox">
                            </td>
                            <th scope="row" class="bor_none"></th>
                            <td></td>
			            </tr>
			        </tbody>
			    </table>
			</div>
			<!-- 고객정보 끝 -->

			<div class="workProgress_manage">
                <div class="top_area">
                    <div class="btn_right mt5">
                        <dms:access viewId="VIEW-D-13247" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnDeliveryAsk" class="btn_s btn_s_v2" style="display:none"><spring:message code="sal.lbl.exceptionDeliveryAsk" /></button><!-- 이상출고 스캔요청 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-13153" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnExceptionDlv" class="btn_s btn_s_v2"><spring:message code="global.btn.exceptionDelivery" /></button><!-- 이상출고처리 -->
                        </dms:access>
                    </div>
                </div>
            </div>

			<div class="header_area">
                <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2><!-- 차량정보 -->
            </div>
			<!-- assign 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="vehicleGrid" ></div>
            </div>
            <!-- assign 그리드 종료 -->

    	</div>
	</div>

</section>
</div>

<script type="text/javascript">
var custNameTo;
var custPhoneTo;


var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nowMonth = "${nowMonth}";   // 현재월
var toDay = "${toDay}";         // 오늘날짜

var popupWindow;
var popupWindow2;
var carlineCd,modelCd,ocnCd,extColorCd,intColorCd;

var deliveryRetlTp;
var contractVinNo;
//var selectedRfidNo = "";

var v_crcReqYn = "";

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";

//회사차구분(SAL053)
var cmpCarDstinCd = [];
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
  cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });

//강제판매처리신청상태 Array(SAL154)
var reqStatCdDs = [];
<c:forEach var="obj" items="${reqStatCdList}">
    reqStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//강제판매처리신청상태 Map
var reqStatCdMap = dms.data.arrayToMap(reqStatCdDs, function(obj){ return obj.cmmCd; });

// 판매고문 (계약)
var saleEmpContList = [];
<c:forEach var="obj" items="${saleEmpContInfo}">
    saleEmpContList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

// 판매고문 (출고)
var selectSaleEmpDSList = [];
var selectSaleEmpDSObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
    selectSaleEmpDSObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

$(document).ready(function() {

    //판매고문
    $("#sSaleRgstId").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:saleEmpContList
       ,optionLabel:" "
    });

    //판매고문
    $("#saleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:saleEmpContList
       ,optionLabel:" "
    });
    $("#saleEmpNo").data("kendoExtDropDownList").enable(false);

    /************************************** END ************************************************/

	//버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

        	$("#contractNo").val("");
        	$("#contractCustNm").val("");
        	$("#carlineCdNm").val("");
        	$("#ocnCdNm").val("");
        	$("#contractVinNo").val("");
        	$("#saleEmpNo").data("kendoExtDropDownList").value("");

    		$("#grid").data('kendoExtGrid').dataSource.filter([]);
            //$('#grid').data('kendoExtGrid').dataSource.page(1);

            $('#vehicleGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });


    //버튼 - 출고스캔요청(맵핑요청)
    $("#btnDeliveryAsk").kendoButton({
        click:function(e){

            var gridSize = $("#grid").data("kendoExtGrid").select().length;
            if(gridSize != 1){
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return false;
            }

            //차량그리드
            var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
            var item = dms.string.strNvl(vehicleGrid.dataItem(vehicleGrid.select()));

            if(vehicleGrid.select().length != 1){
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return false;
            }

            if(item.statCd == "C" || item.statCd == "M"){
                // 출고요청 스캔이 되어있으므로, 출고처리 하시길 바랍니다.[已经扫描了出库申请，请做出库处理。]
                dms.notification.warning("<spring:message code='sal.info.deliveryAskScanMsg' />");
                return false;
            }

            if(item.statCd == "C1"){
                // 이상출고 스캔이 되어있으므로, 이상출고 요청처리 하시길 바랍니다.[已经进行了异常出库扫描，请做异常出库。]
                dms.notification.warning("<spring:message code='sal.info.exceptionDeliveryScanMsg' />");
                return false;
            }

            if(item.expAprYn == "R"){
                // 이상출고 신청이 진행중입니다.[正在执行异常出库。]
                dms.notification.warning("<spring:message code='sal.info.exceptionDeliveryAskingMsg' />");
                return false;
            }

            if(item.expAprYn == "Y"){
                // 이상출고처리 승인된 VIN이므로 바로 출고 가능합니다.[异常出库申请通过的VIN可直接出库。]
                dms.notification.warning("<spring:message code='sal.info.excpDeliveryDirectOutstock'/>");
                return false;
            }

            if(item.expAprYn == "C0"){
                // 이미 등록되어 있습니다.
                dms.notification.warning("<spring:message code='global.info.already'/>");
                return false;
            }

            if(item.skipYn == "Y"){
                dms.notification.warning("<spring:message code='sal.lbl.exceptionDeliveryAsk' var='salLblExceptionDeliveryAsk' /><spring:message code='global.err.failedParam' arguments='${salLblExceptionDeliveryAsk}'/>");
                return false;
            }

            // 이상출고 스캔요청을 하시겠습니까?[要扫描异常出库申请吗？]
            dms.window.confirm({
                message:"<spring:message code='sal.info.exceptionDeliveryAskMsg' />"
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/sal/dlv/contDelivery/deliveryAsk.do' />"
                            , dataType:"json"
                            , type:"POST"
                            , contentType:"application/json"
                            , data:JSON.stringify({vinNo:item.vinNo, contractNo:$("#contractNo").val()})
                            ,error:function(jqXHR,status,error){
                                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }else{
                                    dms.notification.error(error);
                                }
                            }
                            ,success:function(jqXHR, textStatus){
                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success' />");
                                $("#btnSearch").click();
                            }
                        });
                    }else{
                        return false;
                    }
                }
            });

        }
    });

	//버튼 - 이상출고처리
    $("#btnExceptionDlv").kendoButton({
        click:function(e){

            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if(selectIdx == -1){
                // 인도처리할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }

            //차량그리드
            var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
            var sltIdx = vehicleGrid.select().index();
            var vehicleData = vehicleGrid.dataSource.view();
            var selectVehicleVal = vehicleData[sltIdx];

            if(dms.string.isEmpty($("#contractVinNo").val()) && sltIdx == -1){
            	// 재고차량이 없거나, 차량을 선택하지 않았습니다.[无库存车辆或未选择车辆。]
                dms.notification.warning("<spring:message code='sal.info.selectVehicle' />");
                return false;
            }

            if(sltIdx != -1){
            	if(dms.string.strNvl(selectVehicleVal.blockSaleAdvNo) != ""
            	    &&  dms.string.strNvl(selectVehicleVal.blockSaleAdvNo) != userId
            	){
            		//스캔한 VIN이 블럭되었음.재고관리화면에서 설정하시기 바랍니다.[扫描的VIN为锁定状态，请到库存管理画面设置]
            		dms.notification.warning("<spring:message code='sal.info.scanVinIsBlock' />");
            		return false;
                }

                if(selectVehicleVal.ownStatChk == "A"){
                    // 계약 배정이 되어있습니다.
                    dms.notification.warning("<spring:message code='sal.info.contBlockMsg' />");
                    return false;
                }

                if(selectVehicleVal.expAprYn == "R" || selectVehicleVal.expAprYn == "Y"){
                    //이상출고처리 신청건으로 처리가 불가능합니다.
                    dms.notification.warning("<spring:message code='sal.info.crcReqYnMsg' />");
                    return false;
                }
            }

            if(selectVehicleVal.skipYn == "Y"){
                // 특수주문유형은 스캔 혹은 이상출고신청이 필요없음. 바로 출고하세요
                dms.notification.warning("<spring:message code='sal.info.noAskDeliveryMsg' />");
                return false;
            }

            if(selectVehicleVal.skipYn != "Y"
                && selectVehicleVal.statCd != "C1"){
                //매핑해주세요.
                dms.notification.warning("<spring:message code='sal.info.notRfidInfo' />");
                return false;
            }

            
			if(selectVehicleVal.expAprYn == 'Y'){
            	// 이상출고처리 승인된 VIN이므로 바로 출고 가능합니다.[异常出库申请通过的VIN可直接出库。]
                dms.notification.warning("<spring:message code='sal.info.excpDeliveryDirectOutstock'/>");
        		return false;

            }else {
                var saveExcpData = {
                        contractNo:$("#contractNo").val()
                        ,vinNo:selectVehicleVal.vinNo
                        ,vinNo1:selectVehicleVal.vinNo1
                        ,vinNo2:selectVehicleVal.vinNo2
                        ,rfidNo:selectVehicleVal.rfidNo
                        ,temp6:custNameTo
                        ,temp7:custPhoneTo
                        ,contractCustNo:selectVal.contractCustNo
                        ,ordTp:selectVehicleVal.ordTp  //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18
                };
                if(dms.string.isNotEmpty($("#contractVinNo").val()) && dms.string.strNvl($("#contractVinNo").val()) != selectVehicleVal.vinNo){

                    //임시빈과 불일치하여도 출고하시겠습니까?
                    popupWindow = dms.window.popup({
                        windowId :"messagePopup"
                        ,title:"<spring:message code='global.lbl.info' />"
                        ,width:300
                        ,height:110
                        ,modal:true
                        ,content :{
                            url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                            ,data :{
                                "type" :null
                                ,"autoBind" :false
                                , msg :"<spring:message code='sal.info.exceptionDeliveryCheckMsg' />"
                                , btnMsg01 :"<spring:message code='global.btn.confirm' />"
                                , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                                ,"callbackFunc" :function(data){
                                    if(data.msg == "01"){
                                        if(dms.string.isEmpty(selectVehicleVal.receiptNo1) && dms.string.isEmpty(selectVehicleVal.receiptNo2) ){
                                            receiptChkMsg(saveExcpData);
                                        }else{
                                            callExceptionDelivery(saveExcpData);
                                        }
                                    }else{
                                        return false;
                                    }
                                }
                            }
                        }
                    });

                }else{
                    if(dms.string.isEmpty(selectVehicleVal.receiptNo1) && dms.string.isEmpty(selectVehicleVal.receiptNo2) ){
                        receiptChkMsg(saveExcpData);
                    }else{
                        callExceptionDelivery(saveExcpData);
                    }
                }

            }
        }
    });

    //버튼 - 인도처리[出库按钮]
    $("#btnDelivery").kendoButton({
        click:function(e) {

            var chkOneShot = srchOneShotChk();

            if(chkOneShot > 0){
                //dms.notification.warning("<spring:message code='sal.menu.contractDeliveryMng' var='contractDeliveryMng' /><spring:message code='sal.info.deadLineCheckMsg' arguments='${contractDeliveryMng}' />");
                dms.notification.warning("<spring:message code='sal.info.deliveryCheckMsg' />");
                return false;
            }

            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if(selectIdx == -1){
                // 인도처리할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }

            //차량그리드
            var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
            var sltIdx = vehicleGrid.select().index();
            var vehicleData = vehicleGrid.dataSource.view();
            var selectVehicleVal = vehicleData[sltIdx];

            if(sltIdx == -1){
            	// 인도처리할 차량을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.car' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }


            if( dms.string.strNvl(selectVehicleVal.blockSaleAdvNo) != ""
                && dms.string.strNvl(selectVehicleVal.blockSaleAdvNo) != userId
            ){
                // 재고블락된 차량은 선택이 불가능합니다.
                dms.notification.warning("<spring:message code='sal.info.stockBlockMsg'/>");
                return false;
            }

            if(selectVehicleVal.skipYn != "Y"){
                if(selectVehicleVal.expAprYn != 'Y'
                        && selectVehicleVal.expAprYn != "S"
                ){
                    //RFID가 일치하지 않습니다.이상출고신청처리를 먼저 해주세요.[请先进行异常出库申请。]
                    dms.notification.warning("<spring:message code='sal.info.selectExcpDeliveryReq'/>");
                    return false;
                }

            }

            if( dms.string.isEmpty($("#saleEmpNo").data("kendoExtDropDownList").value())){
                // 판매담당자를 선택해 주세요.
                dms.notification.info("<spring:message code='global.lbl.salPrsnNm' var='globalLblSalPrsnNm' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblSalPrsnNm}' />");
                //$("#saleEmpNo").data("kendoExtDropDownList").focus();
                return false;
            }

            var submitVin = selectVehicleVal.vinNo;
            var saveData = {
                    contractNo:selectVal.contractNo
                    ,contractCustNo:selectVal.contractCustNo
                    ,saleTp:selectVal.saleTp
                    ,saleOpptNo:selectVal.saleOpptNo
                    ,saleOpptSeq:selectVal.saleOpptSeq
                    ,vinNo:submitVin
                    ,contractStatCd:"50"
                    ,ownStatCd:"A"       // 배정
                    ,carStatCd:"70"
                    ,retlTpCd:deliveryRetlTp
                    ,ssnCrnNo:selectVal.ssnCrnNo
                    ,saleEmpNo:$("#saleEmpNo").data("kendoExtDropDownList").value()
                    ,gubun:"D"
                    ,dlrCd:selectVal.dlrCd
                    ,rfidNo:selectVehicleVal.rfidNo
                    ,temp6:custNameTo
                    ,temp7:custPhoneTo
                    ,ordTp:selectVehicleVal.ordTp  //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18
            };

            if(dms.string.isNotEmpty($("#contractVinNo").val()) && dms.string.strNvl($("#contractVinNo").val()) != submitVin){
                //임시빈과 불일치하여도 출고하시겠습니까?
                popupWindow = dms.window.popup({
                    windowId :"messagePopup"
                    ,title:"<spring:message code='global.lbl.info' />"
                    ,width:300
                    ,height:110
                    ,modal:true
                    ,content :{
                        url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                        ,data :{
                            "type" :null
                            ,"autoBind" :false
                            , msg :"<spring:message code='sal.info.deliveryVinCheckMsg' />"
                            , btnMsg01 :"<spring:message code='global.btn.confirm' />"
                            , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                            ,"callbackFunc" :function(data){
                                if(data.msg == "01"){
                                    callDelivery(saveData, submitVin);
                                }else{
                                    return false;
                                }
                            }
                        }
                    }
                });

            }else{
                callDelivery(saveData, submitVin);
            }

        }
    });

    /********************************************* 버튼 END *******************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1023-152601"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/contDelivery/selectContDeliveryMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"]= options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sContractNo"] = $("#sContractNo").val();    // 계약번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();    // 고객번호
                        params["sContractCustNm"] = $("#vContractCustNm").val();    // 고객명
                        params["sHpNo"] = $("#sHpNo").val();    					// 전화번호
                        params["sSaleEmpNo"] = $("#sSaleRgstId").data("kendoExtDropDownList").value(); // 판매고문

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"contractNo"
                    ,fields:{
                        contractNo  	:{type:"string"}
            	        ,contractCustNm :{type:"string"}
            	        ,saleEmpNo  	:{type:"string"}
            	        ,saleEmpNm  	:{type:"string"}
            	        ,contractCustNo :{type:"string"}
            	        ,hpNo  			:{type:"string"}
            	        ,crcReqYn       :{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,selectable:"row"
        ,change:function(e) {
            var dataItem = e.sender.dataItem(e.sender.select());
            fn_contOnLoad(dataItem);
            custNameTo = dataItem.contractCustNm;  //客户姓名 用于生成充电桩客户数据
            custPhoneTo = dataItem.hpNo;  //客户电话  用于生成充电桩客户数据
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,autoBind:true
        ,height:560
        ,columns:[
                    {field:"contractCustNm"  ,title:"<spring:message code = 'global.lbl.custNm'/>"   	,width:100  ,attributes:{"class":"al"}}         //고객이름
                    ,{field:"saleEmpNm"      ,title:"<spring:message code = 'sal.lbl.salesAdvisor'/>"   ,width:60   ,attributes:{"class":"ac"}}         //판매고문
                    ,{field:"contractNo"     ,title:"<spring:message code = 'global.lbl.contractNo'/>"  ,width:130  ,attributes:{"class":"ac"}
                        , template:function(item){
                            var str = "";
                            str += "<a href='#' onclick=\"javascript:fn_contractLink(\'"+ item.contractNo +"\');\" style='cursor:pointer'>";
                            str += item.contractNo;
                            str += "</a>";
                            return str;
                        }
                     }         //계약번호
                    ,{field:"contractCustNo" ,title:"<spring:message code = 'global.lbl.custNo'/>"   	,width:150  ,attributes:{"class":"ac"}}         //고객번호
                    ,{field:"hpNo"     		 ,title:"<spring:message code = 'sal.lbl.telNo'/>"   		,width:120  ,attributes:{"class":"ac"}}         //전화번호
                ]
    });

    // 계약데이터 재조회
    fn_contOnLoad = function(selectedItem){
        dms.loading.show();
        $.ajax({
            url :"<c:url value='/sal/dlv/contDelivery/selectContDeliveryMng.do' />"
            ,data :JSON.stringify({"sDlrCd":selectedItem.sDlrCd, "sContractNo":selectedItem.contractNo})
            ,type :'POST'
            ,dataType :'json'
            ,contentType :'application/json'
            ,async :false
            ,error :function(jqXHR,status,error) {
                dms.loading.hide();
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }else{
                    dms.notification.error(error);
                }
            }
            ,success :function(jqXHR, textStatus) {
                dms.loading.hide();
                if(jqXHR.total > 0){
                    //selectedRfidNo = jqXHR.data[0].rfidNo;

                    v_crcReqYn = "";
                    if ( dms.string.isNotEmpty(jqXHR.data[0].contractNo) ) {
                        $("#contractCustNm").val(jqXHR.data[0].contractCustNm);           //고객명
                        $("#carlineCdNm").val(jqXHR.data[0].carlineNm);                   //차종
                        $("#ocnCdNm").val(jqXHR.data[0].ocnNm);                           //OCN
                        $("#contractVinNo").val(jqXHR.data[0].contractVinNo);             //임시점용vin
                        $("#saleEmpNo").data("kendoExtDropDownList").value(jqXHR.data[0].saleEmpNo); //판매고문사번호
                        $("#contractNo").val(jqXHR.data[0].contractNo);                   //계약번호

                        carlineCd  = jqXHR.data[0].carlineCd;
                        modelCd    = jqXHR.data[0].modelCd;
                        ocnCd      = jqXHR.data[0].ocnCd;
                        extColorCd = jqXHR.data[0].extColorCd;
                        intColorCd = jqXHR.data[0].intColorCd;

                        contractVinNo = jqXHR.data[0].contractVinNo;
                        getRetlTp("grid");
                        v_crcReqYn = jqXHR.data[0].crcReqYn;
                        $("#vehicleGrid").data('kendoExtGrid').dataSource.filter([]);
                    }
                }else{
                  // {상세정보}을(를) 확인하여 주세요.
                  dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                }
            }
        });
    }

    // 차량정보 그리드.
    $("#vehicleGrid").kendoExtGrid({
        gridId:"G-SAL-1023-193617"
        ,dataSource:{
            transport:{
                read:{
                	url:"<c:url value='/sal/dlv/contDelivery/selectDeliveryVehicle.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sCarlineCd"] = carlineCd;                     // 차종.
                        //params["sModelCd"]   = modelCd;                       // 모델.
                        //params["sOcnCd"]     = ocnCd;                         // OCN
                        //params["sExtColorCd"]= extColorCd;                    // 외장색
                        //params["sIntColorCd"]= intColorCd;                    // 내장색
                        params["sContractNo"]= $("#contractNo").val();        // 계약번호
                        params["sCrcReqYn"]= v_crcReqYn;                        // 임시배정여부

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo     	:{ type:"string"}
                       ,rfidNo		:{ type:"string"}
                       ,carlineCd	:{ type:"string"}
                       ,carlineNm	:{ type:"string"}
                       ,modelCd		:{ type:"string"}
                       ,modelNm		:{ type:"string"}
                       ,ocnCd		:{ type:"string"}
                       ,ocnNm		:{ type:"string"}
                       ,extColorCd	:{ type:"string"}
                       ,extColorNm	:{ type:"string"}
                       ,intColorCd	:{ type:"string"}
                       ,intColorNm	:{ type:"string"}
                       ,cmpCarDstinCd:{ type:"string"}
                       ,cmpCarYn	:{ type:"string"}
                       ,ordTp		:{ type:"string"}
                       ,blockYn		:{ type:"string"}
                       ,contractVinNo:{ type:"string"}
                       ,reqStatCd	:{ type:"string"}
                       ,expAprYn	:{ type:"string"}
                       ,receiptNo1   :{ type:"string"}
                    }
                }
            }
        }
        , editable:false
        , selectable:"row"
        , dataBound:function(e){
        	var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
            var vehicleList = vehicleGrid.dataSource.view();

            if(vehicleList.length == 0){
            	$("#btnExceptionDlv").data("kendoButton").enable(false);
            }else {
                $("#btnExceptionDlv").data("kendoButton").enable(true);
            }
        }
        , change:function(e) {

        	if(this.select().length != 0){
	            var selectedVal = this.dataItem(this.select());
				var vinNo = selectedVal.vinNo;
				var blockYn = selectedVal.blockYn;

			    if ( dms.string.isNotEmpty(vinNo) ) {

				   	if(dms.string.strNvl(selectedVal.vinNo) != $("#contractVinNo").val()){

	                    var msg = ""
	                      , blockChk = dms.string.strNvl(selectedVal.blockSaleAdvNo)
	                      , damageChk = dms.string.strNvl(selectedVal.damageCd)
	                      , ownStatChk = dms.string.strNvl(selectedVal.ownStatCd)
	                      //, expAprYn = dms.string.strNvl(selectedVal.expAprYn)
	                      , msgFlag = false;

	                    if(blockChk != "" && blockChk != userId){
	                        msgFlag = true;
	                        msg += "<spring:message code='sal.info.stockBlockMsg'/>";
	                    }

	                    if(damageChk == "01"){
	                        msgFlag = true;
	                        if(msg.length > 0){
	                            msg += "<br />"+ "<spring:message code='sal.info.damageBlocksMsg'/>";
	                        }else{
	                            msg += "<spring:message code='sal.info.damageBlocksMsg'/>";
	                        }
	                    }

	                    if(ownStatChk == "A"){
	                        msgFlag = true;
                            if(msg.length > 0){
                                msg += "<br />"+ "<spring:message code='sal.info.contBlockMsg'/>";
                            }else{
                                msg += "<spring:message code='sal.info.contBlockMsg'/>";
                            }
	                    }

	                    if(msgFlag){
	                        dms.window.confirm({
	                            message:msg
	                            ,title :"<spring:message code='global.lbl.info' />"
	                            ,displayCancelBtn:false
	                            ,callback:function(result){
	                                $("#vehicleGrid").data('kendoExtGrid').dataSource.filter([]);
	                                //$('#vehicleGrid').data('kendoExtGrid').dataSource.page(1);
	                            }
	                        });
	                    }
				   	}

				   	getRetlTp("vehicleGrid");
			    }
        	}
        }
        ,editable:false
        ,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,pageable:false
        , height:424
        , columns:[  {field:"expAprYn"     	,title:"<spring:message code = 'sal.lbl.rfidScanStat'/>"	, width:80 ,attributes:{"class":"ac"}
       				     ,template:"# if(reqStatCdMap[expAprYn] != null) { # #= reqStatCdMap[expAprYn].cmmCdNm# # }#"
        			 } //이상심사상태
                     ,{field:"vinNo" 		,title:"<spring:message code = 'sal.lbl.carVinNo'/>"			, width:150	,attributes:{"class":"ac"}}         //VIN NO
                     ,{field:"rfidNo"   	,title:"<spring:message code = 'global.lbl.rfidNo'/>"			, width:130	,attributes:{"class":"al"}}         //RFID
                     ,{field:"carlineCd"    ,title:"<spring:message code = 'global.lbl.carlineCd'/>"		, width:80	,attributes:{"class":"ac"}}         //차종코드
                     ,{field:"carlineNm"    ,title:"<spring:message code = 'global.lbl.carLine'/>"          , width:80  ,attributes:{"class":"al"}}         //차종명
                     ,{field:"fscNm"		,title:"<spring:message code = 'global.lbl.model'/>"			, width:150	,attributes:{"class":"al"}}         //차관명
                     ,{field:"ocnCd"		,title:"<spring:message code = 'global.lbl.ocnCode'/>"          , width:80	,attributes:{"class":"ac"}}			//OCN Code
                     ,{field:"ocnNm"        ,title:"<spring:message code = 'global.lbl.ocnNm'/>"            , width:120 ,attributes:{"class":"al"}}         //OCN
                     /* ,{field:"blockYn"		,title:"<spring:message code = 'sal.lbl.blockYn'/>"				, width:50	,attributes:{"class":"ac"}}			//BLOCK여부 */
                     ,{_field:"_lockKind", title:"<spring:message code='sal.lbl.lockKind' />", width:200, attributes:{"class":"al"}, template:"#=bf_selectlockNm(data)#", sortable:false}
                     ,{_field:"_receiptNoYn", title:"<spring:message code='sal.lbl.receipYn'/>", width:100, attributes:{"class":"ac"}
                         , template:function(dataItem){
                             if(!dms.string.isEmpty(dataItem.receiptNo1)){
                                 return "<spring:message code='sal.lbl.yes'/>";
                             }
                             return "<spring:message code='sal.lbl.none'/>";
                         }
                      } // 영수증유무
                     ,{field:"cmpCarDstinCd",title:"<spring:message code = 'global.lbl.cmpCarDstinCd'/>",width:80  ,attributes:{"class":"ac"}               //회사차구분
                       ,template:"# if(cmpCarDstinCdMap[cmpCarDstinCd] != null) { # #= cmpCarDstinCdMap[cmpCarDstinCd].cmmCdNm# # }#"}
                     ,{field:"extColorCd"	,title:"<spring:message code = 'global.lbl.extColorCd'/>"		, width:80	,attributes:{"class":"ac"}}		    //외장색코드
                     ,{field:"extColorNm"   ,title:"<spring:message code = 'global.lbl.extColorNm'/>"       , width:80  ,attributes:{"class":"al"}}         //외장색명
                     ,{field:"intColorCd"	,title:"<spring:message code = 'global.lbl.intColorCd'/>"		, width:80	,attributes:{"class":"ac"}}		    //내장색코드
                     ,{field:"intColorNm"   ,title:"<spring:message code = 'global.lbl.intColorNm'/>"       , width:80  ,attributes:{"class":"al"}}         //내장색명
                    ]
    });

    fnOnChange = function(id,vl){
        $("#sContractCustNo").val("");
    }

    //고객명변경시 고객아이디 삭제
    $("#vContractCustNm").keyup(function(key){
        if(key.keyCode != 13){
            $("#sContractCustNo").val("");
          }
    });

    //LIST 에서 넘어올 경우 계약 번호 세팅
    <c:if test="${sContractNo ne '' }" >
        $("#sContractNo").val("${sContractNo}");
        var grid = $("#grid").data("kendoExtGrid");
        grid.dataSource.page(1);
    </c:if>
});


//소매유형 가져오기
function getRetlTp(gb){
    var dlvSltVal;

    if(gb == 'vehicleGrid'){
        var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
        var sltIdx = vehicleGrid.select().index();
        var data = vehicleGrid.dataSource.view();
        dlvSltVal = data[sltIdx].ordTp;
    }else{
        var grid = $("#grid").data("kendoExtGrid");
        var sltIdx = grid.select().index();
        var data = grid.dataSource.view();
        dlvSltVal = data[sltIdx].ordTp;
    }

    //주문사유
    if(dlvSltVal == 'AD' || dlvSltVal == 'AS' || dlvSltVal == 'N1'||  dlvSltVal == 'N8' || dlvSltVal == 'N9'){
    	deliveryRetlTp = 'P1';
    }else if(dlvSltVal == 'C1'){
    	deliveryRetlTp = 'D1';
    }else if(dlvSltVal == 'N5' || dlvSltVal == 'NS'){
    	deliveryRetlTp = 'D2';
    }else if(dlvSltVal == 'N7' ){
    	deliveryRetlTp = 'D3';
    }else if(dlvSltVal == 'C3' || dlvSltVal == 'N6'){
    	deliveryRetlTp = 'D4';
    }else if(dlvSltVal == 'C4' ){
    	deliveryRetlTp = 'F1';
    }else if(dlvSltVal == 'C6' || dlvSltVal == 'C9' || dlvSltVal == 'N3'|| dlvSltVal == 'NB'){
    	deliveryRetlTp = 'F2';
    }else if(dlvSltVal == 'N4' ){
    	deliveryRetlTp = 'F4';
    }else if(dlvSltVal == 'C2' || dlvSltVal == 'C7' || dlvSltVal == 'C8'|| dlvSltVal == 'N2'){
    	deliveryRetlTp = 'F5';
    }else {
    	deliveryRetlTp = 'F1';
    }

    if(dlvSltVal == '' || dlvSltVal == null){
    	deliveryRetlTp = ''	;
    }
}

/**
 * 원샷개폐조회
 **/
function srchOneShotChk() {
    var responseJson = 1;

    $.ajax({
        url:"<c:url value='/sal/dlv/contDeliveryCanc/selectOneShotChkSearch.do' />",
        dataType:"json",
        type:"POST",
        contentType:"application/json",
        data:JSON.stringify({"sDlrCd":null}),
        async:false,
        error:function(jqXHR,status,error){
            if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors);
            }else{
                dms.notification.error(error);
            }
        },
        success:function(jqXHR, textStatus){
            responseJson = jqXHR;
        }
    });

    return responseJson;
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var responseJson = {};

    if(responseJson != null && responseJson.total == 1){
        $("#sContractCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vsContractCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "closeYn":"Y"
                    , "custNm":$("#vContractCustNm").val()
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#vContractCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

// Lock종류
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

//출고처리.
function callDelivery(saveData, submitVin){
    var msg = "<spring:message code='sal.info.deliveryConfirm' />";
    // VIN()출고하시겠습니까?
    dms.window.confirm({
        message:"VIN( "+ submitVin +" ) " + msg
        ,title :"<spring:message code='global.lbl.info' />"
        ,callback:function(result){
            if(result){
                dms.loading.show();
                   $.ajax({
                       url:"<c:url value='/sal/dlv/contDelivery/vehicleContDelivery.do' />",
                       dataType:"json",
                       type:"POST",
                       contentType:"application/json",
                       data:JSON.stringify(saveData),
                       error:function(jqXHR,status,error){
                           dms.loading.hide();
                           if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                               dms.notification.error(jqXHR.responseJSON.errors);
                           }else{
                               dms.notification.error(error);
                           }
                       },
                       success:function(jqXHR, textStatus){
                           dms.loading.hide();
                           //console.log(jqXHR);
                           //console.log(textStatus);
                           /* if(!jqXHR){ //判断是否是新能源车或补贴是否通过返回false,提示"该车辆不是新能源车或补贴申请审核未被审核通过"
                        	   dms.notification.warning("<spring:message code='sal.info.subsidies' />");
                        	   
                           }else{
	                           dms.notification.success("<spring:message code='global.info.success' />");
                           } *///flag 标识  01：正常出库 、 04：当前新能源车辆申请审核中 、03：审核通过正常出库 、 05：审核作废重新申请提报  02：未作补贴申请
                           if(jqXHR=='01'){
                        	   dms.notification.success("<spring:message code='global.info.success' />");
                               return true;
                           }else if(jqXHR=='02'){
                        	   dms.notification.warning("<spring:message code='sal.menu.newEnergyCanNotWithOutApply' />");
                               return false;
                           }else if(jqXHR=='03'){
                        	   dms.notification.success("<spring:message code='global.info.success' />");
                               return true;
                           }else if(jqXHR=='04'){
                        	   dms.notification.warning("<spring:message code='sal.menu.newEnergyCanNotDuringApply' />");
                        	   return false;
                           }
                           else if(jqXHR=='05'){
                        	   dms.notification.warning("<spring:message code='sal.menu.newEnergyApplicaAgain' />");
                        	   return false;
                           }

                           $("#grid").data('kendoExtGrid').dataSource.filter([]);
                           //$('#grid').data('kendoExtGrid').dataSource.page(1);

                           $('#vehicleGrid').data('kendoExtGrid').dataSource.data([]);
                       }
                   });
            }else{
                return false;
            }
        }
    });
}


// 영수증 여부 메시지
function receiptChkMsg(saveExcpData){
    popupWindow2 = dms.window.popup({
        windowId :"messagePopup2"
        ,title:"<spring:message code='global.lbl.info' />"
        ,width:300
        ,height:110
        ,modal:true
        ,content :{
            url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup2.do' />"
            ,data :{
                "type" :null
                ,"autoBind" :false
                , msg :"<spring:message code='sal.info.receiptChkMsg' />"
                , btnMsg01 :"<spring:message code='global.btn.confirm' />"
                , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                ,"callbackFunc" :function(data){
                    if(data.msg == "01"){
                        callExceptionDelivery(saveExcpData);
                    }else{
                        return false;
                    }
                }
            }
        }
    });
}

//이상출고처리
function callExceptionDelivery(saveExcpData){

    dms.window.confirm({
        message:"<spring:message code='sal.info.evalcnfrmMsg' />"
        ,title :"<spring:message code='global.lbl.info' />"
        ,callback:function(result){
            if(result){
                $.ajax({
                    url:"<c:url value='/sal/dlv/contDelivery/exceptionDelivery.do' />",
                    dataType:"json",
                    type:"POST",
                    contentType:"application/json",
                    data:JSON.stringify(saveExcpData),
                    error:function(jqXHR,status,error){
                        if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }else{
                            dms.notification.error(error);
                        }
                    },
                    success:function(jqXHR, textStatus){
                        //강제판매출고 신청이 정상적으로 처리 되였습니다.
                        //dms.notification.success("<spring:message code='sal.info.exceptionDeliverySuccessMsg' />");
                        
                        if(jqXHR=='01'){
                        	dms.notification.success("<spring:message code='sal.info.exceptionDeliverySuccessMsg' />");
                            return true;
                        }else if(jqXHR=='02'){
                     	    dms.notification.warning("<spring:message code='sal.menu.newEnergyCanNotWithOutApply' />");
                            return false;
                        }else if(jqXHR=='03'){
                        	dms.notification.success("<spring:message code='sal.info.exceptionDeliverySuccessMsg' />");
                            return true;
                        }else if(jqXHR=='04'){
                     	    dms.notification.warning("<spring:message code='sal.menu.newEnergyCanNotDuringApply' />");
                     	    return false;
                        }
                        else if(jqXHR=='05'){
                     	    dms.notification.warning("<spring:message code='sal.menu.newEnergyApplicaAgain' />");
                     	    return false;
                        }
                        $("#btnSearch").click();
                    }
                });
            }else{
                return false;
            }
        }
    });
}

//계약정보상세 조회
function fn_contractLink(contractNo){

    var windowHeight = $(window).innerHeight();
    var vHeight = 0;
    if(windowHeight >= 870){
        vHeight = 770;
    }else if(windowHeight >= 800){
        vHeight = 625;
    }else if(windowHeight >= 580){
        vHeight = 500;
    }else{
        vHeight = 450;
    }

    var sDlrCd = dlrCd
      , sContractNo = contractNo;

    mainPopupWindow = dms.window.popup({
        windowId:"contractMntPopup"
        ,title:"<spring:message code='sal.title.retailContractOrd' />"      // 계약관리
        //,width :950
        ,width :1100
        ,height:vHeight
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/cnt/contractMnt/selectContractMntPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sDlrCd":sDlrCd                   // 딜러코드
                ,"sContractNo":sContractNo         // 딜러명
                ,"sStatCd":"900"                   // 팝업 조회만
                ,"callbackFunc":function(data){
                    if (data.msg == "save"){

                        //$('#contGrid').data('kendoExtGrid').dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        //dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                 }
            }
        }
    });
}

</script>
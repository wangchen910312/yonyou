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
            <dms:access viewId="VIEW-D-10771" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnDelivery"><spring:message code="global.btn.deliveryHandle" /><!-- 인도처리 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-10770" hasPermission="${dms:getPermissionMask('READ')}">
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
			            </tr>
			        </tbody>
			    </table>
			</div>
			<!-- 고객정보 끝 -->

			<div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.contDeliveryInfo' /></h2><!-- 출고정보 -->
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
			        	<tr>
			        		<td colspan="2" rowspan="2" class="al">
                                <dms:access viewId="VIEW-D-10769" hasPermission="${dms:getPermissionMask('READ')}">
    			        			<button type="button" id="btnRfidScan" name="btnRfidScan" class="btn_s btn_s_v4 preChk btn_active_warning" style="margin-left:10px;height:40px;">
    			        				<spring:message code="sal.lbl.scanCertificate" />
    			        			</button><!-- 합격증스캔 -->
                                </dms:access>
			        		</td>
			        		<th scope="row"><spring:message code='global.lbl.rfid' /></th><!-- RFID NO -->
                            <td>
                                <input id="rfidNo" name="rfidNo" class="form_input form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                            <td >
                                <input id="vinNo" type="text" class="form_input form_readonly" readonly>
                            </td>
			            </tr>
			            <tr>
			            	<td colspan="2" ></td>
			                <th scope="row"><spring:message code='sal.excpDeliveryReason' /></th><!-- 이상신청사유 -->
			                <td >
			                    <input id="fceSaleReqReasonCd" name="fceSaleReqReasonCd" class="form_comboBox" >
			                </td>
				            <td colspan="4" class="ar">
	                             <%-- <button class="btn_xs" id="btnExceptionDlv"><spring:message code='global.btn.exceptionDelivery' /></button> --%>
	                             <%-- <button type="button" id="btnExceptionDlv" class="btn_s btn_s_v2"><spring:message code="global.btn.exceptionDelivery" /></button> --%><!-- 이상출고처리 -->
	                         </td>
	                    </tr>
			        </tbody>
			    </table>
			</div>
			<!-- 고객정보 끝 -->
			<div class="workProgress_manage">
                <div class="top_area">
                    <div class="btn_right mt5">
                        <dms:access viewId="VIEW-D-10768" hasPermission="${dms:getPermissionMask('READ')}">
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

<OBJECT
id=TULMReader
codebase="ULMReaderProj1.ocx"
classid="clsid:9B5B1F60-6EB2-4246-801A-F059114D1D45"
width=0
height=0
align=center
hspace=0
vspace=0
>
</OBJECT>


<script type="text/javascript">

var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nowMonth = "${nowMonth}";   // 현재월
var toDay = "${toDay}";         // 오늘날짜

var popupWindow;
var carlineCd,modelCd,ocnCd,extColorCd,intColorCd;
var getBrowserType = dms.browser.getBrowserType();
var btnRfidActi = "false";
var scanYn = "false";
var contractRetlTp;
var deliveryRetlTp;
var contractVinNo;
var selectedRfidNo = "";

var v_crcReqYn = "";

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";

//강제판매처리신청사유 Array(SAL153)
var fceSaleReqReasonCdDs = [];
<c:forEach var="obj" items="${fceSaleReqReasonCdList}">
    fceSaleReqReasonCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//강제판매처리신청사유 Map
var fceSaleReqReasonCdMap = dms.data.arrayToMap(fceSaleReqReasonCdDs, function(obj){ return obj.cmmCd; });

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
    <c:if test="${obj.cmmCd ne 'E' and obj.cmmCd ne 'S' and obj.cmmCd ne 'C0'}">
        reqStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
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

    //강제판매신청사유
    $("#fceSaleReqReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:fceSaleReqReasonCdDs
        ,optionLabel:" "
    });

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
        	$("#modelCdNm").val("");
        	$("#ocnCdNm").val("");
        	$("#contractVinNo").val("");
        	$("#saleEmpNo").data("kendoExtDropDownList").value("");
        	$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");

        	//합격증스캔 버튼.
        	//$("#btnRfidScan").removeClass("btn_active_warning");
    		//$("#btnRfidScan").addClass("ico_active_normal");
    		btnRfidActi = "false";
    		scanYn = "false";

    		$("#vinNo").val("");
    		$("#rfidNo").val("");
    		$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");

    		$("#grid").data('kendoExtGrid').dataSource.filter([]);
            $('#grid').data('kendoExtGrid').dataSource.page(1);

            $('#vehicleGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });

    // RFID 스캔 버튼
    $("#btnRfidScan").kendoButton({
        click:function(e){
            scanYn = "false";

            if(getBrowserType == 'msie'){
                var sTagNo = "";


                sTagNo = TULMReader.OpenUSB();

                if(sTagNo == '30'){
                    //스캐너를 설치해주세요.[请先插入扫码机]
                	dms.notification.warning("<spring:message code='sal.info.scanerInstall' />");
                    TULMReader.CloseUSB();
                	return false;
                }else if (sTagNo == "00") {

                	//차량그리드
                    var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
                    var sltIdx = vehicleGrid.select().index();
                    var vehicleData = vehicleGrid.dataSource.view();
                    var selectVehicleVal = vehicleData[sltIdx];

                    /* if(dms.string.isEmpty($("#contractVinNo").val()) && sltIdx == -1){
                    	// 재고차량이 없거나, 차량을 선택하지 않았습니다.[无库存车辆或未选择车辆。]
                        dms.notification.warning("<spring:message code='sal.info.selectVehicle' />");
                        TULMReader.CloseUSB();
                        return false;
                    } */

                    /* if(sltIdx != -1){
                    	if(selectVehicleVal.blockYn == "Y"){
                    		//스캔한 VIN이 블럭되었음.재고관리화면에서 설정하시기 바랍니다.[扫描的VIN为锁定状态，请到库存管理画面设置]
                    		dms.notification.warning("<spring:message code='sal.info.scanVinIsBlock' />");
                    		TULMReader.CloseUSB();
                    		return false;
                    	}else if(selectVehicleVal.cmpCarYn == 'Y'){
                    		//스캔한 VIN은 회사차입니다.정말 출고하시겠습니까?[您扫描的是公司车，确定要出库码?]
                    		dms.notification.warning("<spring:message code='sal.info.scanVinIsCmpCar' />");
                    		TULMReader.CloseUSB();
                    		scanYn = "true";
                    		return false;
                    	}
                    } */

                    TULMReader.CloseRF();
                    TULMReader.OpenRF();
                    sTagNo = TULMReader.ULMQuery();

                    if(sTagNo == '20'){
                    	//스캔할 RFID가 없습니다.[没有要扫码的RFID]
                        dms.notification.warning("<spring:message code='sal.info.noScanRfid' />");
                    }else {
                        //$("#rfidNo").val(sTagNo);       // test용 임시
                        $("#vinNo").val("");

                        vehicleGrid.clearSelection();     // grid 선택 clear : TOBE - 주석해제

                        if(vehicleData.length != 0){
                        	$.each(vehicleData, function(idx, obj){
                            	if(sTagNo == obj.rfidNo){
                            	    $("#rfidNo").val(sTagNo);

                            	    $("#vinNo").val(obj.vinNo);

                            	    scanYn = "true";
                            	    // 기기로 등록한 RFID를 선택해준다. TOBE : 주석해제
                            		vehicleGrid.select("tr[data-uid='" + obj.uid + "']");
                            	}
                            });
                        }
                    }

                    TULMReader.CloseRF();
                    TULMReader.CloseUSB();
                } else {
                    sTagNo = '';
                    TULMReader.CloseUSB();
                }

            }else {
                //IE브라우저에서만 스캔 가능합니다.
                dms.notification.info("<spring:message code='sal.info.ieBrowserCanScan' />");
            }

        }
    })

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

            /* if ( dms.string.isEmpty($("#rfidNo").val()) && scanYn == "false"){
               	//합격증을 스캔해주세요.[请扫下RFID NO]
               	dms.notification.warning("<spring:message code='sal.lbl.scanRfidNo'/>");
                   $("#rfidNo").focus();
                   return false;
               } */
            /* //이상출고처리 대상이 아닙니다.
            dms.notification.warning("<spring:message code='sal.info.notExcpDeliveryTarget'/>"); */

			if(selectVehicleVal.expAprYn == 'Y'){
            	// 이상출고처리 승인된 VIN이므로 바로 출고 가능합니다.[异常出库申请通过的VIN可直接出库。]
                dms.notification.warning("<spring:message code='sal.info.excpDeliveryDirectOutstock'/>");
        		return false;

            }else {
            	if(dms.string.isEmpty($("#fceSaleReqReasonCd").val())){
                	//신청사유를 선택 해주세요.[请选择申请事由]
                	dms.notification.warning("<spring:message code='sal.info.selectFceSaleReason'/>");
                    $("#fceSaleReqReasonCd").focus();
                }else {

                    var saveExcpData = {
                            contractNo:$("#contractNo").val()
                            ,vinNo1:selectVehicleVal.vinNo1
                            ,vinNo2:selectVehicleVal.vinNo2
                            ,fceSaleReqReasonCd:$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value()
                            ,rfidNo:$("#rfidNo").val()
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
                                            callExceptionDelivery(saveExcpData);

                                        }else{
                                            return false;
                                        }
                                    }
                                }
                            }
                        });

                    }else{
                        callExceptionDelivery(saveExcpData);
                    }
                }
            }
        }
    });

    //버튼 - 인도처리
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

            /* if(dms.string.isEmpty($("#contractVinNo").val()) && sltIdx == -1){
                // 인도처리할 차량을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.car' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            } */

            /* if($("#vinNo").val() == "" && $("#contractVinNo").val() == "" ){
            	//출고할 VIN이 없습니다.[无出库车辆]
            	dms.notification.warning("<spring:message code='sal.info.selectVehicle' />");
                return false;
            } */

            //합격증스캔
            /* if ( selectVehicleVal.expAprYn != 'Y' && dms.string.isEmpty($("#rfidNo").val()) && scanYn == "false"){
            	//합격증을 스캔해주세요.[请扫下RFID NO]
            	dms.notification.warning("<spring:message code='sal.lbl.scanRfidNo'/>");
                return false;
            }else if ( dms.string.isEmpty($("#rfidNo").val()) && scanYn == "true"){
            	//RFID 미스캔. 이상출고신청을 먼저 해주세요.[RFID未扫描。请先进行异常出库申请。]
            	dms.notification.warning("<spring:message code='sal.info.noRfidScanExcpDelivery'/>");
                return false;
            } */

            if( dms.string.strNvl(selectVehicleVal.blockSaleAdvNo) != ""
                && dms.string.strNvl(selectVehicleVal.blockSaleAdvNo) != userId
            ){
                // 재고블락된 차량은 선택이 불가능합니다.
                dms.notification.warning("<spring:message code='sal.info.stockBlockMsg'/>");
                return false;
            }

            if(selectVehicleVal.skipYn != "Y"){
                if($("#rfidNo").val() != selectVehicleVal.rfidNo
                    && selectVehicleVal.expAprYn != 'Y'
                ){
                	//RFID가 일치하지 않습니다.이상출고신청처리를 먼저 해주세요.[请先进行异常出库申请。]
                	dms.notification.warning("<spring:message code='sal.info.selectExcpDeliveryReq'/>");
                    return false;
                }
            }

            /* //임시점용 VIN의 RFID NO.
            var contractRfidNo = selectVal.rfidNo;
            if(!dms.string.isEmpty($("#contractVinNo").val()) && contractRfidNo != $("#rfidNo").val()){
            	//RFID가 일치하지 않습니다.이상출고신청처리를 먼저 해주세요.[请先进行异常出库申请。]
            	dms.notification.warning("<spring:message code='sal.info.selectExcpDeliveryReq'/>");
                return false;
            }

            var rfidNo = selectVehicleVal.rfidNo;
            if(($("#rfidNo").val() != rfidNo || $("#rfidNo").val() != contractRfidNo) && selectVehicleVal.expAprYn != 'Y' ){
            	//출고할 RFID와 실제차량의 RFID가 일치하지 않습니다.[出库车辆RFID与库存车辆RFID不一致。]
            	dms.notification.warning("<spring:message code='sal.info.rfidNotMapping'/>");
                return false;
            } */

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
                    ,vinNo:$("#vinNo").val()
                    ,contractStatCd:"50"
                    ,ownStatCd:"A"       // 배정
                    ,carStatCd:"70"
                    ,retlTpCd:deliveryRetlTp
                    ,ssnCrnNo:selectVal.ssnCrnNo
                    ,saleEmpNo:$("#saleEmpNo").data("kendoExtDropDownList").value()
                    ,gubun:"D"
                    ,dlrCd:selectVal.dlrCd
                    ,rfidNo:selectVehicleVal.rfidNo
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
        gridId:"G-SAL-1023-152615"
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
        	/*
        	var dataItem = e.sender.dataItem(e.sender.select());
        	selectedRfidNo = dataItem.rfidNo;

            if(!dataItem.isNew()){
            	var selectedVal = this.dataItem(this.select());
                var contractNo = selectedVal.contractNo;

                $("#vinNo").val("");
                $("#rfidNo").val("");
                v_crcReqYn = "";
                if ( dms.string.isNotEmpty(contractNo) ) {

                	//$("#btnRfidScan").removeClass("btn_active_warning");
            		//$("#btnRfidScan").addClass("ico_active_normal");
            		btnRfidActi = "false";

                	//고객정보
                    $("#contractCustNm").val(selectedVal.contractCustNm);     		//고객명
                    $("#carlineCdNm").val(selectedVal.carlineCdNm);           		//차종
                    $("#modelCdNm").val(selectedVal.modelCdNm);				  		//모델
                    $("#contractVinNo").val(selectedVal.contractVinNo);       		//임시점용vin
                    $("#saleEmpNo").data("kendoExtDropDownList").value(selectedVal.saleEmpNo); //판매고문사번호
                    $("#carlineCdNm").val(selectedVal.carlineNm);			  		//차종
                    $("#ocnCdNm").val(selectedVal.ocnNm);				  			//OCN
                    $("#contractNo").val(selectedVal.contractNo);			  		//계약번호
                    $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");	//이상출고사유

                    carlineCd  = selectedVal.carlineCd;
                    modelCd    = selectedVal.modelCd;
                    ocnCd      = selectedVal.ocnCd;
                    extColorCd = selectedVal.extColorCd;
                    intColorCd = selectedVal.intColorCd;

                    contractVinNo = selectedVal.contractVinNo;

                    scanYn = "false";
                    getRetlTp("grid");

                    var responseJson = dms.ajax.getJson({
                         url:"<c:url value='/sal/dlv/contDelivery/selectContractExceptionStatYnSearch.do' />"
                        ,data :JSON.stringify({"sDlrCd":selectedVal.dlrCd, "sContractNo":contractNo})
                        ,async :false
                    });
                    if(!dms.string.isEmpty(responseJson)){
                        v_crcReqYn = dms.string.strNvl(responseJson);
                    }else{
                        v_crcReqYn = selectedVal.crcReqYn;
                    }
                    $("#vehicleGrid").data('kendoExtGrid').dataSource.filter([]);
                    //$('#vehicleGrid').data('kendoExtGrid').dataSource.page(1);
                }
            }
            */

            var dataItem = e.sender.dataItem(e.sender.select());
            fn_contOnLoad(dataItem);
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
                           str += "</span>";
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
                    selectedRfidNo = jqXHR.data[0].rfidNo;

                    $("#vinNo").val("");
                    $("#rfidNo").val("");
                    v_crcReqYn = "";
                    if ( dms.string.isNotEmpty(jqXHR.data[0].contractNo) ) {
                        $("#contractCustNm").val(jqXHR.data[0].contractCustNm);           //고객명
                        $("#carlineCdNm").val(jqXHR.data[0].carlineCdNm);                 //차종
                        $("#modelCdNm").val(jqXHR.data[0].modelCdNm);                     //모델
                        $("#contractVinNo").val(jqXHR.data[0].contractVinNo);             //임시점용vin
                        $("#saleEmpNo").data("kendoExtDropDownList").value(jqXHR.data[0].saleEmpNo); //판매고문사번호
                        $("#carlineCdNm").val(jqXHR.data[0].carlineNm);                   //차종
                        $("#ocnCdNm").val(jqXHR.data[0].ocnNm);                           //OCN
                        $("#contractNo").val(jqXHR.data[0].contractNo);                   //계약번호
                        $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");    //이상출고사유

                        carlineCd  = jqXHR.data[0].carlineCd;
                        modelCd    = jqXHR.data[0].modelCd;
                        ocnCd      = jqXHR.data[0].ocnCd;
                        extColorCd = jqXHR.data[0].extColorCd;
                        intColorCd = jqXHR.data[0].intColorCd;

                        contractVinNo = jqXHR.data[0].contractVinNo;
                        scanYn = "false";
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
        gridId:"G-SAL-1023-192605"
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
                       ,fcesaleReqReasonCd:{ type:"string"}
                       ,reqStatCd	:{ type:"string"}
                       ,expAprYn	:{ type:"string"}
                       //,crcReqYn     :{ type:"string"}
                       ,receiptNo   :{ type:"string"}
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
            	//$("#btnDelivery").data("kendoButton").enable(false);
            	$("#btnExceptionDlv").data("kendoButton").enable(false);
            }else {
            	//선택된 계약정보와 차량정보의 RFID 번호와 같은 목록을 선택한다.
            	//if(!dms.string.isEmpty(selectedRfidNo) && dms.string.isEmpty($("#rfidNo").val())){
          	    if(dms.string.strNvl(v_crcReqYn) === "Y"){
           			var vehicleGrid = this;
                   	var vehicleList = vehicleGrid.dataSource.view();
                 	$.each(vehicleList, function(idx, obj){
                    	if(selectedRfidNo == obj.rfidNo){
                       		if(obj.rfidNo != "NONE_RFID"){
                       			// 기기로 등록한 RFID를 선택해준다. TOBE : 주석해제
                       		    vehicleGrid.select("tr[data-uid='" + obj.uid + "']");
                       		}
                       	}
                 	});
            	}
            }


        }
        , change:function(e) {

        	if(this.select().length != 0){
	            var selectedVal = this.dataItem(this.select());
				var vinNo = selectedVal.vinNo;
				var blockYn = selectedVal.blockYn;

			    if ( dms.string.isNotEmpty(vinNo) ) {

				   	if($("#rfidNo").val() == selectedVal.rfidNo ){
				   		//$("#btnDelivery").data("kendoButton").enable(true);
				   		$("#btnExceptionDlv").data("kendoButton").enable(false);
				   	}else {
				   		//$("#btnDelivery").data("kendoButton").enable(false);
				   		$("#btnExceptionDlv").data("kendoButton").enable(true);
				   	}

				   	if(dms.string.strNvl(selectedVal.vinNo) != $("#contractVinNo").val()){

	                    var msg = ""
	                      , blockChk = dms.string.strNvl(selectedVal.blockSaleAdvNo)
	                      , damageChk = dms.string.strNvl(selectedVal.damageCd)
	                      , ownStatChk = dms.string.strNvl(selectedVal.ownStatCd)
	                      //, expAprYn = dms.string.strNvl(selectedVal.expAprYn)
	                      , msgFlag = false;

	                    if(blockChk != "" && blockChk != userId){
	                        msgFlag = true;
	                        vinNo = "";
	                        msg += "<spring:message code='sal.info.stockBlockMsg'/>";
	                    }

	                    if(damageChk == "01"){
	                        msgFlag = true;
	                        vinNo = "";
	                        if(msg.length > 0){
	                            msg += "<br />"+ "<spring:message code='sal.info.damageBlocksMsg'/>";
	                        }else{
	                            msg += "<spring:message code='sal.info.damageBlocksMsg'/>";
	                        }
	                    }

	                    if(ownStatChk == "A"){
	                        msgFlag = true;
	                        vinNo = "";
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
	                                $('#vehicleGrid').data('kendoExtGrid').dataSource.page(1);
	                            }
	                        });
	                    }
				   	}

/*
				   	if(selectedVal.blockYn == 'N' && selectedVal.expAprYn == 'Y'){
				   		$("#btnDelivery").data("kendoButton").enable(true);
				   	}else {
				   		$("#btnDelivery").data("kendoButton").enable(false);
				   	}
 */
				   	if(blockYn == 'N'){
				   		//btn_active_normal --연두
				   		//btn_active_warning -- 노랑
				   		//btn_active_error -- 빨강
				   		//btn_active -- 파랑
				   		//$("#btnRfidScan").addClass("btn_active_warning");
				   		//$("#btnRfidScan").removeClass("ico_active_normal");
				   		btnRfidActi = "true";
				   		//$("#btnDelivery").data("kendoButton").enable(true);
				   		//$("#btnExceptionDlv").data("kendoButton").enable(true);


				   	}else {
				   		//$("#btnRfidScan").removeClass("btn_active_warning");
				   		//$("#btnRfidScan").addClass("ico_active_normal");
				   		btnRfidActi = "false";
				   		//$("#btnDelivery").data("kendoButton").enable(false);
				   		//$("#btnExceptionDlv").data("kendoButton").enable(false);

				   	}

				   	$("#vinNo").val(vinNo);

				    if(scanYn != "true"){
				        $("#rfidNo").val("");
				    }

					$("#fceSaleReqReasonCd").data("kendoExtDropDownList").value("");

				   	scanYn = "false";
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
        , height:335
        , columns:[  {field:"expAprYn"     	,title:"<spring:message code = 'sal.lbl.exceptionEvalStat'/>"	, width:80 ,attributes:{"class":"ac"}
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
                             if(!dms.string.isEmpty(dataItem.receiptNo)){
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

    //차량 RFID스캔 기능은 IE브라우저에서만 사용가능합니다.
    if(getBrowserType != "msie"){
        dms.window.confirm({
            message:"<spring:message code='sal.info.vehicleRfidMustMsie' />"
            ,title :"<spring:message code='global.lbl.info' />"
            ,displayCancelBtn:false
        });
    }

    //$("#btnDelivery").data("kendoButton").enable(false);

    //고객명변경시 고객아이디 삭제
    $("#vContractCustNm").keyup(function(key){
        if(key.keyCode != 13){
            $("#sContractCustNo").val("");
          }
    });

    //TO-DO LIST 에서 넘어올 경우 계약 번호 세팅 - 2017.06.06
    <c:if test="${sContractNo ne '' }" >
        $("#sContractNo").val("${sContractNo}");
        var grid = $("#grid").data("kendoExtGrid");
        grid.dataSource.page(1);
        //var data = {"sDlrCd":"${dlrCd}", "sContractNo":$("#sContractNo").val()}

    </c:if>

});


//소매유형 가져오기
function getRetlTp(gb){
    var conSltVal;
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
        conSltVal = data[sltIdx].contractOrdTp;
        dlvSltVal = data[sltIdx].deliveryOrdTp;

        if(conSltVal == 'AD' || conSltVal == 'AS' || conSltVal == 'N1'||  conSltVal == 'N8' || conSltVal == 'N9'){
        	contractRetlTp = 'P1';
        }else if(conSltVal == 'C1'){
        	contractRetlTp = 'D1';
        }else if(conSltVal == 'N5' || conSltVal == 'NS'){
        	contractRetlTp = 'D2';
        }else if(conSltVal == 'N7' ){
        	contractRetlTp = 'D3';
        }else if(conSltVal == 'C3' || conSltVal == 'N6'){
        	contractRetlTp = 'D4';
        }else if(conSltVal == 'C4' ){
        	contractRetlTp = 'F1';
        }else if(conSltVal == 'C6' || conSltVal == 'C9' || conSltVal == 'N3'|| conSltVal == 'NB'){
        	contractRetlTp = 'F2';
        }else if(conSltVal == 'N4' ){
        	contractRetlTp = 'F4';
        }else if(conSltVal == 'C2' || conSltVal == 'C7' || conSltVal == 'C8'|| conSltVal == 'N2'){
        	contractRetlTp = 'F5';
        }else {
        	contractRetlTp = 'P1';
        }

        if(conSltVal == '' || conSltVal == null){
        	contractRetlTp = ''	;
        }

    }

    //취소사유
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

    var sCtrlGrpCd = 'Y'
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/dlv/contDeliveryCanc/selectOneShotChkSearch.do'/>"
        ,data:JSON.stringify({"sDlrCd":sCtrlGrpCd})
        ,async:false
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

// 출고처리.
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
                           //정상적으로 반영되였습니다.
                           dms.notification.success("<spring:message code='global.info.success' />");

                           $("#grid").data('kendoExtGrid').dataSource.filter([]);
                           $('#grid').data('kendoExtGrid').dataSource.page(1);

                           $('#vehicleGrid').data('kendoExtGrid').dataSource.data([]);
                       }
                   });
            }else{
                return false;
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
                        dms.notification.success("<spring:message code='sal.info.exceptionDeliverySuccessMsg' />");
                        $("#btnSearch").click();
                    }
                });
            }else{
                return false;
            }
        }
    });
}

// 계약정보상세 조회
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
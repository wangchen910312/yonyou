<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

      <!-- 기본정보 -->
            <section class="group">
                <div class="header_area">
                 <h2 class="title_basic"><spring:message code='sal.lbl.requestInfo' /></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-13311" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_m" id="btnCustSave"><spring:message code="global.btn.approvalRequest" /></button> <!-- 저장 -->
            		</dms:access>
                        	<%-- <button class="btn_m" id="btnClose" ><spring:message code='global.btn.cancel' /></button> --%>
                        <!-- 조회
                        <button type="button" class="btn_m btn_search" id="btnCustSearch"><spring:message code="global.btn.search" /></button>
                        -->
                        <input type="hidden" id="btnCustSearch" />
                    </div>
                </div>
			<div id="customerForm" name="customerForm" onsubmit="return false;">
			<div id="personalDiv" class="personalDiv">
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                         <tr>
                         		<th scope="row"><spring:message code="sal.lbl.ApplicationNumber" /></th> <!-- 증거번호 -->
                                <td class="readonly_area">
                                    <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" readonly class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.ChargingPile" /></span></th> <!-- 고객유형 개인/법인-->
                                <td id = "custTp_td">
                                    <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
                                </td>
                                  <th scope="row"><spring:message code="sal.info.vin" /></th> <!-- 성별 -->
                                <td class="readonly_area">
                                    <input id="sexCd" name="sexCd"  class="form_input form_readonly "  readonly  data-json-obj="true" />
                                </td>
                                
                            </tr>
                            <tr>
                               
                                <th scope="row"><spring:message code="sal.lbl.ocnNm" /></th> <!-- 车型 -->
                                <td class="readonly_area">
                                    <input id="carModel" name="carModel"  class="form_input form_readonly "  readonly  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.perName" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="custNo" name="custNo" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                    <input id="pageMode" name="pageMode" type="hidden" value="insertMode" readonly data-json-obj="true" />
                                    <input type="hidden" id="docId" name="docId" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.menu.ownerContactTel" /></th> <!-- 잠재/보유고객 -->
                                <td class="readonly_area">
                                    <input id="custCd" name="custCd" class="form_input form_readonly " readOnly data-json-obj="true" />
                                    <input id="mngScId" name="mngScId" type="hidden" value="" class="form_input"  readonly data-json-obj="true" />
                                </td>
                            </tr>
                           <tr >
                                <!-- 开票日期  R19073101692 设置为必填项 贾明2019-7-31  -->
                                <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.recpDt" /></span></th> <!-- 开票日期 -->
		                        <td id = "date_td">
		                            <div >
		                                <div >
		                                    <input id="invoiceDateSta" class="form_datepicker" />
		                                </div>
		                            </div>
		                        </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
					<!-- 中间地址框回显 -->
                <div class="table_form form_width_100per mt5" style="display:none">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.sung" /></th> <!-- 이메일 -->
                                <td class="readonly_area">
                                    <input id="emailNm" name="emailNm"  value="" class="form_input"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.city" /></th> <!-- wechat id -->
                                <td class="readonly_area">
                                    <input id="wechatId" name="wechatId" type="text" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.distNm" /></th> 
                                <td class="readonly_area">
                                    <input id="qqId" name="qqId" type="text" class="form_input"/>
                                </td> 
                            </tr>
                           <tr >
                                <th scope="row"><spring:message code="crm.lbl.addrDetlCont" /></th> <!-- 회사전화 -->
                                <td colspan="2" class="readonly_area">
                                    <input id="officeTelNo" name="officeTelNo" type="text" class="form_input" data-json-obj="true" />
                                </td>
                            </tr>
                     </tbody>
                    </table>
                </div>

</div>  <!-- PersonalDiv End-->
<div id="corporateDiv" class="corporateDiv" style="display:none"> <!-- corporateDiv Start -->
                <div class="table_form form_width_100per" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.ChargingPile" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTpC" name="custTpC" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.ShopName" /></span><!-- 회사명 --></th>
                                <td class="required_area">
                                    <input id="custNmC" name="custNmC" type="text" value="" class="form_input"  maxlength="30" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.perName" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="custNoC" name="custNoC" type="text" value="" class="form_input form_readonly " readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carVinNum" /></th> <!-- 잠재/보유고객 -->
                                <td class="readonly_area">
                                    <input id="custCdC" name="custCdC" class="form_comboBox form_readonly " readOnly data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.defaultInfo' /></h2> <!-- 기본정보 -->
                </div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMng" /></span></th> <!-- 구매담당자명 -->
                                <td>
                                    <input id="purcMngNm" name="purcMngNm" type="text" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                                <td>
                                    <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                                <td>
                                    <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input getCustMathDocDupByKey" maxlength="30" data-json-obj="true" style="text-transform: uppercase" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.custSourceLocation" /></th> <!-- 정보출처 -->
                                <td>
                                    <input id="custHoldTpC" name="custHoldTpC" class="form_comboBox" data-json-obj="true" />
                                    <div class="form_float" style="display:none;">
                                        <div class="form_right">
                                            <input id="custHoldTpDtlC" name="custHoldTpDtlC" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.taxpayerNo" /></th> <!-- 납세인식별번호 -->
                                <td>
                                    <input id="taxpayerNo" name="taxpayerNo" class="form_input numberandalpha" maxlength="40" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                                <td class="readonly_area">
                                    <input id="mngScNmC" name="mngScNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngScIdC" name="mngScIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecNmC" name="mngTecNmC" type="text" value="" class="form_input"  readonly />
                                    <input id="mngTecIdC" name="mngTecIdC" type="hidden" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per mt5">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMngHpno" /></span></th> <!-- 구매담당자이동전화 -->
                                <td>
                                    <input id="hpNoC" name="hpNoC" type="text" class="form_input numberic getCustDupByKey" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 대표전화 --></th>
                                <td>
                                    <input id="officeTelNoC" name="officeTelNoC" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNoC" name="officeFaxNoC" type="text" value="" class="form_input numberic"  data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td>
                                    <input id="emailNmC" name="emailNmC" type="email" value="" class="form_input form_email" maxlength="40" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                <td>
                                  <input id="bizcondCdC" name="bizcondCdC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                <td>
                                  <input id="cmpScaleContC" name="cmpScaleContC" class="form_input"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                                <td>
                                  <input id="cmpTpC" name="cmpTpC" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th></th>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                                <td colspan="3">
                                  <select id="custGroupsC" name="custGroupsC" multiple="multiple" ></select>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                                <td colspan="3">
                                  <select id="custTagsC" name="custTagsC" multiple="multiple" ></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
</div>  <!-- corporateDiv End -->
                <!-- 安装地址选择 -->
                <section class="group">
                    <%-- <div class="header_area">
                        <h2 class="title_basic"><spring:message code='sal.lbl.installationAddress' /></h2><!-- 安装地址 -->
                        <div class="btn_right">
                                <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 -->
                                <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 -->
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="addrGrid"></div>
                    </div> --%>
                    <!-- 省市区三级联动地址 -->
                    <div class="header_area" style="margin-top: 15px;">
	                    <h2 class="title_basic"><spring:message code='sal.lbl.installationAddress' /></h2><!-- 安装地址 -->
                    </div>
                    <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                         	<tr>
                         		<th scope="row"><span class="bu_required"><spring:message code="par.lbl.sung" /></span></th> <!-- 省 -->
                                <td id = "sheng_td">
                                    <input id="sheng"  class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="par.lbl.city" /></span></th> <!--市-->
                                <td id = "shi_td">
                                    <input id="shi"  class="form_comboBox" data-json-obj="true" />
                                </td>
                                 <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.distNm" /></span></th> <!-- 区 -->
                                <td id = "qu_td">
                                    <input id="qu" class="form_comboBox" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.addrDetlCont" /></span></th> <!-- 详细地址 -->
                                <td id = "address_td" colspan="5">
                                    <input id="detailedAddress" maxlength="60" class="form_input"data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                    
                </section>
                
                
       <!-- 充电桩返回状态数据列表  -->
       <div class="header_area">
          	<h2 class="title_basic"><spring:message code='global.lbl.evalRslt' /></h2> <!-- 审批结果 -->
       </div>
		<div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:13%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                         <tr>
                         		<th scope="row"><spring:message code="sal.info.ExecutionStatus" /></th> <!-- 状态 -->
                                <td class="readonly_area">
                                    <input id="sta" name="sta" type="text" value="" readonly class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.info.ExecutionDate" /></th> <!-- 日期-->
                                <td class="readonly_area">
                                    <input id="inDate" name="inDate" class="form_input" data-json-obj="true" />
                                </td>
                                 <th scope="row"><spring:message code="sal.lbl.serviceProvider" /></th> <!-- 服务商名称 -->
                                <td class="readonly_area">
                                    <input id="serviceNm" name="serviceNm" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.info.ServiceProvider" /></th> <!-- 联系人 -->
                                <td class="readonly_area">
                                    <input id="contact" name="contact" class="form_input form_readonly " readOnly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.info.ContactNumber" /></th> <!-- 联系电话 -->
                                <td class="readonly_area">
                                    <input id="mobile" name="mobile"  class="form_input form_readonly "  readonly  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.info.ServiceMailbox" /></th> <!-- 邮箱 -->
                                <td class="readonly_area">
                                    <input id="email" name="email"  class="form_input form_readonly "  readonly  data-json-obj="true" />
                                </td>
                               
                            </tr>
                            <tr>
                            	<th scope="row"><spring:message code="crm.lbl.remark" /></th> <!-- 备注 -->
                                <td class="readonly_area" colspan="5">
                                    <input id="remark" name="sexCd"  class="form_input form_readonly "  readonly  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


      <!-- 고객 연계인 정보 -->
       <section class="group" style="display:none;">
          <div class="header_area">
              <h2 class="title_basic"><spring:message code="global.title.relCustInfo" /></h2> <!-- 고객 연계인 정보 -->
              <div class="btn_right">
                    <button class="btn_s btn_save" id="btnSaveRelCustGrid" ><spring:message code="global.btn.save" /></button> <!-- 연계인저장 -->
                    <button class="btn_s btn_add" id="btnAddRelCust" ><spring:message code="global.btn.rowAdd" /></button> <!-- 연계인행추가 -->
                    <button class="btn_s btn_del" id="btnDelRelCust" ><spring:message code="global.btn.rowDel" /></button> <!-- 연계인행삭제 -->
              </div>
          </div>
          <div class="table_grid">
            <div id="gridRel"></div>
          </div>
      </section>

      <!-- //고객 연계인 정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
//开票日期
$("#invoiceDateSta").kendoExtMaskedDatePicker({
    format :"<dms:configValue code='dateFormat' />"
    ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
});
/*************************************************************
 데이터 셋업
*************************************************************/
    //上层列表数据代入窗口展示回显
    
	var options = parent.mainPopupWindow.options.content.data;
	var installationNo = options.installationNo;
	
	$.ajax({
        url :"<c:url value='/sal/dlv/contDeliveryCanc/selectChargingPileList.do' />"
        ,data :JSON.stringify({"installationNo":installationNo})
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
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
            var options = jqXHR.data[0];
            $("#ssnCrnNo").val(options.installationNo); 
            $("#mngScNm").val(options.shopNo); 
        	$("#carModel").val(options.carModel);
        	$("#custNo").val(options.custName);
        	$("#custCd").val(options.custPhone);
        	$("#sexCd").val(options.vinNo);
        	$("#mathDocTp").val(options.state);
        	/* if(dms.string.isEmpty(options.installProvince)){
        	$("#sheng").data("kendoExtDropDownList").text("北京省");
        	} */
        	$("#sheng").data("kendoExtDropDownList").text(options.installProvince);
        	$("#shi").data("kendoExtDropDownList").text(options.installCity);
        	$("#qu").data("kendoExtDropDownList").text(options.installArea);
        	$("#detailedAddress").val(options.address);
        	
        	$("#sta").val(options.statusStr);//返回状态
        	$("#inDate").val(options.execDateStr);//日期
        	$("#serviceNm").val(options.company);//服务商名称
        	$("#contact").val(options.name);//联系人
        	$("#mobile").val(options.mobile);//联系人电话
        	$("#email").val(options.email);//邮箱
        	$("#remark").val(options.execRemark);//备注
        	
        	$("#mngScId").val(options.state);//状态 新建  提报   作废
        	
        	//根据数据状态添加只读属性
        	if(options.state != 01){
        		var combobox = $("#sheng").data("kendoExtDropDownList");
        		combobox.readonly(true);
        		var comboboxshi = $("#shi").data("kendoExtDropDownList");
        		comboboxshi.readonly(true);
        		var comboboxqu = $("#qu").data("kendoExtDropDownList");
        		comboboxqu.readonly(true);
        		var comboboxcustTp = $("#custTp").data("kendoExtDropDownList");
        		comboboxcustTp.readonly(true);
        		var datesta = $("#invoiceDateSta").data("kendoExtMaskedDatePicker")
        		datesta.readonly(true);
        		$('#btnCustSave').kendoButton({
        			enable: false
        		});
            	$('#sheng_td').addClass("readonly_area");
        		$('#shi_td').addClass("readonly_area");
        		$('#qu_td').addClass("readonly_area");
        		$('#detailedAddress').attr("readonly","readonly");
        		$('#address_td').addClass("readonly_area");
        		$('#date_td').addClass("readonly_area");
        		$('#custTp_td').addClass("readonly_area");
        	}
        	$("#invoiceDateSta").data("kendoExtMaskedDatePicker").value(options.invoiceDate);
        	$("#custTp").data("kendoExtDropDownList").value(options.isNeed);
        	 /* $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "flagYn"            :"Y"
                 , "sungNm"          :options.installProvince
                 , "cityNm"          :options.installCity
                 , "distNm"     	 :options.installArea
                 , "addrDetlCont"    :options.address
             }); */
        }
    });
    
    var popupWindow;
    var groupTxt;
    var tagTxt;
    var groupDS = [];
    var hobbyDS = [];
    var tagDS   = [];
    var custGroups = [];
    var custTags = [];
    var custHobbys = [];
    var custGroupsC = [];
    var custTagsC = [];

    var loginDlrCd              = "${dlrCd}"
    var custCollSrcCd           = "${custCollSrcCd}";
    var custTpList              = [];
    var custCdList              = [];
    var custHoldTpList          = [];
    var custHoldTpDtlList       = [];
    var sexCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var incomeLvlCdList         = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var mathDocTpListC          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var pconTpList              = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var addrTpList              = [];
    var ageCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var driverTpList            = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var jobCdList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var cmpTpList               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var acCareerCdList          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var marryYnList             = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var chgBuyYnDS              = [];
    var chgBuyYnMap              = [];
    var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var chinaZodiacSignCdDS     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var zodiacSignCdDS          = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var bloodTpDS               = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var dutyCdDS                = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    var prefCommMthCdMap        = [];
    var mathDocTpMap            = [];
    var mathDocTpMapC            = [];
    var pconTpMap               = [];
    var addrTpMap               = [];
    var prefContactMthCdMap     = [];
    var prefContactTimeCdMap    = [];
	
    chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
    chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";
	
    
    //省市区下拉选数据
    var provinceList = [];
    var cityList = [];
    var areaList = [];
    
    <c:forEach var="obj" items="${provinceList}">
    provinceList.push({"parentId":"${obj.valueText}", "parentName":"${obj.nameText}"});
    </c:forEach>
    
    <c:forEach var="obj" items="${cityList}">
    cityList.push({"cityValue":"${obj.valueText}", "cityName":"${obj.nameText}", "parentId":"${obj.parentId}"});
    </c:forEach>
    
    <c:forEach var="obj" items="${areaList}">
    areaList.push({"valueText":"${obj.valueText}", "nameText":"${obj.nameText}", "cityValue":"${obj.parentId}"});
    </c:forEach>
    
    <c:forEach var="obj" items="${purcCarBrandCdDS}">
    purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${chinaZodiacSignCdDS}">
    chinaZodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${zodiacSignCdDS}">
    zodiacSignCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${bloodTpDS}">
    bloodTpDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${dutyCdDS}">
    dutyCdDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    <c:forEach var="obj" items="${custTpList}"> 
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach> 

    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpList}">
    custHoldTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpDtlList}">
    custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCd}">
    prefContactMthCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCd}">
    prefContactTimeCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${incomeLvlCdList}">
    incomeLvlCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${mathDocTpList}">
        <c:if test="${obj.remark1 == 'P'}">
            mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>

        <c:if test="${obj.remark1 == 'C'}">
            mathDocTpListC.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            mathDocTpMapC["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${pconTpList}">
    pconTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    pconTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${addrTpList}">
        <c:if test="${obj.remark1 ne 'SA'}">
            addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${ageCdList}">
    ageCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${driverTpList}">
    driverTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${jobCdList}">
    jobCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpScaleContList}">
    cmpScaleContList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpTpList}">
    cmpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${acCareerCdList}">
    acCareerCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${marryYnList}">
    marryYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${avgCarChgCdList}">
    avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroups.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroupsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTagsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHobbys}">
    custHobbys.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    var defaultGroupCDatasourceSetting = function(e){
        groupDS = [];
        var selectedGroups = $("#custGroupsC").data("kendoMultiSelect").value();

        if(selectedGroups.length == 0){
            return;
        }

        $.each(custGroupsC, function(index, data){
            if(selectedGroups.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
            }
        });
    };

    var defaultTagCDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#custTagsC").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            return;
        }

        $.each(custTagsC, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });
    };


    var defaultHobbyDatasourceSetting = function(e){
        hobbyDS = [];
        var selectedHobbys = $("#custHobbys").data("kendoMultiSelect").value();

        if(selectedHobbys.length == 0){
            return;
        }

        $.each(custHobbys, function(index, data){
            if(selectedHobbys.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                hobbyDS.push({"grpSeq":data.grpSeq,"grpTp":"003"});
            }
        });
    };

    var defaultGroupDatasourceSetting = function(e){
        groupDS = [];
        var selectedGroups = $("#custGroups").data("kendoMultiSelect").value();

        if(selectedGroups.length == 0){
            return;
        }

        $.each(custGroups, function(index, data){
            if(selectedGroups.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
            }
        });
    };

    var defaultTagDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#custTags").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            return;
        }

        $.each(custTags, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });

    };

    function getCustDupByKey(idVal){
        var custTp = $("#custTp").data("kendoExtDropDownList").value();

        var custNm = $("#custNm").val();
        var custNo = $("#custNo").val();
        //var custCd = $("#custCd").data("kendoExtDropDownList").value();
        var hpNo = $("#hpNo").val();
        //var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
        var ssnCrnNo = $("#ssnCrnNo").val();
        var officeTelNo = $("#officeTelNoC").val();
        var oldCustNm = $("#oldCustNm").val();
        var oldHpNo = $("#oldHpNo").val();
        var oldMathDocTp = $("#oldMathDocTp").val();
        var chkContinued = false;
        // 법인연계인 (구매담당자)
        var purcMngNm = $("#purcMngNm").val();
        var hpNoC = $("#hpNoC").val();

        /* if ( dms.string.isEmpty(custCd) ) {
            custCd = "01";
        }

        if (custTp == "02") {
            custNm = $("#custNmC").val();
            if (hpNoC.length > 1 ) {
                hpNo = hpNoC;
                chkContinued = true;
            }
        } else {
            if (hpNo.length > 1 ) {
                chkContinued = true;
            }
        } */

        if (chkContinued){

            var param = {};
            param["sCustNo"]       = custNo;
            param["sCustCd"]       = custCd;   // 잠재
            param["sCustTp"]       = custTp;
            param["sCustNm"]       = custNm;

            param["sHpNo"]         = hpNo;
            param["sOfficeTelNo"]         = officeTelNo;
            param["sMathDocTp"]         = mathDocTp;
            param["sSsnCrnNo"]         = ssnCrnNo;
            param["sOldCustNm"]         = oldCustNm;
            param["sOldHpNo"]         = oldHpNo;
            param["sOldMathDocTp"]         = oldMathDocTp;


            $.ajax({
                //url:"<c:url value='/crm/cif/customerInfo/selectCustDupByKey.do' />"
                url:"<c:url value='/crm/cif/customerInfo/selectCustDupScreenByKey.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    //console.log(jqXHR.responseJSON);
                    dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){

                    if (result.total == 0 ){
                        dms.notification.info ("<spring:message code='global.info.ableToDo' />");
                    } else {
                        dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
    }

    function getCustMathDocDupByKey(idVal){

        var custTp = $("#custTp").val();

        var custNm = $("#custNm").val();
        var custNo = $("#custNo").val();
        var hpNo = $("#hpNo").val();
        var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
        var ssnCrnNo = $("#ssnCrnNo").val();
        var officeTelNo = $("#officeTelNoC").val();
        var oldCustNm = $("#oldCustNm").val();
        var oldHpNo = $("#oldHpNo").val();
        var oldMathDocTp = $("#oldMathDocTp").val();
        var chkContinued = false;

        if (custTp == "02") {
            custNm = $("#custNmC").val();
            mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
            ssnCrnNo = $("#ssnCrnNoC").val();
        }

        if (dms.string.isNotEmpty(mathDocTp) && dms.string.isNotEmpty(ssnCrnNo)){

            var param = {};
            var flag;
            param["sCustTp"]       = custTp;
            param["sCustNm"]       = custNm;
            param["sHpNo"]         = hpNo;
            param["sOfficeTelNo"]         = officeTelNo;
            param["sMathDocTp"]         = mathDocTp;
            param["sSsnCrnNo"]         = ssnCrnNo;
            param["sOldCustNm"]         = oldCustNm;
            param["sOldHpNo"]         = oldHpNo;
            param["sOldMathDocTp"]         = oldMathDocTp;


            $.ajax({
                url:"<c:url value='/crm/cif/customerInfo/selectCustMathDocDupByKey.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                    flag = false;
                    return false;
                },
                success:function(result){
                    console.log("getCustMathDocDupByKey !!! ");

                    if (result.total == 0 ){
                        dms.notification.info("<spring:message code='global.info.ableToDo' />");
                        flag = true;
                        return true;
                    } else {
                        //dms.notification.info("<spring:message code='global.info.already' />");
                        dms.notification.warning("<spring:message code='global.lbl.ssnCrnNo' var='returnMsg' /><spring:message code='crm.info.dupMsg' arguments='${returnMsg}' />");
                        return false;
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
        return flag;
    }

    // 상세정보 입력 체크
    var bf_addInfo = function(obj){

        if($("#addInfoChk").prop('checked')){
            $("#addInfo").show();
        }else{
            $("#addInfo").hide();
        }
    }


$(document).ready(function() {
	//取消按钮 
	 $("#btnClose").kendoButton({
        click:function(e){
            parent.mainPopupWindow.close();
       }
    });
	 
	 /* 省市区三级联动下拉框 */
	  $("#sheng").kendoExtDropDownList({
		  dataTextField:"parentName"
		 ,dataValueField:"parentId"
         ,dataSource:provinceList
         ,index:1
       });
	 
	  $("#shi").kendoExtDropDownList({
		  	cascadeFrom: "sheng"
	       ,dataTextField:"cityName"
	       ,dataValueField:"cityValue"
	       ,dataSource:cityList
	       ,index:0
	   });
	  
	   $("#qu").kendoExtDropDownList({
		  cascadeFrom: "shi"
		 ,dataTextField:"nameText"
		 ,dataValueField:"valueText"
	     ,dataSource:areaList
	     ,index:1
	  });
	 
	 
/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

// 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
    });


// 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
                $(".personalDiv").show();
                $(".corporateDiv").hide();
            } else {
                $("#custTp").data("kendoExtDropDownList").value(selcmmCd);
            }
        }
    });

 // 잠재/보유고객      custCd              (CRM023)
    /* $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:0
        , value:"01"
    });
    $("#custCd").data("kendoExtDropDownList").value("01"); */

 // 잠재/보유고객      custCdC              (CRM023)
    $("#custCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:0
        , value:"01"
    });
    $("#custCdC").data("kendoExtDropDownList").value("01");


 // 선호연락방법       prefCommMthCd (CRM022)
     $("#prefCommMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefCommMthCdList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            if (selcmmCd == "01"){
                $("#prefCommNo").val($("#hpNo").val());
            } else if (selcmmCd == "02") {
                $("#prefCommNo").val($("#telNo").val());
            } else {
                $("#prefCommNo").val($("#officeTelNo").val());
            }
        }
    });

 // 신분증유형            mathDocTp       (CRM024)
     /* $("#mathDocTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        //, dataSource:mathDocTpList
        , dataSource:dms.data.cmmCdFilter(mathDocTpList)
        , index:0
        , change:function(){
            var sel = this.dataItem(this.select()).cmmCd;

            if (sel == "01") {
                $("#ssnCrnNo").attr('maxlength','18');
                if($("#ssnCrnNo").val().length >= 15){
                    var yyyy = $("#ssnCrnNo").val().substr(6,4);
                    var mm = $("#ssnCrnNo").val().substr(10,2);
                    var dd = $("#ssnCrnNo").val().substr(12,2);
                    $("#birthDt").data("kendoExtMaskedDatePicker").value(yyyy+"-"+mm+"-"+dd);      // 생일
                    getAge(yyyy, mm, dd);
                    getPet(yyyy);
                    sunSign(mm, dd);
                }
            } else if (sel  == "02"
                                 || sel  == "03"
                                 || sel  == "04"
                                 || sel  == "05"
                                 || sel  == "06"
            ) {
                $("#ssnCrnNo").attr('maxlength','20');
            } else if (sel == "08") {
                $("#ssnCrnNoC").attr('maxlength','10');
            } else if (sel == "10") {
                $("#ssnCrnNoC").attr('maxlength','18');
            }
            if (getCustMathDocDupByKey()) {
                $("#birthDt").data("kendoExtMaskedDatePicker").value("");      // 생일
                $("#ageDtl").data("kendoExtNumericTextBox").value("");
                $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
                $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            }
        }
    }); */

  // 신분증유형            mathDocTpC       (CRM024)
     $("#mathDocTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        //, dataSource:mathDocTpListC
        , dataSource:dms.data.cmmCdFilter(mathDocTpListC)
        , index:0
        , change:function(){
            var sel = this.dataItem(this.select()).cmmCd;

            if (sel == "01") {
                $("#ssnCrnNo").attr('maxlength','18');
            } else if (sel  == "02"
                                 || sel  == "03"
                                 || sel  == "04"
                                 || sel  == "05"
                                 || sel  == "06"
            ) {
                $("#ssnCrnNo").attr('maxlength','20');
            } else if (sel == "08") {
                $("#ssnCrnNoC").attr('maxlength','10');
            } else if (sel == "10") {
                $("#ssnCrnNoC").attr('maxlength','18');
            }

            getCustMathDocDupByKey();
        }
    });

 // 고객확보유형1      custHoldTp      (CRM008)
     $("#custHoldTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , filter:"contains"
        , filtering:function(e){
            var filter = e.filter;
        }
        //,select:onSelectSearchHoldTp
//         , index:0
//         , change:function(){
//             var selcmmCd = this.dataItem(this.select()).cmmCd;
//             var custHoldTpDtl = $("#custHoldTpDtl").data("kendoExtDropDownList");
//             if (selcmmCd == "01"){
//                 custHoldTpDtl.enable(true);
//             } else {
//                 custHoldTpDtl.value("");
//                 custHoldTpDtl.enable(false);
//             }
//         }
    });

 // 고객확보유형1      custHoldTpC      (CRM008)
     $("#custHoldTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custHoldTpList
        , filter:"contains"
        , filtering:function(e){
            var filter = e.filter;
        }
        //,select:onSelectSearchHoldTp
//         , index:0
//         , change:function(){
//             var selcmmCd = this.dataItem(this.select()).cmmCd;
//             var custHoldTpDtl = $("#custHoldTpDtlC").data("kendoExtDropDownList");
//             if (selcmmCd == "01"){
//                 custHoldTpDtl.enable(true);
//             } else {
//                 custHoldTpDtl.value("");
//                 custHoldTpDtl.enable(false);
//             }
//         }
    });

 // 고객확보유형2      custHoldTpDtlC   (CRM***)
     $("#custHoldTpDtlC").kendoExtDropDownList({
         dataTextField:"holdDetlTpNm"
        , dataValueField:"holdSeq"
        , filter:"contains"
        , optionLabel:" "
        , enable:false
    });

 // 고객확보유형2      custHoldTpDtl   (CRM***)
     $("#custHoldTpDtl").kendoExtDropDownList({
         dataTextField:"holdDetlTpNm"
        , dataValueField:"holdSeq"
        , filter:"contains"
        , optionLabel:" "
        , enable:false
    });

 // 직업군                  jocCd                   (CRM002)
     $("#jobCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:jobCdList
        , index:0
    });

 // 업종                  bizcondCd
     $("#bizcondCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:bizcondCdList
        , index:0
    });

 // 회사규모                  cmpScaleContList       (CRM026)
//      $("#cmpScaleCont").kendoExtDropDownList({
//         dataTextField:"cmmCdNm"
//         , dataValueField:"cmmCd"
//         , dataSource:cmpScaleContList
//         , index:0
//     });

 // 회사유형                  cmpTp
     $("#cmpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpTpList
        , index:0
    });

 // 업종                  bizcondCdC
     $("#bizcondCdC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:bizcondCdList
        , index:0
    });

 // 회사규모                  cmpScaleContListC       (CRM026)
//      $("#cmpScaleContC").kendoExtDropDownList({
//         dataTextField:"cmmCdNm"
//         , dataValueField:"cmmCd"
//         , dataSource:cmpScaleContList
//         , index:0
//     });

 // 회사유형                  cmpTpC
     $("#cmpTpC").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpTpList
        , index:0
    });

 // 주 운전자                driverTp            (CRM015)
     $("#driverTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:driverTpList
        , index:0
    });

 // 연령                       ageCd                 (CRM014)
     $("#ageCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:ageCdList
        , index:0
    });

 // 학력                       acCareerCd      (CRM012)
     $("#acCareerCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:acCareerCdList
        , index:0
    });

 // 소득수준             incomeLvlCd     (CRM013)
     $("#incomeLvlCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:incomeLvlCdList
        , index:0
    });

 // 성별                       sexCd                   (COM017)
     /* $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:sexCdList
        , index:0
    }); */

 // 우선연락방식                       prefContactMthCd    (CRM022)
     $("#prefContactMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefContactMthCdList
        , index:0
    });

 // 우선연락시간                       prefContactTimeCd      (CRM027)
     $("#prefContactTimeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:prefContactTimeCdList
        , index:0
    });

 // 결혼여부                       marryYnList          (CRM028)
     $("#marryCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:marryYnList
        , index:0
    });

 // 평균차량 교체 시기                       avgCarChgCdList    (CRM029)
     $("#avgCarChgCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:avgCarChgCdList
        , index:0
    });

//      $("#chgBuyYn").kendoExtDropDownList({
//          dataTextField:"cmmCdNm"
//          , dataValueField:"cmmCd"
//          , optionLabel:" "
//          , dataSource:chgBuyYnDS
//          , index:0
//      });

//      $("#purcCarBrandCd").kendoExtDropDownList({
//          dataTextField:"cmmCdNm"
//          , dataValueField:"cmmCd"
         //, optionLabel:" "
//          , dataSource:purcCarBrandCdDS
//          , index:0
//      });

     $("#chinaZodiacSignCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:chinaZodiacSignCdDS
         , index:0
     });

     $("#zodiacSignCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:zodiacSignCdDS
         , index:0
     });

     $("#bloodTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:bloodTpDS
         , index:0
     });

     $("#dutyCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:dutyCdDS
         , index:0
     });

 // 결혼기념일
     $("#marryDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

 // 생일
     $("#birthDt").kendoExtMaskedDatePicker({
         format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         , change:function(){
             var fullYear = this.value().getFullYear();
             var monthVal = this.value().getMonth();
             var dayVal = this.value().getDate();
             getPet(fullYear);
             sunSign(monthVal,dayVal);

         }
     });

 // 숫자
     var onlyNum = new RegExp("[^0-9]","i");
     $(".numberic").keyup(function(e)
     {
         var content = $(this).val();

         if(content.match(onlyNum)){
             console.log($(this).val());
             $(this).val('');
         }
     });

 // 숫자와 알파벳
     var onlyNumAlpha = new RegExp("[^a-zA-Z0-9]");
     $(".numberandalpha").keyup(function(e)
     {

         var contents = $(this).val();
         if(onlyNumAlpha.test(contents)){

             $(this).val('');
         }
     });

     // 조직기구코드
     //var corpNumChk = new RegExp("[^[0-9]{8}-[0-9]$]");
     //var corpNumChk = new RegExp("^[0-9]{8}-[0-9]");
     var corpNumChk = new RegExp("[^a-zA-Z0-9-]");
     $(".corpNumChk").keyup(function(e)
     {

         var contents = $(this).val();
         console.log(contents);
         if(corpNumChk.test(contents)){
             $(this).val('');
         }
     });

  // 이메일   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
     //var onlyEmail = new RegExp("^[a-zA-Z0-9]{2,15}@[a-zA-Z0-9]{1,10}(\.[a-zA-Z]{2,3}){1,2}$");
     //var onlyEmail = new RegExp("^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$");
    $(".form_email").keyup(function(e)
    {
        var onlyEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        var contents = $(this).val();
        console.log(contents);
        console.log(onlyEmail.test(contents));
        if(onlyEmail.test(contents)){
            //$(this).val('');
        }
    });

     $(".numberic").focusout(function(){
         $(this).val($.trim($(this).val()));
         var content = $(this).val();
         if(content.match(onlyNum)){
             $(this).val('');
         }
     });

     $(".numberandalpha").focusout(function(){
         $(this).val($.trim($(this).val()));
         var contents = $(this).val();
         console.log(contents);
         console.log(onlyNumAlpha.test(contents));
         if(onlyNumAlpha.test(contents)){

             $(this).val('');
         }
     });

     // 고객명, 휴대전화 입력 후 고객 체크 (자동)
     $(".getCustDupByKey").focusout(function(){
         var idValue = $(this).context.id;
         getCustDupByKey(idValue);
     });

  // 생일 자동 셋팅
     $("#ssnCrnNo").focusout(function(e)
     {
        if( dms.string.isNotEmpty($("#ssnCrnNo").val()) ) {
            if (getCustMathDocDupByKey()) {
                var mathDocTpVal = $("#mathDocTp").data("kendoExtDropDownList").value();
                if ( mathDocTpVal == "01" ){
                    var yyyy,mm,dd;
                    if($("#ssnCrnNo").val().length == 15){
                        //yyyy = $("#ssnCrnNo").val().substr(6,2);
                        yyyy = '19'+$("#ssnCrnNo").val().substr(6,2);
                        mm = $("#ssnCrnNo").val().substr(8,2);
                        dd = $("#ssnCrnNo").val().substr(10,2);
                    }else if($("#ssnCrnNo").val().length == 18){
                        yyyy = $("#ssnCrnNo").val().substr(6,4);
                        mm = $("#ssnCrnNo").val().substr(10,2);
                        dd = $("#ssnCrnNo").val().substr(12,2);
                    }
                    $("#birthDt").data("kendoExtMaskedDatePicker").value(yyyy+"-"+mm+"-"+dd);      // 생일
                    getAge(yyyy, mm, dd);
                    getPet(yyyy);
                    sunSign(mm, dd);
                }
            } else {
                $("#birthDt").data("kendoExtMaskedDatePicker").value("");      // 생일
                $("#ageDtl").data("kendoExtNumericTextBox").value("");
                $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
                $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            }
        } else {
            $("#birthDt").data("kendoExtMaskedDatePicker").value("");      // 생일
            $("#ageDtl").data("kendoExtNumericTextBox").value("");
            $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
            $("#zodiacSignCd").data("kendoExtDropDownList").value("");
        }
     });

     // 법인고객 증서번호 체크
     $("#ssnCrnNoC").focusout(function(e){
         if( dms.string.isNotEmpty($("#ssnCrnNoC").val()) ) {
             getCustMathDocDupByKey()
         }
     });

 // 그룹
     $("#custGroups").kendoMultiSelect({
         dataSource:custGroups,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultGroupDatasourceSetting,
         change:defaultGroupDatasourceSetting
     });

 // 태그
     $("#custTags").kendoMultiSelect({
         dataSource:custTags,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultTagDatasourceSetting,
         change:defaultTagDatasourceSetting
     });
 // 그룹
     $("#custGroupsC").kendoMultiSelect({
         dataSource:custGroupsC,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultGroupCDatasourceSetting,
         change:defaultGroupCDatasourceSetting
     });

 // 태그
     $("#custTagsC").kendoMultiSelect({
         dataSource:custTagsC,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultTagCDatasourceSetting,
         change:defaultTagCDatasourceSetting
     });

 // hobby 취미
     $("#custHobbys").kendoMultiSelect({
         dataSource:custHobbys,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultHobbyDatasourceSetting,
         change:defaultHobbyDatasourceSetting
     });

 // 자녀수
     $("#childrenCnt").kendoExtNumericTextBox({
         format:"n0"
        ,min:0
     });

 // 나이
     $("#ageDtl").kendoExtNumericTextBox({
         format:"n0"
        ,min:0
     });
/*************************************************************
이벤트 정의
*************************************************************/

    $("#addrGrid").on("click", "input.flagYn", function(){

        var addrGrid = $("#addrGrid").data("kendoExtGrid");
        var uid = $(this).data("uid");

        $("input.flagYn", "#addrGrid").prop("checked", false);
        $(this).prop("checked", true);
        console.log(uid);

        $.each(addrGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });

        addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");

    });

    // 주소저장 - addrGrid
    //$("#btnSaveAddress").kendoButton({
    //$("#btnSaveAddress").click(function(){

    var btnSaveAddress = function(custNo) {

        var custNumber = custNo;

        if (custNumber == "") {
            custNumber = $("#custNo").val();
        }

        var grid = $("#addrGrid").data("kendoExtGrid");

        $.each(grid.dataSource.view(), function(idx, dataItem){
            dataItem.set("refKeyNm", custNo);
        });

        var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

        if (grid.cudDataLength == 0){
            //dms.notification.info("<spring:message code='global.info.required.change' />");
            return;
        }

        // 그리드 무결성 점검
        var dataValidate = false;
        $.each(saveData.insertList, function(idx, row){
            if(row.addrTp == ""){
               // 선택하지 않은 주소유형이 있습니다.
               dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
               dataValidate = true;
               return false;
            }
         });

        if(dataValidate){ return false;}

        if (grid.gridValidation()){
            $.ajax({
                url:"<c:url value='/crm/cmm/addressInfo/multiAddressInfo.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                    console.log("failed!!");
                },
                success:function(jqXHR, textStatus){

                    //dms.notification.info("<spring:message code='global.info.success' />");
                    $("#btnCustSearch").click();
                    //grid.dataSource.page(1);
                }
            });
        }else{
            globalNotification.show("<spring:message code='global.info.check.input' />", "error");
        }
    };


    //버튼 - 연계인  추가
//      $("#btnAddRelCust").kendoButton({
//          click:function(e) {
//              popupWindow = dms.window.popup({
//                  windowId:"customerSearchPopup"
//                  , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
//                  , content:{
//                      url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
//                      , data:{
//                          "autoBind":false
//                          , "type"  :null
//                          , "callbackFunc":function(data){
//                              if (data.length >= 1) {
//                                  console.log(data);
//                                  insertRelCustomerItemAdd(data);
//                              }
//                          }
//                      }
//                  }
//              })
//          }
//          , enable:false
//      });

     // 연계인추가 - gridRel
     function insertRelCustomerItemAdd(data){
         $.each(data, function(idx, row){
             $("#gridRel").data("kendoExtGrid").dataSource.insert(0,{
                 "pconCustNo"            :row.custNo
                 , "pconTp"              :"01"
                 , "mathDocTp"           :row.mathDocTp
                 , "prefCommMthCd"       :row.prefCommMthCd
                 , "prefContactMthCd"    :row.prefContactMthCd
                 , "prefContactTimeCd"   :row.prefContactTimeCd
                 , "upperCustNo"         :$("#custNo").val()            // 상위 고객번호
                 , "custNm"              :row.custNm
                 , "certiNum"            :row.certiNum                  // 신분증 번호
                 , "telNo"               :row.telNo                     // 전화
                 , "hpNo"                :row.hpNo                      // 휴대전화
                 , "emailNm"             :row.emailNm                   // E-MAIL
                 //, "regDt"               :row.regDt                     // 등록일
                 , "prefCommNo"          :row.prefCommNo                // 선호 연락처
             });
         });
     }

     // 연계인 삭제 - gridRel
//      $("#btnDelRelCust").kendoButton({
//         click:function(e) {
//             var grid = $("#gridRel").data("kendoExtGrid");
//             var rows = grid.select();

//             rows.each(function(index, row) {
//                 grid.removeRow(row);
//             });
//         }
//         , enable:false
//      });



     function getAge(yyyy, mm, dd){
         var today = new Date();
         var toMonth = today.getMonth()+1;
         var toDate = today.getDate();
         var toYear = today.getFullYear();
         var toAge = toYear - yyyy;

         if (toMonth > mm){
             dayDiff = toAge;
         } else if (mm > toMonth) {
             dayDiff = toAge -1;
         } else {
             if (dd > toDate) {
                 dayDiff =toAge -1;
             } else {
                 var dayDiff = toAge;
             }
         }
         var age = parseInt(dayDiff);
         $("#ageDtl").data("kendoExtNumericTextBox").value(age);
     }
     /******************************************************
      * 띠 처리 - 시작
      ******************************************************/
     function getPet(toYear) {
        console.log("getPet toYear:" + toYear);
        var toyear = 1997; //(1997 - 내가 태어난날) % 12 합니다.
        var birthyear = toYear;
        var birthpet="Ox"
        x = (toyear - birthyear) % 12// x값을 구합니다.

        if ((x ==1) || (x == -11)) {
            birthpet="01"       //쥐띠
        } else if (x == 0) {
            birthpet="02"       //소띠
        } else if ((x == 11) || (x == -1)) {
            birthpet="03"       //호랑이띠
        } else if ((x == 10) || (x == -2)) {
            birthpet="04"       //토끼띠
        } else if ((x == 9) || (x == -3)) {
            birthpet="05"       //용띠
        } else if ((x == 8) || (x == -4)) {
            birthpet="06"       //뱀띠
        } else if ((x == 7) || (x == -5)) {
            birthpet="07"       //말띠
        } else if ((x == 6) || (x == -6)) {
            birthpet="08"       //양띠
        } else if ((x == 5) || (x == -7)) {
            birthpet="09"       //원숭이띠
        } else if ((x == 4) || (x == -8)) {
            birthpet="10"       //닭띠
        } else if ((x == 3) || (x == -9)) {
            birthpet="11"       //개띠
        } else if ((x == 2) || (x == -10)) {
            birthpet="12"       //돼지띠
        }

        $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(birthpet);

     }
     /******************************************************
      * 띠 처리 - 끝
      ******************************************************/

      /******************************************************
       * 별자리 처리 - 시작
       ******************************************************/
     function sunSign(monthVal,dayVal) {
         console.log("sunSign monthVal:" +monthVal);
         console.log("sunSign dayVal:" +dayVal);
         var signVal;

         if (monthVal == 1 && dayVal <=19) {signVal = "12";}
         if (monthVal == 1 && dayVal >=20) {signVal = "01";}
         if (monthVal == 2 && dayVal <=18) {signVal = "01";}
         if (monthVal == 2 && dayVal >=19) {signVal = "02";}
         if (monthVal == 3 && dayVal <=20) {signVal = "02";}
         if (monthVal == 3 && dayVal >=21) {signVal = "03";}
         if (monthVal == 4 && dayVal <=20) {signVal = "03";}
         if (monthVal == 4 && dayVal >=21) {signVal = "04";}
         if (monthVal == 5 && dayVal <=20) {signVal = "04";}
         if (monthVal == 5 && dayVal >=21) {signVal = "05";}
         if (monthVal == 6 && dayVal <=20) {signVal = "05";}
         if (monthVal == 6 && dayVal >=21) {signVal = "06";}
         if (monthVal == 7 && dayVal <=21) {signVal = "06";}
         if (monthVal == 7 && dayVal >=22) {signVal = "07";}
         if (monthVal == 8 && dayVal <=21) {signVal = "07";}
         if (monthVal == 8 && dayVal >=22) {signVal = "08";}
         if (monthVal == 9 && dayVal <=21) {signVal = "08";}
         if (monthVal == 9 && dayVal >=22) {signVal = "09";}
         if (monthVal == 10 && dayVal <=21) {signVal = "09";}
         if (monthVal == 10 && dayVal >=22) {signVal = "10";}
         if (monthVal == 11 && dayVal <=21) {signVal = "10";}
         if (monthVal == 11 && dayVal >=22) {signVal = "11";}
         if (monthVal == 12 && dayVal <=20) {signVal = "11";}
         if (monthVal == 12 && dayVal >=21) {signVal = "12";}

         $("#zodiacSignCd").data("kendoExtDropDownList").value(signVal);
     }
     /******************************************************
      * 별자리 처리 - 종료
      ******************************************************/


  // using addrDetlUsingYn parameter to control the address INPUT box show or not
     var addrDetlUsingYn = "Y";
     if(addrDetlUsingYn === "Y"){
         var height=435;
     }else if(addrDetlUsingYn === "N"){
         var height=420;
     }


     //버튼 - 주소  추가
     $("#btnAddAddress").kendoButton({
         click:function(e) {
/*
             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }
 */
             zipCodeSearchPopupWin = dms.window.popup({
                 windowId:"zipCodeSearchPopupWin"
                 , width:"700"
                 , height:height
                 , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
                 , content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                     , data:{
                         "autoBind":false
                         ,"addrDetlUsingYn":addrDetlUsingYn
                         ,"usrNm":""
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data);
                                 insertAddressItemAdd(data);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 주소추가 - addressGrid
     function insertAddressItemAdd(data){
         var custNo = $("#custNo").val();
         var addrGrid = $("#addrGrid").data("kendoExtGrid");
         var detalAddressData = data.addrDetl;
         var addrTp = data.addrTp;
         $.each(addrGrid.dataSource.view(), function(idx, dataItem){
             dataItem.set("flagYn", "N");
         });

         $.each(data, function(idx, row){
             $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "flagYn"            :"Y"
                 , "addrTp"          :addrTp
                 , "zipCd"           :row.zipCd
                 , "sungNm"          :row.sungNm
                 , "cityNm"          :row.cityNm
                 , "distNm"          :row.distNm
                 , "addrNm"          :""
                 , "addrDetlCont"    :detalAddressData
                 , "useYn"           :"Y"
                 , "sungCd"          :row.sungCd
                 , "cityCd"          :row.cityCd
                 , "distCd"          :row.distCd
                 , "refTableNm"      :"CR_0101T"                  //참조테이블
                 , "refKeyNm"        :custNo                     // 참조 키
             });
         });
         $("#hiddenAddrTable").show();
     }

     // 주소 삭제 - addressGrid
     $("#btnDelAddress").kendoButton({
        click:function(e) {
            var grid = $("#addrGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
     });


//      $("#btnSaveRelCustGrid").kendoButton({
//          click:function(e){
//              var grid = $("#gridRel").data("kendoExtGrid");

//              var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

//              if (grid.cudDataLength == 0){
//                  dms.notification.info("<spring:message code='global.info.required.change' />");
//                  return;
//              }

//              console.log(saveData);

//              if (grid.gridValidation()){
//                  $.ajax({
//                      url:"<c:url value='/crm/cif/customerInfo/multiCustomerRelChg.do' />",
//                      data:JSON.stringify(saveData),
//                      type:'POST',
//                      dataType:'json',
//                      contentType:'application/json',
//                      error:function(jqXHR,status,error){
//                         globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
//                          consoloe.log("failed!!");
//                      },
//                      success:function(jqXHR, textStatus){

//                         grid.dataSource._destroyed = [];
//                          dms.notification.info("<spring:message code='global.info.success' />");
//                          grid.dataSource.page(1);
//                      }
//                  });
//              }else{
//                  globalNotification.show("<spring:message code='global.info.check.input' />", "error");
//              }
//          }
//           , enable:false
//      });


     //$("#btnCustSearch").kendoButton({
       $("#btnCustSearch").click(function(){

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var custNo = $("#custNo").val();

             $("#btnCustReset").click();

             // form 데이터
             var param = {};
             param["sCustNo"] = custNo; // $("#custNo").val();
             param["sSearchRange"] = "MY";
             //param["sBhmcYnSearch"] = "N";

             console.log(param);
             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR);
                     //console.log(jqXHR.responseJSON);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {

                 console.log(result);

                 if (result.custInfoDS.length != 0 ){

                     // Mode 변경
                     $("#pageMode").val("updateMode");

                     $("#custNm").val(result.custInfoDS[0].custNm);
                     //$("#custNm").val(result.custInfoDS[0].custNm);
                     $("#custNo").val(result.custInfoDS[0].custNo);
                     $("#custTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                     $("#custCd").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                     $("#hpNo").val(result.custInfoDS[0].hpNo);
                     $("#emailNm").val(result.custInfoDS[0].emailNm);
                     $("#mngScId").val(result.custInfoDS[0].mngScId);
                     $("#mngScNm").val(result.custInfoDS[0].mngScNm);
                     $("#mngTecId").val(result.custInfoDS[0].mngTecId);
                     $("#mngTecNm").val(result.custInfoDS[0].mngTecNm);
                     $("#wechatId").val(result.custInfoDS[0].wechatId);
                     $("#qqId").val(result.custInfoDS[0].qqId);
                     $("#telNo").val(result.custInfoDS[0].telNo);
                     $("#regionCdRead").val(result.custInfoDS[0].regionCdRead);
                     $("#zipCd").val(result.custInfoDS[0].zipCd);
                     $("#addr1").val(result.custInfoDS[0].addr1);
                     $("#addr2").val(result.custInfoDS[0].addr2);
                     $("#officeSungCd").val(result.custInfoDS[0].officeSungCd);
                     $("#officeCityCd").val(result.custInfoDS[0].officeCityCd);
                     $("#officeRegionCd").val(result.custInfoDS[0].officeRegionCd);
                     $("#officeRegionCdRead").val(result.custInfoDS[0].officeRegionCdRead);
                     $("#officeZipCd").val(result.custInfoDS[0].officeZipCd);
                     $("#officeAddr1").val(result.custInfoDS[0].officeAddr1);
                     $("#officeAddr2").val(result.custInfoDS[0].officeAddr2);
                     $("#idSungCd").val(result.custInfoDS[0].idSungCd);
                     $("#idCityCd").val(result.custInfoDS[0].idCityCd);
                     $("#idRegionCd").val(result.custInfoDS[0].idRegionCd);
                     $("#idRegionCdRead").val(result.custInfoDS[0].idRegionCdRead);
                     $("#idZipCd").val(result.custInfoDS[0].idZipCd);
                     $("#idAddr1").val(result.custInfoDS[0].idAddr1);
                     $("#idAddr2").val(result.custInfoDS[0].idAddr2);
                     $("#custHoldTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                     //$("#custHoldTpDtl").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                     $("#mathDocTp").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                     $("#ssnCrnNo").val(result.custInfoDS[0].ssnCrnNo);
                     $("#officeNm").val(result.custInfoDS[0].officeNm);
                     $("#jobCd").data("kendoExtDropDownList").value(result.custInfoDS[0].jobCd);
                     $("#bizcondCd").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                     $("#cmpScaleCont").val(result.custInfoDS[0].cmpScaleCont);
                     $("#cmpTp").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                     $("#deptNm").val(result.custInfoDS[0].deptNm);
                     $("#psitNm").val(result.custInfoDS[0].psitNm);
                     $("#officeTelNo").val(result.custInfoDS[0].officeTelNo);
                     $("#officeFaxNo").val(result.custInfoDS[0].officeFaxNo);
                     $("#marryDt").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].marryDt);      // 결혼기념일
                     $("#birthDt").data("kendoExtMaskedDatePicker").value(result.custInfoDS[0].birthDt);      // 생일
                     $("#acCareerCd").data("kendoExtDropDownList").value(result.custInfoDS[0].acCareerCd);
                     $("#incomeLvlCd").data("kendoExtDropDownList").value(result.custInfoDS[0].incomeLvlCd);
                     $("#sexCd").data("kendoExtDropDownList").value(result.custInfoDS[0].sexCd);
                     $("#prefContactMthCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactMthCd);
                     $("#prefContactTimeCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefContactTimeCd);
                     $("#marryCd").data("kendoExtDropDownList").value(result.custInfoDS[0].marryCd);
                     //$("#prefCommMthCd").data("kendoExtDropDownList").value(result.custInfoDS[0].prefCommMthCd);
                     //$("#prefCommNo").val(result.custInfoDS[0].prefCommNo);
                     //$("#siebelRowId").val(result.custInfoDS[0].siebelRowId);

                     $("input:radio [ name='prefCommMthCdRadio']:radio[value='"+result.custInfoDS[0].prefCommMthCd+"']").attr("checked", true);

//                      $("#chgBuyYn").data("kendoExtDropDownList").value(result.custInfoDS[0].chgBuyYn);
//                      $("#purcCarBrandCd").data("kendoExtDropDownList").value(result.custInfoDS[0].purcCarBrandCd);
                     $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].chinaZodiacSignCd);
                     $("#zodiacSignCd").data("kendoExtDropDownList").value(result.custInfoDS[0].zodiacSignCd);
                     $("#bloodTp").data("kendoExtDropDownList").value(result.custInfoDS[0].bloodTp);
                     $("#dutyCd").data("kendoExtDropDownList").value(result.custInfoDS[0].dutyCd);

                     //$("#buyCnt").val(result.custInfoDS[0].buyCnt);
//                      $("#purcCarModelNm").val(result.custInfoDS[0].purcCarModelNm);
                     $("#childrenCnt").data("kendoExtNumericTextBox").value(result.custInfoDS[0].childrenCnt);
                     $("#ageDtl").data("kendoExtNumericTextBox").value(result.custInfoDS[0].ageDtl);

                     $("#docId").val(result.custInfoDS[0].docId);

                     $("#oldCustNm").val(result.custInfoDS[0].custNm);
                     $("#oldHpNo").val(result.custInfoDS[0].hpNo);
                     $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);

                     // CheckBox
                     //var bhmcYn = result.custInfoDS[0].bhmcYn;
                     var smsReceiveYn = result.custInfoDS[0].smsReceiveYn;
                     var hpNoReceiveYn = result.custInfoDS[0].hpNoReceiveYn;
                     var telReceiveYn = result.custInfoDS[0].telReceiveYn;
                     var emailReceiveYn = result.custInfoDS[0].emailReceiveYn;
                     //var dmReceiveYn = result.custInfoDS[0].dmReceiveYn;
                     //var faxReceiveYn = result.custInfoDS[0].faxReceiveYn;
                     var perInfoAgreeYn = result.custInfoDS[0].perInfoAgreeYn;
                     var perInfoUseYn = result.custInfoDS[0].perInfoUseYn;
                     var hpNoInvldYn = result.custInfoDS[0].hpNoInvldYn;
                     var hpNoAddImposYn = result.custInfoDS[0].hpNoAddImposYn;

                     //if (bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true) };
                     if (smsReceiveYn == 'Y'){ $("#smsReceiveYn").prop("checked", true) };
                     if (hpNoReceiveYn == 'Y'){ $("#hpNoReceiveYn").prop("checked", true) };
                     if (telReceiveYn == 'Y'){ $("#telReceiveYn").prop("checked", true) };
                     if (emailReceiveYn == 'Y'){ $("#emailReceiveYn").prop("checked", true) };
                     //if (dmReceiveYn == 'Y'){ $("#dmReceiveYn").prop("checked", true) };
                     //if (faxReceiveYn == 'Y'){ $("#faxReceiveYn").prop("checked", true) };
                     if (perInfoAgreeYn == 'Y'){ $("#perInfoAgreeYn").prop("checked", true) };
                     if (perInfoUseYn == 'Y'){ $("#perInfoUseYn").prop("checked", true) };
                     if (hpNoInvldYn == 'Y'){ $("#hpNoInvldYn").prop("checked", true) };
                     if (hpNoAddImposYn == 'Y'){ $("#hpNoAddImposYn").prop("checked", true) };

                     // 법인 Div Set
                     var custTpVal = result.custInfoDS[0].custTp;
                         console.log("Corporate Div!!! == > " + custTpVal);
                     if (custTpVal == '02') {

                         console.log("Corporate Div!!!");
                         //if (bhmcYn == 'Y'){ $("#bhmcYnC").prop("checked", true) };

                         $("#custTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                         $("#custNmC").val(result.custInfoDS[0].custNm);
                         $("#custNoC").val(result.custInfoDS[0].custNo);
                         $("#custCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                         $("#mathDocTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                         $("#ssnCrnNoC").val(result.custInfoDS[0].ssnCrnNo);
                         $("#mngScIdC").val(result.custInfoDS[0].mngScId);
                         $("#mngScNmC").val(result.custInfoDS[0].mngScNm);
                         $("#mngTecIdC").val(result.custInfoDS[0].mngTecId);
                         $("#mngTecNmC").val(result.custInfoDS[0].mngTecNm);
                         $("#custHoldTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                         //$("#custHoldTpDtlC").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                         $("#officeTelNoC").val(result.custInfoDS[0].officeTelNo);

                         $("#officeFaxNoC").val(result.custInfoDS[0].officeFaxNo);
                         $("#emailNmC").val(result.custInfoDS[0].emailNm);
                         $("#bizcondCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                         $("#cmpScaleContC").val(result.custInfoDS[0].cmpScaleCont);
                         $("#cmpTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                         //$("#ownRgstNm").val(result.custInfoDS[0].ownRgstNm);
                         //$("#siebelRowIdC").val(result.custInfoDS[0].siebelRowId);

                         $("#oldHpNo").val(result.custInfoDS[0].officeTelNo);
                         $("#oldMathDocTp").val(result.custInfoDS[0].mathDocTp);
                     }

                 }

                 if (result.groupDS.length != 0 ){
                     groupSeq = "";
                     var groupDsItem;
                     for(i=0 ;  i < result.groupDS.length ; i++){
                         groupDsItem = result.groupDS[i];
                         if (i==0){
                             groupSeq = groupDsItem.grpSeq;
                         }else{
                             groupSeq = groupSeq+","+groupDsItem.grpSeq;
                         }
                     }

                     if (result.custInfoDS[0].custTp == '01') {
                         if (result.groupDS.length == 1) {
                             $("#custGroups").data("kendoMultiSelect").value(groupSeq);
                         } else {
                             $("#custGroups").data("kendoMultiSelect").value(groupSeq.split(","));
                         }
                         defaultGroupDatasourceSetting();
                     } else {
                         if (result.groupDS.length == 1) {
                             $("#custGroupsC").data("kendoMultiSelect").value(groupSeq);
                         } else {
                             $("#custGroupsC").data("kendoMultiSelect").value(groupSeq.split(","));
                         }
                         defaultGroupCDatasourceSetting();
                     }
                 }

                 if (result.tagDS.length != 0 ){
                     tagSeq = "";
                     var tagDsItem;
                     for(i=0 ;  i < result.tagDS.length ; i++){
                         tagDsItem = result.tagDS[i];
                         if (i==0){
                             tagSeq = tagDsItem.grpSeq;
                         }else{
                             tagSeq = tagSeq+","+tagDsItem.grpSeq;
                         }
                     }

                     if (result.custInfoDS[0].custTp == '01') {
                         if (result.tagDS.length == 1) {
                             $("#custTags").data("kendoMultiSelect").value(tagSeq);
                         } else {
                             $("#custTags").data("kendoMultiSelect").value(tagSeq.split(","));
                         }

                         defaultTagDatasourceSetting();
                     } else {
                         if (result.tagDS.length == 1) {
                             $("#custTagsC").data("kendoMultiSelect").value(tagSeq);
                         } else {
                             $("#custTagsC").data("kendoMultiSelect").value(tagSeq.split(","));
                         }

                         defaultTagCDatasourceSetting();
                     }
                 }

                 if (result.hobbyDS.length != 0 ){
                     hobbySeq = "";
                     var hobbyDsItem;
                     for(i=0 ;  i < result.hobbyDS.length ; i++){
                         hobbyDsItem = result.hobbyDS[i];
                         if (i==0){
                             hobbySeq = hobbyDsItem.grpSeq;
                         }else{
                             hobbySeq = hobbySeq+","+hobbyDsItem.grpSeq;
                         }
                     }

                     if (result.hobbyDS.length == 1) {
                         $("#custHobbys").data("kendoMultiSelect").value(hobbySeq);
                     } else {
                         $("#custHobbys").data("kendoMultiSelect").value(hobbySeq.split(","));
                     }

                     defaultHobbyDatasourceSetting();
                 }

//                  var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
//                  var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
//                  var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
//                  btnAddRelCust.enable(true);
//                  btnSaveRelCustGrid.enable(true);
//                  btnDelRelCust.enable(true);

                 // 주소 조회
                 var addrGrid = $("#addrGrid").data("kendoExtGrid");
                 addrGrid.dataSource.read();

                 // 연계인 조회
                 var grid = $("#gridRel").data("kendoExtGrid");
                 //grid.setDataSource(new kendo.data.DataSource());
                 grid.dataSource.read();

                 $("#custTp").data("kendoExtDropDownList").enable(false);
                 $("#custTpC").data("kendoExtDropDownList").enable(false);

                 if ( dms.string.isNotEmpty(result.custInfoDS[0].mathDocTp) && dms.string.isNotEmpty(result.custInfoDS[0].ssnCrnNo) ) {
                     $("#mathDocTp").data("kendoExtDropDownList").enable(false);
                     //$("#ssnCrnNo").data("kendoMaskedTextBox").enable(false);
                     $("#ssnCrnNo").attr("readOnly", true);
                     $("#ssnCrnNo").addClass("form_readonly");
                     $("#mathDocTpC").data("kendoExtDropDownList").enable(false);
                     //$("#ssnCrnNoC").data("kendoMaskedTextBox").enable(false);
                     $("#ssnCrnNoC").attr("readOnly", true);
                     $("#ssnCrnNoC").addClass("form_readonly");
                 }

             });

       });



     // 초기화
     $("#btnCustReset").kendoButton({
        click:function(e){
            // kjlee
            console.log("btnCustReset 1 ");
//             var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
//             var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
//             var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
            console.log("btnCustReset 2 ");
//             btnAddRelCust.enable(false);
            console.log("btnCustReset 3 ");
//             btnSaveRelCustGrid.enable(false);
            console.log("btnCustReset 4 ");
//             btnDelRelCust.enable(false);
            console.log("btnCustReset 5 ");

            $("#pageMode").val("insertMode");

            // Reset
            $("#custNm").val("");
            $("#oldCustNm").val("");
            $("#custNo").val("");
            $("#custTp").data("kendoExtDropDownList").value("01");
            $("#custCd").data("kendoExtDropDownList").value("01");
            $("#hpNo").val("");
            $("#oldHpNo").val("");
            $("#emailNm").val("");
            $("#mngScId").val("");
            $("#mngTecId").val("");
            $("#wechatId").val("");
            $("#qqId").val("");
            $("#telNo").val("");
            $("#regionCdRead").val("");
            $("#zipCd").val("");
            $("#addr1").val("");
            $("#addr2").val("");
            $("#officeSungCd").val("");
            $("#officeCityCd").val("");
            $("#officeRegionCd").val("");
            $("#officeRegionCdRead").val("");
            $("#officeZipCd").val("");
            $("#officeAddr1").val("");
            $("#officeAddr2").val("");
            $("#idSungCd").val("");
            $("#idCityCd").val("");
            $("#idRegionCd").val("");
            $("#idRegionCdRead").val("");
            $("#idZipCd").val("");
            $("#idAddr1").val("");
            $("#idAddr2").val("");
            $("#prefCommMthCd").data("kendoExtDropDownList").value("");
            $("#custHoldTp").data("kendoExtDropDownList").value("");
            //$("#custHoldTpDtl").data("kendoExtDropDownList").value("");
            $("#mathDocTp").data("kendoExtDropDownList").value("");
            $("#ssnCrnNo").val("");
            $("#officeNm").val("");
            $("#jobCd").data("kendoExtDropDownList").value("");
            $("#bizcondCd").data("kendoExtDropDownList").value("");
            $("#cmpScaleCont").val("");
            $("#cmpTp").data("kendoExtDropDownList").value("");
            $("#deptNm").val("");
            $("#psitNm").val("");
            $("#officeTelNo").val("");
            $("#officeFaxNo").val("");
            $("#marryDt").data("kendoExtMaskedDatePicker").value("");
            $("#birthDt").data("kendoExtMaskedDatePicker").value("");
            $("#acCareerCd").data("kendoExtDropDownList").value("");
            $("#incomeLvlCd").data("kendoExtDropDownList").value("");
            $("#custHobbys").data("kendoMultiSelect").value("");
            $("#custGroups").data("kendoMultiSelect").value("");
            $("#custTags").data("kendoMultiSelect").value("");
            $("#sexCd").data("kendoExtDropDownList").value("");
            $("#prefContactMthCd").data("kendoExtDropDownList").value("");
            $("#prefContactTimeCd").data("kendoExtDropDownList").value("");
            $("#prefCommNo").val("");
            $("#marryCd").data("kendoExtDropDownList").value("");
            $("#siebelRowId").val("");
//             $("#chgBuyYn").data("kendoExtDropDownList").value("");
//             $("#purcCarBrandCd").data("kendoExtDropDownList").value("");
            $("#chinaZodiacSignCd").data("kendoExtDropDownList").value("");
            $("#zodiacSignCd").data("kendoExtDropDownList").value("");
            $("#bloodTp").data("kendoExtDropDownList").value("");
            $("#dutyCd").data("kendoExtDropDownList").value("");
            //$("#buyCnt").val("");
//             $("#purcCarModelNm").val("");
            $("#childrenCnt").data("kendoExtNumericTextBox").value("");
            $("#ageDtl").data("kendoExtNumericTextBox").value("");

            $("#docId").val("");

            $("#oldCustNm").val("");
            $("#oldHpNo").val("");
            $("#oldMathDocTp").val("");

            //$("#bhmcYn").prop("checked", false);
            $("#smsReceiveYn").prop("checked", false);
            $("#hpNoReceiveYn").prop("checked", false);
            $("#telReceiveYn").prop("checked", false);
            $("#emailReceiveYn").prop("checked", false);
            //$("#dmReceiveYn").prop("checked", false);
            //$("#faxReceiveYn").prop("checked", false);
            $("#perInfoAgreeYn").prop("checked", false);
            $("#perInfoUseYn").prop("checked", false);
            $("#hpNoInvldYn").prop("checked", false);
            $("#hpNoAddImposYn").prop("checked", false);

            // 법인 DIV Reset
            $("#custTpC").data("kendoExtDropDownList").value("");
            $("#custNmC").val("");
            $("#custNoC").val("");
            $("#custCdC").data("kendoExtDropDownList").value("");
            $("#mathDocTpC").data("kendoExtDropDownList").value("");
            $("#ssnCrnNoC").val("");
            //$("#bhmcYnC").prop("checked", false);
            $("#mngScIdC").val("");
            $("#mngTecIdC").val("");
            $("#custHoldTpC").data("kendoExtDropDownList").value("");
            //$("#custHoldTpDtlC").data("kendoExtDropDownList").value("");
            $("#officeTelNoC").val("");
            $("#officeFaxNoC").val("");
            $("#emailNmC").val("");
            $("#bizcondCdC").data("kendoExtDropDownList").value("");
            $("#cmpScaleContC").val("");
            $("#cmpTpC").data("kendoExtDropDownList").value("");
            //$("#siebelRowIdC").val();
            //$("#ownRgstNm").val("");

            $("#gridRel").data("kendoExtGrid").dataSource.data([]);
            $("#addrGrid").data("kendoExtGrid").dataSource.data([]);

            $("#custTp").data("kendoExtDropDownList").enable(true);
            $("#custTpC").data("kendoExtDropDownList").enable(true);

            $("#mathDocTp").data("kendoExtDropDownList").enable(true);
            //$("#ssnCrnNo").data("kendoMaskedTextBox").enable(true);
            $("#ssnCrnNo").attr("readOnly", false);
            $("#ssnCrnNo").removeClass("form_readonly");
            $("#mathDocTpC").data("kendoExtDropDownList").enable(true);
            //$("#ssnCrnNoC").data("kendoMaskedTextBox").enable(true);
            $("#ssnCrnNoC").attr("readOnly", false);
            $("#ssnCrnNoC").removeClass("form_readonly");

            console.log("btnCustReset 3 ");
        }
     });

     // 保存功能
     $("#btnCustSave").kendoButton({
         click:function(e) {
        	 var param = {};
        	 var ssn = $("#ssnCrnNo").val();/* 主键id */
        	 var invoiceDateSta = $("#invoiceDateSta").val();/* 时间 */
             var sungNm;
             var cityNm;
             var distNm;
             var addrDetlCont;
             var isNeed;
        //R19073101692 DMS 充电桩安装申请中，发票日期设置为必填项 贾明 2019-7-31 start
        if( "" == $("#invoiceDateSta").data("kendoExtMaskedDatePicker").value()  ||  null == $("#invoiceDateSta").data("kendoExtMaskedDatePicker").value() ){
            dms.notification.warning("<spring:message code='sal.lbl.timeEmpty'/>");
            $("#invoiceDateSta").focus();
            return false;
        }
       //R19073101692 DMS 充电桩安装申请中，发票日期设置为必填项 贾明 2019-7-31 start
    
             //判断如果选择安装充电桩地址不能为空,不安装则无所谓
             //获取是否安装充电桩
             var custTpVal = $("#custTp").data("kendoExtDropDownList").value();
             console.log("====="+invoiceDateSta);
             
             var state = $("#mngScId").val();
             console.log(state);
             if(state == "01"){
	             sungNm =$("#sheng").data("kendoExtDropDownList").text();
	             cityNm = $("#shi").data("kendoExtDropDownList").text();
	             distNm = $("#qu").data("kendoExtDropDownList").text();
	             addrDetlCont = $("#detailedAddress").val();
	             isNeed = $("#custTp").data("kendoExtDropDownList").value();
	             if(custTpVal=="01"){//安装充电桩
		             if ( dms.string.isEmpty(invoiceDateSta)) {//判断时间不能为空
		                 dms.notification.warning("<spring:message code='sal.lbl.timeEmpty'/>");
		                 $("#hpNo").focus();
		                 return false;
		             }
	             
		             if ( dms.string.isEmpty(addrDetlCont)) {//判断地址不能为空
		                 dms.notification.warning("<spring:message code='sal.lbl.addressEmpty'/>");
		                 $("#hpNo").focus();
		                 return false;
		             }
		             var url = "<c:url value='/sal/dlv/contDeliveryCanc/updateChargingPile.do' />";
		             param["installationNo"] = ssn;
		             param["installProvince"] = sungNm;
		             param["installCity"] = cityNm;
		             param["installArea"] = distNm;
		             param["address"] = addrDetlCont;
		             param["isNeed"] = isNeed;
		             param["invoiceDateSta"] = invoiceDateSta;
		             console.log(param);
		
		             $.ajax({
		                 url:url
		                 ,data:JSON.stringify(param)
		                 ,type:'POST'
		                 ,dataType:'json'
		                 ,contentType:'application/json'
		                 ,error:function(jqXHR,status,error){
		                     console.log(jqXHR);
		                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
		                 },
		                 success:function(result){
		                     dms.notification.success("<spring:message code='global.info.success'/>");
		                     var data = {};
		                     data.msg = 'save';
		                     options.callbackFunc(data);
		                     //refreshAll();
		                     parent.mainPopupWindow.close();
		
		                 }
		                 ,beforeSend:function(xhr){
		                     dms.loading.show();
		                 }
		                 ,complete:function(xhr, status) {
		                     dms.loading.hide();
		                 }
		             }).done(function(result) {
		                 console.log("btnCustSave Done!!!!");
		             });
	             }else{
	            	 dms.notification.warning("<spring:message code='sal.lbl.notToMention'/>");
	            	/*  var data = {};
	                 data.msg = 'save';
	                 options.callbackFunc(data);
	            	 parent.mainPopupWindow.close(); */
	             }
	             
             }else{
            	   dms.notification.warning("<spring:message code='sal.menu.remind'/>");
                   
               }
             
             
             

         }
     });

     // 버튼 - 그룹선택 팝업
     $("#btnSelectGroupPopup").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"groupSearchPopup"
                 , title:"<spring:message code = 'global.title.custGrpSearch'/>"   // 고객그룹 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerGroup/selectGroupPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "grpTp" :"001"
                         , "callbackFunc":function(data){
                             if (data.length > 0) {
                                 //groupDS = data;

                                 groupDS = [];
                                 groupTxt = "";
                                 for(i=0 ;  i < data.length ; i++){
                                     if (i==0){
                                         groupTxt = data[i].grpNm;
                                     }else{
                                         groupTxt = groupTxt+", "+data[i].grpNm;
                                     }
                                     groupDS.push({"grpSeq":data[i].grpSeq,"grpTp":"001"});
                                 }

                                 $("#groupTxt").val(groupTxt);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 버튼 - 태그선택 팝업
     $("#btnSelectTagPopup").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"groupSearchPopup"
                 , title:"<spring:message code = 'global.lbl.tag'/>"   // 태그 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerGroup/selectTagPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "grpTp" :"002"
                         , "callbackFunc":function(data){
                             if (data.length > 0) {
                                 tagDS = [];
                                 tagTxt = "";
                                 for(i=0 ;  i < data.length ; i++){
                                     if (i==0){
                                         tagTxt = data[i].grpNm;
                                     }else{
                                         tagTxt = tagTxt+", "+data[i].grpNm;
                                     }
                                     tagDS.push({"grpSeq":data[i].grpSeq,"grpTp":"002"});
                                 }

                                 $("#tagTxt").val(tagTxt);
                             }
                         }
                     }
                 }
             })
         }
     });


/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/
     //연계인 그리드 설정
         $("#gridRel").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/customerRelSearch.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
                             params["sort"]                 = options.sort;

                             params["sUpperCustNo"] = $("#custNo").val();
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     errors:"error"
                         ,data:"data"
                         ,total:"total"
                         ,model:{
                             id:"seq"
                                ,fields:{
                                 seq                   :{type:"number", editable:false}
                                 , pconCustNo          :{type:"string", editable:false}
                                 //, rnum              :{type:"number", editable:false}
                                 , upperCustNo         :{type:"string", editable:false}
                                 , custNo              :{type:"string", editable:false}
                                 , pconTp              :{type:"string", validation:{required:true} , editable:true}
                                 , custNm              :{type:"string", editable:false}
                                 , mathDocTp           :{type:"string", editable:false}       // 신분증유형
                                 , certiNum            :{type:"string", editable:false}       // 신분증 번호
                                 , telNo               :{type:"string", editable:false}       // 전화
                                 , hpNo                :{type:"string", editable:false}       // 휴대전화
                                 , emailNm             :{type:"string", editable:false}       // E-MAIL
                                 , prefCommMthCd       :{type:"string", editable:false}       // 선호연락방식
                                 , prefCommNo          :{type:"string", editable:false}       // 선호 연락처
                                 , prefContactMthCd    :{type:"string", editable:false}       // 우선 연락방식
                                 , prefContactTimeCd   :{type:"string", editable:false}       // 우선 연락시간
                                 , regDt               :{type:"date", editable:false}         // 등록일
                             }
                         }
                 }

             }
             ,columns:[
                         // {field:"rnum",              title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                         {field:"pconTp",            title:"<spring:message code='global.lbl.type' />",  width:100, attributes:{"class":"ac"}
                            , editor:function(container, options){
                                $('<input data-bind="value:' + options.field + '"  />')
                                .appendTo(container)
                                .kendoExtDropDownList({
                                    dataTextField:"cmmCdNm"
                                    , dataValueField:"cmmCd"
                                    //, optionLabel:" "
                                    , dataSource:pconTpList
                                });
                            }
                            , template:'#if (pconTp !== ""){# #= pconTpMap[pconTp]# #}#'
                         }
                         ,{field:"custNm",            title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}}
//                          ,{field:"mathDocTp",         title:"<spring:message code='global.lbl.mathDocTp' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:mathDocTpList
//                                  });
//                              }
//                              , template:'#if (mathDocTp !== ""){# #= mathDocTpMap[mathDocTp]# #}#'
//                          }
//                          ,{field:"certiNum",          title:"<spring:message code='global.lbl.ssnCrnNo' />",  width:120, attributes:{"class":"ac"}}
                         ,{field:"telNo",             title:"<spring:message code='global.lbl.homeTelNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"hpNo",              title:"<spring:message code='global.lbl.hpNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"emailNm",           title:"<spring:message code='global.lbl.emailNm' />",  width:100, attributes:{"class":"al"}}
//                          ,{field:"prefCommMthCd",     title:"<spring:message code='crm.lbl.prefCommMthCd' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:prefCommMthCdList
//                                  });
//                              }
//                              , template:'#if (prefCommMthCd !== ""){# #= prefCommMthCdMap[prefCommMthCd]# #}#'
//                          }
//                          ,{field:"prefCommNo",        title:"<spring:message code='crm.lbl.prefCommNo' />",  width:100, attributes:{"class":"ac"}}
//                          ,{field:"prefContactMthCd",  title:"<spring:message code='crm.lbl.prefContactMthCd' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:prefContactMthCdList
//                                  });
//                              }
//                              , template:'#if (prefContactMthCd !== ""){# #= prefContactMthCdMap[prefContactMthCd]# #}#'
//                          }
//                          ,{field:"prefContactTimeCd", title:"<spring:message code='crm.lbl.prefContactTime' />",  width:100, attributes:{"class":"ac"}
//                              , editor:function(container, options){
//                                  $('<input data-bind="value:' + options.field + '"  />')
//                                  .appendTo(container)
//                                  .kendoExtDropDownList({
//                                      dataTextField:"cmmCdNm"
//                                      , dataValueField:"cmmCd"
//                                     , optionLabel:" "
//                                      , dataSource:prefContactTimeCdList
//                                  });
//                              }
//                              , template:'#if (prefContactTimeCd !== ""){# #= prefContactTimeCdMap[prefContactTimeCd]# #}#'
//                          }
                         ,{field:"regDt",             title:"<spring:message code='global.lbl.regDt' />",  width:100, attributes:{"class":"ac"}
                            , format:"{0:<dms:configValue code='dateFormat' />}"
                         }
                     ]
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,navigatable:false
             ,filterable:false
             ,height:89
             ,editable:{
                 mode:"incell"
                 ,confirmation :false
             }
             ,pageable:false
         });


      // 주소 그리드
         $("#addrGrid").kendoExtGrid({
             gridId:"G-CRM-0628-171602"
             ,dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;
                             params["sRefTableNm"]           = "CR_0101T";
                             params["sRefKeyNm"]             = $("#custNo").val();

                             console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     errors:"error"
                         ,data:"data"
                         ,total:"total"
                         ,model:{
                             id:"seq"
                             ,fields:{
                                 seq:{type:"string", editable:false}
                                 ,rnum  :{type:"number" , editable:false}
                                 ,addrTp:{type:"string", editable:true}
                                 ,zipCd:{type:"string", editable:false}
                                 ,sungCd:{type:"string", editable:false}
                                 ,cityCd:{type:"string", editable:false}
                                 ,distCd:{type:"string", editable:false}
                                 ,sungNm:{type:"string", editable:false}
                                 ,cityNm:{type:"string", editable:false}
                                 ,distNm:{type:"string", editable:false}
                                 ,addrNm:{type:"string", editable:true}
                                 ,addrDetlCont:{type:"string", editable:true}
                                 ,flagYn:{type:"string", editable:true}
                                 ,refTableNm:{type:"string", editable:false}
                                 ,refKeyNm:{type:"string", editable:true}
                                 ,useYn:{type:"string", editable:true}
                             }
                         }
                 }
             }
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,height:89
             ,navigatable:false
             ,pageable:false
             ,filterable:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,columns:[
                  {field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:200, attributes:{"class":"ac"}}       // 성
                 ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:200, attributes:{"class":"ac"}}       // 도시
                 ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:150, attributes:{"class":"ac"}}       // 지역
                 ,{field:"addrNm", hidden:true}       // 주소
                 ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:300, attributes:{"class":"ac"}}       // 상세주소
                 ,{field:"sungCd", hidden:true}
                 ,{field:"cityCd", hidden:true}
                 ,{field:"distCd", hidden:true}
                 ,{field:"refTableNm", hidden:true}
                 ,{field:"refKeyNm", hidden:true}
             ]

         });
});

/******************************************************
 * 띠 처리 - 시작
 ******************************************************/
function getPet(toYear) {
   console.log("toYear:" + toYear);
   var toyear = 1997; //(1997 - 내가 태어난날) % 12 합니다.
   var birthyear = toYear;
   var birthpet="Ox"
   x = (toyear - birthyear) % 12// x값을 구합니다.

   if ((x ==1) || (x == -11)) {
       birthpet="01"       //쥐띠
   } else if (x == 0) {
       birthpet="02"       //소띠
   } else if ((x == 11) || (x == -1)) {
       birthpet="03"       //호랑이띠
   } else if ((x == 10) || (x == -2)) {
       birthpet="04"       //토끼띠
   } else if ((x == 9) || (x == -3)) {
       birthpet="05"       //용띠
   } else if ((x == 8) || (x == -4)) {
       birthpet="06"       //뱀띠
   } else if ((x == 7) || (x == -5)) {
       birthpet="07"       //말띠
   } else if ((x == 6) || (x == -6)) {
       birthpet="08"       //양띠
   } else if ((x == 5) || (x == -7)) {
       birthpet="09"       //원숭이띠
   } else if ((x == 4) || (x == -8)) {
       birthpet="10"       //닭띠
   } else if ((x == 3) || (x == -9)) {
       birthpet="11"       //개띠
   } else if ((x == 2) || (x == -10)) {
       birthpet="12"       //돼지띠
   }

   $("#chinaZodiacSignCd").data("kendoExtDropDownList").value(birthpet);

}
/******************************************************
 * 띠 처리 - 끝
 ******************************************************/

 /******************************************************
  * 별자리 처리 - 시작
  ******************************************************/
function sunSign(monthVal,dayVal) {
    console.log("monthVal:" +monthVal);
    console.log("dayVal:" +dayVal);
    var signVal;

    if (monthVal == 1 && dayVal <=19) {signVal = "12";}
    if (monthVal == 1 && dayVal >=20) {signVal = "01";}
    if (monthVal == 2 && dayVal <=18) {signVal = "01";}
    if (monthVal == 2 && dayVal >=19) {signVal = "02";}
    if (monthVal == 3 && dayVal <=20) {signVal = "02";}
    if (monthVal == 3 && dayVal >=21) {signVal = "03";}
    if (monthVal == 4 && dayVal <=20) {signVal = "03";}
    if (monthVal == 4 && dayVal >=21) {signVal = "04";}
    if (monthVal == 5 && dayVal <=20) {signVal = "04";}
    if (monthVal == 5 && dayVal >=21) {signVal = "05";}
    if (monthVal == 6 && dayVal <=20) {signVal = "05";}
    if (monthVal == 6 && dayVal >=21) {signVal = "06";}
    if (monthVal == 7 && dayVal <=21) {signVal = "06";}
    if (monthVal == 7 && dayVal >=22) {signVal = "07";}
    if (monthVal == 8 && dayVal <=21) {signVal = "07";}
    if (monthVal == 8 && dayVal >=22) {signVal = "08";}
    if (monthVal == 9 && dayVal <=21) {signVal = "08";}
    if (monthVal == 9 && dayVal >=22) {signVal = "09";}
    if (monthVal == 10 && dayVal <=21) {signVal = "09";}
    if (monthVal == 10 && dayVal >=22) {signVal = "10";}
    if (monthVal == 11 && dayVal <=21) {signVal = "10";}
    if (monthVal == 11 && dayVal >=22) {signVal = "11";}
    if (monthVal == 12 && dayVal <=20) {signVal = "11";}
    if (monthVal == 12 && dayVal >=21) {signVal = "12";}

    $("#zodiacSignCd").data("kendoExtDropDownList").value(signVal);

}
/******************************************************
 * 별자리 처리 - 종료
 ******************************************************/

/** [조회조건 영역] ComboBox Select() **/
// 정보경로에 따른 상세경로 조회
function onSelectSearchHoldTp(e){
//     $("#custHoldTpDtl").data("kendoExtDropDownList").setDataSource([]);
//     $("#custHoldTpDtl").data("kendoExtDropDownList").enable(true);
//     $("#custHoldTpDtlC").data("kendoExtDropDownList").setDataSource([]);
//     $("#custHoldTpDtlC").data("kendoExtDropDownList").enable(true);

    var dataItem = this.dataItem(e.item);
    console.log("dataItem onSelectSearchHoldTp:::::::::::::::::::");
    console.log(dataItem);
    if(dataItem.cmmCd == ""){
//         $("#custHoldTpDtl").data("kendoExtDropDownList").setDataSource([]);
//         $("#custHoldTpDtl").data("kendoExtDropDownList").enable(false);
//         $("#custHoldTpDtlC").data("kendoExtDropDownList").setDataSource([]);
//         $("#custHoldTpDtlC").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
        ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
        ,async:false
    });
//     $("#custHoldTpDtl").data("kendoExtDropDownList").setDataSource(responseJson.data);
//     $("#custHoldTpDtlC").data("kendoExtDropDownList").setDataSource(responseJson.data);
}


</script>







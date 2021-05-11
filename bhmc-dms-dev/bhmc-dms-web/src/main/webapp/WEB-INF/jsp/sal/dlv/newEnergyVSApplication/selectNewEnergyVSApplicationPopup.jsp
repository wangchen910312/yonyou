<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <script src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script> --%>

<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<style type="text/css">
.form_readonly_text_blue {background-color:#dbdbdb!important; -webkit-text-fill-color:#45b4e8; color:#45b4e8!important; -webkit-opacity:1; opacity:1;}

.inputX::-ms-clear {display: none;}

.black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 55%; 
            height: 55%; 
            padding: 20px; 
            border: 10px solid #3c78b5; 
            background-color: white; 
            z-index:1002; 
            overflow: auto;
        }
.view_beaury{
font-family: verdana, sans-serif;
font-size: 18px;
font-weight: bold;
line-height: 1.6;
}

</style>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="ru.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="ru.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>

<section id="window" class="pop_wrap">
<form id="contForm" name="contForm" method="POST">

    <%-- <section class="group">
    <div class="header_area">
     <div id="dPopButton" class="btn_right">
                <button id="btnCreate" type="button" class="btn_m"><spring:message code='sal.btn.offer' /></button> 
                <button id="btnCancel"   type="button" class="btn_m"><spring:message code='sal.btn.cancel' /></button>    
                <button id="btnSave"   type="button" class="btn_m"><spring:message code='global.btn.save' /></button>            
            </div>
    </div>
    </section> --%>
    <!-- 私人用户信息 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.menu.privateUserInfo' /></h2>         <!-- 고객정보 -->
            <div class="fl">
                 <label><input type="radio" id="privateUserInfo" name="addInfoChk" class="form_check" onclick="bf_addInfo('sryh')"></label>   
            </div>
            <div id="dPopButton" class="btn_right">
                <dms:access viewId="VIEW-D-13314" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnCreate" type="button" class="btn_m"><spring:message code='sal.btn.offer' /></button> 
                </dms:access>
                <%-- <button id="btnCancel"   type="button" class="btn_m"><spring:message code='sal.btn.cancel' /></button> --%>     <!-- 계약생성 -->
                <dms:access viewId="VIEW-D-13315" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSave"   type="button" class="btn_m"><spring:message code='global.btn.save' /></button>           
                </dms:access>
            </div>
        </div>
        <!-- 개인 -->
        <div id="sryh" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.menu.nameOfOwner' /></th>      <!-- 고객 -->
                        <!-- <td>
                              <input id="custNm" class="form_input onKey_up onKey_bulr" />
                        </td> -->
                        <td class="readonly_area">
                            <div class="form_float">
                               <!--  <div class="form_left"> -->
                                    <div class="form_search">
                                        <input id="custNm" class="form_input" readonly/>
                                        <a href="javascript:return false;" id="serchCustomer"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_01" type="hidden" />
                                    </div>
                                <!-- </div> -->
                                <!-- <div class="form_right">
                                    <input id="custCd_01" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
                                </div> -->
                            </div>
                        </td>
                        <th scope="row"><spring:message code='sal.menu.ownerContactTel' /></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <input id="hpNo" class="form_input" readonly/>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.certTp' /></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <input id="mathDocTp" class="form_comboBox" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12.1%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.perPapaerNo' /></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <input id="ssnCrnNo" class="form_input" readonly/>
                        </td>
                        <th scope="row"></th>    
                        <td class="readonly_area">
                        </td>
                        <th scope="row"></th>  
                        <td class="readonly_area">
                        </td>
                        <th scope="row"></th>  
                        <td class="readonly_area">
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12.1%;">
                    <col style="width:11%;">
                </colgroup>
                <tbody>
                    <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.menu.detailAddressOfCarBuyer' /></span></th>  <!-- 증서유형 -->
                        <td colspan="3">
                            <input id="addrDetlCont" class="form_input" maxlength='150'/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
 <!-- 单位用户信息 -->
<section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.menu.unitUserInfo' /></h2>         <!-- 고객정보 -->
            <div class="fl">
                 <label><input type="radio" id="unitUserInfo" class="form_check" name="addInfoChk" onclick="bf_addInfo('dwyh')"></label>     <!-- 정보입력 -->
            </div>
        </div>
        <!-- 개인 -->
        <div id="dwyh" class="table_form">
        <!--CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 start-->
        <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.wheEightFields' /></span></th>  <!-- 是否为八大处 -->
                        <td class="readonly_area">
                             <div style="padding:0px 0px 0px 10px;">
                              <label for="sRadioN" class="label_check">
                                <input type="radio" id="sRadioN" name="sRadio" value="Y"  class="form_check" onClick="javascript:changedRadio(false);"/>
                                <spring:message code='global.lbl.yes' />
                              </label> 
                              <label for="sRadioY" class="label_check">
                                <input type="radio" id="sRadioY" name="sRadio" value="N" class="form_check" onClick="javascript:changedRadio(true);"/>
                                 <spring:message code='global.lbl.n' />
                              </label> 
                              <!-- hidden class="form_input" class="form_input" type="hidden" -->
                               <input id="eigFld" name = "eigFld" type="hidden"/>
                             </div>
                        </td>
                        <th scope="row" id="eightFiCole"><spring:message code='sal.lbl.eightFields' /></th>  <!-- 八大处选择项 -->
                        <td>
                              <div style="padding:0px 0px 0px 10px;">
                              <input id="eightField" class="form_comboBox" />
                              </div>
                        </td>
                        <th scope="row"></th>    
                        <td class="readonly_area">
                        </td>
                        <th scope="row"></th>    
                        <td class="readonly_area">
                        </td>
                        
                   </tr>
                </tbody>
            </table>
            <!--CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 end-->
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.unitFullName' /></span></th>      <!-- 고객 -->
                        <td class="readonly_area">
                              <!-- <input id="officeNm" class="form_input" maxlength='100'/> -->
                              <div class="form_float">
                               <!--  <div class="form_left"> -->
                                    <div class="form_search">
                                        <input id="officeNm" class="form_input" readonly/>
                                        <a href="javascript:return false;" id="serchCustomerDwyh"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    </div>
                                <!-- </div> -->
                                <!-- <div class="form_right">
                                    <input id="custCd_01" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
                                </div> -->
                            </div>
                        </td>
                        <th scope="row"><spring:message code='sal.menu.unifiedSocialCreCode' /></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <input id="regNo" class="form_input" maxlength='50' readonly/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.corporateContact' /></span></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <input id="pername" class="form_input" maxlength='100' readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                   <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                       <th scope="row"><span class="bu_required"><spring:message code='sal.menu.unitContactTele' /></span></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <!-- <input id="perphon" class="form_input numberandalpha" /> -->
                            <input id="perphon" type="text" value="" class="form_input numberic" onblur="checkPhoneNum(this)"  maxlength="11" data-type="mobile" pattern="\d" data-json-obj="true" readonly/>
                        </td>
                       <th scope="row"><span class="bu_required"><spring:message code='sal.menu.nameOflegalUnit' /></span></th>      <!-- 고객 -->
                        <td>
                              <input id="ownRgstNm" class="form_input onKey_up onKey_bulr" maxlength='100'/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.contactTelNumberLegal' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <!-- <input id="ownRgstTelNo" class="form_comboBox" /> -->
                            <input id="ownRgstTelNo"  type="text" value="" class="form_input numberic" onblur="checkPhoneNum(this)"  maxlength="11" data-type="mobile" pattern="\d" data-json-obj="true" />
                        </td>
                    
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12.1%;">
                    <col style="width:87.9%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.detaAddrCarUnit' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="officeAds" class="form_input" maxlength='150'/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    
     <!-- 车辆基本信息 -->
<section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.lbl.carMaster'/></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.vehicleCode' /></span></th>      <!-- 고객 -->
                        <td>
                              <input id="modelCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.frameNumber' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="vinNo" class="form_comboBox" maxlength='30'/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.vehicleUse' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="wehicleUse" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.licensePlt' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="carRegNo" class="form_comboBox" maxlength='20'/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.licensePlateColor' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="carRegColor" class="form_comboBox"/>
                        </td>
                        <th scope="row"></th>  <!-- 증서유형 -->
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    
     <!-- 车辆行驶证信息 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.menu.vehiclePassInfo'/></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.brandModel' /></span></th>      <!-- 고객 -->
                        <td>
                              <input id="makerCd" class="form_input onKey_up onKey_bulr" maxlength='100'/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.drivingLicenseNum' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="drivePermitNo" class="form_comboBox" maxlength='20'/>
                        </td>
                        <%-- <th scope="row"><span class="bu_required"><spring:message code='sal.menu.cardCity' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="carRegCity" class="form_comboBox" maxlength='100'/>
                        </td> --%>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.regiDateDrivingLicense' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="drivLicenseDt" class="form_datepicker"/>
                        </td>
                        <th scope="row"></th>  
                        <td>
                        </td>
                        <th scope="row"></th> 
                        <td>
                        </td>
                    </tr>
                    <tr>
							<th scope="row"><span class="bu_required"><spring:message code="sal.btn.TopCityProvince" /></span></th>
							<!-- 省 -->
							<td id="sungNm"><input id="sheng" class="form_comboBox"
								data-json-obj="true" /></td>
							<th scope="row"><span class="bu_required"><spring:message code="par.lbl.city" /></span></th>
							<!--市-->
							<td id="cityNm"><input id="shi" class="form_comboBox"
								data-json-obj="true" /></td>
							<th scope="row"><span class="bu_required"><spring:message code="sal.lbl.distNm" /></span></th>
							<!-- 区 -->
							<td id="distNm"><input id="qu" class="form_comboBox"
								data-json-obj="true" /></td>
						</tr>
                       
                </tbody>
            </table>
        </div>
    </section>
    
    <!-- 车辆其他信息 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.menu.otherVehInfo'/></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <!--<span class="bu_required"></span> R20042300249 dms新能源补贴申请画面：车辆其他信息”类别中“购置税完税凭证号”字段不再作为信息必填项  贾明 2020-4-26-->
                        <th scope="row"><spring:message code='sal.menu.purcTaxNo' /></th>      <!-- 고객 -->
                        <td>
                              <input id="purcPayNo" class="form_input" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength='30'/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.trafCompNm' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="insurNo" class="form_comboBox" maxlength='30'/> <!--maxlength='20' 张伟丽反馈dms新能源车辆补贴申请的交强险保险单号位数放开到30位 贾明 2019-7-26-->
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.vehicleRegiNum' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="carRegiNo" class="form_comboBox" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength='20'/>
                        </td>
                    </tr>
                       
                    <tr>
                       <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.ReceiptCd' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="invoCo" class="form_comboBox" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength='20'/>
                        </td>
                        
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.invoiceNo' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="invoNo" class="form_comboBox" maxlength='20'/>
                        </td>
                        
                        
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.dateIniVehicle' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="carRegiDt" class="form_datepicker"/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.recpDt' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="invoDt" class="form_datepicker"/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.menu.invoiceAmount' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <!-- <input id="invoMn" type="text" value="" class="form_input numberic"  maxlength="11" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" /> -->
                            <input id="invoMn" name="invoMn"  type="text" maxlength="12" class="form_numeric ar" onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')"  data-json-obj="true" />
                        </td>
                    </tr>
                       
                </tbody>
            </table>
        </div>
    </section>
    <!-- 特殊地区 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.menu.fillSpecialAreas'/></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.menu.humanTypePropRigh' /></th>  <!-- 증서유형 -->
                        <td>
                            <input id="humanPropertyType" class="form_comboBox" />
                        </td>
                        <th scope="row"></th>  <!-- 증서유형 -->
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:87.9%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.menu.adderssForCarOfCorrespondingVehicle' /></th>  <!-- 증서유형 -->
                        <td>
                            <input id="addressChargingCar" class="form_comboBox" maxlength='150'/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>

<!-- 附件 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='par.lbl.attachment'/></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                    <col style="width:11%;">
                    <col style="width:21.3%;">
                    <col style="width:12%;">
                    <col style="width:21.3%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='par.lbl.attachment' /></span></th>      <!-- 고객 -->
                        <!-- <td>
                              <input id="encl" class="form_input onKey_up onKey_bulr" type="file"/>
                        </td> -->
                        <td colspan="3">
                                    <input required type="text" id="contractFileNm" name="contractFileNm" readonly class="form_input form_readonly" style="width:65%" data-name="<spring:message code="global.lbl.contractDoc" />" />
                                    <span class="btn_file" id="fileSelectContract" onclick="fnMoreFileUpload(this.id)" ><spring:message code="global.lbl.FindFile" /></span>  <!-- 파일찾기 -->
                                    <button type="button" id="contractFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                    <button type="button" id="contractFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                
                                    <a href="javascript:void(0)" onclick="showViewEncl()"><spring:message code='sal.menu.uploadInformaDesc' /></a>
								    <%-- <button id="btnAllEval" type="button" class="btn_m"><spring:message code='sal.menu.uploadInformaDesc' /></button>  --%>
							</td>
                        <th scope="row"></th>  <!-- 증서유형 -->
                        <td class="readonly_area">
                            <!-- <input id="statusNo" type="hidden" class="form_comboBox" readonly/> -->
                        </td>
                        <th scope="row"></th>  <!-- 증서유형 -->
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:87.9%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.remark' /></th>  <!-- 증서유형 -->
                        <td>
                            <textarea id="remarek" class="form_textarea" cols="150" maxlength='150'> </textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- uat 原因去掉 -->
            <%-- <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:88%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.menu.reason' /></th>      <!-- 고객 -->
                        <td>
                              <textarea id="reason" class="form_textarea" cols="150" maxlength='150'> </textarea>
                        </td>
                    </tr>
                </tbody>
            </table> --%>
        </div>
    </section>
    
    <section id="evalPopupWindow" class="pop_wrap">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col >
                    </colgroup>
                    <tbody>
                        <%-- <tr>
                            <th scope="row"></th> <!-- 심사결과 -->
                            <td>
                                <ul class="tabmenu">
                                    <li id="popupEvalRsltY" class="on"><button type="button"><spring:message code="sal.lbl.approvals" /></button></li> <!-- 일괄심사승인 탭-->
                                    <li id="popupEvalRsltN" ><button type="button"><spring:message code="sal.btn.reject" /></button></li>        <!-- 일괄심사불승인 탭 -->
                                    <input type="hidden" id="popupEvalRsltYn" name="popupEvalRsltYn" value="Y"/>
                                </ul>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRemark" /></th> <!-- 심사평가 -->
                            <td colspan="3">
                                <textarea id="popupRemark" name="popupRemark" rows="7" cols="" class="form_textarea" required data-name="<spring:message code="global.lbl.cont" />" ></textarea>
                            </td>
                        </tr> --%>
                         <!--<textarea id="explain" name="explain" rows="10" cols="" class="form_textarea" required data-name="<spring:message code="global.lbl.cont" />" ></textarea>-->
                          <div id="explain" class="view_beaury">
						 </div> 
                    </tbody>
                </table>
            </div>
        </section>
     
    <c:import url="/WEB-INF/jsp/sal/dlv/newEnergyVSApplication/selectNewEnergyFileUpload.jsp" />
<!-- hidden값  -->
</form>
<!-- 审批备注 R19073101727 贾明 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1 start-->
    <section class="group" id="reasonSet">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.menu.reason'/></h2>         
        </div>
        <div id="cust_01" class="table_form">
            <table>
                <tbody>
                    <tr>
                        <td>
                            <textarea id="reason" name="reason" rows="3" cols="" class="form_textarea"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- 审批备注 R19073101727 贾明 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1 end-->
<span style="display:none">
<input id="applicationNo" type="hidden" data-json-obj="true" >
<input id="vinNoBak" type="hidden" data-json-obj="true" >
<input type="text" id="headFileDocId" name="headFileDocId" data-json-obj="true" >
<input id="custCd" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
<input type="hidden" id="contractFileNo"  name="contractFileNo" class="form_input" style="width:5%"  data-json-obj="true">
<input id="statusNo" type="hidden" />
<input id="reason" type="hidden"/>
</span>
</section>
<!-- //계약관리 화면 -->

<!-- #스크립트 영역# -->
<script type="text/javascript">

var detailPopOpenYn = "N";
var evalPopOpenYn = "N";

var fileBtn = "";

var saveOrUpdate;

var tbSaveOrUpdate = "save";

var myDate = new Date();
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var applicationNo = "${sApplicationNo}";

// 사용자 직무, 채널유형
var chnInfoList = [];
<c:forEach var="obj" items="${dstbChnInfo}" varStatus="idx">
    chnInfoList.push({tskCd:"${obj.tskCd}", tskDetl:"${obj.tskDetl}", dstbChnCd:"${obj.dstbChnCd}", dstbChnNm:"${obj.dstbChnNm}"});
</c:forEach>
var chnInfo = chnInfoList[0];
chnInfoList = [];

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전


// 팝업 설정값
var options = parent.mainPopupWindow.options.content.data;

var popupWindow;
var dealerSearchPopupWin;

var ssnCrnTpPList = [];  
<c:forEach var="obj" items="${mathDocTpDS}">
<c:if test="${obj.remark1 eq 'P'}">
  ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>

</c:forEach>
//车辆用途
var wehicleUseList = [];
<c:forEach var="obj" items="${wehicleUseList}">
wehicleUseList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

var wehicleUseFinalList = [];
<c:forEach var="obj" items="${wehicleUseFinalList}">
wehicleUseFinalList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

//申请状态
var statusNolist = [];
<c:forEach var="obj" items="${statusNolist}">
statusNolist.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//车牌颜色
var carRegColorlist = [];
<c:forEach var="obj" items="${carRegColorlist}">
carRegColorlist.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//产权人类型 
var humanPropertyTypeList = [];
<c:forEach var="obj" items="${humanPropertyTypeList}">
humanPropertyTypeList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//车型代号
var modelCdStrList = [];
<c:forEach var="obj" items="${modelCdStrList}">
modelCdStrList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

//CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 start
//八大处数据
var eigFiesList = [];
<c:forEach var="obj" items="${eigFiesList}">
   eigFiesList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
console.log("八大处数据1",eigFiesList);
var eigFiesArr = dms.data.arrayToMap(eigFiesList, function(obj){return obj.cmmCd});
console.log("八大处数据",eigFiesArr);
//CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 end

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
//CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 start
   function changedRadio(flg){
   console.log("flg的值",flg);
    console.log("选择的值1",$("#eightField").data("kendoExtDropDownList").value());
       if(flg){
          $("#sRadioY").prop("checked", true);
          $("#eigFld").val("N");
          $("#eightField").data("kendoExtDropDownList").value("");
          $("#eightField").data("kendoExtDropDownList").enable(false);
          var eightFiCo = "<spring:message code='sal.lbl.eightFields' />";
          $("#eightFiCole").html(eightFiCo);
       }else{
         $("#sRadioN").prop("checked", true);
         $("#eigFld").val("Y");
         $("#eightField").data("kendoExtDropDownList").enable(true);
         var eightFiCo = "<span class='bu_required'><spring:message code='sal.lbl.eightFields' /></span>";
         $("#eightFiCole").html(eightFiCo);
       }
       console.log("选择的值",$("#eightField").data("kendoExtDropDownList").value());
    }
 //CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 end
</c:forEach>
/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {
	$("a").css("text-decoration", "underline");
	//统一社会信用代码只读
	$("#regNo").attr('disabled',true);
	//reason 只读
	document.getElementById("reason").setAttribute("disabled", true);
	$("#invoMn").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       //,value:0.00
       ,spinners:false
    });
	
	document.bgColor="Orange";
	var x=document.getElementById("modelCd").value;
	document.bgColor=x;
	
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
	//车型代号
	$("#modelCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(modelCdStrList)
       ,optionLabel:" "
       ,index:0
    });
    
    //CSR 111新能源申请流程增加八大领域功能选择项 八大领域 贾明 2020-6-18 start 
    $("#eightField").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(eigFiesList)
       ,optionLabel:" "
       ,index:0
       ,enable:true
    });
    //CSR 111新能源申请流程增加八大领域功能选择项 八大领域 贾明 2020-6-18 end
     
	//产权人类型
	$("#humanPropertyType").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(humanPropertyTypeList)
       ,optionLabel:" "
       ,index:0
    });
	//申请状态
	$("#statusNo").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(statusNolist)
       //,optionLabel:" "
       ,index:0
    });
	//车牌颜色
	$("#carRegColor").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(carRegColorlist)
       ,optionLabel:" "
       ,index:0
    });
	//证件类型
	$("#mathDocTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpPList)
       ,optionLabel:" "
       ,index:0
    });
	if(dms.string.isNotEmpty(options.sApplicationNo)){
		if(typeof(options.sApplicationNo) != "undefined"){
			saveOrUpdate = "update";
			//数据回显
			fn_contOnLoad(options); 
			console.log("sStatusNo的值",options.sStatusNo);
			if("01" == options.sStatusNo){
			   $("#reasonSet").hide();
			}
			$("#reason").val(options.sReason);//R19073101727 贾明 张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1
			$("#applicationNo").val(options.sApplicationNo);
			$("#vinNoBak").val(options.vinNoBak);
	    }
	   }else{
	      $("#reasonSet").hide();//R19073101727 贾明 张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1
		   $("#serchCustomer").attr('href','javascript:bf_searchCustomer("custNm")');
		   saveOrUpdate = "save";
		   $("#contractFileDel").hide();
    	   $("#contractFile").hide();
    	   //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 start
           	 $("#eightField").data("kendoExtDropDownList").value('');
           	 $("#eightField").data("kendoExtDropDownList").enable(false);  
           	 console.log("rr");
    	   //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 end
    	   //私人用户默认选中
    	   $("#privateUserInfo").attr("checked","checked");
    	   $("#dwyh input").val('');
   		   $("#dwyh input").attr('disabled',true);
   		   $("#sryh input").removeAttr('disabled');
   		   checkWehicleUse();
   		   //附件说明信息
   		   viewEnclXx('sryh'); 
	   }
	

	//判断私人用车还是单位用车车辆用途下拉选值
	function checkWehicleUse(){
	var ifUnitUserInfo = $("[name=addInfoChk]:checked").attr("id");
    if(ifUnitUserInfo=='unitUserInfo'){
    	$("#wehicleUse").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:wehicleUseList
            , index:0
        });
    }else{
    	$("#wehicleUse").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:wehicleUseFinalList
            , index:0
        });
    }
	}
	
	
	
	$("#drivLicenseDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
	$("#carRegiDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
	$("#invoDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    // 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            } 

           popupWindow = dms.window.popup({
               windowId :"messagePopup"
               ,title :false
               ,width :300
               ,height:110
               ,modal:true
               ,content :{
                   url :"<c:url value='/sal/dlv/newEnergyVSApplication/newEnergyVSApplicationMessagePopup.do' />"
                   ,data :{
                       "type" :null
                       ,"autoBind" :false
                       , msg :"<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />"
                       , btnMsg01 :"<spring:message code='global.btn.save' />"
                       , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc" :function(data){
                           if (data.msg == "01"){
                               // 직책별 할인금액 검사 로직 추가
                               dlrPromotionAmtChk(saveOrUpdate);
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });
        }
    });

    // 계약생성
    $("#btnCreate").kendoButton({
        enable:true,
        click:function(e){
        	tbSaveOrUpdate = "tb";
            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            } 

            popupWindow = dms.window.popup({
               windowId :"messagePopup"
               ,title :false
               ,width :300
               ,height:110
               ,modal:true
               ,content :{
                   url :"<c:url value='/sal/dlv/newEnergyVSApplication/newEnergyVSApplicationMessagePopup.do' />"
                   ,data :{
                       "type" :null
                       ,"autoBind" :false
                       , msg :"<spring:message code='sal.btn.offer' var='offer' /><spring:message code='global.info.cnfrmMsg' arguments='${offer}' />"
                       , btnMsg01 :"<spring:message code='sal.btn.offer' />"
                       , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc" :function(data){
                           if (data.msg == "01"){
                               // 직책별 할인금액 검사 로직 추가
                               
                               dlrPromotionAmtChk('putHand');
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });

        }
    });

    //取消
    $("#btnCancel").kendoButton({
        enable:true,
        click:function(e){
        	parent.mainPopupWindow.close();
        }
    });

   // DB동기화 - 재조회.
   function fn_contOnLoad(options){
       dms.loading.show();
       $.ajax({
          url :"<c:url value='/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplication.do' />"
          ,data :JSON.stringify({"sDlrCd":options.sDlrCd, "sApplicationNo":options.sApplicationNo})
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
              if(jqXHR.total > 0){
                fn_contGridDBclick(jqXHR.data[0]);
              }else{
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
              }
          }
      });
   }

   fn_contGridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){

    	   
           $("#addrDetlCont").val(selectedItem.addrDetlCont);     
           
           $("#carRegiDt").data("kendoExtMaskedDatePicker").value(selectedItem.carRegiDt);
           $("#custCd").val(selectedItem.custCd);
           console.log("测试1",selectedItem.custCd);
          
           $("#officeAds").val(selectedItem.officeAds);
           $("#ownRgstNm").val(selectedItem.ownRgstNm);
           $("#ownRgstTelNo").val(selectedItem.ownRgstTelNo);
           $("#modelCd").data("kendoExtDropDownList").value(selectedItem.modelCd);
           $("#vinNo").val(selectedItem.vinNo);
           
           $("#carRegNo").val(selectedItem.carRegNo);
           $("#carRegColor").data("kendoExtDropDownList").value(selectedItem.carRegColor);
           $("#carRegNo").val(selectedItem.carRegNo);
           $("#makerCd").val(selectedItem.makerCd);
           $("#drivePermitNo").val(selectedItem.drivePermitNo);
           $("#carRegCity").val(selectedItem.carRegCity);
           $("#drivLicenseDt").data("kendoExtMaskedDatePicker").value(selectedItem.drivLicenseDt);
           $("#invoDt").data("kendoExtMaskedDatePicker").value(selectedItem.invoDt);
           $("#purcPayNo").val(selectedItem.purcPayNo);
           $("#insurNo").val(selectedItem.insurNo);
           $("#carRegiNo").val(selectedItem.carRegiNo);
           $("#invoCo").val(selectedItem.invoCo);
           $("#invoNo").val(selectedItem.invoNo);
           //$("#invoMn").val(selectedItem.invoMn);
           $("#invoMn").data("kendoExtNumericTextBox").value(selectedItem.invoMn != null ? selectedItem.invoMn :0);
           $("#statusNo").data("kendoExtDropDownList").value(selectedItem.statusNo);
           $("#remarek").val(selectedItem.remarek);
           $("#reason").val(selectedItem.reason);
           $("#headFileDocId").val(selectedItem.headFileDocId);
           $("#contractFileNm").val(selectedItem.encl);
           $("#contractFileNo").val(selectedItem.newEnterFileNo);
           $("#humanPropertyType").data("kendoExtDropDownList").value(selectedItem.humanPropertyType);
           $("#addressChargingCar").val(selectedItem.addressChargingCar);
           $("#sheng").data("kendoExtDropDownList").text(selectedItem.sungNm);
           $("#shi").data("kendoExtDropDownList").text(selectedItem.cityNm);
       	   $("#qu").data("kendoExtDropDownList").text(selectedItem.distNm);
           
           if(selectedItem.headFileDocId != null && selectedItem.headFileDocId != 'undefined'){
        	   $("#fileSelectContract").hide();
           }else{
        	   $("#contractFileDel").hide();
        	   $("#contractFile").hide();
           }
           if(selectedItem.custTp != null && selectedItem.custTp != 'undefined'){
        	   if(selectedItem.custTp=='01'){
        		   $("#hpNo").val(selectedItem.hpNo);
                   $("#custNm").val(selectedItem.custNm);
                   $("#mathDocTp").data("kendoExtDropDownList").value(selectedItem.mathDocTp);  //证件类型
                   $("#ssnCrnNo").val(selectedItem.ssnCrnNo);
        		   $("#serchCustomer").attr('href','javascript:bf_searchCustomer("custNm")');
        		   $("#privateUserInfo").attr("checked","checked");
            	   $("#dwyh input").val('');
           		   $("#dwyh input").attr('disabled',true);
           		   $("#sryh input").removeAttr('disabled');
           		   $("#wehicleUse").kendoExtDropDownList({
           	       dataTextField:"cmmCdNm"
           	       , dataValueField:"cmmCd"
           	       , dataSource:wehicleUseFinalList
           	       , index:0
           	       });
           	       //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 start
           	       $("#eightField").data("kendoExtDropDownList").value('');
           	       $("#eightField").data("kendoExtDropDownList").enable(false);
           	       document.getElementById("sRadioN").setAttribute("disabled", true);
        	       document.getElementById("sRadioY").setAttribute("disabled", true);
           	       //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 end
           		   viewEnclXx('sryh');
        	   }else{
                   $("#officeNm").val(selectedItem.custNm);
                   $("#regNo").val(selectedItem.ssnCrnNo);
                   $("#pername").val(selectedItem.purcMngNm);
                   $("#perphon").val(selectedItem.hpNo);
        		   $("#serchCustomerDwyh").attr('href','javascript:bf_searchCustomer("custNm")');
        		   $("#unitUserInfo").attr("checked","checked");
            	   $("#sryh input").val('');
           		   $("#sryh input").attr('disabled',true);
           		   $("#dwyh input").removeAttr('disabled');
           		   $("#wehicleUse").kendoExtDropDownList({
           	       dataTextField:"cmmCdNm"
           	       , dataValueField:"cmmCd"
           	       , dataSource:wehicleUseList
           	       , index:0
           	       });
           	       //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 start
           	       $("#eigFld").val(selectedItem.whEightFields);
           	       console.log("选择的修士",selectedItem.whEightFields);
           	       if('Y' == selectedItem.whEightFields){
           	          $("#sRadioN").attr("checked","checked");
           	          var eightFiCo = "<span class='bu_required'><spring:message code='sal.lbl.eightFields' /></span>";
                      $("#eightFiCole").html(eightFiCo);
           	       }
           	       if('N' == selectedItem.whEightFields){
           	          var eightFiCo = "<spring:message code='sal.lbl.eightFields' />";
                      $("#eightFiCole").html(eightFiCo);
           	          $("#sRadioY").attr("checked","checked");
           	          $("#eightField").data("kendoExtDropDownList").enable(false);
           	       }
           	       $("#eightField").data("kendoExtDropDownList").value(selectedItem.eightFields);
           	        //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 end
           	       
           		viewEnclXx('dwyh');
        	   }
           }
           $("#wehicleUse").data("kendoExtDropDownList").value(selectedItem.wehicleUse);
           if(selectedItem.statusNo != null && selectedItem.statusNo != 'undefined'){
        	   if(selectedItem.statusNo!='01'&& selectedItem.statusNo!='04'){
        	       //八大领域  是否为八大领域 CSR 111新能源申请流程增加八大领域功能选择项   置灰 贾明 2020-6-18 start
        	       $("#eightField").data("kendoExtDropDownList").enable(false);
        	       document.getElementById("sRadioN").setAttribute("disabled", true);
        	       document.getElementById("sRadioY").setAttribute("disabled", true);
        	       //八大领域  是否为八大领域 CSR 111新能源申请流程增加八大领域功能选择项   置灰 贾明 2020-6-18 end
        		   $("#contForm input").attr("readonly",true);
        		   $("#carRegColor").data("kendoExtDropDownList").enable(false);
        		   $("#wehicleUse").data("kendoExtDropDownList").enable(false);
        		   $("#humanPropertyType").data("kendoExtDropDownList").enable(false);
        		   $("#modelCd").data("kendoExtDropDownList").enable(false);
        		   
        		   $("#carRegiDt").data("kendoExtMaskedDatePicker").enable(false);
        		   $("#drivLicenseDt").data("kendoExtMaskedDatePicker").enable(false);
        		   $("#drivLicenseDt").data("kendoExtMaskedDatePicker").enable(false);
        		   $("#invoDt").data("kendoExtMaskedDatePicker").enable(false);
        		   //删除按钮置灰
        		   document.getElementById("contractFileDel").setAttribute("disabled", true);
        		   document.getElementById("remarek").setAttribute("disabled", true);
        		   document.getElementById("reason").setAttribute("disabled", true);
        		   $("#btnCreate").data("kendoButton").enable(false);
        		   $("#btnSave").data("kendoButton").enable(false);
        		   //radio 置灰
        		   document.getElementById("unitUserInfo").setAttribute("disabled", true);
        		   document.getElementById("privateUserInfo").setAttribute("disabled", true);
        		   $("#serchCustomer").attr('href','javascript:return false;');
        		   $("#serchCustomerDwyh").attr('href','javascript:return false;');
        		   $("#sheng").data("kendoExtDropDownList").enable(false);
        		   $("#shi").data("kendoExtDropDownList").enable(false);
        		   $("#qu").data("kendoExtDropDownList").enable(false);
        	   }else{
        		   $("#contForm input").attr("readonly",false);
        		   $("#ssnCrnNo").attr("disabled",true);
        		   $("#hpNo").attr("disabled",true);
        		   $("#custNm").attr("disabled",true);
        		   $("#officeNm").attr("disabled",true);
                   $("#regNo").attr("disabled",true);
                   $("#pername").attr("disabled",true);
                   $("#perphon").attr("disabled",true);
        	   }
           }
       }
   }

   fnOnfocus = function(id){
       $("#"+ id +" ").select();
   }

   //$("#incAapTp02").click();       // 보험처리 - 최초:본인
   //$("#fincTp02").click();         // 금융 - 최초:본인
   //$("#tabRegTp02").click();       // 대행 - 최초:본인

   $("#dPopButton").show();
   
   $("#evalPopupWindow").kendoWindow({
       animation:false
       ,draggable:false
       ,modal:true
       ,resizable:false
       ,visible:false
       ,title:"<spring:message code='sal.menu.uploadInformaDesc' />"                             //일괄심사
       ,width:"650px"
       ,height:"200px"
   }).data("kendoWindow");

   /* $("#btnAllEval").kendoButton({
       click:function(e) {
           var win = $("#evalPopupWindow").data("kendoWindow");
           win.center();
           win.open();
       }
   }); */

});

function showViewEncl(){
	var win = $("#evalPopupWindow").data("kendoWindow");
    win.center();
    win.open();
}

function viewEnclXx(flag){
	var explain = document.getElementById("explain");
	//增加显示（需要扫描件）红色字体提示 update by lyy 2019-06-17 start
	if(flag=='sryh'){
		explain.innerHTML = "<p>个人客户上传附件内容为<font color='#FF0000'>（需要扫描件）</font>：</p>"
            +"<p>1.客户身份证（正反面）</p>"
            +"<p>2.机动车销售统一发票</p>"
            +"<p>3.北京现代汽车买卖合同</p>"
            +"<p>4.中华人民共和国机动车行驶证</p>"
            +"<p>5.中华人民共和国机动车登记证</p>"
            +"<p>6.车辆购置税完税证明正本</p>"
            +"<p>7.交通事故责任强制保险单正本</p>";
	}else{
		explain.innerHTML = "<p> 单位用户上传附件内容为<font color='#FF0000'>（需要扫描件）</font>：</p>"
            +"<p>1.机动车销售统一发票</p>" 
            +"<p>2.组织机构代码证</p>"
            +"<p>3.法人身份证（正反面）</p>"
            +"<p>4.购车人身份证（正反面）</p>"
            +"<p>5.北京现代汽车买卖合同</p>"
            +"<p>6.中华人民共和国机动车行驶证</p>"
            +"<p>7.中华人民共和国机动车登记证</p>"
            +"<p>8.车辆购置税完税证明正本</p>"
            +"<p>9.交通事故责任强制保险单正本</p>";
	}
	//增加显示（需要扫描件）红色字体提示 update by lyy 2019-06-17 end
}
//电话校验
/* function getCustDupByKey(idVal){
	var perphon = $("#perphon").val();
    var ownRgstTelNo = $("#ownRgstTelNo").val();
	if (!myreg.test(pone)) {
	      return false;
	    } else {
	      return true;
	    }
    } */

function checkPhoneNum(txt){
     var myreg = /^1[3456789][0-9]{9}$/;  //R19121002175 客户反馈 新能源车辆补贴申请界面，法人代表联系电话填写的是正确的手机号，并且试过多个手机号，但是保存时都会显示移动电话规格不符合  原因 此处  var myreg = /^[1][3,4,5,7,8][0-9]{9}$/ 校验规则有问题 更改成  var myreg = /^1[3456789][0-9]{9}$/
	if(txt.value.length!=11){
		dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired'/>");
	}else{
	if (!myreg.test(txt.value)) {
		  dms.notification.warning("<spring:message code='crm.info.regExpHpNo'/>");
	      return false;
	    } else {
	      return true;
	    }
     }
}
    
//jquery选择器 判断用户类型页面逻辑
var bf_addInfo = function(obj){

	var explain = document.getElementById("explain");
	if(obj=="dwyh"){
		$("#serchCustomer").attr('href','javascript:return false;');
		$("#serchCustomerDwyh").attr('href','javascript:bf_searchCustomer("custNm")');
		$("#sryh input").val('');
		$("#sryh input").attr('disabled',true);
		$("#dwyh input").removeAttr('disabled');
		$("#wehicleUse").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:wehicleUseList
            , index:0
        });
		$("#mathDocTp").data("kendoExtDropDownList").value("");
		$("#ssnCrnNo").attr("disabled",true);
	    $("#hpNo").attr("disabled",true);
		$("#custNm").attr("disabled",true);
		$("#officeNm").attr("disabled",true);
        $("#regNo").attr("disabled",true);
        $("#pername").attr("disabled",true);
        $("#perphon").attr("disabled",true);
		
		viewEnclXx('dwyh');
	}else{
		//javascript:bf_searchCustomer('custNm');
		$("#serchCustomerDwyh").attr('href','javascript:return false;');
		$("#serchCustomer").attr('href','javascript:bf_searchCustomer("custNm")');
		$("#dwyh input").val('');
		$("#dwyh input").attr('disabled',true);
		$("#sryh input").removeAttr('disabled');
		$("#wehicleUse").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:wehicleUseFinalList
            , index:0
        });
		$("#ssnCrnNo").attr("disabled",true);
	    $("#hpNo").attr("disabled",true);
		$("#custNm").attr("disabled",true);
		$("#officeNm").attr("disabled",true);
        $("#regNo").attr("disabled",true);
        $("#pername").attr("disabled",true);
        $("#perphon").attr("disabled",true);
        //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 start
           	 $("#eightField").data("kendoExtDropDownList").value('');
           	 $("#eightField").data("kendoExtDropDownList").enable(false);
           	 document.getElementById("sRadioN").setAttribute("disabled", true);
        	 document.getElementById("sRadioY").setAttribute("disabled", true);
        	 $("#sRadioN").removeAttr("checked");
        	 $("#sRadioY").removeAttr("checked");
        	 $("#eigFld").val('');
         //CSR 111新能源申请流程增加八大领域功能选择项  双击打开 时设置 八大处值  贾明 2020-6-19 end
		viewEnclXx('sryh');
		
	}
	
}

//附件
fileDownload = function (btnId){

        var fileDocNo = $("#headFileDocId").val();
        var fileNo = "";
        if(btnId == "contractFile"){//계약문서
            fileNo = $("#contractFileNo").val();
        }else if(btnId == "bussLicence"){//사업자등록증
            fileNo = $("#bussLicenceNo").val();
        }else if(btnId == "etcFile"){//기타
            fileNo = $("#etcFileNo").val();
        }else if(btnId == "addFile"){//보충자료
            fileNo = $("#addFileNo").val();
        }

        if(fileDocNo == "" || (fileDocNo != "" && fileNo == 0)){
            dms.notification.warning("没有添加的文件");
            return;
        }

        dms.fileManager.download(fileDocNo, fileNo);
    }
fnFileDel = function(btnId){

        if(btnId == "contractFileDel"){//계약문서
            $("#contractFileNm").val("");
            $("#contractFileNo").val(0);

            $("#headFileDocId").val("");
            fnShowBtn("fileSelectContract");
            fnHideBtn("contractFileDel,contractFile");
        }else if(btnId == "bussLicenceDel"){//사업자등록증
            $("#bussLicenceNm").val("");
            $("#bussLicenceNo").val(0);

            fnShowBtn("fileSelectBuss");
            fnHideBtn("bussLicenceDel,bussLicence");
        }else if(btnId == "etcFileDel"){//기타
            $("#etcFileNm").val("");
            $("#etcFileNo").val(0);

            fnShowBtn("fileSelectEtc");
            fnHideBtn("etcFileDel,etcFile");
        }else if(btnId == "addFileDel"){//보충자료


            $("#addFileNm").val("");
            $("#addFileNo").val(0);

            fnShowBtn("fileSelectAdd");
            fnHideBtn("addFileDel,addFile");
        }
    };
    
  //버튼 숨기기
    fnHideBtn = function (obj){
        var val = obj.split(",");
        $.each(val, function(idx, row){
            var btnId = row;
            $("#"+btnId+"").hide();
        });
    }

    //버튼 보이기
    fnShowBtn = function(obj){
        var val = obj.split(",");
        $.each(val, function(idx, row){
            var btnId = row;
            $("#"+btnId+"").show();
        });
    };
fnMoreFileUpload = function (id){
    $("#fileBtn").val(id);
    fileBtn = id;
}
$("#fileViewWindow").kendoWindow({
    animation:false
    ,draggable:true
    ,modal:true
    ,resizable:false
    ,visible:false
    ,title:"添加文件"
    ,width:"700px"
    ,height:"250px"
});
//附件

function onSelectCarlineCd(e){
    $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#fscCd").data("kendoExtDropDownList").enable(true);
    $("#modelCd").val("");

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
    $("#ocnCd").data("kendoExtDropDownList").enable(true);       // OCN 닫음

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);         // 지도가
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0.00);      // 순차량금액
    bf_addDcRealAmt();

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#fscCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    $("#fscCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(),""));

    // 금융상품
    if( $("#fincReqYn").val() == "Y"){
      var fincCmpCd = $("#fincCmpCd").data("kendoExtDropDownList").value();
      if( fincCmpCd === "BHAF" ){
          $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincBHAFItemObj[dataItem.carlineCd]);
      }else{
          $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[fincCmpCd]);
      }
    }

}// 차관에 따른 OCN검색 [차량영역]
function onSelectFscCd(e){
    $("#modelCd").val("");

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(true);

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    var dataItem = this.dataItem(e.item);
    //if(dataItem.fscCd == ""){
    //    $("#ocnCd").data("kendoExtDropDownList").enable(false);
    //    return false;
    //}

    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), dataItem.fscCd));

    $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);      // 순차량금액
    bf_addDcRealAmt();
}



//OCN에 따른 외장색 검색
function onSelectOcnCd(e){
    $("#modelCd").val("");

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(true);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    var dataItem = this.dataItem(e.item);
    if(dataItem.ocnCd == ""){
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    if(Number(dataItem.modelCnt) > 1){
        dms.notification.error("<spring:message code='sal.info.modelCntCheck' arguments='"+dataItem.ocnNm+","+dataItem.modelCnt+"' />");
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").value("");
        return false;
    }

    $("#modelCd").val(dataItem.modelCd);

    //차량 가격 세팅
    $("#retlAmt").data("kendoExtNumericTextBox").value(dataItem.msPrc);       // 지도가
    //$("#realCarAmt").data("kendoExtNumericTextBox").value(dataItem.msPrc);    // 순차량금액
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);    // 순차량금액
    bf_addDcRealAmt();

    $("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource($("#modelCd").val()));
}

// 외장색에 따른 내장색 검색
function onSelectExtColorCd(e){
    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(true);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    if(this.dataItem(e.item).ocnCd == ""){
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    $("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#modelCd").val()));
}// 차관(모델)의 DataSource를 불러온다.
function setModelDataSource(carlineCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectFsc.do' />"
        ,data :JSON.stringify({"sCarlineCd":carlineCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }
    return responseJson.data;
}



// OCN의 DataSource를 불러온다.
function setOcnDataSource(carlineCd, fscCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectOcn.do' />"
        ,data :JSON.stringify({"sCarlineCd":carlineCd, "sFscCd":fscCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }
    return responseJson.data;
}

// 외장색의 DataSource를 불러온다.
function setExtColorDataSource(modelCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractRe/selectExtColor.do' />"
        ,data :JSON.stringify({"modelCd":modelCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }

    return responseJson.data;
}

// 내장색의 DataSource를 불러온다.
function setIntColorDataSource(modelCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractRe/selectIntColor.do' />"
        ,data :JSON.stringify({"modelCd":modelCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }

    return responseJson.data;
}
// 대출 수수료 = 금융 탭
function bf_onFincAmt(){
    var fincFeeAmt = $("#fincFeeAmt").data("kendoExtNumericTextBox").value();
    if(fincFeeAmt == null){
        fincFeeAmt = 0;
        $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    $("#fincAmt").data("kendoExtNumericTextBox").value( Number(fincFeeAmt) );
    bf_sumCarAmt();
}


// 보험수수료 = 보험 탭
function bf_onIncAmt(){
    var incExpcAmt = $("#incExpcAmt").data("kendoExtNumericTextBox").value()
      , realIncAmt = $("#realIncAmt").data("kendoExtNumericTextBox").value()
      , incFeeAmt  = $("#incFeeAmt").data("kendoExtNumericTextBox").value();

    if(incExpcAmt == null){
        incExpcAmt = 0;
        $("#incExpcAmt").data("kendoExtNumericTextBox").value(incExpcAmt);
    }
    if(realIncAmt == null){
        realIncAmt = 0;
        $("#realIncAmt").data("kendoExtNumericTextBox").value(realIncAmt);
    }
    if(incFeeAmt == null){
        incFeeAmt = 0;
        $("#incFeeAmt").data("kendoExtNumericTextBox").value(incFeeAmt);
    }

    $("#incAmt").data("kendoExtNumericTextBox").value(realIncAmt>0?realIncAmt+incFeeAmt:incExpcAmt+incFeeAmt);
    bf_sumCarAmt();
}

// 순차량금액 조정
function bf_addDcRealAmt(){
    var realCarAmt = $("#realCarAmt").data("kendoExtNumericTextBox").value();
    if(realCarAmt == null){
        realCarAmt = 0;
        $("#realCarAmt").data("kendoExtNumericTextBox").value(realCarAmt);
    }

    $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
    bf_sumCarAmt();
}

// 차량가격 계산
function bf_sumCarAmt(){
   var carAmt     = Number($("#retlAmt").data("kendoExtNumericTextBox").value());
   var realCarAmt = Number($("#realCarAmt").data("kendoExtNumericTextBox").value());
   var dcAmt      = carAmt - realCarAmt;
   //2016.11.03 이승민과장 로직추가 : carAmt == 0은 할인가 표시 안함.
   //$("#promotionAmt").data("kendoExtNumericTextBox").value(carAmt==0?0:dcAmt);
   $("#promotionAmt").val(carAmt==0?0.00:dcAmt);

   var beforeAmt = Number($("#reservContAmt").data("kendoExtNumericTextBox").value());
   var goodsAmt = Number($("#goodsAmt").data("kendoExtNumericTextBox").value());
   var incAmt   = Number($("#incAmt").data("kendoExtNumericTextBox").value());
   var fincAmt  = Number($("#fincAmt").data("kendoExtNumericTextBox").value());
   var sbstAmt  = Number($("#sbstAmt").data("kendoExtNumericTextBox").value());
   var aapAmt   = Number($("#aapAmt").data("kendoExtNumericTextBox").value());
   var pointAmt = Number($("#pointAmt").data("kendoExtNumericTextBox").value());

   // 실제차량금액 = 지도가 - 예판가격 + 용품 + 보험 + 금융 + 중고차(-) + 대행 - 할인 + 포인트(-)
   var carTotAmt = carAmt - beforeAmt + goodsAmt + incAmt + fincAmt + sbstAmt + aapAmt - dcAmt + pointAmt;

   // 총판매 금액 : 실제차량금액
   $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt);

   //중고차 보조금
   var subsidyAmt = Number($("#subsidyAmt").data("kendoExtNumericTextBox").value());
   switch($("#sbusTp").val()){
       case '1':
           $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
           break;
       case '2':
           $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
           $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt-subsidyAmt);
           break;
       case '3':
           $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt-subsidyAmt);
           $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt-subsidyAmt);
           break;
   }

   // 금융신청금액 = 완성차가격 - 자기금액
   if( dms.string.strNvl($("#fincReqYn").val()) == "Y"){
       var fincBurdAmt = Number($("#fincBurdAmt").data("kendoExtNumericTextBox").value());
       var realAmt = Number($("#realAmt").data("kendoExtNumericTextBox").value());
       fincBurdAmt = fincBurdAmt < 0 ? 0 : fincBurdAmt;
       var fincReqAmt = realAmt - fincBurdAmt;
       $("#fincReqAmt").data("kendoExtNumericTextBox").value(fincReqAmt);

       if( fincReqAmt > 0  && realAmt > 0){
              $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / realAmt) * 100 );
          }else{
              $("#fincLoadRate").data("kendoExtNumericTextBox").value(0.00);
          }
   }
}

// 중고차치환 여부 변경 change
bf_uatcCarPurcYnChk = function(chk){
    if(chk == "Y"){
        $("#sUsrVinNo").attr("disabled", false);
        $("#purcNo").attr("disabled", false);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(true);
        $('input[name="tabSbusTp"]').prop("disabled", false);
        $("#subsidyAmt").data("kendoExtNumericTextBox").enable(true);
    }else{
        $("#sUsrVinNo").val('');
        $("#usrVinNo").val('');
        $("#purcNo").val('');

        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#sbusTp").val('1');
        //$("#tabSbusTp01").attr("checked", true);
        $("#tabSbusTp01").prop('checked', true);

        bf_addUsrSbstAmt();

        $("#sUsrVinNo").attr("disabled", true);
        $("#purcNo").attr("disabled", true);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
        $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
        $('input[name="tabSbusTp"]').prop("disabled", true);
    }
}

// 중고차 치환 ( 음수로 표시 요청 )
bf_addUsrSbstAmt = function(){
    var usrSbstAmt = $("#usrSbstAmt").data("kendoExtNumericTextBox").value();
    if(usrSbstAmt == null){
        usrSbstAmt = 0;
        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
    }
    $("#sbstAmt").data("kendoExtNumericTextBox").value( Number(usrSbstAmt) * -1 );

    // 중고차 기업보조금
    var subsidyAmt = $("#subsidyAmt").data("kendoExtNumericTextBox").value();
    if(subsidyAmt == null){
        subsidyAmt = 0;
        $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    bf_sumCarAmt();
}
// 대행 - 계약금 포함여부
bf_checkAapAmmt = function(obj, uid){
    var uidVal = uid;

    var grid = $("#aapGrid").data("kendoExtGrid");
    var selectRow = grid.dataSource.getByUid(uid);
    if(obj.checked){
        selectRow[obj.id] = "Y";
    }else{
        selectRow[obj.id] = "N";
    }
    selectRow["dirty"] = true;

    var rows = grid.tbody.find("tr");
    var chkAmt = 0;
    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);
        if(item.aapImplyYn == "Y"){
            chkAmt += Number(item.realAapAmt);
        }
    });

    $("#aapAmt").data("kendoExtNumericTextBox").value(chkAmt);
    bf_sumCarAmt();
}

//대행업무 그리드 초기화
function initAapGrid(){
    var grid = $("#aapGrid").data('kendoExtGrid');
    grid.dataSource.data([]);

    var rowNum = 0;
    $.each(aapWorkList, function(index, row){
        if( row["useYn"] == "Y" && row["remark1"] == "P" ){
            grid.dataSource.insert(rowNum, {
                "aapWorkTp":row["cmmCd"]
                ,"realAapAmt":0
                ,"aapImplyYn":"Y"
            }).set("dirty", true);
        }
    });
}


// 보험 : 총금액포함여부 체크
bf_incImplyYn = function(){
  if( $("#incImplyYn").prop('checked') ){
      bf_onIncAmt();
  }else{
      $("#incAmt").data("kendoExtNumericTextBox").value(0.00);
      bf_sumCarAmt();
  }
}

// 보험예상금액
bf_sumIncAmt = function(){
    var incExpcAmt  = $("#incExpcAmt").data("kendoExtNumericTextBox").value();
    var realIncAmt = $("#realIncAmt").data("kendoExtNumericTextBox").value();

    if(incExpcAmt == null){
        incExpcAmt = 0;
        $("#incExpcAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    if(realIncAmt == null){
        realIncAmt = 0;
        $("#realIncAmt").data("kendoExtNumericTextBox").value(0.00);
    }
    $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( incExpcAmt - realIncAmt );
}

//용품Grid 수량 및 값 입력시 계산.
bf_gridSumGoodsAmt = function(){
     var grid = $("#goodsGrid").data("kendoExtGrid");
     var rows = grid.tbody.find("tr");
     var oItem, oRealGoodsAmt = 0;

     rows.each(function(index, row) {
         oItem = grid.dataItem(rows[index]);
        if(oItem.realGoodsAmt != null){
            oRealGoodsAmt += Number(oItem.totAmt);
        }
     });

    $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
    $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
    bf_sumCarAmt();
}

// 포인트 금액
bf_sumPointAmt = function(){
    var blueMembershipPointVal  = $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value();

    if(blueMembershipPointVal == null || blueMembershipPointVal < 0){
        blueMembershipPointVal = 0;
        $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0);
    }

    // 비율
    var bmRate = Number($("#bluePointApplyRate").val()) ;

    /*
    var bmPointAmt = Number($("#point").data("kendoExtNumericTextBox").value()) / (bmRate * 100) ;

    bmPointAmt = Math.floor(bmPointAmt);
    if( (bmPointAmt - blueMembershipPointVal) < 0 ){
        blueMembershipPointVal = bmPointAmt;
        $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( bmPointAmt );
        dms.notification.info("<spring:message code='global.lbl.savePoint' var='globalLblSavePoint' /><spring:message code='crm.lbl.amount' var='crmLblAmount' /><spring:message code='sal.info.maxInfoChk' arguments='${globalLblSavePoint},${crmLblAmount}' />");
    }
    $("#tBlueAmount").data("kendoExtNumericTextBox").value( blueMembershipPointVal * bmRate );

    // 포인트 금액
    $("#pointAmt").data("kendoExtNumericTextBox").value( blueMembershipPointVal * -1 );
    */

    var point = Number($("#point").data("kendoExtNumericTextBox").value());

    if( (point - blueMembershipPointVal) < 0 ){
        blueMembershipPointVal = point;
       $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( point );
        dms.notification.info("<spring:message code='sal.info.usePointChk' />");
    }

    var pointAmt = blueMembershipPointVal * bmRate;
    $("#tBlueAmount").data("kendoExtNumericTextBox").value( pointAmt );
    $("#pointAmt").data("kendoExtNumericTextBox").value( pointAmt * -1 );

    bf_sumCarAmt();
}

// 포인트 조회
function fn_bmPointLoad(custNo){
    $.ajax({
       url :"<c:url value='/sal/cnt/contractMnt/selectBuleMemeberInfoSearch.do' />"
       ,data :JSON.stringify({"dlrCd":dlrCd, "custNo":custNo})
       ,type :'POST'
       ,dataType :'json'
       ,contentType :'application/json'
       ,error :function(jqXHR,status,error) {
           if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }else{
               dms.notification.error(error);
           }
           $("#blueMembershipId").val('');
           $("#blueMembershipNo").val('');
           $("#bluePointApplyRate").val('1');
           $("#mLevel").data("kendoExtDropDownList").value('');
           $("#point").data("kendoExtNumericTextBox").value(0.00);
           $("#regDt").data("kendoExtMaskedDatePicker").value('');
       }
       ,success :function(jqXHR, textStatus) {
           if(jqXHR.IsSuccess){
               if(jqXHR.Data != null){
                    //console.log("BM Point result : ", jqXHR);
                    $("#blueMembershipId").val(dms.string.strNvl(jqXHR.Data.BlueMembership_Id));
                    $("#blueMembershipNo").val(dms.string.strNvl(jqXHR.Data.BlueMembership_No));
                    $("#bluePointApplyRate").val(dms.string.strNvl(jqXHR.Data.Scale));
                    $("#mLevel").data("kendoExtDropDownList").value(dms.string.strNvl(jqXHR.Data.Mlevel));
                    $("#point").data("kendoExtNumericTextBox").value(Number(jqXHR.Data.Point));
                    $("#regDt").data("kendoExtMaskedDatePicker").value(jqXHR.Data.regDt);
                    //$("#blueMembershipNo").val(jqXHR.blueMembershipNo);
                    //console.log("jqXHR.Data.Mlevel : ",jqXHR.Data.Mlevel);
                }else{
                    $("#blueMembershipId").val('');
                    $("#blueMembershipNo").val('');
                    $("#bluePointApplyRate").val('1');
                    $("#mLevel").data("kendoExtDropDownList").value('');
                    $("#point").data("kendoExtNumericTextBox").value(0.00);
                    $("#regDt").data("kendoExtMaskedDatePicker").value('');
                }
           }else{
               dms.notification.error("<spring:message code='sal.lbl.bmPoint'/> : "+ jqXHR.Message);

               $("#blueMembershipId").val('');
               $("#blueMembershipNo").val('');
               $("#bluePointApplyRate").val('1');
               $("#mLevel").data("kendoExtDropDownList").value('');
               $("#point").data("kendoExtNumericTextBox").value(0.00);
               $("#regDt").data("kendoExtMaskedDatePicker").value('');
           }
       }
   });
}

// 딜러조회
bf_dealerSearchPopup = function(){
    return ;
    dealerSearchPopupWin = dms.window.popup({
        windowId :"dealerSearchPopupWin"
        ,title :"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        ,modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                , data:{
                    "autoBind" :false
                    ,"dlrCd":$("#sDlrCd").val()
                    ,"closeAfterSelect":true
                    ,"callbackFunc" :function(data){
                        if(data.length >= 1) {
                            $("#dlrCd").val(data[0].dlrCd);
                            $("#dlrNm").val(data[0].dlrNm);
                        }
                    }
                }
        }
    });
}

// 예약판매 조회
function fn_beforeNoSearch(){
    if(readOnlyFlag){ return; }

    var obj = {};
    obj["dlrCd"] = dlrCd;
    obj["saleEmpNo"] = $("#saleEmpNo").val();
    obj["beforeNo"] = $("#beforeNo").val();

    if( $("#custTp").val() == "01" ){
        obj["custNm"] =  $("#vCustNm_01").val();
        obj["custNo"] =  $("#custCd_01").val();
    }else{
        obj["custNm"] =  $("#vCustNm_02").val();
        obj["custNo"] =  $("#custCd_02").val();
    }

    parent.bf_beforeNoSearchPopup(obj);
}
// 예약판매 조회 call back
function bf_beforeNoSearchPopupCallBack(data){
    if(data.length > 0){
        $("#beforeNo").val(dms.string.strNvl(data[0].beforeNo));
        $("#beforeImplyYn").val(dms.string.strNvl(data[0].implyYn));
        if(data[0].implyYn == "Y"){
            $("#reservContAmt").data("kendoExtNumericTextBox").value(data[0].beforeAmt);
        }else{
            $("#reservContAmt").data("kendoExtNumericTextBox").value(0);
        }
        $("#dlReqDt").data("kendoExtMaskedDatePicker").value(kendo.toString(data[0].beforeContractDt, "<dms:configValue code='dateFormat' />"));

        data[0].msPrc = data[0].retlAmt;
        data[0].mathDocTp = data[0].ssnCrnTp;
        data[0].hpNo = data[0].telNo1;
        data[0].telNo = data[0].telNo2;
        bf_customerSet(data);
        bf_vinNoSet(data);
    }
}

// CRM 고객 데이터 조회
bf_searchCustomer = function(sIdNm){

    var sMngScId = "";
    //if(saleAdminYn != "Y"){   //전체권한자는 고객전체 검색 가능.
        sMngScId = userId;
    //}

    var responseJson = {};
    /* if( dms.string.trim($("#"+sIdNm).val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractMnt/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sAddrTp":"02", "sCustNm":$("#"+sIdNm).val(), "sMngScId":sMngScId})
            ,async :false
        });
    } */

    if(responseJson != null && responseJson.total == 1){
        bf_customerSet(responseJson.data);
    }else{
        var obj = {};
        obj["sIdNm"] = $("#"+sIdNm).val();
        obj["sMngScId"] = '';
        obj["sAddrTp"] = "02";
        parent.bf_pSearchCustomer(obj);
    }
}
function bf_customerSet(data){
	console.log(data);
    //$("#custCd_01").val(data[0].custNo);
	var ifUnitUserInfo = $("[name=addInfoChk]:checked").attr("id");
	$("#custCd").val(data[0].custNo);
		console.log('e',data[0].custNo);
    if(ifUnitUserInfo=='unitUserInfo'){
    	    if(data[0].custTp=='02'){
    	    $("#officeNm").val(data[0].custNm);  
    	    $("#pername").val(data[0].purcMngNm);  
 	        $("#perphon").val(data[0].hpNo); 
 	        $("#regNo").val(data[0].ssnCrnNo); 
 	        $("#regNo").attr('disabled',true);
 	        /*} else{
 	        	$("#regNo").val(""); 
 	        	$("#regNo").removeAttr('disabled');
 	        } */
 	        
 	        //$("#officeAds").val(data[0].addrFull);  //购车地址备用
    	    }else{
    	    	dms.notification.info("<spring:message code='sal.menu.unitUserInfo' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
    	    }
    }else{
    	    if(data[0].custTp=='01'){
    	    $("#ssnCrnNo").val(data[0].ssnCrnNo);
    	    $("#mathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp);
    	    $("#custNm").val(data[0].custNm);  
    	    $("#hpNo").val(data[0].hpNo);    
 	        //$("#addrDetlCont").val(data[0].addrFull);  //购车地址备用
    	    //身份证号置灰
    		//$("#hpNo").attr('disabled',true);
    		//$("#ssnCrnNo").attr('disabled',true);
    	    }else{
    	    	dms.notification.info("<spring:message code='sal.menu.privateUserInfo' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
    	    }
    }
   
}

//우편번호 찾기
bf_custZipCodeSearch = function (custTp){
    if(readOnlyFlag){ return; }

    var obj = {};
    obj["custTp"] = custTp;
    obj["sZipCd"] = $("#zipCd_"+custTp).val();
    obj["sValue"] = $("#sungNm_"+custTp).val();
    parent.bf_pSearchZipCode(obj);
}
//우편번호 찾기 call back
function bf_custZipCodeSearchCallBack(data){
    if(data.length > 0){
        var custTp = data[0].custTp;

        $("#zipCd_"+custTp).val(data[0].zipCd);
        $("#sungNm_"+custTp).val(data[0].sungNm);
        $("#sungCd_"+custTp).val(data[0].sungCd);
        $("#cityNm_"+custTp).val(data[0].cityNm);
        $("#cityCd_"+custTp).val(data[0].cityCd);
        $("#distNm_"+custTp).val(data[0].distNm);
        $("#distCd_"+custTp).val(data[0].distCd);
        //$("#addrDetlCont_"+custTp).val('');
     }
}

//용품조회
selectGoodsSearchPopup = function(goodsCd, pkgItemCd){
    var obj = {};
    obj["dlrCd"] = dlrCd;
    obj["carlineCd"] = $("#carlineCd").data("kendoExtDropDownList").value();
    obj["goodsCd"] = goodsCd;
    obj["pkgItemCd"] = pkgItemCd;

    parent.bf_pSearchGoodsSearchPopup(obj);
}
//용품조회 call back
function bf_goodsSearchPopupCallBack(data, type){
    var tData = {};
    var grid = $("#goodsGrid").data("kendoExtGrid");
    var selectItem = grid.dataItem(grid.select());

    if(type == "package"){       // 패키지
        var pkgItemCd = "", isPackageFlag = false;

        for(var i=0; i<data.length; i++){
            tData = data[i];
            pkgItemCd = tData["pkgItemCd"];

            if(i == 0){

                var rowNum = 0;
                var rows = grid.tbody.find("tr");
                $.each(rows, function(index, row) {
                    var rowItem = grid.dataItem(row);

                    if(pkgItemCd == rowItem.pkgItemCd){
                        isPackageFlag = true;
                    }

                    if(selectItem.uid == rowItem.uid ){
                        rowNum = index;
                    }
                });

                if(isPackageFlag){
                    // 동일한 패키지가 존재합니다.
                    dms.notification.info("<spring:message code='sal.info.IsPackageMsg'/>");
                    return false;
                }
                selectItem.set("dlrCd", dlrCd);
                selectItem.set("contractNo", $("#contractNo").val());
                selectItem.set("statCd", "10");
                selectItem.set("goodsCd", tData.itemCd);
                selectItem.set("goodsNm", tData.itemNm);
                selectItem.set("goodsCnt", 1);
                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd:tData.itemUnitCd );
                selectItem.set("goodsPrc", Number(tData.itemPrc));
                selectItem.set("dcRate", Number(tData.pkgDetlDcRate));
                selectItem.set("dcAmt",   Number(tData.pkgDetlDcAmt));
                selectItem.set("goodsAmt", Number(tData.pkgDetlDcTotAmt) );
                selectItem.set("realGoodsAmt", Number(tData.pkgDetlDcTotAmt) );
                selectItem.set("eqipCostAmt", 0 );
                selectItem.set("totAmt", Number(tData.pkgDetlDcTotAmt));
                selectItem.set("expcEqipDt", "");
                selectItem.set("eqipPrsnId", "");
                selectItem.set("expcGiEndDt", "");
                selectItem.set("realDlDt", "");
                selectItem.set("pkgItemCd", pkgItemCd);
                selectItem.set("grStrgeCd",   "");
                selectItem.set("giStrgeCd",   tData.strgeCd);
                selectItem.set("eqipEndDt", "");
                selectItem.set("dirty", true);
            }else{
                grid.dataSource.insert(rowNum+i, {
                    "dlrCd":dlrCd
                    ,"contractNo":$("#contractNo").val()
                    ,"statCd":"10"
                    ,"goodsCd":tData.itemCd
                    ,"goodsNm":tData.itemNm
                    ,"goodsCnt":1
                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd :tData.itemUnitCd
                    ,"goodsPrc":Number(tData.itemPrc)
                    ,"dcRate":Number(tData.pkgDetlDcRate)
                    ,"dcAmt":Number(tData.pkgDetlDcAmt)
                    ,"goodsAmt":Number(tData.pkgDetlDcTotAmt)
                    ,"realGoodsAmt":Number(tData.pkgDetlDcTotAmt)
                    ,"eqipCostAmt":0
                    ,"totAmt":Number(tData.pkgDetlDcTotAmt)
                    ,"expcEqipDt":""
                    ,"eqipPrsnId":""
                    ,"expcGiEndDt":""
                    ,"realDlDt":""
                    ,"pkgItemCd":pkgItemCd
                    ,"grStrgeCd":""
                    ,"giStrgeCd":tData.strgeCd
                    ,"eqipEndDt":""
                }).set("dirty", true);
            }
        }
    }
    else{

        for(var i=0; i<data.length; i++){
            tData = data[i];

            if(i == 0){
                var rowNum = 0;
                var rows = grid.tbody.find("tr");
                $.each(rows, function(index, row) {
                    var rowItem = grid.dataItem(row);
                    if(selectItem.uid == rowItem.uid ){
                        rowNum = index;
                    }
                });

                selectItem.set("dlrCd", dlrCd);
                selectItem.set("contractNo", $("#contractNo").val());
                selectItem.set("goodsCd", tData.itemCd);
                selectItem.set("goodsNm", tData.itemNm);
                selectItem.set("goodsCnt", 1);
                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd) );
                selectItem.set("goodsPrc", Number(tData.retlPrc));
                selectItem.set("dcRate", 0);
                selectItem.set("dcAmt", 0);
                selectItem.set("goodsAmt", Number(tData.retlPrc) );
                selectItem.set("realGoodsAmt", Number(tData.retlPrc) * 1);
                selectItem.set("eqipCostAmt", Number(tData.etc2) );
                selectItem.set("totAmt", Number(tData.retlPrc) );
                selectItem.set("expcEqipDt", "");
                selectItem.set("eqipPrsnId", "");
                selectItem.set("expcGiEndDt", "");
                selectItem.set("realDlDt", "");
                selectItem.set("pkgItemCd", "");
                selectItem.set("grStrgeCd", "");
                selectItem.set("giStrgeCd", tData.strgeCd);
                selectItem.set("eqipEndDt", "");
                selectItem.set("dirty", true);
            }else{
                grid.dataSource.insert(rowNum+i, {
                    "dlrCd":dlrCd
                    ,"contractNo":$("#contractNo").val()
                    ,"goodsCd":tData.itemCd
                    ,"goodsNm":tData.itemNm
                    ,"goodsCnt":1
                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd)
                    ,"goodsPrc":Number(tData.retlPrc)
                    ,"dcRate":0
                    ,"dcAmt":0
                    ,"goodsAmt":Number(tData.retlPrc)
                    ,"realGoodsAmt":Number(tData.retlPrc) * 1
                    ,"eqipCostAmt":Number(tData.etc2)
                    ,"totAmt":Number(tData.retlPrc)
                    ,"expcEqipDt":""
                    ,"eqipPrsnId":""
                    ,"expcGiEndDt":""
                    ,"realDlDt":""
                    ,"pkgItemCd":""
                    ,"grStrgeCd":""
                    ,"giStrgeCd":tData.strgeCd
                    ,"eqipEndDt":""
                }).set("dirty", true);
            }
        }
    }

}

// 보험 item 추가 call back
function bf_incItemPopupCallBack(data, num){
    var grid = $("#incGrid").data("kendoExtGrid");

    var sDt = kendo.parseDate(toDay);
        sDt.setMonth(sDt.getMonth() + 12);
        sDt.setDate(sDt.getDate() -1);
    var eDt = kendo.toString(sDt, "<dms:configValue code='dateFormat' />");

    var tData = {};

    if(typeof(num) == "undefined" ){
        for(var i=0; i<data.length; i++){
            tData = data[i];
            if(!isincDtlItem(tData.cmmCd)){
                grid.dataSource.insert(i, {
                    "incTp":tData.cmmCd
                   ,"valRecAmt":""
                   ,"incExpcAmt":""
                   ,"realIncAmt":""
                   ,"incPrid":12
                   ,"incStartDt":kendo.parseDate(toDay)
                   ,"incEndDt":kendo.parseDate(eDt)
               }).set("dirty", true);
            }
        }
    }else{
        for(var i=0; i<data.length; i++){
            tData = data[i];
            if(!isincDtlItem(tData.incTp)){
                grid.dataSource.insert(i, {
                    "incTp":tData.incTp
                   ,"valRecAmt":""
                   ,"incExpcAmt":""
                   ,"realIncAmt":""
                   ,"incPrid":12
                   ,"incStartDt":kendo.parseDate(toDay)
                   ,"incEndDt":kendo.parseDate(eDt)
               }).set("dirty", true);
            }
        }
    }

}
// 보험Grid 보험유형 중복체크
function isincDtlItem(iTp){
    var flag = false;
    var grid = $('#incGrid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");

    rows.each(function(index, row){
        var data = grid.dataItem(row);
        if(iTp == data.incTp){
            flag = true;
        }
    });
    return flag;
}

//보험 : 제3자 책임보험 금액표시
function bf_incAmtTemplate(incTp, amt) {
    if(incTp == "03"){
        return dms.string.strNvl(threeIncTpAmtObj[amt]) == ""?0.00:threeIncTpAmtObj[amt];
    }else{
        return kendo.toString(Number(amt), "n2");
    }
}

//대행업무 item 추가 call back
function bf_aapItemPopupCallBack(data){
    var grid = $("#aapGrid").data("kendoExtGrid");
    var tData = {};

    for(var i=0; i<data.length; i++){
        tData = data[i];
        if(!isAapDtlItem(tData.cmmCd)){
            grid.dataSource.insert(i, {
                "aapWorkTp":tData.cmmCd
               ,"realAapAmt":0
               ,"aapImplyYn" :"Y"
           }).set("dirty", true);
        }
    }
}


//대행업무 Grid 보험유형 중복체크
function isAapDtlItem(iTp){
    var flag = false;
    var grid = $('#aapGrid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");

    rows.each(function(index, row){
        var data = grid.dataItem(row);
        if(iTp == data.aapWorkTp){
            flag = true;
        }
    });
    return flag;
}



//중고차 VIN NO 조회 검색
bf_searchUsedCarVinNo = function(){
    if( dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "N" ){ return ;}

    var obj = {};
    obj["sDlrCd"] = dlrCd;
    obj["sVinNo"] = $("#sUsrVinNo").val().toUpperCase();
    parent.bf_pSearchUsedCarVinNo(obj);
}
//중고차 vin no call back
function bf_searchUsedCarVinNoCallBack(data){
    $("#sUsrVinNo").val(dms.string.strNvl(data[0].vinNo));
    $("#usrVinNo").val(dms.string.strNvl(data[0].vinNo));
    $("#purcNo").val(dms.string.strNvl(data[0].purcNo));

    $("#usrSbstAmt").data("kendoExtNumericTextBox").value(Number(data[0].purcTotAmt));
    bf_addUsrSbstAmt();
}
$("#sUsrVinNo").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchUsedCarVinNo();
        }
    }else{
        if(dms.string.strNvl($("#sUsrVinNo").val().toUpperCase()) != dms.string.strNvl($("#usrVinNo").val().toUpperCase()) ){
            $("#usrVinNo").val('');
        }
    }
});

//신차 VIN NO 조회 검색
bf_searchVinNo = function(){
    if(readOnlyFlag){ return; }

    var responseJson = {};
    if( dms.string.trim($("#sVinNo").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractMnt/selectContractReVinNoSearch.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0
                    , "sDlrCd":dlrCd
                    , "sVinNo":$("#sVinNo").val().toUpperCase()
                    , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                    , "sFscCd" :$("#fscCd").data("kendoExtDropDownList").value()
                    , "sModelCd":$("#modelCd").val()
                    , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                    , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                    , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                  })
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){

        // block된 차량은 선택이 불가능 합니다.
        /*
        if(dms.string.strNvl(saleAdminYn) == "N"
            && dms.string.strNvl(saleEmpYn) == "Y"
            && responseJson.data[0].blockYn == "Y"
            && responseJson.data[0].blockSaleAdvNo != dms.string.strNvl(userId)
        ){
            dms.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
            return;
        }
        */

        if( dms.string.isEmpty($("#contractNo").val()) || dms.string.strNvl($("#contractNo").val()) != dms.string.strNvl(responseJson.data[0].contractNo)){
            if( dms.string.strNvl(responseJson.data[0].blockSaleAdvNo) != ""
             && responseJson.data[0].blockSaleAdvNo != dms.string.strNvl(userId)){  // 판매고문 지정
                  // block된 차량은 선택이 불가능 합니다.
                  dms.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
                  return false;
            }
            if(responseJson.data[0].damageCd == "01"){      // 차량 손상
                // 손상된 차량은 선택이 불가능 합니다.
                dms.notification.info("<spring:message code='sal.info.damageBlockMsg'/>");
                return false;
            }
            if(responseJson.data[0].ownStatCd == "A"){      // 차량 배정
                // 고객명, 계약번호 이 차량을 점용했습니다.
                dms.notification.info("<spring:message code='global.lbl.customer'/> "+responseJson.data[0].custNm+","+responseJson.data[0].contractNo+"<spring:message code='sal.info.carPrivateMsg'/>");
                return false;
            }
            if(responseJson.data[0].expAprYn == "Y"){       // 이상출고 통과된 차량
                // 고객명, 계약번호 이 차량을 점용했습니다.
                dms.notification.info("<spring:message code='global.lbl.customer'/> "+responseJson.data[0].custNm+","+responseJson.data[0].contractNo+"<spring:message code='sal.info.carPrivateMsg'/>");
                return false;
            }
        }

        bf_vinNoSet(responseJson.data);
    }else{
        var obj = {"sDlrCd" :dlrCd
                 , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                 , "sCarlineNm" :$("#carlineCd").data("kendoExtDropDownList").text()
                 , "sFscCd" :$("#fscCd").data("kendoExtDropDownList").value()
                 , "sFscNm" :$("#fscCd").data("kendoExtDropDownList").text()
                 , "sModelCd":$("#modelCd").val()
                 , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                 , "sOcnNm" :$("#ocnCd").data("kendoExtDropDownList").text()
                 , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                 , "sExtColorNm" :$("#extColorCd").data("kendoExtDropDownList").text()
                 , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                 , "sIntColorNm" :$("#intColorCd").data("kendoExtDropDownList").text()
                 , "sVinNo":$("#sVinNo").val().toUpperCase()
                 , "sContractNo":$("#contractNo").val()
                };

        parent.bf_pSearchVinNo(obj);
    }

}
function bf_vinNoSet(data){
    if(dms.string.strNvl(data[0].vinNo) != ""){
        //$("#sVinNo2").val(data[0].vinNo.substring(11,17));
        $("#sVinNo").val(data[0].vinNo);
    }
    $("#vinNo").val(dms.string.strNvl(data[0].vinNo));
    //$("#carRetlAmt").data("kendoExtNumericTextBox").value(data[0].retlPrc);
    $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));

    if($("#carlineCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].carlineCd)){
        $("#carlineCd").data("kendoExtDropDownList").value(dms.string.strNvl(data[0].carlineCd));
    }

    if( dms.string.isEmpty($("#fscCd").data("kendoExtDropDownList").value())
            || $("#fscCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].fscCd)){
       var fscCd = $("#fscCd").data("kendoExtDropDownList");
       fscCd.setDataSource([{fscNm:dms.string.strNvl(data[0].fscNm), fscCd:dms.string.strNvl(data[0].fscCd)}]);
       fscCd.value(dms.string.strNvl(data[0].fscCd));
       fscCd.enable(false);
    }

    if( dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value())
            || $("#ocnCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].ocnCd)){
       var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
       ocnCd.setDataSource([{ocnNm:dms.string.strNvl(data[0].ocnNm), ocnCd:dms.string.strNvl(data[0].ocnCd)}]);
       ocnCd.value(dms.string.strNvl(data[0].ocnCd));
       ocnCd.enable(false);
    }

    $("#modelCd").val(dms.string.strNvl(data[0].modelCd));

    if( dms.string.isEmpty($("#extColorCd").data("kendoExtDropDownList").value())
            || $("#extColorCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].extColorCd)){
       var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
       extColorCd.setDataSource([{extColorNm:dms.string.strNvl(data[0].extColorNm), extColorCd:dms.string.strNvl(data[0].extColorCd)}]);
       extColorCd.value(dms.string.strNvl(data[0].extColorCd));
       extColorCd.enable(false);
    }

    if( dms.string.isEmpty($("#intColorCd").data("kendoExtDropDownList").value())
            || $("#intColorCd").data("kendoExtDropDownList").value() != data[0].intColorCd){
       var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
       intColorCd.setDataSource([{intColorNm:dms.string.strNvl(data[0].intColorNm), intColorCd:dms.string.strNvl(data[0].intColorCd)}]);
       intColorCd.value(dms.string.strNvl(data[0].intColorCd));
       intColorCd.enable(false);
    }

    // 금융상품
    if( $("#fincReqYn").val() == "Y"){
        var fincCmpCd = $("#fincCmpCd").data("kendoExtDropDownList").value();
        if( fincCmpCd === "BHAF" ){
        	debugger;
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincBHAFItemObj[dms.string.strNvl(data[0].carlineCd)]);
        }else{
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[dms.string.strNvl(data[0].carlineCd)]);
        }
    }

    // 소매, 도매가
    //$("#whslAmt").data("kendoExtNumericTextBox").value(Number(data[0].whPrc));
    $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));
    //$("#realCarAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);  // 순차량금액
    bf_addDcRealAmt();
}

$("#sVinNo").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchVinNo();
        }
    }
    if($(this).val() == ""){
        $("#vinNo").val("");
    }

});

// 증서유형, 증서번호 수정 제한.
function bf_blockSsnCrnNo(dlrCd, custNo){
    if(dms.string.isEmpty(custNo)){
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectAbleToEditSsnCrnNoSearch.do' />"
        ,data :JSON.stringify({"dlrCd":dlrCd, "contractCustNo":custNo})
        ,async :false
    });

    return dms.string.strNvl(responseJson);
}


//예판번호 취소
function bf_initBeforeNo(){
    if(readOnlyFlag){ return; }

    $("#beforeNo").val("");
    $("#beforeImplyYn").val("N");
    $("#reservContAmt").data("kendoExtNumericTextBox").value(0.00);
    bf_sumCarAmt();
}

//임시배정 취소
function bf_initVinNo(){
    if(readOnlyFlag){ return; }

    if($("#contractTp").data("kendoExtDropDownList").value() == "D"){
        return ;
    }

    $("#carlineCd").data("kendoExtDropDownList").value("");

    $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#fscCd").data("kendoExtDropDownList").enable(false);

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    $("#modelCd").val("");

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    // 금융-금융사 DataSet재설정
    $("#fincCmpCd").change();

    $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
    //$("#promotionAmt").data("kendoExtNumericTextBox").value(0);    // 프로모션 :치환차감
    $("#promotionAmt").val(0);
    bf_sumCarAmt();

    $("#sVinNo").val('');  // Vin_No
    $("#vinNo").val('');    // vin no
}

//판매기회, 집단판매 CRM고객정보 갱신 조회
function bf_crmCustSearch(){
    var sCustTp = $("#custTp").val();
    var sCustCd = $("#custCd_"+sCustTp).val();

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
        ,data :JSON.stringify({"sDlrCd":dlrCd, "sAddrTp":"02", "sCustNo":sCustCd})
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success :function(jqXHR, textStatus) {
            bf_customerSet(jqXHR);
        }
    });
}

//견적 버튼 클릭
bf_clickEstimate = function (){
    open("https://www.bhaf-bhmc.com.cn/", "<spring:message code='sal.title.fincEstimate' />", 'top=0,left=0,width=950,height=500,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');

}

/** 무결성 검사 **/
function save_Validate(){
     console.log("保存")
     console.log("选择的值1",document.getElementById("sRadioN").checked);
	var ifCheck = $("[name=addInfoChk]:checked").attr("id");
    if(ifCheck=='unitUserInfo'){
    
      //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-18 start 
        var radioN = document.getElementById("sRadioN").checked;//是否为八大领域 是  是否选择
        var radioY = document.getElementById("sRadioY").checked;//是否为八大领域 否  是否选择
        console.log(typeof(radioY));
        if(!radioN && !radioY){
            dms.notification.info("<spring:message code='sal.menu.wheEightFields' var='wheEightFields' /><spring:message code='global.info.chkSelectItemMsg' arguments='${wheEightFields}' />");
            return false;
        }
        if(radioN){
           var eightField =  $("#eightField").val();
           if(dms.string.isEmpty(eightField)){
    		 dms.notification.info("<spring:message code='sal.lbl.eightFields' var='eightFields' /><spring:message code='global.info.chkSelectItemMsg' arguments='${eightFields}' />");
             return false;
    	    }
    	}
       //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-18 end
       
    	//单位名称校验
    	if(dms.string.isEmpty($("#officeNm").val())){
    		dms.notification.info("<spring:message code='sal.menu.unitFullName' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
            $("#officeNm").focus();
            return false;
    	}
    	/* //统一社会信用代码
    	if(dms.string.isEmpty($("#regNo").val())){
    		dms.notification.info("<spring:message code='sal.menu.unifiedSocialCreCode' var='globalLblContractDt' /><spring:message code='par.info.issueCheckMsg' arguments='${globalLblContractDt}' />");
            $("#regNo").focus();
            return false;
    	} */
    	//购车人姓名
    	if(dms.string.isEmpty($("#pername").val())){
    		dms.notification.info("<spring:message code='sal.menu.nameOfCarBuyer' var='globalLblContractDt' /><spring:message code='par.info.issueCheckMsg' arguments='${globalLblContractDt}' />");
            $("#pername").focus();
            return false;
    	}
    	//购车人联系电话
    	if(dms.string.isEmpty($("#perphon").val())){
    		dms.notification.info("<spring:message code='sal.menu.carBuyerConTel' var='globalLblContractDt' /><spring:message code='par.info.issueCheckMsg' arguments='${globalLblContractDt}' />");
            $("#perphon").focus();
            return false;
    	}else{
    	    if($("#perphon").val()!=""){
    	     var myreg = /^1[3456789][0-9]{9}$/;  //R19121002175 客户反馈 新能源车辆补贴申请界面，法人代表联系电话填写的是正确的手机号，并且试过多个手机号，但是保存时都会显示移动电话规格不符合  原因 此处  var myreg = /^[1][3,4,5,7,8][0-9]{9}$/ 校验规则有问题 更改成  var myreg = /^1[3456789][0-9]{9}$/
    	    	if($("#perphon").val().length!=11){
    	    		dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired'/>");
    	    		$("#perphon").focus();
    	    		return false;
    	    	}else{
    	    	if (!myreg.test($("#perphon").val())) {
    	    		  dms.notification.warning("<spring:message code='crm.info.regExpHpNo'/>");
    	    		  $("#perphon").focus();
    	    	      return false;
    	    	    } 
    	         }
    	    }
    	}
    	
    	//法人代表联系电话
    	if(dms.string.isEmpty($("#ownRgstTelNo").val())){
    		dms.notification.info("<spring:message code='sal.menu.contactTelNumberLegal' var='globalLblContractDt' /><spring:message code='par.info.issueCheckMsg' arguments='${globalLblContractDt}' />");
            $("#ownRgstTelNo").focus();
            return false;
    	}else{
    		if($("#ownRgstTelNo").val()!=""){
    	        var myreg = /^1[3456789][0-9]{9}$/;  //R19121002175 客户反馈 新能源车辆补贴申请界面，法人代表联系电话填写的是正确的手机号，并且试过多个手机号，但是保存时都会显示移动电话规格不符合  原因 此处  var myreg = /^[1][3,4,5,7,8][0-9]{9}$/ 校验规则有问题 更改成  var myreg = /^1[3456789][0-9]{9}$/
    	    	if($("#ownRgstTelNo").val().length!=11){
    	    		dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired'/>");
    	    		$("#ownRgstTelNo").focus();
    	    		return false;
    	    	}else{
    	    	if (!myreg.test($("#ownRgstTelNo").val())) {
    	    		  dms.notification.warning("<spring:message code='crm.info.regExpHpNo'/>");
    	    		  $("#ownRgstTelNo").focus();
    	    	      return false;
    	    	    }
    	         }
    	    }
    	}
    	//购车单位详细地址
    	if(dms.string.isEmpty($("#officeAds").val())){
    		dms.notification.info("<spring:message code='sal.menu.detaAddrCarUnit' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
            $("#officeAds").focus();
            return false;
    	}
    	if(dms.string.isEmpty($("#ownRgstNm").val())){
    		dms.notification.info("<spring:message code='sal.menu.nameOflegalUnit' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
            $("#ownRgstNm").focus();
            return false;
    	}
    }else{
    	//购车人详细地址校验
    	if(dms.string.isEmpty($("#addrDetlCont").val())){
    		dms.notification.info("<spring:message code='sal.menu.detailAddressOfCarBuyer' var='globalLblContractDt' /><spring:message code='par.info.issueCheckMsg' arguments='${globalLblContractDt}' />");
            $("#addrDetlCont").focus();
            return false;
    	}
    	//购车人姓名校验
    	if(dms.string.isEmpty($("#custNm").val())){
    		dms.notification.info("<spring:message code='sal.menu.nameOfOwner' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
            $("#custNm").focus();
            return false;
    	}
    }
    
    
    var ss = $("#drivLicenseDt").data("kendoExtMaskedDatePicker").value();
    if($("#drivLicenseDt").data("kendoExtMaskedDatePicker").value() == "" || $("#drivLicenseDt").data("kendoExtMaskedDatePicker").value() == null){
        dms.notification.info("<spring:message code='sal.menu.regiDateDrivingLicense' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
        $("#drivLicenseDt").focus();
        return false;
    }

    /* if( dms.string.strNvl($("#contractNo").val()) == ""
            && kendo.toString($("#contractDt").data("kendoExtMaskedDatePicker").value(),"yyyy-MM-dd") < toDay ){
        // {계약일자}은 {현재일자}보다 작을 수 없습니다.
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='sal.lbl.toDay' var='salLblToDay' /><spring:message code='sal.info.CheckDateForm' arguments='${globalLblContractDt},${salLblToDay}' />");
        $("#drivLicenseDt").focus();
        return false;
    } */

    if( dms.string.isEmpty($("#carRegiDt").data("kendoExtMaskedDatePicker").value())){
        dms.notification.info("<spring:message code='sal.menu.dateIniVehicle' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
        $("#carRegiDt").focus();
        return false;
    }

    if( dms.string.isEmpty($("#invoDt").data("kendoExtMaskedDatePicker").value())){
        dms.notification.info("<spring:message code='sal.lbl.recpDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        $("#invoDt").focus();
        return false;
    }

    if( dms.string.isEmpty($("#modelCd").val())){
        dms.notification.info("<spring:message code='sal.menu.vehicleCode' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#modelCd").focus();
        return false;
    }
    
    if( dms.string.isEmpty($("#wehicleUse").val())){
        dms.notification.info("<spring:message code='global.lbl.vehicleUse' var='salLblSsnCrnNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblSsnCrnNo}' />");
        $("#wehicleUse").focus();
        return false;
    }
    

    if( dms.string.isEmpty($("#carRegNo").val())){
        dms.notification.info("<spring:message code='global.lbl.licensePlt' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#carRegNo").focus();
        return false;
    }else{
    	var myreg = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4,6}[A-Z0-9挂学警港澳]{1}$/;
    	if (!myreg.test($("#carRegNo").val())) {
    		  dms.notification.warning("<spring:message code='sal.info.LicensePlateRulesNotCompliant'/>");
    		  $("#carRegNo").focus();
    	      return false;
    	    }
    }
  
    if( dms.string.isEmpty($("#carRegColor").val())){
        dms.notification.info("<spring:message code='sal.lbl.licensePlateColor' var='salLblSsnCrnNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblSsnCrnNo}' />");
        $("#carRegColor").focus();
        return false;
    }
    
    
    if( dms.string.isEmpty($("#makerCd").val())){
        dms.notification.info("<spring:message code='sal.menu.brandModel' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#makerCd").focus();
        return false;
    }
    
    if( dms.string.isEmpty($("#drivePermitNo").val())){
        dms.notification.info("<spring:message code='sal.menu.drivingLicenseNum' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#drivePermitNo").focus();
        return false;
    }
    
    /* if( dms.string.isEmpty($("#carRegCity").val())){
        dms.notification.info("<spring:message code='sal.menu.cardCity' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#carRegCity").focus();
        return false;
    } */
    
    // R20042300249 dms新能源补贴申请画面：车辆其他信息”类别中“购置税完税凭证号”字段不再作为信息必填项  贾明 2020-4-26 start 
    /**
    if( dms.string.isEmpty($("#purcPayNo").val())){
        dms.notification.info("<spring:message code='sal.menu.purcTaxNo' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#purcPayNo").focus();
        return false;
    }
    **/
    // R20042300249 dms新能源补贴申请画面：车辆其他信息”类别中“购置税完税凭证号”字段不再作为信息必填项  贾明 2020-4-26 end 
    
    if( dms.string.isEmpty($("#insurNo").val())){
        dms.notification.info("<spring:message code='sal.menu.trafCompNm' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#insurNo").focus();
        return false;
    }
    
    
    if( dms.string.isEmpty($("#carRegiNo").val())){
        dms.notification.info("<spring:message code='sal.menu.vehicleRegiNum' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#carRegiNo").focus();
        return false;
    }
    
    if( dms.string.isEmpty($("#invoCo").val())){
        dms.notification.info("<spring:message code='sal.lbl.ReceiptCd' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#invoCo").focus();
        return false;
    }
    
    if( dms.string.isEmpty($("#invoNo").val())){
        dms.notification.info("<spring:message code='sal.lbl.invoiceNo' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#invoNo").focus();
        return false;
    }
    
    if( dms.string.isEmpty($("#invoMn").val())){
        dms.notification.info("<spring:message code='sal.lbl.rcptAmt' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#invoMn").focus();
        return false;
    }
    
    if( dms.string.isEmpty($("#contractFileNm").val())){
        dms.notification.info("<spring:message code='par.lbl.attachment' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        //$("#contractFileNm").focus();
        return false;
    }
    
    //车架号校验  
    if( dms.string.isEmpty($("#vinNo").val())){
        dms.notification.info("<spring:message code='sal.menu.frameNumber' var='salLblSsnCrnNo' /><spring:message code='par.info.issueCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#vinNo").focus();
        return false;
    }
     console.log("车辆号",$("#vinNo").val());
    if( !dms.string.isEmpty($("#vinNo").val())){
    	if(!checkViNno()){
    		return false;
    	}
    }
    
    
    return true;
}

function checkViNno(){
	/**
	*业务逻辑整理  首先获取saveOrUpdate值   save为新建 update为更新
	*tbSaveOrUpdate判断是否为提报 tb为提报标识 如果时提报操作
	*当为新建时 判断当前车架号数量为=0
	*当为更新时 判断当前车架号是否与原来的值不一致  如果不一致 flagUs为update 那么当前车架号数量为=0  如果一致时flagUs为save 当前车架号数量为<=1
	*如果是保存  那么当前车架号数量为=0  
	*/
	var flag = null;
	var sVinNos = $("#vinNo").val();
	var param = {"vinNo": sVinNos}
	var flagUs = "save";  //校验vinNo是更新还是新建  新建判断当前车辆申请数量不能大于0  新增
	if(saveOrUpdate=="update"){
		var ifUpdate = $("#vinNoBak").val();
		if(ifUpdate!=sVinNos){
			flagUs = "update";
		}
	}
	var custCd = $("#custCd").val();
	
	//JSON.stringify(param)  sal.rpt.portletTitle14
	URLAddr = "<c:url value='/sal/dlv/newEnergyVSApplication/checkVinNoIfContain.do' />";
	$.ajax({
        url:URLAddr
        ,data: {"vinNo":sVinNos,"tbSaveOrUpdate":tbSaveOrUpdate,"saveOrUpdate":saveOrUpdate,"flagUs":flagUs,"custCd":custCd}
	    ,async:false
        ,type:'POST'
        ,error :function(jqXHR,status,error) {
            if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors);
            }else{
                dms.notification.error(error);
            }
        }
        ,success :function(jqXHR, textStatus) {
        	if(jqXHR=='"false1"'){
        		flag = false;
            	dms.notification.info("<spring:message code='sal.menu.fillNumberAgain' var='salLblSsnCrnNo' /><spring:message code='sal.menu.checkCarIfContain' arguments='${salLblSsnCrnNo}' />");
                $("#vinNo").focus();
                return false;
            }else if(jqXHR=='"false"'){
            	flag = false;
            	dms.notification.info("<spring:message code='sal.menu.fillNumberAgain' var='salLblSsnCrnNo' /><spring:message code='sal.menu.carNotApplication' arguments='${salLblSsnCrnNo}' />");
                $("#vinNo").focus();
                return false;
            }else if(jqXHR=='"false2"'){
            	flag = false;
            	dms.notification.info("<spring:message code='sal.menu.fillNumberAgain' var='salLblSsnCrnNo' /><spring:message code='sal.menu.carAlreadyApplication' arguments='${salLblSsnCrnNo}' />");
                $("#vinNo").focus();
                return false;
            }else if(jqXHR=='"false3"'){
            	flag = false;
            	dms.notification.info("<spring:message code='sal.menu.pleaSeleCustInfom' var='salLblSsnCrnNo' /><spring:message code='sal.menu.custInfoCurrVehi' arguments='${salLblSsnCrnNo}' />");
                $("#vinNo").focus();
                return false;
            }else if(jqXHR=='"false4"'){
            	dms.notification.info("<spring:message code='sal.menu.pleaseVerifyCustomerInformation' var='salLblSsnCrnNo' /><spring:message code='sal.menu.theCurrNotBoundContract' arguments='${salLblSsnCrnNo}' />");
            	//return true;
            	flag = true;
            }else{
            	flag = true;
            }
        }
    });
	return flag;
}

/**
 * 직책별 할인금액 관리.
 */
function dlrPromotionAmtChk(mFlag){
	save(mFlag);
}


/*********
 * 저장
 *********/
function save(mFlag){
    dms.loading.show();     // 로딩 시작
    var param = {
        "newEnergyVSApplicationVO" :$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"))
    };
    param.newEnergyVSApplicationVO.drivLicenseDt = $("#drivLicenseDt").data("kendoExtMaskedDatePicker").value();           // 계약일
    param.newEnergyVSApplicationVO.carRegiDt = $("#carRegiDt").data("kendoExtMaskedDatePicker").value();                 // 인도요청일
    param.newEnergyVSApplicationVO.invoDt = $("#invoDt").data("kendoExtMaskedDatePicker").value();           // 신청일자
    //CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-19 start
    console.log("数据有",$("#eigFld").val());
    param.newEnergyVSApplicationVO.eightFields = $("#eightField").data("kendoExtDropDownList").value();//八大领域值
    param.newEnergyVSApplicationVO.whEightFields = $("#eigFld").val(); //是否是 八大领域
    console.log("4",param);
    //CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-19 end
    // 금액
    param.newEnergyVSApplicationVO.applicationNo  = $("#applicationNo").val();
    param.newEnergyVSApplicationVO.custNm  = $("#custNm").val();
    param.newEnergyVSApplicationVO.custCd  = $("#custCd").val();
    param.newEnergyVSApplicationVO.hpNo  = $("#hpNo").val();
    param.newEnergyVSApplicationVO.mathDocTp  = $("#mathDocTp").val();
    param.newEnergyVSApplicationVO.ssnCrnNo  = $("#ssnCrnNo").val();
    param.newEnergyVSApplicationVO.addrDetlCont  = $("#addrDetlCont").val();
    param.newEnergyVSApplicationVO.officeNm  = $("#officeNm").val();
    param.newEnergyVSApplicationVO.regNo  = $("#regNo").val();
    param.newEnergyVSApplicationVO.pername  = $("#pername").val();
    param.newEnergyVSApplicationVO.perphon  = $("#perphon").val();
    param.newEnergyVSApplicationVO.officeAds  = $("#officeAds").val();
    param.newEnergyVSApplicationVO.ownRgstNm  = $("#ownRgstNm").val();
    param.newEnergyVSApplicationVO.ownRgstTelNo  = $("#ownRgstTelNo").val();
    param.newEnergyVSApplicationVO.modelCd  = $("#modelCd").val();
    param.newEnergyVSApplicationVO.vinNo  = $("#vinNo").val();
    param.newEnergyVSApplicationVO.wehicleUse  = $("#wehicleUse").val();
    param.newEnergyVSApplicationVO.carRegNo  = $("#carRegNo").val();
    param.newEnergyVSApplicationVO.carRegColor  = $("#carRegColor").val();
    param.newEnergyVSApplicationVO.makerCd  = $("#makerCd").val();
    param.newEnergyVSApplicationVO.drivePermitNo  = $("#drivePermitNo").val();
    param.newEnergyVSApplicationVO.carRegCity  = $("#carRegCity").val();
    param.newEnergyVSApplicationVO.purcPayNo  = $("#purcPayNo").val();
    param.newEnergyVSApplicationVO.insurNo  = $("#insurNo").val();
    param.newEnergyVSApplicationVO.carRegiNo  = $("#carRegiNo").val();
    param.newEnergyVSApplicationVO.invoCo  = $("#invoCo").val();
    param.newEnergyVSApplicationVO.invoNo  = $("#invoNo").val();
    //param.newEnergyVSApplicationVO.invoMn  = $("#invoMn").val();
    param.newEnergyVSApplicationVO.invoMn  = $("#invoMn").data("kendoExtNumericTextBox").value();
    param.newEnergyVSApplicationVO.encl  = $("#contractFileNm").val();
    param.newEnergyVSApplicationVO.remarek  = $("#remarek").val();
    param.newEnergyVSApplicationVO.reason  = $("#reason").val();
    param.newEnergyVSApplicationVO.humanPropertyType  = $("#humanPropertyType").val();
    param.newEnergyVSApplicationVO.addressChargingCar  = $("#addressChargingCar").val();
    param.newEnergyVSApplicationVO.sungNm =$("#sheng").data("kendoExtDropDownList").text();
    param.newEnergyVSApplicationVO.cityNm = $("#shi").data("kendoExtDropDownList").text();
    param.newEnergyVSApplicationVO.distNm = $("#qu").data("kendoExtDropDownList").text();
    if(mFlag=="putHand"){
    	param.newEnergyVSApplicationVO.statusNo  = "02";
    	param.newEnergyVSApplicationVO.applDt  = myDate;
    	param.newEnergyVSApplicationVO.approveCd  = 'B';
    }else{
    	param.newEnergyVSApplicationVO.statusNo  = $("#statusNo").val();
    	param.newEnergyVSApplicationVO.approveCd  = 'C';
    }
     
    param.newEnergyVSApplicationVO.headFileDocId  = $("#headFileDocId").val(); 
    param.newEnergyVSApplicationVO.newEnterFileNo  = $("#contractFileNo").val(); 
    
    var ifCheck = $("[name=addInfoChk]:checked").attr("id");
   
    if(ifCheck=='unitUserInfo'){
    	param.newEnergyVSApplicationVO.custTp  = '02';
    	param.newEnergyVSApplicationVO.carBuyArea  = '02';
    }else{
    	param.newEnergyVSApplicationVO.custTp  = '01';
    	param.newEnergyVSApplicationVO.carBuyArea  = '01';
    }
    //return false;
    var URLAddr = "";
    if(saveOrUpdate == "save"){
        URLAddr = "<c:url value='/sal/dlv/newEnergyVSApplication/insertnewEnergyVSApplication.do' />";
    }else{
        URLAddr = "<c:url value='/sal/dlv/newEnergyVSApplication/updateNewEnergyVSApplication.do' />";
    }  

    $.ajax({
        url:URLAddr
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error :function(jqXHR,status,error) {
            dms.loading.hide();   // 로딩 종료

            if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors);
            }else{
                dms.notification.error(error);
            }
        }
        ,success :function(jqXHR, textStatus) {
            dms.loading.hide();   // 로딩 종료
            var data = {};
            data.msg = 'save';
            data.cntNo = jqXHR;
            options.callbackFunc(data);
            //refreshAll();
            parent.mainPopupWindow.close();
        }
    });
}

/**
 * 备用
 */
function remove(){
    if($("#contractNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약삭제 승인전
    if( $("#contractStatCd").val() == "10" ){
        var param = {};
        param.contractNo = $("#contractNo").val();          // 계약번호

        $.ajax({
            url :"<c:url value='/sal/cnt/contractMnt/deleteContract.do' />",
            data :JSON.stringify(param),
            type :'POST',
            dataType :'json',
            contentType :'application/json',
            error :function(jqXHR,status,error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            },
            success :function(jqXHR, textStatus) {

                var data = {};
                data.msg = 'save';
                data.cntNo = jqXHR;
                options.callbackFunc(data);
                refreshAll();
                parent.mainPopupWindow.close();

                /*
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                */
            }
        });

    }else if($("#contractStatCd").val() == ""){
        refreshAll();
        parent.mainPopupWindow.close();
    }else{
        // 계약승인 이전단계에서만 삭제가 가능합니다.
        dms.notification.info("<spring:message code='global.lbl.contractAcptReq' var='globalLblContractAcptReq' /><spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalLblContractAcptReq}, ${globalLblDel}' />");
        return false;
    }

}

// 备用方法
function cancel(){

    if($("#contractNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약생성이후
    if( $("#contractStatCd").val() == "20" ){
        var param = {};
        param.contractNo = $("#contractNo").val();          // 계약번호

        $.ajax({
            url :"<c:url value='/sal/cnt/contractMnt/cancelContract.do' />",
            data :JSON.stringify(param),
            type :'POST',
            dataType :'json',
            contentType :'application/json',
            error :function(jqXHR,status,error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            },
            success :function(jqXHR, textStatus) {
                var data = {};
                data.msg = 'save';
                data.cntNo = jqXHR;
                options.callbackFunc(data);
                refreshAll();
                parent.mainPopupWindow.close();

                /*
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                */
            }
        });

    }else{
        // 계약생성된 이후 삭제처리가 가능합니다.
        dms.notification.info("<spring:message code='sal.info.contAfterMsg'/>");
        return false;
    }

}



var readOnlyFlag = false;

// 대문자
//$(".upper").bind("keyup", function(){
//    $(this).val($(this).val().toUpperCase());
//});


// 숫자
var onlyNum = new RegExp("[^0-9]","i");
$(".numberic").keyup(function(e){
    var content = $(this).val();
    if(content.match(onlyNum)){
        $(this).val('');
    }
});

// 숫자와 알파벳   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
var onlyNumAlpha = new RegExp("[^A-Z0-9]");
$(".numberandalpha").keyup(function(e)
{
    var contents = $(this).val();
    if(onlyNumAlpha.test(contents)){
        $(this).val('');
    }
});


// 숫자형체크
function naNcheck(data){
    return isNaN(data)?0:(Number(data)==Infinity||Number(data)==-Infinity)?0:Number(data);
}

// OBJ NULL 체크
function isObjectNullCheck(data){
    if(typeof(data) == "undefined"){
        return true;
    }
    if(data == null){
        return true;
    }

    var isResult = true;
    $.each(data, function(index, row) {
        isResult = false;
    });
    return isResult;
}

// OBJ List에 DataSet 값이 있는지 확인
function isArrayValues(Obj, name, value){
    var isReturn = false;
    $.each(Obj, function(idx, col){
        if(col[name] == value){
            isReturn = true;
        }
    });
    return isReturn;
}


// 고객정보 수정링크
$(document).on("click", ".linkCustNo", function(e){
    if(dms.string.isEmpty($(this).val())){return ;}
    parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+$(this).val(), "VIEW-D-10272");
});


 /******************************************
  * 함수영역 - end
  ******************************************/
//
</script>
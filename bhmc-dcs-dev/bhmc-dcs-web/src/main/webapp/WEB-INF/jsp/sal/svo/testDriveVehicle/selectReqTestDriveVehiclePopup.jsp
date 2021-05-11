<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
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
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->

<!-- 시승차 신청 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnConfirm" class="btn_m"><spring:message code='sal.btn.offer' /></button>           <!-- 상신 -->
            <button id="btnSave" class="btn_m"><spring:message code='global.btn.save' /></button>             <!-- 저장 -->
            <button id="btnDelete" class="btn_m"><spring:message code='global.btn.del' /></button>            <!-- 삭제 -->
            <button id="btnPrint" class="btn_m"><spring:message code='global.btn.print' /></button>           <!-- 인쇄 -->
        </div>
    </div>

<form id="askForm" name="askForm" method="POST">
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:15%;">
                <col style="width:12%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>   <!-- 딜러코드 -->
                    <td colspan="3">
                        <div class="form_float">
                            <div class="form_left" style="width:35.5%">
                                <input id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true">
                            </div>
                            <div class="form_right" style="width:64.5%">
                                <input id="dlrNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contactUserNm' /></th>  <!-- 연계인:사용자 -->
                    <td class="bor_color">
                        <div class="form_float">
                            <div class="form_left" style="width:35.5%">
                                <input id="usrId" name="usrId" readonly class="form_input form_readonly" data-json-obj="true">
                            </div>
                            <div class="form_right" style="width:64.5%">
                                <input id="usrNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.prsNm' /></th>    <!-- 판매담당자 -->
                    <td colspan="3">
                        <input id="salePrsnNm" name="salePrsnNm" maxlength="20" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.telNumer' /></th>    <!-- 연락처 -->
                    <td class="bor_color">
                        <input id="salePrsnTelNo" name="salePrsnTelNo" maxlength="20" class="form_input" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carType' /></th>   <!-- 차량유형 -->
                    <td>
                        <input id="tpCd" name="tpCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>   <!-- 신청일자 -->
                    <td class="bor_color">
                        <input id="reqDt" class="form_datepicker" readonly/>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.policyCont' /></th>    <!-- 정책설명 -->
                    <td colspan="5">
                        <textarea id="policyCont" rows="3" cols="" readonly class="form_textarea form_readonly"></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.asOrdDt' /></th>   <!-- 이전 신청일자 -->
                    <td>
                        <input id="asOrdDt" class="form_datepicker" readonly />
                    </td>
                    <th scope="row" colspan="2"><spring:message code='sal.lbl.asPltGiDt' /></th>   <!-- 이전 제조사 출고일자 -->
                    <td colspan="2">
                        <div class="form_left" style="width:40%">
                            <input id="asPltGiDt" class="form_datepicker" readonly/>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="header_area" style="display:none;">
        <div class="btn_right">
            <button type="button" id="btnAdd" class="btn_s"><spring:message code='global.btn.add' /></button>     <!-- 추가 -->
            <button type="button" id="btnDel" class="btn_s"><spring:message code='global.btn.del' /></button>     <!-- 삭제 -->
        </div>
    </div>
    <div class="table_grid">
        <div id="carGrid"></div>
    </div>
    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:20%;">
                <col style="width:7%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.examinTp' /></th>            <!-- 심사유형 -->
                    <td colspan="3">
                        <%--
                        <ul class="tabmenu">
                            <li id="tabReqTp01" class="on"><span><spring:message code='sal.lbl.helpCarPersEvl' /></span></li>      <!-- 개인심사[신차신청으로 변경] -> 신규딜러신청 변경 -->
                            <li id="tabReqTp02"><span><spring:message code='sal.lbl.updateApplication' /></span></li>              <!-- 갱신심사[갱신신청으로 변경] -->
                            <input type="hidden" id="reqTp" name="reqTp" data-json-obj="true"/>
                        </ul>
                         --%>
                        <label class="label_check"><input id="tabReqTp01" name="tabReqTp" type="radio" value="1" checked="checked" class="form_check"> <spring:message code='sal.lbl.helpCarPersEvl' /><!-- 신규딜러신청--></label>
                        <label class="label_check"><input id="tabReqTp02" name="tabReqTp" type="radio" value="2" class="form_check"> <spring:message code='sal.lbl.updateApplication' /><!-- 갱신신청--></label>
                        <input type="hidden" id="reqTp" name="reqTp" data-json-obj="true"/>
                    </td>
                    <th scope="row" style="display:none"><spring:message code='global.lbl.total' /></th>                <!-- 합계 -->
                    <td style="display:none">
                        <input id="qtyTot" readonly class="form_input form_readonly ar">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.updateRcp' /></th>        <!-- 갱신관련영수증 -->
                    <td colspan="4">
                        <div id="fileReN">
                            <input id="fileReDocId" name="uploadSeqRenewal" readonly class="form_input" style="width:99%" data-json-obj="true" />
                            <input id="fileReNo" type="hidden" />
                        </div>
                        <div id="fileReY" class="uploadFile_area2"  style="display:none; position:relative; top:3px;"></div>
                    </td>
                    <td>
                        <span class="btn_file" id="btnFileReSelect"><spring:message code='global.lbl.FindFile' /></span>  <!-- 파일찾기 -->
                        <button type="button" class="btn_s" id="btnFileReDelete"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
                        <button type="button" class="btn_s" id="btnFileReDownload"><spring:message code="global.btn.download" /></button><!-- 다운로드 -->
                        <button type="button" class="btn_s" id="btnFileReSave" style="display:none;"><spring:message code="sal.btn.offer" /><!-- 저장 --></button>
                        <span class="span_txt" id="fileReSize"></span>                              <!-- 파일Szie -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.remark' /></th>         <!-- 비고 -->
                    <td colspan="5">
                        <input id="remark" name="remark" class="form_input" data-json-obj="true" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="evlGrid"></div>
    </div>
    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carReg' /> <spring:message code='global.lbl.document' /></th>      <!-- 차량등록 관련서류 -->
                    <td>
                        <div id="fileUpN">
                            <input id="fileUpDocId" name="uploadSeq" readonly class="form_input" style="width:98%" data-json-obj="true" />
                            <input id="fileUpNo" type="hidden" />
                        </div>
                        <div id="fileUpY" class="uploadFile_area2" style="display:none; position:relative; top:3px;"></div>
                    </td>
                    <td>
                        <span class="btn_file" id="btnFileUpSelect"><spring:message code='global.lbl.FindFile' /></span>  <!-- 파일찾기 -->
                        <button type="button" class="btn_s" id="btnFileUpDelete"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
                        <button type="button" class="btn_s" id="btnFileUpDownload"><spring:message code="global.btn.download" /></button><!-- 다운로드 -->
                        <button type="button" class="btn_s" id="btnFileUpSave" style="display:none;"><spring:message code="sal.btn.offer" /><!-- 저장 --></button>
                        <span class="span_txt" id="fileUpSize"></span>                              <!-- 파일Szie -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.askRemark" /></th>      <!-- 요청비고 -->
                    <td colspan="2">
                        <input type="text" id="evalRemark" name="evalRemark" value="" disabled="disabled" class="form_input" data-json-obj="true" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form form_width_100per mt10" id="vTwoAskDiv" style="display:none;">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:20%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.whthrPassing" /></th>      <!-- 합격여부 -->
                    <td>
                        <input id="fsdmAgrYn" class="form_comboBox form_readonly" readonly />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.fsdmAgrRemark" /></th>      <!-- 평가비고 -->
                    <td>
                        <input id="fsdmAgrRemark" type="type" readonly class="form_input form_readonly" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <span style="display:none">
        <input type="hidden" id="reqNo" name="reqNo" data-json-obj="true" />
    </span>

</form>

</section>
<!-- //구원차/대부차량심사 심사등록 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);
//현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

// 차량유형 SAL142 (시승차:N7 제외)
var tpCdList = [];
<c:forEach var="obj" items="${tpCdInfo}">
    tpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//합격여부 SAL148
var evalRsltYnList = [];
<c:forEach var="obj" items="${evalRsltYnInfo}">
    evalRsltYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 차종
var carLineCdDSList = [];
var carLineCdObj = {};
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

// 그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};

// 그리드 OCN 콤보 DataSource
var ocnCdDSList = [];
var ocnCdObj = {};

// 그리드 외장색 콤보 DataSource
var extColorCdDSList = [];
var extColorCdObj = {};

// 그리드 내장색 콤보 DataSource
var intColorCdDSList = [];
var intColorCdObj = {};

/**
 * 결재상태
 *  :이미지는 어떠한 상태에서도 저장, 삭제 되어야 한다.
 */
var v_approveCd = "";

/**
 *  2016.12.26
 *  file 저장과 삭제 자동저장을 수동저장으로 변경 요청 적용. [김D]
 */
var v_fileHisReList  = [];
var v_fileHisUpList  = [];

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 차량유형
    $("#tpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:tpCdList
       ,value:"N7"
       ,enabled:false
       ,optionLabel:" "
    });

    // 합격여부
    $("#fsdmAgrYn").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(evalRsltYnList)
       ,optionLabel:" "
    });

    //심사일자
    $("#reqDt").kendoExtMaskedDatePicker({
        value:toDay
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    })

    // 신청구분:개인심사
    $("#tabReqTp01").click(function(){
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        //$("#trReq").hide();
        $("#reqTp").val("1");

        $("#fileReDocId").addClass("form_readonly");
        $("#btnFileReSelect").hide();
        $("#btnFileReDelete").hide();
        $("#btnFileReSave").hide();
    });
    // 신청구분:갱신심사
    $("#tabReqTp02").click(function(){
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        //$("#trReq").show();
        $("#reqTp").val("2");

        $("#fileReDocId").removeClass("form_readonly");

        if(dms.string.isEmpty($("#fileReDocId").val())){
            $("#btnFileReSelect").show();
        }else{
            $("#btnFileReDelete").show();
            $("#btnFileReDownload").show();
        }
    });

    // 이전 신청일자
    $("#asOrdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 이전 제조사 출고일자
    $("#asPltGiDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#dlrCd").val(options.dlrCd);
    $("#dlrNm").val(options.dlrNm);
    $("#salePrsnNm").val(options.usrId);
    $("#usrId").val(options.usrId);
    $("#usrNm").val(options.usrNm);
    $("#reqNo").val(options.reqNo);

    // 저장 버튼
    $("#btnSave").kendoButton({
        click:function(e){
            if(!save_Validate()){return false;}

            dms.window.confirm({
                message:"<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />"
                ,title :"<spring:message code='global.btn.save' />"
                ,callback:function(result){
                    if(result){
                        save();
                    }else{
                        return false;
                    }
                }
            });

        }
    });

    // saveData Validation check
    function save_Validate() {

        if(v_approveCd == "C"){
            if($("#fileUpDocId").val() == ""){
                // {차량등록 관련서류}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.document' var='globalLblDocument' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDocument}' />");
                return false;
            }

            /*
            if($("#evalRemark").val() == ""){
                // {요청비고}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='sal.lbl.askRemark' var='salLblAskRemark' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblAskRemark}' />");
                return false;
            }
            */

        }else{
            if($("#tpCd").data("kendoExtDropDownList").value() == "" ){
                // {차량유형}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.carType' var='globalLblCarType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarType}' />");
                return false;
            }

            if($("#reqDt").data("kendoExtMaskedDatePicker").value() == "" ){
                // {신청일자}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.fincReqDt' var='globalLblFincReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincReqDt}' />");
                return false;
            }

            if( Number($("#qtyTot").val()) <= 0  ){
                // {차량}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCar}' />");
                return false;
            }

            var saveData = $("#carGrid").data("kendoExtGrid").getCUDData("insertTestDriveVehicleList", "updateTestDriveVehicleList", "deleteTestDriveVehicleList");
            saveData.reqTestDriveVehicleVO = $("#askForm").serializeObject($("#askForm").serializeArrayInSelector("[data-json-obj='true']")) ;

            // 그리드 무결성 점검
            var dataValidate = false;
            $.each(saveData.insertTestDriveVehicleList, function(idx, row){
                if(row.carlineCd == ""){
                   // 선택하지 않은 차종이 있습니다.
                   dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCarLine}' />");
                   dataValidate = true;
                   return false;
                }
                if(row.modelCd == ""){
                    // 선택하지 않은 모델이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                    dataValidate = true;
                    return false;
                 }
                if(row.ocnCd == ""){
                    // 선택하지 않은 OCN이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblOcn}' />");
                    dataValidate = true;
                    return false;
                 }
                if(row.extColorCd == ""){
                    // 선택하지 않은 외장색이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblExtColor}' />");
                    dataValidate = true;
                    return false;
                 }
                if(row.intColorCd == ""){
                    // 선택하지 않은 내장색이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblIntColor}' />");
                    dataValidate = true;
                    return false;
                 }
                if(Number(row.spcCarQty) <= 0){
                    // 선택하지 않은 수량이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.qty' var='globalLblQty' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblQty}' />");
                    dataValidate = true;
                    return false;
                 }
             });
            $.each(saveData.updateTestDriveVehicleList, function(idx, row){
                if(row.carlineCd == ""){
                   // 선택하지 않은 차종이 있습니다.
                   dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCarLine}' />");
                   dataValidate = true;
                   return false;
                }
                if(row.modelCd == ""){
                    // 선택하지 않은 모델이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                    dataValidate = true;
                    return false;
                 }
                if(row.ocnCd == ""){
                    // 선택하지 않은 OCN이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblOcn}' />");
                    dataValidate = true;
                    return false;
                 }
                if(row.extColorCd == ""){
                    // 선택하지 않은 외장색이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblExtColor}' />");
                    dataValidate = true;
                    return false;
                 }
                if(row.intColorCd == ""){
                    // 선택하지 않은 내장색이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblIntColor}' />");
                    dataValidate = true;
                    return false;
                 }
                if(Number(row.spcCarQty) <= 0){
                    // 선택하지 않은 수량이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.qty' var='globalLblQty' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblQty}' />");
                    dataValidate = true;
                    return false;
                 }
             });
            if(dataValidate){ return false; }
        }

        return true;
    }
    function save(){
        if(v_approveCd == "C"){

            var saveData = $("#askForm").serializeObject($("#askForm").serializeArrayInSelector("[data-json-obj='true']")) ;

            $.ajax({
                url:"<c:url value='/sal/svo/testDriveVehicle/secondSaveReqTestDriveVehiclePopup.do' />"
               ,data:JSON.stringify(saveData)
               ,type:'POST'
               ,dataType:'json'
               ,async:false
               ,contentType:'application/json'
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               }
               ,success:function(jqXHR, textStatus) {
                   options.reqNo = jqXHR;
                   fn_selectLoadData();
                   $("#carGrid").data('kendoExtGrid').dataSource.read();
                   $("#evlGrid").data('kendoExtGrid').dataSource.read();

                    var data = [];
                    data.msg = 'save';
                    options.callbackFunc(data);

                   //정상적으로 반영 되었습니다.
                   dms.notification.success("<spring:message code='global.info.success'/>");
               }
            });

        }else{

            // 갱신심사 일 역우 첨부파일 저장 안함.
            if($("#ReqTp").val() == "2"){
                $("#uploadSeq").val('');
            }

            var saveData = $("#carGrid").data("kendoExtGrid").getCUDData("insertTestDriveVehicleList", "updateTestDriveVehicleList", "deleteTestDriveVehicleList");
                saveData.reqTestDriveVehicleVO = $("#askForm").serializeObject($("#askForm").serializeArrayInSelector("[data-json-obj='true']")) ;

            //신청일자
            saveData.reqTestDriveVehicleVO.reqDt = $("#reqDt").data("kendoExtMaskedDatePicker").value();
            //차량유형 (콤보 enable:false 설정때문에 따로 적용)
            saveData.reqTestDriveVehicleVO.tpCd = $("#tpCd").data("kendoExtDropDownList").value();

            $.ajax({
                 url:"<c:url value='/sal/svo/testDriveVehicle/multiReqTestDriveVehiclePopup.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    options.reqNo = jqXHR;
                    fn_selectLoadData();
                    $("#carGrid").data('kendoExtGrid').dataSource.read();
                    $("#evlGrid").data('kendoExtGrid').dataSource.read();

                     var data = [];
                     data.msg = 'save';
                     options.callbackFunc(data);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    }


    // 확정 버튼
    $("#btnConfirm").kendoButton({
        click:function(e){

            if(!save_Validate()){return false;}

            dms.window.confirm({
                message:"<spring:message code='sal.btn.offer' var='salBtnOffer' /><spring:message code='global.info.cnfrmMsg' arguments='${salBtnOffer}' />"
                ,title :"<spring:message code='sal.btn.offer' />"
                ,callback:function(result){
                    if(result){

                        // 갱신심사 일 역우 첨부파일 저장 안함.
                        if($("#ReqTp").val() == "2"){
                            $("#uploadSeq").val('');
                        }

                        var saveData = $("#carGrid").data("kendoExtGrid").getCUDData("insertTestDriveVehicleList", "updateTestDriveVehicleList", "deleteTestDriveVehicleList");
                            saveData.reqTestDriveVehicleVO = $("#askForm").serializeObject($("#askForm").serializeArrayInSelector("[data-json-obj='true']")) ;

                        //신청일자
                        saveData.reqTestDriveVehicleVO.reqDt = $("#reqDt").data("kendoExtMaskedDatePicker").value();
                        //차량유형 (콤보 enable:false 설정때문에 따로 적용)
                        saveData.reqTestDriveVehicleVO.tpCd = $("#tpCd").data("kendoExtDropDownList").value();

                        $.ajax({
                             url:"<c:url value='/sal/svo/testDriveVehicle/multiReqTestDriveVehiclePopup.do' />"
                            ,data:JSON.stringify(saveData)
                            ,type:'POST'
                            ,dataType:'json'
                            ,async:false
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                        }).done(function(result) {

                            var param = {};
                            param.sDlrCd = $("#dlrCd").val();
                            param.sUsrId = $("#usrId").val();
                            //param.sReqNo = $("#reqNo").val();
                            param.sReqNo = result;

                            $.ajax({
                                url:"<c:url value='/sal/svo/testDriveVehicle/confirmReqTestDriveVehiclePopup.do' />",
                                data:JSON.stringify(param),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(jqXHR, textStatus) {
                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");

                                     var data = [];
                                     data.msg = 'save';
                                     options.callbackFunc(data);
                                     parent.popupWindow.close();
                                }
                            });

                        });
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    // 삭제 버튼
    $("#btnDelete").kendoButton({
        click:function(e){

            var param = {};
            param.sDlrCd = $("#dlrCd").val();
            param.sUsrId = $("#usrId").val();
            param.sReqNo = $("#reqNo").val();

            // 삭제 하시겠습니까?
            dms.window.confirm({
                message:"<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblDel}' />"
                ,title :"<spring:message code='global.btn.del' />"
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/sal/svo/testDriveVehicle/deleteReqTestDriveVehiclePopup.do' />",
                            data:JSON.stringify(param),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {
                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");

                                 var data = [];
                                 data.msg = 'save';
                                 options.callbackFunc(data);
                                 parent.popupWindow.close();
                            }
                        });
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    //버튼 - 출력
    $("#btnPrint").kendoButton({
        click:function(e) {
            var sDlrCd = $("#dlrCd").val();
            var sUsrId = $("#usrId").val();
            var sReqNo = $("#reqNo").val();

            var printParam =  "&sDlrCd="+sDlrCd+"&sUsrId="+sUsrId+"&sReqNo="+sReqNo;
            var printReportUrl = "<c:url value='/ReportServer?reportlet=sale/screenRelation/selectDemoRegRpt.cpt'/>"+printParam;
            var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
        }
    });

    // 닫기 버튼
    $("#btnClose").kendoButton({
        click:function(e){
            var data = [];
            data.msg = 'close';
            options.callbackFunc(data);
            parent.popupWindow.close();
        }
    });


    // 추가 버튼
    $("#btnAdd").kendoButton({
         click:function(e){
             $('#carGrid').data('kendoExtGrid').dataSource.insert(0, {
                   dlrCd:options.dlrCd
                  ,usrId:options.usrId
                  ,reqNo:options.reqNo
                  ,reqSeq:""
                  ,carlineCd:""
                  ,carlineNm:""
                  ,modelCd:""
                  ,modelNm:""
                  ,ocnCd:""
                  ,ocnNm:""
                  ,extColorCd:""
                  ,extColorNm:""
                  ,intColorCd:""
                  ,intColorNm:""
                  ,spcCarQty:1
                  ,ordNo:""
                  ,befOrdNo:""
              });

             var grid = $("#carGrid").data("kendoExtGrid");
             var rows = grid.tbody.find("tr:eq(0)").closest('tr');
             rows.addClass("k-state-selected");

             /*rows.each(function(index, row) {
                 if( index == 0){
                     var row = $(this).closest('tr');
                     row.addClass("k-state-selected");
                 }
             });
            */
         }
    });


    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#carGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });


    // 차량 grid
    $("#carGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopupCars.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        // 딜러코드
                        params["sDlrCd"] = $("#dlrCd").val();
                        // 사용자id
                        params["sUsrId"] = $("#usrId").val();
                        // 요청일련번호
                        params["sReqNo"] = $("#reqNo").val();

                        //console.log('grid params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type != "read") {
                }
            }
            ,schema:{
                model:{
                    id:"reqSeq",
                    fields:{
                         dlrCd:{type:"string", editable:false} // 딜러코드
                        ,usrId:{type:"string"}                 // 사용자ID
                        ,reqNo:{type:"number"}                 // 요청일련번호
                        ,reqSeq:{type:"string"}                //
                        ,carlineCd  :{type:"string"}           //
                        ,carlineNm  :{type:"string"}           //
                        ,modelCd    :{type:"string"}           //
                        ,modelNm    :{type:"string"}           //
                        ,ocnCd      :{type:"string"}           //
                        ,ocnNm      :{type:"string"}           //
                        ,extColorCd :{type:"string"}           //
                        ,extColorNm :{type:"string"}           //
                        ,intColorCd :{type:"string"}           //
                        ,intColorNm :{type:"string"}           //
                        ,spcCarQty  :{type:"number"}           //
                        ,ordNo      :{type:"string"}           //
                        ,befOrdNo   :{type:"string"}           //
                    }
                }
            }
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            var qty = 0;
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.spcCarQty != null){
                    qty += Number(dataItem.spcCarQty);
                }
            });
            $("#qtyTot").val(qty);
        }
       ,multiSelectWithCheckbox:false
       ,height:60
       ,editable:{
            mode:"incell"
           ,confirmation:false
       }
       ,autoBind:false
       ,navigatable:true
       ,selectable:"row"
       ,sortable:false
       ,pageable:false
       ,filterable:false
       ,edit:function(e){
           var eles = e.container.find("input");
           var fieldName;
           if(eles.length > 1){
               fieldName = eles[eles.length-1].getAttribute("name");
           }else{
               fieldName = eles.attr("name");
           }

           //var model = e.model;

           var input = e.container.find(".k-input");

           if(fieldName === "spcCarQty"){
               /*
               input.blur(function(){
                   // 선택된 값
                   var rows = e.sender.select();
                   var selectedItem = e.sender.dataItem(rows[0]);

                   var spcCarQty = selectedItem.spcCarQty;
                   if(spcCarQty > 0 && spcCarQty != null){

                       // 그리드 모든 [수량]셀의 합계산
                       var grid = $("#carGrid").data("kendoExtGrid");
                       var rows = grid.tbody.find("tr");
                       var data, qty = 0;

                       rows.each(function(index, row) {
                           data = grid.dataItem(rows[index]);

                           if(data.spcCarQty != null){
                               qty += Number(data.spcCarQty);
                           }
                       });
                       $("#qtyTot").val(qty);

                   }
               });
               */
               this.closeCell();
           }

           if(fieldName == "modelCd"){
               if(selectedItem.carlineCd == "" || modelCdDSList == null || modelCdDSList.length == 0){
                   this.closeCell();
               }
           }
           if(fieldName == "ocnCd"){
               if(selectedItem.modelCd == "" || ocnCdDSList == null || ocnCdDSList.length == 0){
                   this.closeCell();
               }
           }
           if(fieldName == "extColorCd"){
               if(selectedItem.ocnCd == "" || extColorCdDSList == null || extColorCdDSList.length == 0){
                   this.closeCell();
               }
           }
           if(fieldName == "intColorCd"){
               if(selectedItem.extColorCd == "" || intColorCdDSList == null || intColorCdDSList.length == 0){
                   this.closeCell();
               }
           }

       }
       ,columns:[
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqNo", hidden:true}       // 요청번호
          ,{field:"reqSeq", hidden:true}      // 요청일련번호

          ,{  // 차량
              field:"carlineCd"
             ,title:"<spring:message code='global.lbl.carLine' />"
             ,width:90
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
             ,template:"#=bf_selectCarLine(carlineCd)#"
             ,editor:function (container, options){
                 $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     autoBind:false
                     , dataTextField:"carlineNm"
                     , dataValueField:"carlineCd"
                     , dataSource:carLineCdDSList
                     , select:selectGridCarlineCd
                     , change:function(e){
                         if(modelCdDSList == null){return false;}

                         var grid = $("#carGrid").data("kendoExtGrid");
                         // 해당 그리드의 tr객체중 선택한 열을 찾아 7번째 컬럼의 객체를 가져온다. (hidden포함해서 0부터 시작)
                         var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(6)");
                         grid.editCell(modelCell);
                     }
                 });
             }
          }
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
          ,{    // 모델
              field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:150
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectModel(modelCd, modelNm) #"
              ,editor:function (container, options){
                  $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      ,dataTextField:"modelNm"
                      ,dataValueField:"modelCd"
                      ,dataSource:modelCdDSList
                      , select:selectGridModelCd
                      , change:function(e){
                          if(ocnCdDSList == null){return false;}

                          var grid = $("#carGrid").data("kendoExtGrid");
                          // 해당 그리드의 tr객체중 선택한 열을 찾아 9번째 컬럼의 객체를 가져온다.
                          var ocnCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(8)");
                          grid.editCell(ocnCell);
                      }
                  });
              }
          }
          ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
          ,{    // OCN
              field:"ocnCd",   title:"<spring:message code='global.lbl.ocn' />", width:140
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectOcn(ocnCd, ocnNm) #"
              ,editor:function (container, options){
                  $('<input name="ocnCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      ,dataTextField:"ocnNm"
                      ,dataValueField:"ocnCd"
                      ,dataSource:ocnCdDSList
                      ,select:selectGridOcnCd
                      ,change:function(e){
                          if(extColorCdDSList == null){return false;}

                          var grid = $("#carGrid").data("kendoExtGrid");
                          // 해당 그리드의 tr객체중 선택한 열을 찾아 11번째 컬럼의 객체를 가져온다.
                          var extColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(10)");
                          grid.editCell(extColorCell);
                      }
                  });
              }
          }
          ,{field:"ocnNm", title:"ocnNm", hidden:true}       // OCN명
          ,{    // 외장색
              field:"extColorCd",   title:"<spring:message code='global.lbl.extColor' />", width:80
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectExtColor(extColorCd, extColorNm) #"
              ,editor:function (container, options){
                  $('<input name="extColorCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      ,dataTextField:"extColorNm"
                      ,dataValueField:"extColorCd"
                      ,dataSource:extColorCdDSList
                      , select:selectGridExtColorCd
                      ,change:function(e){
                          if(intColorCdDSList == null){return false;}

                          var grid = $("#carGrid").data("kendoExtGrid");
                          // 해당 그리드의 tr객체중 선택한 열을 찾아 13번째 컬럼의 객체를 가져온다.
                          var intColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(12)");
                          grid.editCell(intColorCell);
                      }
                  });
              }
          }
          ,{field:"extColorNm", hidden:true}       // 외장색
          ,{    // 내장색
              field:"intColorCd",   title:"<spring:message code='global.lbl.intColor' />", width:80
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectIntColor(intColorCd, intColorNm) #"
              ,editor:function (container, options){
                  $('<input name="intColorCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      ,dataTextField:"intColorNm"
                      ,dataValueField:"intColorCd"
                      ,dataSource:intColorCdDSList
                      ,select:selectGridIntColorCd
                  });
              }
          }
          ,{field:"intColorNm", hidden:true}       // 외장색

          ,{  //특수차량 수량
              field:"spcCarQty"
             ,title:"<spring:message code='global.lbl.qty' />"
             ,width:70
             ,attributes:{"class":"ar"}
             ,format:"{0:n0}"
             ,hidden:true
          }
          ,{field:"ordNo", hidden:true}             // 오더번호
          ,{field:"befOrdNo", hidden:true}          // 이전오더번호
       ]
   });

   // 심사Grid
   $("#evlGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopupEvls.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        // 딜러코드
                        params["sDlrCd"] = $("#dlrCd").val();
                        // 사용자id
                        params["sUsrId"] = $("#usrId").val();
                        // 요청일련번호
                        params["sReqNo"] = $("#reqNo").val();

                        //console.log('evlGrid params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"spcOrdSeq",
                    fields:{
                         dlrCd:{type:"string"}                 // 딜러코드
                        ,usrId:{type:"string"}                 // 사용자ID
                        ,reqNo:{type:"number"}                 // 요청번호
                        ,spcOrdSeq :{type:"number"}            // 일련번호
                        ,evalRsltYn:{type:"string"}            //심사결과여부
                        ,pevalId   :{type:"string"}            //심사자ID
                        ,evalDt    :{type:"date"}              //심사일자
                        ,remark    :{type:"string"}            //비고
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,height:60
       ,editable:false
       ,autoBind:true
       ,selectable:"row"
       ,sortable:false
       ,pageable:false
       ,filterable:false
       ,columns:[
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqNo", hidden:true}       // 요청번호
          ,{field:"spcOrdSeq", hidden:true}   // 일련번호
          ,{  // 심사자
              field:"pevalId"
             ,title:"<spring:message code='global.lbl.peval' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}
             ,attributes:{"class":"al"}
          }
          ,{  // 심사일자
              field:"evalDt"
             ,title:"<spring:message code='global.lbl.evalDt' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
             ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{  // 심사결과
              field:"evalRsltYn"
             ,title:"<spring:message code='global.lbl.evalRslt' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
          }
          ,{  // 심사평가
              field:"remark"
             ,title:"<spring:message code='global.lbl.evalRemark' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}
             ,attributes:{"class":"al"}
          }
       ]
   });


   fn_selectLoadData = function(){
       $("#reqNo").val(options.reqNo);

       var dtSet = {};
       // 불러오는 내용일 경우.
       if(Number(options.reqNo) > 0){
           var responseJson = dms.ajax.getJson({
               url:_contextPath + "/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopupContain.do"
               ,data:JSON.stringify({"sDlrCd":options.dlrCd, "sUsrId":options.usrId, "sReqNo":options.reqNo})
               ,async:false
           });
          dtSet = responseJson.data[0];
       }

       if(typeof(dtSet.salePrsnNm) != "undefined"){
           $("#salePrsnNm").val(dtSet.salePrsnNm);
       }
       $("#salePrsnTelNo").val(dtSet.salePrsnTelNo);

       // 차량등록 관련 서류 (첨부파일)
       if(typeof(dtSet.uploadSeq) != "undefined" && dtSet.uploadSeq != null && dtSet.uploadSeq != ""){
           $("#fileUpN").hide();
           $("#fileUpY").show();

           $("#fileUpDocId").val(dtSet.uploadSeq);
           fn_fileUpSelect();     // 파일 불러오기
       }else{
           $("#fileUpY").hide();
           $("#fileUpN").show();

           $("#btnFileUpSelect").show();
           $("#btnFileUpDelete").hide();    //삭제버튼
           $("#btnFileUpDownload").hide();  //다운로드
       }

       if(typeof(dtSet.tpCd) != "undefined" && dtSet.tpCd != ""){
           $("#tpCd").data("kendoExtDropDownList").value(dtSet.tpCd);
           //selectPolicyCont(dtSet.tpCd);    // 정책설명
       }else{
           $("#tpCd").data("kendoExtDropDownList").value('N7');
           selectPolicyCont('N7');    // 정책설명
       }

       if($("#reqNo").val() != 0){                      //신규가아닐때만
           $("#policyCont").val(dtSet.policyCont);      //조회한정책
       }

       $("#reqDt").data("kendoExtMaskedDatePicker").value(dtSet.reqDt);   //신청일자

       // 갱신심사 첨부파일
       if(typeof(dtSet.uploadSeqRenewal) != "undefined" && dtSet.uploadSeqRenewal != null && dtSet.uploadSeqRenewal != ""){
           $("#fileReN").hide();
           $("#fileReY").show();

           $("#fileReDocId").val(dtSet.uploadSeqRenewal);
           fn_fileReSelect();            // 갱신심사 파일 불러오기
       }else{
           $("#fileReY").hide();
           $("#fileReN").show();

           $("#btnFileReSelect").show();
           $("#btnFileReDelete").hide();    //삭제버튼
           $("#btnFileReDownload").hide();  //다운로드
       }

       //신청구분
       $("#reqTp").val(dtSet.reqTp);
       if(Number(dtSet.reqTp) == 2){
           $("#tabReqTp02").click();
       }else{
           $("#tabReqTp01").click();
       }

       $("#remark").val(dtSet.remark);       // 비고
       $("#evalRemark").val(dtSet.evalRemark);       // 요청비고
       $("#fsdmAgrYn").data("kendoExtDropDownList").value(dms.string.strNvl(dtSet.fsdmAgrYn));
       $("#fsdmAgrRemark").val(dms.string.strNvl(dtSet.fsdmAgrRemark));
       $("#fsdmAgrYn").data("kendoExtDropDownList").enable(false);
       //$("#fsdmAgrRemark").attr("disabled", true);

       if(dms.string.isNotEmpty(options.dlrCd) && Number(options.reqNo) > 0 ){

           var lastApproveDtStr = new Date(dtSet.lastApproveDt);

           var dataSet = {};
           var responseJson = dms.ajax.getJson({
               url:_contextPath + "/sal/svo/testDriveVehicle/selectTestDriveBeforDtContain.do"
               ,data:JSON.stringify({"sDlrCd":options.dlrCd, "sLastApproveDt": dtSet.approveCd == "C" ? lastApproveDtStr : "", "sCarlineCd": dms.string.strNvl(dtSet.carlineCd)})
               ,async:false
           });
           dataSet = responseJson.data[0];

          if(typeof(dataSet) != "undefined"){
              $("#asOrdDt").data("kendoExtMaskedDatePicker").value(dataSet.asOrdDt);
              $("#asPltGiDt").data("kendoExtMaskedDatePicker").value(dataSet.asPltGiDt);
          }

       }
       $("#asOrdDt").data("kendoExtMaskedDatePicker").enable(false);
       $("#asPltGiDt").data("kendoExtMaskedDatePicker").enable(false);

       /**
        * 승인구분:버튼 표시
        **/
        // 저장
        if(dtSet.approveCd == "A"){
            $("#btnConfirm").data("kendoButton").enable(true);     // 확정표시
            $("#btnSave").data("kendoButton").enable(true);        // 저장표시
            $("#btnDelete").data("kendoButton").enable(true);      // 삭제표시
            //$("#btnPrint").data("kendoButton").enable(true);       // 인쇄표시

            fn_readOnlyStat(false);

            $("#evalRemark").attr("disabled", true);
            $("#vTwoAskDiv").hide();

        }  // 승인신청:확정
        else if(dtSet.approveCd == "B"){
            $("#btnConfirm").data("kendoButton").enable(false);     // 확정숨김
            $("#btnSave").data("kendoButton").enable(false);        // 저장숨김
            $("#btnDelete").data("kendoButton").enable(false);      // 삭제숨김
            //$("#btnPrint").data("kendoButton").enable(true);        // 인쇄표시

            $("#btnAdd").data("kendoButton").enable(false);         // 차량추가
            $("#btnDel").data("kendoButton").enable(false);         // 차량삭제

            //$("#fileUpDocId").removeClass("form_readonly");
            //$("#btnFileUpSelect").show();    // 차량등록 파일찾기
            //$("#btnFileUpDelete").show();    // 차량등록 파일삭제

            fn_readOnlyStat(true);
            $("#evalRemark").attr("disabled", true);
            $("#vTwoAskDiv").hide();
        }   // 승인
        else if(dtSet.approveCd == "C"){
            $("#btnConfirm").data("kendoButton").enable(false);       // 확정숨김
            $("#btnDelete").data("kendoButton").enable(false);        // 삭제숨김
            //$("#btnPrint").data("kendoButton").enable(true);          // 인쇄표시

            $("#btnAdd").data("kendoButton").enable(false);           // 차량추가
            $("#btnDel").data("kendoButton").enable(false);           // 차량삭제

            fn_readOnlyStat(true);
            $("#vTwoAskDiv").show();

            if( dms.string.isNotEmpty(dtSet.fsmdAgrDt) && dms.string.strNvl(dtSet.fsdmAgrYn) == "Y" ){
                $("#btnSave").data("kendoButton").enable(false);      // 저장숨김

                $("#fileUpDocId").addClass("form_readonly");
                $("#btnFileUpSelect").hide();   // 차량등록 파일찾기
                $("#btnFileUpDelete").hide();   // 차량등록 파일삭제

                $("#evalRemark").attr("disabled", true);
            }else{
                $("#btnSave").data("kendoButton").enable(true);       // 저장표시

                //$("#fileUpDocId").removeClass("form_readonly");
                //$("#btnFileUpSelect").show();   // 차량등록 파일찾기
                //$("#btnFileUpDelete").show();   // 차량등록 파일삭제

                $("#evalRemark").attr("disabled", false);
            }

        } // 불승인
        else if(dtSet.approveCd == "D" ){
            $("#btnConfirm").data("kendoButton").enable(false);       // 확정숨김
            $("#btnSave").data("kendoButton").enable(false);          // 저장숨김
            $("#btnDelete").data("kendoButton").enable(false);        // 삭제숨김
            //$("#btnPrint").data("kendoButton").enable(true);          // 인쇄표시

            $("#btnAdd").data("kendoButton").enable(false);           // 차량추가
            $("#btnDel").data("kendoButton").enable(false);           // 차량삭제

            $("#fileUpDocId").addClass("form_readonly");
            $("#btnFileUpSelect").hide();   // 차량등록 파일찾기
            $("#btnFileUpDelete").hide();   // 차량등록 파일삭제

            fn_readOnlyStat(true);
            $("#evalRemark").attr("disabled", true);
            $("#vTwoAskDiv").hide();
        }   // 신규등록
        else{
            $("#btnConfirm").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnDelete").data("kendoButton").enable(false);
            //$("#btnPrint").data("kendoButton").enable(true);

            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);

            $("#fileUpDocId").removeClass("form_readonly");
            $("#btnFileReDelete").hide();   // 갱신심사 파일삭제
            $("#btnFileReDownload").hide(); // 갱신심사 다운로드
            $("#btnFileUpSelect").show();   // 차량등록 파일찾기
            $("#btnFileUpDelete").hide();   // 차량등록 파일삭제
            $("#btnFileUpDownload").hide(); // 차량등록 다운로드

            fn_readOnlyStat(false);
            $("#evalRemark").attr("disabled", true);
            $("#vTwoAskDiv").hide();
        }
        v_approveCd = dms.string.strNvl(dtSet.approveCd);     // 결재상태
   }
   fn_selectLoadData();

   if(Number(options.reqNo) > 0 ){
       $("#carGrid").data('kendoExtGrid').dataSource.read();
   }else{
       $("#btnAdd").click();
   }

});

function fn_readOnlyStat(state){

    if(state){
        $("#salePrsnNm").prop("disabled", true);
        $("#salePrsnTelNo").prop("disabled", true);
        $("#reqDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#tabReqTp01").prop("disabled", true);
        $("#tabReqTp02").prop("disabled", true);
        $("#remark").prop("disabled", true);
    }else{
        $("#salePrsnNm").prop("disabled", false);
        $("#salePrsnTelNo").prop("disabled", false);
        $("#reqDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#tabReqTp01").prop("disabled", false);
        $("#tabReqTp02").prop("disabled", false);
        $("#remark").prop("disabled", false);
    }
}

/**
 * 차량유형 설명 조회
 */
function selectPolicyCont(tpCd){
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopupCont.do"
        ,data:JSON.stringify({"sTpCd":tpCd})
        ,async:false
    });

    //alert(responseJson.data[0].policyCont);

   // 차량유형 설명
   $("#policyCont").val(responseJson.data[0].policyCont);
}


/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("modelCd", "");
    selectRow.set("modelNm", "");
    selectRow.set("ocnCd", "");
    selectRow.set("ocnNm", "");
    selectRow.set("extColorCd", "");
    selectRow.set("extColorNm", "");
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });
    modelCdDSList = responseJson.data;
    modelCdObj = [];
    if(modelCdDSList != null ){
        $.each(modelCdDSList, function(idx, obj){
            modelCdObj[obj.modelCd] = obj.modelNm;
        });
    }

    var dtSet = {};
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectTestDriveBeforDtContain.do"
        ,data:JSON.stringify({"sDlrCd":$("#dlrCd").val(), "sLastApproveDt":"", "sCarlineCd":dms.string.strNvl(dataItem.carlineCd)})
        ,async:false
    });
    dtSet = responseJson.data[0];

    if(typeof(dtSet) != "undefined"){
       $("#asOrdDt").data("kendoExtMaskedDatePicker").value(dtSet.asOrdDt);
       $("#asPltGiDt").data("kendoExtMaskedDatePicker").value(dtSet.asPltGiDt);
    }else{
       $("#asOrdDt").data("kendoExtMaskedDatePicker").value('');
       $("#asPltGiDt").data("kendoExtMaskedDatePicker").value('');
    }
};

// 모델에 따른 OCN 조회
function selectGridModelCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("modelNm", dataItem.modelNm);
    selectRow.set("ocnCd", "");
    selectRow.set("ocnNm", "");
    selectRow.set("extColorCd", "");
    selectRow.set("extColorNm", "");
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectOcn.do"
        ,data:JSON.stringify({"carlineCd":selectRow.carlineCd, "modelCd":dataItem.modelCd})
        ,async:false
    });
    ocnCdDSList = responseJson.data;

    ocnCdObj = [];
    if(ocnCdDSList != null ){
        $.each(ocnCdDSList, function(idx, obj){
            ocnCdObj[obj.ocnCd] = obj.ocnNm;
        });
    }
};

//OCN에 따른 외장색 조회:모델값으로 조회
function selectGridOcnCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("ocnNm", dataItem.ocnNm);
    selectRow.set("extColorCd", "");
    selectRow.set("extColorNm", "");
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectExtColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd, "ocnCd":dataItem.ocnCd})
        ,async:false
    });
    extColorCdDSList = responseJson.data;

    extColorCdObj = [];

    if( extColorCdDSList != null ){
        $.each(extColorCdDSList, function(idx, obj){
            extColorCdObj[obj.extColorCd] = obj.extColorNm;
        });
    }

};

//외장색에 따른 내장색 조회:모델값으로 조회
function selectGridExtColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("extColorNm", dataItem.extColorNm);
    selectRow.set("intColorCd", "");
    selectRow.set("intColorNm", "");
    selectRow.set("dirty", "true");

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectIntColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd, "ocnCd":selectRow.ocnCd, "extColorCd":dataItem.extColorCd})
        ,async:false
    });
    intColorCdDSList = responseJson.data;
    intColorCdObj = [];
    if( intColorCdDSList != null ){
        $.each(intColorCdDSList, function(idx, obj){
            intColorCdObj[obj.intColorCd] = obj.intColorNm;
        });
    }
};

//내장색 선택
function selectGridIntColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("intColorNm", dataItem.intColorNm);
};

//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return dms.string.strNvl(carLineCdObj[carlineCd]);
    }
}

//2 Grid- 모델의 template 정의
function bf_selectModel(modelCd, modelNm){
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return dms.string.strNvl(modelCdObj[modelCd]);
}

//3 Grid - OCN의 template 정의
function bf_selectOcn(ocnCd, ocnNm){
    if(ocnNm != ""){
        return ocnNm;
    }
    if(ocnCd == ""){
        return "";
    }
    return dms.string.strNvl(ocnCdObj[ocnCd]);
}

//4 Grid - 외장색의 template 정의
function bf_selectExtColor(extColorCd, extColorNm){
    if(extColorNm != ""){
        return extColorNm;
    }
    if(extColorCd == ""){
        return "";
    }
    return dms.string.strNvl(extColorCdObj[extColorCd]);
}

//5 Grid - 내장색의 template 정의
function bf_selectIntColor(intColorCd, intColorNm){
    if(intColorNm != ""){
        return intColorNm;
    }
    if(intColorCd == ""){
        return "";
    }
    return dms.string.strNvl(intColorCdObj[intColorCd]);
}

/* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize:1 * 1024 * 1024
     ,simultaneousUploads:4
     ,testChunks:true
     ,throttleProgressCallbacks:1
     ,method:"octet"
     ,maxFiles:1
 });
 r.assignBrowse($('#btnFileUpSelect')[0]);

 //파일추가 이벤트
 r.on('fileAdded', function(file) {

     // 파일이 존재할 경우.
     //if( $("#fileUpDocId").val() != "" && $("#fileUpNo").val() != "" ){
     //    fileDelete();
     //}

     $("#progressWindow").kendoWindow({
         width:"600px"
         ,height:"300px"
         ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
         ,animation:false
         ,draggable:false
         ,visible:false
         ,resizable:false
         ,modal:true
     }).data("kendoWindow").center().open();


     $('.resumable-progress, .resumable-list').show();
     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();

     //파일목록 출력
     $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

     //업로드 시작
     r.upload();

 });
 r.on('pause', function() {
     $('.resumable-progress .progress-resume-link').show();
     $('.resumable-progress .progress-pause-link').hide();
 });
 r.on('uploadStart', function() {

     var _that = this;

     if (_that.opt["query"] == null) {
          _that.opt["query"] = {};
     }

     if (dms.string.isEmpty($("#fileUpDocId").val())) {
         $.ajax({
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#fileUpDocId").val(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#fileUpDocId").val();
     }

     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();
 });
 r.on('complete', function() {

     var _that = this;

     $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

     //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {

     var result = JSON.parse(message);
     if(result.status === "finished") {
         var fileInfo = "";
         fileInfo += "<a href=\"javascript:goFileDown(\'"+ result.fileDocNo +"\', \'"+ result.fileNo +"\');\" style='cursor:pointer'>";
         fileInfo += "<span class='k-tool-icon'></span>";
         fileInfo += "<span class='file_name'>"+ result.fileNm +"</span>";
         fileInfo += "</a>";
         $("#fileUpY").html(fileInfo);

         $("#fileUpN").hide();
         $("#fileUpY").show();

         // 파일사이즈
         $("#fileUpSize").text(dms.string.formatFileSize(result.fileSize));
         $("#btnFileUpSelect").hide();
         $("#btnFileUpDelete").show();
         $("#btnFileUpDownload").show();
         $("#fileUpDocId").val(result.fileDocNo);
         $("#fileUpNo").val(result.fileNo);

         // 차량등록 관련서류 갱신
         if(v_approveCd != "" && $("#dlrCd").val() != "" && $("#usrId").val() != "" && $("#reqNo").val() != ""){
             //fn_updateCarRegDoc();
             $("#btnFileUpSave").show();
             v_fileHisUpList.push({"state":"S", "fileDocNo":result.fileDocNo, "fileNo":result.fileNo});
         }

         //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
     }

 });
 r.on('fileError', function(file, message) {
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
 });
 r.on('fileProgress', function(file) {
     var fileProgress = 0;

     if (file instanceof ResumableChunk) {
         fileProgress = file.fileObj.progress();
     } else {
         fileProgress = file.progress();
     }

     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
     $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
 });
 /* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/

 //========파일삭제
 $("#btnFileUpDelete").click(function(e){

     if( $("#fileUpDocId").val() == "" || $("#fileUpNo").val() == "" ){
         // 삭제할 파일이 없습니다.
         dms.notification.info("<spring:message code='sal.info.isDelEmptyFile' />");
         return false;
     }

     if(v_approveCd != "" && $("#dlrCd").val() != "" && $("#usrId").val() != "" && $("#reqNo").val() != ""){
         v_fileHisUpList.push({"state":"D", "fileDocNo":$("#fileUpDocId").val(), "fileNo":$("#fileUpNo").val()});

         $("#fileUpDocId").val('');
         $("#fileUpNo").val('');
         $("#fileUpY").html('');

         $("#fileUpN").show();
         $("#fileUpY").hide();

         $("#fileUpSize").text('');        // 파일사이즈
         $("#btnFileUpSelect").show();
         $("#btnFileUpDelete").hide();     // 삭제버튼
         $("#btnFileUpDownload").hide();
         $("#btnFileUpSave").show();

     }else{
         fileDelete('init');        //생성전 단계시 바로 삭제
     }
 });

 // 다운로드 버튼
 $("#btnFileUpDownload").click(function(e){
     var fileDocNo = $("#fileUpDocId").val();
     var fileNo = $("#fileUpNo").val();

     if(fileDocNo == "" || (fileDocNo != "" && fileNo == 0)){
         dms.notification.warning("没有添加的文件");
         return false;
     }else {
         goFileDown(fileDocNo, fileNo);
     }
 });

 // 차량등록번호관련자료 저장
 $("#btnFileUpSave").click(function(e){
     if(v_fileHisUpList.length > 0){

         // == file docNo 저장 ==
         var dataSet = v_fileHisUpList[v_fileHisUpList.length-1];
         var param = {};
         if( dataSet.state == "S"){
             param = { "dlrCd":$("#dlrCd").val()
                     , "usrId":$("#usrId").val()
                     , "reqNo":$("#reqNo").val()
                     , "uploadSeq":dataSet.fileDocNo
                     };
         }else{
             param = { "dlrCd":$("#dlrCd").val()
                     , "usrId":$("#usrId").val()
                     , "reqNo":$("#reqNo").val()
                     , "uploadSeq":""
                     };
         }
         $.ajax({
             url:"<c:url value='/sal/svo/askHelpCar/updateCarRegDoc.do' />",
             data:JSON.stringify(param),
             type:'POST',
             dataType:'json',
             contentType:'application/json',
             async:false,
             error:function(jqXHR,status,error) {
                 dms.notification.error(error);
             },
             success:function(jqXHR, textStatus) { parent.gridReLosd(); }
         });
         // == file docNo 저장 end ==

         // 저장안된 file삭제.
         var deleteList = [];
         for(var i=0; i<v_fileHisUpList.length-1; i++){
             deleteList.push({"fileDocNo":v_fileHisUpList[i].fileDocNo, "fileNo":v_fileHisUpList[i].fileNo});
         }
         fileDelete('save', deleteList);
     }
 });

 fileDelete = function(msg, dList){
     var deleteList = [];
     if(typeof(dList)  == 'undefined'){
         deleteList.push({"fileDocNo":$("#fileUpDocId").val() , "fileNo":$("#fileUpNo").val()});
     }else{
         deleteList = dList;
     }

     $.ajax({
         url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
        ,data:JSON.stringify(deleteList)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(jqXHR, status, error) {
            dms.notification.error(error);
        }
        ,success:function(jqXHR, textStatus) {

            if(msg == "init"){
                //정상적으로 반영 되었습니다.
                //dms.notification.success("<spring:message code='global.info.success'/>");

                $("#fileUpDocId").val('');
                $("#fileUpNo").val('');
                $("#fileUpY").html('');

                $("#fileUpN").show();
                $("#fileUpY").hide();

                $("#fileUpSize").text('');        // 파일사이즈
                $("#btnFileUpSelect").show();
                $("#btnFileUpDelete").hide();     // 삭제버튼
                $("#btnFileUpDownload").hide();

                // 차량등록 관련서류 갱신
                //if(v_approveCd != "" && $("#dlrCd").val() != "" && $("#usrId").val() != "" && $("#reqNo").val() != ""){
                //    fn_updateCarRegDoc();
                //}
             }else{
                 $("#btnFileUpSave").hide();
                 //정상적으로 반영 되었습니다.
                 dms.notification.success("<spring:message code='global.info.success'/>");
             }
         }
     });
 }
//========파일삭제 END

// == 파일 내용 불러오기
function fn_fileUpSelect(){

    $.ajax({
        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
       ,data:JSON.stringify({ "sFileDocNo":$("#fileUpDocId").val() })
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,error:function(jqXHR, status, error) {
           dms.notification.error(jqXHR.responseJSON.errors);
       }
       ,success:function(jqXHR, textStatus) {

             var fileInfo = "", lng = 0;

             if(jqXHR.data.length > 0){
                 lng = jqXHR.data.length - 1;
                 fileInfo += "<a href=\"javascript:goFileDown(\'"+ jqXHR.data[lng].fileDocNo +"\', \'"+ jqXHR.data[lng].fileNo +"\');\" style='cursor:pointer'>";
                 fileInfo += "<span class='k-tool-icon'></span>";
                 fileInfo += "<span class='file_name'>"+ jqXHR.data[lng].fileNm +"</span>";
                 fileInfo += "</a>";
                 $("#fileUpY").html(fileInfo);

                 $("#fileUpN").hide();
                 $("#fileUpY").show();

                 // 파일사이즈
                 $("#fileUpSize").text(dms.string.formatFileSize(jqXHR.data[lng].fileSize));
                 $("#btnFileUpSelect").hide();
                 $("#btnFileUpDelete").show();
                 $("#btnFileUpDownload").show();
                 $("#btnFileUpSave").hide();
                 $("#fileUpNo").val(jqXHR.data[lng].fileNo);
             }
       }
    });
}

// 파일 다운
function goFileDown(fileDocNo, fileNo){
    dms.fileManager.download(fileDocNo, fileNo);
}

//차량관련 서류 갱신
/*
function fn_updateCarRegDoc(){

    var param = { "dlrCd":$("#dlrCd").val()
                , "usrId":$("#usrId").val()
                , "reqNo":$("#reqNo").val()
                , "uploadSeq":$("#fileUpDocId").val()
                };
    $.ajax({
        url:"<c:url value='/sal/svo/askHelpCar/updateCarRegDoc.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        async:false,
        error:function(jqXHR,status,error) {
            dms.notification.error(error);
        },
        success:function(jqXHR, textStatus) { parent.gridReLosd(); }
    });

}
*/

/* *************************************************************************
 * ****** 갱신심사 파일처리 **********
 ***************************************************************************/
// 갱신심사 파일업로드
  var r2 = new Resumable({
      target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
      ,chunkSize:1 * 1024 * 1024
      ,simultaneousUploads:4
      ,testChunks:true
      ,throttleProgressCallbacks:1
      ,method:"octet"
      ,maxFiles:1
  });
  r2.assignBrowse($('#btnFileReSelect')[0]);

  //파일추가 이벤트
  r2.on('fileAdded', function(file) {

      // 파일이 존재할 경우.
      //if( $("#fileReDocId").val() != "" && $("#fileReNo").val() != "" ){
      //    fileReDelete();
      //}

      $("#progressWindow").kendoWindow({
          width:"600px"
          ,height:"300px"
          ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
          ,animation:false
          ,draggable:false
          ,visible:false
          ,resizable:false
          ,modal:true
      }).data("kendoWindow").center().open();


      $('.resumable-progress, .resumable-list').show();
      $('.resumable-progress .progress-resume-link').hide();
      $('.resumable-progress .progress-pause-link').show();

      //파일목록 출력
      $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
      $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

      //업로드 시작
      r2.upload();

  });
  r2.on('pause', function() {
      $('.resumable-progress .progress-resume-link').show();
      $('.resumable-progress .progress-pause-link').hide();
  });
  r2.on('uploadStart', function() {

      var _that = this;

      if (_that.opt["query"] == null) {
           _that.opt["query"] = {};
      }

      if (dms.string.isEmpty($("#fileReDocId").val())) {
          $.ajax({
              url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
              dataType:"json",
              type:"get",
              async:false,
              cache:false,
              success:function(id) {
                  _that.opt["query"]["resumableSessionId"] = id;
                  $("#fileReDocId").val(id);
              }
          });
      } else {
          _that.opt["query"]["resumableSessionId"] = $("#fileReDocId").val();
      }

      $('.resumable-progress .progress-resume-link').hide();
      $('.resumable-progress .progress-pause-link').show();
  });
  r2.on('complete', function() {

      var _that = this;

      $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

      //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

      $("#progressWindow").data("kendoWindow").close();
      r2.files = [];
      $(".resumable-list").html("");
  });
  r2.on('fileSuccess', function(file, message) {
      //console.log("===============");
      //console.log(message);

      var result = JSON.parse(message);
      if(result.status === "finished") {
          var fileInfo = "";
          fileInfo += "<a href=\"javascript:goFileDown(\'"+ result.fileDocNo +"\', \'"+ result.fileNo +"\');\" style='cursor:pointer'>";
          fileInfo += "<span class='k-tool-icon'></span>";
          fileInfo += "<span class='file_name'>"+ result.fileNm +"</span>";
          fileInfo += "</a>";
          $("#fileReY").html(fileInfo);

          $("#fileReN").hide();
          $("#fileReY").show();

          // 파일사이즈
          $("#fileReSize").text(dms.string.formatFileSize(result.fileSize));
          $("#btnFileReSelect").hide();
          $("#btnFileReDelete").show();
          $("#btnFileReDownload").show();
          $("#fileReDocId").val(result.fileDocNo);
          $("#fileReNo").val(result.fileNo);

          // 갱신심사 서류 갱신
          if(v_approveCd != "" && $("#dlrCd").val() != "" && $("#usrId").val() != "" && $("#reqNo").val() != ""){
              //fn_updateCarRcpDoc();
              $("#btnFileReSave").show();
              v_fileHisReList.push({"state":"S", "fileDocNo":result.fileDocNo, "fileNo":result.fileNo});
          }

          //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
      }

  });
  r2.on('fileError', function(file, message) {
      $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
  });
  r2.on('fileProgress', function(file) {
      var fileProgress = 0;

      if (file instanceof ResumableChunk) {
          fileProgress = file.fileObj.progress();
      } else {
          fileProgress = file.progress();
      }

      $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
      $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
      $('.progress-bar').css({width:Math.min(Math.floor(r2.progress() * 100), 100)+ '%'});
  });
 // 갱신심사 파일업로드 END

  // 갱신심사 파일삭제
  $("#btnFileReDelete").click(function(e){

      if( $("#fileReDocId").val() == "" || $("#fileReNo").val() == "" ){
          // 삭제할 파일이 없습니다.
          dms.notification.info("<spring:message code='sal.info.isDelEmptyFile' />");
          return false;
      }

      if(v_approveCd != "" && $("#dlrCd").val() != "" && $("#usrId").val() != "" && $("#reqNo").val() != ""){
          v_fileHisReList.push({"state":"D", "fileDocNo":$("#fileReDocId").val(), "fileNo":$("#fileReNo").val()});

          $("#fileReDocId").val('');
          $("#fileReNo").val('');
          $("#fileReY").html('');

          $("#fileReN").show();
          $("#fileReY").hide();

          $("#fileReSize").text('');        // 파일사이즈
          $("#btnFileReSelect").show();
          $("#btnFileReDelete").hide();     // 삭제버튼
          $("#btnFileReDownload").hide();   // 다운로드버튼
          $("#btnFileReSave").show();

      }else{
          fileReDelete('init');     //생성전 단계시 바로 삭제
      }
  });

  // 갱신심사 다운로드 버튼
  $("#btnFileReDownload").click(function(e){
      var fileDocNo = $("#fileReDocId").val();
      var fileNo = $("#fileReNo").val();

      if(fileDocNo == "" || (fileDocNo != "" && fileNo == 0)){
          dms.notification.warning("没有添加的文件");
          return false;
      }else {
          goFileDown(fileDocNo, fileNo);
      }
  });

  // 갱신파일 저장
  $("#btnFileReSave").click(function(e){
      if(v_fileHisReList.length > 0){
          // == file docNo 저장 ==
          var dataSet = v_fileHisReList[v_fileHisReList.length-1];
          var param = {};
          if( dataSet.state == "S"){
              param = { "dlrCd":$("#dlrCd").val()
                      , "usrId":$("#usrId").val()
                      , "reqNo":$("#reqNo").val()
                      , "uploadSeqRenewal":dataSet.fileDocNo
                      };
          }else{
              param = { "dlrCd":$("#dlrCd").val()
                      , "usrId":$("#usrId").val()
                      , "reqNo":$("#reqNo").val()
                      , "uploadSeqRenewal":""
                      };
          }
          $.ajax({
              url:"<c:url value='/sal/svo/askHelpCar/updateCarRcpDoc.do' />",
              data:JSON.stringify(param),
              type:'POST',
              dataType:'json',
              contentType:'application/json',
              async:false,
              error:function(jqXHR,status,error) {
                  dms.notification.error(error);
              },
              success:function(jqXHR, textStatus) { parent.gridReLosd(); }
          });
          // == file docNo 저장 end ==

          // 저장안된 file삭제.
          var deleteList = [];
          for(var i=0; i<v_fileHisReList.length-1; i++){
              deleteList.push({"fileDocNo":v_fileHisReList[i].fileDocNo, "fileNo":v_fileHisReList[i].fileNo});
          }
          fileReDelete('save', deleteList);
      }
  });

  fileReDelete = function(msg, dList){
      var deleteList = [];
      if(typeof(dList)  == 'undefined'){
          deleteList.push({"fileDocNo":$("#fileReDocId").val() , "fileNo":$("#fileReNo").val()});
      }else{
          deleteList = dList;
      }

      $.ajax({
          url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
         ,data:JSON.stringify(deleteList)
         ,type:'POST'
         ,dataType:'json'
         ,contentType:'application/json'
         ,async:false
         ,error:function(jqXHR, status, error) {
             dms.notification.error(error);
         }
         ,success:function(jqXHR, textStatus) {

             if(msg == "init"){
                 $("#fileReDocId").val('');
                 $("#fileReNo").val('');
                 $("#fileReY").html('');

                 $("#fileReN").show();
                 $("#fileReY").hide();

                 $("#fileReSize").text('');        // 파일사이즈
                 $("#btnFileReSelect").show();
                 $("#btnFileReDelete").hide();     // 삭제버튼
                 $("#btnFileReDownload").hide();   // 다운로드버튼

                 // 갱신심사 서류 갱신
                 //if(v_approveCd != "" && $("#dlrCd").val() != "" && $("#usrId").val() != "" && $("#reqNo").val() != ""){
                 //    fn_updateCarRcpDoc();
                 //}
             }else{
                 $("#btnFileReSave").hide();
                 //정상적으로 반영 되었습니다.
                 dms.notification.success("<spring:message code='global.info.success'/>");
             }
          }
      });
  }
 // 갱신심사 파일삭제 END

// 갱신심사 파일 내용 불러오기
function fn_fileReSelect(){
    $.ajax({
        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
       ,data:JSON.stringify({ "sFileDocNo":$("#fileReDocId").val() })
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,error:function(jqXHR, status, error) {
           dms.notification.error(jqXHR.responseJSON.errors);
       }
       ,success:function(jqXHR, textStatus) {

             var fileInfo = "", lng = 0;

             if(jqXHR.data.length > 0){
                 lng = jqXHR.data.length - 1;
                 fileInfo += "<a href=\"javascript:goFileDown(\'"+ jqXHR.data[lng].fileDocNo +"\', \'"+ jqXHR.data[lng].fileNo +"\');\" style='cursor:pointer'>";
                 fileInfo += "<span class='k-tool-icon'></span>";
                 fileInfo += "<span class='file_name'>"+ jqXHR.data[lng].fileNm +"</span>";
                 fileInfo += "</a>";
                 $("#fileReY").html(fileInfo);

                 $("#fileReN").hide();
                 $("#fileReY").show();

                 // 파일사이즈
                 $("#fileReSize").text(dms.string.formatFileSize(jqXHR.data[lng].fileSize));
                 $("#btnFileReSelect").hide();
                 $("#btnFileReDelete").show();
                 $("#btnFileReDownload").show();

                 //$("#fileReDocId").val(jqXHR.data[lng].fileDocNo);
                 $("#fileReNo").val(jqXHR.data[lng].fileNo);
             }

       }
    });
}

//갱신심사 서류 갱신
/*
function fn_updateCarRcpDoc(){

    var param = { "dlrCd":$("#dlrCd").val()
                , "usrId":$("#usrId").val()
                , "reqNo":$("#reqNo").val()
                , "uploadSeqRenewal":$("#fileReDocId").val()
                };

    $.ajax({
        url:"<c:url value='/sal/svo/askHelpCar/updateCarRcpDoc.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        async:false,
        error:function(jqXHR,status,error) {
            dms.notification.error(error);
        },
        success:function(jqXHR, textStatus) { parent.gridReLosd(); }
    });
}
*/
</script>
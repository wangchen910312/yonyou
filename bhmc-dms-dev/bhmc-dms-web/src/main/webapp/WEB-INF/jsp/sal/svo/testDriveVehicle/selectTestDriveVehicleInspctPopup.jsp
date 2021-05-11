<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 시승차 심사 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m"><spring:message code='global.btn.save' /></button>             <!-- 저장 -->
            <button id="btnConfirm" class="btn_m"><spring:message code='global.btn.fix' /></button>           <!-- 확정 -->
            <button id="btnPrint" class="btn_m"><spring:message code='global.btn.print' /></button>           <!-- 인쇄 -->
        </div>
    </div>

    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:14%;">
                <col style="width:12%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>   <!-- 딜러코드 -->
                    <td colspan="3">
                        <div class="form_float">
                            <div class="form_left" style="width:35.5%">
                                <input id="dlrCd" name="dlrCd" readonly class="form_input form_readonly">
                            </div>
                            <div class="form_right" style="width:64.5%">
                                <input id="dlrNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrUsrNm' /></th>  <!-- 딜러담당자 -->
                    <td class="bor_color">
                        <div class="form_float">
                            <div class="form_left" style="width:35.5%">
                                <input id="usrId" name="usrId" readonly class="form_input form_readonly">
                            </div>
                            <div class="form_right" style="width:64.5%">
                                <input id="usrNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.prsNm' /></th>    <!-- 담당자 -->
                    <td colspan="3">
                        <input id="salePrsnNm" name="salePrsnNm" readonly class="form_input form_readonly" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.telNumer' /></th>    <!-- 연락처 -->
                    <td class="bor_color">
                        <input id="salePrsnTelNo" name="salePrsnTelNo" readonly class="form_input form_readonly" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carType' /></th>   <!-- 차량유형 -->
                    <td>
                        <input id="tpCd" name="tpCd" readonly class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>   <!-- 신청일자 -->
                    <td class="bor_color">
                        <input id="reqDt" readonly class="form_datepicker" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.policyCont' /></th>    <!-- 정책설명 -->
                    <td colspan="5">
                        <textarea id="policyCont" rows="5" cols="" readonly class="form_textarea form_readonly"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid">
        <div id="carGrid"></div>
    </div>
    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:19%;">
                <col style="width:7%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.examinTp' /></th>            <!-- 심사구분 -->
                    <td colspan="3">
                        <%--
                        <ul class="tabmenu disabled">
                            <li id="tabReqTp01" class="on"><a href="javascript:;"><spring:message code='sal.lbl.individApplication' /></a></li>      <!-- 개인심사[신차신청으로 변경] -->
                            <li id="tabReqTp02"><a href="javascript:;"><spring:message code='sal.lbl.updateApplication' /></a></li>                  <!-- 갱신심사[갱신신청으로 변경] -->
                            <input type="hidden" id="reqTp" name="reqTp"/>
                        </ul>
                         --%>
                        <label class="label_check"><input id="tabReqTp01" name="tabReqTp" type="radio" value="1" checked="checked" class="form_check"> <spring:message code='sal.lbl.helpCarPersEvl' /><!-- 신규딜러신청--></label>
                        <label class="label_check"><input id="tabReqTp02" name="tabReqTp" type="radio" value="2" class="form_check"> <spring:message code='sal.lbl.updateApplication' /><!-- 갱신신청--></label>
                        <input type="hidden" id="reqTp" />
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
                            <input id="fileReDocId" name="uploadSeqRenewal" readonly class="form_input form_readonly" style="width:98%" data-json-obj="true" />
                            <input id="fileReNo" type="hidden" />
                        </div>
                        <div id="fileReY" class="uploadFile_area2"  style="display:none;"></div>
                    </td>
                    <td>
                        <span class="span_txt" id="fileReSize"></span>                              <!-- 파일Szie -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.remark' /></th>         <!-- 비고 -->
                    <td colspan="5">
                        <input id="remark" readonly name="remark" class="form_input form_readonly" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:19%;">
                <col style="width:7%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.evalRslt' /></th>  <!-- 심사결과 -->
                    <td colspan="5">
                        <%--
                        <ul class="tabmenu">
                            <li id="tabEvalRsltY" class="on"><span><spring:message code='global.btn.approval' /></span></li>      <!-- 승인 -->
                            <li id="tabEvalRsltN"><span><spring:message code='global.btn.nonApproval' /></span></li>              <!-- 불승인 -->
                            <input type="hidden" id="evalRslt" />
                        </ul>
                         --%>
                        <label class="label_check"><input id="tabEvalRsltY" name="tabEvalRslt" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='global.btn.approval' /><!-- 승인--></label>
                        <label class="label_check"><input id="tabEvalRsltN" name="tabEvalRslt" type="radio" value="N" class="form_check"> <spring:message code='global.btn.nonApproval' /><!-- 불승인--></label>
                        <input type="hidden" id="evalRslt" />
                    </td>
               </tr>
               <tr>
                   <th scope="row"><spring:message code='global.lbl.evalRemark' /></th>   <!-- 심사평가 -->
                   <td colspan="5">
                       <input id="judgeRemark" class="form_input">
                   </td>
               </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:19%;">
                <col style="width:7%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carReg' /> <spring:message code='global.lbl.document' /></th>      <!-- 차량등록 관련서류 -->
                    <td colspan="4">
                        <div id="fileN">
                            <input id="fileDocId" name="uploadSeq" readonly class="form_input form_readonly" style="width:98%" data-json-obj="true" />
                            <input id="fileNo" type="hidden" />
                        </div>
                        <div id="fileY" class="uploadFile_area2" style="display:none; position:relative; top:3px;"></div>
                    </td>
                    <td>
                        <span class="span_txt" id="fileSize"></span>                              <!-- 파일Szie -->
                    </td>
                </tr>
               <tr>
                   <th scope="row"><spring:message code='sal.lbl.askRemark' /></th>   <!-- 요청비고 -->
                   <td colspan="5">
                       <input id="evalRemark" readonly class="form_input form_readonly">
                   </td>
               </tr>
            </tbody>
        </table>
    </div>

    <div id="tFsdmAgr" class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:19%;">
                <col style="width:7%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.whthrPassing' /></th>       <!-- 합격여부 -->
                    <td>
                        <input id="fsdmAgrYn" name="fsdmAgrYn" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fsdmAgrRemark' /></th>         <!-- 평가비고 -->
                    <td colspan="3">
                        <input id="fsdmAgrRemark" name="fsdmAgrRemark" type="type" class="form_input" data-json-obj="true" />
                    </td>
               </tr>
            </tbody>
        </table>
    </div>

    <span style="display:none">
        <input type="hidden" id="reqNo" name="reqNo" />
    </span>

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

// 차량유형 SAL142 (시승차:N7)
var typeTpDSList = [];
<c:forEach var="obj" items="${typeTpDS}">
    typeTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 합격여부 SAL148
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


$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    var readyReqTp = true, readyEvalRslt = true;

    // 차량유형
    $("#tpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       ,value:'N7'
       ,enabled:false
       , optionLabel:" "
    });

    //심사일자
    $("#reqDt").kendoExtMaskedDatePicker({
        value:toDay
        ,format:vDtyyyyMMdd
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 신청구분:개인심사
    $("#tabReqTp01").click(function(){
        if(!readyReqTp){
            return false;
        }
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        $("#reqTp").val("1");
    });
    // 신청구분:갱신심사
    $("#tabReqTp02").click(function(obj){
        if(!readyReqTp){
            return false;
        }
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        $("#reqTp").val("2");
    });

    // 심사결과:승인
    $("#tabEvalRsltY").click(function(){
        if(!readyEvalRslt){
            return false;
        }
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        $("#evalRslt").val("Y");
    });
    // 심사결과:불승인
    $("#tabEvalRsltN").click(function(){
        if(!readyEvalRslt){
            return false;
        }
        //$(this).siblings("li").removeClass("on");
        //$(this).addClass("on");
        $("#evalRslt").val("N");
    });

    // 합격여부
    $("#fsdmAgrYn").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(evalRsltYnList)
       ,optionLabel:" "
    });

    $("#dlrCd").val(options.dlrCd);
    $("#dlrNm").val(options.dlrNm);
    $("#usrId").val(options.usrId);
    $("#usrNm").val(options.usrNm);
    $("#reqNo").val(options.reqNo);

    var dtSet = {};
    // 불러오는 내용일 경우.
    if(Number(options.reqNo) > 0){
        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/sal/svo/testDriveVehicle/selectTestDriveVehicleInspctPopupContain.do"
            ,data:JSON.stringify({"sDlrCd":options.dlrCd, "sUsrId":options.usrId, "sReqNo":options.reqNo})
            ,async:false
        });
       dtSet = responseJson.data[0];
    }

    $("#salePrsnNm").val( dms.string.strNvl(dtSet.salePrsnNm) );
    $("#salePrsnTelNo").val( dms.string.strNvl(dtSet.salePrsnTelNo) );

    // 차량등록 관련 서류 (첨부파일)
    if(typeof(dtSet.uploadSeq) != "undefined" && dtSet.uploadSeq != null && dtSet.uploadSeq != ""){
        $("#fileN").hide();
        $("#fileY").show();

        $("#fileDocId").val(dtSet.uploadSeq);
        fn_fileSelect();     // 파일 불러오기
    }else{
        $("#fileY").hide();
        $("#fileN").show();
    }

    if(typeof(dtSet.tpCd) != "undefined" && dtSet.tpCd != ""){
        $("#tpCd").data("kendoExtDropDownList").value(dtSet.tpCd);
    }else{
        $("#tpCd").data("kendoExtDropDownList").value('N7');
    }
    $("#tpCd").data("kendoExtDropDownList").enable(false);

    // 차량유형 설명
    if(typeof(dtSet.policyCont) != "undefined" && dtSet.policyCont != ""){
        $("#policyCont").val(dtSet.policyCont);
    }else{
        selectPolicyCont();
    }

    $("#reqDt").data("kendoExtMaskedDatePicker").value(dms.string.strNvl(dtSet.reqDt));   //신청일자
    $("#reqDt").data("kendoExtMaskedDatePicker").enable(false);

    //신청구분
    $("#reqTp").val(dms.string.strNvl(dtSet.reqTp));
    if(Number(dtSet.reqTp) == 2){
        $("#tabReqTp02").click();

    }else{
        $("#tabReqTp01").click();
    }
    $("#tabReqTp01").attr("disabled", "true");
    $("#tabReqTp02").attr("disabled", "true");
    readyReqTp = false;

    //합격여부
    $("#fsdmAgrYn").data("kendoExtDropDownList").value(dms.string.strNvl(dtSet.fsdmAgrYn));
    $("#fsdmAgrRemark").val(dms.string.strNvl(dtSet.fsdmAgrRemark));

    // 갱신심사 첨부파일
    if(typeof(dtSet.uploadSeqRenewal) != "undefined" && dtSet.uploadSeqRenewal != null && dtSet.uploadSeqRenewal != ""){
        $("#fileReN").hide();
        $("#fileReY").show();

        $("#fileReDocId").val(dtSet.uploadSeqRenewal);
        fn_fileReSelect();            // 갱신심사 파일 불러오기
    }else{
        $("#fileReY").hide();
        $("#fileReN").show();
    }

    $("#remark").val(dms.string.strNvl(dtSet.remark));               // 비고
    $("#evalRemark").val(dms.string.strNvl(dtSet.evalRemark));       // 요청비고

    //심사결과
    $("#evalRslt").val(dms.string.strNvl(dtSet.evalRsltYn));
    if(dms.string.strNvl(dtSet.evalRsltYn) == 'N'){
        $("#tabEvalRsltN").click();
    }else{
        $("#tabEvalRsltY").click();
    }

    $("#judgeRemark").val(dms.string.strNvl(dtSet.judgeRemark));  // 심사평가

    // 저장 버튼
    $("#btnSave").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#fsdmAgrYn").data("kendoExtDropDownList").value())){
                dms.notification.info("<spring:message code='global.lbl.whthrPassing' var='globalLblWhthrPassing' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblWhthrPassing}' />");
                return false;
            }

            // 저장 하시겠습니까?
            if(!confirm("<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />")){
                return;
            }

            var param = {};
            param.dlrCd = $("#dlrCd").val();
            param.usrId = $("#usrId").val();
            param.reqNo = $("#reqNo").val();

            param.fsdmAgrYn = $("#fsdmAgrYn").data("kendoExtDropDownList").value();
            param.fsdmAgrRemark = $("#fsdmAgrRemark").val();

            $.ajax({
                 url:"<c:url value='/sal/svo/testDriveVehicle/secondConfirmTestDriveVehiclePopup.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");

                     var data = [];
                     data.msg = 'save';
                     options.callbackFunc(data);
                     parent.popupWindow.close();
                }
            });
        }
    });

    // 확정 버튼
    $("#btnConfirm").kendoButton({
        click:function(e){
            /*
            if( dms.string.isEmpty($("#judgeRemark").val()) ){
                dms.notification.info("<spring:message code='global.lbl.evalRemark' var='globalLblEvalRemark' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblEvalRemark}' />");
                return false;
            }
            */

            // 확정 하시겠습니까?
            //if(!confirm("<spring:message code='global.btn.fix' var='globalBtnFix' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnFix}' />")){
            //    return;
            //}

            // 확정 하시겠습니까?
            dms.window.confirm({
                message:"<spring:message code='global.btn.fix' var='globalBtnFix' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnFix}' />"
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        var param = {};
                        param.dlrCd = $("#dlrCd").val();
                        param.usrId = $("#usrId").val();
                        param.reqNo = $("#reqNo").val();

                        param.evalRsltYn = $("#evalRslt").val();
                        param.remark = $("#judgeRemark").val();


                        $.ajax({
                             url:"<c:url value='/sal/svo/testDriveVehicle/confirmTestDriveVehicleInspctPopup.do' />"
                            ,data:JSON.stringify(param)
                            ,type:'POST'
                            ,dataType:'json'
                            ,async:false
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(jqXHR, textStatus) {
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
            var printReportUrl = "<c:url value='/ReportServer?reportlet=sale/screenRelation/selectDemoEvalRpt.cpt'/>"+printParam;
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
       ,editable:false
       ,autoBind:true
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

           }


       }
       ,columns:[
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqNo", hidden:true}       // 요청번호
          ,{field:"reqSeq", hidden:true}      // 요청일련번호

          ,{  // 차량
              field:"carlineCd"
             ,title:"<spring:message code='global.lbl.carlineCd' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
             ,template:"#=bf_selectCarLine(carlineCd)#"
             ,editor:function (container, options){
                 if( options.model.reqSeq == "" || options.model.carlineCd == ""){
                     $('<input required name="carlineCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                         , dataTextField:"carlineNm"
                         , dataValueField:"carlineCd"
                         , dataSource:carLineCdDSList
                         , select:selectGridCarlineCd
                         , change:function(e){
                             var grid = $("#carGrid").data("kendoExtGrid");
                             // 해당 그리드의 tr객체중 선택한 열을 찾아 7번째 컬럼의 객체를 가져온다. (hidden포함해서 0부터 시작)
                             var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(6)");
                             grid.editCell(modelCell);
                         }
                     });
                 }else{
                     container.context.innerText = carLineCdObj[options.model.carlineCd];
                 }
             }
          }
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
          ,{    // 모델
              field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:100
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectModel(modelCd, modelNm) #"
              ,editor:function (container, options){

                  if(     options.model.carlineCd != ""
                      && (options.model.modelCd == "" || options.model.reqSeq == "") ){
                      $('<input required name="modelCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"modelNm"
                          ,dataValueField:"modelCd"
                          ,dataSource:modelCdDSList
                          , select:selectGridModelCd
                          , change:function(e){
                              var grid = $("#carGrid").data("kendoExtGrid");
                              // 해당 그리드의 tr객체중 선택한 열을 찾아 9번째 컬럼의 객체를 가져온다.
                              var ocnCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(8)");
                              grid.editCell(ocnCell);
                          }
                      });
                  }else{
                      if(options.model.modelNm != ""){
                          container.context.innerText = options.model.modelNm;
                      }else{
                          container.context.innerText = modelCdObj[options.model.modelCd];
                      }
                  }
              }
          }
          ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
          ,{    // OCN
              field:"ocnCd",   title:"global.lbl.ocn", width:100
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectOcn(ocnCd, ocnNm) #"
              ,editor:function (container, options){

                  if(     options.model.modelCd != ""
                      && (options.model.ocnCd == "" || options.model.reqSeq == "" ) ){
                      $('<input required name="ocnCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"ocnNm"
                          ,dataValueField:"ocnCd"
                          ,dataSource:ocnCdDSList
                          ,select:selectGridOcnCd
                          ,change:function(e){
                              var grid = $("#carGrid").data("kendoExtGrid");
                              // 해당 그리드의 tr객체중 선택한 열을 찾아 11번째 컬럼의 객체를 가져온다.
                              var extColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(10)");
                              grid.editCell(extColorCell);
                          }
                      });
                  }else{
                      if(options.model.ocnNm != ""){
                          container.context.innerText = options.model.ocnNm;
                      }else{
                          container.context.innerText = ocnCdObj[options.model.ocnCd];
                      }
                  }
              }
          }
          ,{field:"ocnNm", title:"ocnNm", hidden:true}       // 모델명
          ,{    // 외장색
              field:"extColorCd",   title:"<spring:message code='global.lbl.extColor' />", width:100
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectExtColor(extColorCd, extColorNm) #"
              ,editor:function (container, options){

                  if(     options.model.ocnCd != ""
                      && (options.model.extColorCd == "" || options.model.reqSeq == "" ) ){
                      $('<input required name="extColorCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"extColorNm"
                          ,dataValueField:"extColorCd"
                          ,dataSource:extColorCdDSList
                          , select:selectGridExtColorCd
                          ,change:function(e){
                              var grid = $("#carGrid").data("kendoExtGrid");
                              // 해당 그리드의 tr객체중 선택한 열을 찾아 13번째 컬럼의 객체를 가져온다.
                              var intColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(12)");
                              grid.editCell(intColorCell);
                          }
                      });
                  }else{
                      if(options.model.extColorNm != ""){
                          container.context.innerText = options.model.extColorNm;
                      }else{
                          container.context.innerText = extColorCdObj[options.model.extColorCd];
                      }
                  }
              }
          }
          ,{field:"extColorNm", hidden:true}       // 외장색
          ,{    // 내장색
              field:"intColorCd",   title:"<spring:message code='global.lbl.intColor' />", width:100
              , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
              ,template:"#= bf_selectIntColor(intColorCd, intColorNm) #"
              ,editor:function (container, options){

                  if(     options.model.extColorCd != ""
                      && (options.model.intColorCd == "" || options.model.reqSeq == "") ){
                      $('<input required name="intColorCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"intColorNm"
                          ,dataValueField:"intColorCd"
                          ,dataSource:intColorCdDSList
                          ,select:selectGridIntColorCd
                      });
                  }else{
                      if(options.model.intColorNm != ""){
                          container.context.innerText = options.model.intColorNm;
                      }else{
                          container.context.innerText = intColorCdObj[options.model.intColorCd];
                      }
                  }
              }
          }
          ,{field:"intColorNm", hidden:true}       // 외장색
          ,{  //특수차량 수량
              field:"spcCarQty"
             ,title:"<spring:message code='global.lbl.qty' />"
             ,width:100
             ,attributes:{"class":"ar"}
             ,format:"{0:n0}"
             ,hidden:true
          }
          ,{field:"ordNo", hidden:true}             // 오더번호
          ,{field:"befOrdNo", hidden:true}          // 이전오더번호
       ]
   });

    /**
    * 승인구분:버튼 표시
    **/
    // 저장
    if(dtSet.approveCd == "A"){
        $("#btnConfirm").data("kendoButton").enable(false);      // 확정
        $("#btnSave").data("kendoButton").enable(false);         // 저장

        $("#tFsdmAgr").hide();

        readyEvalRslt = false;                      // 심사결과 잠금
        $("#judgeRemark").attr("disabled", true);   // 심사평가
    }  // 승인신청:확정
    else if(dtSet.approveCd == "B"){
        $("#btnConfirm").data("kendoButton").enable(true);      // 확정
        $("#btnSave").data("kendoButton").enable(false);        // 저장

        $("#tFsdmAgr").hide();
    }   // 승인
    else if(dtSet.approveCd == "C"){
        $("#btnConfirm").data("kendoButton").enable(false);      // 확정
        $("#btnSave").data("kendoButton").enable(true);         // 저장

        $("#tabEvalRsltY").attr("disabled", "true");
        $("#tabEvalRsltN").attr("disabled", "true");

        $("#tFsdmAgr").show();
        //$("#fsdmAgrYn").data("kendoExtDropDownList").enable(true);
        //$("#fsdmAgrRemark").attr("disabled", false);

        readyEvalRslt = false;                          // 심사결과 잠금
        $("#judgeRemark").attr("disabled", true);      // 심사평가
    }
    else if(dtSet.approveCd == "D" ){
        $("#btnConfirm").data("kendoButton").enable(false);      // 확정
        $("#btnSave").data("kendoButton").enable(false);         // 저장

        $("#tabEvalRsltY").attr("disabled", "true");
        $("#tabEvalRsltN").attr("disabled", "true");

        $("#tFsdmAgr").hide();
        $("#fsdmAgrYn").data("kendoExtDropDownList").enable(false);
        $("#fsdmAgrRemark").attr("disabled", true);

        readyEvalRslt =false;                          // 심사결과 잠금
        $("#judgeRemark").attr("disabled", true);      // 심사평가
    }
    else{
        $("#btnConfirm").data("kendoButton").enable(false);      // 확정숨김
        $("#btnSave").data("kendoButton").enable(false);         // 저장

        $("#tFsdmAgr").hide();

        readyEvalRslt =false;                       // 심사결과 잠금
        $("#judgeRemark").attr("disabled", true);   // 심사평가
    }

});

/**
 * 차량유형 설명 조회
 */
function selectPolicyCont(tpCd){
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopupCont.do"
        ,data:JSON.stringify({"sTpCd":tpCd})
        ,async:false
    });
   // 차량유형 설명
   $("#policyCont").val(responseJson.data[0].policyCont);
}


/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;

    modelCdObj = [];
    $.each(modelCdDSList, function(idx, obj){
        modelCdObj[obj.modelCd] = obj.modelNm;
    });
};

// 모델에 따른 OCN 조회
function selectGridModelCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.modelNm = dataItem.modelNm;

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectOcn.do"
        ,data:JSON.stringify({"modelCd":dataItem.modelCd})
        ,async:false
    });
    ocnCdDSList = responseJson.data;

    ocnCdObj = [];
    $.each(ocnCdDSList, function(idx, obj){
        ocnCdObj[obj.ocnCd] = obj.ocnNm;
    });
};

//OCN에 따른 외장색 조회:모델값으로 조회
function selectGridOcnCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.ocnNm = dataItem.ocnNm;

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectExtColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd})
        ,async:false
    });
    extColorCdDSList = responseJson.data;

    extColorCdObj = [];
    $.each(extColorCdDSList, function(idx, obj){
        extColorCdObj[obj.extColorCd] = obj.extColorNm;
    });
};

//외장색에 따른 내장색 조회:모델값으로 조회
function selectGridExtColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.extColorNm = dataItem.extColorNm;

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectIntColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd})
        ,async:false
    });
    intColorCdDSList = responseJson.data;

    intColorCdObj = [];
    $.each(intColorCdDSList, function(idx, obj){
        intColorCdObj[obj.intColorCd] = obj.intColorNm;
    });
};

//내장색 선택
function selectGridIntColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.intColorNm = dataItem.intColorNm;
};



//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return carLineCdObj[carlineCd];
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
    return modelCdObj[modelCd];
}

//3 Grid - OCN의 template 정의
function bf_selectOcn(ocnCd, ocnNm){
    if(ocnNm != ""){
        return ocnNm;
    }
    if(ocnCd == ""){
        return "";
    }
    return ocnCdObj[ocnCd];
}

//4 Grid - 외장색의 template 정의
function bf_selectExtColor(extColorCd, extColorNm){
    if(extColorNm != ""){
        return extColorNm;
    }
    if(extColorCd == ""){
        return "";
    }
    return extColorCdObj[extColorCd];
}

//5 Grid - 내장색의 template 정의
function bf_selectIntColor(intColorCd, intColorNm){
    if(intColorNm != ""){
        return intColorNm;
    }
    if(intColorCd == ""){
        return "";
    }
    return intColorCdObj[intColorCd];
}


//== 파일 내용 불러오기
function fn_fileSelect(){
    $.ajax({
        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
       ,data:JSON.stringify({ "sFileDocNo":$("#fileDocId").val() })
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,error:function(jqXHR, status, error) {
           dms.notification.error(jqXHR.responseJSON.errors);
       }
       ,success:function(jqXHR, textStatus) {

             var fileInfo = "", lng = 0;
             lng = jqXHR.data.length - 1;

             if(jqXHR.data.length > 0){
                 fileInfo += "<a href=\"javascript:goFileDown(\'"+ jqXHR.data[lng].fileDocNo +"\', \'"+ jqXHR.data[lng].fileNo +"\');\" style='cursor:pointer'>";
                 fileInfo += "<span class='k-tool-icon'></span>";
                 fileInfo += "<span class='file_name'>"+ jqXHR.data[lng].fileNm +"</span>";
                 fileInfo += "</a>";
                 $("#fileY").html(fileInfo);

                 $("#fileN").hide();
                 $("#fileY").show();

                 // 파일사이즈
                 $("#fileSize").text(dms.string.formatFileSize(jqXHR.data[lng].fileSize));
                 //$("#fileDocId").val(jqXHR.data[lng].fileDocNo);
                 $("#fileNo").val(jqXHR.data[lng].fileNo);
             }
       }
    });
}

// 파일 다운
function goFileDown(fileDocNo, fileNo){
    dms.fileManager.download(fileDocNo, fileNo);
}

//갱신심사 파일 내용 불러오기
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
             //$("#fileReDocId").val(jqXHR.data[lng].fileDocNo);
             $("#fileReNo").val(jqXHR.data[lng].fileNo);
       }
    });
}
</script>
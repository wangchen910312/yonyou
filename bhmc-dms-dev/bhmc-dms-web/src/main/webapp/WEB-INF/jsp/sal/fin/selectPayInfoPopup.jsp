<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 수납관리 상세 -->
<section id="window" class="pop_wrap">
<form id="PayForm" name="PayForm" method="POST">

    <!-- 수납관리 -->
    <section class="group">
        <div class="header_area">
            <div id="dPopButton" class="btn_right">
                <button id="btnPayPrint" type="button" class="btn_m"><spring:message code='sal.btn.payPrint' /></button>         <!-- 결산서 -->
                <button id="btnPay" type="button" class="btn_m"><spring:message code='sal.btn.pay' /></button>                <!-- 수납 -->
                <button id="btnPayCancel" type="button" class="btn_m" style="display:none;"><spring:message code='ser.btn.receiveCancel' /></button>  <!-- 수납취소 -->
                <button id="btnCancel"   type="button" class="btn_m"><spring:message code='global.btn.init' /></button>        <!-- 초기화 -->
            </div>
        </div>
    </section>

    <!-- 계약가격정보 -->
    <div id="contInfo" style="display:none;margin-bottom:10px;">
        <section  class="group" >
            <div class="header_area" style="display:none;">
                <h2 class="title_basic"><spring:message code='sal.title.contractPriceInfo' /></h2>     <!-- 계약가격정보 -->
            </div>
            <div class="table_list table_list_v1">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col style="width:11%;">
                        <col>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realCarAmts' /></strong></th>      <!-- 순차량가격 -->
                            <th scope="col" rowspan="2"><strong><spring:message code='global.lbl.contractAmt' /></strong></th>      <!-- 예판가격 -->
                            <th scope="col" rowspan="2"><spring:message code='sal.lbl.goods' /></th>            <!-- 용품 -->
                            <th scope="col" rowspan="2"><spring:message code='global.lbl.insurance' /></th>     <!-- 보험 -->
                            <th scope="col" rowspan="2"><spring:message code='global.lbl.finc' /></th>          <!-- 금융 -->
                            <th scope="col" rowspan="2"><spring:message code='sal.lbl.usedCar' /></th>          <!-- 중고차 -->
                            <th scope="col" rowspan="2"><spring:message code='global.lbl.execution' /></th>     <!-- 대행 -->
                            <th scope="col" rowspan="2"><spring:message code='sal.lbl.point' /></th>            <!-- 포인트 -->
                            <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realPayAmts' /></strong></th>      <!-- 총계합 -->
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="ar child_borderNone"><input id="cntRealAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>         <!-- 순차량금액 -->
                            <td class="ar child_borderNone"><input id="cntReservContAmt" name="reservContAmt" class="form_numeric ar font_bold" /></td>       <!-- 예판가격 -->
                            <td class="ar child_borderNone"><input id="cntGoodsAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>       <!-- 용품가격 -->
                            <td class="ar child_borderNone"><input id="cntIncAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>           <!-- 보험료 -->
                            <td class="ar child_borderNone"><input id="cntFincAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>         <!-- 금융 -->
                            <td class="ar child_borderNone"><input id="cntSbstAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>         <!-- 중고차 -->
                            <td class="ar child_borderNone"><input id="cntAapAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>           <!-- 대행료 -->
                            <td class="ar child_borderNone"><input id="cntPointAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>    <!-- 포인트 -->
                            <td class="ar td_total child_borderNone"><input id="cntRealPayAmt" class="form_numeric ar font_bold" disabled="disabled" /></td>     <!-- 실제지불금액 -->
                        </tr>
                    </tbody>
                </table>
                <span style="display:none">
                    <!-- 할인금액 -->
                    <input id="cntDcAmt" type="hidden"/>
                </span>
            </div>
        </section>
    </div>
    <!-- //계약가격정보 -->

    <section class="group">
        <div class="header_area">
            <h2 class="title_basic" style="margin-top:-14px;"><spring:message code='sal.title.payinfo' /></h2>      <!-- 수납정보 -->
        </div>
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
                        <th scope="row"><spring:message code='global.lbl.wrkTp' /></th>        <!-- 业务类型 업무유형 -->
                        <td>
                            <input id="jobTp" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.prenSumAmt' /></th>        <!-- 应收金额 계약총액 -->
                        <td>
                            <input id="realPayAmt" class="form_numeric form_readonly ar" readonly />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.compsDt' /></th>   <!-- 정산완성일자 -->
                        <td>
                            <input id="compDt" class="form_datepicker form_readonly" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.jobContractsNo' /></th>    <!-- 业务单编号업무단번호 -->
                        <td>
                            <input id="jobContractNo" name="jobContractNo" class="form_input form_readonly" data-json-obj="true" readonly />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.totPayAmt' /></th>     <!-- 기정산금액 -->
                        <td>
                            <input id="totPayAmt" class="form_numeric form_readonly ar" readonly />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.rctsDt' /></th>        <!-- 수납일자 -->
                        <td>
                            <input id="rctDt" name="rctDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.publNm' /></th>    <!-- 客户姓名고객이름 -->
                        <td>
                            <input id="custNm" name="custNm" class="form_input form_readonly" readonly data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.recvAmt' /></th>     <!-- 미정산금액 -->
                        <td>
                            <input id="recvAmt" class="form_numeric form_readonly ar" readonly />
                        </td>
                        <!-- 현금 -->
                        <th scope="row" class="cacheY"><spring:message code='sal.lbl.ReceiptPubDt' /></th>        <!-- 영수증일자 -->
                        <td class="cacheY">
                            <input id="recpDt" name="recpDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <!-- 포인트 -->
                    <th scope="row" class="pointT" style="display:none;"><spring:message code='global.lbl.limitPoint' /></th> <!-- 포인트사용상한치 -->
                        <td class="pointT" style="display:none;">
                            <input id="membershipPointUseMaxPoint" name="membershipPointUseMaxPoint" class="form_numeric form_readonly ar" readonly data-json-obj="true" />
                        </td>
                        <!-- 예치금 -->
                        <th scope="row" class="custAmtT" style="display:none;"><spring:message code='sal.lbl.preBalBalc' /></th>   <!-- 예치금 잔액 -->
                        <td class="custAmtT" style="display:none;">
                            <input id="ableAmt" class="form_numeric form_readonly ar" readonly />
                        </td>
                        <!-- 공백 -->
                        <th scope="row" class="cacheN01" style="display:none;"></th>
                        <td class="cacheN01" style="display:none;"></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.achievementstatus' /></th>    <!-- 完成情况완성현황 -->
                        <td>
                            <input id="paymentTp" name="paymentTp" class="form_comboBox"  data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.payAmt' /></th>     <!-- 수납금액 -->
                        <td>
                            <input id="payAmt" name="payAmt" class="form_numeric ar"  onfocus="fnOnfocus(this.id);" data-json-obj="true" />
                        </td>
                        <!-- 현금 -->
                        <th scope="row" class="cacheY"><spring:message code='sal.lbl.invoiceNo' /></th>        <!-- 영수증번호 -->
                        <td class="cacheY">
                            <input id="recpSeq" name="recpSeq" class="form_input" maxlength="10" data-json-obj="true" />
                        </td>
                        <!-- 포인트 -->
                        <th scope="row" class="pointT" style="display:none;"><spring:message code='sal.lbl.usePoint' /></th>    <!-- 가용포인트 -->
                        <td class="pointT" style="display:none;">
                            <input id="point" class="form_numeric form_readonly ar" readonly />
                            <input type="hidden"  id="pointRule" name="pointRule" data-json-obj="true" />
                        </td>

                        <!-- 공백 -->
                        <th scope="row" class="cacheN02" style="display:none;"></th>
                        <td class="cacheN02" style="display:none;"></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.payTpNm' /></th>       <!-- 정산유형 -->
                        <td>
                            <input id="payTp" name="payTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.payTp' /></th>    <!-- 지불방식 -->
                        <td>
                            <input id="rctTp" name="rctTp" class="form_comboBox"  data-json-obj="true" />
                        </td>
                        <!-- 현금 -->
                        <th scope="row" class="cacheY"><spring:message code='sal.lbl.bank' /></th>     <!-- 은행 -->
                        <td class="cacheY">
                            <input id="bankTp" name="bankTp" class="form_comboBox"  data-json-obj="true" />
                        </td>
                        <!-- 포인트 -->
                        <th scope="row" class="pointT" style="display:none;"><spring:message code='sal.lbl.pointUseAmt' /></th> <!-- 포인트 사용금액 -->
                        <td class="pointT" style="display:none;">
                            <input id="pointVal" name="pointVal" class="form_numeric ar" onblur="bf_pointVal();" onfocus="fnOnfocus(this.id);" data-json-obj="true" />
                        </td>
                        <!-- 공백 -->
                        <th scope="row" class="cacheN03" style="display:none;"></th>
                        <td class="cacheN03" style="display:none;"></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.membershipNo' /></th>  <!-- 멤버십번호 -->
                        <td>
                            <input id="membershipNo" name="membershipNo" class="form_comboBox" data-json-obj="true" />
                            <input id="membershipCardNo" name="membershipCardNo" type="hidden" data-json-obj="true" />       <!-- 멤버십카드 번호 -->
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.remark' /></th>   <!-- 비고 -->
                        <td colspan="3">
                            <input id="remark" name="remark" class="form_input" maxlength="400" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //수납정보 -->

    <!-- 수납이력 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.lbl.payinfoHis' /></h2>      <!-- 수납이력 -->
        </div>
        <div class="table_grid">
            <div id="subGrid" ></div>
        </div>
    </section>
    <!-- //수납이력 -->

    <!-- hidden값  -->
    <span style="display:none">
        <!-- 수납문서번호 -->
        <input id="finDocNo" name="finDocNo" type="hidden" data-json-obj="true" />
        <input id="dlrCd" name="dlrCd" type="hidden" data-json-obj="true" />

        <input id="custNo" type="hidden" />
        <input id="vinNo" type="hidden" />

    </span>
</form>
</section>
<!-- //계약관리 화면 -->

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
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

var toDay = "${toDay}";         // 현재일자
var toTime = "${toTime}";       // 현재시간(시:분)
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자

// 업무유형 SAL174 (계약/용품/보험)
var jobTpList = [];
<c:forEach var="obj" items="${jobTpDS}">
    jobTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 수납상태(완성현황 미납/수납완료) SAL173
var paymentTpList = [];
<c:forEach var="obj" items="${paymentTpDS}">
    paymentTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 지불방식 SAL172
var paymentCdList = [];
<c:forEach var="obj" items="${paymentCdDS}">
    paymentCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 은행 SAL179
var bankTpList = [];
<c:forEach var="obj" items="${bankTpDS}">
    bankTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 정산유형 SAL194
var payTpList = [];
<c:forEach var="obj" items="${payTpDS}">
    payTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 팝업 설정값
var options = parent.payInfoPopupWindow.options.content.data;

var popupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {
    if(dms.string.isEmpty(options.finDocNo)){
        dms.notification.info("<spring:message code='global.info.required.select'/>");
        parent.payInfoPopupWindow.close();
    }

    $("#finDocNo").val(options.finDocNo);
    $("#dlrCd").val(options.dlrCd);

    // 보기
    $("#btnPayPrint").kendoButton({
        click:function(e){
            if($("#jobTp").data("kendoExtDropDownList").value() == "C"){
                var iReportParam =  "&sDlrCd="+dlrCd+"&sContractNo="+$("#jobContractNo").val()+"&sJobTp=C";
                var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectSalePayInfoTotRpt.cpt' />"+iReportParam;
                var newWindow=open(iReportUrl, "<spring:message code='sal.btn.payPrint' />", 'top=0,left=0,width=870,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
            }else{
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    // 수납
    $("#btnPay").kendoButton({
        click:function(e){

            if( !save_Validate() ){
                return false;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.btn.pay' var='salBtnPay' /><spring:message code='global.info.cnfrmMsg' arguments='${salBtnPay}' />"
                ,title :"<spring:message code='sal.btn.pay' />"
                ,callback:function(result){
                    if(result){

                        var saveData = $("#PayForm").serializeObject($("#PayForm").serializeArrayInSelector("[data-json-obj='true']"));
                        saveData.membershipNo = $("#membershipNo").data("kendoExtDropDownList").value();
                        saveData.colTp = "01"; // 입금

                        //포인트
                        if($("#rctTp").data("kendoExtDropDownList").value() == "10"){
                            saveData.rctDt = "";
                            saveData.recpDt = "";
                            saveData.membershipPointUseMaxPoint = $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value();
                            saveData.pointVal = $("#pointVal").data("kendoExtNumericTextBox").value();
                        }else{
                            saveData.pointRule = 0;
                            saveData.pointVal = 0;
                            saveData.membershipPointUseMaxPoint = 0;
                            saveData.rctDt = $("#rctDt").data("kendoExtMaskedDatePicker").value(); // 수납일자
                            saveData.recpDt = $("#recpDt").data("kendoExtMaskedDatePicker").value(); // 영수증일자
                        }

                        var recvAmt = Number($("#recvAmt").data("kendoExtNumericTextBox").value())
                          , payAmt  = Number($("#payAmt").data("kendoExtNumericTextBox").value());
                        if(recvAmt == payAmt){
                            saveData.paymentTp = "02";      // 완성
                        }

                        saveData.payAmt = $("#payAmt").data("kendoExtNumericTextBox").value();
                        saveData.jobTp = $("#jobTp").data("kendoExtDropDownList").value();

                        $.ajax({
                            url:"<c:url value='/sal/fin/payInfo/savePayInfo.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            async:false,
                            error:function(jqXHR,status,error) {
                                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }else{
                                    dms.notification.error(error);
                                }
                            },
                            success:function(jqXHR, textStatus) {
                                refreshAll();
                                fn_payInfoOnLoad(options);
                                parent.gridReLosd();
                                //options.callbackFunc(data);

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

    //정산취소
    $("#btnPayCancel").kendoButton({
        click:function(e){
            dms.window.confirm({
                message:"<spring:message code='ser.btn.receiveCancel' var='serBtnReceiveCancel' /><spring:message code='global.info.cnfrmMsg' arguments='${serBtnReceiveCancel}' />"
                ,title :"<spring:message code='ser.btn.receiveCancel' />"
                ,callback:function(result){
                    if(result){

                        $.ajax({
                            url:"<c:url value='/sal/fin/payInfo/changePayInfo.do' />",
                            data:JSON.stringify({"finDocNo":$("#finDocNo").val(), "paymentTp":"01"}),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            async:false,
                            error:function(jqXHR,status,error) {
                                dms.notification.error(error);
                            },
                            success:function(jqXHR, textStatus) {
                                refreshAll();
                                fn_payInfoOnLoad(options);
                                parent.gridReLosd();
                                //options.callbackFunc(data);

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


    // 초기화
    $("#btnCancel").kendoButton({
        click:function(e){
            dms.window.confirm({
                message:"<spring:message code='global.btn.init' var='globalBtnInit' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnInit}' />"
                ,title :"<spring:message code='global.btn.init' />"
                ,callback:function(result){
                    if(result){
                        refreshAll();
                        fn_payInfoOnLoad(options);
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    // 순차량금액
    $("#cntRealAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 용품가격
    $("#cntGoodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 보험료
    $("#cntIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 금융
    $("#cntFincAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 중고차
    $("#cntSbstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 대행료
    $("#cntAapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 포인트
    $("#cntPointAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //예판
    $("#cntReservContAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제지불금액
    $("#cntRealPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 업무유형
    $("#jobTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(jobTpList)
       ,optionLabel:" "
       ,enable:false
    });

    //계약총액
    $("#realPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //완성일자
    $("#compDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 기정산금액
    $("#totPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //수납일자
    $("#rctDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 미정산금액
    $("#recvAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //영수증일자
    $("#recpDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 완성현황
    $("#paymentTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(paymentTpList)
       //,optionLabel:" "
       ,value:"01"
    });

    // [04.26] 미납, 수납완료 상태를 자동으로 요청. - 에누리 금액 인정안함. [령연 요청]
    $("#paymentTp").data("kendoExtDropDownList").enable(false);

    // 수납금액
    $("#payAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 정산유형
    $("#payTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(payTpList)
       ,optionLabel:" "
       ,change:function(e){
           if($("#jobTp").data("kendoExtDropDownList").value() === "C"){
               var dataItem = this.dataItem(e.item);
               if(dataItem.cmmCd == "01"){
                   //기동차 영수증 조회.
                   var responseJson = dms.ajax.getJson({
                       url :"<c:url value='/sal/fin/payInfo/selectReceiptSearch.do' />"
                       ,data :JSON.stringify({"sJobContractNo":$("#jobContractNo").val()})
                       ,async :false
                   });
                   if(responseJson != null){
                       $("#recpDt").data("kendoExtMaskedDatePicker").value(responseJson.receiptIssDt);
                       $("#recpSeq").val(responseJson.receiptNo);
                   }
               }
           }
       }
    });

    // 멤버십 포인트번호
    $("#membershipNo").kendoExtDropDownList({
        dataTextField:"membershipNo"
        ,dataValueField:"membershipNo"
        ,enable:false
        ,select:function(e){
            var dataItem = this.dataItem(e.item);
            $("#membershipCardNo").val(dms.string.strNvl(dataItem.cardNo));
            $("#point").data("kendoExtNumericTextBox").value(Number(dataItem.lastPointVal));          // 가용포인트
            $("#pointRule").val(Number(dataItem.pointExchgScale));   // 포인트요율
            $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(Number(dataItem.MembershipPointUseMaxPoint));     // 최대 상한치
            $("#pointVal").data("kendoExtNumericTextBox").value(0);

            $("#payAmt").data("kendoExtNumericTextBox").value(0);
            $("#payAmt").data("kendoExtNumericTextBox").enable(false);
        }
    });

    // 포인트가용금액
    $("#point").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       ,value:0
       ,spinners:false
    });

    // 포인트사용금액
    $("#pointVal").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       ,value:0
       ,spinners:false
    });

    // 최대사용가능 포인트
    $("#membershipPointUseMaxPoint").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       ,value:0
       ,spinners:false
    });

    // 예치금가용금액
    $("#ableAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 지불방식
    $("#rctTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(paymentCdList)
       ,value:"01"
       ,select :function(e){
           var dataItem = this.dataItem(e.item);
       }
    });
    $("#rctTp").on("change", function (){
        var rctTp = $(this).data("kendoExtDropDownList").value();
        if( !dms.string.isEmpty(rctTp) ){

            if(dms.string.isEmpty($("#custNo").val())){
                dms.notification.info("<spring:message code='crm.info.noCust'/>");
                $("#rctTp").data("kendoExtDropDownList").value("01");
                return ;
            }

            // 포인트
            if(rctTp == "10"){
                if($("#jobTp").data("kendoExtDropDownList").value() != "G"){
                    dms.notification.info("<spring:message code='sal.info.payGoodsPointMsg' />");
                    rctTp = "01";
                    $("#rctTp").data("kendoExtDropDownList").value(rctTp);
                }else{

                    $("#payAmt").data("kendoExtNumericTextBox").value(0);
                    $("#payAmt").data("kendoExtNumericTextBox").enable(false);

                    fnPointsearch();
                }
            }

            rctRayOut(rctTp);

            // 쿠폰없음.
            // tobe 예치금
        }
    });

    // 은행
    $("#bankTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(bankTpList)
       ,optionLabel:" "
    });


    // 더블클릭.
   if( dms.string.isNotEmpty(options)){
       fn_payInfoOnLoad(options);
   }else{
       refreshAll();
       fn_btnState();
   }


   // DB동기화 - 재조회.
   function fn_payInfoOnLoad(selectedItem){
       dms.loading.show();
       $.ajax({
          url :"<c:url value='/sal/fin/payInfo/selectPayInfoMainSearch.do' />"
          ,data :JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sFinDocNo":selectedItem.finDocNo})
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
              if(jqXHR.total > 0){
                refreshAll();
                fn_DBclick(jqXHR.data[0]);
              }else{
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
              }
              dms.loading.hide();
          }
      });
   }

    // 수납문서번호 내역 셋팅
    fn_DBclick = function(selectedItem){
        if( selectedItem != null && selectedItem != 'undefined'){

            $("#subGrid").data('kendoExtGrid').dataSource.read();

            if(dms.string.strNvl(selectedItem.jobTp) == "C"){
                /* 계약가격정보 */
                $("#cntRealAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);          // 순차량금액
                $("#cntGoodsAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsAmt != null ? selectedItem.goodsAmt :0);             // 용품가격
                $("#cntIncAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt :0);                   // 보험료
                $("#cntFincAmt").data("kendoExtNumericTextBox").value(selectedItem.fincAmt != null ? selectedItem.fincAmt :0);                // 금융
                $("#cntSbstAmt").data("kendoExtNumericTextBox").value(selectedItem.sbstAmt != null ? selectedItem.sbstAmt :0);                // 중고차
                $("#cntAapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt :0);                   // 대행료
                $("#cntDcAmt").val(selectedItem.dcAmt != null ? selectedItem.dcAmt :0);                                                    // 할인가격
                $("#cntPointAmt").data("kendoExtNumericTextBox").value(selectedItem.pointAmt != null ? selectedItem.pointAmt :0);             // 포인트금액
                $("#cntReservContAmt").data("kendoExtNumericTextBox").value(selectedItem.reservContAmt != null ? selectedItem.reservContAmt :0);       //예판가격
                $("#cntRealPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt :0);       //총계합
                $("#contInfo").show();
                $("#payTp").data("kendoExtDropDownList").enable(true);
            }else{
                $("#contInfo").hide();
                $("#payTp").data("kendoExtDropDownList").enable(false);
            }

            $("#jobTp").data("kendoExtDropDownList").value(selectedItem.jobTp);
            $("#realPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt);
            $("#compDt").data("kendoExtMaskedDatePicker").value(selectedItem.compDt);
            $("#jobContractNo").val(selectedItem.jobContractNo);
            $("#totPayAmt").data("kendoExtNumericTextBox").value(selectedItem.totPayAmt);
            if(dms.string.isNotEmpty(selectedItem.rctDt) && selectedItem.paymentTp == "02"){
                $("#rctDt").data("kendoExtMaskedDatePicker").value(selectedItem.rctDt);
            }
            $("#custNm").val(selectedItem.payCustNm);
            $("#custNo").val(selectedItem.custNo);
            $("#vinNo").val(selectedItem.vinNo);

            fnPointsearch();
            if($("#membershipNo").data("kendoExtDropDownList").dataSource.total() > 1){
                if(dms.string.isEmpty(selectedItem.membershipNo)){
                    $("#membershipNo").data("kendoExtDropDownList").select(0);
                }else{
                    $("#membershipNo").data("kendoExtDropDownList").value(dms.string.strNvl(selectedItem.membershipNo));
                }
                var mDataItem = $("#membershipNo").data("kendoExtDropDownList").dataItem($("#membershipNo").data("kendoExtDropDownList").item);
                $("#membershipCardNo").val(dms.string.strNvl(mDataItem.cardNo));
                $("#point").data("kendoExtNumericTextBox").value(Number(mDataItem.lastPointVal));          // 가용포인트
                $("#pointRule").val(Number(mDataItem.pointExchgScale));   // 포인트요율
                $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(Number(mDataItem.MembershipPointUseMaxPoint));     // 최대 상한치
            }

            $("#recvAmt").data("kendoExtNumericTextBox").value(selectedItem.recvAmt);
            $("#recpDt").data("kendoExtMaskedDatePicker").value(selectedItem.recpDt);
            $("#paymentTp").data("kendoExtDropDownList").value(selectedItem.paymentTp);
            $("#payAmt").data("kendoExtNumericTextBox").value(selectedItem.payAmt);
            $("#recpSeq").val(selectedItem.recpSeq);
            $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);
            $("#rctTp").data("kendoExtDropDownList").value(selectedItem.rctTp);
            $("#bankTp").data("kendoExtDropDownList").value(selectedItem.bankTp);
            $("#pointVal").data("kendoExtNumericTextBox").value(selectedItem.pointVal);
            $("#ableAmt").data("kendoExtNumericTextBox").value(selectedItem.ableAmt);

            fn_btnState(selectedItem.paymentTp);
       }
   }

    $("#subGrid").kendoExtGrid({
        gridId :"G-SAL-0121-100101"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/fin/payInfo/selectPayInfoDetailSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        var subParam = {};
                        subParam["sort"] = options.sort;

                        subParam.sDlrCd    = $("#dlrCd").val();
                        subParam.sFinDocNo = $("#finDocNo").val();

                        return kendo.stringify(subParam);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"seq",
                    fields :{
                         dlrCd:{type:"string", editable:false}    //딜러코드
                        ,finDocNo:{type:"string"}                 //문서번호
                        ,seq:{type:"number"}
                        ,colTpNm:{type:"string"}
                        ,rctDt:{type:"date"}
                        ,recpYnNm:{type:"string"}
                        ,recpDt:{type:"date"}
                        ,recpSeq:{type:"string"}
                        ,rctTpNm:{type:"string"}
                        ,bankTpNm:{type:"string"}
                        ,payAmt:{type:"number"}
                        ,payEmpNm:{type:"string"}
                        ,payTpNm:{type:"string"}
                        ,remark:{type:"string"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default :false
       ,appendEmptyColumn:false          //빈컬럼 적용. default :false
       ,enableTooltip :false             //Tooltip 적용, default :false
       ,height:180
       ,editable:false
       ,autoBind:false
       ,pageable:false
       ,columns :[
                  {field:"dlrCd", hidden:true}       // 딜러코드
                  ,{field:"finDocNo", hidden:true}
                  ,{field:"seq", hidden:true}
                  ,{field:"rnum", hidden:true}
                  ,{field:"colTpNm", title:"<spring:message code='sal.lbl.receiveStat' />", attributes:{"class":"ac"}, width:60}  //입출금
                  ,{field:"rctDt", title:"<spring:message code='sal.lbl.rcvRegDt' />", attributes:{"class":"ac"}, width:140, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}       //수납일자
                  ,{field:"recpYnNm", title:"<spring:message code='sal.lbl.recpYnNm' />", attributes:{"class":"ac"}, width:100}    //영수증발행여부
                  ,{field:"recpDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", attributes:{"class":"ac"}, width:140, format:"{0:<dms:configValue code='dateFormat' />}"}   //영수증발행일
                  ,{field:"recpSeq", title:"<spring:message code='sal.lbl.invoiceNo' />", attributes:{"class":"al"}, width:80}     //영수증번호
                  ,{field:"rctTpNm", title:"<spring:message code='sal.lbl.payTp' />", attributes:{"class":"ac"}, width:80}         //지불방식
                  ,{field:"bankTpNm", title:"<spring:message code='sal.lbl.bankTp' />", attributes:{"class":"ac"}, width:80}         //은행정보
                  ,{field:"payAmt", title:"<spring:message code='global.lbl.calcAmt' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}"}     //정산금액
                  ,{field:"payEmpNm", title:"<spring:message code='sal.lbl.payEmpNo' />", attributes:{"class":"ac"}, width:100}    //정산인
                  ,{field:"payTpNm", title:"<spring:message code='sal.lbl.payTpNm' />", attributes:{"class":"ac"}, width:100}      //정산유형
                  ,{field:"remark", title:"<spring:message code='sal.lbl.remark' />", attributes:{"class":"al"}, width:250}        //비고
               ]
    });


});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/

// 초기화
function refreshAll() {

    /* 계약가격정보 */
    $("#cntRealAmt").data("kendoExtNumericTextBox").value(0);             // 발생금액
    $("#cntGoodsAmt").data("kendoExtNumericTextBox").value(0);            // 용품가격
    $("#cntIncAmt").data("kendoExtNumericTextBox").value(0);              // 보험료
    $("#cntFincAmt").data("kendoExtNumericTextBox").value(0);             // 금융
    $("#cntSbstAmt").data("kendoExtNumericTextBox").value(0);             // 중고차
    $("#cntAapAmt").data("kendoExtNumericTextBox").value(0);              // 대행료
    $("#cntDcAmt").val(0);                                             // 할인가격
    $("#cntPointAmt").data("kendoExtNumericTextBox").value(0);            // 포인트금액
    $("#cntReservContAmt").data("kendoExtNumericTextBox").value(0);       // 예판가격
    $("#cntRealPayAmt").data("kendoExtNumericTextBox").value(0);       // 예판가격

    if(dms.string.strNvl(options.jobTp) == "C"){
        $("#contInfo").show();
        $("#payTp").data("kendoExtDropDownList").value("");
        $("#payTp").data("kendoExtDropDownList").enable(true);

    }else{
        $("#contInfo").hide();
        $("#payTp").data("kendoExtDropDownList").value("");
        $("#payTp").data("kendoExtDropDownList").enable(false);
    }

    $("#jobTp").data("kendoExtDropDownList").value("");
    $("#realPayAmt").data("kendoExtNumericTextBox").value(0);
    $("#compDt").data("kendoExtMaskedDatePicker").value("");
    $("#jobContractNo").val("");
    $("#totPayAmt").data("kendoExtNumericTextBox").value(0);
    $("#rctDt").data("kendoExtMaskedDatePicker").value(toDay+" "+toTime);
    $("#custNm").val("");
    $("#custNo").val("");
    $("#vinNo").val("");

    $("#recvAmt").data("kendoExtNumericTextBox").value(0);
    $("#recpDt").data("kendoExtMaskedDatePicker").value("");
    $("#paymentTp").data("kendoExtDropDownList").value("01");      // 미납
    $("#payAmt").data("kendoExtNumericTextBox").value(0);
    $("#recpSeq").val("");
    $("#payTp").data("kendoExtDropDownList").value("");
    $("#rctTp").data("kendoExtDropDownList").value("01");
    rctRayOut("01");
    $("#bankTp").data("kendoExtDropDownList").value("");

    $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(0);
    $("#point").data("kendoExtNumericTextBox").value(0);
    $("#pointRule").val(0);
    $("#pointVal").data("kendoExtNumericTextBox").value(0);
    $("#ableAmt").data("kendoExtNumericTextBox").value(0);
}

// 버튼상태
function fn_btnState(state){
    switch(state){
        case '01':     // 미결
           $("#btnPayPrint").data("kendoButton").enable(false);
           $("#btnPay").data("kendoButton").enable(true);
           //$("#btnPayCancel").data("kendoButton").enable(false);
           $("#btnCancel").data("kendoButton").enable(true);

           fn_readOnlyStat(false);
           break;
        case '02':     // 수납완료
           if($("#jobTp").data("kendoExtDropDownList").value() == "C"){
               $("#btnPayPrint").data("kendoButton").enable(true);
           }else{
               $("#btnPayPrint").data("kendoButton").enable(false);
           }

           $("#btnPay").data("kendoButton").enable(false);
           //$("#btnPayCancel").data("kendoButton").enable(true);
           $("#btnCancel").data("kendoButton").enable(false);

           fn_readOnlyStat(true);
           break;
        default :      // 수납입력
           $("#btnPayPrint").data("kendoButton").enable(false);
           $("#btnPay").data("kendoButton").enable(true);
           //$("#btnPayCancel").data("kendoButton").enable(false);
           $("#btnCancel").data("kendoButton").enable(true);

           fn_readOnlyStat(false);
           break;
    }
}

/** 무결성 검사 **/
function save_Validate(){

    // 수납금액
    var payAmt = Number($("#payAmt").data("kendoExtNumericTextBox").value());
    // 미정산금액
    var recvAmt = Number($("#recvAmt").data("kendoExtNumericTextBox").value());

    if($("#paymentTp").data("kendoExtDropDownList").value() == "01" && recvAmt > 0 && payAmt <= 0  ){
        // 수납금액을 입력하여 주십시오.
        dms.notification.info("<spring:message code='sal.lbl.payAmt' var='salLblPayAmt' /><spring:message code='global.info.validation.required' arguments='${salLblPayAmt}' />");
        $("#payAmt").focus();
        return false;
    }

    if( recvAmt < payAmt ){
        // 미정산금액보다 큰 금액은 수납할 수 없습니다.
        dms.notification.info("<spring:message code='sal.lbl.payAmt' var='salLblPayAmt' /><spring:message code='sal.lbl.recvAmt' var='salLblRecvAmt' /><spring:message code='global.err.chkGreateParam' arguments='${salLblPayAmt},${salLblRecvAmt}' />");
        $("#payAmt").focus();
        return false;
    }

    // 01 : 완성차
    // 02 : 용품
    // 03 : 보험
    // 04 : 대행
    var payTp = dms.string.strNvl($("#payTp").data("kendoExtDropDownList").value());
    if(payTp == "01"
        && Number($("#cntRealAmt").data("kendoExtNumericTextBox").value()) < payAmt
    ){
        //완성차가격 보다 큰 금액은 수납할 수 없습니다.
        dms.notification.info("<spring:message code='sal.lbl.payAmt' var='salLblPayAmt' /><spring:message code='sal.lbl.realCarAmts' var='salLblRealCarAmts' /><spring:message code='global.err.chkGreateParam' arguments='${salLblPayAmt},${salLblRealCarAmts}' />");
        $("#payAmt").focus();
        return false;
    }

    if(payTp == "02"
        && Number($("#cntGoodsAmt").data("kendoExtNumericTextBox").value()) < payAmt
    ){
        //용품가격 보다 큰 금액은 수납할 수 없습니다.
        dms.notification.info("<spring:message code='sal.lbl.payAmt' var='salLblPayAmt' /><spring:message code='sal.lbl.goods' var='salLblGoods' /><spring:message code='global.err.chkGreateParam' arguments='${salLblPayAmt},${salLblGoods}' />");
        $("#payAmt").focus();
        return false;
    }

    if(payTp == "03"
        && Number($("#cntIncAmt").data("kendoExtNumericTextBox").value()) < payAmt
    ){
        //보험가격 보다 큰 금액은 수납할 수 없습니다.
        dms.notification.info("<spring:message code='sal.lbl.payAmt' var='salLblPayAmt' /><spring:message code='global.lbl.insurance' var='globalLblInc' /><spring:message code='global.err.chkGreateParam' arguments='${salLblPayAmt},${globalLblInc}' />");
        $("#payAmt").focus();
        return false;
    }

    if(payTp == "04"
        && Number($("#cntAapAmt").data("kendoExtNumericTextBox").value()) < payAmt
    ){
        //대행가격 보다 큰 금액은 수납할 수 없습니다.
        dms.notification.info("<spring:message code='sal.lbl.payAmt' var='salLblPayAmt' /><spring:message code='global.lbl.execution' var='globalLblExecution' /><spring:message code='global.err.chkGreateParam' arguments='${salLblPayAmt},${globalLblExecution}' />");
        $("#payAmt").focus();
        return false;
    }

    if(!dms.string.isEmpty($("#recpDt").data("kendoExtMaskedDatePicker").value())
        &&  dms.string.isEmpty($("#recpSeq").val())
    ){
        // 영수증번호를 입력해 주세요.
        dms.notification.info("<spring:message code='sal.info.recpSeq' />");
        $("#recpSeq").focus();
        return false;
    }

    if(!dms.string.isEmpty($("#recpSeq").val())
        &&  dms.string.isEmpty($("#recpDt").data("kendoExtMaskedDatePicker").value())
    ){
        // 영수증일자 을(를) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ReceiptPubDt' var='salLblInvoiceDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblInvoiceDt}' />");
        $("#recpSeq").focus();
        return false;
    }

    return true;
}

function rctRayOut(rct){
    switch(rct){
        case '01':      //현금
        case '02':      //pos
        case '03':      //수표
        case '04':      //전신환 송금
        case '05':      //통장
        case '06':      //담보대출
        case '07':      //쿠폰
        case '08':      //에너지절약 보조금
        case '09':      //중고차금액
           $("#recpDt").data("kendoExtMaskedDatePicker").enable(true);
           $("#ableAmt").data("kendoExtNumericTextBox").value(0);
           $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(0);
           $("#point").data("kendoExtNumericTextBox").value(0);
           $("#pointRule").val(0);
           $("#pointVal").data("kendoExtNumericTextBox").value(0);

           $(".cacheY").show();
           $(".pointT").hide();
           $(".custAmtT").hide();
           $(".cacheN01").hide();
           $(".cacheN02").hide();
           $(".cacheN03").hide();
           $("#payAmt").data("kendoExtNumericTextBox").enable(true);
           break;
        case '10':      //포인트
            $("#recpDt").data("kendoExtMaskedDatePicker").value("");
            $("#ableAmt").data("kendoExtNumericTextBox").value(0);
            $("#recpDt").data("kendoExtMaskedDatePicker").value(""); // 영수증일자
            $("#recpSeq").val("");
            $("#bankTp").data("kendoExtDropDownList").value("");

            $(".cacheY").hide();
            $(".custAmtT").hide();
            $(".pointT").show();
            $(".cacheN01").hide();
            $(".cacheN02").hide();
            $(".cacheN03").show();
            break;
        default :
            $(".cacheY").show();
            $(".pointT").hide();
            $(".custAmtT").hide();
            $(".cacheN01").hide();
            $(".cacheN02").hide();
            $(".cacheN03").hide();
            $("#payAmt").data("kendoExtNumericTextBox").enable(true);
           break;
    }
}

// 포인트 사용 계산
function bf_pointVal(){
    var point = Number($("#point").data("kendoExtNumericTextBox").value());    // 가용포인트
    var rate = Number($("#pointRule").val()); // 포인트요율
    var maxPoint = Number($("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value());  // 최대 상한치
    var pointVal = Number($("#pointVal").data("kendoExtNumericTextBox").value());  // 포인트 사용 금액

    var str = "";

    if(maxPoint - pointVal < 0){
        pointVal = maxPoint;
        str = "<spring:message code='sal.info.maxPointChkMsg' />"; //최대상한치를 초과할 수 없습니다.
    }
    if(point - pointVal < 0 || (point==0&&pointVal==0) ){
        pointVal = point;
        str += str.length>0 ? "<br /> <spring:message code='sal.info.usePointChk' />" : "<spring:message code='sal.info.usePointChk' />";      // 사용포인트는 가용포인트를 초과할 수 없습니다.
    }
    if(str.length > 0){
        dms.notification.info(str);
    }

    $("#pointVal").data("kendoExtNumericTextBox").value(pointVal);

    var pointAmt = pointVal / (rate * 100);
    $("#payAmt").data("kendoExtNumericTextBox").value(pointAmt);
}

// 포인트 가용조회
function fnPointsearch(){

    if(dms.string.isEmpty($("#custNo").val())){
        dms.notification.info("<spring:message code='crm.info.noCust'/>");
        return ;
    }

    $.ajax({
        url :"<c:url value='/sal/fin/payInfo/selectPoint.do' />"
        ,data :JSON.stringify({"sCustNo":$("#custNo").val(), "sVinNo":dms.string.strNvl($("#vinNo").val()) })
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
            //console.log(jqXHR);
            if(Number(jqXHR.membershipInfoListCnt) == 1){
                var mList = [];
                mList.push(jqXHR);
                $("#membershipNo").data("kendoExtDropDownList").setDataSource(mList);
                $("#membershipNo").data("kendoExtDropDownList").value(dms.string.strNvl(jqXHR.membershipNo));
                $("#membershipNo").data("kendoExtDropDownList").enable(false);
                $("#membershipCardNo").val(dms.string.strNvl(jqXHR.cardNo));

                $("#point").data("kendoExtNumericTextBox").value(jqXHR.lastPointVal);          // 가용포인트
                $("#pointRule").val(jqXHR.pointExchgScale);   // 포인트요율
                $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(jqXHR.membershipPointUseMaxPoint);     // 최대 상한치
                $("#pointVal").data("kendoExtNumericTextBox").value(0);                        // 사용포인트
            }else if(Number(jqXHR.membershipInfoListCnt) > 1){
                $("#membershipNo").data("kendoExtDropDownList").setDataSource(jqXHR.membershipInfoList);
                var membership = jqXHR.membershipInfoList[0];
                $("#membershipNo").data("kendoExtDropDownList").enable(true);
                $("#membershipNo").data("kendoExtDropDownList").value(dms.string.strNvl(membership.membershipNo));
                $("#membershipCardNo").val(dms.string.strNvl(membership.cardNo));
                $("#point").data("kendoExtNumericTextBox").value(membership.lastPointVal);          // 가용포인트
                $("#pointRule").val(membership.pointExchgScale);   // 포인트요율
                $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(membership.membershipPointUseMaxPoint);     // 최대 상한치
                $("#pointVal").data("kendoExtNumericTextBox").value(0);
            }else{
                $("#membershipNo").data("kendoExtDropDownList").setDataSource([]);
                $("#membershipNo").data("kendoExtDropDownList").value("");
                $("#membershipNo").data("kendoExtDropDownList").enable(false);
                $("#membershipCardNo").val("");
                $("#point").data("kendoExtNumericTextBox").value(0);          // 가용포인트
                $("#pointRule").val(0);   // 포인트요율
                $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").value(0);     // 최대 상한치
                $("#pointVal").data("kendoExtNumericTextBox").value(0);                        // 사용포인트
            }
        }
    });


}

function fnOnfocus(id){
    $("#"+ id +" ").select();
}


function fn_readOnlyStat(state){

    if(state){
        $("#custNm").prop("disabled", true);
        $("#rctDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#recpDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").enable(false);
        $("#ableAmt").data("kendoExtNumericTextBox").enable(false);
        //$("#paymentTp").data("kendoExtDropDownList").enable(false);      // [04.26] 미납, 수납완료 상태를 자동으로 요청. - 에누리 금액 인정안함. [령연 요청]
        $("#payAmt").data("kendoExtNumericTextBox").enable(false);
        $("#recpSeq").prop("disabled", true);
        $("#payTp").data("kendoExtDropDownList").enable(false);
        $("#rctTp").data("kendoExtDropDownList").enable(false);
        $("#bankTp").data("kendoExtDropDownList").enable(false);
        $("#membershipNo").data("kendoExtDropDownList").enable(false);
        $("#remark").prop("disabled", true);
    }else{
        $("#custNm").prop("disabled", false);
        $("#rctDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#recpDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#membershipPointUseMaxPoint").data("kendoExtNumericTextBox").enable(true);
        $("#ableAmt").data("kendoExtNumericTextBox").enable(true);
        //$("#paymentTp").data("kendoExtDropDownList").enable(true);   // [04.26] 미납, 수납완료 상태를 자동으로 요청. - 에누리 금액 인정안함. [령연 요청]
        $("#payAmt").data("kendoExtNumericTextBox").enable(true);
        $("#recpSeq").prop("disabled", false);
        //$("#payTp").data("kendoExtDropDownList").enable(true);
        $("#rctTp").data("kendoExtDropDownList").enable(true);
        $("#bankTp").data("kendoExtDropDownList").enable(true);

        if($("#membershipNo").data("kendoExtDropDownList").dataSource.total() > 1){
            $("#membershipNo").data("kendoExtDropDownList").enable(true);
        }
        $("#remark").prop("disabled", false);
    }
}

</script>
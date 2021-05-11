<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div id="resizableContainer">
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="ser.title.reciveMng" /></h1><!-- 고객조회 --> --%>
            <div class="btn_right">
                <button type="button" class="btn_m" id="receiveEnd" ><spring:message code="ser.btn.receiveEnd" /></button>                        <!--수납완료  -->
            </div>
        </div>
        <form id="receiveForm">
            <input type="hidden" id="membershipNo" name="membershipNo">
            <div class="table_form table_form_info">
                 <table id="receive">
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.rcvDocNo" /></th><!--수납번호  -->
                            <td class="readonly_area">
                                <input type="text" id=rcvDocNo name="rcvDocNo" readonly value="" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.receiveDt" /></th><!--수납완료일자  -->
                            <td class="readonly_area">
                                <input type="text" id="rcvCpltDt" name="rcvCpltDt" class="form_datepicker ac" data-json-obj="true" readonly/>
                            </td>
                        </tr><!-- 20200514 updateby tjx 收款时间不可编辑 -->
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.payTerm" /></th><!--지불기한  -->
                            <td >
                                <input type="text" id="paymPrid" name="paymPrid" value="" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.payMethod" /></span></th><!--지불방식  -->
                            <td>
                                <input type="text" id="paymMthCd" name="paymMthCd" value="" class="form_comboBox" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.arCd" /></th><!--수납금액  -->
                            <td class="readonly_area">
                                <input type="text" id="paymAmt" name="paymAmt" class="form_numeric ar" readonly maxlength="10" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.invoiceDt" /></th><!--영수증일자  -->
                            <td>
                                <input type="text" id="rcptDt" name="rcptDt" class="form_datepicker ac" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.dpstAmt" /></th><!--실수금액  -->
                            <td>
                                <input type="text" id="rcvAmt" name="rcvAmt" class="form_numeric ar" maxlength="10" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.invoiceTp" /></th><!--영수증유형  -->
                            <td>
                                <input type="text" id="rcptTp" name="rcptTp" class="form_comboBox" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.outstdAmt" /></th><!--미수금  -->
                            <td class="readonly_area">
                                <input type="text" id="npayAmt" name="npayAmt" class="form_numeric ar" readonly maxlength="10" data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.invoiceNo" /></th><!--영수증번호  -->
                            <td class="useable">
                                <input type="text" id="rcptNo" name="rcptNo" class="form_input" maxlength="13" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.receiveBigo" /></th><!--수납비고  -->
                            <td colspan="4">
                                <textarea required maxlength="1300" id="rcvRemark" name="rcvRemark" rows="4" cols="" class="form_textarea" data-json-obj="true"></textarea><!-- 수납비고 -->
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table id="refund" style="display:none;">
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.rcvDocNo" /></th><!--수납번호  -->
                            <td class="readonly_area">
                                <input type="text" id="rcvDocNo2" name="rcvDocNo2" readonly value="" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.refdDt" /></th><!--환불확인시간  -->
                            <td>
                                <input type="text" id="refdDt" name="refdDt" class="form_datepicker ac" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.payMethod" /></th><!--지불방식  -->
                            <td class="readonly_area">
                                <input type="text" id="paymMthCd2" name="paymMthCd2" readonly value="" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.refdAmt" /></span></th><!--환불금액  -->
                            <td class="readonly_area">
                                <input type="text" id="refdAmt" name="refdAmt" class="form_numeric ar" readonly maxlength="10" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.dpstAmt" /></th><!--실수금액  -->
                            <td class="readonly_area">
                                <input type="text" id="rcvAmt2" name="rcvAmt2" class="form_numeric ar" maxlength="10" readonly data-json-obj="true"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.outstdAmt" /></th><!--미수금  -->
                            <td class="readonly_area">
                                <input type="text" id="npayAmt2" name="npayAmt2" class="form_numeric ar" readonly maxlength="10" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.receiveDt" /></th><!--수납완료일자  -->
                            <td class="readonly_area">
                                <input type="text" id="rcvCpltDt2" name="rcvCpltDt2" readonly class="form_datepicker ac" data-json-obj="true"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.refdPrsnNm" /></span></th><!--환불담당자  -->
                            <td class="readonly_area">
                                <input required type="text" id="refdPrsnNm" name="refdPrsnNm" class="form_input" value="${loginUsrNm}" maxlength="6" data-json-obj="true" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.refdRemark" /></th><!--환불비고  -->
                            <td colspan="4">
                                <textarea required maxlength="1300" id="refdRemark" name="refdRemark" rows="4" cols="" class="form_textarea" data-json-obj="true"></textarea><!-- 환불비고 -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="cardListDiv">
                <div class="header_area" style="display:none">
                    <div class="btn_right">
                        <button type="button" id="cardPointSet" class="btn_s btn_s_min5"><spring:message code="global.btn.confirm"/></button> <!-- 확인 -->
                        <button type="button" id="cardPointCancel" class="btn_s btn_s_min5"><spring:message code="global.btn.cancel"/></button> <!-- 취소 -->
                    </div>
                </div>
                <div class="paymMthCd04">
                    <div class="table_grid mt10">
                        <!-- 그리드1 -->
                        <div id="cardListGrid" class="grid"></div>
                        <!-- 그리드1 -->
                    </div>
                </div>
                <div class="paymMthCd03" style="display:none">
                    <div class="table_grid mt10" >
                        <!-- 그리드1 -->
                        <div id="custChargeGrid" class="grid" ></div>
                        <!-- 그리드1 -->
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
<script type="text/javascript">


//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });


//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });


//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd});

//카드종류구분 Array
var cardTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${cardTpCdList}">
cardTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//카드종류구분 Map
var cardTpMap = [];
$.each(cardTpList, function(idx, obj){
    cardTpMap[obj.cmmCd] = obj.cmmCdNm;
});

// 영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rcptTpCdMap[val] != undefined)
        returnVal = rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymMthCdMap[val] != undefined)
        returnVal = paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 결제기간
paymPridCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymPridCdArr[val] != undefined)
        returnVal = paymPridCdArr[val].cmmCdNm;
    }
    return returnVal;
};

var resultYn = true;
var parentJsonData = parent.selectReceiveRegPopup.options.content.data;
var parentVal = parentJsonData.selectedVal;

$(document).ready(function(){



    var paymAmt          = Number(dms.string.defaultString(parentVal.paymAmt,'0'));           //최종정산금액(수납금액)
    var rcvAmt           = Number(dms.string.defaultString(parentVal.rcvAmt,'0'));            //실수령금액
    var wonUnitCutAmt    = Number(dms.string.defaultString(parentVal.wonUnitCutAmt,'0'));     //정산절사
    var demicPointCutAmt = Number(dms.string.defaultString(parentVal.demicPointCutAmt,'0'));  //정산제로
    var npayAmt          = Number(dms.string.defaultString(parentVal.npayAmt,'0'));           //미수금액
    var paymMthCd        = parentVal.paymMthCd;
    var vinNo            = parentVal.vinNo;
    var carRegNo         = parentVal.carRegNo;
    var carOwnerId       = parentVal.carOwnerId;
    var calcDocNo        = parentVal.calcDocNo;
    var roDocNo          = parentVal.roDocNo;
    var rcvDocNo         = parentVal.rcvDocNo;
    var rcvSubDocNo      = parentVal.rcvSubDocNo;
    var sysdate          = "${sysDate}";
    var paymTp           = parentVal.paymTp;
    var roTp             = parentVal.roTp;
    var paymCd           = parentVal.paymCd;
    var rcptTp           = parentVal.rcptTp;
    var serParDstinCd    = parentJsonData.serParDstinCd;
    var detailCnt        = parentJsonData.detailCnt;
    var calcAmt          = parentVal.calcAmt;

    // 1.정산절사 , 2.정산제로 , 3.최종 정산금액 순으로
    //var totReceiveAmt = (wonUnitCutAmt > 0 )  ? wonUnitCutAmt :((demicPointCutAmt > 0 ) ? demicPointCutAmt : (paymAmt - rcvAmt) );
    var totReceiveAmt = (paymAmt - rcvAmt);

    var selectedCardNo = "";

    //실수금액확인
    setRcvAmt = function(){

        var tRcvAmt     = $("#rcvAmt").data("kendoExtNumericTextBox").value();  //실수금액
        var tNpayAmt    = $("#npayAmt").data("kendoExtNumericTextBox").value(); //미수금액
        var orgRcvAmt = Number(rcvAmt);                           //부모창의 실수금액
        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();
        var calNpayAmt = (totReceiveAmt - tRcvAmt);

        var msg;
        if( calNpayAmt < 0 || tRcvAmt < 0 ){

            if(paymMthCd == "04"){
                $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);
                msg = "<spring:message code='ser.lbl.occrPointVal' var='occrPointVal' />"+
                      "<spring:message code='global.info.validation.step' arguments='${occrPointVal}' />";
            }else{
                $("#rcvAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);
                msg = "<spring:message code='par.lbl.dpstAmt' var='gisuAmt' />"+
                      "<spring:message code='global.info.validation.step' arguments='${gisuAmt}' />";
            }
            return dms.notification.warning(msg);
        }else{
            $("#npayAmt").data("kendoExtNumericTextBox").value(calNpayAmt);
        }

    };

    //미수금액확인
    setNpayAmt = function(){

        var tRcvAmt     = $("#rcvAmt").data("kendoExtNumericTextBox").value();  //실수금액
        var tNpayAmt    = $("#npayAmt").data("kendoExtNumericTextBox").value(); //미수금액
        var orgRcvAmt = Number(rcvAmt);    //부모창의 실수금액

        var calNpayAmt = (totReceiveAmt - tNpayAmt);


        if( calNpayAmt < 0 || tRcvAmt < 0 ){

            $("#rcvAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);
            return dms.notification.warning("<spring:message code='par.lbl.dpstAmt' var='gisuAmt' />"+
                                            "<spring:message code='global.info.validation.step' arguments='${gisuAmt}' />");
        }else{
            $("#rcvAmt").data("kendoExtNumericTextBox").value(calNpayAmt);
        }

    };

    // 환불 계산
    setRefdAmt = function(){

        var orgRcvAmt  = Number(rcvAmt);    //부모창의 실수금액
        var tRcvAmt     = Number($("#rcvAmt2").data("kendoExtNumericTextBox").value()); //실수금액
        var tNpayAmt    = $("#npayAmt2").data("kendoExtNumericTextBox").value(); //미수금액
        var tRefdAmt    = Number($("#refdAmt").data("kendoExtNumericTextBox").value()); // 환불금액
        var calNpayAmt = (orgRcvAmt - tRefdAmt);

        if( calNpayAmt < 0){

            return dms.notification.warning("<spring:message code='ser.lbl.refdAmt' var='refdAmt' />"+
                                            "<spring:message code='global.info.validation.step' arguments='${refdAmt}' />");
        }
        $("#npayAmt2").data("kendoExtNumericTextBox").value(calNpayAmt);

    };

    setPaymPrid = function(){

        var paymPrid = $("#paymPrid").data("kendoExtDropDownList").value();
        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();
        /**
          2016.12.27 요구사항
                    이후지불인경우
                 1. 정산에서 이후지불선택 or 수납에서 선택시
                 - 실수금액  : 0
                 - 지불방식 , 영수증일자 , 영수증유형 , 번호금액수정 못함
                 - 미수금액  : 수납금액
                 2. 상태값 수납완료
        **/
        var enableYn = true;
        var tPaymAmt,tRcvAmt,tNpayAmt,tPaymMthCd,tRcptDt,tRcptTp;

        if(paymPrid == "02"){//이후지불
            enableYn = false;

            tPaymMthCd = '';
            tRcptDt = '';
            tRcptTp = '';
            tRcvAmt = 0;
            tPaymAmt = totReceiveAmt;

            $("#rcptNo").attr("readonly",true);//영수증번호
            $(".useable").addClass("readonly_area");
        }else{

            if(paymMthCd == "04"){
                tRcvAmt = 0;
                tPaymAmt = totReceiveAmt;
            }else{
                tRcvAmt = totReceiveAmt;
                tPaymAmt = 0;
            }

            tPaymMthCd = paymMthCd == "" ? "01" : paymMthCd;
            tRcptTp = "01";
            tRcptDt = sysdate;

            $(".useable").removeClass("readonly_area");
            $("#rcptNo").attr("readonly",false);//영수증번호
        }


        $("#rcvAmt").data("kendoExtNumericTextBox").value(tRcvAmt);//실수금액
        $("#npayAmt").data("kendoExtNumericTextBox").value(tPaymAmt);//미수금
        $("#paymMthCd").data("kendoExtDropDownList").value(tPaymMthCd);//지불방식
        $("#rcptDt").data("kendoExtMaskedDatePicker").value(tRcptDt);//영수증일자
        $("#rcptNo").val('');
        $("#rcvAmt").data("kendoExtNumericTextBox").enable((tPaymMthCd == "04" && enableYn) ? false : (enableYn) ? true : false);//실수금액

        $("#npayAmt").data("kendoExtNumericTextBox").enable(enableYn);//미수금
        $("#paymMthCd").data("kendoExtDropDownList").enable(enableYn);//지불방식
        $("#rcptDt").data("kendoExtMaskedDatePicker").enable(enableYn);//영수증일자
        $("#rcptTp").data("kendoExtDropDownList").enable(enableYn);//영수증유형
    };


    //실수금액,실수금액2,수납금액,미수금
    $("#rcvAmt,#rcvAmt2,#paymAmt,#npayAmt,#npayAmt2").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,spinners:false
        ,change:setRcvAmt
    });

    //수납완료일자
    $("#rcvCpltDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //수납완료일자
    $("#rcvCpltDt2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //환불금액
    $("#refdAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,spinners:false
        ,change:setRefdAmt
    });

    //영수증일자
    $("#rcptDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#refdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //영수증유형
    $("#rcptTp").kendoExtDropDownList({
        dataSource:rcptTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //수납방식
    $("#paymMthCd").kendoExtDropDownList({
        dataSource:paymMthCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,change:function(e){
            var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();
            if(paymMthCd == "03"){ //고객선수금

                $("#custChargeGrid").data("kendoExtGrid").dataSource.read();
                $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);

                $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);                 //실수령액
                $("#npayAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);       //미수금액
                $("#rcvAmt").data("kendoExtNumericTextBox").enable(false);

                $(".paymMthCd03").attr("style","display:inline");
                $(".paymMthCd04").attr("style","display:none");

            }else if(paymMthCd == "04"){//회원선수금
                getDlrCardPoint();
                $("#custChargeGrid").data("kendoExtGrid").dataSource.data([]);

                $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);                 //실수령액
                $("#npayAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);       //미수금액
                $("#rcvAmt").data("kendoExtNumericTextBox").enable(false);

                $(".paymMthCd03").attr("style","display:none");
                $(".paymMthCd04").attr("style","display:inline");

            } else {
                $("#rcvAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);        //실수령액
                $("#npayAmt").data("kendoExtNumericTextBox").value(0.00);                //미수금액
                $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);
                $("#custChargeGrid").data("kendoExtGrid").dataSource.data([]);
                $("#rcvAmt").data("kendoExtNumericTextBox").enable(true);

                $(".paymMthCd03").attr("style","display:none");
                $(".paymMthCd04").attr("style","display:inline");
            }
        }
    });


    //지불방식
    $("#paymMthCd2").kendoExtDropDownList({
        dataSource:paymMthCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //지불기한
    $("#paymPrid").kendoExtDropDownList({
        dataSource:paymPridCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,change : setPaymPrid
        ,index:0
    });

    // 카드포인트 적용
    $("#cardPointSet").kendoButton({
        click:function(e) {
            var grid = $("#cardListGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if(rowData != null){
                $("#rcvAmt").data("kendoExtNumericTextBox").value(rowData.occrPointVal);
                setRcvAmt();
            }
        }
    });

    // 카드포인트 취소
    $("#cardPointCancel").kendoButton({
        click:function(e) {
            var grid = $("#cardListGrid").data("kendoExtGrid");
            var cardListData = grid.dataSource.data();

            $.each(cardListData, function(i,v){
                this.occrPointVal = 0;
            });
            grid.refresh();
            $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);
            setRcvAmt();
        }
    });

    // 충전카드내역
    $("#cardListGrid").kendoExtGrid({
        dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/crm/dmm/membership/selectRechargeCardList.do' />"
               }
                ,parameterMap:function(options, operation) {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sMembershipNo"] = $("#membershipNo").val();

                        return kendo.stringify(params);
                }
           }
           ,schema:{
               model:{
                   id:"membershipNo"
                   ,fields:{
                       dlrCd:{type:"string"}
                       ,membershipNo:{type:"string", editable:false}
                       ,cardTpCd:{type:"string", editable:false}
                       ,cardNo:{type:"string", editable:false}
                       ,realTotAmt:{type:"number", editable:false}
                       ,usrNm:{type:"string", editable:false}
                       ,occrPointVal:{type:"number"}
                       ,regDt:{type:"date", editable:false}
                   }
               }
           }
       }
       ,height:140
       ,filterable:false
       ,pageable:false
       ,autoBind:false
       ,selectable:"single"
       ,sortable:false
       ,columns:[
            {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", attributes:{"class":"ac"},hidden:true} //딜러코드
           ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", attributes:{"class":"ac"},hidden:true} //멤버십 일련번호
           ,{field:"chrTp", title:"<spring:message code='ser.lbl.prepaidTp'/>", width:110
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").text();
                   var spanObj = "<div'>"+paymMthCd+"</div>";
                   return spanObj;
               }

           } //선수금유형
           ,{field:"cardNo", title:"<spring:message code='ser.lbl.prepaidNo'/>", width:110, attributes:{"class":"al"}}//카드번호
           ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>",hidden:true//카드종류
               ,attributes:{"class":"ac"}
               ,width:100
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardTpList
                   });
                }
               ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
           }// 카드종류
           ,{field:"regDt", title:"<spring:message code='crm.lbl.issueDate'/>", width:100, attributes:{"class":"ac"}, hidden:true
               ,format:"{0:<dms:configValue code='dateFormat' />}"
           }//발급일
           ,{field:"realTotAmt", title:"<spring:message code='ser.lbl.solubePrepaid'/>", width:80, attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0.00
           }//가용금액
           ,{field:"occrPointVal", title:"<spring:message code='ser.lbl.usePrepaid'/>", width:110, attributes:{"class":"ar"}
               ,editor:function(container, options){
               $('<input id="occrPointVal" data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtNumericTextBox({
                       min:0
                       ,decimal:0.00
                       ,format:"{0:n2}"
                       ,spinners:false
                       ,change:function(){
                           var maxAmt = Number(options.model.realTotAmt);
                           if(options.model.occrPointVal > options.model.realTotAmt){
                               options.model.occrPointVal = options.model.realTotAmt;
                           }
                           if(options.model.occrPointVal > paymAmt){
                               options.model.occrPointVal = paymAmt;
                           }

                           selectedCardNo = options.model.cardNo;
                           var grid = $("#cardListGrid").data("kendoExtGrid");
                           var rowData = grid.dataItem(grid.select());
                           $.each(grid.dataSource.data() , function(idx , obj){
                               if(obj.cardNo != selectedCardNo){
                                    obj.set("occrPointVal","");
                                }
                            });
                           grid.refresh();
                           grid.select("tr:eq("+eval(Number(rowData.rnum)-1)+")");

                           $("#rcvAmt").data("kendoExtNumericTextBox").value(options.model.occrPointVal);
                           setRcvAmt();
                        }
                   });
               }
           }
       ]
    });

    // 회원선수금
    $("#custChargeGrid").kendoExtGrid({
        dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/rcv/serviceReceive/selectCustChargeMst.do' />"
               }
                ,parameterMap:function(options, operation) {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCustNo"] = paymCd;

                        return kendo.stringify(params);
                }
           }
           ,schema:{
               model:{
                   id:"custNo"
                   ,fields:{
                        dlrCd:{type:"string"}
                       ,ableAmt:{type:"number", editable:false}
                       ,totChrAmt:{type:"number", editable:false}
                       ,occrAmtVal:{type:"number"}
                   }
               }
           }
       }
       ,height:140
       ,filterable:false
       ,pageable:false
       ,autoBind:false
       ,selectable:"single"
       ,sortable:false
       ,columns:[
            {field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", attributes:{"class":"ac"},hidden:true} //딜러코드
           ,{field:"chrTp", title:"<spring:message code='ser.lbl.prepaidTp'/>", width:110
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").text();
                   var spanObj = "<div'>"+paymMthCd+"</div>";
                   return spanObj;
               }

           } //선수금유형
           ,{field:"custNo", title:"<spring:message code='ser.lbl.prepaidNo'/>", width:110, attributes:{"class":"al"}}//고객번호
           ,{field:"ableAmt", title:"<spring:message code='ser.lbl.solubePrepaid'/>", width:110
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0.00
           }//가용금액
           ,{field:"totChrAmt", title:"<spring:message code='global.lbl.cardNo'/>", width:110, hidden:true
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0.00
           }//총충전금액
           ,{field:"totUseAmt", title:"<spring:message code='global.lbl.cardTpCd'/>", width:110, hidden:true
               ,attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0.00
           } //사용금액
           ,{field:"occrAmtVal", title:"<spring:message code='ser.lbl.usePrepaid'/>", width:110, attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0.00
               ,editor:function(container, options){
               $('<input id="occrAmtVal" data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtNumericTextBox({
                       min:0
                       ,decimal:0.00
                       ,format:"{0:n2}"
                       ,spinners:false
                   }).bind("keyup", function(){
                       var that = $(this).data("kendoExtNumericTextBox");
                       that.max = options.model.ableAmt;
                       if(this.value > that.max){
                           this.value = that.max;
                       }
                       if(this.value > totReceiveAmt){
                           this.value = totReceiveAmt;
                       }
                       $("#rcvAmt").data("kendoExtNumericTextBox").value(this.value);
                       setRcvAmt();
                   });
               }
           }
       ]
    });

    //버튼설정
    setLayoutEnable = function (layoutStat){

        //레이어 세팅
        switch(layoutStat){

            case "F" :

                $("#receive").show();         //수납 레이아웃
                $("#refund").hide();          //환급 레이아웃

                $("#receiveEnd").show();      //수납완료 버튼
                $("#receiveConfirm").show();  //미수확인 버튼
                break;

            case "R" :

                $("#receive").hide();         //수납 레이아웃
                $("#refund").show();          //환급 레이아웃

                $("#receiveEnd").hide();      //수납완료 버튼
                $("#receiveConfirm").hide();  //미수확인 버튼
                 break;
            default :
                $("#receive").show();        //수납 레이아웃
                $("#refund").hide();         //환급 레이아웃

                $("#receiveEnd").show();     //수납완료 버튼
                $("#receiveConfirm").show(); //미수확인 버튼
              break;

        }
    };

    setValidation = function(stat){

        var paymPrid = $("#paymPrid").data("kendoExtDropDownList").value(); // 지불기한이 이후 지불은 수납금액이 0일경우 저장가능
        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value(); // 지불기한이 이후 지불은 수납금액이 0일경우 저장가능
        if(paymPrid == "01"){
            if(Number($("#paymAmt").val()) > 0){
                if( (paymMthCd == "03" || paymMthCd == "04" ) && Number($("#rcvAmt").val()) == 0  ){
                    dms.notification.info("<spring:message code='par.lbl.dpstAmt' var='gisuAmt' /><spring:message code='global.info.required.field' arguments='${gisuAmt}' />");

                    resultYn = false;
                    return;
                }
                if( parentVal.roTp != "02"  && Number($("#rcvAmt").val()) == 0  ){
                    dms.notification.info("<spring:message code='par.lbl.dpstAmt' var='gisuAmt' /><spring:message code='global.info.required.field' arguments='${gisuAmt}' />");

                    resultYn = false;
                    return;
                }
                if( dms.string.isEmpty($("#rcptDt").val())){
                    dms.notification.info("<spring:message code='ser.lbl.invoiceDt' var='invoiceDt' /><spring:message code='global.info.validation.required' arguments='${invoiceDt}' />");

                    resultYn = false;
                    return;
                }
            }
        }

        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();
        // 수납방식이 회원선수금인경우
        if(paymMthCd == "04"){
            var grid = $("#cardListGrid").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());

            if( rowData != null ){
                if(rowData.cardNo != selectedCardNo){
                    dms.notification.info("<spring:message code='ser.lbl.thisUse' var='thisUse' /><spring:message code='ser.lbl.prepaidNo' var='cardNo' /><spring:message code='global.info.chkselect' arguments='${thisUse}, ${cardNo}' />");
                    resultYn = false;
                    return;
                }
            }else{
                dms.notification.info("<spring:message code='global.info.unselected' />");
                resultYn = false;
                return;
            }
        }

        return resultYn;
    };


    //JSON DATA Setting
    setJsonDataSet = function(statCd){

        var cardPointUseParam = {};
        var dlrPointAccuParam = {};
        var custPointUseParam = {};

        var paymPrid = $("#paymPrid").data("kendoExtDropDownList").value();
        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();

        var jsonData = {
            "rcvDocNo"    :rcvDocNo
            ,"roDocNo"    :roDocNo
            ,"calcDocNo"  :calcDocNo
            ,"rcvSubDocNo":rcvSubDocNo
            ,"rcvStatCd"  :statCd
            ,"rcvAmt"     :$("#rcvAmt").data("kendoExtNumericTextBox").value()
            ,"rcvCpltDt"  :$("#rcvCpltDt").data("kendoExtMaskedDatePicker").value()
            ,"npayAmt"    :$("#npayAmt").data("kendoExtNumericTextBox").value()
            ,"rcptTp"     :$("#rcptTp").val()
            ,"rcptNo"     :$("#rcptNo").val()
            ,"rcptDt"     :$("#rcptDt").data("kendoExtMaskedDatePicker").value()
            ,"rcvRemark"  :$("#rcvRemark").val()
            ,"paymMthCd"  :$("#paymMthCd").data("kendoExtDropDownList").value()
            ,"paymPrid"   :paymPrid
            ,"paymTp"     :paymTp
            ,"paymYn"     :"N"
            ,"serParDstinCd" : serParDstinCd
            ,"calcAmt"    :calcAmt
        };

        // 딜러포인트 적립
        if(paymPrid == "01" && paymTp == "04") {
            var srcSub3;

            if(serParDstinCd == "SER"){
                if(roTp == "01") {
                    srcSub3 = "GNL_RTE_RATE";
                } else if(roTp == "02") {
                    srcSub3 = "WART_RTE_RATE";
                } else if(roTp == "03") {
                    srcSub3 = "INC_RTE_RATE";
                }
            } else {
                srcSub3 = "REV_PARTS_RATE";
            }

            dlrPointAccuParam = {
                membershipNo:$("#membershipNo").val()
                ,custNo:paymCd
                ,vinNo:vinNo
                ,occrPointVal:$("#rcvAmt").data("kendoExtNumericTextBox").value()
                ,roDocNo:roDocNo
                ,srcSub1:rcvDocNo
                ,srcSub2:detailCnt
                ,srcSub3:srcSub3
            };
        }

        // 딜러선불금 카드사용
        var grid = $("#cardListGrid").data("kendoExtGrid");
        var rowData = grid.dataItem(grid.select());

        var useTp = "03";
        if(serParDstinCd == "PAR"){
            useTp = "04";
        }

        if(rowData != null){
            cardPointUseParam = {
                membershipNo:rowData.membershipNo
                ,cardNo:rowData.cardNo
                ,cardTpCd:"02"
                ,occrPointVal:rowData.occrPointVal
                ,extcTargYn:"Y"     //소멸대상여부
                ,roDocNo:roDocNo
                ,srcSub1:rcvDocNo
                ,srcSub2:detailCnt
                ,srcSub3:srcSub3
            };
        }


        // 고객선수금 사용
        if(paymTp == "04" && paymMthCd == "03"){ //고객선수금

            var grid = $("#custChargeGrid").data("kendoExtGrid");
            var gridData = grid.dataItem(grid.select());
            if(gridData != null){
                var useTp = "03";
                if(serParDstinCd == "PAR"){
                    useTp = "04";
                }

                custPointUseParam = {
                        custNo     :paymCd
                       ,sourTp     :"02"
                       ,chrTp      :"-"
                       ,paymMthCd  :paymMthCd
                       ,paymAmt    :gridData.occrAmtVal
                       ,rcptTp     :$("#rcptTp").val()
                       ,rcptNo     :$("#rcptNo").val()
                       ,rcptDt     :$("#rcptDt").data("kendoExtMaskedDatePicker").value()
                       ,vinNo      :vinNo
                       ,carRegNo   :carRegNo
                       ,refKeyNo   :rcvDocNo
                       ,refTableNm :"SE_0560T"
                       ,useTp      :useTp
                       ,useNum     :roDocNo
                 };
            }
        }

        var param = $.extend(
            {"serviceReceiveDetailVO":jsonData}
            ,{"cardPointHisVO":cardPointUseParam}
            ,{"dlrPointAccuVO":dlrPointAccuParam}
            ,{"custChargeHistVO":custPointUseParam}
        );

        return param;
    };

    setReceiveData = function(statCd){

        $("#rcvDocNo").val(rcvDocNo);                                               //수납번호
        $("#paymMthCd").data("kendoExtDropDownList").value(paymMthCd);                 //지불방식
        $("#rcptTp").data("kendoExtDropDownList").value(rcptTp);                       //영수증유형
        $("#paymPrid").data("kendoExtDropDownList").value("01");                       //지불기한
        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();

        if(paymMthCd == "04"){ //선수금
            $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);                   //실수령액
            $("#npayAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);         //미수금
        } else {
            $("#rcvAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);          //실수령액
            $("#npayAmt").data("kendoExtNumericTextBox").value(0);                     //미수금
        }
        $("#paymAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);             //정산금액
        $("#rcvCpltDt").data("kendoExtMaskedDatePicker").value(sysdate);            //수납완료 일자
        $("#rcptDt").data("kendoExtMaskedDatePicker").value(sysdate);               //영수증 일자
    };

    //버튼 - 수납확정
    updateReceive = function (stat) {

        if(!setValidation(stat)) return;

        $.ajax({
            url:"<c:url value='/ser/rcv/serviceReceive/multiServiceReceiveDetail.do' />",
            data:JSON.stringify(setJsonDataSet(stat)),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                var data = {"closeYn":"Y"};
                parentJsonData.callbackFunc(data);
                parent.selectReceiveRegPopup.close();
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
                if(${isTablet}){
                    parent.$("#detailGrid").hide();
                    parent.$("#detailGrid").show();
                }
            }
        });
        return resultYn;
    };

    //수납완료
    $("#receiveEnd").kendoButton({
        click:function(e){

            var npayAmt = $("#npayAmt").data("kendoExtNumericTextBox").value();
            var paymPrid = $("#paymPrid").data("kendoExtDropDownList").value();

            var statCd = (npayAmt > 0 ) ? (paymPrid == "02") ? "F" : "02" : "F";
            resultYn = true;
            updateReceive(statCd);
        }
        ,enable:true
    });

    //레이아웃 세팅
    setLayoutEnable(parentJsonData.btnStat);
    setReceiveData(parentJsonData.btnStat);

    getDlrCardPoint = function(){

        if(dms.string.isNotEmpty(paymCd)){
            $.ajax({
                url:"<c:url value='/ser/cmm/vehOfCustInfo/selectDealerMemberShipInfo.do' />"
                ,data:JSON.stringify({sCustNo:paymCd, sVinNo:vinNo})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    if(dms.string.strNvl(result.membershipNo) != ""){
                        $("#membershipNo").val(result.membershipNo);
                        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();
                        var paymPrid = $("#paymPrid").data("kendoExtDropDownList").value();

                        if(paymPrid == "01" && paymMthCd == "04"){
                            $("#cardListGrid").data("kendoExtGrid").dataSource.read();
                        }
                    }
                }
            });
        }

    };

    if(parentJsonData.btnStat == "F"){
        getDlrCardPoint();
        setPaymPrid();
    } else {
        $("#cardListDiv").hide();
    }


    setInit = function(){

        var paymMthCd = $("#paymMthCd").data("kendoExtDropDownList").value();

        if(paymTp == "04" && paymMthCd == "03"){ //고객선수금

            $("#custChargeGrid").data("kendoExtGrid").dataSource.read();
            $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);

            $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);                 //실수령액
            $("#npayAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);       //미수금액
            $("#rcvAmt").data("kendoExtNumericTextBox").enable(false);

            $(".paymMthCd03").attr("style","display:inline");
            $(".paymMthCd04").attr("style","display:none");

        }else if(paymMthCd == "04"){//회원선수금
            getDlrCardPoint();
            $("#custChargeGrid").data("kendoExtGrid").dataSource.data([]);

            $("#rcvAmt").data("kendoExtNumericTextBox").value(0.00);                 //실수령액
            $("#npayAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);       //미수금액
            $("#rcvAmt").data("kendoExtNumericTextBox").enable(false);

            $(".paymMthCd03").attr("style","display:none");
            $(".paymMthCd04").attr("style","display:inline");

        } else {
            $("#rcvAmt").data("kendoExtNumericTextBox").value(totReceiveAmt);        //실수령액
            $("#npayAmt").data("kendoExtNumericTextBox").value(0.00);                //미수금액
            $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);
            $("#custChargeGrid").data("kendoExtGrid").dataSource.data([]);
            $("#rcvAmt").data("kendoExtNumericTextBox").enable(true);

            $(".paymMthCd03").attr("style","display:none");
            $(".paymMthCd04").attr("style","display:inline");
        }
    };
    setInit();
});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 중고차평가관리 -->
<section  class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.usedCarEvalMng" /></h1><!-- 중고차평가관리 -->
        <div class="btn_right">
            <button class="btn_m " id="btnRequestEval"><spring:message code="sal.lbl.evalFinish" /></button><!-- 평가완료 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_tempSave" id="btnSave"><spring:message code="global.btn.tempSave" /></button><!-- 임시저장 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->


    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.documentNo' /></th><!-- 매입번호 -->
                    <td>
                        <input id="sPurcNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sPurcCustNo" type="text" class="form_input">
                                    <a href="javascript:selectBpPopupWindow('S');"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sPurcCustNm" type="text" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th><!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPurcRegStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPurcRegEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->


<div id="viewPurcEval">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.title.defaultInfo' /><!-- 기본정보 --></h2>
    </div>
    <div class="table_form" >
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:21%;">
                <col style="width:8%;">
                <col style="width:21%;">
                <col style="width:8%;">
                <col style="width:13%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.documentNo' /><!-- 매입번호 --></th>
                    <td>
                        <input id="dlrCd" name="dlrCd" type="hidden"  data-bind="value:dlrCd" data-json-obj="true">
                        <input id="purcNo" name="purcNo" type="text" class="form_input form_readonly" readonly data-bind="value:purcNo" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.statNm' /><!-- 상태 --></th>
                    <td>
                        <input id="purcStatCd" name="purcStatCd" class="form_comboBox form_disabled" disabled  data-bind="value:purcStatCd" >
                    </td>
                    <th scope="row"><spring:message code='par.lbl.custNm' /><!-- 고객명 --></th>
                    <td>
                        <input id="purcCustNm" name="purcCustNm" class="form_input form_readonly" readonly  data-bind="value:purcCustNm" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.prsNm' /></th><!-- 담당자 -->
                    <td>
                        <input class="form_input form_readonly" readonly >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.newCarContractNo' /></th><!-- 신차계약번호 -->
                    <td >
                        <input id="contractNo" name="contractNo" class="form_input form_readonly" readonly  data-bind="value:contractNo" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.newCarContractNo' /></th><!-- 신차계약 -->
                    <td >
                       <div class="form_float">
                            <div class="form_right">
                                <ul class="tabmenu" >
                                    <li class="on"><button type="button"><spring:message code='sal.lbl.link' /></button></li><!-- 연결 -->
                                    <li><button type="button"><spring:message code='sal.lbl.unLink' /></button></li><!-- 미연결 -->
                                </ul>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>



    <div class="header_area">
    <h2 class="title_basic"><spring:message code='ser.title.carInfo' /><!-- 차량정보 --></h2>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:21%;">
                <col style="width:8%;">
                <col style="width:21%;">
                <col style="width:8%;">
                <col style="width:13%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.factory' /><!-- 제조사 --> </th>
                    <td>
                       <div class="form_float">
                             <div class="form_left" style="width:38%">
                                <input id="carBrandCd" class="form_comboBox form_disabled" disabled data-bind="value:carBrandCd">
                            </div>
                             <div class="form_right" style="width:62%">
                                <ul class="tabmenu" >
                                    <li id="btnThis" class="on"><button type="button" onclick="btnClick('01');"><spring:message code='sal.lbl.thisCompany' /></button></li><!-- 본사 -->
                                    <li id="btnOther" ><button type="button" onclick="btnClick('02');"><spring:message code='sal.lbl.otherCompany' /></button></li><!-- 기타회사 -->
                                </ul>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.licensePltSaleYn' /><!-- 번호판여부 --></th>
                    <td>
                        <input id="noSaleYn" name="noSaleYn" type="checkbox" class="form_check form_readonly" readonly data-bind="value:noSaleYn">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                    <td>
                        <input id="carlineNm" name="carlineNm" class="form_input form_readonly" readonly data-bind="value:carlineNm" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 번호판번호 --></th>
                    <td>
                        <input id="platNo" name="platNo" type="text" class="form_input form_readonly" readonly data-bind="value:platNo">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.madeYyMm' /><!-- 제조년월 --></th>
                    <td>
                        <input id="manufactYyMmDt" name="manufactYyMmDt" type="text" class="form_input form_readonly" readonly data-bind="value:manufactYyMmDt" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.purcTotAmt' /><!-- 최종가격 --></th>
                    <td>
                        <input id="purcTotAmt" name="purcTotAmt" type="number" class="form_numeric ar form_readonly" readonly data-bind="value:purcTotAmt" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.vinNo" /></th><!-- VIN NO -->
                    <td>
                        <input id="vinNo" nmae="vinNo" type="text" class="form_input form_readonly" readonly data-bind="value:vinNo">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /><!-- 모델 --></th>
                    <td>
                        <input id="modelNm" name="modelNm" class="form_input form_readonly" readonly data-bind="value:modelNm">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                    <td>
                        <input id="extColorNm" name="extColorNm" class="form_input form_readonly" readonly data-bind="value:extColorNm">
                    </td>
                    <td></td>
                <tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carDrvMth' /><!-- 구동방식 --></th>
                    <td>
                        <input  id="drvMthCd" name="drvMthCd" class="form_comboBox form_disabled" disabled data-bind="value:drvMthCd" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.purposeOfUse' /><!-- 사용용도 --></th>
                    <td>
                        <input id="pcDstinCd" name="pcDstinCd" class="form_comboBox form_disabled" disabled data-bind="value:pcDstinCd" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fuelType' /><!-- 연료구분 --></th>
                    <td>
                        <input id="fuelCd" name="fuelCd" class="form_comboBox form_disabled" disabled data-bind="value:fuelCd" >
                    </td>
                <tr>
            </tbody>
        </table>
    </div>

    <form id="detailForm" name="detailForm" method="POST" action="/">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.evaluationInfo' /><!-- 평가정보 --></h2>
    </div>
    <div class="table_form">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.evaluationWay' /></th><!-- 평가방법 -->
                    <td>
                        <ul class="tabmenu" disabled>
                            <li id="btnSelf" class="on" ><button type="button" onclick="fnPurcWayClick('A');"><spring:message code='global.lbl.ourCompany' /></button></li><!-- 본인 -->
                            <li id="btnProxy" ><button type="button" onclick="fnPurcWayClick('M');"><spring:message code='global.lbl.execution' /></button></li><!-- 대행 -->
                        </ul>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.evaluationPerson' /><!-- 평가담당자 --></th>
                    <td>
                        <input id="evalPrsnNm" name="evalPrsnNm" type="text" class="form_input" data-bind="value:evalPrsnNm" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.evalScheDt' /><!-- 평가일자 --></th>
                    <td>
                        <input id="evalDt" name="evalDt" class="form_datepicker" data-bind="value:evalDt" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.evaluationRemark' /><!-- 평가의견 --></th>
                    <td colspan="5">
                        <input id="evalRemark" name="evalRemark" type="text" class="form_input" data-bind="value:evalRemark" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /><!-- 차량상태 --></th>
                    <td>
                        <input id="carStatCd" name="carStatCd" class="form_comboBox" data-bind="value:carStatCd" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.custHopeAmt' /><!-- 고객희망가격 --></th>
                    <td>
                        <input id="custHopeAmt" name="custHopeAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:custHopeAmt" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.custHopeAmt' /><!-- 평가가격 --></th>
                    <td>
                        <input id="evalAmt" name="evalAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:evalAmt" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.lastAmt' /><!-- 최종판매가격 --></th>
                    <td>
                        <input id="lastAmt" name="lastAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:lastAmt" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carRegEvalAmt' /><!-- 번호판평가가격 --></th>
                    <td>
                        <input id="carRegAmt" name="carRegAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:carRegAmt" data-json-obj="true">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</form>
</div>


    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.auctInfo' /></h2><!-- 경매정보 -->
        <div class="btn_right">
            <button class="btn_s btn_save" id="btnAuctSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
            <button class="btn_s btn_add" id="btnAuctAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
            <button class="btn_s btn_delete" id="btnAutcDel"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
            <button class="btn_s btn_cancel" id="btnAutcCancel"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
        </div>
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="auctGrid"></div>
    </div>
    <!-- 그리드 종료 -->


</section>
<!-- //수선시스템 - 차량정보 -->

<!-- script -->
<script type="text/javascript">
var toDay = "${toDay}";   // 해당일

//중고차매입상태 Array
var purcStatCdDs = [];
<c:forEach var="obj" items="${purcStatCdList}">
    purcStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var purcStatCdMap = dms.data.arrayToMap(purcStatCdDs, function(obj){ return obj.cmmCd; });


//사용용도(승/상용구분) Array
var pcDstinCdDs = [];
<c:forEach var="obj" items="${pcDstinCdList}">
    pcDstinCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//사용용도(승/상용구분) Map
var pcDstinCdMap = dms.data.arrayToMap(pcDstinCdDs, function(obj){ return obj.cmmCd; });


//연료구분 Array
var fuelCdDs = [];
<c:forEach var="obj" items="${fuelCdList}">
    fuelCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//연료구분 Map
var fuelCdMap = dms.data.arrayToMap(fuelCdDs, function(obj){ return obj.cmmCd; });


//구동방식 Array
var drvMthCdDs = [];
<c:forEach var="obj" items="${drvMthCdList}">
    drvMthCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//구동방식 Map
var drvMthCdMap = dms.data.arrayToMap(drvMthCdDs, function(obj){ return obj.cmmCd; });


//차량상태코드 Array
var carStatCdDs = [];
<c:forEach var="obj" items="${carStatCdList}">
    carStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량상태코드 Map
var carStatCdMap = dms.data.arrayToMap(carStatCdDs, function(obj){ return obj.cmmCd; });



//경매구분 Array
var auctCdDs = [];
<c:forEach var="obj" items="${auctCdList}">
    auctCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var auctCdMap = dms.data.arrayToMap(auctCdDs, function(obj){ return obj.cmmCd; });


//차량인도여부 Array
var carDlYnDs = [];
<c:forEach var="obj" items="${carDlYnList}">
    carDlYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량인도여부 Map
var carDlYnMap = dms.data.arrayToMap(carDlYnDs, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    //등록일자 - 시작일
    var sStartDtPicker = $("#sPurcRegStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");


    //등록일자 - 종료일
    var sEndDtPicker = $("#sPurcRegEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sPurcRegStartDt").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");



    /**************************************** 검색조건 END **********************************************************/




    //중고차매입상태
    $("#purcStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcStatCdDs
        ,optionLabel:" "  // 전체
    });

    //사용용도(승/상용구분)
    $("#pcDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pcDstinCdDs
        ,optionLabel:" "  // 전체
    });

    //연료구분
    $("#fuelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:fuelCdDs
        ,optionLabel:" "  // 전체
    });

    //구동방식
    $("#drvMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:drvMthCdDs
        ,optionLabel:" "  // 전체
    });

    //차량상태
    $("#carStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatCdDs
        ,optionLabel:" "  // 전체
    });



    //제조사
    $("#carBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:""
        ,optionLabel:" "  // 전체
    });



    /***** 매입총금액 *****/
    $("#purcTotAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });




    /***** 고객희망가격 *****/
    $("#custHopeAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    /***** 평가가격 *****/
    $("#evalAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    /***** 최종판매가격 *****/
    $("#lastAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    /***** 번호판평가가격 *****/
    $("#carRegAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });





    //평가일자
    $("#evalDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });



    /**************************************** 상세내역 END **********************************************************/




    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            fnReset();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });



    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {


            var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
            param.dlrCd = $("#dlrCd").val();
            param.purcNo = $("#purcNo").val();
            param.evalDt = $("#evalDt").data("kendoExtMaskedDatePicker").value();
            param.stat = "E";
            param.purcStatCd = "02";
            param.gubun = "U";



            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    fnReset();
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });



    // 평가완료
    $("#btnRequestEval").kendoButton({
        click:function(e) {
            var saveData = {
                    dlrCd:$("#dlrCd").val()
                    ,purcNo    :$("#purcNo").val()
                    ,purcStatCd:"03"
                    ,stat      :"P"
                    ,gubun     :"U"
            };

            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                    $("#grid").data("kendoExtGrid").dataSource.read();
                }
            });

        }
    });



    //경매이력그리드 - 추가
    $("#btnAuctAdd").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 매입정보(을)를 선택하여 주세요.
                dms.notification.warning("<spring:message code='global.lbl.docNo' var='documentNo' /><spring:message code='global.info.check.field' arguments='${documentNo}' />");
                return false;
            }else {
                $('#auctGrid').data('kendoExtGrid').dataSource.insert(0, {
                     "dlrCd":$("#dlrCd").val()
                    ,"purcNo":$("#purcNo").val()
                    ,"seq":""
                    ,"auctCd":"01"
                    ,"auctAmt":0
                    ,"carDlYn":"N"
                    ,"remark":""
                });
            }
        }
    });



    //경매이력그리드  - 삭제
    $("#btnAutcDel").kendoButton({
        click:function(e) {
            var grid = $("#auctGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });


    //경매이력그리드 - 취소
    $("#btnAutcCancel").kendoButton({
        click:function(e) {
            $('#auctGrid').data('kendoExtGrid').cancelChanges();
        }
    });



    //경매이력그리드  - 저장
    $("#btnAuctSave").kendoButton({
        click:function(e) {

            var grid = $("#auctGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/usc/purcEval/multiSaveAuctInfo.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                    }
                    ,success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#auctGrid").data("kendoExtGrid").dataSource.read();
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");

            }

        }
    });

    /**************************************** 버튼영역 END **********************************************************/


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115603"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/usc/purcEval/selectPurcMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPurcNo"] = $("#sPurcNo").val();      // 프로모션 유형
                        params["sPurcCustNo"] = $("#sPurcCustNo").val();          // 승인여부
                        params["sPurcRegStartDt"] = $("#sPurcRegStartDt").data('kendoExtMaskedDatePicker').value();              // 프로모션기간-시작일
                        params["sPurcRegEndDt"] = $("#sPurcRegEndDt").data('kendoExtMaskedDatePicker').value();                  // 프로모션기간-종료일


                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"purcNo"
                    ,fields:{
                        purcNo      :{type:"string"}
                        ,purcCustNm :{type:"string"}
                        ,purcStatCd :{type:"string"}
                    }
                }
            }
        }
        ,height:173
        ,pageable:false
        ,editable:false
        ,autoBind:false
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var purcNo = selectedVal.purcNo;


                $.ajax({
                    url:"<c:url value='/sal/usc/purcEval/selectPurcEval.do' />",
                    data:JSON.stringify({sPurcNo:purcNo}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {

                    $('#auctGrid').data('kendoExtGrid').dataSource.page(1);

                    var purcEvalDs = result["purcEvalDs"];

                    kendo.bind($("#viewPurcEval"), purcEvalDs);


                    //자사차량구분
                    if(selectedVal.corpCarDstinCd == '01'){//자사
                        $("#btnThis").attr("class", "on");
                        $("#btnOther").attr("class", "");
                    }else if(selectedVal.corpCarDstinCd == '02'){//타사
                        $("#btnThis").attr("class", "");
                        $("#btnOther").attr("class", "on");
                    }

                    //차량번호판매여부
                    if (selectedVal.noSaleYn == 'Y'){
                        $("#noSaleYn").prop("checked", true)
                    }else {
                        $("#noSaleYn").prop("checked", false)
                    };



                    //평가방법
                    if(selectedVal.evalMthCd == 'A'){//본인
                        $("#btnSelf").attr("class", "on");
                        $("#btnProxy").attr("class", "");
                    }else if(selectedVal.evalMthCd == 'M'){//대행
                        $("#btnSelf").attr("class", "");
                        $("#btnProxy").attr("class", "on");
                    }


                });


            }
        }
        ,dataBinding:function(e) {
            kendo.bind($("#viewModel"), {"purcDs":[{"purcNo":""}]});
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"purcStatCd",    title:"<spring:message code='global.lbl.statNm' />",width:130, attributes:{"class":"ac"}
                 ,template:"# if(purcStatCdMap[purcStatCd] != null) { # #= purcStatCdMap[purcStatCd].cmmCdNm# # }#"
             }  //상태
            ,{field:"purcNo",   title:"<spring:message code='sal.lbl.documentNo' />",  width:150, attributes:{"class":"ac"}} //매입번호
            ,{field:"purcCustNm",     title:"<spring:message code='par.lbl.custNm' />",    width:80,  attributes:{"class":"ac"}}  //고객명
        ]
    });




    //그리드 설정
    $("#auctGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115604"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/usc/purcEval/selectAuctInfo.do' />",
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        var grid = $("#grid").data("kendoExtGrid");
                        var selectIdx = grid.select().index();
                        var data = grid.dataSource.view();
                        var selectVal = data[selectIdx];


                        params["sDlrCd"] = selectVal.dlrCd;                         // 딜러
                        params["sPurcNo"] = selectVal.purcNo;                       // 매입번호


                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"auctPk",
                    fields:{
                         dlrCd :{type:"string"}
                        ,purcNo:{type:"string"}
                        ,seq:{type:"string"}
                        ,auctCd :{type:"string"}
                        ,auctPlaceNm:{type:"string"}
                        ,auctAmt:{type:"string"}
                        ,goodsDetlCont:{type:"string"}
                        ,carDlYn:{type:"string"}
                        ,scheConfirmDt:{type:"date"}
                        ,remark:{type:"string"}
                        ,regDt:{type:"date",editable:false}
                        ,updtDt:{type:"date"}
                    }
                }
            }
        }
        ,height:127
        ,pageable:false
        ,autoBind:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["auctPlaceNm","remark","scheConfirmDt","auctPlaceNm"]
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"seq" ,hidden:true}
             ,{field:"regDt"
                 ,title:"<spring:message code='global.lbl.reqDt' />"
                 ,width:80
                 ,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }//신청일자
             ,{field:"auctCd", title:"<spring:message code='sal.lbl.auctType' />", width:60
                 ,attributes:{"class":"ac"}
                 ,template:"# if(auctCdMap[auctCd] != null) { # #= auctCdMap[auctCd].cmmCdNm# # }#"
                 ,editor:function(container, options) {
                     $('<input required name="auctCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                         ,dataSource:auctCdDs
                         ,dataValueField:"cmmCd"
                         ,dataTextField:"cmmCdNm"
                     });
                     $('<span class="k-invalid-msg" data-for="auctCd"></span>').appendTo(container);
                 }
             }//경매구분
            ,{field:"auctPlaceNm",     title:"<spring:message code='sal.lbl.auctAddr' />",    width:120,  attributes:{"class":"al"}}  //경매처
            ,{field:"auctAmt",       title:"<spring:message code='sal.lbl.auctAmt' />",      width:70,  attributes:{"class":"ar"}} //경매가격
            ,{field:"goodsDetlCont",         title:"<spring:message code='sal.lbl.goods' />",        width:100,  attributes:{"class":"al"}} //용품내용
            ,{field:"carDlYn", title:"<spring:message code='sal.lbl.carDlYn' />", width:60
                ,attributes:{"class":"ac"}
                ,template:"# if(carDlYnMap[carDlYn] != null) { # #= carDlYnMap[carDlYn].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input required name="carDlYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:carDlYnDs
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="carDlYn"></span>').appendTo(container);
                }
            }//인도구분
            ,{field:"scheConfirmDt"
                ,title:"<spring:message code='sal.lbl.scheConfirmDt' />"
                ,width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//예상확정일자
            ,{field:"remark"
                ,title:"<spring:message code='par.lbl.remark' />"
                ,width:120
                ,attributes:{"class":"al"}
            }//비고
        ]
    });





});



var popupWindow;

//고객 팝업 열기 함수.
function selectBpPopupWindow(gb){

  popupWindow = dms.window.popup({
      windowId:"bpCdPopup"
      ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
      ,content:{
          url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
          ,data:{
              "type":"custom1"
              ,"autoBind":true
              ,"callbackFunc":function(data){
                  if(gb == 'S'){
                      $("#sPurcCustNo").val(data[0].custNo);
                      $("#sPurcCustNm").val(data[0].custNm);
                  }else if(gb == 'D'){
                      $("#purcCustNo").val(data[0].custNo);
                      $("#purcCustNm").val(data[0].custNm);
                  }
              }
          }
      }
  });
}




//차량마스터팝업 열기 함수.
$("#searchVinNo").click(function(){

  popupWindow = dms.window.popup({
      windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
      ,title:"<spring:message code='global.title.vehicleMaster' />"
      ,content:{
          url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
          ,data:{
              "type"  :null
              ,"autoBind":false
              ,"callbackFunc":function(data){
                      $("#vinNo").val(data[0].vinNo);

              }
          }
      }
  });
});



//적용방법 버튼
function btnClick(btn){
    if(btn == "01"){
        $("#btnThis").attr("class", "on");
        $("#btnOther").attr("class", "");
    }else if(btn == "02"){
        $("#btnThis").attr("class", "");
        $("#btnOther").attr("class", "on");
    }
}



//적용방법 버튼
function fnPurcWayClick(gubun){
    if(gubun == "A"){
        $("#btnSelf").attr("class", "on");
        $("#btnProxy").attr("class", "");
    }else if(gubun == "M"){
        $("#btnSelf").attr("class", "");
        $("#btnProxy").attr("class", "on");
    }
}


function fnReset(){

    var grid = $("#grid").data("kendoExtGrid");
    grid.clearSelection();

    $("#dlrCd").val("");
    $("#purcNo").val("");
    $("#purcStatCd").data("kendoExtDropDownList").value("");
    $("#purcCustNm").val("");
    $("#contractNo").val("");
    $("#carBrandCd").data("kendoExtDropDownList").value("");
    $("#noSaleYn").prop("checked", false);
    $("#carlineNm").val("");
    $("#platNo").val("");
    $("#manufactYyMmDt").val("");
    $("#purcTotAmt").val("");
    $("#vinNo").val("");
    $("#modelNm").val("");
    $("#extColorNm").val("");
    $("#drvMthCd").data("kendoExtDropDownList").value("");
    $("#pcDstinCd").data("kendoExtDropDownList").value("");
    $("#fuelCd").data("kendoExtDropDownList").value("");
    $("#btnThis").attr("class", "on");
    $("#btnOther").attr("class", "");
    $("#evalPrsnNm").val("");
    $("#evalDt").val("");
    $("#evalRemark").val("");
    $("#carStatCd").data("kendoExtDropDownList").value("");
    $("#custHopeAmt").data("kendoExtNumericTextBox").value(0);
    $("#evalAmt").data("kendoExtNumericTextBox").value(0);
    $("#lastAmt").data("kendoExtNumericTextBox").value(0);
    $("#carRegAmt").data("kendoExtNumericTextBox").value(0);

    $('#auctGrid').data('kendoExtGrid').dataSource.data([]);

}
</script>
<!-- //script -->
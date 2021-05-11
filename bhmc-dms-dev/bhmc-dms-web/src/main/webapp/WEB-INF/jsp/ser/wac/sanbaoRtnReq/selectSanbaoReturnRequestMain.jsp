<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.sanbaoReturnReq" /></h1> <!-- 삼포반품신청 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12125" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    </dms:access>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:50%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.reqTp' /></th><!-- 요청구분유형 -->
                            <td>
                                <input type="text" id="sReqDstinTp" name="sReqDstinTp" class="form_comboBox"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.statNm' /></th><!-- 상태 -->
                            <td>
                                <input type="text" id="sReturnStatCd" name="sReturnStatCd" class="form_comboBox" />
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <div id="gridMaster" class="grid"></div>
            </div>
        </section>
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12124" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_s_min5" id="btnInit"><spring:message code="global.btn.init" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12123" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12122" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_s_min5" id="btnReq" disabled><spring:message code="global.btn.req" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12121" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_s_min5" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button>
                </dms:access>
        <%--         <button type="button" class="btn_s" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button> --%>
            </div>
        </div>
        <form id="returnReqForm">
            <div class="clfix">
                <section class="left_areaStyle">
                    <div class="table_form mt10">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:20%;">
                                <col style="width:60%;">
                                <col style="width:20%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.vinNo' /></span></th><!-- 차대번호 -->
                                    <td colspan="3">
                                        <div class="form_search">
                                            <input type="text" id="vinNo" name="vinNo" class="form_input form_use" data-json-obj="true" data-name="<spring:message code="ser.lbl.vinNo" />" required />
                                            <a href="javascript:custPopupWindow();"></a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form mt10">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:20%;">
                                <col style="width:30%;">
                                <col style="width:20%;">
                                <col style="width:30%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.carLine' /></th><!-- 차종 -->
                                    <td class="readonly_area">
                                        <input type="text" id="ltsModelNm" name="ltsModelNm" readonly class="form_input" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.creDt' /></th><!-- 생산일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="creDt" name="creDt" readonly class="form_datepicker ac" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.saleDt' /></th><!-- 판매일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="saleDt" name="saleDt" readonly class="form_datepicker ac" />
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.wartDt' /></th><!-- 보증적용일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="wartDt" name="wartDt" readonly class="form_datepicker ac" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.accuDrivDis' /></th><!-- 최종주행거리 -->
                                    <td class="readonly_area">
                                        <input type="text" id="lastRunDistVal" name="lastRunDistVal" readonly class="form_numeric ar" />
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.sanbaoRemainPrid' /></th><!-- 삼포잔여기간 -->
                                    <td class="readonly_area">
                                        <input type="text" id="sanbaoRmMonth" name="sanbaoRmMonth" readonly class="form_input ar" style="width:30px;"/>
                                        <span class="span_txt"><spring:message code='ser.lbl.monday' /></span><!-- 월 -->
                                        <input type="text" id="sanbaoRmRunDistVal" name="sanbaoRmRunDistVal" readonly class="form_input ar" style="width:45px;"/>
                                        <span class="span_txt">KM</span><!-- Km -->
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.totWorkDay' /></th><!-- 총 작업소요일 -->
                                    <td class="readonly_area">
                                        <input type="text" id="totWorkDay" name="totWorkDay" readonly class="form_input ar" />
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_grid mt10">
                        <div id="gridRoInfo" class="grid"></div>
                    </div>
                    <div class="table_grid mt10">
                        <div id="gridPart" class="grid"></div>
                    </div>

                    <div>
                        <!-- 파일업로드관련 include page -->
                        <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfo.jsp"></jsp:include>
                        <!-- 파일업로드관련 include page -->
                    </div>
                </section>
                <section class="right_areaStyle">

                   <!--  <div class="header_area mt10">
                        <h2 class="title_basic">고객정보</h2>고객정보
                    </div> -->
                    <div class="table_form mt10">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:22%;">
                                <col style="width:24%;">
                                <col style="width:14%;">
                                <col style="width:16%;">
                                <col style="width:24%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.custNm' /></th><!-- 고객명 -->
                                    <td colspan="4" class="readonly_area">
                                        <div class="form_float">
                                            <div class="form_left" >
                                                <input type="text" id="carOwnerNm" name="carOwnerNm" value="" readonly class="form_input al" data-json-obj="true"/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.certNo' /></th><!-- 증서번호 -->
                                    <td colspan="4" class="readonly_area">
                                        <div class="form_float">
                                            <div class="form_left" style="width:40%;">
                                                <input type="text" id="mathDocTp" name="mathDocTp" value="" readonly class="form_comboBox"/>
                                            </div>
                                            <div class="form_right" style="width:60%;">
                                                <input type="text" id="ssnCrnNo" name="ssnCrnNo" value="" readonly class="form_input al"/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.hpNo' /></th><!-- 휴대전화 -->
                                    <td class="readonly_area">
                                        <div class="form_float">
                                            <div class="form_left" style="width:40%;">
                                                <input type="text" id="carOwnerHpNo" name="carOwnerHpNo" value="" readonly class="form_input"/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.email' /></th><!-- E-mail -->
                                    <td class="readonly_area">
                                        <input type="text" id="carOwnerEmailNm" name="carOwnerEmailNm" value="" readonly class="form_input"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="table_form mt10">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:22%;">
                                <col style="width:24%;">
                                <col style="width:14%;">
                                <col style="width:16%;">
                                <col style="width:24%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.invoicePrc' /></span></th><!-- 인보이스가격 -->
                                    <td>
                                        <input type="text" id="carInvcAmt" name="carInvcAmt" value="0" class="form_numeric ar" data-json-obj="true" min=0 max=99999999 data-name="<spring:message code="ser.lbl.invoicePrc" />" required/>
                                    </td>
                                    <td></td>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.runDist' /></span></th><!-- 주행거리 -->
                                    <td>
                                        <input type="text" id="runDistVal" name="runDistVal" value="0" class="form_numeric ar" data-json-obj="true" min=0 max=999999 maxlength="6" data-name="<spring:message code="ser.lbl.runDist" />" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.depreRate' /></th><!-- 감가상각률 -->
                                    <td>
                                        <input type="text" id="dpcaAmt" name="dpcaAmt" value="" readonly class="form_numeric ar form_readonly" data-json-obj="true"/>
                                    </td>
                                    <td>
                                        <dms:access viewId="VIEW-D-12120" hasPermission="${dms:getPermissionMask('READ')}">
                                            <button type="button" id="btnCalc" class="btn_s btn_s_min5"><spring:message code='ser.btn.returnCalc' /></button><!-- 계산 -->
                                        </dms:access>
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.custCharge' /></th><!-- 고객부담금 -->
                                    <td>
                                        <input type="text" id="custBudnAmt" name="custBudnAmt" value="0" readonly class="form_numeric ar form_readonly" data-json-obj="true"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="table_form mt5">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:22%;">
                                <col style="width:78%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.fincReqDt' /></th><!-- 요청일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="returnReqDt" name="returnReqDt" readonly class="form_datepicker ac" style="width:218px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.acceptPlm' /></span></th><!-- 접수차량문제 -->
                                    <td>
                                        <textarea id="carAcptPblmCont" name="carAcptPblmCont" rows="3" cols="" class="form_textarea" style="height:60px;" data-json-obj="true" maxlength="300" data-name="<spring:message code="ser.lbl.acceptPlm" />" required></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.dlrRespCont' /></span></th><!-- 딜러담당의견 -->
                                    <td colspan="3">
                                        <textarea id="dlrRespCont" name="dlrRespCont" rows="3" cols="" class="form_textarea" style="height:60px;" data-json-obj="true" maxlength="300" data-name="<spring:message code="ser.lbl.dlrRespCont" />" required></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span id="cauItemCdSpan" class="bu_required"><spring:message code="ser.lbl.cauItemCd" /></span></th><!-- 원인부품 -->
                                    <td colspan="3" class="readonly_area">
                                        <div class="form_float">
                                            <div class="form_left" style="width:37.4%">
                                                <div class="form_search">
                                                    <input type="text" id="cauItemCd" name="cauItemCd" readOnly class="form_input" data-json-obj="true" data-name="<spring:message code="ser.lbl.cauItemCd" />" required/>
                                                     <a href="javascript:partSearchPopupWindow('IP')"></a>
                                                </div>
                                            </div>
                                            <div class="form_right" style="width:62.6%">
                                                <input type="text" id="cauItemNm" name="cauItemNm" readOnly class="form_input" data-json-obj="true" data-name="<spring:message code="ser.lbl.cauItemCd" />" required /> <!-- 원인부품명 -->
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form mt5">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:22%;">
                                <col style="width:28%;">
                                <col style="width:22%;">
                                <col style="width:28%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.reqTp' /></span></th><!-- 요청구분유형 -->
                                    <td>
                                        <input type="text" id="reqDstinTp" name="reqDstinTp" value="" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="ser.lbl.reqTp" />" required/>
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.returnDstin' /></span></th><!-- 반품구분 -->
                                    <td>
                                        <input type="text" id="returnDstinTp" name="returnDstinTp" value="" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="ser.lbl.returnDstin" />" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.usedExpAmt' /></span></th><!-- 중고예상가격 -->
                                    <td>
                                        <input type="text" id="ocarEvalAmt" name="ocarEvalAmt" value="" class="form_numeric ar" data-json-obj="true" min=1 max=9999999 data-name="<spring:message code="ser.lbl.usedExpAmt" />" required/>
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.reqAmt' /></span></th><!-- 요청금액 -->
                                    <td>
                                        <input type="text" id="reqAmt" name="reqAmt" value="" class="form_numeric ar" data-json-obj="true" min=1 max=9999999 data-name="<spring:message code="ser.lbl.reqAmt" />" required/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form mt5">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:22%;">
                                <col style="width:28%;">
                                <col style="width:22%;">
                                <col style="width:28%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.acceptDt' /></th><!-- 접수일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="acptDt" name="acptDt" value="" readonly class="form_datepicker ac" />
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.approveDt' /></th><!-- 승인일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="judgDt" name="judgDt" value="" readonly class="form_datepicker ac" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.corpCont' /></th><!-- 법인의견 -->
                                    <td colspan="3" class="readonly_area">
                                        <textarea id="corpOpnCont" name="corpOpnCont" rows="2" cols="" readonly class="form_textarea" style="height:59px;" data-json-obj="true"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.dlrCharge' /></th><!-- 딜러부담금 -->
                                    <td class="readonly_area">
                                        <input type="text" id="dlrBudnAmt" name="dlrBudnAmt" value="" readonly class="form_numeric ar" data-json-obj="true"/>
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.corpCharge' /></th><!-- 법인부담금 -->
                                    <td class="readonly_area">
                                        <input type="text" id="corpBudnAmt" name="corpBudnAmt" value="" readonly class="form_numeric ar" data-json-obj="true"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
            <input type="hidden" id="ltsModelCd" name="ltsModelCd" data-json-obj="true"/>
            <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true"/>
            <input type="hidden" id="returnStatCd" name="returnStatCd" data-json-obj="true"/>
            <input type="hidden" id="lineNo" name="lineNo" data-json-obj="true"/>
            <input type="hidden" id="vinNo1" name="vinNo1" data-json-obj="true"/>
            <input type="hidden" id="vinNo2" name="vinNo2" data-json-obj="true"/>
        </form>
    </div>
</div>
<script type="text/javascript">

//20170508 hg
var isTablet="${isTablet}";
var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
}


//공통코드:반품유형
var returnTpList = [];
<c:forEach var="obj" items="${returnTpDs}">
returnTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var returnTpMap = dms.data.arrayToMap(returnTpList, function(obj){return obj.cmmCd;});

// 공통코드:상태
 var returnStatList = [];
<c:forEach var="obj" items="${returnStatDs}">
returnStatList.push({
  cmmCdNm:"${obj.cmmCdNm}"
  , cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var returnStatMap = dms.data.arrayToMap(returnStatList, function(obj){return obj.cmmCd;});


//공통코드:요청구분유형
var reqDstinTpList = [];
<c:forEach var="obj" items="${reqDstinTpDs}">
reqDstinTpList.push({
   cmmCdNm:"${obj.cmmCdNm}"
   , cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var reqDstinTpMap = dms.data.arrayToMap(reqDstinTpList, function(obj){return obj.cmmCd;});


//공통코드:증서유형코드
var mathDocTpList = [];
<c:forEach var="obj" items="${mathDocTpDs}">
mathDocTpList.push({
   cmmCdNm:"${obj.cmmCdNm}"
   , cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var mathDocTpMap = dms.data.arrayToMap(mathDocTpList, function(obj){return obj.cmmCd;});

//공통코드:부품그룹
var itemGrpList = [];
<c:forEach var="obj" items="${itemGrpDs}">
itemGrpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemGrpMap = dms.data.arrayToMap(itemGrpList, function(obj){return obj.cmmCd;});



//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

var itemSalePrcPopupWindow;
var vehOfCustInfoSearchPopup;

$(document).ready( function(){

    $("#vinNo").keypress(function(e){
        if(e.keyCode === 13){
            e.preventDefault();
            custPopupWindow();
        }
     });


  //고객 팝업
    custPopupWindow = function(){

        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
            , title:"<spring:message code='ser.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "vinNo":$("#vinNo").val()
                    , "carRegNo":$("#carRegNo").val()
                    , "carOwnerNm":$("#carOwnerNm").val()
                    , "sanboCust":"Y"
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            //필드 초기화
                            initAll();
                            getCustInfo(data[0]);
                        }
                    }//callback
                }
            }
        });
    };

    getCustInfo = function(data){
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectSanbaoVehOfCustInfoByKey.do' />"
            ,data:JSON.stringify({sVinNo:data.vinNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result.total > 0){
                    custInfoSet(result.data[0]);
                }
            }
        });
    };

 // 차량정보, 고객정보 셋팅
    custInfoSet = function(data){
        $("#vinNo").val(dms.string.strNvl(data.vinNo));
        $("#vinNo1").val(dms.string.strNvl(data.vinNo1));
        $("#vinNo2").val(dms.string.strNvl(data.vinNo2));
        $("#ltsModelCd").val(dms.string.strNvl(data.ltsModelCd));
        $("#ltsModelNm").val(dms.string.strNvl(data.ltsModelNm));
        $("#creDt").data("kendoExtMaskedDatePicker").value(data.signOffDt);
        $("#saleDt").data("kendoExtMaskedDatePicker").value(data.custSaleDt);
        $("#wartDt").data("kendoExtMaskedDatePicker").value(data.grteStartDt);
        $("#lastRunDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
        $("#dpcaAmt").data("kendoExtNumericTextBox").value(data.returnRate);
        $("#carOwnerId").val(dms.string.strNvl(data.carOwnerId));
        $("#carOwnerNm").val(dms.string.strNvl(data.carOwnerNm));
        $("#mathDocTp").data("kendoExtDropDownList").value(data.carOwnerMathDocTp);
        $("#ssnCrnNo").val(data.carOwnerSsnCrnNo);
        $("#carOwnerHpNo").data("kendoMaskedTextBox").value(data.carOwnerHpNo);
        $("#carOwnerEmailNm").val(dms.string.strNvl(data.carOwnerMailNm));
        $("#sanbaoRmMonth").val(dms.string.strNvl(data.sanbaoRmMonth));
        $("#sanbaoRmRunDistVal").val(dms.string.strNvl(data.sanbaoRmRunDistVal));
        $("#totWorkDay").val(dms.string.strNvl(data.totWorkDay));

    };

    //부품조회팝업 khskhs 최재훈대리가 시켰음
    partSearchPopupWindow = function (sFlag){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,height : 630
            ,modal : true
            ,content:{
                url:"<c:url value='/ser/wac/pwaReq/selectPwaItemSearchPopup.do'/>"
                ,data:{
                     "autoBind":false
                    ,"selectable":(sFlag == "GD") ? "multiple":"row"
                    ,"prcTp" :"04"
                    ,"avlbStockQtyZeroYn" : "N"    //재고 없는 부품도 함께 조회.(16.12.04 yewonK)
                    ,"carlineCd" : ($("#carlineCd").val() != undefined) ? $("#carlineCd").val() : ""
                    ,"sFlag" :sFlag
                    ,"callbackFunc":function(jsonObj,bizType){
                        if(jsonObj.length > 0) {

                            var grid = $('#gridPart').data('kendoExtGrid');
                            var cauItemCd = $("#cauItemCd").val();

                            if(sFlag == 'GD'){
                                $.each(jsonObj, function(idx, data){
                                    var copyData = {};
                                    var result = true;
                                    $.each(grid.dataSource._data , function(i , partData){

                                        if(partData.itemCd == data.itemCd){
                                            result = false;
                                        }

                                    });
                                    if(result){
                                        copyData = {
                                                  dlrCd :data.dlrCd
                                                , itemCd:data.itemCd
                                                , itemNm:data.itemNm
                                                , reqQty:data.giQty
                                                , saleUnitCd:data.stockUnitCd
                                                , itemPrc:data.taxDdctGrtePrc
                                                , salePrcAmt:data.salePrcAmt
                                                , itemAmt:Number( ( ( ( data.salePrcAmt * data.giQty ) ) ).toFixed(2) )  //  ((부품단가 * markup * 수량 ) * tax)
                                                , cauItemYn:(cauItemCd == data.itemCd ) ? "Y":"N"
                                                , npnpYn: (bizType == "NPN") ? data.npnpYn : "N"
                                                , npnpMaxAmt: (bizType == "NPN") ? data.npnpMaxAmt : 0
                                        };
                                        grid.dataSource.add(copyData);
                                        calTotAmt();
                                    }

                                });
                             }else {
                                 $("#cauItemCd").val(jsonObj[0].itemCd);
                                 $("#cauItemNm").val(jsonObj[0].itemNm);

                                 // 그리드 원인부품 유무 초기화
                                 $.each(grid.dataSource._data, function(idx, data){
                                     grid.dataSource._data[idx].set("cauItemYn","N");
                                 });

                                 // 원인부품 선택한 부품코드가 그리드에 존재하면 원인부품 여부 선택
                                  $.each(jsonObj, function(idx, data){
                                     $.each(grid.dataSource._data , function(i , partData){
                                          if(partData.itemCd == data.itemCd){
                                             grid.dataSource._data[i].set("cauItemYn","Y");
                                         }
                                     });
                                 });
                                selectShareStockGiItemPopupWindow.close();
                             }
                        }
                    }
                }
            }
        });
    };

    //공통코드:반품구분 VALUE SETTING
    setReturnTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(returnTpMap[value] != undefined)
            resultVal =  returnTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //공통코드:상태  VALUE SETTING
    setReturnStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(returnStatMap[value] != undefined)
            resultVal =  returnStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //공통코드:요청구분유형  VALUE SETTING
    setReqDstinTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(reqDstinTpMap[value] != undefined)
            resultVal =  reqDstinTpMap[value].cmmCdNm;
        }
        return resultVal;
    };


    //공통코드:증서유형코드  VALUE SETTING
    mathDocTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(mathDocTpMap[value] != undefined)
            resultVal =  mathDocTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //공통코드:부품그룹 VALUE SETTING
    setItemGrpNm = function(value){
        var strNm = "";
        if( dms.string.strNvl(value) != ""){
            if(itemGrpMap[value] != undefined)
                strNm =  itemGrpMap[value].cmmCdNm;
        }
        return strNm;
    };


    /**
    ####################################################
          기초 데이터 타입 세팅
    ####################################################
    **/

    /** 생산일자 **/
    $("#creDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
    });

    /** 판매일자 **/
    $("#saleDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
    });

    /** 보증적용일자 **/
    $("#wartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
    });

    /** 접수일자 **/
    $("#acptDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
    });
    /** 요청일자 **/
    $("#returnReqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
    });

    /** 승인일자 **/
    $("#judgDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,value:""
    });

    /** 조회 필드 :상태 **/
    $("#sReturnStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:returnStatList
       ,optionLabel:" "
    });

    /** 조회 필드 :요청구분유형 **/
    $("#sReqDstinTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:reqDstinTpList
       ,optionLabel:" "
    });

    /** 증서유형 **/
    $("#mathDocTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:mathDocTpList
       ,optionLabel:" "
    });

    /** 반품구분 **/
    $("#returnDstinTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:returnTpList
       ,optionLabel:" "
    });

    $("#carOwnerHpNo").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });


    /** 요청구분유형 **/
    $("#reqDstinTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:reqDstinTpList
       ,optionLabel:" "
    });

    /**최종주행거리**/
    $("#lastRunDistVal").kendoExtNumericTextBox({
       format:"n0"                // n0:###,###, n2:###,###.##
      ,decimals:0                // 소숫점
      ,min:0
      ,value:0
      ,spinners:false
    });

    /**주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       format:"n0"                // n0:###,###, n2:###,###.##
      ,decimals:0                // 소숫점
      ,min:0
      ,value:0
      ,spinners:false
    });

    /**인보이스가격**/
    $("#carInvcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });

    /**감가상각률**/
    $("#dpcaAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });


    /**고객부담금**/
    $("#custBudnAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });

    /**딜러부담금**/
    $("#dlrBudnAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });

    /**법인부담금**/
    $("#corpBudnAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });


    /**중고예상가격**/
    $("#ocarEvalAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });

    /**중고예상가격**/
    $("#reqAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false
    });


    /**
    ####################################################
          버튼  세팅
    ####################################################
    **/

    /** 조회 버튼**/
    $("#btnSearch").kendoButton({

        click:function(e){

            $("#gridMaster").data("kendoExtGrid").dataSource.read();

        }
    });

    /** 계산 버튼**/
    $("#btnCalc").kendoButton({

        click:function(e) {

            var carInvcAmt = $("#carInvcAmt").data("kendoExtNumericTextBox").value(); //인보이스가격
            var runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value(); // 주행거리
            var lastRunDistVal = $("#lastRunDistVal").data("kendoExtNumericTextBox").value(); // 주행거리
            var dpcaAmt = $("#dpcaAmt").data("kendoExtNumericTextBox").value();        //감가상각률


            if ( Number(carInvcAmt) <= 0 ) {
                var  msgText = "<spring:message code='ser.lbl.invoicePrc' var='invoicePrc' />"+
                               "<spring:message code='global.info.validation.required' arguments='${invoicePrc}' />";
                               $("#carInvcAmt").focus();
                               return dms.notification.info(msgText);
            }

            if ( Number(runDistVal) <= 0 ) {
                var  msgText = "<spring:message code='ser.lbl.runDist' var='runDist' />"+
                                "<spring:message code='global.info.validation.required' arguments='${runDist}' />";
                                $("#runDistVal").focus();
                                return dms.notification.info(msgText);
            } else {
                if ( Number(runDistVal) < Number(lastRunDistVal) ) {
                    var  msgText = "<spring:message code='ser.lbl.accuDrivDis' var='accuDrivDis' />"+
                                   "<spring:message code='ser.lbl.runDist' var='runDist' />"+
                                   "<spring:message code='global.info.validation.min' arguments='${runDist} , ${accuDrivDis}' />";
                                   $("#runDistVal").focus();
                                    return dms.notification.info(msgText);
                }
            }

            if ( Number(dpcaAmt) <= 0 ) {
                var  msgText = "<spring:message code='ser.lbl.depreRate' var='depreRate' />"+
                                "<spring:message code='global.info.confirmMsgParam' arguments='${depreRate}' />";
                                return dms.notification.info(msgText);
            }


            //(인보이스가격 * 주행거리 / 1000) * 감가상각률;
            var custBudnAmt =  (carInvcAmt * runDistVal / 1000) * dpcaAmt;

            $("#custBudnAmt").data("kendoExtNumericTextBox").value(custBudnAmt);//고객부담금

        }


    });

    /** 초기화 버튼**/
    $("#btnInit").kendoButton({

        click:function(e){
            initAll();
        }
    });

    /** 저장 버튼**/
    $("#btnSave").kendoButton({

        click:function(e){

            var statCd = $("#returnStatCd").val() == "" ? "O":$("#returnStatCd").val();
            sendRequestSave(statCd);
        }
    });
    /** 요청 버튼**/
    $("#btnReq").kendoButton({
        click:function(e){

            sendRequestSave("Q");
        }

    });
    /** 취소 버튼**/
    $("#btnReqCancel").kendoButton({

        click:function(e){

            sendRequestSave("QC");
        }
    });

    /** Form Data Request**/
    sendRequestSave = function (statCd){

        var validator = $("#returnReqForm").kendoExtValidator().data("kendoExtValidator");

        $("#returnStatCd").val(statCd);
        if(validator.validate()){
            var formSaveData = $("#returnReqForm").serializeObject($("#returnReqForm").serializeArrayInSelector("[data-json-obj='true']"));

            formSaveData.returnReqDt = $("#returnReqDt").data("kendoExtMaskedDatePicker").value();//반품요청일자
            formSaveData.carInvcAmt = $("#carInvcAmt").data("kendoExtNumericTextBox").value();//차량인보이스금액
            formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();//주행거리
            formSaveData.dpcaAmt = $("#dpcaAmt").data("kendoExtNumericTextBox").value();//감가상각률
            formSaveData.custBudnAmt = $("#custBudnAmt").data("kendoExtNumericTextBox").value();//고객부담금
            formSaveData.ocarEvalAmt = $("#ocarEvalAmt").data("kendoExtNumericTextBox").value();//중고차평가금액
            formSaveData.reqAmt = $("#reqAmt").data("kendoExtNumericTextBox").value();//요청금액
            formSaveData.dlrBudnAmt = $("#dlrBudnAmt").data("kendoExtNumericTextBox").value();//딜러부담금
            formSaveData.returnStatCd = statCd;



            var lineNo = $("#lineNo").val();

            $.ajax({
                  url:"<c:url value='/ser/wac/sanbaoRtnReq/multiSanbaoReturnRequest.do' />"
                ,data:JSON.stringify(formSaveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){

                    $("#returnStatCd").val((statCd == "QC" )? "O":statCd);

                        selectedYn =  ( dms.string.isEmpty($("#sReturnStatCd").val() )  && ( (statCd != "O" ) || (lineNo == "0" ) ) );
                        if(selectedYn){
                            gridRow = $("#gridMaster").data("kendoExtGrid").select().index();
                            $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                            $("#gridMaster").data("kendoExtGrid").dataSource.read();
                        }

                    getGridSearch();

                    setButtonEnable($("#returnStatCd").val());

                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });

        }

    };

    getGridSearch = function(e){

        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        $("#gridRoInfo").data("kendoExtGrid").dataSource.data([]);
        $("#gridPart").data("kendoExtGrid").dataSource.data([]);
        $("#gridRoInfo").data("kendoExtGrid").dataSource.read();
        $("#gridPart").data("kendoExtGrid").dataSource.read();
        $("#fileGrid").data("kendoExtGrid").dataSource.read();

    };

    setResultDataSetting =  function (result){


        $("#fileKeyNm").val(dms.string.strNvl(result.fileKeyNm));
        $("#ltsModelCd").val(dms.string.strNvl(result.ltsModelCd));
        $("#returnStatCd").val(dms.string.strNvl(result.returnStatCd));
        $("#lineNo").val(result.lineNo);
        $("#vinNo1").val(dms.string.strNvl(result.vinNo1));
        $("#vinNo2").val(dms.string.strNvl(result.vinNo2));
        $("#vinNo").val(dms.string.strNvl(result.vinNo));
        $("#ltsModelNm").val(dms.string.strNvl(result.ltsModelNm));
        $("#carInvcAmt").data("kendoExtNumericTextBox").value( result.carInvcAmt);
        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
        $("#dpcaAmt").data("kendoExtNumericTextBox").value(result.dpcaAmt);
        $("#custBudnAmt").data("kendoExtNumericTextBox").value(result.custBudnAmt);
        $("#returnReqDt").data("kendoExtMaskedDatePicker").value(result.returnReqDt);
        $("#carAcptPblmCont").val(dms.string.strNvl(result.carAcptPblmCont));
        $("#dlrRespCont").val(dms.string.strNvl(result.dlrRespCont));
        $("#cauItemCd").val(dms.string.strNvl(result.cauItemCd));
        $("#cauItemNm").val(dms.string.strNvl(result.cauItemNm));
        $("#reqDstinTp").data("kendoExtDropDownList").value(dms.string.strNvl(result.reqDstinTp));
        $("#returnDstinTp").data("kendoExtDropDownList").value(dms.string.strNvl(result.returnDstinTp));
        $("#ocarEvalAmt").data("kendoExtNumericTextBox").value(result.ocarEvalAmt);
        $("#reqAmt").data("kendoExtNumericTextBox").value(result.reqAmt);
        $("#acptDt").data("kendoExtMaskedDatePicker").value(result.acptDt);
        $("#judgDt").data("kendoExtMaskedDatePicker").value(result.judgDt);
        $("#corpOpnCont").val(dms.string.strNvl(result.corpOpnCont));
        $("#dlrBudnAmt").data("kendoExtNumericTextBox").value(result.dlrBudnAmt);
        $("#corpBudnAmt").data("kendoExtNumericTextBox").value(result.corpBudnAmt);



    };

    //초기화
    initAll =  function (result){

        $("#returnReqForm").get(0).reset();
        $("#ltsModelCd").val("");
        $("#carOwnerId").val("");
        $("#returnStatCd").val("");
        $("#lineNo").val(0);
        $("#vinNo1").val("");
        $("#vinNo2").val("");
        $("#fileKeyNm").val("");

        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        $("#gridRoInfo").data("kendoExtGrid").dataSource.data([]);
        $("#gridPart").data("kendoExtGrid").dataSource.data([]);


        setButtonEnable("");


    };

    //버튼설정
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "O"://저장
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(true);
                $("#btnReqCancel").data("kendoButton").enable(false);

                setFileButton("Y");
                      break;
            case "S"://접수
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);

                setFileButton("N");
                      break;
            case "A"://승인
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);

                setFileButton("N");
                      break;
             case "D"://거절
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);

                setFileButton("N");
                      break;
            case "Q"://요청
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
            case "R"://불승인
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(true);
                $("#btnReqCancel").data("kendoButton").enable(false);

                setFileButton("N");
                      break;
            default :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);

                setFileButton("N");
                break;
        }
    };
    setFileButton("N");


    /** 삼포 반품 정보 그리드 **/
    $("#gridMaster").kendoExtGrid({
      //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-SER-1011-000182"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequests.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sReturnStatCd"] = $("#sReturnStatCd").val();
                         params["sReqDstinTp"] = $("#sReqDstinTp").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number"  }
                       ,returnReqDt:{type:"date"  }   //신청일자
                       ,vinNo:{type:"string"  }       //VIN
                       ,reqDstinTp:{type:"string"  }  //요청구분유형
                       ,returnDstinTp:{type:"string" }//반품구분
                       ,returnStatCd:{type:"string" } //상태
                       ,acptDt:{type:"date" }       //접수일자
                       ,judgDt:{type:"date" }         //승인일자
                       ,custBudnAmt:{type:"number" }  //고객부담금
                       ,dlrBudnAmt:{type:"number" }   //딜러부담금
                       ,corpDudnAmt:{type:"number" }  //법인부담금
                    }

                 }//model
           }//schema
        }//dataSource
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,autoBind:true
        ,editable:false
        ,height:200
        ,resizable:false
        ,selectable:_selectable
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }
        }
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
         }
        ,change:function (e){

            initAll();
            var selectedVal = this.dataItem(this.select());

            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var lineNo = selectedVal.lineNo;


            var params = {};
            params["sDlrCd"] = dlrCd;
            params["sVinNo"] = vinNo;
            params["sLineNo"] = lineNo;

            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function (result){

                     getCustInfo(result);
                     setResultDataSetting(result);

                     getGridSearch();// 그리드 조회
                     setButtonEnable($("#returnStatCd").val());
                    //dms.notification.success("<spring:message code='global.info.searchSuccess' />");

                 }
            });

        }
        ,columns:[
                    {field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"returnReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:120
                       , attributes :{"class":"ac"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"

                   }
                   ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:170, attributes :{"class":"al"}}
                   ,{field:"reqDstinTp", title:"<spring:message code='ser.lbl.reqTp' />", width:100
                       , attributes :{"class":"ac"}
                       , template:"#= setReqDstinTpMap(reqDstinTp) #"
                       , editor:function(container, options){
                           $('<input required name="reqDstinTp" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:reqDstinTpList
                           });
                           $('<span class="k-invalid-msg" data-for="reqDstinTp"></span>').appendTo(container);
                          }
                   }
                   ,{field:"returnDstinTp", title:"<spring:message code='ser.lbl.returnDstin' />", width:100
                       , attributes :{"class":"ac"}
                       , template:"#= setReturnTpMap(returnDstinTp) #"
                       , editor:function(container, options){
                           $('<input required name="returnDstinTp" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:returnTpList
                           });
                           $('<span class="k-invalid-msg" data-for="returnDstinTp"></span>').appendTo(container);
                          }

                   }
                   ,{field:"returnStatCd", title:"<spring:message code='ser.lbl.statNm' />", width:100
                       , attributes :{"class":"ac"}
                       , template:"#= setReturnStatMap(returnStatCd) #"
                       , editor:function(container, options){
                           $('<input required name="returnStatCd" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:returnStatList
                           });
                           $('<span class="k-invalid-msg" data-for="returnStatCd"></span>').appendTo(container);
                          }
                     }
                   ,{field:"acptDt", title:"<spring:message code='ser.lbl.acceptDt' />", width:120
                       , attributes :{"class":"ac"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"judgDt", title:"<spring:message code='ser.lbl.approveDt' />", width:120
                       , attributes :{"class":"ac"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"
                   }

                   ,{field:"custBudnAmt", title:"<spring:message code='ser.lbl.custCharge' />", width:120
                       , attributes :{"class":"ar"}
                       , format:"{0:n0}"
                   }
                   ,{field:"dlrBudnAmt", title:"<spring:message code='ser.lbl.dlrCharge' />", width:120
                       , attributes :{"class":"ar"}
                       , format:"{0:n0}"
                   }
                   ,{field:"corpDudnAmt", title:"<spring:message code='ser.lbl.corpCharge' />", width:120
                       , attributes :{"class":"ar"}
                       , format:"{0:n0}"
                   }
                 ]

    });

    /** 삼포 RO 정보 그리드 **/
    $("#gridRoInfo").kendoExtGrid({
        gridId:"G-SER-1011-000183"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestWorkInfos.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sVinNo"] = $("#vinNo").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"dlrCd"
                    ,fields:{
                       dlrCd:{type:"string"}     //딜러
                       ,roDocNo:{type:"string"} //RO NO
                       ,roStartDt:{type:"date" } //작업시작일
                       ,roEndDt:{type:"date" }//작업 종료일
                       ,workDay:{type:"string" } //작업소요일
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:false
        ,pageable:false
        ,editable:false
        ,height:110
        ,resizable:false
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:_selectable
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
         }
        ,change:function (e){

        }
        ,columns:[
                   {field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:70, sortable:false, attributes :{"class":"al"}}
                   ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:100, sortable:false, attributes :{"class":"al"}}
                   ,{field:"roStartDt", title:"<spring:message code='ser.lbl.roStartDt' />", width:80, sortable:false
                       , attributes :{"class":"al"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"roEndDt", title:"<spring:message code='ser.lbl.roEndDt' />", width:80, sortable:false
                       , attributes :{"class":"al"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"workDay", title:"<spring:message code='ser.lbl.workDay' />", width:50, sortable:false, attributes :{"class":"ac"}}
                 ]

    });

    /** 삼포 부품 정보 그리드 **/
    $("#gridPart").kendoExtGrid({
        gridId:"G-SER-1011-000184"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestItems.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sVinNo"] = $("#vinNo").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"itemGrpCd"
                    ,fields:{
                       itemGrpCd:{type:"string"}   //부품그룹
                       ,itemGrpNm:{type:"string"} //부품그룹명
                       ,itemAtcCd:{type:"string" } //분류항목
                       ,occrCnt:{type:"number" }//동일하자건수
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:false
        ,pageable:false
        ,editable:false
        ,height:100
        ,resizable:false
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:_selectable
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
        }
        ,columns:[
                   {field:"itemGrpCd", title:"<spring:message code='ser.lbl.itemGrp' />", width:70, sortable:false, attributes :{"class":"al"}}
                   ,{field:"itemGrpNm", title:"<spring:message code='ser.lbl.itemGrpNm' />", width:100, sortable:false, attributes :{"class":"al"}}
                   ,{field:"itemAtcCd", title:"<spring:message code='ser.lbl.itemAtc' />", width:80, sortable:false
                       , attributes :{"class":"ac"}
                       , template:"#= setItemGrpNm(itemAtcCd) #"
                       , editor:function(container, options){
                           $('<input required name="itemAtcCd" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:itemGrpList
                           });
                           $('<span class="k-invalid-msg" data-for="itemAtcCd"></span>').appendTo(container);
                          }
                   }
                   ,{field:"occrCnt", title:"<spring:message code='ser.lbl.sameFauExchCnt' />", width:80, sortable:false, attributes :{"class":"al"}}
                 ]

    });
    if(isTablet == true || isTablet == "true"){
        if(window.matchMedia('(max-width:1024px)').matches){
            $("#gridMaster").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
});

</script>

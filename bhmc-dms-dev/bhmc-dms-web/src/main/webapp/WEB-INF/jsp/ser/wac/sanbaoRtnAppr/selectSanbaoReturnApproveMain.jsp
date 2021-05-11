<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>


<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.sanbaoReturnApr" /></h1> <!-- 삼포반품승인 -->
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:13%;">
                <col style="width:5%;">
                <col style="width:10%;">
                <col style="width:5%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.fincReqDt' /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sFromDt" class="form_datepicker ac" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sToDt" class="form_datepicker ac" />
                            </div>
                        </div>
                    </td>
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
<form id="returnApprForm">
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
                        <th scope="row"><spring:message code='ser.lbl.vinNo' /></th>
                        <td class="readonly_area">
                            <input type="text" id="vinNo" name="vinNo" class="form_input form_use" readonly data-name="<spring:message code="ser.lbl.vinNo" />" required data-json-obj="true" />
                        </td>
                        <td></td>
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
                            <input type="text" id="ltsModelNm" name="ltsModelNm" readonly class="form_input" />
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
        <!-- 탭메뉴 전체 영역 -->
        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.ro" /></li>
                <li><spring:message code="ser.lbl.claim" /></li>
                <li><spring:message code="ser.lbl.item" /></li>
                <%-- <li><spring:message code="ser.lbl.file" /></li> --%>
            </ul>
            <div>
                <div class="table_grid ">
                    <div id="gridRoInfo" class="grid"></div>
                </div>
            </div>
            <div>
                <div class="table_grid ">
                    <div id="gridPart" class="grid"></div>
                </div>
            </div>
            <div>
                <div class="table_grid ">
                    <div id="gridClaimInfo" class="grid"></div>
                </div>
            </div>

       </div>
       <!-- //탭메뉴 전체 영역 -->

       <div>
            <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfo.jsp"></jsp:include>
        </div>




        <div class="header_area">
            <div class="btn_left">
                <button type="button" id="btnClaimPrint" class="btn_s print btn_s_min5"><spring:message code ='ser.btn.claimPrint' /></button>
            </div>
        </div>
    </section>

    <section class="right_areaStyle">
        <div class="table_form mt10">
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
                        <th scope="row"><spring:message code='ser.lbl.custNm' /></th><!-- 고객명 -->
                        <td class="readonly_area">
                            <input type="text" id="carOwnerNm" name="carOwnerNm" value="" readonly class="form_input al" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.hpNo' /></th>
                        <td class="readonly_area">
                            <input type="text" id="carOwnerHpNo" name="carOwnerHpNo" value="" readonly class="form_input"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.fincReqDt' /></th><!-- 요청일자 -->
                        <td class="readonly_area">
                            <input type="text" id="returnReqDt" name="returnReqDt" readonly class="form_datepicker ac"  />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.acceptPlm' /></th><!-- 접수차량문제 -->
                        <td colspan="3" class="readonly_area">
                            <textarea id="carAcptPblmCont" name="carAcptPblmCont" rows="3" cols="" class="form_textarea" style="height:44px;" maxlength="300" ></textarea>
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
                        <th scope="row"><spring:message code='ser.lbl.dlrRespCont' /></th><!-- 딜러담당의견 -->
                        <td colspan="3" class="readonly_area">
                            <textarea id="dlrRespCont" name="dlrRespCont" rows="3" cols="" class="form_textarea" style="height:45px;" maxlength="300" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span id="cauItemCdSpan" class="bu_required"><spring:message code="ser.lbl.cauItemCd" /></span></th><!-- 원인부품 -->
                        <td colspan="3" class="readonly_area">
                            <div class="form_float">
                                <div class="form_left" style="width:37.4%">
                                    <div class="form_search">
                                        <input type="text" id="cauItemCd" name="cauItemCd" readOnly class="form_input" />
                                         <a href="javascript:partSearchPopupWindow('IP')"></a>
                                    </div>
                                </div>
                                <div class="form_right" style="width:62.6%">
                                    <input type="text" id="cauItemNm" name="cauItemNm" readOnly class="form_input"  /> <!-- 원인부품명 -->
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="btnAccept" class="btn_s btn_s_min5" disabled><spring:message code='ser.btn.btnAccept' /></button><!-- 접수 -->
                <button type="button" id="btnAppr" class="btn_s btn_s_min5" disabled><spring:message code='ser.btn.approval' /></button><!-- 승인 -->
                <button type="button" id="btnDeny" class="btn_s btn_s_min5" disabled><spring:message code='ser.btn.nonAppr' /></button><!-- 불승인 -->
                <%-- <button type="button" id="btnCancel" class="btn_s btn_s_min5"><spring:message code='ser.btn.cancel' /></button> --%><!-- 취소 -->
            </div>
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
                        <th scope="row"><spring:message code='ser.lbl.reqTp' /></th><!-- 요청구분유형 -->
                        <td class="readonly_area">
                            <input type="text" id="reqDstinTp" name="reqDstinTp" value="" readonly class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.returnDstin' /></th><!-- 반품구분 -->
                        <td class="readonly_area">
                            <input type="text" id="returnDstinTp" name="returnDstinTp" readonly value="" class="form_comboBox" />
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
                        <th scope="row"><spring:message code='ser.lbl.invoicePrc' /></th><!-- 인보이스가격 -->
                        <td class="readonly_area">
                            <input type="text" id="carInvcAmt" name="carInvcAmt" value="0" readonly class="form_numeric ar" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.usedExpAmt' /></th><!-- 중고예상가격 -->
                        <td class="readonly_area">
                            <input type="text" id="ocarEvalAmt" name="ocarEvalAmt" value="0" readonly class="form_numeric ar" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.runDist' /></th><!-- 주행거리 -->
                        <td class="readonly_area">
                            <input type="text" id="runDistVal" name="runDistVal" value="0" readonly class="form_numeric ar" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.reqAmt' /></th><!-- 요청금액 -->
                        <td class="readonly_area">
                            <input type="text" id="reqAmt" name="reqAmt" value="0.00" readonly class="form_numeric ar" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.depreRate' /></th><!-- 감가상각률 -->
                        <td class="readonly_area">
                            <input type="text" id="dpcaAmt" name="dpcaAmt" value="0.00" readonly class="form_numeric ar form_readonly" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.dlrCharge' /></span></th><!-- 딜러부담금 -->
                        <td>
                            <input requried type="text" id="dlrBudnAmt" name="dlrBudnAmt" value="0.00" class="form_numeric ar" min=0 max=9999999 data-name="<spring:message code="ser.lbl.dlrCharge" />" required data-json-obj="true"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.custCharge' /></th><!-- 고객부담금 -->
                        <td>
                            <input type="text" id="custBudnAmt" name="custBudnAmt" value="0.00" readonly class="form_numeric ar form_readonly" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.corpCharge' /></span></th><!-- 법인부담금 -->
                        <td>
                            <input requried type="text" id="corpBudnAmt" name="corpBudnAmt" value="0.00" class="form_numeric ar" min=0 max=9999999 data-name="<spring:message code="ser.lbl.corpCharge" />" required data-json-obj="true"/>
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
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.acceptDt' /></span></th><!-- 접수일자 -->
                        <td>
                            <input type="text" requried id="acptDt" name="acptDt" value="" class="form_datepicker ac" data-name="<spring:message code="ser.lbl.acceptDt" />"  data-json-obj="true"/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.approveDt' /></span></th><!-- 승인일자 -->
                        <td>
                            <input type="text" requried id="judgDt" name="judgDt" value="" data-name="<spring:message code="ser.lbl.approveDt" />" class="form_datepicker ac" data-json-obj="true"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.corpCont' /></span></th><!-- 법인의견 -->
                        <td colspan="3">
                            <textarea id="corpOpnCont" requried name="corpOpnCont" rows="2" cols="" class="form_textarea" data-name="<spring:message code="ser.lbl.corpCont" />"  style="height:59px;" data-json-obj="true"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_left">
                <button type="button" id="btnAppFormPrint" class="btn_s btn_s_min5"><spring:message code='ser.btn.appFormPrint'/></button><!-- 신청서 -->
                <button type="button" id="btnSanbaoPrint" class="btn_s btn_s_min5"><spring:message code='ser.btn.sanbaoPrint'/></button> <!-- 삼포증출력 -->
            </div>
        </div>

    </section>
</div>
    <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true"/>
    <input type="hidden" id="ltsModelCd" name="ltsModelCd" data-json-obj="true"/>
    <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true"/>
    <input type="hidden" id="returnStatCd" name="returnStatCd" data-json-obj="true"/>
    <input type="hidden" id="lineNo" name="lineNo" data-json-obj="true"/>
    <input type="hidden" id="vinNo1" name="vinNo1" data-json-obj="true"/>
    <input type="hidden" id="vinNo2" name="vinNo2" data-json-obj="true"/>
    <input type="hidden" id="returnApproveNo" name="returnApproveNo" data-json-obj="true"/>
</form>


<script type="text/javascript">


//공통코드:반품유형
var returnTpList = [];
<c:forEach var="obj" items="${returnTpDs}">
returnTpList.push({
   cmmCdNm:"${obj.cmmCdNm}"
   , cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var returnTpMap = dms.data.arrayToMap(returnTpList, function(obj){return obj.cmmCd;});

//공통코드:상태
var returnStatList = [];
<c:forEach var="obj" items="${returnStatDs}">
returnStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var returnStatMap = dms.data.arrayToMap(returnStatList, function(obj){return obj.cmmCd;});

//공통코드:요청구분유형
var reqDstinTpList = [];
<c:forEach var="obj" items="${reqDstinTpDs}">
reqDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var reqDstinTpMap = dms.data.arrayToMap(reqDstinTpList, function(obj){return obj.cmmCd;});

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

    /**조회조건 시작일자 **/
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**조회조건 종료일자**/
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

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
        ,value:"${sToDt}"
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

    /**요청금액**/
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
            selectedYn = false;
            $("#gridMaster").data("kendoExtGrid").dataSource.read();

        }
    });

    /** 접수 버튼**/
    $("#btnAccept").kendoButton({

        click:function(e){
            sendRequestSave("S");
        }
    });
    /** 승인 버튼**/
    $("#btnAppr").kendoButton({

        click:function(e){

            sendRequestSave("A");
        }
    });
    /** 불승인 버튼**/
    $("#btnDeny").kendoButton({

        click:function(e){

            sendRequestSave("R");

        }
    });
    /** 취소 버튼**/
    /* $("#btnCancel").kendoButton({

        click:function(e){

            sendRequestSave("Q");
        }
    }); */
    /** 클레임리포트 프린터 버튼**/
    $("#btnClaimPrint").kendoButton({

        click:function(e){

        }
    });
    /** 신청서 출력 버튼**/
    $("#btnAppFormPrint").kendoButton({

        click:function(e){

        }
    });
    /** 삼포증출력 버튼**/
    $("#btnSanbaoPrint").kendoButton({

        click:function(e){

        }
    });

    /** Form Data Request**/
    sendRequestSave = function (statCd){

        var validator = $("#returnApprForm").kendoExtValidator().data("kendoExtValidator");

        $("#returnStatCd").val(statCd);
      //  if(validator.validate()){
            var formSaveData = $("#returnApprForm").serializeObject($("#returnApprForm").serializeArrayInSelector("[data-json-obj='true']"));
            formSaveData.acptDt = $("#acptDt").data("kendoExtMaskedDatePicker").value();//접수일자
            formSaveData.judgDt = $("#judgDt").data("kendoExtMaskedDatePicker").value();//승인일자


             if(statCd == "S"){
                $("#acptDt").attr("required","");
                $("#dlrBudnAmt").removeAttr("required");
                $("#corpBudnAmt").removeAttr("required");
                $("#judgDt").removeAttr("required");
                $("#corpOpnCont").removeAttr("required");
            }else if(statCd == "R"){
                $("#corpOpnCont").attr("required","");
                $("#acptDt").attr("required","");
                $("#dlrBudnAmt").removeAttr("required");
                $("#corpBudnAmt").removeAttr("required");
                $("#judgDt").removeAttr("required");
            }else if(statCd == "A"){
                $("#corpOpnCont").attr("required","");
                $("#acptDt").attr("required","");
                $("#dlrBudnAmt").attr("required","");
                $("#corpBudnAmt").attr("required","");
                $("#judgDt").attr("required","");
            }

             var dlrBudnAmt = $("#dlrBudnAmt").data("kendoExtNumericTextBox").value();
             var corpBudnAmt = $("#corpBudnAmt").data("kendoExtNumericTextBox").value();
             var reqAmt = $("#reqAmt").data("kendoExtNumericTextBox").value();


             if( (dlrBudnAmt + corpBudnAmt) > reqAmt ) { //ser.info.chkMax

                 msgText = "<spring:message code='ser.lbl.reqAmt' var='reqAmt' />"+
                           "<spring:message code='ser.info.validation.amt' arguments='${reqAmt}' />";
                 return dms.notification.warning(msgText);
             }

            if(validator.validate()){

                $.ajax({
                     url:"<c:url value='/ser/wac/sanbaoRtnAppr/updateSanbaoReturnApprove.do' />"
                    ,data:JSON.stringify(formSaveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){


                        selectedYn = dms.string.isEmpty($("#sReturnStatCd").val());
                        if(selectedYn){
                            gridRow = $("#gridMaster").data("kendoExtGrid").select().index();
                            $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                            $("#gridMaster").data("kendoExtGrid").dataSource.read();
                        }


                        getGridSearch();

                        setButtonEnable($("#returnStatCd").val());

                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }

    };

    initAll = function(e){

        $("#returnApprForm").get(0).reset();
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
        $("#gridClaimInfo").data("kendoExtGrid").dataSource.data([]);


        setButtonEnable("");
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
                if(result != null){

                    //initAll();
                    if(result.data[0] > 0 )
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
        $("#carOwnerHpNo").data("kendoMaskedTextBox").value(data.carOwnerHpNo);
        $("#sanbaoRmMonth").val(dms.string.strNvl(data.sanbaoRmMonth));
        $("#sanbaoRmRunDistVal").val(dms.string.strNvl(data.sanbaoRmRunDistVal));
        $("#totWorkDay").val(dms.string.strNvl(data.totWorkDay));


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


        $("#returnApproveNo").val(dms.string.strNvl(result.returnApproveNo));
        $("#fileKeyNm").val(dms.string.strNvl(result.fileKeyNm));
        $("#dlrCd").val(dms.string.strNvl(result.dlrCd));
        $("#ltsModelCd").val(dms.string.strNvl(result.ltsModelCd));
        $("#ltsModelNm").val(dms.string.strNvl(result.ltsModelNm));
        $("#returnStatCd").val(dms.string.strNvl(result.returnStatCd));
        $("#lineNo").val(result.lineNo);
        $("#vinNo1").val(dms.string.strNvl(result.vinNo1));
        $("#vinNo2").val(dms.string.strNvl(result.vinNo2));
        $("#vinNo").val(dms.string.strNvl(result.vinNo));
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

    //버튼설정
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "O"://저장
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnAppr").data("kendoButton").enable(false);
                $("#btnDeny").data("kendoButton").enable(false);
                //$("#btnCancel").data("kendoButton").enable(false);
                $("#btnClaimPrint").data("kendoButton").enable(false);
                $("#btnAppFormPrint").data("kendoButton").enable(false);
                $("#btnSanbaoPrint").data("kendoButton").enable(false);

                setFileButton("N");
                      break;
            case "S"://접수
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnAppr").data("kendoButton").enable(true);
                $("#btnDeny").data("kendoButton").enable(true);
                //$("#btnCancel").data("kendoButton").enable(false);
                $("#btnClaimPrint").data("kendoButton").enable(true);
                $("#btnAppFormPrint").data("kendoButton").enable(true);
                $("#btnSanbaoPrint").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
            case "A"://승인
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnAppr").data("kendoButton").enable(false);
                $("#btnDeny").data("kendoButton").enable(false);
               // $("#btnCancel").data("kendoButton").enable(true);
                $("#btnClaimPrint").data("kendoButton").enable(true);
                $("#btnAppFormPrint").data("kendoButton").enable(true);
                $("#btnSanbaoPrint").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
             case "D"://거절
                 $("#btnAccept").data("kendoButton").enable(false);
                 $("#btnAppr").data("kendoButton").enable(false);
                 $("#btnDeny").data("kendoButton").enable(false);
               //  $("#btnCancel").data("kendoButton").enable(false);
                 $("#btnClaimPrint").data("kendoButton").enable(false);
                 $("#btnAppFormPrint").data("kendoButton").enable(false);
                 $("#btnSanbaoPrint").data("kendoButton").enable(false);

                 setFileButton("N");
                      break;
            case "Q"://요청
                $("#btnAccept").data("kendoButton").enable(true);
                $("#btnAppr").data("kendoButton").enable(false);
                $("#btnDeny").data("kendoButton").enable(false);
              //  $("#btnCancel").data("kendoButton").enable(true);
                $("#btnClaimPrint").data("kendoButton").enable(true);
                $("#btnAppFormPrint").data("kendoButton").enable(true);
                $("#btnSanbaoPrint").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
            case "R"://불승인
                $("#btnAccept").data("kendoButton").enable(false);
                $("#btnAppr").data("kendoButton").enable(false);
                $("#btnDeny").data("kendoButton").enable(false);
               // $("#btnCancel").data("kendoButton").enable(true);
                $("#btnClaimPrint").data("kendoButton").enable(true);
                $("#btnAppFormPrint").data("kendoButton").enable(true);
                $("#btnSanbaoPrint").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
            default :
                $("#btnAccept").data("kendoButton").enable(true);
                $("#btnAppr").data("kendoButton").enable(false);
                $("#btnDeny").data("kendoButton").enable(false);
               // $("#btnCancel").data("kendoButton").enable(false);
                $("#btnClaimPrint").data("kendoButton").enable(false);
                $("#btnAppFormPrint").data("kendoButton").enable(false);
                $("#btnSanbaoPrint").data("kendoButton").enable(false);

                setFileButton("N");
                break;
        }
    };
    $("#btnFileDel").hide();
    setFileButton("N");

    /** 삼포 반품 정보 그리드 **/
    $("#gridMaster").kendoExtGrid({
      //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-SER-1011-000181"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproves.do' />"
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

                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"]   = $("#sToDt").data("kendoExtMaskedDatePicker").value();
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
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number"  }
                       ,lineNo:{type:"number"  }
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
        ,autoBind:false
        ,editable:false
        ,height:200
        ,resizable:false
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }
        }
        ,change:function (e){

            initAll();
            var selectedVal = this.dataItem(this.select());

            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var lineNo = selectedVal.lineNo;

            //$("#vinNo").val(vinNo);

            var params = {};
            params["sDlrCd"] = dlrCd;
            params["sVinNo"] = vinNo;
            params["sLineNo"] = lineNo;

            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproveByKey.do' />"
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
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"returnReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:120
                       , attributes :{"class":"ac"}
                       , format:"{0:<dms:configValue code='dateFormat' />}"

                   }
                   ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100, attributes :{"class":"al"}}
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
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnAppr/selectSanbaoReturnRequestWorkInfos.do' />"
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
        ,height:131
        ,resizable:false
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
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
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnAppr/selectSanbaoReturnRequestItems.do' />"
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
                       itemGrpCd:{type:"string"}     //부품그룹
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
        ,height:130
        ,resizable:false
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
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

    /** 삼포 클레임 그리드 **/
    $("#gridClaimInfo").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproveClaimInfos.do' />"
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
                       dlrCd:{type:"string"}     //딜러코드
                       ,roDocNo:{type:"string"} //RO번호
                       ,claimDocNo:{type:"string" } //클레임번호
                       ,cauItemCd:{type:"string" }//원인부품
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:false
        ,pageable:false
        ,editable:false
        ,height:130
        ,resizable:false
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
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
                   ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:80, sortable:false
                       , attributes :{"class":"ac"}
                   }
                   ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />", width:80, sortable:false
                       , attributes :{"class":"al"}}
                   }
                 ]

    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

});

</script>
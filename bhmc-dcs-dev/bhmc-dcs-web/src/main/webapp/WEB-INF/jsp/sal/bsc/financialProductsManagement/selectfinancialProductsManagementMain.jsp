<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 금융상품 관리 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.fincProductMngt" /></h1> <!-- 금융상품 관리 -->
            <div class="btn_right">
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>        <!-- 상세 -->
                <button id="btnReset" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>        <!-- 신규 -->
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.fincCmp" /></th> <!-- 금융사 -->
                        <td>
                            <input name="sFincCmpCd" id="sFincCmpCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.fincItem" /></th> <!-- 금융상품 -->
                        <td>
                            <input name="sFincItemTp" id="sFincItemTp" type="text" class="form_comboBox">
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- 금융정보 -->
    <section class="group">
        <%-- <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.title.fincInfo" /></h2> <!-- 금융정보 -->
        </div> --%>
        <div class="table_grid mt10">
            <div id="grid"></div>
        </div>
    </section>

    <!-- 금융정보상세 -->
    <section id="callFinProductMntWindow" class="pop_wrap">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.title.fincInfoDetail" /></h2> <!-- 금융정보상세 -->
            <div class="btn_right">
                <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col style="width:14%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.fincCmp" /></span></th> <!-- 금융사 -->
                        <td>
                            <input name="fincCmpCd" id="fincCmpCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.productCd" /></span></th> <!-- 상품코드 -->
                        <td>
                            <input name="fincItemCd" id="fincItemCd" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.fincItem" /></span></th> <!-- 금융상품 -->
                        <td colspan="3">
                            <input name="fincItemNm" id="fincItemNm" type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.fincItemTp" /></th> <!-- 금융상품유형 -->
                        <td>
                            <input name="fincItemTp" id="fincItemTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 -->
                        <td>
                            <input name="custTp" id="custTp" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.creditRt" /></th> <!-- 신용등급 -->
                        <td>
                            <input name="creditGradeCd" id="creditGradeCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.term" /></th> <!-- 기간 -->
                        <td>
                            <input name="fincItemPrid" id="fincItemPrid" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.contractAmt" /></th> <!-- 계약금액 -->
                        <td>
                            <input name="contractAmt" id="contractAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" >
                        </td>
                        <th scope="row"><spring:message code="global.lbl.contractAmtRt" /></th> <!-- 계약금율 -->
                        <td>
                            <input name="contractAmtRate" id="contractAmtRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.advanceReceived" /></th> <!-- 선수금 -->
                        <td>
                            <input name="prepayDlAmt" id="prepayDlAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.advanceReceivedRt" /></th> <!-- 선수율 -->
                        <td>
                            <input name="prepayRate" id="prepayRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.latepayDlAmt" /></th> <!-- 후불인도금액 -->
                        <td>
                            <input name="latepayDlAmt" id="latepayDlAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.mmPayAmtRate" /></th> <!-- 월불입금율 -->
                        <td>
                            <input name="mmPayAmtRate" id="mmPayAmtRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.instIntrRate" /></span></th> <!-- 할부이자율 -->
                        <td>
                            <input name="instIntrRate" id="instIntrRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.remIntrRate" /></th> <!-- 잔가이자율 -->
                        <td>
                            <input name="remIntrRate" id="remIntrRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.hdlgFeeRate" /></th> <!-- 취급수수료율 -->
                        <td>
                            <input name="hdlgFeeRate" id="hdlgFeeRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hdlgFeeAmt" /></span></th> <!-- 취급수수료금액 -->
                        <td>
                            <input name="hdlgFeeAmt" id="hdlgFeeAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.grteIncaRate" /></th> <!-- 보증보험료율 -->
                        <td>
                            <input name="grteIncaRate" id="grteIncaRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.grteIncaAmt" /></span></th> <!-- 보증보험료금액 -->
                        <td>
                            <input name="grteIncAmt" id="grteIncAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.stampAmt" /></th> <!-- 인지대 -->
                        <td>
                            <input name="stampAmt" id="stampAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.authAmt" /></th> <!-- 공증료 -->
                        <td>
                            <input name="authAmt" id="authAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.cashPrc" /></th> <!-- 현금금액 -->
                        <td>
                            <input name="cashPrc" id="cashPrc" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.instSbodtAmt" /></th> <!-- 할부부대비용계 -->
                        <td>
                            <input name="instSbodtAmt" id="instSbodtAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.account" /></th> <!-- 거래처 -->
                        <td>
                            <input name="bpCd" id="bpCd" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.useYn" /></th> <!-- 사용여부 -->
                        <td>
                            <input name="useYn" id="useYn" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.fincItemKindCd" /></th>   <!-- 상품관리유형 -->
                        <td>
                            <input id="fincItemKindCd" type="text" class="form_comboBox"/>
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <section id="fincKindGroup" style="display:none">
            <div class="clfix">
                <div class="left_areaStyle" style="width:45%">
                    <div class="header_area">
                        <div class="left_area ml0">
                            <ul class="txt_input mt0">
                                <li>
                                    <span class="span_bg"><spring:message code='global.lbl.targetCarline' /></span><!-- 대상차종 -->
                                    <input type="text" id="carlineCd" class="form_comboBox" style="width:150px;">
                                </li>
                            </ul>
                        </div>
                        <div class="btn_right">
                            <button class="btn_s " id="btnSearchR"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="searchModelGrid"></div>
                    </div>
                </div>
                <ul class="promotion_btn">
                    <li><button id="btnAddM" class="btn_s btn_next"></button></li>
                    <li><button id="btnDelM" class="btn_s btn_prev"></button></li>
                </ul>
                <div class="right_areaStyle" style="width:45%">
                    <div class="header_area_space">&nbsp;</div>
                    <div class="table_grid">
                        <div id="targetModelGrid"></div>
                    </div>
                </div>
            </div>
        </section>

        <span style="display:none">
            <!-- 저장된 금융회사, 금융상품 -->
            <input type="hidden" id="savedFincCmp" value="" />
            <input type="hidden" id="savedFincItem" value="" />
        </span>
    </section>
    <!-- //금융정보상세 -->

<script  type="text/javascript">

// 차종
var carlineList = [];
<c:forEach var="obj" items="${carlineNames}">
   carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 금융상품관리유형 SAL160
var fincItemKindCdList = [];
<c:forEach var="obj" items="${fincItemKindCdDS}">
  fincItemKindCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

/************* 금융사 SELECT BOX  *******************/
var fincCmpCdList = [];
<c:forEach var="obj" items="${fincCmpCdInfo}">
fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var fincCmpCdArr = dms.data.arrayToMap(fincCmpCdList, function(obj){return obj.cmmCd});

$("#sFincCmpCd").kendoExtDropDownList({
     dataTextField:"cmmCdNm"
    ,dataValueField:"cmmCd"
    ,dataSource:fincCmpCdList
    ,optionLabel:" "   //전체
});

$("#fincCmpCd").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
   ,dataValueField:"cmmCd"
   ,dataSource:fincCmpCdList
   ,index:0
   ,optionLabel:" "  // 선택
});
/************* 금융사 SELECT BOX  *******************/

/************* 금융상품 유형 SELECT BOX  *******************/
var fincItemTpList = [];
<c:forEach var="obj" items="${fincItemTpInfo}">
fincItemTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var fincItemTpArr = dms.data.arrayToMap(fincItemTpList, function(obj){return obj.cmmCd});

$("#sFincItemTp").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
   ,dataValueField:"cmmCd"
   ,dataSource:fincItemTpList
   ,optionLabel:" "   //전체
});

$("#fincItemTp").kendoExtDropDownList({
   dataTextField:"cmmCdNm"
  ,dataValueField:"cmmCd"
  ,dataSource:fincItemTpList
  ,index:0
  ,optionLabel:" "  // 선택
});
/************* 금융상품 유형 SELECT BOX  *******************/

/************* 기간 SELECT BOX  *******************/
var fincItemPridList = [];
<c:forEach var="obj" items="${fincItemPridInfo}">
fincItemPridList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var fincItemPridArr = dms.data.arrayToMap(fincItemPridList, function(obj){return obj.cmmCd});

$("#fincItemPrid").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
   ,dataValueField:"cmmCd"
   ,dataSource:fincItemPridList
   ,index:0
   ,optionLabel:" "  // 선택
});
/************* 기간 SELECT BOX  *******************/

/************* 신용등급 SELECT BOX  *******************/
var creditGradeCdList = [];
<c:forEach var="obj" items="${creditGradeCdInfo}">
creditGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var creditGradeCdArr = dms.data.arrayToMap(creditGradeCdList, function(obj){return obj.cmmCd});

$("#creditGradeCd").kendoExtDropDownList({
    dataTextField:"cmmCdNm"
   ,dataValueField:"cmmCd"
   ,dataSource:creditGradeCdList
   ,index:0
   ,optionLabel:" "  // 선택
});
/************* 신용등급 SELECT BOX  *******************/

$(document).ready(function () {

    // 본문 팝업 설정
    $("#callFinProductMntWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.fincProductMngt' />"      // 금융상품관리
        ,width:"950px"
        ,height:"360px"
    }).data("kendoWindow");

    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                setSearch(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    fincCmpCdDropDownEditor = function(container, options) {
        $('<input required data-text-field="cmmCdNm" data-value-field="cmmCd" data-bind="value:' + options.field + '"/>')
             .appendTo(container)
             .kendoExtDropDownList({
                  autoBind:false
                 ,dataTextField:"cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:fincCmpCdList
             });
        $('<span class="k-invalid-msg" data-for="taxAtcDstinCd"></span>').appendTo(container);
     }

    // 금융사
    changeFincCmpCdReason = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fincCmpCdArr[val].cmmCdNm;
        }
        return returnVal;
    }
    fincItemTpDropDownEditor = function(container, options) {
          $('<input required data-text-field="cmmCdNm" data-value-field="cmmCd" data-bind="value:' + options.field + '"/>')
              .appendTo(container)
              .kendoExtDropDownList({
                   autoBind:false
                  ,dataTextField:"cmmCdNm"
                  ,dataValueField:"cmmCd"
                  ,dataSource:fincItemTpList
              });
          $('<span class="k-invalid-msg" data-for="calcAtcDstinCd"></span>').appendTo(container);
    }

    // 금융상품 유형
    changeFincItemTpReason = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fincItemTpArr[val].cmmCdNm;
        }
        return returnVal;
    }

    fincItemPridDropDownEditor = function(container, options) {
        $('<input required data-text-field="cmmCdNm" data-value-field="cmmCd" data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoExtDropDownList({
                 autoBind:false
                ,dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:fincItemPridList
            });
        $('<span class="k-invalid-msg" data-for="calcAtcDstinCd"></span>').appendTo(container);
    }

    // 기간
    changeFincItemPridReason = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fincItemPridArr[val].cmmCdNm;
        }
        return returnVal;
    }


    $("#contractAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#contractAmtRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#prepayDlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#prepayRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#latepayDlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#mmPayAmtRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#instIntrRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#remIntrRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#hdlgFeeRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#hdlgFeeAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#grteIncaRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,max:999
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#grteIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#stampAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#authAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#cashPrc").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    $("#instSbodtAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    /**
     * 사용여부
     */
     $("#useYn").kendoExtDropDownList({
          dataTextField:"userCdNm"
         ,dataValueField:"userCd"
         ,dataSource:[{"userCd":"Y","userCdNm":"<spring:message code='global.lbl.use' />"},{"userCd":"N","userCdNm":"<spring:message code='global.lbl.notUse' />"}]
         ,index:0
     });

    // 금융상품종류
    $("#fincItemKindCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:fincItemKindCdList
       ,index:0
    });
    $("#fincItemKindCd").on('change', function(){
        var item = $(this).data("kendoExtDropDownList").value();

        if(item == "01"){
            $("#fincKindGroup").hide();
            $("#carlineCd").data("kendoExtDropDownList").value('');

            $('#searchModelGrid').data('kendoExtGrid').dataSource.data([]);
            $('#targetModelGrid').data('kendoExtGrid').dataSource.data([]);
        }else{
            $("#fincKindGroup").show();

            $("#carlineCd").data("kendoExtDropDownList").value('');
            $('#searchModelGrid').data('kendoExtGrid').dataSource.data([]);

            $('#targetModelGrid').data('kendoExtGrid').dataSource._destroyed = [];
            $('#targetModelGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    /**
     * 차종 콤보박스
     */
    $("#carlineCd").kendoExtDropDownList({
      dataTextField:"carlineNm"
      ,dataValueField:"carlineCd"
      ,dataSource:carlineList
      ,optionLabel:" "  // 선택
    });

    //대상차종 조회
    $("#btnSearchR").kendoButton({
        click:function(e){
            if($("#carlineCd").data("kendoExtDropDownList").value() == ""){
                //대상차종을 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.targetCarline' var='targetCarline' /><spring:message code='global.info.chkSelectItemMsg' arguments='${targetCarline},' />");
                return false;
            }

            $('#searchModelGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    // 추가
    $("#btnAddM").kendoButton({
        click:function(e){
            var grid = $("#searchModelGrid").data("kendoExtGrid");
            var selectRows = grid.select();

            if(selectRows.length > 0){

                $.each(selectRows, function(idx, val){
                    var data = grid.dataItem(val);

                    if(!isTargetModelGrid(data.modelCd)){
                        $('#targetModelGrid').data('kendoExtGrid').dataSource.insert(idx, {
                             modelCd    :data.modelCd
                            ,modelNm    :data.modelNm
                        });
                    }
                });

            }
        }
    });

    // 추가 시, vehicleItemList2에  데이터가 존재 유무 체크.
    function isTargetModelGrid(item){
        var flag = false;
        var grid2 = $('#targetModelGrid').data('kendoExtGrid');
        var rows = grid2.tbody.find("tr");

        rows.each(function(index, row){
            var data = grid2.dataItem(row);

            if(item == data.modelCd){
                flag = true;
            }
        });
        return flag;
    }


    // 삭제
    $("#btnDelM").kendoButton({
        click:function(e){
            var targetGrid = $("#targetModelGrid").data("kendoExtGrid");
            var rows = targetGrid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            rows.each(function(index, row) {
                targetGrid.removeRow(row);
            });

        }
    });

	//버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
            refreshAll();
        }
    });

    //버튼 - 초기화
    $("#btnReset").kendoButton({
        click:function(e) {
            refreshAll();
            viewDetailPopup();  // 상세팝업.
        }
    });

    $("#btnSave").kendoButton({
        //icon:"plus",
        click:function(e){

            save();
        }
    });

    $("#btnCancel").kendoButton({
        //icon:"undo",
        click:function(e){
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 1번
	$("#grid").kendoExtGrid({
	    gridId:"G-SAL-0721-113302"
       	,dataSource:{
       	 transport:{
             read:{
                 url:"<c:url value='/sal/bsc/financialProductsManagement/selectFinancialProductsManagement.do' />"
             }
            ,parameterMap:function(options, operation) {
                 if (operation === "read") {

                     var params = {};
                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;
                     params["sort"] = options.sort;

                     params["sFincCmpCd"] = $("#sFincCmpCd").data('kendoExtDropDownList').value();
                     params["sFincItemTp"] = $("#sFincItemTp").data('kendoExtDropDownList').value();

                     return kendo.stringify(params);
                 }else if (operation !== "read" && options.models) {
                     return kendo.stringify(options.models);
                 }
             }
         }
         ,error:function(e){

         }
         ,schema:{
              data:"data"
             ,total:"total"
             ,model:{
                  id:"fincItemCd"
                 ,fields:{
                     custTp:{type:"string", hidden:true} //
                     ,creditGradeCd:{type:"string", hidden:true} //
                     ,contractAmt:{type:"number", hidden:true} //
                     ,contractAmtRate:{type:"number", hidden:true} //
                     ,prepayDlAmt:{type:"number", hidden:true} //
                     ,prepayRate:{type:"number", hidden:true } //
                     ,latepayDlAmt:{type:"number", hidden:true} //
                     ,mmPayAmtRate:{type:"number", hidden:true} //
                     ,instIntrRate:{type:"number", hidden:true} //
                     ,remIntrRate:{type:"number", hidden:true} //
                     ,hdlgFeeRate:{type:"number", hidden:true} //
                     ,hdlgFeeAmt:{type:"number", hidden:true} //
                     ,grteIncaRate:{type:"number", hidden:true} //
                     ,grteIncAmt:{type:"number", hidden:true} //
                     ,stampAmt:{type:"number", hidden:true} //
                     ,authAmt:{type:"number", hidden:true} //
                     ,cashPrc:{type:"number", hidden:true} //
                     ,instSbodtAmt:{type:"number", hidden:true} //
                     ,bpCd:{type:"string", hidden:true} //
                     ,useYn:{type:"string", hidden:true} //
                     ,fincItemCd:{type:"string", hidden:true } //
                     ,fincCmpCd:{type:"string", editable:false} //
                     ,fincItemNm:{type:"string", editable:false} //
                     ,fincItemTp:{type:"string", editable:false} //
                     ,fincItemPrid:{type:"string", editable:false} //

                 }
             }
         }
       }
	   ,dataBound:function(e) {
           var savedCmp = $("#savedFincCmp").val();
           var savedItem = $("#savedFincItem").val();

           if(dms.string.isNotEmpty(savedCmp)){
               var selectRow
                 , grid = $("#grid").data("kendoExtGrid")
                 , rows = grid.tbody.find("tr");

               rows.each(function(index, row) {
                   var dataItem = grid.dataSource.at(index);

                   if(dataItem.fincCmpCd == savedCmp
                           && dataItem.fincItemCd == savedItem){
                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                        grid.select(selectRow);
                       //fn_contGridDBclick(dataItem);
                       //viewDetailPopup();
                   }
               });
           }
           $("#savedFincCmp").val("");
           $("#savedFincItem").val("");
	   }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
	   ,height:434
       ,autoBind:false
       ,scrollable:true
       /*
       ,change:function(e){
           var selectedItem = this.dataItem(this.select());
           setSearch(selectedItem);
       }
       */
	   ,columns:[
               {   field:"custTp", hidden:true }  // 고객유형
              ,{   field:"creditGradeCd", hidden:true }  // 신용등급
              ,{   field:"contractAmt", hidden:true }  // 계약금
              ,{   field:"contractAmtRate", hidden:true }  // 계약금율
              ,{   field:"prepayDlAmt", hidden:true }  // 선수인도금
              ,{   field:"prepayRate", hidden:true }  // 선수율
              ,{   field:"latepayDlAmt", hidden:true }  // 인도금후불률
              ,{   field:"mmPayAmtRate", hidden:true }  // 월불입금률
              ,{   field:"instIntrRate", hidden:true }  // 할부이자율
              ,{   field:"remIntrRate", hidden:true }  // 잔가이자율
              ,{   field:"hdlgFeeRate", hidden:true }  // 취급수수료율
              ,{   field:"hdlgFeeAmt", hidden:true }  // 취금수수료
              ,{   field:"grteIncaRate", hidden:true }  // 보증보험료율
              ,{   field:"grteIncAmt", hidden:true }  // 보증보혐료
              ,{   field:"stampAmt", hidden:true }  // 인지대
              ,{   field:"authAmt", hidden:true }  // 공증료
              ,{   field:"cashPrc", hidden:true }  // 현금가격
              ,{   field:"instSbodtAmt", hidden:true }  // 할부부대비용계
              ,{   field:"bpCd", hidden:true }  // 거래처
              ,{   field:"useYn", hidden:true }  // 시용여부
              ,{
                   title:"<spring:message code='global.lbl.fincCmp' />"
                  ,field:"fincCmpCd"
                  ,width:55
                  ,headerAttributes:{style:"text-align:center;"}
                  ,editor:fincCmpCdDropDownEditor
                  ,template:"#=changeFincCmpCdReason(fincCmpCd)#"
               }  // 금융사
              ,{
                   title:"<spring:message code='global.lbl.fincItem' />"
                  ,field:"fincItemNm", width:75
                  ,headerAttributes:{style:"text-align:center;"}
               }  // 금융상품명
              ,{
                   title:"<spring:message code='global.lbl.fincItemTp' />"
                  ,field:"fincItemTp", width:55
                  ,headerAttributes:{style:"text-align:center;"}
                  ,editor:fincItemTpDropDownEditor
                  ,template:"#=changeFincItemTpReason(fincItemTp)#"
               }  // 금융상품 유형
              ,{
                   title:"<spring:message code='global.lbl.term' />"
                  ,field:"fincItemPrid", width:35
                  ,headerAttributes:{style:"text-align:center;"}
                  ,editor:fincItemPridDropDownEditor
                  ,template:"#=changeFincItemPridReason(fincItemPrid)#"
                  ,attributes:{style:"text-align:right;"}
               }  // 기간
          ]
	});

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        setSearch(selectedItem);
        viewDetailPopup();
    });


    //조회모델 그리드
    $("#searchModelGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/bsc/financialProductsManagement/selectModelGridSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["carlineCd"] = $("#carlineCd").data("kendoExtDropDownList").value();  // 차량코드

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"modelCd"
                    ,fields:{
                        modelCd:{type:"string"}
                       ,modelNm:{type:"string"}
                    }
                }
            }
        }
        ,height:95
        ,pageable:false
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,multiSelectWithCheckbox:true
        ,columns:[
                    {field:"modelNm", title:"<spring:message code='sal.lbl.searchModel' />",    width:100, attributes:{"class":"al"}} //조회모델명
                   ]
    });


    //대상모델 목록 그리드
    $("#targetModelGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/bsc/financialProductsManagement/selectFincTargetModelSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sFincCmpCd"] = $("#fincCmpCd").val();
                        params["sFincItemCd"] = $("#fincItemCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"fincItemCd",
                    fields:{
                        dlrCd     :{type:"string"}
                       ,fincCmpCd :{type:"string"}
                       ,fincItemCd:{type:"string"}
                       ,modelCd :{type:"string"}
                       ,modelNm :{type:"string"}
                    }
                }
            }
        }
        ,height:95
        ,pageable:false
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,multiSelectWithCheckbox:true
        ,columns:[
                    {field:"modelNm", title:"<spring:message code='global.lbl.targetModel' />",    width:100, attributes:{"class":"al"}} //대상모델명
                   ]
    });

});

//상세내용 팝업 호출
viewDetailPopup = function(){
    var win = $("#callFinProductMntWindow").data("kendoWindow").center().open();
}

setSearch = function(jsonObj) {
    if( jsonObj == null || jsonObj == 'undefined')
        return;

   refreshAll();

   $("#seq").val(jsonObj.seq);
   $("#fincCmpCd").data("kendoExtDropDownList").value(jsonObj.fincCmpCd);
   $("#fincItemTp").data("kendoExtDropDownList").value(jsonObj.fincItemTp);
   $("#fincItemPrid").data("kendoExtDropDownList").value(jsonObj.fincItemPrid);
   $("#creditGradeCd").data("kendoExtDropDownList").value(jsonObj.creditGradeCd);

   $("#custTp").val(jsonObj.custTp);
   $("#fincItemNm").val(jsonObj.fincItemNm);
   $("#fincItemCd").val(jsonObj.fincItemCd);
   $("#contractAmt").data("kendoExtNumericTextBox").value(jsonObj.contractAmt);
   $("#contractAmtRate").data("kendoExtNumericTextBox").value(jsonObj.contractAmtRate);

   $("#latepayDlAmt").data("kendoExtNumericTextBox").value(jsonObj.latepayDlAmt);
   $("#prepayDlAmt").data("kendoExtNumericTextBox").value(jsonObj.prepayDlAmt);
   $("#prepayRate").data("kendoExtNumericTextBox").value(jsonObj.prepayRate);
   $("#mmPayAmtRate").data("kendoExtNumericTextBox").value(jsonObj.mmPayAmtRate);
   $("#instIntrRate").data("kendoExtNumericTextBox").value(jsonObj.instIntrRate);

   $("#remIntrRate").data("kendoExtNumericTextBox").value(jsonObj.remIntrRate);
   $("#hdlgFeeRate").data("kendoExtNumericTextBox").value(jsonObj.hdlgFeeRate);
   $("#hdlgFeeAmt").data("kendoExtNumericTextBox").value(jsonObj.hdlgFeeAmt);
   $("#grteIncaRate").data("kendoExtNumericTextBox").value(jsonObj.grteIncaRate);
   $("#grteIncAmt").data("kendoExtNumericTextBox").value(jsonObj.grteIncAmt);

   $("#stampAmt").data("kendoExtNumericTextBox").value(jsonObj.stampAmt);
   $("#authAmt").data("kendoExtNumericTextBox").value(jsonObj.authAmt);
   $("#instSbodtAmt").data("kendoExtNumericTextBox").value(jsonObj.instSbodtAmt);
   $("#cashPrc").data("kendoExtNumericTextBox").value(jsonObj.cashPrc);
   $("#bpCd").val(jsonObj.bpCd);
   $("#useYn").data("kendoExtDropDownList").value(jsonObj.useYn);
   $("#fincItemKindCd").data("kendoExtDropDownList").value(jsonObj.fincItemKindCd != null ? jsonObj.fincItemKindCd:"01");
   $("#fincItemKindCd").change();
}

refreshAll = function() {
    $("#seq").val("");
    $("#savedFincCmp").val("");      // 저장 조회용
    $("#savedFincItem").val("");     // 저장 조회용
    $("#fincCmpCd").data("kendoExtDropDownList").value("");
    $("#fincItemCd").val("");
    $("#fincItemNm").val("");
    $("#fincItemTp").data("kendoExtDropDownList").value("");
    $("#custTp").val("");
    $("#creditGradeCd").data("kendoExtDropDownList").value("");
    $("#fincItemPrid").data("kendoExtDropDownList").value("");
    $("#contractAmt").data("kendoExtNumericTextBox").value(0);
    $("#contractAmtRate").data("kendoExtNumericTextBox").value(0);
    $("#prepayDlAmt").data("kendoExtNumericTextBox").value(0);
    $("#prepayRate").data("kendoExtNumericTextBox").value(0);
    $("#latepayDlAmt").data("kendoExtNumericTextBox").value(0);
    $("#mmPayAmtRate").data("kendoExtNumericTextBox").value(0);
    $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
    $("#remIntrRate").data("kendoExtNumericTextBox").value(0);
    $("#hdlgFeeRate").data("kendoExtNumericTextBox").value(0);
    $("#hdlgFeeAmt").data("kendoExtNumericTextBox").value(0);
    $("#grteIncaRate").data("kendoExtNumericTextBox").value(0);
    $("#grteIncAmt").data("kendoExtNumericTextBox").value(0);
    $("#stampAmt").data("kendoExtNumericTextBox").value(0);
    $("#authAmt").data("kendoExtNumericTextBox").value(0);
    $("#cashPrc").data("kendoExtNumericTextBox").value(0);
    $("#instSbodtAmt").data("kendoExtNumericTextBox").value(0);
    $("#bpCd").val("");
    $("#useYn").data("kendoExtDropDownList").value("");
    $("#fincItemKindCd").data("kendoExtDropDownList").select(0);
    $("#fincItemKindCd").change();
}

validator = function() {

    if($("#fincCmpCd").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.fincCmp' var='fincCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fincCmp},' />"); // 금융사
        $("#fincCmpCd").focus();
        return false;
    }

    if($("#fincItemCd").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.productCd' var='globalLblProductCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblProductCd},' />"); // 금융상품코드
        $("#fincItemCd").focus();
        return false;
    }

    if($("#fincItemNm").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.productTp' var='globalLblProductTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblProductTp},' />"); // 금융상품명
        $("#fincItemNm").focus();
        return false;
    }

    if($("#useYn").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.useYn' var='useYn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${useYn},' />"); // 사용여부
        $("#useYn").focus();
        return false;
    }

    return true;
}

save = function() {
    var saveData;

    if(validator()) {
        saveData = {
             seq:$("#seq").val()
            ,fincCmpCd:$("#fincCmpCd").val()
            ,fincItemTp:$("#fincItemTp").data("kendoExtDropDownList").value()
            ,fincItemNm:$("#fincItemNm").val()
            ,fincItemCd:$("#fincItemCd").val()
            ,fincItemPrid:$("#fincItemPrid").data("kendoExtDropDownList").value()
            ,creditGradeCd:$("#creditGradeCd").data("kendoExtDropDownList").value()
            ,custTp:$("#custTp").val()
            ,contractAmt:$("#contractAmt").data("kendoExtNumericTextBox").value()
            ,contractAmtRate:$("#contractAmtRate").data("kendoExtNumericTextBox").value()
            ,prepayDlAmt:$("#prepayDlAmt").data("kendoExtNumericTextBox").value()
            ,prepayRate:$("#prepayRate").data("kendoExtNumericTextBox").value()
            ,latepayDlAmt:$("#latepayDlAmt").data("kendoExtNumericTextBox").value()
            ,cashPrc:$("#cashPrc").data("kendoExtNumericTextBox").value()
            ,mmPayAmtRate:$("#mmPayAmtRate").data("kendoExtNumericTextBox").value()
            ,remIntrRate:$("#remIntrRate").data("kendoExtNumericTextBox").value()
            ,instIntrRate:$("#instIntrRate").data("kendoExtNumericTextBox").value()
            ,hdlgFeeAmt:$("#hdlgFeeAmt").data("kendoExtNumericTextBox").value()
            ,hdlgFeeRate:$("#hdlgFeeRate").data("kendoExtNumericTextBox").value()
            ,grteIncAmt:$("#grteIncAmt").data("kendoExtNumericTextBox").value()
            ,grteIncaRate:$("#grteIncaRate").data("kendoExtNumericTextBox").value()
            ,stampAmt:$("#stampAmt").data("kendoExtNumericTextBox").value()
            ,authAmt:$("#authAmt").data("kendoExtNumericTextBox").value()
            ,instSbodtAmt:$("#instSbodtAmt").data("kendoExtNumericTextBox").value()
            ,bpCd:$("#bpCd").val()
            ,useYn:$("#useYn").data("kendoExtDropDownList").value()
            ,fincItemKindCd:$("#fincItemKindCd").data("kendoExtDropDownList").value()
        };

        if($("#fincItemKindCd").data("kendoExtDropDownList").value() != "01"){
            var saveGridData = $("#targetModelGrid").data("kendoExtGrid").getCUDData("insertFincModelList", "updateFincModelList", "deleteFincModelList");
            /*
            if ($("#targetModelGrid").data("kendoExtGrid").cudDataLength == 0) {
                //{0} 정보가 없습니다.
                dms.notification.info("<spring:message code='global.lbl.targetModel' var='globalLblTargetModel' /><spring:message code='sal.info.noInfoData' arguments='${globalLblTargetModel}' />");
                return;
            }
            */
            saveData = $.extend( saveData, saveGridData );
        }

        $.ajax({
            url:"<c:url value='/sal/bsc/financialProductsManagement/saveFinancialProductsManagement.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(jqXHR, textStatus){
                refreshAll();
                $("#savedFincSeq").val(jqXHR);   // 저장된 금융 일련번호

                $('#targetModelGrid').data('kendoExtGrid').dataSource._destroyed = [];

                $('#grid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#grid').data('kendoExtGrid').dataSource.page(1);

                $("#callFinProductMntWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }
}

fnOnfocus = function(id){
    $("#"+ id +" ").select();
}

</script>
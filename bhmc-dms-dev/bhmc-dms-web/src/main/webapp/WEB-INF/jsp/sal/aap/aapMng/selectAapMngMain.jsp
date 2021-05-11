<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 대행업무관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.agencyBsiMgmt" /></h1><!-- 대행업무관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11013" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11012" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_new" id="btnReset"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11011" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='sal.lbl.aapAskDt' /></th><!-- 대행신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" data-type="maskDate" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" data-type="maskDate" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.proxyDstinTp' /></th><!-- 대행업무구분 -->
                    <td>
                        <input id="sAapWrkDstinCd" type="text" class="form_comboBox">
                    </td>

                    <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vsCustNm" class="form_input onKey_up onKey_bulr" />
                                    <a href="javascript:bf_searchCustomer('search', 'vsCustNm');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    <input id="sCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sCustNo" readonly class="form_input form_readonly" />
                            </div>
                        </div>
                    </td>

                    <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                    <td>
                        <input id="sAapEmpNm" type="text"  class="form_input" >
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->


    <section id="aapMngWindow" class="pop_wrap">
        <!-- 개별정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.carInfo' /></h2><!-- 개별정보 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11010" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </dms:access>
            </div>
        </div>
        <form id="detailForm" name="detailForm" method="POST" action="/">

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
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.aapAskDt' /></span></th><!-- 대행신청일 -->
                        <td class="required_area">
                            <input id="aapDt" name="aapDt" class="form_datepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.proxyDstinTp' /></span></th><!-- 대행업무구분 -->
                        <td class="required_area">
                            <input id="aapWrkDstinCd" name="aapWrkDstinCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.seq' /></th>   <!-- 일련번호 -->
                        <td>
                            <input id="seq" name="seq" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vinNo" /></span></th><!-- VIN NO -->
                        <td>
                            <div class="form_search" style="width:50%">
                            <input id="sVinNo2" type="text" maxlength="17" class="form_input"/>
                                <a href="#" onclick="bf_searchVinNo();" ><spring:message code='global.lbl.search' /></a>   <!-- 검색 -->
                            </div>
                            <input type="text" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" style="width:48%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.carNo" /></th><!-- 차량번호 -->
                        <td>
                            <input id="carRegNo" name="carRegNo" type="text" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                        <td>
                            <input id="contractNo" type="text" readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carLine" /></th><!-- 차종 -->
                        <td>
                            <input id="carlineNm" class="form_input form_disabled" disabled>
                            <input id="carlineCd" name="carlineCd" data-json-obj="true" type="hidden"/>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                        <td>
                            <input id="modelNm" class="form_input form_disabled" disabled>
                            <input id="modelCd" name="modelCd" data-json-obj="true" type="hidden"/>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                        <td>
                            <input id="ocnNm" class="form_input form_disabled" disabled>
                            <input id="ocnCd" name="ocnCd" data-json-obj="true" type="hidden"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm" class="form_input onKey_up onKey_bulr" />
                                        <a href="javascript:bf_searchCustomer('cust', 'vCustNm');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm" name="custNm" type="hidden" data-json-obj="true" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custNo" name="custNo" readonly class="form_input form_readonly" data-json-obj="true" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                        <td>
                            <input id="aapEmpNm" name="aapEmpNm" type="text"  class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.cstAmt' /></th><!-- 원가 -->
                        <td>
                            <input id="cstAmt" name="cstAmt" onblur="bf_aapAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.profitAmt" /></th><!-- 수익 -->
                        <td>
                            <input id="profitAmt" name="profitAmt" onblur="bf_aapAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.total" /></th><!-- 합계 -->
                        <td>
                            <input id="aapAmt" name="aapAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_form mt10">
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
                        <th scope="row"><spring:message code='global.lbl.regDist' /> <spring:message code='global.lbl.sung' /></th><!-- 등록지 성 -->
                        <td>
                            <input id="sungCd" name="sungCd" type="text" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.cityCd' /></th><!-- 시 -->
                        <td>
                            <input id="cityCd" name="cityCd" type="text" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dist' /></th><!-- 구 -->
                        <td>
                            <input id="distCd" name="distCd" type="text" class="form_comboBox" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.regPreAmt' /></th>    <!-- 등록비 선수금 -->
                        <td>
                            <input id="regPreAmt" name="regPreAmt" onblur="bf_addRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.realRegAmt' /></th>         <!-- 실제등록비용 -->
                        <td>
                            <input id="realRegAmt" name="realRegAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.regExpcDt' /></th>         <!-- 등록예상일자 -->
                        <td>
                            <input id="regExpcDt" name="regExpcDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.purcTaxPreAmt' /></th>        <!-- 구입세 선수금 -->
                        <td>
                            <input id="purcTaxPreAmt" name="purcTaxPreAmt" onblur="bf_sumRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.realPurcTaxAmt' /></th>       <!-- 실제구입세 -->
                        <td>
                            <input id="realPurcTaxAmt" name="realPurcTaxAmt" onblur="bf_sumRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>     <!-- 차액 -->
                        <td>
                            <input id="regDifferenceAmt" readonly class="form_numeric form_readonly ar" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.regFeeAmt' /></th>          <!-- 등록수수료 -->
                        <td>
                            <input id="regFeeAmt" name="regFeeAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.aapRealRegDt' /></span></th>       <!-- 대행완료일자 -->
                        <td>
                            <input id="realRegDt" name="realRegDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- hidden값  -->
        <span style="display:none">
            <!-- 고객유형 -->
            <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

            <!-- 저장 조회 seq -->
            <input id="savedSeq" type="hidden" />
        </span>

        </form>
        <!-- //차량 상세정보 -->
    </section>
</section>
</div>

<!-- script -->
<script>
var oneDay = "${oneDay}";   // 해당월 1일
var lastDay = "${lastDay}"; // 해당월 마지막일자
var toDay = "${toDay}";     // 오늘 일자

//대행업무구분 Array
var sAapWrkDstinDS = [];
var aapWrkDstinDS = [];
<c:forEach var="obj" items="${aapWrkDstinCdList}">
    <c:if test="${obj.cmmCd ne '01'}">
        aapWrkDstinDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    sAapWrkDstinDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//대행업무 Map
var aapWrkDstinCdMap = dms.data.arrayToMap(sAapWrkDstinDS, function(obj){ return obj.cmmCd; });

// 성
var sungCdDs = [];
<c:forEach var="obj" items="${sungCdList}">
    sungCdDs.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>

$(document).ready(function() {

    $("#aapMngWindow").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세정보
        ,width:"950px"
        ,height:"285px"
    }).data("kendoWindow");

    //조회조건 - 대행업무구분
    $("#sAapWrkDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(sAapWrkDstinDS)
        ,optionLabel:" "
    });

    //조회조건 - 대행일(기간)- START
    $("#sStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 대행일(기간)- END
    $("#sEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    //$("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);
    //$("#sEndDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);

    /*************************** 검색 조건 영역 END **************************************************/


    //개별정보 - 대행업무구분
    $("#aapWrkDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:aapWrkDstinDS
        ,optionLabel:""
        ,enabled:false
    });

    //개별정보 - 대행일
    $("#aapDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 원가
    $("#cstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
     });

    // 수익
    $("#profitAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
     });

    // 합계
     $("#aapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
     });


    /**
     * 성 콤보박스
     */
    $("#sungCd").kendoExtDropDownList({
        dataTextField :"sungNm"
       ,dataValueField :"sungCd"
       ,dataSource :sungCdDs
       ,optionLabel:" "

       ,select :function(e){
           $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
            $("#cityCd").data("kendoExtDropDownList").enable(true);

            $("#distCd").data("kendoExtDropDownList").setDataSource([]);
            $("#distCd").data("kendoExtDropDownList").enable(false);

            var dataItem = this.dataItem(e.item);
            if(dms.string.strNvl(dataItem.sungCd) == ""){
                $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#cityCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/aap/aapMng/selectCity.do' />"
                ,data :JSON.stringify({"sungCd":dataItem.sungCd})
                ,async :false
            });
            $("#cityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 시 콤보박스
     */
    $("#cityCd").kendoExtDropDownList({
        dataTextField :"cityNm"
       ,dataValueField :"cityCd"
       ,optionLabel:" "
       ,select :function(e){
           $("#distCd").data("kendoExtDropDownList").setDataSource([]);
           $("#distCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dms.string.strNvl(dataItem.cityCd) == ""){
               $("#distCd").data("kendoExtDropDownList").setDataSource([]);
               $("#distCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/aap/aapMng/selectDist.do' />"
               ,data :JSON.stringify({"sungCd":$("#sungCd").data("kendoExtDropDownList").value(), "cityCd":dataItem.cityCd})
               ,async :false
           });
           $("#distCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

       }
    });
    $("#cityCd").data("kendoExtDropDownList").enable(false);

    /**
    * 구 콤보박스
    */
    $("#distCd").kendoExtDropDownList({
        dataTextField: "distNm"
       ,dataValueField:"distCd"
       ,optionLabel:" "
   });
   $("#distCd").data("kendoExtDropDownList").enable(false);


   // 등록비 선수금
   $("#regPreAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 실제등록비용
   $("#realRegAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 등록예상일자
   $("#regExpcDt").kendoExtMaskedDatePicker({
       format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 구입세 선수금
   $("#purcTaxPreAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
    });

   // 실제구입세
   $("#realPurcTaxAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
    });

   // 차액
    $("#regDifferenceAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
    });

   // 등록수수료
   $("#regFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
    });

   // 대행일자
   $("#realRegDt").kendoExtMaskedDatePicker({
       format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

  /*************************** 개별정보 영역 END **************************************************/

    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }

        }
        , enable:false
    })

    //초기화
    $("#btnReset").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();

            refreshAll();

            viewPopup();

        }
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                $("#sStartDt").focus();
                return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
                dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                $("#sEndDt").focus();
                return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
                dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sEndDt").focus();
                return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#vinNo").val()) && dms.string.isEmpty($("#contractNo").val()) ){
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            if ( dms.string.isEmpty( $("#aapWrkDstinCd").data("kendoExtDropDownList").value() )){
                dms.notification.warning("<spring:message code='global.lbl.proxyDstinTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#aapWrkDstinCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#aapDt").data("kendoExtMaskedDatePicker").value()) ){
                dms.notification.warning("<spring:message code='global.lbl.proxyDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#aapDt").focus();
                return false;
            }

            var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
            param.aapDt = $("#aapDt").data("kendoExtMaskedDatePicker").value();
            param.contractNo = $("#contractNo").val();
            param.aapWrkDstinCd = $("#aapWrkDstinCd").data("kendoExtDropDownList").value();
            param.aapAmt = $("#aapAmt").data("kendoExtNumericTextBox").value();

            param.sungCd = $("#sungCd").data("kendoExtDropDownList").value();
            param.cityCd = $("#cityCd").data("kendoExtDropDownList").value();
            param.distCd = $("#distCd").data("kendoExtDropDownList").value();

            param.regExpcDt = $("#regExpcDt").data("kendoExtMaskedDatePicker").value();
            param.realRegDt = $("#realRegDt").data("kendoExtMaskedDatePicker").value();

            $.ajax({
                url:"<c:url value='/sal/aap/aapMng/saveAapMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){

                    reSearch(data);             // 조회조건 세팅
                    $("#savedSeq").val(data);   // 저장된 key

                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                    $("#aapMngWindow").data("kendoWindow").close();

                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113301"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/aap/aapMng/selectAapMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStartDt"]  = $("#sStartDt").data("kendoExtMaskedDatePicker").value();          // 대행일 - 시작일
                        params["sEndDt"]    = $("#sEndDt").data("kendoExtMaskedDatePicker").value();            // 대행일 - 종료일
                        params["sVinNo"]    = $("#sVinNo").val();                                               // VIN NO
                        params["sCarRegNo"] = $("#sCarRegNo").val();                                            // 차량번호
                        params["sAapWrkDstinCd"]   = $("#sAapWrkDstinCd").data("kendoExtDropDownList").value();    // 대행업무구분
                        params["sAapEmpNm"] = $("#sAapEmpNm").val();                                            // 대행자

                        params["sSeq"]      = $("#savedSeq").val();
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    $("#savedSeq").val("");
                    refreshAll();
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         aapDt         :{type:"date"}
                        ,aapWrkDstinCd :{type:"string"}
                        ,contractNo    :{type:"string"}
                        ,vinNo         :{type:"string"}
                        ,carRegNo      :{type:"string"}
                        ,cstAmt        :{type:"number"}
                        ,profitAmt     :{type:"number"}
                        ,aapAmt        :{type:"number"}
                        ,carlineNm     :{type:"string"}
                        ,modelNm       :{type:"string"}
                        ,ocnCdNm       :{type:"string"}
                        ,aapEmpNm      :{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:true
        //,height:450
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
                    {field:"aapDt"       ,title:"<spring:message code = 'global.lbl.proxyDt'/>"         ,width:80  ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}    //대행일
                    ,{field:"aapWrkDstinCd",title:"<spring:message code = 'global.lbl.proxyDstinTp'/>"  ,width:80  ,attributes:{"class":"ac"}     //대행업무구분
                      ,template:"# if(aapWrkDstinCdMap[aapWrkDstinCd] != null) { # #= aapWrkDstinCdMap[aapWrkDstinCd].cmmCdNm# # }#"
                     }
                    ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:100}            //계약번호
                    ,{field:"vinNo"      ,title:"<spring:message code = 'global.lbl.vinNo'/>"           ,width:150   ,attributes:{"class":"ac"}}    //VIN NO
                    ,{field:"carRegNo"   ,title:"<spring:message code = 'global.lbl.carRegNo'/>"        ,width:130  ,attributes:{"class":"ac"}}    //차량번호
                    ,{field:"cstAmt"     ,title:"<spring:message code = 'global.lbl.cstAmt'/>"          ,width:100  ,attributes:{"class":"ar"}, format:"{0:##,###.0}"} //원가
                    ,{field:"profitAmt"  ,title:"<spring:message code = 'global.lbl.profitAmt'/>"       ,width:100  ,attributes:{"class":"ar"}, format:"{0:##,###.0}"} //수익
                    ,{field:"aapAmt"     ,title:"<spring:message code = 'global.lbl.total'/>"           ,width:100  ,attributes:{"class":"ar"}, format:"{0:##,###.0}"} //합계
                    ,{field:"carlineNm"  ,title:"<spring:message code = 'global.lbl.carLine'/>"         ,width:150  ,attributes:{"class":"al"}}    //차종
                    ,{field:"modelNm"    ,title:"<spring:message code = 'global.lbl.model'/>"           ,width:180  ,attributes:{"class":"al"}}    //모델
                    ,{field:"ocnNm"      ,title:"<spring:message code = 'global.lbl.ocn'/>"             ,width:180  ,attributes:{"class":"al"}}    //OCN
                    ,{field:"aapEmpNm"   ,title:"<spring:message code = 'global.lbl.proxyNm'/>"         ,width:100  ,attributes:{"class":"ac"}}    //대행자
                   ]
    });

     // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
     $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
         ;

         if ( dms.string.isNotEmpty(selectedItem) ){
             viewDetail(selectedItem);
         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }
     });

     // 상세조회 후 팝업오픈
     function viewDetail(selectedVal){

         if( dms.string.isNotEmpty(selectedVal) ){

             $("#aapDt").data("kendoExtMaskedDatePicker").value(selectedVal.aapDt);
             $("#aapDt").data("kendoExtMaskedDatePicker").enable(false);


             if(selectedVal.aapWrkDstinCd == "01"){              // 차량등록대행
                 $("#aapWrkDstinCd").data("kendoExtDropDownList").setDataSource(sAapWrkDstinDS);
                 $("#aapWrkDstinCd").data("kendoExtDropDownList").value(selectedVal.aapWrkDstinCd);
                 $("#aapWrkDstinCd").data("kendoExtDropDownList").enable(false);
             }else{
                 $("#aapWrkDstinCd").data("kendoExtDropDownList").value(selectedVal.aapWrkDstinCd);
                 $("#aapWrkDstinCd").data("kendoExtDropDownList").enable(true);
             }

             $("#seq").val(selectedVal.seq);
             $("#sVinNo2").val(selectedVal.vinNo);
             $("#vinNo").val(selectedVal.vinNo);
             $("#carRegNo").val(selectedVal.carRegNo);
             $("#contractNo").val(selectedVal.contractNo);

             if(dms.string.isNotEmpty(selectedVal.contractNo)){
                 $("#sVinNo2").attr("disabled", true);
             }else{
                 $("#sVinNo2").attr("disabled", false);
             }
             $("#carlineCd").val(selectedVal.carlineCd);
             $("#carlineNm").val(selectedVal.carlineNm);
             $("#modelCd").val(selectedVal.modelCd);
             $("#modelNm").val(selectedVal.modelNm);
             $("#ocnCd").val(selectedVal.ocnCd);
             $("#ocnNm").val(selectedVal.ocnNm);
             $("#vCustNm").val(selectedVal.custNm);
             $("#custNm").val(selectedVal.custNm);
             $("#custNo").val(selectedVal.custNo);
             $("#custTp").val(selectedVal.custTp);
             $("#aapEmpNm").val(selectedVal.aapEmpNm);
             $("#cstAmt").data("kendoExtNumericTextBox").value(selectedVal.cstAmt);
             $("#profitAmt").data("kendoExtNumericTextBox").value(selectedVal.profitAmt);
             $("#aapAmt").data("kendoExtNumericTextBox").value(selectedVal.aapAmt);

             $("#sungCd").data("kendoExtDropDownList").value(selectedVal.sungCd);

             if(selectedVal.cityCd != null &&  selectedVal.cityCd != ""){
                 var cityCd = $("#cityCd").data("kendoExtDropDownList");
                 cityCd.setDataSource([{"cityNm":selectedVal.cityNm, "cityCd":selectedVal.cityCd}]);
                 cityCd.value(selectedVal.cityCd);
                 cityCd.enable(false);
             }

             if(selectedVal.distCd != null &&  selectedVal.distCd != ""){
                 var distCd = $("#distCd").data("kendoExtDropDownList");
                 distCd.setDataSource([{"distNm":selectedVal.distNm, "distCd":selectedVal.distCd}]);
                 distCd.value(selectedVal.distCd);
                 distCd.enable(false);
             }

             $("#regPreAmt").data("kendoExtNumericTextBox").value(selectedVal.regPreAmt);
             $("#realRegAmt").data("kendoExtNumericTextBox").value(selectedVal.realRegAmt);
             $("#regExpcDt").data("kendoExtMaskedDatePicker").value(selectedVal.regExpcDt);
             $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(selectedVal.purcTaxPreAmt);
             $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(selectedVal.realPurcTaxAmt);
             bf_sumRegAmt();

             $("#regFeeAmt").data("kendoExtNumericTextBox").value(selectedVal.regFeeAmt);
             $("#realRegDt").data("kendoExtMaskedDatePicker").value(selectedVal.realRegDt);

             // 팝업오픈;
             viewPopup();

         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }
     }

});

// 초기화
function refreshAll() {

    $("#aapDt").data("kendoExtMaskedDatePicker").value(toDay);
    $("#aapDt").data("kendoExtMaskedDatePicker").enable(false);
    $("#aapWrkDstinCd").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(aapWrkDstinDS));
    $("#aapWrkDstinCd").data("kendoExtDropDownList").select(0);
    $("#aapWrkDstinCd").data("kendoExtDropDownList").enable(true);

    $("#seq").val("");
    $("#sVinNo2").val("");
    $("#sVinNo2").attr("disabled", false);
    $("#vinNo").val("");
    $("#carRegNo").val("");
    $("#contractNo").val("");
    $("#carlineCd").val("");
    $("#carlineNm").val("");
    $("#modelCd").val("");
    $("#modelNm").val("");
    $("#ocnCd").val("");
    $("#ocnNm").val("");
    $("#vCustNm").val("");
    $("#custNm").val("");
    $("#custNo").val("");
    $("#custTp").val("");
    $("#aapEmpNm").val("");
    $("#cstAmt").data("kendoExtNumericTextBox").value(0);
    $("#profitAmt").data("kendoExtNumericTextBox").value(0);
    $("#aapAmt").data("kendoExtNumericTextBox").value(0);

    $("#sungCd").data("kendoExtDropDownList").value("");

    var cityCd = $("#cityCd").data("kendoExtDropDownList");
    cityCd.setDataSource([]);
    cityCd.enable(false);
    cityCd.value('');

    var distCd = $("#distCd").data("kendoExtDropDownList");
    distCd.setDataSource([]);
    distCd.enable(false);
    distCd.value('');

    $("#regPreAmt").data("kendoExtNumericTextBox").value(0);
    $("#realRegAmt").data("kendoExtNumericTextBox").value(0);
    $("#regExpcDt").data("kendoExtMaskedDatePicker").value("");
    $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(0);
    $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(0);
    bf_sumRegAmt();

    $("#regFeeAmt").data("kendoExtNumericTextBox").value(0);
    $("#realRegDt").data("kendoExtMaskedDatePicker").value("");

    $("#savedSeq").val("");
}

function reSearch(seq){
    $("#sStartDt").data("kendoExtMaskedDatePicker").value("");          // 대행일 - 시작일
    $("#sEndDt").data("kendoExtMaskedDatePicker").value("");            // 대행일 - 종료일
    $("#sVinNo").val("");                                               // VIN NO
    $("#sCarRegNo").val("");                                            // 차량번호
    $("#sAapWrkDstinCd").data("kendoExtDropDownList").value("");    // 대행업무구분
    $("#sAapEmpNm").val("");                                            // 대행자
    $("#savedSeq").val(seq);
}

$("#sVinNo2").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchVinNo();
        }
    }
});

//번호판 차익계산
bf_sumRegAmt = function(){
    var purcTaxPreAmt  = $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value();
    var realPurcTaxAmt = $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value();

    if(purcTaxPreAmt == null){
        purcTaxPreAmt = 0;
        $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(0);
    }

    if(realPurcTaxAmt == null){
        realPurcTaxAmt = 0;
        $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(0);
    }

    $("#regDifferenceAmt").data("kendoExtNumericTextBox").value( purcTaxPreAmt - realPurcTaxAmt );
}


// 원가/수익 합계 계산
bf_aapAmt = function(){
    var cstAmt  = $("#cstAmt").data("kendoExtNumericTextBox").value();
    var profitAmt = $("#profitAmt").data("kendoExtNumericTextBox").value();

    if(cstAmt == null){
        cstAmt = 0;
        $("#cstAmt").data("kendoExtNumericTextBox").value(0);
    }

    if(profitAmt == null){
        profitAmt = 0;
        $("#profitAmt").data("kendoExtNumericTextBox").value(0);
    }

    $("#aapAmt").data("kendoExtNumericTextBox").value( cstAmt - profitAmt );

}


//vin 조회
bf_searchVinNo = function(){
    if( dms.string.isNotEmpty($("#contractNo").val()) ){ return ;}

    popupWindow = dms.window.popup({
        windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
        ,title:"<spring:message code='global.title.vehicleMaster' />"
        ,content:{
            url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
            ,data:{
                "type"  :null
                ,"autoBind":true
                ,"dataInfo" : {"vinNo":$("#sVinNo2").val() }
                ,"callbackFunc":function(data){
                    $("#vinNo").val(data[0].vinNo);
                    $("#sVinNo2").val(data[0].vinNo);

                    $("#carRegNo").val(data[0].carRegNo);
                    $("#carlineNm").val(data[0].carlineNm);
                    $("#carlineCd").val(data[0].carlineCd);
                    $("#modelNm").val(data[0].modelNm);
                    $("#modelCd").val(data[0].modelCd);
                    $("#ocnNm").val(data[0].ocnNm);
                    $("#ocnCd").val(data[0].ocnCd);
                }
            }
        }
    });
}

// 고객명
$(".onKey_bulr").blur(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId != ""){
        cleanCustCheck(cId);
    }
});

$(".onKey_up").keyup(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId == ""){
        return ;
    }

    if (e.keyCode == 13) {
        if($(this).val() != "") {
            searchCustEnter(cId);
        }
    }else{
        cleanCustCheck(cId);
    }
});

// 고객명 Enter로 검색
function searchCustEnter(cId){
    var key = "";
    if(cId == "vsCustNm"){
        key = 'search';
    }else if(cId == "vCustNm"){
        key = 'cust';
    }

    bf_searchCustomer(key, cId);
}

//고객명 변경시 고객정보 clean
function cleanCustCheck(cId){
    if(cId == "vsCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#sCustNm").val()) ){
            $("#sCustNo").val('');
            $("#sCustNm").val('');
        }
    }else if(cId == "vCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm").val()) ){
            $("#custNo").val('');       // 고객코드
            $("#custTp").val('');
            $("#custNm").val('');

        }
    }
}


//CRM 고객 데이터 조회
bf_searchCustomer = function(obCd, sIdNm){
    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        //, draggable:false
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":$("#"+sIdNm).val()
                , "closeYn":"Y"
                , "type":null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        // 계약고객
                        if(obCd == 'cust'){
                            $("#custNo").val(data[0].custNo);       // 고객코드
                            $("#custTp").val(data[0].custTp);       // 고객유형
                            $("#custNm").val(data[0].custNm);       // 고객명
                            $("#vCustNm").val(data[0].custNm);      // 고객명
                        }
                        else{
                            $("#sCustNo").val(data[0].custNo);       // 고객코드
                            $("#sCustNm").val(data[0].custNm);       // 고객명
                            $("#vsCustNm").val(data[0].custNm);      // 고객명
                        }
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

fnOnfocus = function(id){
    $("#"+ id +" ").select();
}

//팝업 오픈
function viewPopup(){
    var win = $("#aapMngWindow").data("kendoWindow");
    win.center();
    win.open();
}

</script>
<!-- //script -->
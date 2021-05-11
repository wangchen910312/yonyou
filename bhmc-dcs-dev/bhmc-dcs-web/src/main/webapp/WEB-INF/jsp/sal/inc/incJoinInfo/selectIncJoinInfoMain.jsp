<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 보험가입정보관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.incJoinInfoMng" /></h1><!-- 보험가입정보 -->
        <div class="btn_right">
            <button class="btn_m btn_reset" id="btnReset"><spring:message code='global.btn.new' /></button><!-- 신규 -->
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.incJoinDt' /></th><!-- 보험가입일 -->
                    <td cosplan="3">
                        <div class="date_left">
                            <input id="sIncJoinStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sIncJoinEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 -->
                    <td >
                        <input id="sSaleId" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNo" /></th><!-- VIN NO -->
                    <td class="required_area">
                        <!-- <input id="sVinNo1" type="text" class="form_input" style="width:44%;"/>
                        <input id="sVinNo2" type="text" class="form_input" style="width:44%;"/> -->
                        <input id="sVinNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.incCmp' /></th><!-- 보험회사 -->
                    <td >
                        <input id="sIncCmpCd" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carSaleDt' /></th><!-- 차량판매일 -->
                    <td cosplan="3">
                        <div class="date_left">
                            <input id="sCarSaleStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sCarSaleEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sCustNm" name="sCustNm" type="text" class="form_input onKey_down" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                    <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sCustNo" type="text" readonly class="form_input form_readonly">
                            </div>
                       </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                    <td >
                        <input id="sContractNo" type="text" class="form_input" />
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




    <section id="incJoinWindow" class="pop_wrap">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.lbl.carLineInfo' /></h2><!-- 차량정보 -->
                <div class="btn_right">
                    <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </div>
            </div>
                <div id="viewIncInfo">
                <form id="incDetailForm" name="incDetailForm" method="POST" action="/">
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:14%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <div class="form_search">
                                                <input id="custNm" name="custNm" type="text" class="form_input onKey_down" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                                <a href="#;" class="custDtlSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                            </div>
                                        </div>
                                        <div class="form_right">
                                            <input id="custNo" name="custNo" readonly class="form_input form_readonly" data-bind="value:custNo" data-json-obj="true"/>
                                        </div>
                                   </div>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custTp' /></th><!-- 고객유형 -->
                                <td>
                                    <input id="custTp" name="custTp" class="form_comboBox" data-bind="value:custTp" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.custTelNo' /></th><!-- 고객전화번호 -->
                                <td>
                                    <input id="custTelNo" name="custTelNo" readonly class="form_input form_readonly" data-bind="value:custTelNo" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                                <td>
                                    <input id="carlineNm" name="carlineNm" readonly class="form_input form_readonly" data-bind="value:carlineNm"/>
                                    <input id="carlineCd" name="carlineCd" type="hidden" data-bind="value:carlineCd" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                <td>
                                    <input id="modelNm" name="modelNm" type="text"  class="form_input form_readonly" data-bind="value:modelNm"/>
                                    <input id="modelCd" name="modelCd" type="hidden" data-bind="value:modelCd" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                                <td>
                                    <input id="ocnNm" name="ocnNm" type="text" class="form_input form_readonly" data-bind="value:ocnNm" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                                <td>
                                    <input id="extColorNm" name="extColorNm" readonly class="form_input form_readonly" data-bind="value:extColorNm"/>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.intColor' /></th> <!-- 내장색 -->
                                <td>
                                    <input id="intColorNm" name="intColorNm" readonly class="form_input form_readonly" data-bind="value:intColorNm"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                                <td>
                                    <input id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-bind="value:vinNo" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                                <td>
                                    <input id="carRegNo" name="carRegNo" readonly class="form_input form_readonly" data-bind="value:carRegNo" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.engineNo' /></th><!-- 엔진번호 -->
                                <td>
                                    <input id="enginSerialNo" name="enginSerialNo" readonly class="form_input form_readonly" data-bind="value:enginSerialNo" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.cartNo' /></th><!-- 합격증 -->
                                <td>
                                    <input id="cartNo" name="cartNo" readonly class="form_input form_readonly" data-bind="value:cartNo" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                                <td>
                                    <input id="contractNo"  name="contractNo" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            <!-- //차량정보 탭 영역 -->


            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.title.incReqInfo' /></h2><!-- 보험신청내용 -->
            </div>

            <!-- 보험신청정보 탭 영역 -->
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:14%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.incNo' /></th><!-- 보험번호 -->
                                <td>
                                    <input id="incNo" name="incNo" readonly class="form_input form_readonly" data-bind="value:incNo" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incRcptNm' /></th><!-- 保险开票名称 -->
                                <td>
                                    <input id="incRcptNm" name="incRcptNm" class="form_input" data-bind="value:incRcptNm" data-json-obj="true">
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.insured' /></th><!-- 被保险人 -->
                                <td>
                                    <input id="custNo1" name="custNo1" class="form_input" >
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.custSsnCrnNo' /></th><!-- 被保险人身份证号码/组织机构代码 -->
                                <td >
                                    <input id="custSsnCrnNo" name="custSsnCrnNo" class="form_input" data-bind="value:custSsnCrnNo" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incTelNo' /></th><!-- 被保险人电话 -->
                                <td >
                                    <input id="incTelNo" name="incTelNo" class="form_input" >
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incProfitNm' /></th><!-- 第一受益人 -->
                                <td >
                                    <input id="incProfitNm" name="incProfitNm" class="form_input" data-bind="value:incProfitNm" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.incCmp' /></th><!-- 保险公司 -->
                                <td>
                                    <input id="incCmpCd" name="incCmpCd" class="form_comboBox" data-bind="value:incCmpCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.incJoinDt' /></th><!-- 投保日期 -->
                                <td>
                                    <input id="incJoinDt" name="incJoinDt" disabled class="form_datepicker form_disabled" data-bind="value:incJoinDt">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incPerson' /></th><!-- 보험담당자 -->
                                <td >
                                    <input id="incPrsnId" name="incPrsnId" class="form_input" data-bind="value:incPrsnId" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.cmcIncNo' /></th><!-- 商业保险单号 -->
                                <td >
                                    <input id="cmcIncNo" name="cmcIncNo" class="form_input" data-bind="value:cmcIncNo" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.dutyIncNo' /></th><!-- 强制保险单号 -->
                                <td >
                                    <input id="dutyIncNo" name="dutyIncNo" class="form_input" data-bind="value:dutyIncNo" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            <!-- //보험신청정보 탭 영역 -->
            </form>
            </div>



            <!-- 보험신청명세 탭 영역 -->
<!--             <div class="header_area">
                <h2 class="title_basic">保险申请明细</h2>보험신청명세
            </div> -->

            <div class="header_area">
                <div class="left_area" >
                    <ul class="txt_input">
                        <li>
                            <span class="span_bg" ><spring:message code='sal.lbl.incExpcTotAmt' /></span> <!-- 保险预计总额 -->
                            <input id="incExpcTotAmt" name="incExpcTotAmt" class="form_numeric" style="width:120px" data-bind="value:incExpcTotAmt" />
                        </li>
                        <li>
                            <span class="span_bg" ><spring:message code='sal.lbl.incFeeAmt' /></span> <!-- 保险手续费 -->
                            <input id="incFeeTotAmt" name="incFeeTotAmt" class="form_numeric" style="width:120px" data-bind="value:incExpcTotAmt" />
                        </li>
                        <li>
                            <span class="span_bg" ><spring:message code='sal.lbl.realIncTotAmt' /></span> <!-- 保险实际总额 -->
                            <input id="realIncTotAmt" name="realIncTotAmt" class="form_numeric" style="width:120px" data-bind="value:incExpcTotAmt" />
                        </li>
                    </ul>
                </div>
                <div class="btn_right">
                    <button class="btn_s btn_add" id="btnIncDtlAdd"><spring:message code='global.btn.rowAdd' /></button>     <!-- 행추가 -->
                    <button class="btn_s btn_add" id="btnIncDtlDel"><spring:message code='global.btn.rowDel' /></button>     <!-- 행삭제 -->
                    <button class="btn_s btn_cancel" id="btnIncDtlCancel"><spring:message code='global.btn.cancel' /></button>    <!-- 취소 -->
                </div>
            </div>
            <div class="table_grid mt10">
                <div id="incDtlGrid" class="grid"></div>
            </div>
            <!-- 보험신청명세 탭 영역  -->
    </section>
</section>
</div>


<!-- script -->
<script>
var dlrCd = "${dlrCd}";                 // 딜러코드
var oneDay = "${oneDay}";               // 당월 1일
var toDay = "${toDay}";                 // 오늘 일자
var nextYearDay = "${nextYearDay}";     // 내년 오늘일자
var selectTabId;
var carSaleDt;
var incNo;
var resetVal = false;



//보험회사 Array
var incCmpCd = [];
<c:forEach var="obj" items="${incCmpCdList}">
    incCmpCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var incCmpCdMap = dms.data.arrayToMap(incCmpCd, function(obj){ return obj.cmmCd; });


//보험종류(대행구분) Array
var regTp = [];
<c:forEach var="obj" items="${regTpList}">
    regTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험종류(대행구분) Map
var regTpMap = dms.data.arrayToMap(regTp, function(obj){ return obj.cmmCd; });


//보험유형 Array
var incTpDs = [];
<c:forEach var="obj" items="${incTpList}">
    incTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험유형 Map
var incTpMap = dms.data.arrayToMap(incTpDs, function(obj){ return obj.cmmCd; });



//고객유형 Array
var custTpDs = [];
<c:forEach var="obj" items="${custTpList}">
    custTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험유형 Map
var custTpMap = dms.data.arrayToMap(custTpDs, function(obj){ return obj.cmmCd; });


$(document).ready(function() {
    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

     $("#incJoinWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세조회
         ,width:"950px"
         ,height:"500px"
     }).data("kendoWindow");




     //보험회사
     $("#sIncCmpCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:incCmpCd
         ,optionLabel:" "   // 전체
     });


    //조회조건 - 보험가입일자(기간)- START
    $("#sIncJoinStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 보험가입일자(기간)- END
    $("#sIncJoinEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    // 조회조건 - [보험가입일자]validation check
    $("#sIncJoinStartDt").on('change', {from:$("#sIncJoinStartDt"), to:$("#sIncJoinEndDt")}, fnChkSearchDate);
    $("#sIncJoinEndDt").on('change',   {from:$("#sIncJoinStartDt"), to:$("#sIncJoinEndDt")}, fnChkSearchDate);




    //조회조건  - 차량판매일(기간)- START
    $("#sCarSaleStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 차량판매일(기간)- END
    $("#sCarSaleEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    // 조회조건 - [차량판매일]validation check
    $("#sCarSaleStartDt").on('change', {from:$("#sCarSaleStartDt"), to:$("#sCarSaleEndDt")}, fnChkSearchDate);
    $("#sCarSaleEndDt").on('change',   {from:$("#sCarSaleStartDt"), to:$("#sCarSaleEndDt")}, fnChkSearchDate);



    /*************************** 검색 조건 영역 END **************************************************/

    //보험가입일자
    $("#incJoinDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });


    //차량번호등록일자
    $("#carRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //차량판매일자
    $("#carSaleDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });



    //보험회사
    $("#incCmpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:incCmpCd
        ,optionLabel:" "   // 전체
    });


    //고객유형
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:custTpDs
        ,optionLabel:" "
    });
    $("#custTp").data("kendoExtDropDownList").enable(false);


    //계약번호
    $("#contractNo").kendoExtDropDownList({
        dataTextField:"contractNo"
        ,dataValueField:"contractNo"
        ,dataSource:""
        ,optionLabel:""   // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);
            $("#contractNo").data("kendoExtDropDownList").value(dataItem.contractNo);
            if(custTpMap[dataItem.custTp] != null){
                $("#custTp").data("kendoExtDropDownList").value(dataItem.custTp);
            }else{
                $("#custTp").data("kendoExtDropDownList").value("");
            }
            $("#custTelNo").val(dataItem.custTelNo);
            $("#vinNo").val(dataItem.vinNo);
            $("#carlineCd").val(dataItem.carlineCd);
            $("#carlineNm").val(dataItem.carlineNm);
            $("#modelCd").val(dataItem.modelCd);
            $("#modelNm").val(dataItem.modelNm);
            $("#ocnNm").val(dataItem.ocnNm);
            $("#extColorNm").val(dataItem.extColorNm);
            $("#intColorNm").val(dataItem.intColorNm);
            $("#enginSerialNo").val(dataItem.enginSerialNo);
            $("#cartNo").val(dataItem.cartNo);
            $("#carRegNo").val(dataItem.carRegNo);
        }
    });




    //保险预计总额
    $("#incExpcTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });


    //保险手续费
    $("#incFeeTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });


    //保险实际总额
    $("#realIncTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });


    $("#incExpcTotAmt").data("kendoExtNumericTextBox").enable(false);
    $("#realIncTotAmt").data("kendoExtNumericTextBox").enable(false);


    /*************************** 보험정보 영역 END **************************************************/
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


    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
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
             // 팝업오픈;
             viewPopup();


             $.ajax({
                 url:"<c:url value='/sal/inc/incJoinInfo/selectIncDetail.do' />",
                 data:JSON.stringify({sDlrCd:selectedVal.dlrCd, sIncNo:selectedVal.incNo}),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }

             }).done(function(result) {
                 var incDetailDs = result["incDetailDs"];
                 kendo.bind($("#viewIncInfo"), incDetailDs);

                 $("#incExpcTotAmt").data("kendoExtNumericTextBox").value(incDetailDs.incExpcTotAmt);
                 $("#incFeeTotAmt").data("kendoExtNumericTextBox").value(incDetailDs.incFeeTotAmt);
                 $("#realIncTotAmt").data("kendoExtNumericTextBox").value(incDetailDs.realIncTotAmt);
                 $("#contractNo").data("kendoExtDropDownList").setDataSource([{"contractNo":incDetailDs.contractNo, "contractNo":incDetailDs.contractNo}]);        //계약번호 dataSet
                 $("#contractNo").data("kendoExtDropDownList").value(incDetailDs.contractNo);
                 $("#contractNo").data("kendoExtDropDownList").enable(false);
                 //$("#custNo").prop("disabled","disabled").addClass("form_disabled");
                 $("#custSearch").prop("disabled","disabled").addClass("form_disabled");

                 $("#incDtlGrid").data("kendoExtGrid").dataSource.read();
             });


         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }


     }




    //초기화
    $("#btnReset").kendoButton({
        click:function(e){

            viewPopup();

            fnReset();
            var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();
        }

    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            fnReset();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });




    //보험신청명세 - 추가
    $("#btnIncDtlAdd").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var selectRow = grid.dataItem(grid.select());

            if(grid.select().index() == -1){
                var incDtlGrid = $("#incDtlGrid").data("kendoExtGrid");
                incDtlGrid.dataSource.insert(0, {
                     "dlrCd":""
                    ,"incNo":""
                    ,"incTp":""
                });
            }else {
                var incDtlGrid = $("#incDtlGrid").data("kendoExtGrid");
                incDtlGrid.dataSource.insert(0, {
                     "dlrCd":selectRow.dlrCd
                    ,"incNo":selectRow.incNo
                    ,"incTp":""
                });
            }
        }
    });


    // 보험신청명세 - 행삭제
    $("#btnIncDtlDel").kendoButton({
        click:function(e) {
            var incDtlGrid = $("#incDtlGrid").data("kendoExtGrid");
            var rows = incDtlGrid.select();

            rows.each(function(index, row) {
                incDtlGrid.removeRow(row);
            });
        }
    });

    // 보험신청명세 - 취소
    $("#btnIncDtlCancel").kendoButton({
        click:function(e) {
            $('#incDtlGrid').data('kendoExtGrid').cancelChanges();
        }
    });




    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {


/*             //차종
            if ( dms.string.isEmpty($("#carlineCd").val()) ){
                dms.notification.warning("보험차량이 존재하지 않습니다.");
                return false;
            }

            //피보험자
            if ( dms.string.isEmpty($("#custNo1").val()) ){
                dms.notification.warning("피보험자명을 입력해주세요.");
                return false;
            }


            //보험수익자명
            if ( dms.string.isEmpty($("#incProfitNm").val()) ){
                dms.notification.warning("보험수익자명을 입력해주세요.");
                return false;
            } */



            // 저장하시겠습니까?
            if (confirm("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.andMsg' arguments='${save},' />") == false ){
                return false;
            }

            var grid = $("#grid").data('kendoExtGrid');
            var selectRow = grid.dataItem(grid.select());

            if(grid.select().index() == -1){
                dlrCd = dlrCd;
                incNo = "";
            }else {
                dlrCd = selectRow.dlrCd;
                incNo = selectRow.incNo;
            }

            var incDtlGrid = $("#incDtlGrid").data("kendoExtGrid");
            var saveData = incDtlGrid.getCUDData("insertList", "updateList", "deleteList");

            // form 데이터 및 그리드 변경 데이터 세팅
            var param = $.extend(
               {"incJoinInfoVO":$("#incDetailForm").serializeObject($("#incDetailForm").serializeArrayInSelector("[data-json-obj='true']"))}
               ,{"incDtlVO":saveData}
            );
            param.incJoinInfoVO.incJoinDt = $("#incJoinDt").data("kendoExtMaskedDatePicker").value();
            param.incJoinInfoVO.dlrCd = dlrCd;
            param.incJoinInfoVO.incNo = incNo;
            param.incJoinInfoVO.incExpcTotAmt = $("#incExpcTotAmt").val();
            param.incJoinInfoVO.incFeeTotAmt = $("#incFeeTotAmt").val();
            param.incJoinInfoVO.realIncTotAmt = $("#realIncTotAmt").val();
            param.incJoinInfoVO.contractNo = $("#contractNo").data("kendoExtDropDownList").value();
            param.incJoinInfoVO.custTp = $("#custTp").data("kendoExtDropDownList").value();

            $.ajax({
                url:"<c:url value='/sal/inc/incJoinInfo/multiSaveIncJoinInfo.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(request,status,error){
                    alert(request.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result) {
                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#incJoinWindow").data("kendoWindow").close();
                //수정이 완료되었습니다.
                dms.notification.success("<spring:message code='global.btn.update' var='update' /><spring:message code='global.info.successMsg' arguments='${update},' />");
            });
        }
    });


    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113901"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/inc/incJoinInfo/selectIncJoinInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sIncJoinStartDt"]= $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value();    // 보험가입일(기간) - 시작일
                        params["sIncJoinEndDt"]  = $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value();      // 보험가입일(기간) - 종료일
                        params["sCarSaleStartDt"]= $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value();    // 차량판매일(기간) - 시작일
                        params["sCarSaleEndDt"]  = $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value();      // 차량판매일(기간) - 종료일
                        params["sVinNo"]         = $("#sVinNo").val();
                        params["sCustNo"]        = $("#sCustNo").val();                                               // 고객
                        params["sContractNo"]    = $("#sContractNo").val();                                           // 계약번호

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"incPk"
                    ,fields:{
                         incPk    :{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelNm  :{type:"string"}
                        ,vinNo    :{type:"string"}
                        ,incCmpCd :{type:"string"}
                        ,incFeeTotAmt:{type:"number"}
                        ,realIncTotAmt:{type:"number"}
                        ,incExpcTotAtm:{type:"number"}
                        ,incNo    :{type:"string"}
                        ,incJoinDt:{type:"date"}
                        ,saleId   :{type:"string"}
                        ,carRegDt :{type:"date"}
                        ,incPrsnNm:{type:"string"}
                        ,carRegNo :{type:"string"}
                        ,contractNo :{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        //,height  :460
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var incNo = selectedVal.incNo;

                if ( dms.string.isNotEmpty(incNo) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);
                }


            };
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                     {field:"custNo"
                       ,title:"<spring:message code='global.lbl.icnCustNo' />"
                       ,width:130 ,attributes:{"class":"ac"}
                     } //가입자번호
                    ,{field:"custNm"
                       ,title:"<spring:message code='sal.lbl.incCustNm' />"
                       ,width:100
                       ,attributes:{"class":"ac"}
                     } //가입자명
                    ,{field:"custTelNo"
                         ,title:"<spring:message code='sal.lbl.incCustTelNo' />"
                         ,width:100
                         ,attributes:{"class":"al"}
                     } //가입자연락처
                    ,{field:"carlineNm"
                       ,title:"<spring:message code = 'global.lbl.carLine'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //차종
                    ,{field:"modelNm"
                       ,title:"<spring:message code = 'global.lbl.model'/>"
                       ,width:120
                       ,attributes:{"class":"al"}
                     } //모델
                    ,{field:"vinNo"
                       ,title:"<spring:message code = 'global.lbl.vinNum'/>"
                       ,width:140
                       ,attributes:{"class":"ac"}
                     } //VIN NO
                    ,{field:"contractNo"
                       ,title:"<spring:message code = 'global.lbl.contractNo'/>"
                       ,width:110
                       ,attributes:{"class":"ac"}
                     } //계약번호
                    ,{field:"incCmpCd"
                       ,title:"<spring:message code = 'global.lbl.incCmp'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,template:"# if(incCmpCdMap[incCmpCd] != null) { # #= incCmpCdMap[incCmpCd].cmmCdNm# # }#"
                     } //보험회사
                    ,{field:"incNo"
                       ,title:"<spring:message code = 'global.lbl.incNo'/>"
                       ,width:120
                       ,attributes:{"class":"ac"}
                     } //보험번호
                    ,{field:"incExpcTotAmt"
                       ,title:"<spring:message code = 'sal.lbl.incExpcAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:##,###.0}"
                     } //예상금액
                    ,{field:"realIncTotAmt"
                       ,title:"<spring:message code = 'sal.lbl.realIncAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:##,###.0}"
                     } //실보험금액
                    ,{field:"incFeeTotAmt"
                       ,title:"<spring:message code = 'ser.lbl.incFeeAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:##,###.0}"
                     } //보험수수료
                    ,{field:"saleId"
                       ,title:"<spring:message code = 'sal.lbl.salesAdvisor'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //판매고문
                    ,{field:"incJoinDt"
                       ,title:"<spring:message code = 'global.lbl.incJoinDt'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                     } //보험가입일
                  ,{field:"incPrsnId"
                       ,title:"<spring:message code = 'sal.lbl.incPerson'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                    } //보험담당자
                   ,{field:"incProfitNm"
                       ,title:"<spring:message code = 'sal.lbl.incProfitNm'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                    } //보험수익자명
                   ]
    });




    //그리드 설정
    $("#incDtlGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113902"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/inc/incJoinInfo/selectIncDetailItem.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var grid = $("#grid").data('kendoExtGrid');
                        var selectRow = grid.dataItem(grid.select());

                        params["sDlrCd"] = selectRow.dlrCd;             //딜러코드
                        params["sIncNo"] = selectRow.incNo;             //보험번호
                        params["sCustNo"] = selectRow.custNo;           //고객번호

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"incPk"
                    ,fields:{
                         incPk     :{type:"string"}
                        ,dlrCd     :{type:"string"}
                        ,incNo     :{type:"string"}
                        ,incTp     :{type:"string"}
                        ,incExpcAmt:{type:"number"}
                        ,realIncAmt:{type:"number"}
                        ,incPrid   :{type:"number"}
                        ,incStartDt:{type:"date"}
                        ,incEndDt  :{type:"date"}
                        ,incAmt    :{type:"number"}
                        ,remark    :{type:"string"}
                        ,regDt     :{type:"date"}
                        ,updtDt    :{type:"date"}
                    }
                }
            }
        }
        ,autoBind:false
        ,height  :138
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["incExpcAmt","realIncAmt","incPrid","incStartDt","incEndDt","incAmt","remark"]
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,pageable:false
        ,sortable:false
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");


            if(fieldName == "incExpcAmt"){
                input.blur(function(){
                    bf_gridSumGoodsAmt("incExpcAmt");
                });
            }else if(fieldName == "realIncAmt"){
                input.blur(function(){
                    bf_gridSumGoodsAmt("realIncAmt");
                });
            }
        }
        ,columns:[
                     {field:"incTp",title:"<spring:message code = 'sal.lbl.incTp'/>", width:120,attributes:{"class":"al"}
                         ,template:"# if(incTpMap[incTp] != null) { # #= incTpMap[incTp].cmmCdNm# # }#"
                         ,editor:function(container, options) {
                            $('<input required name="incTp" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                 autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:incTpDs
                             });
                             $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
                         }
                    }//保险类型
                    ,{field:"incExpcAmt",title:"<spring:message code = 'sal.lbl.incExpcAmt'/>",width:100,attributes:{"class":"ar"},format:"{0:n2}"} //保险费用
                    ,{field:"realIncAmt",title:"<spring:message code = 'sal.lbl.realIncAmt'/>",width:100,attributes:{"class":"ar"},format:"{0:n2}"} //实际保险费用
                    ,{field:"incPrid",title:"<spring:message code = 'sal.lbl.incPrid'/>",width:100,attributes:{"class":"ar"},format:"{0:n2}"} //期数(月)
                    ,{field:"incStartDt",title:"<spring:message code = 'sal.lbl.incStartDt'/>",width:120,attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                        ,editor:function (container, options){
                            $('<input required name="incStartDt" id="incStartDt" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtMaskedDatePicker({
                                format:"<dms:configValue code='dateFormat' />"
                                ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                             });
                             $('<span class="k-invalid-msg" data-for="incStartDt"></span>').appendTo(container);
                          }
                      } //起始时间
                     ,{field:"incEndDt",title:"<spring:message code = 'sal.lbl.deadlineTime'/>",width:120,attributes:{"class":"ac"}
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                         ,editor:function (container, options){
                             $('<input required name="incEndDt" id="incEndDt" data-bind="value:' + options.field + '"/>')
                             .appendTo(container)
                             .kendoExtMaskedDatePicker({
                                 format:"<dms:configValue code='dateFormat' />"
                                 ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                             });
                             $('<span class="k-invalid-msg" data-for="incEndDt"></span>').appendTo(container);
                         }
                     } //截止时间
                    ,{field:"incAmt",title:"<spring:message code = 'sal.lbl.incAmountAmt'/>",width:100,attributes:{"class":"ar"},format:"{0:n2}"} //保额
                    ,{field:"remark",title:"<spring:message code = 'sal.lbl.remark'/>",width:100,attributes:{"class":"al"}} //备注
                   ]
    });



    bf_gridSumGoodsAmt = function(gubun){
         var grid = $("#incDtlGrid").data("kendoExtGrid");
         var rows = grid.tbody.find("tr");
         var oItem;
         var oIncExpcAmt = 0;
         var oRealIncAmt = 0;


         rows.each(function(index, row) {
             oItem = grid.dataItem(rows[index]);

             if(gubun == "incExpcAmt"){
                 if(oItem.incExpcAmt != null){
                     oIncExpcAmt +=  Number(oItem.incExpcAmt);
                 }
             }else if(gubun == "realIncAmt"){
                 if(oItem.realIncAmt != null){
                     oRealIncAmt +=  Number(oItem.realIncAmt);
                 }
             }

         });

         if(gubun == "incExpcAmt"){
             $("#incExpcTotAmt").data("kendoExtNumericTextBox").value(oIncExpcAmt);
         }else if(gubun == "realIncAmt"){
             $("#realIncTotAmt").data("kendoExtNumericTextBox").value(oRealIncAmt);
         }

    }

});



//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}


var popupWindow;

//고객 팝업 열기 함수.
function selectBpPopupWindow(gb){

    popupWindow = dms.window.popup({
      windowId:"bpCdPopup"
      ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
      ,width:800
      ,height:500
      ,content:{
          url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
          ,data:{
              "type":"custom1"
              ,"autoBind":true
              ,"callbackFunc":function(data){
                  if(gb == 'sCustNo'){
                      $("#sCustNo").val(data[0].custNo);
                      $("#sCustNm").val(data[0].custNm);
                  }else {
                      $("#custNo").val(data[0].custNo);
                      $("#custNm").val(data[0].custNm);



                      var responseJson = dms.ajax.getJson({
                          url:"<c:url value='/sal/inc/incJoinInfo/selectCustContractNo.do' />"
                          ,data:JSON.stringify({sCustNo:data[0].custNo})
                          ,async:false
                      });
                      //if(responseJson.total != 0){
                          if(responseJson.total == 1){
                              $("#contractNo").data("kendoExtDropDownList").setDataSource(responseJson.data);
                              $("#contractNo").data("kendoExtDropDownList").value(responseJson.data[0].contractNo);
                              $("#contractNo").data("kendoExtDropDownList").enable(false);
                              if(custTpMap[responseJson.data[0].custTp] != null){
                                  $("#custTp").data("kendoExtDropDownList").value(responseJson.data[0].custTp);
                              }else{
                                  $("#custTp").data("kendoExtDropDownList").value("");
                              }
                              $("#vinNo").val(responseJson.data[0].vinNo);
                              $("#carlineCd").val(responseJson.data[0].carlineCd);
                              $("#carlineNm").val(responseJson.data[0].carlineNm);
                              $("#modelCd").val(responseJson.data[0].modelCd);
                              $("#modelNm").val(responseJson.data[0].modelNm);
                              $("#ocnNm").val(responseJson.data[0].ocnNm);
                              $("#extColorNm").val(responseJson.data[0].extColorNm);
                              $("#intColorNm").val(responseJson.data[0].intColorNm);
                              $("#enginSerialNo").val(responseJson.data[0].enginSerialNo);
                              $("#cartNo").val(responseJson.data[0].cartNo);
                              $("#carRegNo").val(responseJson.data[0].carRegNo);
                              $("#custTelNo").val(responseJson.data[0].custTelNo);
                          }else{
                              if(responseJson.total == 0){
                                  $("#contractNo").data("kendoExtDropDownList").enable(false);
                                  $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);
                                  $("#custTelNo").val(data[0].hpNo);
                              }else {
                                  $("#contractNo").data("kendoExtDropDownList").enable(true);
                                  $("#contractNo").data("kendoExtDropDownList").setDataSource(responseJson.data);

                                  $("#custTp").data("kendoExtDropDownList").value("");
                                  $("#vinNo").val("");
                                  $("#carlineCd").val("");
                                  $("#carlineNm").val("");
                                  $("#modelCd").val("");
                                  $("#modelNm").val("");
                                  $("#ocnNm").val("");
                                  $("#extColorNm").val("");
                                  $("#intColorNm").val("");
                                  $("#enginSerialNo").val("");
                                  $("#cartNo").val("");
                                  $("#carRegNo").val("");
                                  $("#custTelNo").val("");
                              }



                          }
                      //}else {
                      //    dms.notification.warning("선택된 고객은 해당 딜러고객이 아닙니다.");
                      //    return false;
                      //}


                  }
              }
          }
      }
    });
}


//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#incJoinWindow").data("kendoWindow");
    win.center();
    win.open();
}


function fnReset(){
    //$("#custNo").prop("disabled","").removeClass("form_disabled");
    $("#custSearch").prop("disabled","").removeClass("form_disabled");

    $("#contractNo").data("kendoExtDropDownList").setDataSource([]);        //계약번호 dataSet
    $("#contractNo").data("kendoExtDropDownList").value("");
    $("#custNo").val("");
    $("#custNm").val("");
    $("#custTp").data("kendoExtDropDownList").value("");
    $("#custTelNo").val("");
    $("#carlineNm").val("");
    $("#modelNm").val("");
    $("#ocnNm").val("");
    $("#extColorNm").val("");
    $("#intColorNm").val("");
    $("#carRegNo").val("");
    $("#contractNo").val("");
    $("#enginSerialNo").val("");
    $("#cartNo").val("");
    $("#incRcptNm").val("");
    $("#custNo1").val("");
    $("#custTelNo").val("");
    $("#custSsnCrnNo").val("");
    $("#incProfitNm").val("");
    $("#incCmpCd").data("kendoExtDropDownList").value("");
    $("#incJoinDt").data("kendoExtMaskedDatePicker").value(toDay);
    $("#dutyIncNo").val("");
    $("#cmcIncNo").val("");
    $("#vinNo").val("");
    $("#incPrsnId").val("");
    $("#incNo").val("");
    $("#incTelNo").val("");

    $("#incExpcTotAmt").data("kendoExtNumericTextBox").value("");
    $("#incFeeTotAmt").data("kendoExtNumericTextBox").value("");
    $("#realIncTotAmt").data("kendoExtNumericTextBox").value("");

    $('#incDtlGrid').data('kendoExtGrid').dataSource.data([]);
}



//고객명에서 ObKeyDown
$(".onKey_down").keydown(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            if($(this).attr("id") == 'sCustNm'){
                $(".custSearch").click();
            }else {
                $(".custDtlSearch").click();
            }
        }
    }
});

// 고객조회
$(".custSearch").click(function(){

    var custNm = $("#sCustNm").val();

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopupMain"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":custNm
                , "type"  :null
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        if ( dms.string.isNotEmpty(data[0].custNo) ) {
                            $("#sCustNo").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);
                        }

                        popupWindow.close();

                    }
                }
            }
        }
    })
});


//고객조회
$(".custDtlSearch").click(function(){

    var custNm = $("#custNm").val();

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopupMain"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , height:"400px"
        , width:"850px"
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":custNm
                , "type"  :null
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        if ( dms.string.isNotEmpty(data[0].custNo) ) {
                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                        }

                        popupWindow.close();

                    }
                }
            }
        }
    })
});



fnOnChange = function(id,vl){
    if(id == "sCustNm" ){
        $("#sCustNo").val("");
    }else {
        $("#custNo").val("");
    }
}

</script>
<!-- //script -->
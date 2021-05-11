<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<spring:theme code="css" var="theme" />
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<head>
    <style type="text/css">
        .btn_date { display:inline; position:relative; z-index:20; width:33.3%; height:30px; padding:0 1px 0 0; border-width:1px; border-color:#d9d9d9; border-style:solid; background-color:#fff; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; box-sizing:border-box; line-height:30px; text-align:center; vertical-align:middle; cursor:pointer;}
        .btn_date.active { z-index:30; border-color:#ecb4ad; background-color:#ffe8e5;}
        .btn_date.disabled { z-index:10; border-color:#d9d9d9; background-color:#f5f5f5; color:#b0b0b0; -webkit-box-shadow:0 3px 0 0 #f0f0f0 inset; -moz-box-shadow:0 3px 0 0 #f0f0f0 inset; box-shadow:0 3px 0 0 #f0f0f0 inset; cursor:default;}
        .btn_date.on { z-index:40; border-color:#84b0d5; background-color:#f0f8ff; color:#116fbd;}
    </style>
</head>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/sal/cnt/contractCondition/listJsp/selectContractProgressList.jsp"></c:import>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.title.contractTot" /> <spring:message code="global.title.searchCondition" /></h2>
            </div>
           <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:40%;">
                        <col style="">
                    </colgroup>
                     <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.contractStat' /><!-- 계약상태 --></th>
                            <td>
                                <div class="f_text">
                                <div class="f_text"><input type="text" id="sContractStat" type="form_comboBox"/></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.contractDt' /></th>    <!-- 계약일자 -->
                            <td class="f_term">
                                <div class="f_item01" style="width:80%">
                                    <input type="date" id="sCtrStartDt" style="background-color:#ffffff" />
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01" style="width:80%">
                                    <input type="date" id="sCtrEndDt" style="background-color:#ffffff" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 --></th>
                        <td>
                            <div class="f_item01" >
                                <input type="text" id="sCustomerNm" name="sCustomerNm" value="" onchange="chgCustId();">
                                <span class="search" id="searchCustomerId"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                            </div>
                            <input type="hidden" id="sCustomerId" name="sCustomerId" data-json-obj="true">
                        </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.salPrsnNm' /><!-- 판매담당자 --></th>
                            <td>
                                <div class="f_text">
                                <div class="f_text"><input type="text" id="sSalPrsnNm" type="form_comboBox"/></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNum' /><!-- VIN NO --></th>
                            <td>
                                <div class="f_text">
                                <input type="text" id="sVinNum"  maxlength="11" class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></th>
                            <td>
                                <div class="f_text">
                                <input type="text" id="sContractNo"  class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>
                     </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12601" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
                </dms:access>
            </div>
            <div id="dateBtn" class="dateBtn_area"></div>
        </section>



        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="sal.title.contractTot" /> <spring:message code="global.lbl.dtlInfo" /></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.dlReqDt" /><!-- 인도요청일 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="dlReqDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                           <tr>
                                <th scope="row"><spring:message code="global.lbl.salPrsnNm" /><!-- 판매담당자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="salPrsnNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.customer" /><!-- 고객 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="customer" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="custTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr id = "row01">
                                <th scope="row"><spring:message code="sal.lbl.PayTaxPinNo" /><!-- 납세자번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="payTaxPinNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr id = "row02">
                                <th scope="row"><spring:message code="crm.lbl.relCustNm" /><!-- 연계인이름 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="relCustNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.mathDocTp" /><!-- 증서유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="mathDocTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증서번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ssnCrnNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 이동전화--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="hpNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.addrTp" /><!-- 주소유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="addrTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.detlAddr" /><!-- 상세주소 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="detlAddr" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNum" /><!-- VIN NO --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="vinNum" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carlineCd" /><!-- 차종코드--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carLine" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종명칭--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carLineNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.model" /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="modelNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnCode" /><!-- OCN --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocn" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorCd" /><!-- 외장색코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColor" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorNm" /><!-- 외장색명--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="intColor" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.payTp" /><!-- 지불방식 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="payTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.carRetlAmt" /><!-- 지도가 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carRetlAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.lv2DlrYn" /><!-- 2급딜러여부 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="lv2DlrYn" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.totAmt" /><!-- 총금액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="totAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="content_title">
                    <h2><spring:message code="ser.lbl.totAmt" />&nbsp;<spring:message code="global.lbl.dtlInfo" /><!-- 상세정보 --></h2>
                    <div class="title_btn"><span class="co_open co_close" id="detailListBtn"><span></span></span></div>
                </div>

                <div class="co_view" style="display:none;">
                    <div class="formarea">
                        <table class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="sal.lbl.realCarAmts" /><!-- 순차량금액 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="realCarAmts" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.contractAmt" /><!-- 계약금액 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="contractAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="sal.lbl.goods" /><!-- 용품 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="decoration" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.insurance" /><!-- 보험 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="insurance" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="sal.rpt.salesfincrpt" /><!-- 금융 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id=salesfincrpt type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="sal.lbl.usedCar" /><!-- 중고차 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="salesusedcarsrpt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.execution" /><!-- 대행 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="execution" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="sal.lbl.point" /><!-- BM포인트 --></th>
                                    <td>
                                        <div class="f_text f_disabled">
                                        <input id="point" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

var yesMap = [];
yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
yesMap["N"] = "<spring:message code='global.lbl.n' />";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

//계약상태 SAL002
var contractStatCdList = [];
var contractStatCdArray = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    <c:if test="${obj.cmmCd ne '10' and obj.cmmCd ne '90' }">
        contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    contractStatCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
var selectSaleEmpDSArray = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
    selectSaleEmpDSArray["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

//지불방식 :SAL071
var amtPayTpList = [];
var amtPayTpMap={};
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    amtPayTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//주요인증문서유형(신분증유형) :CRM024
var ssnCrnTpPList = [];        // remark1 - P :개인
var ssnCrnTpCList = [];        // remark1 - C :법인
var ssnCrnTpCdMapP = {};
var ssnCrnTpCdMapC = {};

<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      ssnCrnTpCdMapP["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      ssnCrnTpCdMapC["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//지불방식 :SAL071
var addrTpList = [];
var addrTpMap={};
<c:forEach var="obj" items="${addrTpDS}">
addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
    $("#sCtrStartDt").val(threeMonthDay);
    $("#sCtrEndDt").val(toDay);

    // 계약상태
    $("#sContractStat").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(contractStatCdList)
       ,optionLabel:"<spring:message code='sal.lbl.all' />"   //전부
    });

    //판매담당자
    $("#sSalPrsnNm").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y"){
        $("#sSalPrsnNm").data("kendoExtDropDownList").value(userId);
    }else{
        $("#sSalPrsnNm").data("kendoExtDropDownList").value("");
    }
    if(saleAdminYn == "Y"){
        $("#sSalPrsnNm").data("kendoExtDropDownList").enable(true);
    }else{
        $("#sSalPrsnNm").data("kendoExtDropDownList").enable(false);
    }

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.contractTot' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    $("#sDlrCd").val(dlrCd);

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initList();
            listData.read();
        }
    });

    $("#searchCustomerId").click(function(){
        popupWindow = mob.window.popup({
            windowId:"customerSearchPopupMain"
            , content:{
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if ( dms.string.isNotEmpty(data.custNo) ) {
                            $("#sCustomerNm").val(data.custNm);
                            $("#sCustomerId").val(data.custNo);

                        }
                    }
                }
            }
        });
    });


});
</script>

<script>

//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $.ajax({
        url :"<c:url value='/sal/cnt/contractMnt/selectContractReSearch.do' />"
        ,data :JSON.stringify({"sDlrCd":dataItem.dlrCd, "sContractNo":dataItem.contractNo})
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }else{
                dms.notification.error(error);
            }
        }
        ,success :function(jqXHR, textStatus) {
            if(jqXHR.total > 0){
              $("#dlReqDt").val(chgDate2Str(jqXHR.data[0].dlReqDt));
              $("#salPrsnNm").val(changeSaleEmpNm(jqXHR.data[0].saleEmpNo));
              $("#customer").val(jqXHR.data[0].custNm);

              if(jqXHR.data[0].custTp == "01"){
                  $("#mathDocTp").val(changeMathDocTpP(jqXHR.data[0].ssnCrnTp));
                  $("#custTp").val("<spring:message code='global.lbl.personal' />");
                  $("#row01").hide();
                  $("#row02").hide();
              }else if(jqXHR.data[0].custTp == "02"){
                  $("#mathDocTp").val(changeMathDocTpC(jqXHR.data[0].ssnCrnTp));
                  $("#custTp").val("<spring:message code='global.lbl.corporation' />");
                  $("#row01").show();
                  $("#row02").show();
              }

              $("#ssnCrnNo").val(jqXHR.data[0].ssnCrnNo);
              $("#hpNo").val(jqXHR.data[0].telNo1);
              $("#addrTp").val(addrTpMap[jqXHR.data[0].addrTp]);
              $("#detlAddr").val(trimNull(jqXHR.data[0].sungNm) + " " + trimNull(jqXHR.data[0].cityNm) + " " + trimNull(jqXHR.data[0].distNm) + " " + trimNull(jqXHR.data[0].addrDetlCont));
              $("#vinNum").val(jqXHR.data[0].vinNo);
              $("#carLine").val(jqXHR.data[0].carlineCd);
              $("#modelNm").val(trimNull(jqXHR.data[0].fscNm));

              if(jqXHR.data[0].ocnCd != null){
                  $("#ocn").val(jqXHR.data[0].ocnCd);
              }else{
                  $("#ocn").val("");
              }

              if(jqXHR.data[0].extColorCd != null){
                  $("#extColor").val(jqXHR.data[0].extColorCd);
              }else{
                  $("#extColor").val("");
              }

              if(jqXHR.data[0].intColorCd != null){
                  $("#intColor").val("[" + jqXHR.data[0].intColorCd + "]" + jqXHR.data[0].intColorNm);
              }else{
                  $("#intColor").val("");
              }
              $("#carRetlAmt").val(kendo.toString(jqXHR.data[0].retlAmt, 'n2'));
              $("#payTaxPinNo").val(jqXHR.data[0].taxPayNo);
              $("#relCustNm").val(jqXHR.data[0].purcMngNm);
              $("#carLineNm").val(jqXHR.data[0].carlineNm);
              $("#ocnNm").val(jqXHR.data[0].ocnNm);
              $("#extColorNm").val(jqXHR.data[0].extColorNm);
              $("#payTp").val(amtPayTpMap[jqXHR.data[0].payTp]);
              $("#recPrice").val(jqXHR.data[0].sbusTp);
              $("#totAmt").val(kendo.toString(jqXHR.data[0].realPayAmt, 'n2'));
              $("#lv2DlrYn").val(yesMap[jqXHR.data[0].lv2DlrYn]);

              $("#realCarAmts").val(kendo.toString(jqXHR.data[0].realCarAmt, 'n2'));
              $("#contractAmt").val(kendo.toString(jqXHR.data[0].reservContAmt, 'n2'));
              $("#decoration").val(kendo.toString(jqXHR.data[0].goodsAmt, 'n2'));
              $("#insurance").val(kendo.toString(jqXHR.data[0].incAmt, 'n2'));
              $("#salesfincrpt").val(kendo.toString((jqXHR.data[0].fincFeeAmt !=null)? jqXHR.data[0].fincFeeAmt: 0, 'n2'));
              $("#salesusedcarsrpt").val(kendo.toString(jqXHR.data[0].sbstAmt, 'n2'));
              $("#execution").val(kendo.toString(jqXHR.data[0].aapAmt, 'n2'));
              $("#point").val(kendo.toString(jqXHR.data[0].pointAmt, 'n2'));

            }else{
              // {상세정보}을(를) 확인하여 주세요.
              dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            }
        }
    });
  }

changeMathDocTpP = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ssnCrnTpCdMapP[val];
    }
    return returnVal;
};

changeMathDocTpC = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ssnCrnTpCdMapC[val];
    }
    return returnVal;
};

changeSaleEmpNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = selectSaleEmpDSArray[val];
    }
    return returnVal;
};

function chgCustId(){

    $("#sCustomerId").val("");

}

</script>
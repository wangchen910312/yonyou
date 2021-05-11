<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="sal.menu.notAssignOrdSearch" /></h2>
            </div>
            <div class="co_group">
                <div class="content_title">
                    <span style="font-size: 16px;"><spring:message code='sal.lbl.dailyFoundCondition' /></span>&nbsp;
                    <div class="title_btn">
                        <span class="co_open co_close"><span></span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="sal.lbl.mortgageBalance" />/<spring:message code="sal.lbl.unMortgageBalance" /></th> <!-- 담보잔액 -->
                                    <td class="readonly_area">
                                        <input id="mortgageBalance" type="text" style="text-align: right; width:44.5%;" readOnly/>
                                        <input id="unMortgageBalance" type="text" style="text-align: right; width:44.5%;" readOnly/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" style="width:30%"><spring:message code='sal.lbl.ordReqTotAmt' /><!-- 오더배정필요한총금액 --></th>
                                    <td><input type="text" id = "ordReqTotAmt" style="text-align: right; width:90%;" readOnly/></td>
                                </tr>
                                <tr>
                                    <th scope="row" style="width:30%"><spring:message code='sal.lbl.accountBalance' /><!-- 계정잔액 --></th>
                                    <td><input type="text" id = "preAmt" style="text-align: right; width:90%;" readOnly/></td>
                                </tr>
                                <tr>
                                    <th scope="row" style="width:30%"><spring:message code='sal.lbl.lackAmtAssigne' /><!-- 부족금액 --></th>
                                    <td><input type="text" id = "lackAmt" style="text-align: right; width:90%;" readOnly/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="listarea" >
                <div class="dlistitem listhead">
                    <span style="width:50%" ><spring:message code="global.lbl.carLine" /><!-- 차종--></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.extColor" />/<spring:message code="sal.lbl.intColor" /><!-- 외색/내색 --></span>
                    <span style="width:50%" ><spring:message code="global.lbl.ocn" />/<spring:message code="global.lbl.model" /><!-- ocn/차관 --></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.guideAmt" /><!-- 지도가격--></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.qty" /><!-- 수량 --></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.whDcAmt" /><!-- 할인후 금액 --></span>

                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
            <div class="btnfixed">
                <div class="dlistitem bgNone" style="text-align: left;">
                    <span style="width:20%"><spring:message code='par.lbl.weightTotal' />:<!-- 수량 --></span>
                    <span style="width:60%" id="totalAmt"></span>
                    <span style="width:10%" id="div"></span>
                    <span style="width:10%" id="totalSum"></span>
                </div>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.menu.notAssignOrdSearch" /> <spring:message code="global.title.searchCondition" /></h2>
            </div>
           <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                     <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.orderType' /><!-- 주문유형 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sOrderType" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="group-OrdDt" style="display:none"><spring:message code='global.lbl.orderWeek' /><!-- 주문주차 --></th>
                                <td class="group-OrdDt" style="display:none">
                                    <div class="f_text">
                                        <input type="text" id="sOrderWeek" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="f_term" style="display:true"><span><spring:message code='global.lbl.orderRegDt' /></span></th>    <!-- 주문등록일 -->
                                <td class="f_term" style="display:true">
                                    <div class="f_item01" style="width:82%">
                                        <input type="search" id="sOrdStartDt"  value="${oneDay}" />
                                        <span class="date" onclick="calpicker('sOrdStartDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                    <span class="termtext"> ∼</span>
                                    <div class="f_item01" style="width:82%">
                                        <input type="search" id="sOrdEndDt"  value="${toDay}"/>
                                        <span class="date" onclick="calpicker('sOrdEndDt')"><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.mortgageTp" /></th> <!-- 담보유형 -->
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sMortgageTp" name="sMortgageTp" class="form_comboBox">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sCarLine" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.model' /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sModelNm" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sOcn" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12598" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="sal.menu.notAssignOrdSearch" /> <spring:message code="global.lbl.dtlInfo" /></h2>
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
                                <th scope="row"><spring:message code="sal.lbl.orderDate" /><!-- 오더일자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="orderDate" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ordNo" /><!-- 오더번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="purcOrdNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="purcOrdTp" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carlineCd" /><!-- 차종코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carlineNm" /><!-- 차종명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carLineNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.modelNm" /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="modelNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnCode" /><!-- OCN 코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN 명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorCd" /><!-- 외장색 코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorNm" /><!-- 외장색 명칭 --></th>
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
                                <th scope="row"><spring:message code="global.lbl.chrgCd" /><!-- 주문자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="chrgCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.pfpExamDt" /><!-- 납기예시일 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="pfpExamDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="saleRgstUsr" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ordpCount" /><!-- 오더수량 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ordpCount" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.mdpr" /><!-- 시장지도가 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="mdpr" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.dcAmt" /><!-- 할인금액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="dcAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.whPrc" /><!-- 필요자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="whPrc" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.mortgageTp" /><!-- 담보유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="paym" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

/**
 * 주문유형 콤보박스
 */
 var ordTpList = [];
 var ordTpCdObj = {};
 <c:forEach var="obj" items="${ordTpInfo}">
     ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     ordTpCdObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
 </c:forEach>

 /**
  * 담보유형 콤보박스
  */
var mortgageTpList = [];
var mortgageTpCdObj = {};
<c:forEach var="obj" items="${mortgageTp}">
    mortgageTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    mortgageTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/**
 * 차종 콤보
 */
 var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

 /**
  * 주차
  */
 var ordYyMmPridList = [];
 <c:forEach var="obj" items="${ordYyMmPridInfo}">
     ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
 </c:forEach>

 /**
  * 담보유형 콤보박스
  */
  var mortgageTpList = [];
  var mortgageTpCdObj = {};
  <c:forEach var="obj" items="${mortgageTp}">
    mortgageTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    mortgageTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
  </c:forEach>

  var _windowHeight;

$(document).ready(function() {

    _windowHeight=$(window).height();

  //현재일자
    var toDay = "${toDay}";

    // 타이틀
    $("#header_title").html("<spring:message code='sal.menu.notAssignOrdSearch' />"); //공장가용자원정황
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/orc/orderPlacement/selectNotAssignedOrderList.do' />");

    // 주문유형
    $("#sOrderType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:ordTpList
        , select:onSelectOrdTp
        , optionLabel:"<spring:message code='global.lbl.all' />"
     });

    // 주차
    $("#sOrderWeek").kendoExtDropDownList({
        dataTextField:"btoYmwNm"
        , dataValueField:"btoYmwCd"
        , dataSource:ordYyMmPridList
        , optionLabel:"<spring:message code='global.lbl.all' />"
     });

    //담보유형
    $("#sMortgageTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:mortgageTpList
       ,optionLabel:"<spring:message code='global.lbl.all' />"  // 선택
    });

    // 차종
    $("#sCarLine").kendoExtDropDownList({
        dataTextField:"carlineNm"
        , dataValueField:"carlineCd"
        , dataSource:carLineCdList
        , select:onSelectCarlineCd
        , optionLabel:"<spring:message code='global.lbl.all' />"
     });

    // 모델
    $("#sModelNm").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,select:onSelectModelCd
       ,optionLabel:" "
    });
    //$("#sModelNm").data("kendoExtDropDownList").enable(false);

    // OCN
    $("#sOcn").kendoExtDropDownList({
        dataTextField:"ocnNm"
       ,dataValueField:"ocnCd"
       ,optionLabel:" "
    });
    //$("#sOcn").data("kendoExtDropDownList").enable(false);

    /*
    // 오더배정필요한총금액
    $("#ordReqTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    // 선수금 잔액
    $("#preAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    // 담보잔액
    $("#mortgageBalance").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    // 비담보잔액
    $("#unMortgageBalance").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    // 부족금액
    $("#lackAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });
    */

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            contentList();
        }
    });

    $("#listarea").height(400);
    $("#sModelNm").data("kendoExtDropDownList").enable(false);
    $("#sOcn").data("kendoExtDropDownList").enable(false);
});
</script>

<script>
//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  //setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#orderDate").val(dataItem.ordpCndy);
    $("#purcOrdNo").val(dataItem.salesNo);
    $("#purcOrdTp").val(ordTpCdObj[dataItem.sord]);
    $("#carlineCd").val(dataItem.carlineCd);
    $("#carLineNm").val(dataItem.carlineNm);
    $("#modelNm").val(dataItem.modelNm);
    $("#ocnCd").val(dataItem.ocnCd);
    $("#ocnNm").val(dataItem.ocnNm);
    $("#extColorCd").val(dataItem.extColorCd);
    $("#extColorNm").val(dataItem.extColorNm);
    $("#intColor").val(dataItem.intColorNm);
    $("#pfpExamDt").val(chgDate2Str(dataItem.ordpExno));
    $("#saleRgstUsr").val(dataItem.saleRgstUsr);
    $("#chrgCd").val(dataItem.chrgCd);
    $("#ordpCount").val(dataItem.ordpCount);
    $("#mdpr").val(kendo.toString(dataItem.mdpr,'n2'));
    $("#dcAmt").val(kendo.toString(dataItem.damt,'n2'));
    $("#whPrc").val(kendo.toString(dataItem.aamt,'n2'));
    $("#paym").val(dms.string.strNvl(mortgageTpCdObj[dataItem.paym]));
  }

function onSelectOrdTp(e) {

    var ordTpCd = this.dataItem(e.item).cmmCd;

    if( ordTpCd != null && ordTpCd != ""){

        if( ordTpCd == "N1" ){

            $("#sOrdStartDt").val("");
            $("#sOrdEndDt").val("");

            $(".f_term").hide();
            $(".group-OrdDt").show();
        }else{
            if( $("#sOrdStartDt").val() == "" || $("#sOrdEndDt").val() == null ){

                $("#sOrdStartDt").val("");
                $("#sOrdEndDt").val("");

            }

            $(".group-OrdDt").hide();
            $(".f_term").show();
        }
    }

};

/**
 * 차종에 따른 모델 조회
 */
function onSelectCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    $("#sModelNm").data("kendoExtDropDownList").setDataSource([{fscCd:"" , fscNm:""}]);
    $("#sModelNm").data("kendoExtDropDownList").enable(true);

    $("#sOcn").data("kendoExtDropDownList").setDataSource([{ocnCd:"", ocnNm:""}]);   // OCN data
    $("#sOcn").data("kendoExtDropDownList").enable(false);       // OCN 닫음

    if(dataItem.carlineCd == ""){
        $("#sModelNm").data("kendoExtDropDownList").setDataSource([{fscCd:"" , fscNm:""}]);
        $("#sModelNm").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
        ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
        ,async:false
    });
    $("#sModelNm").data("kendoExtDropDownList").setDataSource(responseJson.data);
 };

 /**
  * 모델에 따른 OCN 조회
  */
function onSelectModelCd(e) {

  var strModelCd = this.dataItem(e.item).fscCd;

  $("#sOcn").data("kendoExtDropDownList").setDataSource([]);

  if( strModelCd != null && strModelCd != "" ){
      var responseJson = dms.ajax.getJson({
          url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
          ,data:JSON.stringify({"sCarlineCd":$("#sCarLine").val(), "sFscCd":this.dataItem(e.item).fscCd})
          ,async:false
      });

      $("#sOcn").data("kendoExtDropDownList").enable(true);
      $("#sOcn").data("kendoExtDropDownList").setDataSource(responseJson.data);
  }else{
      $("#sOcn").data("kendoExtDropDownList").setDataSource([]);
  }
};
</script>
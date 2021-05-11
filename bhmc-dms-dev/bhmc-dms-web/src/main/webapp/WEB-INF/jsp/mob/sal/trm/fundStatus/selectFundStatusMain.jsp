<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<spring:theme code="css" var="theme" />
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="sal.title.fundStatus" /></h2>
            </div>

            <%-- <div class="listarea" style="display:none">
                <div class="dlistitem">
                    <span style="width:100%" align="center"><h1><spring:message code="sal.befMnthAmt" /></h1></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.cash" /></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.prt2Amt" /><spring:message code="global.lbl.total" /></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.prt3Amt" /><spring:message code="global.lbl.total" /></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.balAmtDay" /><spring:message code="global.lbl.total" /></span>
                </div>
                <iframe id="mainHeadList" border="0" frameborder="0" width="100%"></iframe>
            </div> --%>
            <iframe id="mainHeadList" border="0" frameborder="0" style="display: none;"></iframe> <!-- 반드시 수정해주세요! -->

            <div class="co_group">
                <div class="content_title">
                    <span style="font-size: 16px;"><spring:message code='sal.lbl.preAmt' /></span>&nbsp;
                    <span style="line-height: 3">
                        <input type="text" id = "preAmt" style="width:50%; text-align:right" readonly/>
                    </span>
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
                                    <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="preCash" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="prePrt2Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="prePrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <span style="font-size: 16px;"><spring:message code='sal.lbl.depTot' /></span>&nbsp;
                    <span style="line-height: 3">
                        <input type="text" id = "depositAmt" style="width:50%; text-align:right" readonly/>
                    </span>
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
                                    <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="depositCash" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id=depositPrt2Amt data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="depositPrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prcChgAmt' /><!-- 조정금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="depositProChgAmt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.incnAmt' /><!-- 인센티브 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="depositIncnAmt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <span style="font-size: 16px;"><spring:message code='sal.lbl.withTot' /></span>&nbsp;
                    <span style="line-height: 3">
                        <input type="text" id="withAmt" style="width:50%; text-align:right" readonly/>
                    </span>
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
                                    <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="withCash" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="withPrt2Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="withPrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <span style="font-size: 16px;"><spring:message code='sal.lbl.nowAmt' /></span>&nbsp;
                    <span style="line-height: 3">
                        <input type="text" id="nowAmt" style="width:50%; text-align:right" readonly/>
                    </span>
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
                                    <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="nowCash" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="nowPrt2Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                                    <td>
                                        <div class="f_text"><input type="text" id="nowPrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%" ><spring:message code="sal.lbl.date" /><!-- 일자--></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.dpstAmtTotDay" /><!-- 입금 --></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.wdrwAmtTotDay" /><!-- 출금 --></span>
                    <span style="width:50%" ><spring:message code="par.lbl.balAmtCol" /><!-- 잔액 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" style="height: 100px;"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
            <!--
            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:100%" ><spring:message code="sal.lbl.dpstAmtTotMonth" /><spring:message code="global.lbl.total" />:<span id="dpTotal"><strong>0</strong></span></span>
                    <span style="width:100%" ><spring:message code="sal.lbl.wdrwAmtTotMonth" /><spring:message code="global.lbl.total" />:<span id="wdTotal"><strong>0</strong></span></span>
                    <span style="width:100%" ><spring:message code="sal.lbl.balAmtDay" /><spring:message code="global.lbl.total" />:<span id="blTotal"><strong>0</strong></span></span>
                </div>
            </div>
            -->
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.title.fundStatus" /> <spring:message code="global.title.searchCondition" /></h2>
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
                            <th scope="row"><spring:message code="sal.lbl.searchMonth" /> <!-- 조회월 --></th>
                            <td>
                                <input id="sYyMm" type="form_datepicker"></input>
                            </td>
                        </tr>
                     </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12597" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="sal.title.fundStatus" /> <spring:message code="global.lbl.dtlInfo" /></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01" border=1>
                        <caption></caption>
                        <colgroup>
                            <col style="width:20%;">
                            <col style="width:35%;">
                            <col style="width:45%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" rowspan=6 style="text-align:center"><spring:message code="sal.lbl.dpstAmtTotMonth" /></th>
                                <th scope="row"><spring:message code="sal.lbl.cash" /><!-- 현금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="cash_1" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prt2Amt" /><!-- 이방자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prt2Amt_1" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prt3Amt" /><!-- 삼방자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prt3Amt_1" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prcChgAmt" /><!-- 조정금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prcChgAmt_1" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.incnAmt" /><!-- 인센티브 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="incnAmt_1" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.total" /><!-- 합계 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="total_1" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan=4 style="text-align:center"><spring:message code="sal.lbl.wdrwAmtTotMonth" /></th>
                                <th scope="row"><spring:message code="sal.lbl.cash" /><!-- 현금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="cash_2" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prt2Amt" /><!-- 이방자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prt2Amt_2" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prt3Amt" /><!-- 삼방자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prt3Amt_2" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.total" /><!-- 합계 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="total_2" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan=4 style="text-align:center"><spring:message code="sal.lbl.balAmtDay" /></th>
                                <th scope="row"><spring:message code="sal.lbl.cash" /><!-- 현금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="cash_3" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prt2Amt" /><!-- 이방자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prt2Amt_3" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.prt3Amt" /><!-- 삼방자금 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="prt3Amt_3" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.total" /><!-- 합계 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="total_3" type="text" class="f_text" placeholder="" disabled="disabled" style="text-align:right"/>
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
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var totDpstAmt = "";
var wdrwAmt = "";
var totBalAmt = "";
var _windowHeight;

$(document).ready(function() {
  //현재일자

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
    }

    initPage();
    _windowHeight=$(window).height();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.fundStatus' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/trm/fundStatus/selectFundStatusList.do' />");
    $("#mainHeadList").attr("src", "<c:url value='/mob/sal/trm/fundStatus/selectFundStatusHeadList.do' />");

    //조회 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:function(e) {
       }
    });

    $(".k-select").css("background-image","url(<c:url value='/resources/img/img_sprite_t.png' />)");
    $(".k-select").css("background-position","-12px -16px");
    //$(".k-select").css("background-size","300px 200px");

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
    
    //$(".listarea").height(200);
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
  document.getElementById("mainHeadList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
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
    setTimeout(function(){ $("#content_detail").css("display","block")}, 200);
    $("#header_title span").removeAttr("class");

    $("#cash_1").val(kendo.toString(dataItem.cashDpstAmt, 'n2'));
    $("#prt2Amt_1").val(kendo.toString(dataItem.prt2DpstAmt, 'n2'));
    $("#prt3Amt_1").val(kendo.toString(dataItem.prt3DpstAmt, 'n2'));
    $("#prcChgAmt_1").val(kendo.toString(dataItem.prcChgAmt, 'n2'));
    $("#incnAmt_1").val(kendo.toString(dataItem.incnAmt, 'n2'));
    $("#total_1").val(kendo.toString(dataItem.totDpstAmt, 'n2'));

    $("#cash_2").val(kendo.toString(dataItem.wdrwCashAmt, 'n2'));
    $("#prt2Amt_2").val(kendo.toString(dataItem.wdrwPrt2Amt, 'n2'));
    $("#prt3Amt_2").val(kendo.toString(dataItem.wdrwPrt3Amt, 'n2'));
    $("#total_2").val(kendo.toString(dataItem.wdrwAmt, 'n2'));

    $("#cash_3").val(kendo.toString(dataItem.cashBalAmt, 'n2'));
    $("#prt2Amt_3").val(kendo.toString(dataItem.prt2BalAmt, 'n2'));
    $("#prt3Amt_3").val(kendo.toString(dataItem.prt3BalAmt, 'n2'));
    $("#total_3").val(kendo.toString(dataItem.totBalAmt, 'n2'));

  }

  function getTotal(){
      $("#dpTotal").html('<strong>'+kendo.toString(totDpstAmt, 'n2')+'</strong>');
      $("#wdTotal").html('<strong>'+kendo.toString(wdrwAmt, 'n2')+'</strong>');
      $("#blTotal").html('<strong>'+kendo.toString(totBalAmt, 'n2')+'</strong>');
  }

</script>
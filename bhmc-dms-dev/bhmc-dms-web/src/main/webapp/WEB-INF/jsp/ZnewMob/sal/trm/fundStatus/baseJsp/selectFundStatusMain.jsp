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
            <c:import url="/WEB-INF/jsp/ZnewMob/sal/trm/fundStatus/listJsp/selectFundStatusHeadList.jsp"></c:import>
            <c:import url="/WEB-INF/jsp/ZnewMob/sal/trm/fundStatus/listJsp/selectFundStatusList.jsp"></c:import>
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



<!-- script -->
<script>
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var totDpstAmt = "";
var wdrwAmt = "";
var totBalAmt = "";
var _windowHeight;
var toDay = "${toDay}";

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

    subListData.read();
    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            listData.read();
            subListData.read();
        }
    });
});
</script>

<script>
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
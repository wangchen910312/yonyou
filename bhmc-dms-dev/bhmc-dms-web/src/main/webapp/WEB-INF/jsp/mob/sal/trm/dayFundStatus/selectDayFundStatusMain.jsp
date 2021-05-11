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
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="sal.menu.dailyFoundCondition" /></h2>
            </div>

            <div class="formarea">
                <table class="flist01">
                    <tr>
                        <th scope="row" style="width:20%"><spring:message code='par.lbl.itemInnerOutTotQty' /><!-- 총수량 --></th>
                        <td style="width:20%;"><input type="text" id = "totQty" style="text-align: right; width:70%;" readOnly/></td>
                        <th scope="row" style="width:20%"><spring:message code='ser.lbl.totAmt' /><!-- 총금액 --></th>
                        <td><input type="text" id = "totAmt" style="text-align: right; width:100%;" readOnly/></td>
                    </tr>
                </table>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%" ><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.extColor" /><!-- 외색 --></span>
                    <span style="width:50%" ><spring:message code="global.lbl.ocnCode" /><!--OCN코드/OCN명 --></span>
                    <span style="width:50%" ><spring:message code="global.lbl.assignmentUnit" /><!--배정수량 --></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.finalDcAmt" /><!-- 최종공제금액 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" ></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.menu.dailyFoundCondition" /> <spring:message code="global.title.searchCondition" /></h2>
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
                                <!--
                                <input id="sYyMm" type="form_datepicker" onclick="bf_gridClean();"/>
                                -->

                                <div class="f_item01" style="width:80%">
                                    <input type="search" id="sStartDt"  />
                                    <span class="date" onclick="calpicker('sStartDt')"><spring:message code='global.lbl.date' /></span>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td><input id="sDlrCd" type="hidden"></td>
                        </tr>
                     </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-13109" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1" onclick="bf_gridSearch()"><span class="search"><spring:message code='global.btn.search' /></span></span>
                </dms:access>
            </div>
            <div id="dateBtn" class="dateBtn_area"></div>
        </section>



        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="sal.menu.dailyFoundCondition" /> <spring:message code="global.lbl.dtlInfo" /></h2>
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
                                <th scope="row"><spring:message code="sal.lbl.ordNo" /><!-- 오더번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_ORD_NO" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.ordCd" /><!-- 오더코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ordTpCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.ordNm" /><!-- 오더명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ordTpNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.ltsModelCode" /><!-- 차종코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
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
                                <th scope="row"><spring:message code="global.lbl.ocn" /><!-- OCN --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
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
                                    <input id="extColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorNm" /><!-- 외장색명 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.intColorCd" /><!-- 내장색코드 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="intColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.assignmentUnit" /><!-- 배정수량 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_ALLO_QTY" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.retlPrc" /><!-- 시장지도가 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_MSRP" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.dcRate" /><!-- DC율 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_DC_RATE" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.bDcAmt" /><!-- 할인금액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_DC_AMT" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="co_group">
                        <div class="content_title" style="padding:7px 2px 2px 0px;" >
                            <table  class="flist01">
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:30%;">
                                        <col style="width:50%;">
                                        <col>
                                    </colgroup>
                                    <tbody class="detialListData">
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.deductionAmt" /><!-- 공제금액 --></th>
                                            <td>
                                                <div class="f_text f_disabled"><input id="DALO_ALLO_AMT" type="text" placeholder="" disabled="disabled"/></div>
                                            </td>
                                            <td>
                                                <div class="title_btn"><span id="co_openClose" class="co_open co_close"><span></span></span></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            <%-- <span style="font-size: 14px;"><spring:message code="ser.lbl.deductionAmt" /><!-- 공제금액 --></span>
                            <div class="title_btn"><span class="co_open co_close"><span></span></span></div> --%>
                        </div>
                        <div class="co_view" style="display:none;">
                            <div class="formarea">
                                <table  class="flist01">
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:30%;">
                                        <col>
                                    </colgroup>
                                    <tbody class="detialListData">
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.cash' /></th>        <!-- 현금 -->
                                            <td>
                                                <div class="f_text f_disabled"><input id="DALO_CHAH_AMT" type="text" placeholder="" disabled="disabled"/></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.prt3Amt' /></th>        <!-- 삼방자금 -->
                                            <td>
                                                <div class="f_text f_disabled"><input id="DALO_3PRY_AMT" type="text" placeholder="" disabled="disabled"/></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.prt2Amt' /></th>        <!-- 이방자금 -->
                                            <td>
                                                <div class="f_text f_disabled"><input id="DALO_2PRY_AMT" type="text" placeholder="" disabled="disabled"/></div>
                                            </td>
                                        </tr>
                                        <!--
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.total' /></th>
                                            <td>
                                                <div class="f_text f_disabled"><input id="DALO_ALLO_AMT" type="text" placeholder="" disabled="disabled"/></div>
                                            </td>
                                        </tr>
                                        -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <table class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.alDcAmt" /><!-- 조정가액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_ADJT_AMT" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.finalDcAmt" /><!-- 최종공제금액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="DALO_FINAL_AMT" type="text" class="f_text" placeholder="" disabled="disabled"/>
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

var dateFormat =  '<dms:configValue code="dateFormat" />';

var dlrCd = "${dlrCd}";
var toDay = "${toDay}";         // 현재일자
var toMonth = "${toMonth}";

var params = {};

var _windowHeight;


$(document).ready(function() {

    _windowHeight=$(window).height();

    $("#sStartDt").val(toDay);
    params["sDlrCd"]  = dlrCd;
    params["sYyMmDd"] = $("#sStartDt").val().replace("-","").replace("-","");

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    /*
    $("#totQty").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#totAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });
    */

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.menu.dailyFoundCondition' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/trm/dayFundStatus/selectDayFundStatusList.do' />");

    $("#sDlrCd").val(dlrCd);

    //조회 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:function(e) {
           btnSearch();
       }
    });

    //btnSearch();

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

    $("#co_openClose").click(function(){
        $(this).parent().parent().parent().parent().parent().parent().next(".co_view").toggle();
        $(this).toggleClass('co_close');
    });

    // 버튼 - 조회
/*     $("#btnSearch").kendoButton({
        click:function(e) {
            contentList();
        }
    }); */


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
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");



    $("#DALO_ORD_NO").val(dataItem.DALO_ORD_NO);
    $("#ordTpCd").val(dataItem.ordTpCd);
    $("#ordTpNm").val(dataItem.ordTpNm);
    $("#carlineCd").val(dataItem.carlineCd);
    $("#carlineNm").val(dataItem.carlineNm);
    $("#modelNm").val(dataItem.modelNm);
    $("#ocnCd").val(dataItem.ocnCd);
    $("#ocnNm").val(dataItem.ocnNm);
    $("#extColorCd").val(dataItem.extColorCd);
    $("#extColorNm").val(dataItem.extColorNm);
    $("#intColorCd").val(dataItem.intColorCd);
    $("#DALO_ALLO_QTY").val(dataItem.DALO_ALLO_QTY);
    $("#DALO_MSRP").val(kendo.toString(dataItem.DALO_MSRP, 'n2'));
    $("#DALO_DC_RATE").val(kendo.toString(dataItem.DALO_DC_RATE, 'n2'));
    $("#DALO_DC_AMT").val(kendo.toString(dataItem.DALO_DC_AMT, 'n2'));
    $("#DALO_ALLO_AMT").val(kendo.toString(dataItem.DALO_ALLO_AMT, 'n2'));
    $("#DALO_CHAH_AMT").val(kendo.toString(dataItem.DALO_CHAH_AMT, 'n2'));
    $("#DALO_3PRY_AMT").val(kendo.toString(dataItem.DALO_3PRY_AMT, 'n2'));
    $("#DALO_2PRY_AMT").val(kendo.toString(dataItem.DALO_2PRY_AMT, 'n2'));
    $("#DALO_ALLO_AMT").val(kendo.toString(dataItem.DALO_ALLO_AMT, 'n2'));
    $("#DALO_ADJT_AMT").val(kendo.toString(dataItem.DALO_ADJT_AMT, 'n2'));
    $("#DALO_FINAL_AMT").val(kendo.toString(dataItem.DALO_FINAL_AMT, 'n2'));
  }

//일자 내역 조회
function btnSearch(){

    /*
    if($("#sYyMm").data("kendoExtMaskedDatePicker").value() == null){return;}
    if(dms.string.strNvl($("#sDlrCd").val()) == ""){return;}

    var yyMm = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyyMM");

    var param = {
            "yyMm":yyMm
           ,"yy":yyMm.substring(0,4)
           ,"mm":yyMm.substring(4,6)
           ,"dlrCd":$("#sDlrCd").val()
         };

    var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/trm/dayFundStatus/selectDayFundStatusDaySearch.do' />"
        ,data:JSON.stringify(param)
        ,async:false
    });

    var lastDay = responseJson.total;
    var dsList  = responseJson.data;        // list

    var dateObj = {};
    $.each(dsList, function(index, data){
        dateObj[Number(data.dd)] = data;
    });

    var vHtml = "";

    for (var i=1; i<=lastDay; i++) {

        // 현재일자 보다 버튼이 클경우.  disabled 처리
        if(yyMm > toMonth ){
            vHtml += '<button type="button" disabled class="btn_date disabled">'+i+'</button>';

        }else if( yyMm == toMonth
                && Number( toDay.substring(8,10) ) < i ){
            vHtml += '<button type="button" disabled class="btn_date disabled">'+i+'</button>';
        }else if( yyMm == toMonth
                && Number( toDay.substring(8,10) ) == i ){
            // 현재일자 무조건 분홍색 버튼 처리.(요청)
            //vHtml += '<li><button type="button" class="btn_date active" onclick="bf_gridSearch(\''+$("#sDlrCd").val()+'\', \''+toMonth+i+'\')">'+i+'</button></li>';
            vHtml += '<button type="button" class="btn_date" onclick="bf_gridSearch(\''+$("#sDlrCd").val()+'\', \''+toMonth+i+'\')">'+i+'</button>';
        }else{
             // 현재일자 보다 이전일자 button 처리
            if(isNoEmptyObj(dateObj)){
                if(dateObj[i] != null && i == dateObj[i].dd ){
                    //vHtml += '<li><button type="button" class="btn_date active" onclick="bf_gridSearch(\''+dateObj[i].dlrCd+'\', \''+dateObj[i].yyMmDd+'\')">'+i+'</button></li>';
                    vHtml += '<button type="button" class="btn_date" onclick="bf_gridSearch(\''+dateObj[i].dlrCd+'\', \''+dateObj[i].yyMmDd+'\')">'+i+'</button>';
                }else{
                    vHtml += '<button type="button" class="btn_date" onclick="bf_gridClean()">'+i+'</button>';
                }
            }else{
                vHtml += '<button type="button" class="btn_date" onclick="bf_gridClean()">'+i+'</button>';
            }
        }

    }

    $("#dateBtn").html(vHtml);
    */

}

//obj확인
function isNoEmptyObj(obj){
    var f = false;
    $.each(obj, function(idx, val){
        f = true;
    });
    return f;
}

//function bf_gridSearch(dlrCd, yy  MmDd){
function bf_gridSearch(){
    /*
    params = {};
    params["sDlrCd"]  = dlrCd;
    params["sYyMmDd"] = yyMmDd;
    */

    params = {};
    params["sDlrCd"]  = dlrCd;
    params["sYyMmDd"] = $("#sStartDt").val().replace("-","").replace("-","");

    contentList();

}

bf_gridClean = function(){
    contentList();
}

</script>
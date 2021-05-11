<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frmProcessmgmt" id="frmProcessmgmt" action="<c:url value="/mis/tdm/selectTargetDcptMgmtProcessMgmtSearch.do"/>">
<%
    String sProcessMgmtYyMmDd = request.getParameter("sProcessMgmtYyMmDd");
    pageContext.setAttribute("sProcessMgmtYyMmDd", sProcessMgmtYyMmDd);
%>
<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색 1 -->
        <input type="text" id="sProcessMgmtYyMmDd" name="sProcessMgmtYyMmDd" value="${pageContext.request.contextPath}" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtProcessMgmtSearch" name="btnTargetDcptMgmtProcessMgmtSearch"><spring:message code="global.btn.search" /></button><!-- 과정관리자료조회  -->
    </div>
</div>
<br>
<div class="table_info table_info_v2">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:12%;">
            <col style="width:13%;">
            <col style="width:13%;">
            <col style="width:13%;">
            <col style="width:13%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row" rowspan="3" class="bot_none"><spring:message code="mis.lbl.goalRstRate" /></th><!-- 판매진도  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.salechannel" /></th><!-- 채널  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.salesrate" /></th><!-- 판매율  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.gapvalue" /></th><!-- 차이  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.processday" /></th><!-- 일진도  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.lastmonth" /></th><!-- 지난달  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.lastyearmonth" /></th><!-- 작년동월  -->
            </tr>
            <tr>
                <td><spring:message code="mis.lbl.idcc" /></td><!-- IDCC  -->
                <td>${dcptInfoList.get(0).totalDayDealRate}</td>
                <td>${dcptInfoList.get(0).totalDayDealRate}</td>
                <td>${dcptInfoList.get(0).totalDayGapVal}</td>
                <c:choose>
                <c:when test='${dcptInfoList.get(0).totalDayGapVal > "0" }' >
                <td><a href="javascript:;" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:;" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>

                <c:choose>
                <c:when test='${dcptInfoList.get(0).totalMonthGapVal > "0" }' >
                <td><a href="javascript:lastMonthSaleIdccVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastMonthSaleIdccVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>

                <c:choose>
                <c:when test='${dcptInfoList.get(0).totalYearGapVal > "0" }' >
                <td><a href="javascript:lastYearSaleIdccVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastYearSaleIdccVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>


            </tr>
            <tr>
                <td><spring:message code="mis.lbl.market" /></td><!-- 전시장  -->
                <td>${dcptInfoList.get(1).totalDayDealRate}</td>
                <td>${dcptInfoList.get(1).totalDayDealRate}</td>
                <td>${dcptInfoList.get(1).totalDayGapVal}</td>
                <c:choose>
                <c:when test='${dcptInfoList.get(1).totalDayGapVal > "0" }' >
                <td><a href="javascript:;" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:;" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test='${dcptInfoList.get(1).totalMonthGapVal > "0" }' >
                <td><a href="javascript:lastMonthSaleShopVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastMonthSaleShopVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test='${dcptInfoList.get(1).totalYearGapVal > "0" }' >
                <td><a href="javascript:lastYearSaleShopVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastYearSaleShopVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
            </tr>
        </tbody>
    </table>
</div>
<p class="mt5">* <spring:message code="mis.lbl.dateprocessing" />:<spring:message code="mis.lbl.dateprocessingcomment" /></p><!-- * 일진도:판매목표 대비 일진도 미달 시 경고 표시  -->

<div class="table_info table_info_v2 mt5">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:12%;">
            <col style="width:13%;">
            <col style="width:13%;">
            <col style="width:13%;">
            <col style="width:13%;">
            <col style="width:12%;">
            <col style="width:12%;">
            <col style="width:12%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row" rowspan="3" class="bot_none"><spring:message code="mis.lbl.custRstRate" /></th><!-- 집객진도  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.salechannel" /></th><!-- 채널  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.custRstCnt" /></th><!-- 집객수  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.custRstRate" /></th><!-- 집객진도  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.gapvalue" /></th><!-- 차이  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.processday" /></th><!-- 일진도  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.lastmonth" /></th><!-- 지난달  -->
                <th scope="col" class="th_bg"><spring:message code="mis.lbl.lastyearmonth" /></th><!-- 작년동월  -->
            </tr>
            <tr>
                <td><spring:message code="mis.lbl.idcc" /></td><!-- IDCC  -->
                <td>${dcptInfoList.get(2).totalDayDealRate}</td>
                <td>${dcptInfoList.get(2).totalDayDealRate}</td>
                <td>${dcptInfoList.get(2).totalDayGapVal}</td>

                <c:choose>
                <c:when test='${dcptInfoList.get(2).totalDayGapVal > "0" }' >
                <td><a href="javascript:;" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:;" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test='${dcptInfoList.get(2).totalMonthGapVal > "0" }' >
                <td><a href="javascript:lastMonthCustIdccVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastMonthCustIdccVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test='${dcptInfoList.get(2).totalYearGapVal > "0" }' >
                <td><a href="javascript:lastYearCustIdccVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastYearCustIdccVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td><spring:message code="mis.lbl.market" /></td><!-- 전시장  -->
                <td>${dcptInfoList.get(3).totalDayDealRate}</td>
                <td>${dcptInfoList.get(3).totalDayDealRate}</td>
                <td>${dcptInfoList.get(3).totalDayGapVal}</td>
                <c:choose>
                <c:when test='${dcptInfoList.get(3).totalDayGapVal > "0" }' >
                <td><a href="javascript:;" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:;" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test='${dcptInfoList.get(3).totalMonthGapVal > "0" }' >
                <td><a href="javascript:lastMonthCustShopVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastMonthCustShopVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test='${dcptInfoList.get(3).totalYearGapVal > "0" }' >
                <td><a href="javascript:lastYearCustShopVsitPopup();" class="ico_circle red"></a></td>
                </c:when>
                <c:otherwise>
                <td><a href="javascript:lastYearCustShopVsitPopup();" class="ico_circle green"></a></td>
                </c:otherwise>
                </c:choose>
            </tr>
        </tbody>
    </table>
</div>
</form>
<p class="mt5">* <spring:message code="mis.lbl.dateprocessing" />:<spring:message code="mis.lbl.datecustcomment" /></p><!-- * 일진도:집객목표 대비 일진도 미달 시 경고 표시  -->
<!-- 진도자료 팝업 -->
<section id="lastMonthSaleIdccVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.salesrate" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(0).totalMonthGoalVal}</td>
                    <td>${dcptInfoList.get(0).totalMonthDealRate}</td>
                    <td>${dcptInfoList.get(0).totalMonthGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section id="lastYearSaleIdccVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.salesrate" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(0).totalYearGoalVal}</td>
                    <td>${dcptInfoList.get(0).totalYearDealRate}</td>
                    <td>${dcptInfoList.get(0).totalYearGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<!-- 진도자료 팝업 -->
<section id="lastMonthSaleShopVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.salesrate" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(1).totalMonthGoalVal}</td>
                    <td>${dcptInfoList.get(1).totalMonthDealRate}</td>
                    <td>${dcptInfoList.get(1).totalMonthGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section id="lastYearSaleShopVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.salesrate" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(1).totalYearGoalVal}</td>
                    <td>${dcptInfoList.get(1).totalYearDealRate}</td>
                    <td>${dcptInfoList.get(1).totalYearGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<!-- 진도자료 팝업 -->
<section id="lastMonthCustIdccVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.collectcustomerqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(2).totalMonthGoalVal}</td>
                    <td>${dcptInfoList.get(2).totalMonthDealRate}</td>
                    <td>${dcptInfoList.get(2).totalMonthGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section id="lastYearCustIdccVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.collectcustomerqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(2).totalYearGoalVal}</td>
                    <td>${dcptInfoList.get(2).totalYearDealRate}</td>
                    <td>${dcptInfoList.get(2).totalYearGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<!-- 진도자료 팝업 -->
<section id="lastMonthCustShopVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.collectcustomerqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(3).totalMonthGoalVal}</td>
                    <td>${dcptInfoList.get(3).totalMonthDealRate}</td>
                    <td>${dcptInfoList.get(3).totalMonthGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section id="lastYearCustShopVsitPopup" class="pop_wrap">
    <div class="table_info table_info_v2 mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:40%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code="mis.lbl.collectcustomerqty" /></th><!-- 판매량 -->
                    <th scope="col"><spring:message code="mis.lbl.achievemenprocess" /></th><!-- 달성진도 -->
                    <th scope="col"><spring:message code="mis.lbl.gap" /></th><!-- 차이 -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${dcptInfoList.get(3).totalYearGoalVal}</td>
                    <td>${dcptInfoList.get(3).totalYearDealRate}</td>
                    <td>${dcptInfoList.get(3).totalYearGapVal}</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //진도자료 팝업 -->
<script type="text/javascript">
    $(document).ready(function() {

        $("#sProcessMgmtYyMmDd").kendoDatePicker({
            value:"${sysdate}"
           ,format:"yyyyMMdd"
           ,parseFormats:["yyyyMMdd"]
       });

       $("#sProcessMgmtYyMmDd").kendoMaskedTextBox({
           mask:"########"
       });

       var now = new Date();

       function leadingZeros(n, digits) {
           var zero = '';
           n = n.toString();
           if (n.length < digits) {
               for (i = 0; i < digits - n.length; i++)
                   zero += '0';
           }
           return zero + n;
       }
       if('${sProcessMgmtYyMmDd}' == "" || '${sProcessMgmtYyMmDd}' == 'null') {
           $("#sProcessMgmtYyMmDd").val(leadingZeros(now.getFullYear(), 4)+leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));
       } else {
           $("#sProcessMgmtYyMmDd").val('${sProcessMgmtYyMmDd}');
       }

        $("#btnTargetDcptMgmtProcessMgmtSearch").kendoButton({
            click:function(e) {
                $('#frmProcessmgmt').submit();
               }
        });

        $("#lastMonthSaleIdccVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthSaleIdccVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearSaleIdccVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastYearSaleIdccVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastMonthSaleShopVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthSaleShopVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearSaleShopVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastYearSaleShopVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastMonthCustIdccVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthCustIdccVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearCustIdccVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastYearCustIdccVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastMonthCustShopVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastMonthCustShopVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");

        $("#lastYearCustShopVsitPopup").kendoWindow({
            modal:true,
            resizable:false,
            visible:false,
            field:"lastYearCustShopVsitPopup",
            title:"<spring:message code='mis.lbl.achievemenprocessdata' />",
            width:"300px"
        }).data("kendoWindow");


    });

    function lastMonthSaleIdccVsitPopup(){

        var win = $("#lastMonthSaleIdccVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastYearSaleIdccVsitPopup(){

        var win = $("#lastYearSaleIdccVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastMonthSaleShopVsitPopup(){

        var win = $("#lastMonthSaleShopVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastYearSaleShopVsitPopup(){

        var win = $("#lastYearSaleShopVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastMonthCustIdccVsitPopup(){

        var win = $("#lastMonthCustIdccVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastYearCustIdccVsitPopup(){

        var win = $("#lastYearCustIdccVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastMonthCustShopVsitPopup(){

        var win = $("#lastMonthCustShopVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

    function lastYearCustShopVsitPopup(){

        var win = $("#lastYearCustShopVsitPopup").data("kendoWindow");
        win.center();
        win.open();

    }

</script>
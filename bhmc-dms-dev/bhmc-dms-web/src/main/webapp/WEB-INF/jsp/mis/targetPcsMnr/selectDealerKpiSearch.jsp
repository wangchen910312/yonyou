<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name :selectDealerKpiSearch.jsp
    Description :KPI
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- KPI -->
<form method="post" name="frmMnrKpi" id="frmMnrKpi" action="<c:url value="/mis/tpm/selectDealerKpiSearch.do"/>">
<section class="group">
    <div class="mt0">
        <div class="header_area">
            <div class="left_area ml0">
                <span class="span_txt"><spring:message code="mis.lbl.dcptdate" /></span>
                <input type="text" id="sDcptKpiDate" name="sDcptKpiDate" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
                <span class="span_txt"><spring:message code="mis.lbl.timeprocess" /></span>
                <input type="text" id="sTimeKpiProcess" name="sTimeKpiProcess" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
                <span class="span_txt"><spring:message code="mis.lbl.monitordate" /></span>
                <input type="text" id="sMonitorKpiDate" name="sMonitorKpiDate" value="${searchListVO.sMonitorKpiDate}" style="width:150px;" class="form_comboBox" >
                <dms:access viewId="VIEW-D-10814" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnTargetDcptKpiSearch" name="btnTargetDcptKpiSearch"><spring:message code="global.btn.search" /></button>
                </dms:access>
            </div>
        </div>
        <div class="header_area"></div>
        <div>
            <div class="clfix">
                <div class="left_areaStyle">
                    <div class="table_info table_info_v1">

                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:16%;">
                                <col style="width:21%;">
                                <col style="width:21%;">
                                <col style="width:21%;">
                                <col style="width:21%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" rowspan="2" class="bot_none"><spring:message code="mis.lbl.idcc" /></th><!-- IDCC  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.collectcustomertarget" /></th><!-- 집객목표  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.custRstCnt" /></th><!-- 집객수  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.idcc" /><spring:message code="mis.lbl.visitcnt" /></th><!-- IDCC 내방량  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량  -->
                                </tr>
                                <tr>
                                    <td>${targetPcsMnrSearchVO.kpiIdccTargetCustGoalPrefVal}</td>
                                    <td>${targetPcsMnrSearchVO.kpiIdccCustVsitCnt}</td>
                                    <td>${targetPcsMnrSearchVO.kpiIdccCustReqRate}</td>
                                    <td>${targetPcsMnrSearchVO.kpiIdccDealCnt}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="right_areaStyle">
                    <div class="table_info table_info_v1">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:16%;">
                                <col style="width:15%;">
                                <col style="width:15%;">
                                <col style="width:39%;">
                                <col style="width:15%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" rowspan="2" class="bot_none"><spring:message code="mis.lbl.market" /></th><!-- 전시장  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.collectcustomertarget" /></th><!-- 집객목표  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.custRstCnt" /></th><!-- 집객수  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.shopvisitcustinputinfo" /></th><!-- 전시장방문고객 정보취득수  -->
                                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.salesqty" /></th><!-- 판매량  -->
                                </tr>
                                <tr>
                                    <td>${targetPcsMnrSearchVO.kpiShopTargetCustGoalPrefVal}</td>
                                    <td>${targetPcsMnrSearchVO.kpiShopTargetCustVsitCnt}</td>
                                    <td>${targetPcsMnrSearchVO.kpiShopPrsnInfoCollcRate}</td>
                                    <td>${targetPcsMnrSearchVO.kpiShopDealCnt}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2 mt5">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:20%;">
                        <col style="width:13%;">
                        <col style="width:13%;">
                        <col style="width:13%;">
                        <col style="width:13%;">
                        <col style="width:13%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="th_bg"><spring:message code="mis.lbl.salechannel" /></th><!-- 채널  -->
                            <th scope="col"><spring:message code="mis.lbl.gubn" /></th><!-- 구분  -->
                            <th scope="col"><spring:message code="mis.lbl.nowvalue" />(%)</th><!-- 현재값  -->
                            <th scope="col"><spring:message code="mis.lbl.targetsvalue" />(%)</th><!-- 목표값  -->
                            <th scope="col"><spring:message code="mis.lbl.comparisontarget" />(<spring:message code="mis.lbl.areatop" />/<spring:message code="mis.lbl.average" />)(%)</th><!-- 대비목표(지역우수/평균)  -->
                            <th scope="col"><spring:message code="mis.lbl.recently3monthaverage" />(%)</th><!-- 최근 3개월 평균  -->
                            <th scope="col"><spring:message code="mis.lbl.samerefervalue" />(%)</th><!-- 업종 참고값  -->
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" rowspan="3"><spring:message code="mis.lbl.idcc" /></th><!-- IDCC  -->
                            <td><spring:message code="mis.lbl.kpiIdccCustVsitRate" /></td><!-- 내방요청율  -->
                            <c:choose>
                                <c:when test='${targetPcsMnrSearchVO.kpiIdccCustVsitRate < targetPcsMnrSearchVO.targetIdccVsitReqRate }' >
                                    <td class="f_font03">${targetPcsMnrSearchVO.kpiIdccCustVsitRate}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${targetPcsMnrSearchVO.kpiIdccCustVsitRate}</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${targetPcsMnrSearchVO.targetIdccVsitReqRate}</td>
                            <td>${targetPcsMnrSearchVO.idccVsitReqRateData}</td>
                            <td>${targetPcsMnrSearchVO.kpiIdcc3MCustVsitRate}</td>
                            <td>${targetPcsMnrSearchVO.referCustReqRate}</td>
                        </tr>
                        <tr>
                            <td><spring:message code="mis.lbl.kpiIdccVsitDealCnt" /></td><!-- 내방거래율  -->
                            <c:choose>
                                <c:when test='${targetPcsMnrSearchVO.kpiIdccVsitDealCnt < targetPcsMnrSearchVO.targetIdccVsitDealRate }' >
                                    <td class="f_font03">${targetPcsMnrSearchVO.kpiIdccVsitDealCnt}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${targetPcsMnrSearchVO.kpiIdccVsitDealCnt}</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${targetPcsMnrSearchVO.targetIdccVsitDealRate}</td>
                            <td>${targetPcsMnrSearchVO.idccVsitDealRateData}</td>
                            <td>${targetPcsMnrSearchVO.kpiIdcc3MVsitDealCnt}</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td><spring:message code="mis.lbl.dealrate" /></td><!-- 거래율  -->
                            <c:choose>
                                <c:when test='${targetPcsMnrSearchVO.kpiIdccVsitDealRate < targetPcsMnrSearchVO.targetIdccDealRate }' >
                                    <td class="f_font03">${targetPcsMnrSearchVO.kpiIdccVsitDealRate}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${targetPcsMnrSearchVO.kpiIdccVsitDealRate}</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${targetPcsMnrSearchVO.targetIdccDealRate}</td>
                            <td>${targetPcsMnrSearchVO.idccTotDealRateData}</td>
                            <td>${targetPcsMnrSearchVO.kpiIdcc3MVsitDealRate}</td>
                            <td>${targetPcsMnrSearchVO.referCustDealRate}</td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2"><spring:message code="mis.lbl.market" /></th><!-- 전시장  -->
                            <td><spring:message code="mis.lbl.kpiShopVsitPrsnInfoCollcRate" /></td><!-- 개인정보 제공율  -->
                            <c:choose>
                                <c:when test='${targetPcsMnrSearchVO.kpiShopVsitPrsnInfoCollcRate < targetPcsMnrSearchVO.targetShopPrsnInfoCollcRate }' >
                                    <td class="f_font03">${targetPcsMnrSearchVO.kpiShopVsitPrsnInfoCollcRate}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${targetPcsMnrSearchVO.kpiShopVsitPrsnInfoCollcRate}</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${targetPcsMnrSearchVO.targetShopPrsnInfoCollcRate}</td>
                            <td>${targetPcsMnrSearchVO.marketPrsnInfoOfferRate}</td>
                            <td>${targetPcsMnrSearchVO.kpiShop3MVsitPrsnInfoCollcRate}</td>
                            <td>${targetPcsMnrSearchVO.referPrsnInfoCollcRate}</td>
                        </tr>
                        <tr>
                            <td><spring:message code="mis.lbl.kpiShopVsitSuccessRate" /></td><!-- 성공율  -->
                            <c:choose>
                                <c:when test='${0 < targetPcsMnrSearchVO.kpiShopVsitSuccessRate }' >
                                    <td class="f_font03">0</td>
                                </c:when>
                                <c:otherwise>
                                    <td>0</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${targetPcsMnrSearchVO.kpiShopVsitSuccessRate}</td>
                            <td>${targetPcsMnrSearchVO.marketSuccRateExec}</td>
                            <td>${targetPcsMnrSearchVO.kpiShop3MVsitSuccessRate}</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="mis.lbl.summary" /></th><!-- 집계  -->
                            <td><spring:message code="mis.lbl.kpiShopCustTargetAchieve" /></td><!-- 목표달성율  -->
                            <c:choose>
                                <c:when test='${targetPcsMnrSearchVO.kpiShopCustTargetAchieve < targetPcsMnrSearchVO.kpiShopCustTargetAchieve }' >
                                    <td class="f_font03">${targetPcsMnrSearchVO.kpiShopCustTargetAchieve}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${targetPcsMnrSearchVO.kpiShopCustTargetAchieve}</td>
                                </c:otherwise>
                            </c:choose>
                            <td>0</td>
                            <td>${targetPcsMnrSearchVO.totalGoalAchvRate}</td>
                            <td>${targetPcsMnrSearchVO.kpiShop3MCustTargetAchieve}</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</form>
<script type="text/javascript">

    $(document).ready(function() {

        $("#sMonitorKpiDate").kendoDatePicker({
            value:"${sysdate}"
            ,format:"yyyyMMdd"
            ,parseFormats:["yyyyMMdd"]
        });

        $("#sMonitorKpiDate").kendoMaskedTextBox({
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

        if('${searchListVO.sMonitorKpiDate}' == "" || '${searchListVO.sMonitorKpiDate}' == 'null') {
            $("#sMonitorKpiDate").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));

        } else {

            $("#sMonitorKpiDate").val('${searchListVO.sMonitorKpiDate}');
        }

        var sMonitorDate = $("#sMonitorKpiDate").val();
        var sMonitorYear = sMonitorDate.substr(0,4);
        var sMonitorMonth = sMonitorDate.substr(4,2);
        var sMonitorDay = sMonitorDate.substr(6,2);
        var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

        $("#sDcptKpiDate").val(sMonitorYear + sMonitorMonth + '01');
        $("#sTimeKpiProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

        $("#btnTargetDcptKpiSearch").kendoButton({
            click:function(e) {

                var sMonitorDate = $("#sMonitorKpiDate").val();
                var sMonitorYear = sMonitorDate.substr(0,4);
                var sMonitorMonth = sMonitorDate.substr(4,2);
                var sMonitorDay = sMonitorDate.substr(6,2);
                var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

                $("#sDcptKpiDate").val(sMonitorYear + sMonitorMonth + '01');
                $("#sTimeKpiProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

                $('#frmMnrKpi').submit();
               }
        });

    });

</script>
<!-- KPI -->
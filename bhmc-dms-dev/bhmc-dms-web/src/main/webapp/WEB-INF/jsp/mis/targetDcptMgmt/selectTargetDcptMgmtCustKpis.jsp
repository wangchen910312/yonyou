<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frmCustkpi" id="frmCustkpi" action="<c:url value="/mis/tdm/selectTargetDcptMgmtCustKpiSearch.do"/>">
<%
    String sCustKpiYyMmDd = request.getParameter("sCustKpiYyMmDd");
    pageContext.setAttribute("sCustKpiYyMmDd", sCustKpiYyMmDd);

    String eCustKpiYyMmDd = request.getParameter("eCustKpiYyMmDd");
    pageContext.setAttribute("eCustKpiYyMmDd", eCustKpiYyMmDd);
%>

<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색 1 -->
        <input type="text" id="sCustKpiYyMmDd" name="sCustKpiYyMmDd" value="${pageContext.request.contextPath}" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <span class="span_txt pr0">~</span>
        <input type="text" id="eCustKpiYyMmDd" name="eCustKpiYyMmDd" value="${pageContext.request.contextPath}" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <label class="label_check ml15"><input type="radio" name="radio1" checked class="form_check" value="D"> <spring:message code="mis.lbl.data" /></label><!-- 데이터  -->
        <label class="label_check"><input type="radio" name="radio1" class="form_check" value="C"> <spring:message code="mis.lbl.chart" /></label><!-- 차트  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtCustKpiSearch" name="btnTargetDcptMgmtCustKpiSearch"><spring:message code="global.btn.search" /></button><!-- KPI 자료조회  -->
    </div>
</div>
<br>
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
                            <td>${targetDcptMgmtSearchVO.kpiIdccTargetCustGoalPrefVal}</td>
                            <td>${targetDcptMgmtSearchVO.kpiIdccCustVsitCnt}</td>
                            <td>${targetDcptMgmtSearchVO.kpiIdccCustReqRate}</td>
                            <td>${targetDcptMgmtSearchVO.kpiIdccDealCnt}</td>
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
                            <td>${targetDcptMgmtSearchVO.kpiShopTargetCustGoalPrefVal}</td>
                            <td>${targetDcptMgmtSearchVO.kpiShopTargetCustVsitCnt}</td>
                            <td>${targetDcptMgmtSearchVO.kpiShopPrsnInfoCollcRate}</td>
                            <td>${targetDcptMgmtSearchVO.kpiShopDealCnt}</td>
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
                <col style="width:18%;">
                <col style="width:16%;">
                <col style="width:20%;">
                <col style="width:17%;">
                <col style="width:17%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="th_bg"><spring:message code="mis.lbl.salechannel" /></th><!-- 채널  -->
                    <th scope="col"><spring:message code="mis.lbl.gubn" /></th><!-- 구분  -->
                    <th scope="col"><spring:message code="mis.lbl.value" />(%)</th><!-- 값  -->
                    <th scope="col"><spring:message code="mis.lbl.comparisontarget" />(<spring:message code="mis.lbl.areatop" />/<spring:message code="mis.lbl.average" />)(%)</th><!-- 대비목표(지역우수/평균)  -->
                    <th scope="col"><spring:message code="mis.lbl.recently3monthaverage" />(%)</th><!-- 최근 3개월 평균  -->
                    <th scope="col"><spring:message code="mis.lbl.samerefervalue" />(%)</th><!-- 업종 참고값  -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row" rowspan="4"><spring:message code="mis.lbl.idcc" /></th><!-- IDCC  -->
                    <td><spring:message code="mis.lbl.kpiIdccCustVsitRate" /></td><!-- 내방요청율  -->
                    <td>${targetDcptMgmtSearchVO.kpiIdccCustVsitRate}</td>
                    <td>-</td>
                    <td>${targetDcptMgmtSearchVO.kpiIdcc3MCustVsitRate}</td>
                    <td>${targetDcptMgmtSearchVO.referCustReqRate}</td>
                </tr>
                <tr>
                    <td><spring:message code="mis.lbl.kpiIdccVsitDealCnt" /></td><!-- 내방거래율  -->
                    <td>${targetDcptMgmtSearchVO.kpiIdccVsitDealCnt}</td>
                    <td>-</td>
                    <td>${targetDcptMgmtSearchVO.kpiIdcc3MVsitDealCnt}</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td><spring:message code="mis.lbl.revisitcustrate" /></td><!-- 재방문율  -->
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td><spring:message code="mis.lbl.dealrate" /></td><!-- 거래율  -->
                    <td>${targetDcptMgmtSearchVO.kpiIdccVsitDealRate}</td>
                    <td>-</td>
                    <td>${targetDcptMgmtSearchVO.kpiIdcc3MVsitDealRate}</td>
                    <td>${targetDcptMgmtSearchVO.referCustDealRate}</td>
                </tr>
                <tr>
                    <th scope="row" rowspan="3"><spring:message code="mis.lbl.market" /></th><!-- 전시장  -->
                    <td><spring:message code="mis.lbl.kpiShopVsitPrsnInfoCollcRate" /></td><!-- 개인정보 제공율  -->
                    <td>${targetDcptMgmtSearchVO.kpiShopVsitPrsnInfoCollcRate}</td>
                    <td>-</td>
                    <td>${targetDcptMgmtSearchVO.kpiShop3MVsitPrsnInfoCollcRate}</td>
                    <td>${targetDcptMgmtSearchVO.referPrsnInfoCollcRate}</td>
                </tr>
                <tr>
                    <td><spring:message code="mis.lbl.revisitcustrate" /></td><!-- 재방문율  -->
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td><spring:message code="mis.lbl.kpiShopVsitSuccessRate" /></td><!-- 성공율  -->
                    <td>${targetDcptMgmtSearchVO.kpiShopVsitSuccessRate}</td>
                    <td>-</td>
                    <td>${targetDcptMgmtSearchVO.kpiShop3MVsitSuccessRate}</td>
                    <td>-</td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="mis.lbl.summary" /></th><!-- 집계  -->
                    <td><spring:message code="mis.lbl.kpiShopCustTargetAchieve" /></td><!-- 목표달성율  -->
                    <td>${targetDcptMgmtSearchVO.kpiShopCustTargetAchieve}</td>
                    <td>-</td>
                    <td>${targetDcptMgmtSearchVO.kpiShop3MCustTargetAchieve}</td>
                    <td>-</td>
                </tr>
                <tr>
                    <th scope="row" colspan="2"><spring:message code="mis.lbl.kpiTotalDealRate" /></th><!-- 종합거래율  -->
                    <td>${targetDcptMgmtSearchVO.kpiTotalDealRate}</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</form>
<!-- //데이터 -->

<!-- 차트 -->
<div style="display:none;">
    <div style="height:300px;border:1px solid #c1cbd2;">차트영역</div>
</div>
<!-- //차트 -->

<script type="text/javascript">
    $(document).ready(function() {

       $("#sCustKpiYyMmDd").kendoDatePicker({
            value:"${sysdate}"
           ,format:"yyyyMMdd"
           ,parseFormats:["yyyyMMdd"]
       });

       $("#sCustKpiYyMmDd").kendoMaskedTextBox({
           mask:"########"
       });

       $("#eCustKpiYyMmDd").kendoDatePicker({
           value:"${sysdate}"
          ,format:"yyyyMMdd"
          ,parseFormats:["yyyyMMdd"]
       });

       $("#eCustKpiYyMmDd").kendoMaskedTextBox({
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

        if('${sCustKpiYyMmDd}' == "" || '${sCustKpiYyMmDd}' == 'null') {
            $("#sCustKpiYyMmDd").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));
        } else {
            $("#sCustKpiYyMmDd").val('${sCustKpiYyMmDd}');
        }

        if('${eCustKpiYyMmDd}' == "" || '${eCustKpiYyMmDd}' == 'null') {
            $("#eCustKpiYyMmDd").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));
        } else {
            $("#eCustKpiYyMmDd").val('${sCustKpiYyMmDd}');
        }

        $("#btnTargetDcptMgmtCustKpiSearch").kendoButton({
            click:function(e) {
                $('#frmCustkpi').submit();
               }
        });
    });
</script>
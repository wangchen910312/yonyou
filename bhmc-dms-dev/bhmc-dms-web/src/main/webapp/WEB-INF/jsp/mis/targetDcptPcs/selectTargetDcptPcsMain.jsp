<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frm" id="frm">
<!-- 목표분해 흐름도 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic title_basic_v1"><spring:message code="mis.menu.targetprocess" /></h1>
    </div>

    <div class="flowchart">
        <ul>
            <li><a href="javascript:;"><span><spring:message code="mis.lbl.trendlink" /></span></a><!-- 트랜드 -->
                <ul>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.markettrendlink" /></span></a><!-- 시장트랜드 -->
                        <div class="bg_flowchart01"></div>
                        <div class="bg_flowchart02"></div>
                    </li>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.dealerhistorydatalink" /></span></a><!-- 딜러역사 데이터기록 -->
                        <div class="bg_flowchart01"></div>
                        <div class="bg_flowchart03"></div>
                    </li>
                    <li><a href="javascript:carcompanylink();"><span><spring:message code="mis.lbl.carcompanylink" /></span></a><!-- 자동차업 참조 -->
                </ul>
            </li>
            <li><a href="javascript:targetdcptlink();"><span><spring:message code="mis.lbl.targetdcptlink" /></span></a><!-- 목표분해 -->
                <ul>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.manutargetlink" /></span></a><!-- 제조사목표 -->
                        <div class="bg_flowchart02"></div>
                    </li>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.saletargetdcptlink" /></span></a><!-- 판매목표분해 -->
                        <div class="bg_flowchart04"></div>
                        <div class="bg_flowchart03"></div>
                    </li>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.crmtargetdcptlink" /></span></a></li><!-- 집객목표분해 -->
                </ul>
            </li>
            <li><a href="javascript:;"><span><spring:message code="mis.lbl.advantagelink" /></span></a><!-- 장점 -->
                <ul>
                    <li><a href="javascript:profitindexdcptlink();"><span><spring:message code="mis.lbl.profitindexdcptlink" /></span></a><!-- 이익지표분해 -->
                        <div class="bg_flowchart03"></div>
                    </li>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></span></a></li><!-- 파생이익지표분해 -->
                </ul>
            </li>
            <li class="last_child"><a href="javascript:;"><span><spring:message code="mis.lbl.processscreeninglink" /></span></a><!-- 과정심사 -->
                <ul>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.saleprocessmonitorlink" /></span></a><!-- 판매과정모니터링 -->
                        <div class="bg_flowchart02"></div>
                    </li>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.crmprocessmonitorlink" /></span></a><!-- 고객집객모니터링 -->
                        <div class="bg_flowchart03"></div>
                    </li>
                    <li><a href="javascript:;"><span><spring:message code="mis.lbl.kpilink" /></span></a></li><!-- KPI화면 및 보고서<br>정의 지표관리 -->
                </ul>
            </li>
        </ul>
    </div>
</section>
<!-- //목표분해 흐름도 -->
</form>
<script>

    function carcompanylink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.title.targetrefersamebsns" />', _contextPath + "/mis/tmp/selectTargetReferSameBsnsMain.do", "VIEW-D-10555");
    }

    function targetdcptlink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.title.targetdcptmgmt" />', _contextPath + "/mis/tdm/selectTargetDcptMgmtMain.do");
    }

    function profitindexdcptlink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.title.saleprofit" />', _contextPath + "/mis/tsp/selectTargetSaleProfitMain.do");
    }

    $(document).ready(function() {



    });
</script>
<!-- //script -->
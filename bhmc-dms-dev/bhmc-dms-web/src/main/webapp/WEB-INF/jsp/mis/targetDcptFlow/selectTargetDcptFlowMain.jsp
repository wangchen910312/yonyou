<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name:selectTargetDcptFlowMain.jsp
    Description:목표 분해 흐름도
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>

<!-- 목표분해 흐름도 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic title_basic_v1"><spring:message code="mis.menu.targetprocess" /></h1>
    </div>

    <div class="flowchart">
        <ul>
            <li><a><span><spring:message code="mis.lbl.trendlink" /></span></a>
            <div class="bg_flowchart01"></div>
                <ul>
                    <li><a><span><spring:message code="mis.lbl.markettrendlink" /></span></a></li>
                    <li><a><span><spring:message code="mis.lbl.dealerhistorydatalink" /></span></a></li>
                    <li><a><span><spring:message code="mis.lbl.carcompanylink" /></span></a></li>
                </ul>
            </li>
            <li><a><span><spring:message code="mis.lbl.targetdcptlink" /></span></a>
            <div class="bg_flowchart01"></div>
                <ul>
                    <li><a><span><spring:message code="mis.lbl.manutargetlink" /></span></a></li>
                    <li><a><span><spring:message code="mis.lbl.saletargetdcptlink" /></span></a>
                        <ul>
                            <li><a href="javascript:targetDcptStepSearchlink();" class="flowlink f_color03 f_line03"><span><spring:message code="mis.lbl.all" /></span></a></li>
                            <li><a href="javascript:dealerDcptSaleSearchlink();" class="flowlink f_color03 f_line03"><span><spring:message code="mis.lbl.detail" /></span></a></li>
                        </ul>
                    </li>
                    <li><a><span><span><spring:message code="mis.lbl.processtargetdcptmgmt" /></span></a>
                        <ul>
                            <li><a href="javascript:targetDcptStepSearchlink();" class="flowlink f_color03 f_line03"><span><spring:message code="mis.lbl.all" /></span></a></li>
                            <li><a href="javascript:dealerDcptCustSearchlink();" class="flowlink f_color03 f_line03"><span><spring:message code="mis.lbl.detail" /></span></a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a><span><spring:message code="mis.lbl.advantagelink" /></span></a>
            <div class="bg_flowchart01"></div>
                <ul>
                    <li><a class="flowlink"><span><spring:message code="mis.lbl.oneprofitprediction" /></span></a></li>
                    <li><a><span><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></span></a>
                        <ul>
                            <li><a href="javascript:targetDcptStepSearchlink();" class="flowlink f_color03 f_line03"><span><spring:message code="mis.lbl.all" /></span></a></li>
                            <li><a href="javascript:derivationProfitSearchlink();" class="flowlink f_color03 f_line03"><span><spring:message code="mis.lbl.detail" /></span></a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="last_child"><a><span><spring:message code="mis.lbl.processscreeninglink" /></span></a>
                <ul>
                    <li><a><span><spring:message code="mis.lbl.saleprocessmonitorlink" /></span></a></li>
                    <li><a><span><spring:message code="mis.lbl.crmprocessmonitorlink" /></span></a></li>
                    <li><a><span><spring:message code="mis.lbl.kpilink" /></span></a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- //목표분해 흐름도 -->

            <div class="header_area">
                <h2 class="title_basic">目的与意义</h2>
            </div>
            <div class="flowcont">
                <dl>
                    <dt>1、思路梳理</dt>
                    <dd>目标分解是特约店精细化数据管理的过程，利用此工具有助于特约店梳理目标分解思路。</dd>
                    <dt>2、效率提升</dt>
                    <dd>从不同维度将销售、集客、盈利目标分解至销售顾问或车型，优化目标分解效率。</dd>
                    <dt>3、过程诊断</dt>
                    <dd>此工具包含过程监控模块并能实现KPI的自动呈现，有利于科学合理的诊断与把控销自店售过程及节奏。</dd>
                </dl>
                <div class="tablearea">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:20%;">
                            <col style="width:45%;">
                            <col style="width:35%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="th_bg">术语</th>
                                <th>定义 / 计算方式</th>
                                <th>备注</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>IDCC集客量</th>
                                <td>IDCC新增建档数量（有效线索）</td>
                                <td>有姓氏、联系方式、购车意向</td>
                            </tr>
                            <tr>
                                <th>展厅集客量</th>
                                <td>首次自然进店客户量</td>
                                <td>强调首次进店客户留档数</td>
                            </tr>
                            <tr>
                                <th>IDCC邀约进店率</th>
                                <td>实际邀约到店数量 / IDCC新增建档数量（有效线索）</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>IDCC进店成交率</th>
                                <td>IDCC成交数量 / 实际邀约到店数量</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>IDCC成交率</th>
                                <td>IDCC月度新增订单数 / IDCC新增建档数量（有效线索）</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>展厅留档率</th>
                                <td>月度首次自然进店建档量 ／月度首次自然进店客户量</td>
                                <td>留档信息中必须包含电话信息</td>
                            </tr>
                            <tr>
                                <th>展厅成交率</th>
                                <td>展厅月度新增订单数／月度首次自然进店建档量</td>
                                <td>强调首次进店客户留档数</td>
                            </tr>
                            <tr>
                                <th>IDCC集客目标</th>
                                <td>需要获得的IDCC新增建档数量（有效线索）</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>展厅集客目标</th>
                                <td>需要获得的首次自然进店顾客数量</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>集客目标达成率</th>
                                <td>（IDCC集客量+展厅集客量）/（IDCC集客目标 + 展厅集客目标）</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>IDCC销售完成进度</th>
                                <td>IDCC目前销量 / IDCC销售目标</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>展厅销售完成进度</th>
                                <td>展厅目前销量 / 展厅销售目标</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>IDCC销售缺口</th>
                                <td>IDCC销售目标 - IDCC目前销量</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>展厅销售缺口</th>
                                <td>展厅销售目标 - 展厅目前销量</td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>自店精品单车产值</th>
                                <td>新车精品销售额（IDCC + 展厅）／月度交车数（IDCC + 展厅）</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>自店金融渗透率</th>
                                <td>新车贷款购车数（IDCC + 展厅）／月度交车数（IDCC + 展厅）</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th>自店保险渗透率</th>
                                <td>新车商业险购车数（IDCC + 展厅）／月度交车数（IDCC + 展厅）</td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

</section>
<!-- //목표분해 흐름도 -->

<script>

    function targetDcptStepSearchlink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.title.targetdcptstep" />', _contextPath + "/mis/tds/selectTargetDcptStepMain.do?tabNo=2", "VIEW-D-10559");
    }

    function dealerDcptSaleSearchlink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.lbl.dealerdcptsale" />', _contextPath + "/mis/tds/selectTargetDcptStepMain.do?tabNo=3", "VIEW-D-10559");
    }

    function dealerDcptCustSearchlink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.lbl.dealerdcptcust" />', _contextPath + "/mis/tds/selectTargetDcptStepMain.do?tabNo=4", "VIEW-D-10559");
    }

    function derivationProfitSearchlink(){
        parent._createOrReloadTabMenu('<spring:message code="mis.lbl.derivationprofitindexdcptlink" />', _contextPath + "/mis/tds/selectTargetDcptStepMain.do?tabNo=5", "VIEW-D-10559");
    }

    $(document).ready(function() {



    });
</script>

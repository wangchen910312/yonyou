<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 配件销售结算 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><%-- <spring:message code="par.menu.partCalculate" /> --%></h1>
                    <div class="btn_right">
                        <button class="btn_m" id="btnConfirm"><spring:message code="global.btn.confirm" /><!-- 확인 --></button>
                        <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
                        <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
                        <button class="btn_m btn_cancel" id="btnClose"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                        <button class="btn_m" id="btnPrint"><spring:message code="global.btn.print" /></button><!-- 인쇄 -->
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">销售单号</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message    code="par.lbl.bpCstNm" /></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message    code="par.lbl.giDt" /></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input value="" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input value="" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">销售日期<!--  --></th>
                                <th scope="col" data-field="data2">销售单号<!--  --></th>
                                <th scope="col" data-field="data3">结算号码<!--  --></th>
                                <th scope="col" data-field="data4">客户名称<!--  --></th>
                                <th scope="col" data-field="data5">电话<!--  --></th>
                                <th scope="col" data-field="data6">总金额<!--  --></th>
                                <th scope="col" data-field="data7">折扣金额<!--  --></th>
                                <th scope="col" data-field="data8">总计<!--  --></th>
                                <th scope="col" data-field="data9">销售单号<!--  --></th>
                                <th scope="col" data-field="data10">配件编码<!--  --></th>
                                <th scope="col" data-field="data11">配件名称<!--  --></th>
                                <th scope="col" data-field="data12">数量<!--  --></th>
                                <th scope="col" data-field="data13">金额<!--  --></th>
                                <th scope="col" data-field="data14">税额<!--  --></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </section>
            <!-- //配件销售结算 -->

            <!-- 합계 -->
            <section class="group">
                <div class="header_area">
                    <div class="btn_right" style="float:left;">
                        <button type="button" class="btn_s" id="sBenfAuth">优惠权限</button>
                    </div>
                    <div class="btn_right">
                        <button type="button" class="btn_s" id="sPreBalAmt">预存款</button>
                        <button type="button" class="btn_s" id="sPrePaidAmt">预付款</button>
                        <button type="button" class="btn_s" id="sMembDc">会员优惠</button>
                    </div>
                </div>
                <div class="table_list table_list_v1">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:12%;">
                            <col style="width:12%;">
                            <col style="width:12%;">
                            <col style="width:12%;">
                            <col style="width:12%;">
                            <col style="width:12%;">
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="colgroup" class="hasBob">结算费用</th>
                                <th scope="colgroup" class="hasBob">结算金额</th>
                                <th scope="colgroup" class="hasBob">折扣率</th>
                                <th scope="colgroup" class="hasBob">折扣金额</th>
                                <th scope="colgroup" class="hasBob">BM积分使用金额</th>
                                <th scope="colgroup" class="hasBob">积分使用金额</th>
                                <th scope="colgroup" class="hasBob">其他优惠金额</th>
                                <th scope="colgroup" class="hasBob">最终结算金额</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>配件费小计</th>
                                <td class="ar child_borderNone">0</td>
                                <td class="ar child_borderNone">0</td>
                                <td class="ar child_borderNone">0</td>
                                <td class="ar child_borderNone">0</td>
                                <td class="ar child_borderNone">0</td>
                                <td class="ar child_borderNone">0</td>
                                <td class="ar td_total child_borderNone"><strong>0</strong></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">服务结算号码<!--  --></th>
                                <th scope="col" data-field="data2">付款者<!--  --></th>
                                <th scope="col" data-field="data3">付款类型<!--  --></th>
                                <th scope="col" data-field="data4">付款期限<!--  --></th>
                                <th scope="col" data-field="data5">付款方式<!--  --></th>
                                <th scope="col" data-field="data6">应收金额<!--  --></th>
                                <th scope="col" data-field="data7">欠收金额<!--  --></th>
                                <th scope="col" data-field="data8">付款备注<!--  --></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>


            </section>
            <!-- //합계 -->
<!-- script -->
<script>
    $(document).ready(function() {
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".form_comboBox").kendoExtDropDownList();
        $(".form_numeric").kendoExtNumericTextBox();
        $(".grid").kendoGrid({
            height:196
        });
        $(".btn_s, .btn_m").kendoButton();
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });


        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 확인 버튼
        $("#btnConfirm").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 닫기 버튼
        $("#btnClose").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 인쇄 버튼
        $("#btnPrint").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 예치금 버튼
        $("#sPreBalAmt").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 선불금 버튼
        $("#sPrePaidAmt").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 회원할인 버튼
        $("#sMembDc").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });
        // 혜택권한 버튼
        $("#sBenfAuth").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });




    });
</script>
<!-- //script -->


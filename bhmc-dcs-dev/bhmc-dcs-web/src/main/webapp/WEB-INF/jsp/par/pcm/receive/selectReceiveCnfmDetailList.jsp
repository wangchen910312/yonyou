<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 入库现况 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><!-- 入库现况 --></h1>
                    <div class="btn_right">
                        <button class="btn_m btn_search">查询</button>
                    </div>
                </div>
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:20%;">
                            <col style="width:12%;">
                            <col style="width:20%;">
                            <col style="width:12%;">
                            <col style="width:22%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">供应商</th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                                <th scope="row">订单号</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row"><span class="bu_required">入库日期</span></th>
                                <td class="required_area">
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
                            <tr>
                                <th scope="row">配件编号</th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" value="" class="form_input">
                                        <a href="javascript:;">검색</a>
                                    </div>
                                </td>
                                <th scope="row">车种</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">配件等级</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">配件名称</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">入库仓库</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th/>
                                <td/>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">序<!--  --></th>
                                <th scope="col" data-field="data2">供应商<!--  --></th>
                                <th scope="col" data-field="data3">入库日期<!--  --></th>
                                <th scope="col" data-field="data4">入库单号<!--  --></th>
                                <th scope="col" data-field="data5">装箱单编号<!--  --></th>
                                <th scope="col" data-field="data6">订单编号<!--  --></th>
                                <th scope="col" data-field="data7">行号<!--  --></th>
                                <th scope="col" data-field="data8">配件编号<!--  --></th>
                                <th scope="col" data-field="data9">配件名称<!--  --></th>
                                <th scope="col" data-field="data10">入库数量<!--  --></th>
                                <th scope="col" data-field="data11">单价(不含税)<!--  --></th>
                                <th scope="col" data-field="data12">单价<!--  --></th>
                                <th scope="col" data-field="data13">金额<!--  --></th>
                                <th scope="col" data-field="data14">退货数量<!--  --></th>
                                <th scope="col" data-field="data15">退货日期<!--  --></th>
                                <th scope="col" data-field="data16">退货时间<!--  --></th>
                                <th scope="col" data-field="data17">退货者<!--  --></th>
                                <th scope="col" data-field="data18">仓库<!--  --></th>
                                <th scope="col" data-field="data19">货位<!--  --></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //入库现况 -->

            <script>
            $(document).ready(function() {
                $(".form_datepicker").kendoDatePicker({
                    format:"yyyy-MM-dd"
                });
                $(".grid").kendoGrid({
                    height:406
                });
                $(".form_comboBox").kendoExtDropDownList();
                $(".btn_s, .btn_m").kendoButton({
                    click:function(e) {
                        dms.notification.warning("<spring:message code='global.info.ready'/>");
                    }
                });
            });

            </script>
            <!-- //script -->

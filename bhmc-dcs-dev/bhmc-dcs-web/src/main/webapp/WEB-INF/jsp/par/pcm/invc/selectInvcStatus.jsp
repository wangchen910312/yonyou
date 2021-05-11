<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section id="content">

    <!-- 装箱单现况查询  영역 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 装箱单现况查询 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search">查询</button><!-- 조회 -->
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">装箱单类型</th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row">装箱单编号</th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">装箱单日期 </th>
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
                    <tr>
                        <th scope="row">供应商 </th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">装箱单状态</th>
                        <td>

                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row">确认日期 </th>
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
                    <tr>
                        <th scope="row">配件编号</th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">发货PDC</th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">车型
                        </th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row">配件等级
                        </th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td>
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
                        <th scope="col" data-field="data1">序<!--  --></th>
                        <th scope="col" data-field="data2">装箱单类型<!--  --></th>
                        <th scope="col" data-field="data3">装箱单状态<!--  --></th>
                        <th scope="col" data-field="data4">装箱单日期<!--  --></th>
                        <th scope="col" data-field="data5">确认日期<!--  --></th>
                        <th scope="col" data-field="data6">供应商<!--  --></th>
                        <th scope="col" data-field="data7">装箱单编号<!--  --></th>
                        <th scope="col" data-field="data8">订单号<!--  --></th>
                        <th scope="col" data-field="data9">行号<!--  --></th>
                        <th scope="col" data-field="data10">税金代码<!--  --></th>
                        <th scope="col" data-field="data11">数量<!--  --></th>
                        <th scope="col" data-field="data12">单位<!--  --></th>
                        <th scope="col" data-field="data13">单价<!--  --></th>
                        <th scope="col" data-field="data14">金额<!--  --></th>
                        <th scope="col" data-field="data15">税额<!--  --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // 入库清单 영역 -->

</section>
<!-- //content -->

<!-- script -->
<script>
    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".grid").kendoGrid({
            height:384
        });
        $(".form_comboBox").kendoExtDropDownList();
    });
</script>
<!-- //script -->
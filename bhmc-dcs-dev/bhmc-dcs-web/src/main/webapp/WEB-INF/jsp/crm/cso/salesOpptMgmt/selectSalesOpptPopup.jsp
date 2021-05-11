<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


    <!-- 판매기회 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="tab_area">
            <ul>
                <li class="k-state-active">商机</li>
                <li>商机记录</li>
            </ul>

            <span class="btn_right_absolute">
                <button type="button" class="btn_s">保存</button>
            </span>

            <!-- 商机 -->
            <div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:22%;">
                            <col style="width:11%;">
                            <col style="width:22%;">
                            <col style="width:11%;">
                            <col style="width:22%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">客户名</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">移动电话</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">客户类型</th>
                                <td>
                                    <input type="text" value="" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">潜在/保有客户</th>
                                <td>
                                    <input type="text" value="" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row">销售顾问</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">售后维修担当</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">商机概述</th>
                                <td colspan="5">
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">商机阶段</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">预计销售日期</th>
                                <td>
                                    <input type="text" value="" class="form_datepicker">
                                </td>
                                <th scope="row">商机来源</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">转出状态</th>
                                <td>
                                    <input type="text" value="" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row">成功概率</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">录入日</th>
                                <td>
                                    <input type="text" value="" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">意向车种</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">意向车型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row">失败类型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">失败1级原因</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">失败2级原因</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">失败品牌</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">失败车型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td colspan="2"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //商机 -->

            <!-- 商机记录 -->
            <div>
                <div class="table_grid">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">No</th>
                                <th scope="col" data-field="data2">主要意向车辆</th>
                                <th scope="col" data-field="data3">主要意向型号</th>
                                <th scope="col" data-field="data4">预算</th>
                                <th scope="col" data-field="data5">阶段</th>
                                <th scope="col" data-field="data6">是否为BHMC</th>
                                <th scope="col" data-field="data7">预计成交日期</th>
                                <th scope="col" data-field="data8">修改日期</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //商机记录 -->
        </div>
    </section>
    <!-- //판매기회 팝업 -->



<script type="text/javascript">

    $(document).ready(function() {

        // 팝업 form 데이터 set
        //var options = parent.opptPopupWindow.options.content.data;

        $("#openButton").click(function(){
            var win = $("#window").data("kendoWindow");
            win.center();
            win.open();
        });
        $("#closeButton").click(function(){
            var win = $("#window").data("kendoWindow");
            win.close();
        });
        /*
        $("#window").kendoWindow({
            modal:true,
            resizable:false,
            //visible:false,
            title:"",
            width:"800px"
        }).data("kendoWindow");
         */
        $(".grid").kendoGrid({
            height:142
        });
        $(".form_comboBox").kendoExtDropDownList();
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });



    });
</script>

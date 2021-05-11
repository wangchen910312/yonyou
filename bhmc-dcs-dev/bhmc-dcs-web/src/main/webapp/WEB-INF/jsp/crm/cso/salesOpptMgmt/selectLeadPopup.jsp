<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



    <!-- 리드 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="tab_area">
            <ul>
                <li class="k-state-active">线索</li>
                <li>线索记录</li>
            </ul>

            <span class="btn_right_absolute">
                <button type="button" class="btn_s">保存</button>
            </span>

            <!-- 线索 -->
            <div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:27%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:11%;">
                            <col style="width:20%;">
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
                                <th scope="row">线索来源</th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <input type="text" value="" class="form_comboBox">
                                        </div>
                                        <div class="form_right">
                                            <input type="text" value="" class="form_comboBox">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">状态</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">结束日期</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">商机转换日期</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">备注</th>
                                <td rowspan="2" colspan="3">
                                    <textarea rows="2" cols="" class="form_textarea"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">录入日期</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <td></td>
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
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //线索 -->

            <!-- 线索记录 -->
            <div>
                <div class="table_grid">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">No</th>
                                <th scope="col" data-field="data2">客户名</th>
                                <th scope="col" data-field="data3">移动电话</th>
                                <th scope="col" data-field="data4">线索来源</th>
                                <th scope="col" data-field="data5">是否是 BHMC 线索</th>
                                <th scope="col" data-field="data6">销售顾问</th>
                                <th scope="col" data-field="data7">状态</th>
                                <th scope="col" data-field="data8">商机转换日期</th>
                                <th scope="col" data-field="data9">分配日</th>
                                <th scope="col" data-field="data10">未处理</th>
                                <th scope="col" data-field="data11">录入人</th>
                                <th scope="col" data-field="data12">录入日</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //线索记录 -->
        </div>
    </section>
    <!-- //리드 팝업 -->


<script type="text/javascript">

    $(document).ready(function() {

        // 팝업 form 데이터 set
        //var options = parent.leadPopupWindow.options.content.data;

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

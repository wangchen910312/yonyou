<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


    <!-- 추종 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="tab_area">
            <ul>
                <li class="k-state-active">跟踪</li>
                <li>跟踪信息</li>
                <li>短信记录</li>
            </ul>

            <span class="btn_right_absolute">
                <button type="button" class="btn_s">保存</button>
            </span>

            <!-- 跟踪 -->
            <div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:8%;">
                            <col style="width:19%;">
                            <col style="width:13%;">
                            <col style="width:30%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">联系方式</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">类型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">计划日期</th>
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
                                <th scope="row">状态</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td colspan="2"></td>
                                <th scope="row">实际执行日期</th>
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
                                <th scope="row">执行内容</th>
                                <td colspan="5">
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">执行结果</th>
                                <td colspan="5">
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">领导评语</th>
                                <td colspan="5">
                                    <input type="text" value="" class="form_input">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //跟踪 -->

            <!-- 跟踪信息 -->
            <div>
                <div class="table_grid">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">No</th>
                                <th scope="col" data-field="data2">跟踪名</th>
                                <th scope="col" data-field="data3">形态</th>
                                <th scope="col" data-field="data4">内容</th>
                                <th scope="col" data-field="data5">备注</th>
                                <th scope="col" data-field="data6">开始日期</th>
                                <th scope="col" data-field="data7">结束日期</th>
                                <th scope="col" data-field="data8">录入日</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //跟踪信息 -->

            <!-- 短信记录 -->
            <div>
                <div class="table_grid">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">联系日期</th>
                                <th scope="col" data-field="data2">作席类型</th>
                                <th scope="col" data-field="data3">处理人</th>
                                <th scope="col" data-field="data4">途径</th>
                                <th scope="col" data-field="data5">内容</th>
                                <th scope="col" data-field="data6">担当</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //短信记录 -->
        </div>
    </section>
    <!-- //추종 팝업 -->



<script type="text/javascript">

    $(document).ready(function() {

        // 팝업 form 데이터 set
        //var options = parent.activePopupWindow.options.content.data;

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
            height:120
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

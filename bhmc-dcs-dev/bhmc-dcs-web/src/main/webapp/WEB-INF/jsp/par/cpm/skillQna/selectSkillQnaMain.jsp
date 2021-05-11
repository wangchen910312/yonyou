<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section id="content">


    <!-- 기술자문 영역 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 技术咨询 --><!-- 기술자문 --></h1>
            <div class="btn_right">
                <button id="btnQnaRequest" class="btn_m btn_search">问题申请</button>
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
                <button id="btnInit" class="btn_m btn_reset" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->

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
                        <th scope="row"><span class="bu_required">经销商代码<!-- 딜러코드   --></span></th>
                        <td>
                            <input type="text" value="" class="form_input form_required">
                        </td>
                        <th scope="row"><span class="bu_required">问题题目<!-- 문제제목 --></span></th>
                        <td>
                            <input type="text" value="" class="form_input form_required">
                        </td>
                        <th scope="row">配件组<!-- 부품분류 --></th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">问题编号<!-- 문제번호 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">问题状态<!-- 문제상태 --></th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row">问题内容<!-- 문제내용 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">配件编号<!-- 부번 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">提问时间<!-- 제출일시 --></th>
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
                        <th scope="row">车型<!-- 차형 --></th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">VIN编码<!-- VIN no --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">总时间<!-- 총시간 --></th>
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

        <div class="header_area">
            <h2 class="title_basic">详细内容</h2><!--  -->
        </div>

        <div class="table_grid">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">问题编号<!-- 분제번호 --></th>
                        <th scope="col" data-field="data2">问题题目<!-- 문제제목 --></th>
                        <th scope="col" data-field="data3">提问时间<!-- 제출시간 --></th>
                        <th scope="col" data-field="data4">配件组<!-- 부품분류 --></th>
                        <th scope="col" data-field="data5">操作人员<!-- 조작인 --></th>
                        <th scope="col" data-field="data6">问题状态<!-- 문제상태 --></th>
                        <th scope="col" data-field="data7">操作<!-- 조작 --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // 기술자문 영역 -->

</section>
<!-- //content -->

<!-- script -->
<script>
    $(document).ready(function() {

        //btnQnaRequest
        $("#btnQnaRequest").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });


        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".grid").kendoGrid({
            height:360
        });
        $(".form_comboBox").kendoExtDropDownList();
    });
</script>
<!-- //script -->
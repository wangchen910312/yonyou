<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- content -->
<section id="content">
    <!-- 基本信息  -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic">基本信息查询</h1><!-- 기본정보조회 -->
            <div class="btn_right">
                <button class="btn_m" id="btnPicSearch">查看材料照片</button><!-- 查看材料照片 -->
                <button class="btn_m" id="btnExcDown">导出EXCEL</button><!-- 导出EXCEL -->
<!--                 <button type="button" class="btn_m">查看材料照片</button>
                <button type="button" class="btn_m btn_excel">导出EXCEL</button> -->
            </div>
        </div>

        <!-- 旧车信息 -->
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">车辆VIN码</th><!-- 차량VIN NO -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">详细信息</th><!-- 상세정보 -->
                        <td><button type="button" class="btn_xs">详细</button></td><!-- 상세 -->
                        <th scope="row">生产厂商</th><!-- 제자사 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">汽车品牌</th><!-- 브랜드 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">旧车车牌</th><!-- 기존차량 브랜드 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">登记日期</th><!-- 등록일자 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">vin码是否重复</th><!-- VIN NO중복여부 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- // 旧车信息 -->

        <!-- // 旧车车牌 -->
        <div class="table_form mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">车主名称</th><!-- 차량소유자성명 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">车主类型</th><!-- 차량소유자유형 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">证件号码</th><!-- 신분증번호 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                        <th scope="row">证件地址</th><!-- 신분증주소 -->
                        <td>
                            <input type="text" value="" disabled class="form_input form_disabled">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- // 旧车车牌 -->

        <div class="table_grid mt10">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">车辆编号(VIN)<!-- 차량번호(VIN) --></th>
                        <th scope="col" data-field="data2">车辆名称<!-- 차량명칭 --></th>
                        <th scope="col" data-field="data3">材料名称<!-- 자재명칭 --></th>
                        <th scope="col" data-field="data4">上传状态 <!-- 업로드상태 --></th>
                        <th scope="col" data-field="data5">操作<!--  --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // 基本信息  -->

<!-- script -->
<script>
$(document).ready(function() {
    //버튼 - 조회
    $("#btnPicSearch").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });

    //버튼 - 조회
    $("#btnExcDown").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });


    $(".form_datepicker").kendoDatePicker();
    $(".grid").kendoGrid({
        height:384
    });
    $(".form_comboBox").kendoExtDropDownList();
});
</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 계약진척 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.usedCarContractProgress' /><!-- 계약진척 --></h1>
		<div class="btn_right">
			<button id="btnSearch" class="btn_m btn_search">查询</button><!-- 조회 -->
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
					<th scope="row">合同编号 <!-- 계약번호 --></th>
					<td>
                        <input type="text" value="" class="form_input">
                    </td>
					<th scope="row">客户<!-- 고객 --></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input type="text" value="" class="form_input">
                                    <a href="javascript:;">검색</a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
					<th scope="row">合约签订日</th><!-- 계약일 -->
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
                    <th scope="row">车种<!-- 차종 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">车型<!-- 모델 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">OCN</th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">外色<!-- 외장색 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">内色<!-- 내장색 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
			</tbody>
		</table>
	</div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_area_v1">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active">全部<!-- 전체 --></li>
            <li>草稿<!-- 초안 --></li>
            <li>作废<!-- 계약취소 --> </li>
            <li>成交<!-- deal --></li>
            <li>解除<!-- 해약 --></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 전체 -->
        <div>
            <div class="table_grid">
                <table class="grid">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th scope="col" data-field="data1">合同编号<!-- 계약번호 --></th>
                            <th scope="col" data-field="data2">合同签约日期 <!-- 계약일자 --></th>
                            <th scope="col" data-field="data3">合同状态<!-- 계약상태 --></th>
                            <th scope="col" data-field="data4">客户<!-- 고객 --></th>
                            <th scope="col" data-field="data5">车型<!-- 모델 --></th>
                            <th scope="col" data-field="data6">车辆价格<!-- 차량가격 --></th>
                            <th scope="col" data-field="data7">打折价格<!-- 할인가격 --></th>
                            <th scope="col" data-field="data8">派送费用<!-- 배송비용 --></th>
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
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //전체 -->

        <!-- 초안 -->
        <div>
                                                草稿
        </div>
        <!-- //초안 -->

        <!-- 계약취소 -->
        <div>
                                                作废<!-- 계약취소 -->
        </div>
        <!-- // 계약취소 -->

        <!-- deal -->
        <div>
                                               成交<!-- deal -->
        </div>
        <!-- // deal -->

        <!-- 배정 -->
        <div>
                                                 解除
        </div>
        <!-- //배정 -->

        <!-- 해약 -->
        <div>
                                             解除<!-- 해약 -->
        </div>
        <!-- // 해약 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- // 계약진척 -->

<script>
$(document).ready(function() {
    $("#btnSearch").kendoButton({  // 조회
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $(".form_datepicker").kendoDatePicker();
    $(".grid").kendoGrid({
        pageable:{
            info:false,
            pageSize:1
        },
        height:382
    });

    $(".form_comboBox").kendoExtDropDownList();
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 입고반품 영역 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 采购退货 --><!-- 입고반품 --></h1>
            <div class="btn_right">
            <button type="button" class="btn_m">确认</button>
            <button type="button" class="btn_m btn_reset">初始化<!-- 초기화 --></button>
            <button type="button" class="btn_m btn_search">查询<!-- 조회 --></button>
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
                        <th scope="row"><span class="bu_required">供应商<!-- 업체 --></span></th>
                        <td  class="required_area">
                            <div class="form_float">
                                <div class="form_left" style="width:35%;">
                                    <input type="text" value="" class="form_input">
                                </div>
                                <div class="form_right" style="width:65%;">
                                    <input type="text" value="" class="form_input">
                                </div>
                            </div>
                        </td>
                        <th scope="row">退货者<!-- 반품인 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">入库单号<!-- 입고문서번호 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">配件编号<!-- 부번 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">配件名称<!-- 품명 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">入库日期<!-- 입고일자 --></th>
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
                        <th scope="row">订单号<!-- 오더번호 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
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
                        <th scope="col" data-field="data1">选择<!-- 선택 --></th>
                        <th scope="col" data-field="data2">订单号<!-- 오더번호 --></th>
                        <th scope="col" data-field="data3">行号<!-- 라인 --></th>
                        <th scope="col" data-field="data4">配件编号<!-- 부번 --></th>
                        <th scope="col" data-field="data5">配件名称<!-- 품명 --></th>
                        <th scope="col" data-field="data6">入库数量<!-- 입고수량 --></th>
                        <th scope="col" data-field="data7">退货数量<!-- 반품수량 --></th>
                        <th scope="col" data-field="data8">单价<!-- 가격 --></th>
                        <th scope="col" data-field="data9">单价（不含税）<!-- 단가 (W/O TAX)--></th>
                        <th scope="col" data-field="data10">退货金额<!-- 반품금액 --></th>
                        <th scope="col" data-field="data11">退货日期<!-- 반품일자 --></th>
                        <th scope="col" data-field="data12">退货时间<!-- 반품시간 --></th>
                        <th scope="col" data-field="data13">退货原因<!-- 반품사유 --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </section>
    <!-- // 입고반품 영역 -->

<!-- script -->
<script>

$(document).ready(function() {
    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".form_numeric").kendoExtNumericTextBox();
    $(".grid").kendoGrid({
        height:382
    });
    //$(".btn_s, .btn_m").kendoButton();
    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

    $(".btn_s, .btn_m").kendoButton({
        click:function(e) {
            dms.notification.warning("<spring:message code='global.info.ready'/>");
        }
    });


});

</script>
<!-- //script -->


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 보증현황 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">보증현황</h1>
        <div class="btn_right">
            <button class="btn_m btn_search">조회</button>
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
                    <th scope="row">딜러</th>
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row">대상구분</th>
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row">청구일자</th>
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
                    <th scope="row">고객명</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">차량번호</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">판정일자</th>
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
                    <th scope="col" data-field="data1">번호</th>
                    <th scope="col" data-field="data2">대상구분</th>
                    <th scope="col" data-field="data3">ClaimNo</th>
                    <th scope="col" data-field="data4">RO번호</th>
                    <th scope="col" data-field="data5">고객명</th>
                    <th scope="col" data-field="data6">차량번호</th>
                    <th scope="col" data-field="data7">차종</th>
                    <th scope="col" data-field="data8">딜러</th>
                    <th scope="col" data-field="data9">부품대</th>
                    <th scope="col" data-field="data10">공임금액</th>
                    <th scope="col" data-field="data11">외주금액</th>
                    <th scope="col" data-field="data12">합계</th>
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
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //보증현황 -->
<!-- script -->
<script>
    $(document).ready(function() {
        $(".form_datepicker").kendoDatePicker();
        $(".grid").kendoGrid();
        $(".form_comboBox").kendoExtDropDownList();
        $(".tab_area").kendoExtTabStrip({
            animation:false
        });
    });
</script>
<!-- //script -->

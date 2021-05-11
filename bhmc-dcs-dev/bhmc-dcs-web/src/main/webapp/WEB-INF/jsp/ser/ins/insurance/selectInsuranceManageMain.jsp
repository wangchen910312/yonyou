<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 보험신청현황 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">보험신청현황</h1>
        <div class="btn_right">
            <button class="btn_m btn_search">조회</button>
            <button class="btn_m btn_save">저장</button>
            <button class="btn_m">승인</button>
            <button class="btn_m btn_print">인쇄</button>
            <button class="btn_m btn_reset">초기화</button>
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
                    <th scope="row">RO일자</th>
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
                    <th scope="row">상태</th>
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row">딜러</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">차대번호</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">사업부</th>
                    <td class="bor_none">
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">No</th>
                    <th scope="col" data-field="data2">상태</th>
                    <th scope="col" data-field="data3">RO일자</th>
                    <th scope="col" data-field="data4">RO No</th>
                    <th scope="col" data-field="data5">차대번호</th>
                    <th scope="col" data-field="data6">차종</th>
                    <th scope="col" data-field="data7">...</th>
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
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //보험신청현황 -->

<!-- 보험정보 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">보험정보</h2>
    </div>
    <div class="table_form form_width_100per">
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
                    <th scope="row">보험번호</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">가해자차량번호</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">과실형태</th>
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row">사고발생시간</th>
                    <td>
                        <input value="" class="form_datepicker">
                    </td>
                </tr>
                <tr>
                    <th scope="row">부품대</th>
                    <td>
                        <input type="text" value="" class="form_input ar">
                    </td>
                    <th scope="row">외주금액</th>
                    <td>
                        <input type="text" value="" class="form_input ar">
                    </td>
                    <th scope="row">확정금액</th>
                    <td>
                        <input type="text" value="" class="form_input ar">
                    </td>
                    <th scope="row">신청일자</th>
                    <td>
                        <input value="" class="form_datepicker">
                    </td>
                </tr>
                <tr>
                    <th scope="row">공임금액</th>
                    <td>
                        <input type="text" value="" class="form_input ar">
                    </td>
                    <th scope="row">부가세</th>
                    <td>
                        <input type="text" value="" class="form_input ar">
                    </td>
                    <th scope="row">확정금액</th>
                    <td class="bor_none">
                        <input type="text" value="" class="form_input ar">
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form table_form_v1">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:40%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">고객의견</th>
                    <td>
                        <textarea rows="3" cols="" class="form_textarea"></textarea>
                    </td>
                    <th scope="row">비고</th>
                    <td>
                        <textarea rows="3" cols="" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s">추가</button>
            <button class="btn_s">삭제</button>
        </div>
    </div>
    <div class="table_grid">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">선택</th>
                    <th scope="col" data-field="data2">보험종류</th>
                    <th scope="col" data-field="data3">보험회사</th>
                    <th scope="col" data-field="data4">사고접수번호</th>
                    <th scope="col" data-field="data5">정산금액</th>
                    <th scope="col" data-field="data6">보상비율(%)</th>
                    <th scope="col" data-field="data7">보상금액</th>
                    <th scope="col" data-field="data8">면책금액</th>
                    <th scope="col" data-field="data9">고객부담금액</th>
                    <th scope="col" data-field="data10">신청금액</th>
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
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //보험정보 -->

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


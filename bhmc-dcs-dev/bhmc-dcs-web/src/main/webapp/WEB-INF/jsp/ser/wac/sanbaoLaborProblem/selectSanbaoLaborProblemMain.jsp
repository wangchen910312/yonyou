<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 현황 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">현황</h1>
        <div class="btn_right">
            <button class="btn_m">신청</button>
            <button class="btn_m">신청취소</button>
            <button class="btn_m btn_search">조회</button>
            <button class="btn_m btn_save">저장</button>
        </div>
    </div>
    <div class="table_form form_width_70per">
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
                    <th scope="row">조회년월</th>
                    <td>
                        <input value="" class="form_datepicker">
                    </td>
                    <th scope="row">부품그룹</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">분류항목</th>
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row">발생횟수</th>
                    <td>
                        <select class="form_comboBox">
                            <option></option>
                        </select>
                    </td>
                    <th scope="row">VIN번호</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">판매딜러</th>
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
                    <th scope="col" data-field="data1">번호</th>
                    <th scope="col" data-field="data2">VIN</th>
                    <th scope="col" data-field="data3">차종</th>
                    <th scope="col" data-field="data4">부품그룹정보</th>
                    <th scope="col" data-field="data5">모델명</th>
                    <th scope="col" data-field="data6">분류항목</th>
                    <th scope="col" data-field="data7">동일하자기준</th>
                    <th scope="col" data-field="data8">동일하자횟수</th>
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
</section>

<section class="group">
    <div class="table_form form_width_100per mt10">
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
                    <th scope="row">판매딜러</th>
                    <td colspan="3">
                        <div class="form_float">
                            <div class="form_left" style="width:37.5%">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                            <div class="form_right" style="width:62.5%"><input type="text" value="" readonly class="form_input form_readonly" ></div>
                        </div>
                    </td>
                    <th scope="row">삼포잔여기간</th>
                    <td>
                        <div class="form_float">
                            <div class="form_left"  style="width:50%">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                            <div class="form_right"  style="width:50%">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row">총작업소요일</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row">생산일자</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">판매일자</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">보증일자</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">최종주행거리</th>
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
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
                    <th scope="col" data-field="data1">고객명</th>
                    <th scope="col" data-field="data2">증거번호</th>
                    <th scope="col" data-field="data3">핸드폰</th>
                    <th scope="col" data-field="data4">전화번호</th>
                    <th scope="col" data-field="data5">우편번호</th>
                    <th scope="col" data-field="data6">주소</th>
                    <th scope="col" data-field="data7">이메일</th>
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
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
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

    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">딜러</th>
                    <th scope="col" data-field="data2">R/O번호</th>
                    <th scope="col" data-field="data3">클레임번호</th>
                    <th scope="col" data-field="data4">클레임유형</th>
                    <th scope="col" data-field="data5">주행거리</th>
                    <th scope="col" data-field="data6">원인부품</th>
                    <th scope="col" data-field="data7">원인부품명칭</th>
                    <th scope="col" data-field="data8">원인</th>
                    <th scope="col" data-field="data9">현상</th>
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
                </tr>
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
                </tr>
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
                </tr>
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
                </tr>
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
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //현황 -->
<!-- script -->
<script>

var docNo = "${docNo}";

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

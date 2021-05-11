<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 대행업무관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">代办事务管理</h1><!-- 대행업무관리 -->
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search">查询</button><!-- 조회 -->
            <button id="btnSave" class="btn_m btn_save">保存</button><!-- 저장 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">VIN号</th><!-- VIN NO -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">申请状态</th><!-- 신청상태 -->
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">代办申请日期</th><!-- 대행신청일자 -->
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
                    <th scope="row">车牌号</th><!-- 차량번호 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <td colspan="2"></td>
                    <th scope="row">代办日期</th><!-- 대행일자 -->
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
                    <th scope="row">车种</th><!-- 차종 -->
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">车型</th><!-- 모델 -->
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">OCN</th><!-- OCN -->
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">外色</th><!-- 외장색 -->
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">内色</th><!-- 내장색 -->
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <td colspan="2"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">销售顾问</th><!-- 판매고문 -->
                    <th scope="col" data-field="data2">上牌专员</th><!--  -->
                    <th scope="col" data-field="data3">客户名</th><!-- 고객명 -->
                    <th scope="col" data-field="data4">VIN号</th><!-- VIN NO -->
                    <th scope="col" data-field="data5">车牌号</th><!-- 차량번호 -->
                    <th scope="col" data-field="data6">实收</th><!-- 실수납 -->
                    <th scope="col" data-field="data7">车种</th><!-- 차종 -->
                    <th scope="col" data-field="data8">车型</th><!-- 모델 -->
                    <th scope="col" data-field="data9">OCN</th><!-- OCN -->
                    <th scope="col" data-field="data10">状态</th><!-- 상태 -->
                    <th scope="col" data-field="data11">申请日期</th><!-- 신청일자 -->
                    <th scope="col" data-field="data12">购置税日期</th><!-- 구매세일자 -->
                    <th scope="col" data-field="data13">上牌日期</th><!-- 번호판등록일자 -->
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</section>

<section class="group">
    <div class="header_area">
        <h2 class="title_basic">车辆信息</h2><!-- 차량정보 -->
    </div>
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">VIN号</th><!-- VIN NO -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">车种</th><!-- 차종 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">车型</th><!-- 모델 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">OCN</th><!-- OCN -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row">外色</th><!-- 외장색 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">内色</th><!-- 내장색 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">车牌号</th><!-- 차량번호 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">合同编号</th><!-- 계약번호 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row">发动机编号</th><!-- 엔진번호 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">合格证</th><!-- 합격증 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <td colspan="4"></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<section class="group">
    <div class="header_area">
        <h2 class="title_basic">车主信息</h2><!-- 차주정보 -->
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:20%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><strong>开票人信息</strong></th><!-- 발행자정보 -->
                    <th scope="row">开票名称</th><!-- 발행명칭 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">身份证类型</th><!-- 신분증유형 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">身份证号码</th><!-- 신분증번호 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><strong>身份证地址</strong></th><!-- 신분증주소 -->
                    <th scope="row">省/市</th><!-- 성/시 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">市/区</th><!-- 시/구 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">地址</th><!-- 주소 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><strong>联系人信息</strong></th><!-- 연락인정보 -->
                    <th scope="row">联系人</th><!-- 연락인 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">联系电话</th><!-- 연락처 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <td colspan="2"></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<section class="group">
    <div class="header_area">
        <h2 class="title_basic">上牌信息</h2><!-- 번호판등록정보 -->
    </div>
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">车主</th><!-- 차주 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">上牌类型</th><!-- 번호판유형 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row"><span class="bu_required">上牌地点</span></th><!-- 번호판등록지점 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">申请日期</th><!-- 신청일자 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row">预收购置税</th><!-- 구매세선수금 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">预收上牌费</th><!-- 번호판등록선수금 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">预计上牌时间</th><!-- 번호판등록예상시간 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <td colspan="2"></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<section class="group">
    <div class="header_area">
        <h2 class="title_basic">购置税缴纳结果</h2><!-- 구매세납부결과 -->
    </div>
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
                <col style="width:25%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">实际购置税</th><!-- 실구매세 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">购置税确认日期</th><!-- 구매세확인일자 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row">处理人</th><!-- 처리인 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<section class="group">
    <div class="header_area">
        <h2 class="title_basic">上牌办理结果</h2><!-- 번호판등록결과 -->
    </div>
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">上牌日期</th><!-- 번호판등록일자 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车牌号</th><!-- 차량번호 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">实际上牌费用</th><!-- 실번호판등록비용 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">处理人</th><!-- 처리인 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row">上牌确认日期</th><!-- 번호판등록확인일자 -->
                    <td>
                        <input type="text" value="" readonly class="form_input form_readonly">
                    </td>
                    <td colspan="6"></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<section class="group">
    <div class="header_area">
        <h2 class="title_basic">附件</h2><!-- 첨부 -->
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:90%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">附件</th><!-- 첨부 -->
                    <td>
                        <input type="file" value="" class="form_file" style="width:40%;">
                        <button type="button" class="btn_s">下载</button><!-- 다운로드 -->
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //대행업무관리 -->


<!-- script -->
<script>
$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });

    //버튼 - 신규
    $("#btnReset").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });


    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });
    $(".grid").kendoGrid({
        height:219
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

});


</script>
<!-- //script -->
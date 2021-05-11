<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 보험정보관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">保险综合信息<!-- 보험종합정보 --></h1>
        <div class="btn_right">
            <button id="btnSearch" type="button" class="btn_m btn_search">查询<!-- 조회 --></button>
            <button id="btnReset" type="button" class="btn_m btn_new">新建<!-- 신규 --></button>
            <button id="btnSave" type="button" class="btn_m btn_save">保存<!-- 저장 --></button>
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">投保日期</th><!-- 보험가입일자 -->
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
                    <th scope="row">车辆销售日日期</th><!-- 차량판매일자 -->
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
                    <th scope="row">合同编号</th><!-- 계약번호 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">保险公司</th><!-- 보험회사 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">销售顾问</th><!-- 판매고문 -->
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">客户名称</th><!-- 고객명 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">保险种类</th><!-- 보험종류 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">VIN号</th><!-- VIN NO -->
                    <td colspan="3">
                        <div class="form_float">
                            <div class="form_left" style="width:30%">
                                <input type="text" value="" class="form_input">
                            </div>
                            <div class="form_left" style="width:23%">
                                <input type="text" value="" class="form_input">
                            </div>
                            <div class="form_right" style="width:47%">
                                <button type="button" class="btn_xs">查询</button><!-- 검색 -->
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
                    <th scope="col" data-field="data1">客户编号<!-- 고객번호 --></th>
                    <th scope="col" data-field="data2">客户名<!-- 고객명 --></th>
                    <th scope="col" data-field="data3">车种<!-- 차종 --></th>
                    <th scope="col" data-field="data4">车型<!-- 모델 --></th>
                    <th scope="col" data-field="data5">VIN<!-- VIN NO --></th>
                    <th scope="col" data-field="data6">保险公司<!-- 보험회사 --></th>
                    <th scope="col" data-field="data7">保险种类<!-- 보험종류 --></th>
                    <th scope="col" data-field="data8">预估金额<!-- 평가금액 --></th>
                    <th scope="col" data-field="data9">实际投保金额<!-- 실제보험금액 --></th>
                    <th scope="col" data-field="data10">折扣率<!-- 할인율 --></th>
                    <th scope="col" data-field="data11">保险服务费<!-- 보험서비스비용 --></th>
                    <th scope="col" data-field="data12">保险编号<!-- 보험번호 --></th>
                    <th scope="col" data-field="data13">销售顾问<!-- 판매고문 --></th>
                    <th scope="col" data-field="data14">投保日期<!-- 보험가입일자 --></th>
                    <th scope="col" data-field="data15">保险开始日期<!-- 보험시작일자 --></th>
                    <th scope="col" data-field="data16">保险结束日期<!-- 보험종료일자 --></th>
                    <th scope="col" data-field="data17">合同编号<!-- 계약번호 --></th>
                    <th scope="col" data-field="data18">投保人<!-- 보험가입자 --></th>
                    <th scope="col" data-field="data19">投保人地址<!-- 가입자주소 --></th>
                    <th scope="col" data-field="data20">车牌号码<!-- 차량번호 --></th>
                    <th scope="col" data-field="data21">车辆销售日期<!-- 차량판매일자 --></th>
                    <th scope="col" data-field="data22">保险处理人<!-- 보험처리인 --></th>
                    <th scope="col" data-field="data23">收益人<!-- 수익인 --></th>
                    <th scope="col" data-field="data24">保额<!-- 보험액 --></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</section>
<!-- //보험정보관리 -->

<!-- 车主车辆信息 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">车主车辆信息</h2><!-- 소유자차량정보 -->
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:7%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">客户</th><!-- 고객 -->
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
                    <th scope="row">客户类型</th><!-- 고객유형 -->
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">VIN号</th><!-- VIN NO -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">车种</th><!-- 차종 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row">车型</th><!-- 모델 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">OCN</th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">外色</th><!-- 외장색 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">内色 </th><!-- 내장색 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                </tr>
                <tr>
                    <th scope="row">车牌号</th><!-- 차량번호 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">合同编号</th><!-- 계약번호 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">发动机编号</th><!-- 엔진번호 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">合格证</th><!-- 합격증 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 车主车辆信息  -->

<!-- 保险申请信息 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">保险申请信息</h2><!-- 보험신청정보 -->
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">保险开票名称 </th><!-- 보험발행명 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">被保险人</th><!-- 피보험자 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row" colspan="3">被保险人身份证号码 &#47; 组织机构代码</th><!-- 피보험자신분증번호 --><!-- 사업자등록번호 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">被保险人电话</th><!-- 피보험자전화번호 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">第一受益人</th><!-- 제1수익자 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">保险公司</th><!-- 보험회사 -->
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">投保日期</th><!-- 보험가입일자 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">强制险保单号</th><!--  -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">商业保险保单号</th><!--  -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 保险申请信息  -->

<!-- 保险申请明细 -->
<section class="group">
    <div class="header_area">
        <h2 class="title_basic">保险申请明细</h2><!-- 보험신청명세 -->
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">保险预估总额 </th><!-- 예상보험금액 -->
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">保险实际总额</th><!-- 실제보험금액 -->
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <div class="table_grid">
                            <table class="grid2">
                                <caption></caption>
                                <thead>
                                    <tr>
                                        <th scope="col" data-field="data1">保险类型<!-- 보험유형 --></th>
                                        <th scope="col" data-field="data2">保险费用<!-- 보험금액 --></th>
                                        <th scope="col" data-field="data3">实际保险费用<!-- 실제보험비용 --></th>
                                        <th scope="col" data-field="data4">期数(月)<!-- 기간수(월) --></th>
                                        <th scope="col" data-field="data5">起始时间<!-- 시작시간 --></th>
                                        <th scope="col" data-field="data6">结束时间 <!-- 종료시간 --></th>
                                        <th scope="col" data-field="data7">保额<!-- 보험금액 --></th>
                                        <th scope="col" data-field="data8">备注<!-- 비고 --></th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>

                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- // 保险申请明细  -->

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
        height:173
    });
    $(".grid2").kendoGrid({
        height:127
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".btn_m").kendoButton();
    $(".form_numeric").kendoExtNumericTextBox();
});

</script>
<!-- //script -->
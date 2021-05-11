<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 중고차매입관리 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic">二手车收购管理</h1><!-- 중고차매입관리 -->
		<div class="btn_right">
            <button type="button" id="btnAsk1" class="btn_m">评估申请</button><!-- 평가신청 -->
            <button type="button" id="btnSuccess" disabled class="btn_m">成交<!-- deal --></button><!-- 거래성공 -->
            <button type="button" id="btnReJec" disabled class="btn_m">拒绝<!-- decline --></button><!-- 거절 -->
            <button type="button" id="btnAsk2" class="btn_m">评估申请<!-- 평가요청 --></button><!-- 평가신청 -->
            <button type="button" id="btnRefresh " class="btn_m btn_reset">初始化<!-- 초기화 --></button><!-- 초기화 -->
            <button type="button" id="btnSearch" class="btn_m btn_search">查询<!-- 조회 --></button><!-- 조회 -->
            <button type="button" id="btnSave" class="btn_m btn_tempSave">临时保存<!-- 임시저장 --></button><!-- 임시저장 -->
		</div>
	</div>
	<div class="table_form form_width_100per">
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
					<th scope="row"> 收购编号<!-- 매입번호 --></th>
					<td>
                        <input type="text" value="" class="form_input">
                    </td>
					<th scope="row">客户<!-- 고객 --></th>
					<td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input type="text" value="" class="form_input">
                                    <a href="javascript:;">查询</a><!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
					<th scope="row">登记日期<!-- 등록일자 --></th>
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
        <h2 class="title_basic">收购列表<!-- 매입리스트 --></h2>
    </div>
    <div class="table_grid">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">置换编号<!-- 치환번호 --></th>
                    <th scope="col" data-field="data2">客户名<!-- 고객명 --></th>
                    <th scope="col" data-field="data3">状态<!-- 상태 --></th>
                    <th scope="col" data-field="data4">是否 本公司<!-- 본회사여부 --></th>
                    <th scope="col" data-field="data5">厂家<!-- 제조사 --></th>
                    <th scope="col" data-field="data6">车型<!-- 모델 --></th>
                    <th scope="col" data-field="data7">排气量<!-- CC --></th>
                    <th scope="col" data-field="data8">OCN<!-- OCN --></th>
                    <th scope="col" data-field="data9">外观色<!-- 외색 --></th>
                    <th scope="col" data-field="data10">评价处<!-- 평가처 --></th>
                    <th scope="col" data-field="data11">登记日期<!-- 등록일자 --></th>
                    <th scope="col" data-field="data12">评价日期<!-- 평가일자 --></th>
                    <th scope="col" data-field="data13">评价金额<!-- 평가금액 --></th>
                    <th scope="col" data-field="data14">是否置换<!-- 치환여부 --></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic">基本信息<!-- 기본정보 --></h2>
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
                    <th scope="row">收购编号<!-- 매입번호 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">客户<!-- 고객 --></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input type="text" value="" class="form_input">
                                    <a href="javascript:;">查询</a><!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input type="text" value="" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row">联系电话<!-- 연락처 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">状态<!-- 상태 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">是否置换<!-- 치환여부 --></th>
                    <td colspan="3">
                        <label class="label_check"><input type="checkbox" name="" class="form_check"> 新车合同编号<!-- 신차계약번호 --></label>
                        <input value="" class="form_comboBox" style="width:120px;">
                        <button id="btnDetailList" type="button" class="btn_xs">明细<!-- 명세서 --></button>
                    </td>
                </tr>
                <tr>
                    <th scope="row">登记日期<!-- 등록일자 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">收购总金额<!-- 매입총금액 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic">车辆信息<!-- 차량정보 --></h2>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:7%;">
                <col style="width:21%;">
                <col style="width:7%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">厂家<!-- 제조사 --> </th>
                    <td>
                       <div class="form_float">
                            <div class="form_left" style="width:40%">
                                <input value="" class="form_comboBox">
                            </div>
                            <div class="form_right" style="width:60%">
                                <ul class="tabmenu" >
                                    <li class="on"><button type="button">本公司</button></li><!-- 본사 -->
                                    <li><button type="button">其他公司</button></li><!-- 기타회사 -->
                                </ul>
                            </div>
                        </div>
                    </td>
                    <th scope="row">车种<!-- 차종 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">车型<!-- 모델 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">排气量<!-- CC --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">OCN<!-- OCN --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">外色<!-- 외색 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">内色<!-- 내색 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">制造年月<!-- 제조년월 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                <tr>
                <tr>
                    <th scope="row">VIN</th>
                    <td>
                        <div class="form_search">
                            <input type="text" value="" class="form_input">
                            <a href="javascript:;">查询</a><!-- 검색 -->
                        </div>
                    </td>
                    <th scope="row">使用用途<!-- 사용용도 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">行驶里程<!-- 마일리지(주행거리) --></th>
                    <td>
                        <input type="number" value="" min="0" max="" class="form_numeric">
                    </td>
                    <th scope="row">燃料区分<!-- 연료구분 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                <tr>
                <tr>
                    <th scope="row">驱动方式<!-- 구동방식 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                    <th scope="row">收购价<!-- 매입가격 --></th>
                    <td>
                        <input type="number" value="" min="0" max="" disabled class="form_numeric">
                    </td>
                    <th scope="row">置换价<!-- 치환가격 --></th>
                    <td>
                        <input type="number" value="" min="0" max="" disabled class="form_numeric">
                    </td>
                    <th scope="row">建议销售价<!-- 추천판매가격 --></th>
                    <td>
                        <input type="number" value="" min="0" max="" disabled class="form_numeric">
                    </td>
                <tr>
            </tbody>
        </table>
    </div>

    <div class="table_form mt10">
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
                    <th scope="row">是否带车牌<!-- 번호판여부 --></th>
                    <td>
                        <input type="checkbox" name="" class="form_check">
                    </td>
                    <th scope="row">车牌号码<!-- 번호판번호 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车牌价<!-- 번호판가격 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form mt10">
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
                    <th scope="row"><span class="bu_required">交强险有效期<!-- 교통사고강제보험 유효기간 --></span></th>
                    <td>
                        <input type="text" value="" class="form_input form_required">
                    </td>
                    <th scope="row"><span class="bu_required">车船税有效期<!-- 차배세유효기간 --></span></th>
                    <td>
                        <input type="text" value="" class="form_input form_required">
                    </td>
                    <th scope="row"><span class="bu_required">年检有效期<!-- 년검사 유효기간 --></span></th>
                    <td>
                        <input type="text" value="" class="form_input form_required">
                    </td>
                    <th scope="row">商业险有效期<!-- 상업보험 유효기간 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic">评价信息<!-- 평가정보 --></h2>
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
                    <th scope="row">评价方法<!-- 평가방법 --></th>
                    <td>
                        <ul class="tabmenu">
                            <li class="on"><button type="button">自行<!-- 본인 --></button></li>
                            <li><button type="button">代办<!-- 대행 --></button></li>
                        </ul>
                    </td>
                    <th scope="row">评价负责人<!-- 평가담당자 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">评价日期<!-- 평가일자 --></th>
                    <td>
                        <input value="" class="form_datepicker">
                    </td>
                </tr>
                <tr>
                    <th scope="row">评价意见<!-- 평가의견 --></th>
                    <td colspan="5">
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车辆状况<!-- 차량상황 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">客户报价<!-- 고객희망가격 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">评估师报价<!-- 평가가격 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">成交价格<!-- 최종판매가격 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">车牌号评估价格<!-- 번호판평가가격 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic">拍卖信息<!-- 경매정보 --></h2>
    </div>

    <div class="table_grid">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">注册日期<!-- 등록일자 --></th>
                    <th scope="col" data-field="data2">拍卖区分<!-- 경매구분--></th>
                    <th scope="col" data-field="data3"> 拍卖处<!-- 경매처--></th>
                    <th scope="col" data-field="data4">拍卖价格<!-- 경매가격--></th>
                    <th scope="col" data-field="data5">精品内容<!-- 용품내용 --></th>
                    <th scope="col" data-field="data6">是否车辆移交<!-- 차량인도여부 --></th>
                    <th scope="col" data-field="data7">决裁预计日期<!-- 예정결재일자 --></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

</section>
<!-- //중고차매입관리 -->


<script>
$(document).ready(function() {


    $("#btnAsk1").kendoButton({  // 평가신청
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnSuccess").kendoButton({  // 거래성공
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnReJec").kendoButton({  // 거절
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnAsk2").kendoButton({  // 초기화
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnSearch").kendoButton({  // 조회
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnSave").kendoButton({  // 임시저장
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnDetailList").kendoButton({  //치환여부 - 명세서
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });


    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });
    $(".grid").kendoGrid({
        height:104
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".btn_m").kendoButton();
    $(".form_numeric").kendoExtNumericTextBox();
});
</script>

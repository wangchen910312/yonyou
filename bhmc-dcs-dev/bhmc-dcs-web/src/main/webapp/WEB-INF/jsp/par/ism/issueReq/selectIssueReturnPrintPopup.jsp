<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- returnDoc popup -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <h1 class="title_center">수령증</h1>
            <div class="btn_right">
                <button class="btn_m">조회</button>
                <button class="btn_m">인쇄</button>
                <button class="btn_m" id="closeButton">닫기</button>
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
                        <th scope="row">차종</th>
                        <td>
                            <select class="form_comboBox">
                                <option>BX 쏘나타</option>
                            </select>
                        </td>
                        <th scope="row">모델</th>
                        <td>
                            <select class="form_comboBox">
                                <option>BX5145 D 1.4升GL自动档</option>
                            </select>
                        </td>
                        <th scope="row">OCN</th>
                        <td>
                            <select class="form_comboBox">
                                <option>D014:1.4升GL自动档 OBDIV</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">외장색</th>
                        <td>
                            <select class="form_comboBox">
                                <option>블랙</option>
                            </select>
                        </td>
                        <th scope="row">내장색</th>
                        <td class="bor_none">
                            <select class="form_comboBox">
                                <option>화이트</option>
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
                        <th scope="col" data-field="data1">계약번호</th>
                        <th scope="col" data-field="data2">판매유형</th>
                        <th scope="col" data-field="data3">계약일</th>
                        <th scope="col" data-field="data4">계약상태</th>
                        <th scope="col" data-field="data5">고객</th>
                        <th scope="col" data-field="data6">영업사원</th>
                        <th scope="col" data-field="data7">차종</th>
                        <th scope="col" data-field="data8">모델</th>
                        <th scope="col" data-field="data9">OCN</th>
                        <th scope="col" data-field="data10">외장색</th>
                        <th scope="col" data-field="data11">내장색</th>
                        <th scope="col" data-field="data12">차량가격</th>
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
        <ul class="txt_input txt_input_v1">
            <li>
                <span class="span_txt">부품담당:</span>
            </li>
            <li>
                <span class="span_txt">수령인:</span>
            </li>
            <li>
                <span class="span_txt">수령시간:</span>
            </li>
        </ul>
    </section>
    <!-- returnDoc popup -->
<!-- script -->
<script>
$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReturnPopupButtonWindow.options.content.data;

    // 확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){

            if($("#sReturnerNm").val() === ""){
                // 반환인는 필수 입력사항입니다.
                dms.notification.info("<spring:message code='par.lbl.returner' var='returner' /><spring:message code='global.info.required.field' arguments='${returner}' />");
                $("#sReturnerNm").focus();

                return false;
            }

            options.callbackFunc({ flag:"Y", returnNm:$("#sReturnerNm").val()});
            parent.issueReturnPopupButtonWindow.close();
        }
    });

    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReturnPopupButtonWindow.close();
        }
    });

});
</script>
<!-- //script -->
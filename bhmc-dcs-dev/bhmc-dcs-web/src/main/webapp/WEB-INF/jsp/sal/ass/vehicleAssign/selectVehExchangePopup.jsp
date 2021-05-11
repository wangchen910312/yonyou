<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">
    <!-- 차량교환 정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic">교환차량정보</h1>
            <div class="btn_right">
                <button class="btn_m" id="btnVehExchange" name="btnVehExchange"><spring:message code='global.btn.vehExchange' /></button><!-- 차량교환 -->
                <button class="btn_m" id="btnClose" name="btnClose"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:18%;">
                    <col style="width:32%;">
                    <col style="width:18%;">
                    <col style="width:32%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                        <td class="readonly_area">
                            <input id="sCarlineCd" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                        <td class="readonly_area">
                            <input id="sModelCd" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">OCN</th>
                        <td class="readonly_area">
                            <input id="sOcnCd" class="form_input" readonly style="width:60%">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                        <td class="readonly_area">
                            <input id="sExtColorCd" type="text" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                        <td class="readonly_area">
                            <input id="sIntColorCd" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //배정정보 -->


    <!-- 상세정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic">상세정보</h1>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:18%;">
                    <col style="width:41%;">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">교환정보-A</th><!-- 교환정보-A -->
                        <th scope="col">교환정보-B</th><!-- 교환정보-B -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">VIN NO</th><!-- VIN NO -->
                        <!-- <th scope="row" class="ac"><input type="text" value="VIN NO" class="form_input ar"></th> -->
                        <td>
                            <input id="vinNo1" type="text" class="form_input" readonly>
                        </td>
                        <td>
                            <input id="vinNo2" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">재고상태</th><!-- 재고상태 -->
                        <td>
                            <input id="stockTp1" type="text" class="form_input" readonly>
                        </td>
                        <td>
                            <input id="stockTp2" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">계약번호</th>
                        <td>
                            <input id="contractNo1" type="text" class="form_input" readonly>
                        </td>
                        <td>
                            <input id="contractNo2" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">고객명</th><!-- 고객명 -->
                        <td>
                            <input id="custNm1" type="text" class="form_input" readonly>
                        </td>
                        <td>
                            <input id="custNm2" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">판매유형</th>
                        <td>
                            <input id="contractTp1" type="text" class="form_input" readonly>
                        </td>
                        <td>
                            <input id="contractTp2" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">계약일자</th>
                        <td>
                            <input id="contractDt1" type="text" class="form_datepicker" readonly>
                        </td>
                        <td>
                            <input id="contractDt2" type="text" class="form_datepicker" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">인도요청일</th>
                        <td>
                            <input id="dlReqDt1" type="text" class="form_datepicker" readonly>
                        </td>
                        <td>
                            <input id="dlReqDt2" type="text" class="form_datepicker" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //상세정보 -->
</section>
<!-- //배정관리-차량교환 팝업 -->



<script type="text/javascript">

/**
 * 팝업 옵션
 */
var options = parent.exchangePopupWin.options.content.data;


$(document).ready(function() {

    //교환정보 A - 계약일자
    $("#contractDt1").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });

    //교환정보 B - 계약일자
    $("#contractDt2").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });


    //교환정보 A - 인도요청일
    $("#dlReqDt1").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });

    //교환정보 B - 인도요청일
    $("#dlReqDt2").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });



    $("#sCarlineCd").val(options.carlineNm1);
    $("#sModelCd").val(options.modelNm1);
    $("#sOcnCd").val(options.ocnNm1);
    $("#sExtColorCd").val(options.extColorNm1);
    $("#sIntColorCd").val(options.intColorNm1);
    $("#vinNo1").val(options.vinNo1);
    $("#vinNo2").val(options.vinNo2);
    $("#stockTp1").val(options.stockTp1);
    $("#stockTp2").val(options.stockTp2);
    $("#contractNo1").val(options.contractNo1);
    $("#contractNo2").val(options.contractNo2);
    $("#custNm1").val(options.contractCustNm1);
    $("#custNm2").val(options.contractCustNm2);
    $("#contractTp1").val(options.contractTp1);
    $("#contractTp2").val(options.contractTp2);
    $("#contractDt1").data("kendoDatePicker").value(options.contractDt1);
    $("#contractDt2").data("kendoDatePicker").value(options.contractDt2);
    $("#dlReqDt1").data("kendoDatePicker").value(options.dlReqDt1);
    $("#dlReqDt2").data("kendoDatePicker").value(options.dlReqDt2);



    /**************************** //검색 조건 **************************************/



    //버튼 - 닫기
    $("#btnClose").kendoButton({
        click:function(e){
            parent.exchangePopupWin.close();
       }
    });



    //버튼 - 배정
    $("#btnVehExchange").kendoButton({
        click:function(e){

            $.ajax({
                url:"<c:url value='/sal/ass/vehicleAssign/vehicleExchange.do' />",
                dataType:"json",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(getSaveData()),
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                },
                success:function(jqXHR, textStatus){
                    options.callbackFunc();
                    parent.exchangePopupWin.close();
                }
            });
       }
    });





});



function getSaveData(){

    var saveData = {
            "vinNo1":options.vinNo1
            ,"vinNo2":options.vinNo2
            ,"contractNo1":options.contractNo1
            ,"contractNo2":options.contractNo2
            ,"allocQueNo1":options.allocQueNo1
            ,"allocQueNo2":options.allocQueNo2
        };

        return saveData;
}


</script>










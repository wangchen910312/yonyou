<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:600px;top:150px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
        </div>
    </div>

    <div class="table_form" id="rechargeForm" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:30%;">
                <col style="width:15%;">
                <col style="*">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.cardNo'/></span></th> <!-- 카드번호 -->
                    <td>
                        <input type="hidden" id="pointCd" name="pointCd" data-json-obj="true" value="${pointCd}" />
                        <input id="cardNo" name="cardNo" value="${cardNo}" class="form_input form_readonly" readonly="readonly" data-json-obj='true' maxlength="30"/>
                    </td>
                    <th scope="row"><span class="bu_required"><c:choose><c:when test="${pointCd == '10'}"><spring:message code="crm.lbl.rchgAmt" /><!-- 충전금액 --></c:when><c:otherwise><spring:message code="crm.lbl.extcAmt" /><!-- 소멸금액 --></c:otherwise></c:choose></span></th>
                    <td>
                        <input id="occrPointVal" name="occrPointVal" class="form_numberic ar" maxlength="10" data-json-obj='true' style="width:100%"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span id="remarkArea" class="bu_required"><c:choose><c:when test="${pointCd == '10'}"><spring:message code="crm.lbl.rchgAmtReason" /><!-- 충전사유 --></c:when><c:otherwise><spring:message code="crm.lbl.extcAmtReason" /><!-- 소멸사유 --></c:otherwise></c:choose></span></th>
                    <td colspan="3">
                        <input id="remark" name="remark" class="form_input" data-json-obj="true" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="progressSection"></div>
</section>

<script type="text/javascript">
var dlrCd = "${dlrCd}";
var membershipNo = "${membershipNo}";
//var cardNo = "${cardNo}";
var cardTpCd = "${cardTpCd}";


$(document).ready(function() {

 // 숫자
    /* $(".numberic").kendoMaskedTextBox({
        mask:"0000000000"
        , promptChar:" "
    }); */

    $("#occrPointVal").kendoExtNumericTextBox({
        format:"n2"
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });
    var occrPointVal = $("#occrPointVal").data("kendoExtNumericTextBox");

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

            var pointCd = $("#pointCd").val();
            if(dms.string.isEmpty(pointCd)){
                //{포인트출처}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='crm.lbl.pointCdCont' var='init' /><spring:message code='global.info.confirmMsgParam' arguments='${init}' />");
                return;
            };

            if(dms.string.isEmpty($("#cardNo").val())){
                //카드를 선택해 주십시오
                dms.notification.info("<spring:message code='crm.info.selectMembershipCard'/>");
                return;
            }

            var occrPointVal = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            if( dms.string.isEmpty(occrPointVal) || occrPointVal == 0 ){
                if (pointCd === "99") {
                    //소멸금액은(는) 필수입력사항 입니다.
                    dms.notification.info("<spring:message code='crm.lbl.extcAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                } else if (pointCd === "10") {
                    //충전금액은(는) 필수입력사항 입니다.
                    dms.notification.info("<spring:message code='crm.lbl.rchgAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                };
                return;
            };

            if ( dms.string.isEmpty($("#remark").val()) ) {

                var pointTpMsg;

                //소멸사유은(는) 필수입력사항 입니다.
                if ( pointCd === "10" ) {
                    // 충전
                    dms.notification.info("<spring:message code='crm.lbl.rchgAmtReason' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                } else if ( pointCd === "99" ) {
                    // 소멸
                    dms.notification.info("<spring:message code='crm.lbl.extcAmtReason' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                };

                return;

            };

            // form 데이터
            var param =
                $("#rechargeForm").serializeObject(
                    $("#rechargeForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            param["dlrCd"] = dlrCd;
            param["cardTpCd"] = cardTpCd;
            param["membershipNo"] = membershipNo;
            param["occrPointVal"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["extcTargYn"] = "N";
            param["insertFlag"] = "01";//충전카드 충전일땐 01 로 하며 존재여부파악하기 위해 사용

            var url = "<c:url value='/crm/dmm/membership/insertRechargeCradHis.do' />";

            //console.log("param : ",JSON.stringify(param))
            //return;

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){

                    //console.log("result : ",result)
                    if ( result === "00" ) {

                        dms.notification.success("<spring:message code='global.info.success'/>");
                        parent.$('#cardListGrid').data('kendoExtGrid').dataSource.read();
                        parent.$('#tabCardListGrid').data('kendoExtGrid').dataSource.page(1);
                        parent.membershipCardSearch.close();

                    } else if ( result === "01" ) {
                        // 요청 금액이 가용금액보다 큽니다.
                        dms.notification.error("<spring:message code='crm.error.rchgAmtError'/>");
                    } else {

                        //소멸사유은(는) 필수입력사항 입니다.
                        if ( pointCd === "10" ) {
                            // {충전} 에 실패하였습니다.
                            dms.notification.error("<spring:message code='crm.info.rchg' var='init' /><spring:message code='global.info.failedMsg' arguments='${init}' />");
                        } else if ( pointCd === "99" ) {
                            // {소멸} 에 실패하였습니다.
                            dms.notification.error("<spring:message code='crm.info.extcAmt' var='init' /><spring:message code='global.info.failedMsg' arguments='${init}' />");
                        };
                    }

                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            }).done(function(result) {
                //console.log("rechargAmtSave Done!!!!");
            });
       }
    });


});
</script>
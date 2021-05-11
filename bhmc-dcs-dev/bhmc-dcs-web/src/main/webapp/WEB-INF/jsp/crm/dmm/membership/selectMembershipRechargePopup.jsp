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

    <div class="table_form" id="transForm" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rchgCardNo'/></span></th> <!-- 충전카드번호 -->
                    <td colspan="2">
                        <input id="cardNo" name="cardNo" value="${cardNo}" class="form_input form_readonly" readonly="readonly" data-json-obj='true' maxlength="30"/>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rchgAmt'/></span></th> <!-- 충전금액 -->
                    <td colspan="2">
                        <input id="occrPointVal" name="occrPointVal" class="form_numberic" maxlength="10" data-json-obj='true'/>
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
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */

$(document).ready(function() {

 // 숫자
    /* $(".numberic").kendoMaskedTextBox({
        mask:"0000000000"
        , promptChar:" "
    }); */

    $("#occrPointVal").kendoExtNumericTextBox({
        format:"n0"
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            if(dms.string.isEmpty($("#cardNo").val())){
                //충전하고자 하는 카드를 선택하여 주십시오.
                dms.notification.info("<spring:message code='crm.info.rchgCardNoSelect'/>");
                return;
            }

            if(dms.string.isEmpty($("#occrPointVal").val())){
                //충전금액은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }

            if($("#occrPointVal").data("kendoExtNumericTextBox").value() <= 0){
                //충전금액은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgAmt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                return;
            }

         // form 데이터
            var param =
                $("#transForm").serializeObject(
                    $("#transForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            param["dlrCd"] = dlrCd;
            param["cardTpCd"] = cardTpCd;
            param["membershipNo"] = membershipNo;

            param["pointTp"] = "+";
            param["occrPointVal"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["realTotAmt"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["extcTargYn"] = "Y";
            param["insertFlag"] = "01";//충전카드 충전일땐 01 로 하며 존재여부파악하기 위해 사용

            var url = "<c:url value='/crm/dmm/membership/insertRechargeCradHis.do' />";

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    parent.$('#cardListGrid').data('kendoExtGrid').dataSource.read();
                    parent.$('#tabCardListGrid').data('kendoExtGrid').dataSource.page(1);
                    parent.membershipCardSearch.close();
                }
            }).done(function(result) {
                console.log("rechargAmtSave Done!!!!");
            });
       }
    });


});
</script>










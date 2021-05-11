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

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.pointCd" /></span></th><!-- 포인트 코드 -->
                    <td class="readonly_area">
                        <input id="pointCd" name="pointCd" class="form_select" data-json-obj="true" readonly>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rchgCardNo'/></span></th> <!-- 충전카드번호 -->
                    <td class="required_area">
                        <input id="cardNo" name="cardNo" class="form_input" placeholder="" value="${rechargeCardNo}" data-json-obj="true" /><!-- // 충전카드 조회 -->
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.rchgAmt'/></span></th> <!-- 충전금액 -->
                    <td>
                        <input id="occrPointVal" name="occrPointVal" class="form_numberic ar" maxlength="10"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<script type="text/javascript">
var dlrCd = "${dlrCd}";
var membershipNo = "${membershipNo}";
var cardTpCd = "${cardTpCd}";
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
var options = parent.membershipCardSearch.options.content.data;

/*************************************************************
 *드랍다운 리스트 셋팅
 *************************************************************/
 //카드종류구분 Array
 var cardTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 <c:forEach var="obj" items="${cardTpCdList}">
 cardTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 //카드종류구분 Map
 var cardTpMap = [];
 $.each(cardTpList, function(idx, obj){
     cardTpMap[obj.cmmCd] = obj.cmmCdNm;
 });

 //카드형태구분 Array
 var cardFormList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 <c:forEach var="obj" items="${cardFormCdList}">
 cardFormList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 //카드형태구분 Map
 var cardFormMap = [];
 $.each(cardFormList, function(idx, obj){
     cardFormMap[obj.cmmCd] = obj.cmmCdNm;
 });


$(document).ready(function() {

    //1.콤보  DataSource
    var pointCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${pointCdList}">
    pointCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var pointCdListMap = dms.data.arrayToMap(pointCdList, function(obj){ return obj.cmmCd; });

    // 포인트코드 드랍다운 리스트.
    $("#pointCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:pointCdList
    });

    $("#pointCd").data("kendoExtDropDownList").value("10");

    $("#occrPointVal").kendoExtNumericTextBox({
        format:"n2"
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#sCardTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cardTpList
        , index:0
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

            if(dms.string.isEmpty($("#cardNo").val())){

                //충전카드번호은(는) 필수입력사항 입니다.
                dms.notification.info("<spring:message code='crm.lbl.rchgCardNo' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
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
            var param = {};

            param["dlrCd"] = dlrCd;
            param["cardNo"] = $("#cardNo").val();
            param["cardTpCd"] = cardTpCd;
            param["membershipNo"] = membershipNo;
            param["pointCd"] = $("#pointCd").data("kendoExtDropDownList").value()
            param["occrPointVal"] = $("#occrPointVal").data("kendoExtNumericTextBox").value();
            param["insertFlag"] = "02";//충전카드 충전일땐 01 로 하며 존재여부파악하기 위해 사용

            var url = "<c:url value='/crm/dmm/membership/insertRechargeCard.do' />";

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
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    parent.$('#cardListGrid').data('kendoExtGrid').dataSource.read();
                    parent.$('#tabCardListGrid').data('kendoExtGrid').dataSource.page(1);
                    parent.membershipCardSearch.close();
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            }).done(function(result) {
                //console.log("rechargCardSave Done!!!!");
            });
       }
    });

});

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- reserveReady popup -->
    <section id="window" class="pop_wrap">
        <div class="table_form mt10" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required">
                        <span id="invResvActManNm"><spring:message code="par.lbl.invResvActManNm"/></span>
                        <span id="itemResvActCancManNm" style="display:none"><spring:message code="par.lbl.itemResvActCancManNm"/></span>
                        <!-- invResvActManNm -->
                    </th>
                    <td class="required_area">
                        <div class="form_search">
                            <input id="sReadyUsrNm" name="sReadyUsrNm" class="form_input" value="" />
                            <input type="hidden" id="sReadyUsrId" name="sReadyUsrId" />
                            <a href="javascript:;" onclick="javascript:selectCustSearchPopupWindow();"></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <span id="invResvActBigo"><spring:message code="par.lbl.invResvActBigo"/></span>
                        <span id="itemResvActCancBigo" style="display:none"><spring:message code="par.lbl.itemResvActCancBigo"/></span>
                        <!-- invResvActBigo -->
                    </th>
                    <td>
                        <input id="readyRemark" name="readyRemark" class="form_input" value="" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.carNo"/></th>
                    <td>
                        <input id="carNo" name="carNo" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.etcRvRegDt"/></th>
                    <td>
                        <input id="etcRvRegDt" name="etcRvRegDt" class="form_datepicker" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        <div class="btn_bottom">
            <button class="btn_m" id="btnOk"><spring:message code="par.btn.yes" /><!-- btnOk --></button>
            <button class="btn_m" id="btnCancel"><spring:message code="par.btn.no" /><!-- btnCancel --></button>
        </div>
    </section>
    <!-- receiveId popup -->
<!-- script -->
<script>

function labelTitleChange(readyStatCd){

    $("#invResvActManNm").show(0);
    $("#invResvActBigo").show(0);
    $("#itemResvActCancManNm").hide(0);
    $("#itemResvActCancBigo").hide(0);

    if(readyStatCd == "05"){
        $("#invResvActManNm").hide(0);
        $("#invResvActBigo").hide(0);
        $("#itemResvActCancManNm").show(0);
        $("#itemResvActCancBigo").show(0);
    }
}

var userSearchPopupWin;
function selectCustSearchPopupWindow(){

    options.callbackCustSearchPopupWindowOpenFunc({
        flag:"Y"
    });
}

function receiveCustermerData(data){

    $("#sReadyUsrNm").val(data.usrNm);
    $("#sReadyUsrId").val(data.usrId);
}

/**
 * 팝업 옵션
 */
 var options = null;

$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    options = parent.issueReserveReadyPopupButtonWindow.options.content.data;

    //확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){

            var etcRvRegDt = $("#etcRvRegDt").data("kendoExtMaskedDateTimePicker").value();
            var etcRvRegDtString = $("#etcRvRegDt").val();
            var sysNowDate = kendo.parseDate("${sysNowDate}");

            if($("#sReadyUsrNm").val() === ""){
                // 부품예류인는 필수 입력사항입니다.
                dms.notification.info("<spring:message code='par.lbl.invResvActManNm' var='invResvActManNm' /><spring:message code='global.info.required.field' arguments='${invResvActManNm}' />");
                $("#sReadyUsrNm").focus();

                return false;
            }

            if(options.readyStatCd == "03"){//예류일때 실행.
                if(etcRvRegDt === "" || etcRvRegDt == null){
                    // 예류종료일자는 필수 입력사항입니다.
                    dms.notification.info("<spring:message code='par.lbl.etcRvRegDt' var='etcRvRegDt' /><spring:message code='global.info.required.field' arguments='${etcRvRegDt}' />");

                    return false;
                }

                if(etcRvRegDt <= sysNowDate){

                    //부품예류일자는 현재일자보다 커야 합니다.
                    dms.notification.info("<spring:message code='par.lbl.etcRvRegDt' var='etcRvRegDt' /><spring:message code='par.lbl.toDay' var='toDay' /><spring:message code='par.info.itemReqZeroCntMsg' arguments='${etcRvRegDt},${toDay}' />");

                    return false;
                }
            }

            options.callbackFunc({
                flag:"Y"
                ,readyUsrId:$("#sReadyUsrId").val()
                ,readyUsrNm:$("#sReadyUsrNm").val()
                ,readyRemark:$("#readyRemark").val()
                ,carNo:$("#carNo").val()
                ,readyRegDt : etcRvRegDt
                ,readyRegDtString : etcRvRegDtString
            });
            parent.issueReserveReadyPopupButtonWindow.close();
        }
    });
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReserveReadyPopupButtonWindow.close();
        }
    });

    //etcRvRegDt datepicker
    $("#etcRvRegDt").kendoExtMaskedDateTimePicker({
        value:kendo.parseDate("${sysEndDate}")
        ,format:"<dms:configValue code='dateFormat' /> HH:mm:ss"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //send parameter page controll setting.
    if(options.hasOwnProperty("parGiTp")){
        $("#carNo").val(options.carNo);
        if(options.parGiTp == "OT" && options.readyStatCd == "03"){
            $("#carNo").prop("readOnly", false).removeClass("form_readonly");
        }else if(options.readyStatCd == "03"){
            $("#carNo").prop("readOnly", true).addClass("form_readonly");
        }
        else{//readyStatCd 05 : 부품예류취소
            $("#carNo").prop("readOnly", true).addClass("form_readonly");
            $("#etcRvRegDt").data("kendoExtMaskedDateTimePicker").enable(false);
            $("#etcRvRegDt").data("kendoExtMaskedDateTimePicker").value(null);
        }
        if(options.hasOwnProperty("readyStatCd")){
            $("#sReadyUsrId").val("${userId}");
            $("#sReadyUsrNm").val("${userNm}");
        }
    }
    //예류상태 별 타이틀 변경.
    labelTitleChange(options.readyStatCd);

});
</script>
<!-- //script -->
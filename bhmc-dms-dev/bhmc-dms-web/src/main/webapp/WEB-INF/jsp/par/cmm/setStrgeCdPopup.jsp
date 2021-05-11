<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 입고창고 변경 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="width:70%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                    </tr>
                    <tr id="sGrReasonCdArea">
                        <th scope="row"><spring:message code="par.lbl.strgeMoveReason" /><!-- 입고사유 --></th>
                        <td>
                            <input id="sGrReasonCd" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>

<script type="text/javascript">
var grStrgeTpList = [];

//입고창고
<c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
</c:forEach>

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var options = parent.setStrgeCdPopupWindow.options.content.data,
            gGrReasonYn = 'Y';

        // 입고창고 선택
        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:grStrgeTpList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        });

        if(!dms.string.isEmpty(options.grReasonYn)){
            gGrReasonYn = options.grReasonYn;
        }

        if(gGrReasonYn !== 'Y'){
            $("#sGrReasonCdArea").hide();
        }

        /************************************************************
                    조회조건 설정
        *************************************************************/

        // 적용 버튼
        $("#btnSelect").kendoButton({
            click:function(e){
                var selectStrgeCd
                    ,selectGrReasonCd;

                selectStrgeCd = $("#sStrgeCd").data("kendoExtDropDownList").value();
                selectGrReasonCd = $("#sGrReasonCd").val();

                if(dms.string.isEmpty(selectGrReasonCd)){
                    selectGrReasonCd = "";
                }

                if(dms.string.isEmpty(selectStrgeCd) && dms.string.isEmpty(selectGrReasonCd)){
                    //창고사유 또는 입고창고를 입력해 주세요.
                    dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='par.lbl.strgeMoveReason' var='strgeMoveReason' /><spring:message code='global.info.inputOneParam' arguments='${grStrgeCd},${strgeMoveReason}' />");
                    return false;
                }

                options.callbackFunc({strgeCd:selectStrgeCd,grReasonCd:selectGrReasonCd});
            }
        });
    });
</script>


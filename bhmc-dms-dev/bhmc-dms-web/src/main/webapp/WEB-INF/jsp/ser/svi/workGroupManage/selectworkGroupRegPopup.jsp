<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form" role="select" data-btnid="btnSelect">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.wrkTeamNo" /><!-- 반조번호 --></th>
                    <td>
                        <input id="wkgrpNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.wkgrpNo" /><!-- 정비반조 --></th>
                    <td>
                        <input id="wkgrpNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.lbrTp" /><%-- 정비유형 --%></th>
                    <td>
                        <input id="rpirTp" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.mngSaNm" /><!-- 반조관리자--></th>
                    <td>
                        <div class="form_search">
                            <input id="mngSaNm" type="text" class="form_input" readonly="true" />
                            <a href="javascript:userAdd();"></a>
                        </div>
                        <input id="mngSaId" type="hidden" class="form_input" readonly="true" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.wrkgrpStat" /><!-- 반조상태 --></th>
                    <td>
                        <input id="wkgrpStatCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.wkgrpUseDt" /><!-- 반조사용시간 --></th>
                    <td>
                        <input id="wkgrpUseDt" type="text" class="form_datetimepicker" />
                    </td>
                </tr>
                <tr>
                    <%-- <th scope="row"><spring:message code="ser.lbl.wkgrpStopDt" /><!-- 반조중지시간 --></th>
                    <td>
                        <input id="wkgrpStopDt" type="text" class="form_datetimepicker" />
                    </td> --%>
                    <th scope="row"><spring:message code="ser.lbl.wkgrpRemark" /><!-- 반조비고 --></th>
                    <td colspan=5>
                        <input id="wkgrpRemark" type="text" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<script type="text/javascript">

    // 공통코드:수리유형
    var rpirTpCdList = [];
    <c:forEach var="obj" items="${rpirTpCdList}">
    rpirTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var rpirTpCdMap = dms.data.arrayToMap(rpirTpCdList, function(obj){return obj.cmmCd;});

    var wkgrpStatList = [{"cmmCd":"","cmmCdNm":""}];
    <c:forEach var="obj" items="${wkgrpStatList}">
    wkgrpStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var wkgrpStatArr = dms.data.arrayToMap(wkgrpStatList, function(obj){return obj.cmmCd;});

    // 반조사용시간
    $("#wkgrpUseDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 반조중지시간
    /* $("#wkgrpStopDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }); */

    $(document).ready(function() {

        // 수리유형
        $("#rpirTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:rpirTpCdList
            ,optionLabel:" "
            ,index:0
        });

        // 반조상태
        $("#wkgrpStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:wkgrpStatList
            ,index:1
        });
        $("#wkgrpStatCd").data("kendoExtDropDownList").value("01");

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.workGroupRegPopupWindow.options.content.data;

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var data = {
                            "wkgrpNo":$("#wkgrpNo").val()
                           ,"wkgrpNm":$("#wkgrpNm").val()
                           ,"rpirTp":$("#rpirTp").data("kendoExtDropDownList").value()
                           ,"mngSaNm":$("#mngSaNm").val()
                           ,"mngSaId":$("#mngSaId").val()
                           ,"wkgrpStatCd":$("#wkgrpStatCd").data("kendoExtDropDownList").value()
                           ,"wkgrpUseDt":$("#wkgrpUseDt").data("kendoExtMaskedDateTimePicker").value()
                           //,"wkgrpStopDt":$("#wkgrpStopDt").data("kendoExtMaskedDateTimePicker").value()
                           ,"wkgrpRemark":$("#wkgrpRemark").val()
                            };

                if( dms.string.isEmpty(data.wkgrpNo)){
                    msgText = "<spring:message code='ser.lbl.wrkTeamNo' var='wkgrpNo' />"+
                              "<spring:message code='global.info.required.field' arguments='${wkgrpNo}' />";
                    return dms.notification.warning(msgText);
                }

                if( dms.string.isEmpty(data.wkgrpNm) ){
                    msgText = "<spring:message code='ser.lbl.wkgrpNo' var='wkgrpNm' />"+
                              "<spring:message code='global.info.required.field' arguments='${wkgrpNm}' />";
                    return dms.notification.warning(msgText);
                }

                options.callbackFunc(data);
            }
        });

    });

    userAdd = function(flag){
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            ,height:530
            ,title:"<spring:message code='ser.lbl.serviceUserSearch' />"   // 사용자조회
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#mngSaId").val(data[0].tecId);
                            $("#mngSaNm").val(data[0].tecNm);
                        }
                    }
                }
            }
        });
    };
</script>

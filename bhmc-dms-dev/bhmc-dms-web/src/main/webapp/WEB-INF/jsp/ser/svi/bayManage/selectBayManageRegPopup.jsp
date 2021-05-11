<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.confirm" /></button>
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
                    <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></th>
                    <td>
                        <input id="bayNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayNm" /><!-- BAY NM --></th>
                    <td>
                        <input id="bayNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayMngNm" /><%-- BAY 관리자 --%></th>
                    <td>
                        <div class="form_search">
                            <input id="admSaNm" type="text" class="form_input" readonly="true" />
                            <a href="javascript:userAdd('01');"></a>
                        </div>
                        <input id="admSaId" type="hidden" class="form_input" readonly="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.bayStatCd" /><!-- BAY 상태 --></th>
                    <td>
                        <input id="bayStatCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.resvBay" /><!-- 예약 BAY --></th>
                    <td>
                        <input id="vrYn" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.lbrTp" /><%-- 정비유형 --%></th>
                    <td>
                        <input id="rpirTp" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.eqmCd" /><!-- 설비번호 --></th>
                    <td>
                        <input id="eqmCd" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.eqmNm" /><!-- 설비명 --></th>
                    <td>
                        <input id="eqmNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.eqmMtnUsrNm" /><%-- 설비유지보수자 --%></th>
                    <td>
                        <div class="form_search">
                            <input id="eqmMtnUsrNm" type="text" class="form_input" readonly="true" />
                            <a href="javascript:userAdd('02');"></a>
                        </div>
                        <input id="eqmMtnUsrId" type="hidden" class="form_input" readonly="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.eqmRegDt" /><!-- 설비등록시간 --></th>
                    <td>
                        <input id="eqmRegDt" type="text" class="form_datetimepicker" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.eqmMtnPrid" /><!-- 설비유지보수기간 --></th>
                    <td>
                        <input id="eqmMtnPrid" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.eqmChkDt" /><%-- 설비정검시간--%></th>
                    <td>
                        <input id="eqmChkDt" type="text" class="form_datetimepicker" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.bayRemark" /><!-- BAY 비고 --></th>
                    <td colspan=5>
                        <input id="remark" type="text" class="form_input" />
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

    //공통코드:BAY상세구분
    var bayGrpTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${bayGrpTpCdList}">
    bayGrpTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var bayGrpTpCdArr = dms.data.arrayToMap(bayGrpTpCdList, function(obj){return obj.cmmCd;});

    //공통코드:BAY상태코드
    var bayStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${bayStatCdList}">
    bayStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var bayStatCdMap = dms.data.arrayToMap(bayStatCdList, function(obj){return obj.cmmCd;});

    //공통코드:사용여부
    var useYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${userYnList}">
    useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});

    // 설비등록시간
    $("#eqmRegDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 설비점검시간
    $("#eqmChkDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $(document).ready(function() {

        // 수리유형
        $("#rpirTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:rpirTpCdList
            ,optionLabel:" "
            ,index:0
        });

        // BAY 상태
        $("#bayStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bayStatCdList
            ,index:1
        });
        $("#bayStatCd").data("kendoExtDropDownList").value("01");

        // 예약 BAY
        $("#vrYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:1
        });
        $("#vrYn").data("kendoExtDropDownList").value("N");

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.bayManageRegPopupWindow.options.content.data;

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var data = {
                            "bayNo":$("#bayNo").val()
                           ,"bayNm":$("#bayNm").val()
                           ,"admSaId":$("#admSaId").val()
                           ,"admSaNm":$("#admSaNm").val()
                           ,"bayStatCd":$("#bayStatCd").data("kendoExtDropDownList").value()
                           ,"vrYn":$("#vrYn").data("kendoExtDropDownList").value()
                           ,"rpirTp":$("#rpirTp").data("kendoExtDropDownList").value()
                           ,"eqmCd":$("#eqmCd").val()
                           ,"eqmNm":$("#eqmNm").val()
                           ,"eqmMtnUsrId":$("#eqmMtnUsrId").val()
                           ,"eqmMtnUsrNm":$("#eqmMtnUsrNm").val()
                           ,"eqmRegDt":$("#eqmRegDt").data("kendoExtMaskedDateTimePicker").value()
                           //,"eqmValidStartDt":$("#eqmValidStartDt").val()
                           //,"eqmValidEndDt":$("#eqmValidEndDt").val()
                           ,"eqmMtnPrid":$("#eqmMtnPrid").val()
                           ,"eqmChkDt":$("#eqmChkDt").data("kendoExtMaskedDateTimePicker").value()
                           ,"remark":$("#remark").val()
                            };

                if(dms.string.strNvl(data.bayNo) == ""){
                    msgText = "<spring:message code='ser.lbl.bayNo' var='bayNo' />"+
                    "<spring:message code='global.info.required.field' arguments='${bayNo}' />";

                    result = false;
                    return dms.notification.warning(msgText);
                }
                if(dms.string.strNvl(data.bayNm) == ""){
                    msgText = "<spring:message code='ser.lbl.bayNm' var='bayNm' />"+
                    "<spring:message code='global.info.required.field' arguments='${bayNm}' />";

                    result = false;
                    return dms.notification.warning(msgText);
                }
                if(dms.string.strNvl(data.admSaNm) == ""){
                    msgText = "<spring:message code='ser.lbl.bayMngNm' var='admSaNm' />"+
                    "<spring:message code='global.info.required.field' arguments='${admSaNm}' />";

                    result = false;
                    return dms.notification.warning(msgText);
                }
                if(dms.string.strNvl(data.bayStatCd) == ""){
                    msgText = "<spring:message code='ser.lbl.bayStatCd' var='bayStatCd' />"+
                    "<spring:message code='global.info.required.field' arguments='${bayStatCd}' />";

                    result = false;
                    return dms.notification.warning(msgText);
                }

                options.callbackFunc(data);
                //parent.bayManageRegPopupWindow.close();
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
                            if(flag == "01"){
                                $("#admSaId").val(data[0].tecId);
                                $("#admSaNm").val(data[0].tecNm);
                            }else if(flag == "02"){
                                $("#eqmMtnUsrId").val(data[0].tecId);
                                $("#eqmMtnUsrNm").val(data[0].tecNm);
                            }
                        }
                    }
                }
            }
        });
    };
</script>

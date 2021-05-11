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
                    <th scope="row"><spring:message code="ser.lbl.dcAuthCd" /><!-- 할인코드 --></th>
                    <td class="readonly_area">
                        <input id="dcCd" type="text" class="form_input" readonly />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dcAuthName" /><!-- 할인명 --></th>
                    <td>
                        <input id="dcNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dcTp" /><!-- 할인적용방식 --></th>
                    <td class="readonly_area">
                        <input id="dcTp" type="text" class="form_comboBox" readonly/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.useYn" /><!-- 사용여부 --></th>
                    <td>
                        <input id="dcUseYn" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dcStartDt" /><!-- 할인시작일자 --></th>
                    <td>
                        <input id="dcApplyStartDt" type="text" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dcEndDt" /><!-- 할인종료일자 --></th>
                    <td>
                        <input id="dcApplyEndDt" type="text" class="form_datepicker" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.lbrDcRate" /><!-- 공임할인율 --></th>
                    <td>
                        <input id="lbrDcRate" class="form_numeric ar" data-type="number" value="0.00" min="0" maxlength="3" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.parDcRate" /><!-- 부품할인율 --></th>
                    <td>
                        <input id="parDcRate" class="form_numeric ar" data-type="number" value="0.00" min="0" maxlength="3" />
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<script type="text/javascript">

    //dc유형 Array
    var dcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${dcTpList}">
    dcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var dcTpMap = dms.data.arrayToMap(dcTpList, function(obj){return obj.cmmCd;});

    //공통코드:사용여부
    var useYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${useYnList}">
    useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});

    $("#dcApplyStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#dcApplyEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#lbrDcRate, #parDcRate").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,spinners:false
    });

    $(document).ready(function() {

        $("#dcUseYn").kendoExtDropDownList({
            dataSource:useYnList
           ,dataValueField:"cmmCd"
           ,dataTextField:"cmmCdNm"
           ,index:" "
        });
        $("#dcUseYn").data("kendoExtDropDownList").value("Y");

        $("#dcTp").kendoExtDropDownList({
            dataSource:dcTpList
           ,dataValueField:"cmmCd"
           ,dataTextField:"cmmCdNm"
           ,index:0
        });
        $("#dcTp").data("kendoExtDropDownList").value("02");

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.dcMasterRegPopupWindow.options.content.data;

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var data = {
                            "dcCd":$("#dcCd").val()
                           ,"dcNm":$("#dcNm").val()
                           ,"dcTp":$("#dcTp").data("kendoExtDropDownList").value()
                           ,"dcUseYn":$("#dcUseYn").data("kendoExtDropDownList").value()
                           ,"dcApplyStartDt":$("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value()
                           ,"dcApplyEndDt":$("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value()
                           ,"lbrDcRate":$("#lbrDcRate").data("kendoExtNumericTextBox").value()
                           ,"parDcRate":$("#parDcRate").data("kendoExtNumericTextBox").value()
                           ,"dcDstinCd":"PEM"
                           ,"dcPermTp":"01"
                           };

                options.callbackFunc(data);
            }
        });

    });
</script>

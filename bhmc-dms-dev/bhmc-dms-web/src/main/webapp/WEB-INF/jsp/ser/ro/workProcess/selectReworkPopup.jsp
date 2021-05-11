<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:40%;">
                <col style="width:59%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.reWorkRemark' /></th>
                    <td>
                        <input id="rwrkRemark" name="rwrkRemark" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.reWork' /></th>
                    <td>
                        <input id="rwrkCd" name="rwrkCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.chgConformDt' /></th>
                    <td>
                        <input id="wrkEndDt" name="wrkEndDt" class="form_datepicker">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.chgExpcDlDt' /></th>
                    <td>
                        <input id="expcDlDt" name="expcDlDt" class="form_datepicker">
                        <input type="hidden" id="roDocNo" name="roDocNo"/>
                        <input type="hidden" id="roGrpNo" name="roGrpNo"/>
                        <input type="hidden" id="lineNo" name="lineNo"/>
                        <input type="hidden" id="rpirCd" name="rpirCd"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
     <div class="header_area">
        <div class="btn_right">
             <button class="btn_m" id="btnConf"><spring:message code='global.btn.confirm' /><!-- 확인 --></button>
            <button class="btn_m" id="btnCancel"><spring:message code='global.btn.close' /><!-- 닫기 --></button>
        </div>
    </div>

</section>

<script type="text/javascript">

//공통코드:정비유형(수리유형)
var rwrkCdList = [];
<c:forEach var="obj" items="${rwrkCdList}">
rwrkCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var rwrkCdArr = dms.data.arrayToMap(rwrkCdList, function(obj){return obj.cmmCd});
    $(document).ready(function() {

        $("#wrkEndDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#expcDlDt").kendoExtMaskedDateTimePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#rwrkCd").kendoExtDropDownList({
            dataSource:rwrkCdList
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            ,index:0
        });

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.reworkPopupWindow.options.content.data;
         $("#roDocNo").val(options.roDocNo);
         $("#roGrpNo").val(options.roGrpNo);
         $("#lineNo").val(options.lineNo);
         $("#rpirCd").val(options.rpirCd);

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){

                if(rows !== null)
                {
                    options.callbackFunc(data);
                }
            }
        });

       // 닫기 버튼.
        $("#btnConf").kendoButton({
            click:function(e){
                var datas = {};
                    datas.rwrkRemark = $("#rwrkRemark").val();
                    datas.rwrkCd = $("#rwrkCd").val();
                    datas.roDocNo = $("#roDocNo").val();
                    datas.roGrpNo = $("#roGrpNo").val();
                    datas.rpirCd = $("#rpirCd").val();
                    datas.lineNo = $("#lineNo").val();
                    datas.expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
                    datas.wrkEndDt = $("#wrkEndDt").data("kendoExtMaskedDateTimePicker").value();

                $.ajax({
                    url:"<c:url value='/ser/ro/qtTest/insertRework.do' />",
                    data:JSON.stringify(datas),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        //dms.notification.success("<spring:message code='global.info.success'/>");
                        options.callbackFunc();
                        parent.reworkPopupWindow.close();
                    }
                });
            }
        });

});
</script>










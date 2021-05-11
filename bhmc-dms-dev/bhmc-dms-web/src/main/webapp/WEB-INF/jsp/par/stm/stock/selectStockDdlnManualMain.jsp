<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 월마감조회 -->
    <section class="group">
        <div class="table_form form_width_100per mt10"  id="ddlnForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.AccYyMm" /></th>
                        <td>
                            <input id="sAccYyMm" class="form_datepicker" style="width:40%">
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.btn.manualClosing" /></th>
                        <td>
<!--                         	2018-10-23  update by weiyongjie 截止管理 手动截止按钮置为灰色 start -->
                            <button type="button" class="btn_s" style="width:40%" id="btnExcute" disabled="disabled">재고마감계산</button>
<!--                             2018-10-23 update by weiyongjie 截止管理 手动截止按钮置为灰色 end -->
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>
     var toDt            = "${toDt}"
        ,searchDtBf      = "${searchDtBf}"
        ,toYy            = new Date();


    $(document).ready(function() {

        $("#sAccYyMm").kendoExtMaskedDatePicker({
            start:"year"
           ,depth:"year"
           ,format:"yyyy-MM"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });


        // 실행 버튼
        //월마감 실행 시 프로시저 내에서 보낸 달의 (-1) 개월 정보를 생성한다.
        //마감월을 '17년 2월'로 화면에서 선택한 경우 서비스로 호출 시 '201703'으로 넘겨야 2월에 대한 월마감을 생성함.
        //그래서 ajax호출 시 1개월을 더해서 보낸다.
        $("#btnExcute").kendoButton({
            click: function(e){
                var  accYyMm  = $("#sAccYyMm").data("kendoExtMaskedDatePicker").value(),
                     accYy    = accYyMm.getFullYear(),
                     accMm    = dms.string.lpad((accYyMm.getMonth() + 2) + '','0',2),
                     data     = {},
                     sAccYyMm;

                sAccYyMm = accYy + accMm;

                data["sAccYyMm"] = sAccYyMm;

                $.ajax({
                    url:"<c:url value='/par/stm/stock/executeParMmDdlnLoopDlrCdProcedure.do' />"
                   ,data:kendo.stringify(data)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {

                       if (result === 1) {
                           dms.notification.success("<spring:message code='par.lbl.AccYyMm' var='accYyMm' /><spring:message code='global.info.successMsg' arguments='${accYyMm}'/>");

                       } else {
                           if(result === 0){
                               dms.notification.error("<spring:message code='par.lbl.AccYyMm' var='accYyMm' /><spring:message code='global.info.failedMsg' arguments='${accYyMm}'/>");
                           }
                       }
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });
            }
        });

        var maxDate = new Date(searchDtBf);

        $("#sAccYyMm").data("kendoExtMaskedDatePicker").value(searchDtBf.substring(0,8));

        $("#sAccYyMm").data("kendoExtMaskedDatePicker").max(new Date(maxDate.getFullYear(),maxDate.getMonth()));
        $("#sAccYyMm").data("kendoExtMaskedDatePicker").enable(false);
    });

</script>
<!-- //script -->


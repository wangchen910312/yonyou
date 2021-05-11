<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_m btn_Save" id="btnSave" ><spring:message code="global.btn.save" /></button>
            </div>
        </div>
        <form id="form" method="post" action="/">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:24%;">
                        <col style="width:18%;">
                        <col style="width:24%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.roDocNo" /></span></th>
                            <td class="required_area">
                                <input type="text" id="roDocNo" name="roDocNo" class="form_input form_readonly" readonly /> <!-- RO 번호 -->
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.nowRunDist" /></th>
                            <td>
                                <input type="text" id="runDistVal" name="runDistVal" maxlength="8" value="" class="form_numeric ar"/> <!-- 주행거리 -->
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /></th> <!-- 최종주행거리 -->
                            <td class="required_area">
                                <input type="text" id="lastRunDistVal" name="lastRunDistVal" maxlength="8" class="form_numeric ar" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <input type="hidden" id="dlrCd" name="dlrCd" />
            <input type="hidden" id="vinNo" name="vinNo" />
            <input type="hidden" id="roTp" name="roTp" />
        </form>
    </section>
</div>
<script type="text/javascript">


$(document).ready(function() {

    var parentData = parent.runDistValPopupWindow.options.content.data;

    $("#runDistVal, #lastRunDistVal").kendoExtNumericTextBox({
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#dlrCd").val(parentData.data.dlrCd);
    $("#vinNo").val(parentData.data.vinNo);
    $("#roDocNo").val(parentData.data.roDocNo);
    $("#roTp").val(parentData.data.roTp);
    $("#runDistVal").data("kendoExtNumericTextBox").value(parentData.data.runDistVal);
    $("#lastRunDistVal").data("kendoExtNumericTextBox").value(parentData.data.lastRunDistVal);


 // 닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            parent.runDistValPopupWindow.close();
        }
    });


  // 저장버튼
    $("#btnSave").kendoButton({
        click:function (e){

            //form data
            var saveData =  $("#form").serializeObject() ;
            //saveData.dlrCd = $("#dlrCd").val();
            parentData.callbackFunc(saveData);
            parent.runDistValPopupWindow.close();
        }
    });

    isRegCheck = function(param){
        var regExp = /^[a-zA-Z0-9 ]+$/g;
        var val = $("#lbrEnNm").val();
        var rtn = regExp.test(val);

        return rtn;
    };


});




</script>
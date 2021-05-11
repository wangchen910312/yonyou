<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 일괄변경 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m"><spring:message code='global.btn.save' /></button>  <!-- 저장 -->
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
                    <th scope="row"><spring:message code='sal.lbl.mortgageTp' /></th>       <!-- 담보유형 -->
                    <td>
                        <input type="text" id="sMortgageTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- //일괄변경 팝업 -->

<script>
//재고유형 SAL074
var mortgageTpDSList = [];
<c:forEach var="obj" items="${mortgageTp}">
  mortgageTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 담보유형
    $("#sMortgageTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:mortgageTpDSList
       //,optionLabel:" "           //선택
    });

    // 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var data = {};
            data.mortgageTp =  $("#sMortgageTp").data("kendoExtDropDownList").value();
            data.state = "01";
            options.callbackFunc(data);
        }
    });
});
</script>
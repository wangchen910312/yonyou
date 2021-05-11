<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 구원차/대부차량심사 정책입력 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_left">
            &nbsp;<button id="btnHistory" class="btn_m"><spring:message code='sal.btn.policySearch' /></button>           <!-- 이력조회 -->
        </div>
        <div class="btn_right">
            <button id="btnConfirm" class="btn_m"><spring:message code='global.btn.fix' /></button>           <!-- 확정 -->
            <%-- <button id="btnClose" class="btn_m"><spring:message code='global.btn.close' /></button> --%>           <!-- 닫기 -->
        </div>
    </div>

    <div class="table_form form_width_20per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carType' /></th>   <!-- 차량유형 -->
                    <td>
                        <input id="tpCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.policyCont' /></th>    <!--정책설명 -->
                    <td>
                        <textarea id="policyCont" rows="7" cols="" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- //구원차/대부차량심사 정책입력 팝업 -->

<!-- script -->
<script>

//차량유형 SAL142
var typeTpDSList = [];
var typeTpObj = {};
<c:forEach var="obj" items="${typeTpDS}">
    typeTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    typeTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
    // 팝업 설정값
    var options = parent.popupWindow2.options.content.data;

    // 차량유형
    $("#tpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       ,value:'N7'
       ,enabled:false
       , optionLabel:" "           //선택
    });

    selectPolicyCont('N7');

    // 확정 버튼
    $("#btnConfirm").kendoButton({
        click:function(e){

            if($("#tpCd").val() == ""){
                // {차량유형}를(을) 선택해주세요.:계약고객
                dms.notification.info("<spring:message code='global.lbl.carType' var='globalLblCarType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarType}' />");
                return false;
            }

            if( dms.string.trim($("#policyCont").val()) == ""){
                dms.notification.info("<spring:message code='global.lbl.policyCont' var='globalLblPolicyCont' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblPolicyCont}' />");
                return false;
            }

            var param = {};
            param.tpCd = $("#tpCd").val();
            param.policyCont = $("#policyCont").val();

            $.ajax({
                url:"<c:url value='/sal/svo/testDriveVehicle/confirmPolicyInputPopup.do' />",
                data:JSON.stringify(param),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");

                     var data = [];
                     data.msg = 'close';
                     options.callbackFunc(data);
                     parent.popupWindow2.close();
                }
            });
        }
    });

    // 닫기 버튼
    $("#btnClose").kendoButton({
        click:function(e){
            var data = [];
            data.msg = 'close';
            options.callbackFunc(data);
            parent.popupWindow2.close();
        }
    });

    // 정책이력 조회
    $("#btnHistory").kendoButton({
        click:function(e){
            window.parent.parent._createOrReloadTabMenu("<spring:message code='sal.menu.specialCarPolicy' />", "<c:url value='/sal/svo/specialCarPolicy/selectSpecialCarPolicyMain.do' />?sTpCd="+tpCd, "VIEW-I-10601");
        }
    });

});

/**
 * 차량유형 설명 조회
 */
function selectPolicyCont(tpCd){
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopupCont.do"
        ,data:JSON.stringify({"sTpCd":tpCd})
        ,async:false
    });
   // 차량유형 설명
   $("#policyCont").val(responseJson.data[0].policyCont);
}


</script>
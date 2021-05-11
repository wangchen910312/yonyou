<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <%-- <button class="btn_s" id="btnConfirm"><spring:message code='global.btn.fix' /></button> --%><!-- 확정 -->
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:22%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.dstbSerEval' /></th><!-- 물류 서비스 평가 -->
                    <td>
                        <ul class="tabmenu">
                            <li id="dstbSerEvalVal5" class="on"><button type="button"><spring:message code='global.btn.satisfaction' /></button></li><!-- 만족 -->
                            <li id="dstbSerEvalVal4"><button type="button"><spring:message code='global.btn.basicSatisfaction' /></button></li><!-- 기본만족 -->
                            <li id="dstbSerEvalVal3"><button type="button"><spring:message code='global.btn.normal' /></button></li><!-- 일반 -->
                            <li id="dstbSerEvalVal2"><button type="button"><spring:message code='global.btn.basicDissatisfied' /></button></li><!-- 기본 불만족 -->
                            <li id="dstbSerEvalVal1"><button type="button"><spring:message code='global.btn.dissatisfied' /></button></li><!-- 불만족 -->
                            <input type="hidden" id="dstbSerEvalVal" name="dstbSerEvalVal" value="5"/>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.driverStsf' /></th><!-- 기사 만족도 -->
                    <td>
                        <ul class="tabmenu">
                            <li id="driverStsfVal5" class="on"><button type="button"><spring:message code='global.btn.satisfaction' /></button></li><!-- 만족 -->
                            <li id="driverStsfVal4"><button type="button"><spring:message code='global.btn.basicSatisfaction' /></button></li><!-- 기본만족 -->
                            <li id="driverStsfVal3"><button type="button"><spring:message code='global.btn.normal' /></button></li><!-- 일반 -->
                            <li id="driverStsfVal2"><button type="button"><spring:message code='global.btn.basicDissatisfied' /></button></li><!-- 기본 불만족 -->
                            <li id="driverStsfVal1"><button type="button"><spring:message code='global.btn.dissatisfied' /></button></li><!-- 불만족 -->
                            <input type="hidden" id="driverStsfVal" name="driverStsfVal" value="5"/>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carIssueHm' /></th><!-- 차량 교부시간 -->
                    <td>
                        <ul class="tabmenu">
                            <li  id="carIssueHmVal1" class="on"><button type="button"><spring:message code='global.btn.truth' /></button></li><!-- 진실 -->
                            <li  id="carIssueHmVal2"><button type="button"><spring:message code='sal.lbl.falsehood' /></button></li><!-- 허위 -->
                            <input type="hidden" id="carIssueHmVal" name="carIssueHmVal" value="1"/>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carIssueMass' /></th><!-- 차량 교부질량 -->
                    <td>
                        <ul class="tabmenu">
                            <li id="carIssueMassVal1" class="on"><button type="button"><spring:message code='global.btn.good' /></button></li><!-- 양호 -->
                            <li id="carIssueMassVal2"><button type="button"><spring:message code='global.btn.slightlyDamaged' /></button></li><!-- 손상경미 -->
                            <li id="carIssueMassVal3"><button type="button"><spring:message code='global.btn.seriousDamage' /></button></li><!-- 손상엄중 -->
                            <li id="carIssueMassVal4"><button type="button"><spring:message code='global.btn.vehicleParts' /></button></li><!-- 차량부품 -->
                            <li id="carIssueMassVal5"><button type="button"><spring:message code='global.btn.remoteControlFault' /></button></li><!-- 리모컨 고장 -->
                            <li id="carIssueMassVal6"><button type="button"><spring:message code='global.btn.etc' /></button></li><!-- 기타 -->
                            <input type="hidden" id="carIssueMassVal" name="carIssueMassVal" value="1"/>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.otherCont' /></th><!-- 기타신고 및 의견 -->
                    <td>
                        <textarea id="otherCont" name="otherCont" rows="5" cols="" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<script type="text/javascript">
    /**
     * 팝업 옵션
     */
     var options = parent.popupWindow.options.content.data;

    $(document).ready(function() {

        // 물류서비스 평가:불만족
        $("#dstbSerEvalVal1").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#dstbSerEvalVal").val("1");
        });
        // 물류서비스 평가:기본 불만족
        $("#dstbSerEvalVal2").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#dstbSerEvalVal").val("2");
        });
        // 물류서비스 평가:일반
        $("#dstbSerEvalVal3").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#dstbSerEvalVal").val("3");
        });
        // 물류서비스 평가:기본 만족
        $("#dstbSerEvalVal4").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#dstbSerEvalVal").val("4");
        });
        // 물류서비스 평가:만족
        $("#dstbSerEvalVal5").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#dstbSerEvalVal").val("5");
        });

        // 기사 만족도:불만족
        $("#driverStsfVal1").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#driverStsfVal").val("1");
        });
        // 기사 만족도:기본 불만족
        $("#driverStsfVal2").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#driverStsfVal").val("2");
        });
        // 기사 만족도:일반
        $("#driverStsfVal3").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#driverStsfVal").val("3");
        });
        // 기사 만족도:기본 만족
        $("#driverStsfVal4").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#driverStsfVal").val("4");
        });
        // 기사 만족도:만족
        $("#driverStsfVal5").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#driverStsfVal").val("5");
        });

        // 차량 교부시간:진실
        $("#carIssueHmVal1").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueHmVal").val("1");
        });
        // 차량 교부시간 :허위
        $("#carIssueHmVal2").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueHmVal").val("2");
        });

        // 차량 교부질량:완호
        $("#carIssueMassVal1").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueMassVal").val("1");
        });
        // 차량 교부질량:손상경미
        $("#carIssueMassVal2").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueMassVal").val("2");
        });
        // 차량 교부질량:손상엄중
        $("#carIssueMassVal3").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueMassVal").val("3");
        });
        // 차량 교부질량:차량부품
        $("#carIssueMassVal4").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueMassVal").val("4");
        });
        // 차량 교부질량:리모컨 고장
        $("#carIssueMassVal5").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueMassVal").val("5");
        });
        // 차량 교부질량:기타
        $("#carIssueMassVal6").click(function(){
            $(this).siblings("li").removeClass("on");
            $(this).addClass("on");
            $("#carIssueMassVal").val("6");
        });
        /************************************************************
                    팝업옵션 설정
        *************************************************************/

        /************************************************************
                    조회조건 설정
        *************************************************************/

        // 확정 버튼
        $("#btnConfirm").kendoButton({
            click:function(e){

                var confirmData = { "dstbSerEvalVal":$("#dstbSerEvalVal").val()
                                   ,"driverStsfVal":$("#driverStsfVal").val()
                                   ,"carIssueHmVal":$("#carIssueHmVal").val()
                                   ,"carIssueMassVal":$("#carIssueMassVal").val()
                                   ,"otherCont":$("#otherCont").val()};

                var data = [];
                data.result = confirmData;
                data.msg = 'save';

                options.callbackFunc(data);
                parent.popupWindow.close();
            }
        });

        /************************************************************
        그리드 설정
        *************************************************************/

        if( options.strVinNo != null && options.strVinNo != "" ){

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehiclePopup.do' />"
                ,data:JSON.stringify({"sVinNo":options.strVinNo})
                ,async:false
            });

            detailList = responseJson.data;

            if( detailList != null && detailList.length > 0){

                $("#dstbSerEvalVal").val(detailList[0].dstbSerEvalVal);
                $("#dstbSerEvalVal"+detailList[0].dstbSerEvalVal).click();

                $("#driverStsfVal").val(detailList[0].driverStsfVal);
                $("#driverStsfVal"+detailList[0].driverStsfVal).click();

                $("#carIssueHmVal").val(detailList[0].carIssueHmVal);
                $("#carIssueHmVal"+detailList[0].carIssueHmVal).click();

                $("#carIssueMassVal").val(detailList[0].carIssueMassVal);
                $("#carIssueMassVal"+detailList[0].carIssueMassVal).click();

                $("#otherCont").val(detailList[0].otherCont);
            }
        }
    });
</script>
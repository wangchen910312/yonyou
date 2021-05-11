<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.specialPointInfo" /><!-- 특별 포인트 정보 --></h1>
            <div class="btn_right">
                <%-- <button id="btnRequestPrint" class="btn_m btn_Search"><spring:message code='global.title.reqFormPrint'/></button> --%> <!-- 신청서 프린트 -->
                <button id="btnRequest" class="btn_m btn_Search"><spring:message code="global.btn.request" /></button> <!-- 신청 -->
            </div>
        </div>

        <div class="table_form" id="specialPointform">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.pointCd" /></span></th><!-- 포인트 코드 -->
                        <td colspan="4">
                            <input id="pointCd" name="pointCd" class="form_select" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><c:choose><c:when test="${specialPointTp == '01'}"><spring:message code="global.lbl.savePoint" /><!-- 적립 포인트 --></c:when><c:otherwise><spring:message code="crm.lbl.decPoint" /><!-- 감소 포인트--></c:otherwise></c:choose></span></th>
                        <td colspan="4">
                            <input id="occrPointVal" name="occrPointVal" class="numberic ar" maxlength="10" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.reasonCd" /></span></th><!-- 사유 -->
                        <td colspan="4">
                            <textarea rows="3" cols="specialPointReason" id="specialPointReason" name="specialPointReason" class="form_textarea" data-json-obj="true" maxlength="333" ></textarea>
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>

       <%--  <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody id="tdrvInputForm">
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.pointCd" /></th><!-- 포인트 코드 -->
                        <td>
                            <input id="pointCd" name="pointCd" class="form_select" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.savePoint" /></th><!-- 적립 포인트 -->
                        <td>
                            <input type="text" id="point" name="point" class="numberic" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.regReason" /></th><!-- 적립 포인트 -->
                        <td>
                            <input type="text" id="" name="" class="form_textarea" maxlength="100" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.rejectReason" /></th><!-- 반려사유 -->
                        <td>
                            <!-- <input type="text" id="sexCd" name="sexCd" class="form_select" style="width:100%" data-json-obj="true"> -->
                            <input type="text" id="" name="" class="form_select" maxlength="100" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.applyUsr" /></th> <!-- 승인자 -->
                        <td>
                            <div id="custSearch" class="form_search">
                                <input id="custNm" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" /><!-- // 승인자조회 -->
                                <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 승인자조회 --></a>
                                <input type="hidden" id="custNo" name="custNo" >
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div> --%>
        <!-- 조회 조건 타이틀 종료 -->
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">


 var custTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var sexCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var custTpMap = [];
 var sexCdMap = [];

 <c:forEach var="obj" items="${custTpList}">
 custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${sexCdList}">
 sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

$(document).ready(function() {
    var membershipNo = "${membershipNo}";
    var cardNo = "${cardNo}";
    var cardTpCd = "${cardTpCd}";


    /*************************************************************
            드랍다운 리스트 셋팅
    *************************************************************/


    var pointCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    <c:choose>
        <c:when test="${specialPointTp eq '01'}">
            <c:set var="specialPointTp" value="+" />
        </c:when>
        <c:when test="${specialPointTp eq '02'}">
            <c:set var="specialPointTp" value="-" />
        </c:when>
    </c:choose>

    <c:forEach var="obj" items="${pointCdList}">

        <c:if test="${obj.remark2 eq 'SP' and obj.remark1 eq specialPointTp}">
            pointCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>

    </c:forEach>
    var pointCdListMap = dms.data.arrayToMap(pointCdList, function(obj){ return obj.cmmCd; });

    // 포인트코드 드랍다운 리스트.
    $("#pointCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:pointCdList
    });

    //$("#pointCd").data("kendoExtDropDownList").value("04");

    // 고객유형 드랍다운 리스트.
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
    });

    // 성별 드랍다운 리스트.
    $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:sexCdList
        , index:0
    });

    // 숫자
    /* $(".numberic").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });
 */
 // 양도신청 포인트
    $("#occrPointVal").kendoExtNumericTextBox({
        format:"n0"
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    var options = parent.specalPopupWindow.options.content.data;

    if (options.telNo != null && options.telNo != ""){
        $("#telNo").val(options.telNo);
    }

    // 신청 버튼.
    $("#btnRequest").kendoButton({
        click:function(e){

            var flag = true;
            var params = {};

            params["sSignDocId"] = "CRM-0001";

            $.ajax({
                url:"<c:url value='/cmm/apr/doc/selectDocLines.do' />"
              , data:JSON.stringify(params)
              , type:'POST'
              , dataType:'json'
              , async:false
              , contentType:'application/json'
              , error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
              , success:function(result) {
                    //정상적으로 반영 되었습니다.
                     if(result.total === 0){
                        dms.notification.info("<spring:message code='crm.info.plsCheckSIgnLine'/>");
                        flag = false;
                        return;
                    }
                }
            });

            if(!flag){
                return;
            }



            if(dms.string.isEmpty($("#occrPointVal").val())){
                //적립포인트는 필수 입력입니다.
                dms.notification.warning("<spring:message code='global.lbl.savePoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            if($("#occrPointVal").val() <= 0){
                //적립포인트는 필수 입력입니다.
                dms.notification.warning("<spring:message code='global.lbl.savePoint' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            if(dms.string.isEmpty($("#specialPointReason").val())){
                //특별포인트 사유는 필수 입력입니다.
                dms.notification.warning("<spring:message code='global.lbl.reasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            if ( dms.string.isEmpty($("#pointCd").data("kendoExtDropDownList").value()) ) {
                //포인트코드 는 필수 입력입니다.
                dms.notification.warning("<spring:message code='global.lbl.pointCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //form 데이터
            var param =
                $("#specialPointform").serializeObject(
                    $("#specialPointform").serializeArrayInSelector("[data-json-obj='true']")
                );

            param["membershipNo"] = membershipNo;
            param["cardNo"] = cardNo;
            param["cardTpCd"] = cardTpCd;
            param["signDocId"] = "CRM-0001";

            //console.log("param", param);
            //return;

            var url = "<c:url value='/crm/dmm/membership/insertSpecialPoint.do'/>";

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            }).done(function(result) {
                //console.log("btnCustSave Done!!!!");
                options.callbackFunc(result);
                parent.specalPopupWindow.close();
            });
        }
    });

});

 </script>


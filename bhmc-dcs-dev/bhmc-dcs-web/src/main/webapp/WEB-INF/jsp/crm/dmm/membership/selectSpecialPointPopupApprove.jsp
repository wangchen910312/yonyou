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
                <button id="btnRequestPrint" class="btn_m btn_Search"><spring:message code='global.title.reqFormPrint'/></button> <!-- 신청서 프린트 -->
                <button id="btnRequest" class="btn_m btn_Search"><spring:message code="global.btn.request" /></button> <!-- 신청 -->
                <button id="btnApproval" class="btn_m btn_Save"><spring:message code="global.btn.approval" /></button> <!-- 승인 -->
                <button id="btnAppRollback" class="btn_m btn_Save"><spring:message code="global.btn.appRollback" /></button> <!-- 반려 -->
                <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.close" /></button> --%> <!-- 닫기 -->
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
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
                        <th scope="row"><spring:message code="global.lbl.regReason" /></th><!-- 신청사유 -->
                        <td>
                            <!-- <input type="text" id="custTp" name="custTp" class="form_select" style="width:100%" data-json-obj="true"> -->
                            <input type="text" id="" name="" class="form_select" maxlength="100" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.savePoint" /></th><!-- 적립 포인트 -->
                        <td>
                            <input type="text" id="point" name="point" class="numberic" data-json-obj="true">
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
                                <!-- <input type="text" id="sCustNm" name="sCustNm" class="form_input" style="width:60%"  readonly /> -->
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 타이틀 종료 -->
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">


 var custTpList = [{"cmmCd":"", "cmmCdNm":""}];
 var sexCdList = [{"cmmCd":"", "cmmCdNm":""}];
 var custTpMap = [];
 var sexCdMap = [];

 <c:forEach var="obj" items="${custTpList}">
 custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${sexCdList}">
 sexCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

$(document).ready(function() {

    /*************************************************************
            드랍다운 리스트 셋팅
    *************************************************************/

    //1.그리드 만족도조사 유형 콤보  DataSource
    var pointCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${pointCdList}">
    pointCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var pointCdListMap = dms.data.arrayToMap(pointCdList, function(obj){ return obj.cmmCd; });

    // 포인트코드 드랍다운 리스트.
    $("#pointCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:pointCdList
        , index:0
    });

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
    $(".numberic").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });

    var options = parent.specalPopupWindow.options.content.data;

    if (options.telNo != null && options.telNo != ""){
        $("#telNo").val(options.telNo);
    }

    // 신청 버튼.
    $("#btnRequest").kendoButton({
        click:function(e){
            alert("신청 구현");
        }
    });

    // 승인 버튼.
    $("#btnApproval").kendoButton({
        click:function(e){
            alert("승인 구현");
        }
    });

    // 반려 버튼.
    $("#btnAppRollback").kendoButton({
        click:function(e){
            alert("반려 구현");
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.specalPopupWindow.close();
        }
    });

});

 </script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 수선시스템 - 차량정보 -->
<section  class="group">

    <!-- 차량정보 -->
    <div class="header_area">
        <h1 class="title_basic title_basic_v1"><spring:message code='ser.title.carInfo' /></h1><!-- 차량 상세정보 -->
    </div>


    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col>
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" colspan="2"><strong><spring:message code='sal.lbl.usedCarInfo' /></strong></th><!-- 중고차정보 -->
                    <th scope="col" colspan="2"><strong><spring:message code='sal.lbl.usedCarLicense' /></strong></th><!-- 중고차번호판 -->
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- 차량 VIN NO -->
                    <td>
                        <input id="vinNo" value="${topSelectionVO.vinNo}" type="text" class="form_input form_readonly" readonly/>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.perName' /></th><!-- 소유자명 -->
                    <td>
                        <input id="perName" value="${topSelectionVO.perName}" type="text" class="form_input form_readonly" readonly >
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dtlInfo' /></th><!-- 상세정보 -->
                    <td><span class="span_txt"><a onclick="javascript:goCarInfo();"><spring:message code='global.title.detail' /></a></span></td><!-- 상세 -->
                    <th scope="row"><spring:message code='sal.lbl.ownerType' /></th><!-- 소유자유형 -->
                    <td>
                        <input id="ownerType" value="${topSelectionVO.ownerType}" type="text" class="form_comboBox form_disabled" disabled>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.factory' /></th><!-- 제조사 -->
                    <td>
                        <input id="produceCompany" value="${topSelectionVO.produceCompany}" type="text" class="form_input form_readonly" readonly>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.idNo' /></th><!-- ID번호 -->
                    <td>
                        <input id="perPaperNo" value="${topSelectionVO.perPaperNo}" type="text" class="form_input form_readonly" readonly>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carBrand' /></th><!-- 차량브랜드 -->
                    <td>
                        <input id="brand" value="${topSelectionVO.brand}" type="text"  class="form_input form_readonly" readonly>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.idAddr' /></th><!-- ID주소 -->
                    <td>
                        <input id="perHu" value="${topSelectionVO.perHu}" type="text" class="form_input form_readonly" readonly>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.usedCarLicense' /></th><!-- 중고차번호판 -->
                    <td>
                        <input id="licenseNo" value="${topSelectionVO.licenseNo}" type="text" class="form_input form_readonly" readonly>
                    </td>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th><!-- 등록일자 -->
                    <td>
                        <input id="registDate" value="${topSelectionVO.registDate}" type="text" class="form_input form_readonly" readonly>
                    </td>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.vinOverlapYn' /></th><!-- VIN번호중복여부 -->
                    <td>
                        <input id="isVinRepear" value="${topSelectionVO.isVinRepear}" type="text" class="form_input form_readonly" readonly>
                    </td>
                    <td colspan="3"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //차량정보 -->


    <!-- 파일업로드 내역조회 영역 -->
    <%@include file="selectIncludeMain.jsp" %>
    <!-- 파일업로드 내역조회 영역종료 -->

</section>
<!-- //수선시스템 - 차량정보 -->

<!-- script -->
<script type="text/javascript">
var carId = "${carId}";
var id = "${id}";


//고객유형SAL041
var ownerTypeDs = [];
<c:forEach var="obj" items="${ownerTypeList}">
    ownerTypeDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//신청상태(인증정보상태) Map
var ownerTypeMap = dms.data.arrayToMap(ownerTypeDs, function(obj){ return obj.cmmCd; });


$(document).ready(function() {

    //소유자유형(고객유형)
    $("#ownerType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ownerTypeDs
        ,optionLabel:" "  // 전체
    });

    $("#ownerType").data("kendoExtDropDownList").enable(false);

});


function goCarInfo(){
    window.parent._createOrReloadTabMenu("<spring:message code = 'sal.title.usedCarMaster'/>"
            , "<c:url value='/sal/usc/topSelection/selectVehicleMasterMain.do?carId="+carId+"&id="+id+" '/>");
}

</script>
<!-- //script -->
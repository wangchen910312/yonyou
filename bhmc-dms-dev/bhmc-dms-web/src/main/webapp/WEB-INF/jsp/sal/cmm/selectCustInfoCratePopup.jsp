<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="ser.title.carInfo" /><!-- 차량정보 --></h2>
        <div class="btn_right">
            <button type="button" id="btnVerify" class="btn_s btnNew btn_s_min5"><spring:message code="ser.btn.verify" /></button>
            <%-- <button type="button" id="btnCarMasterNew" class="btn_s btnNew btn_s_min5"><spring:message code="global.btn.new" /></button> --%>
            <button type="button" id="btnCarUpdate" class="btn_s btnSave btn_s_min5"><spring:message code="global.btn.create" /></button>
            <button type="button" id="btnCarMasterCancel" class="btn_s btnSave btn_s_min5" style="display:none;"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>

    <form id="custInfoRegform" name="custInfoRegform" method="POST">
    <input type="hidden" id="carId" name="carId" data-json-obj="true">
    <input type="hidden" id="carOwnerCustTp" name="carOwnerCustTp" data-json-obj="true"/> <!-- 소유자고객구분 -->
    <input type="hidden" id="carOwnerCustCd" name="carOwnerCustCd" data-json-obj="true"/> <!-- 소유자고객형식 -->
    <input type="hidden" id="carOwnerPrefCommMthCd" name="carOwnerPrefCommMthCd" data-json-obj="true"/>
    <input type="hidden" id="carOwnerPrefCommNo" name="carOwnerPrefCommNo" data-json-obj="true"/>
    <input type="hidden" id="carOwnerOfficeTelNo" name="carOwnerOfficeTelNo" data-json-obj="true"/>
    <input type="hidden" id="carOwnerSeq" name="carOwnerSeq" data-json-obj="true"/>

    <input type="hidden" id="driverCustTp" name="driverCustTp" data-json-obj="true"/><!-- 운전자고객구분 -->
    <input type="hidden" id="driverCustCd" name="driverCustCd" data-json-obj="true"/><!-- 운전자고객형식 -->
    <input type="hidden" id="driverPrefCommMthCd" name="driverPrefCommMthCd" data-json-obj="true"/>
    <input type="hidden" id="driverPrefCommNo" name="driverPrefCommNo" data-json-obj="true"/>
    <input type="hidden" id="driverOfficeTelNo" name="driverOfficeTelNo" data-json-obj="true"/>
    <input type="hidden" id="driverSeq" name="driverSeq" data-json-obj="true"/>

    <input type="hidden" id="saveType" name="saveType" data-json-obj="true"/>
    <input type="hidden" id="driverSaveTp" name="driverSaveTp" data-json-obj="true"/>
    <input type="hidden" id="ncarDstinCd" name="ncarDstinCd" data-json-obj="true"/>

    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                    <td>
                        <input type="text" id="carRegNo" name="carRegNo" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.nowRunDist" /><!-- 사전점검주행거리 --></th>
                    <td>
                        <input id="carRunDistVal" name="carRunDistVal" class="form_numeric ar vin" data-type="number" min="0" maxlength="6" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.model" /><!-- 모델 --></th>
                    <td>
                        <input type="text" id="modelNm" name="modelNm" class="form_input vin" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.madeYyMm" /><!-- 제조년월 --></th>
                    <td>
                        <input id="manufactYyMmDt" name="manufactYyMmDt" class="form_datetimepicker vin" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.brandNm" /><!-- 브랜드명 --></th>
                    <td>
                        <input id="carBrandCd" name="carBrandCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.carDispQty" /><!-- 배기량 --></th>
                    <td>
                        <input id="carDispQty" name="carDispQty" class="form_numeric ar vin" data-type="number" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></th>
                    <td>
                        <input type="text" id="vinNo" name="vinNo" class="form_input vin" data-json-obj="true" maxlength="17" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                    <td>
                        <input type="text" id="carlineNm" name="carlineNm" class="form_input" data-name="<spring:message code="ser.lbl.carlineNm" />" required readonly/>
                        <input type="hidden" id="carlineCd" name="carlineCd" class="form_input"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.engnNo" /><!-- 엔진번호 --></th>
                    <td>
                        <input type="text" id="enginNo" name="enginNo" maxlength="15" class="form_input" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.incCmpNm" /><!-- 보험회사명 --></th>
                    <td>
                        <input type="text" id="incCorpCd" name="incCorpCd" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.wcEndDt" /><!-- 보증만료일 --></th>
                    <td>
                        <input id="grteEndDt" name="grteEndDt" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.saleOutDt" /><!-- 판매출고일자 --></th>
                    <td>
                        <input id="custSaleDt" name="custSaleDt" class="form_datepicker" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="ser.lbl.carOwnerInfo" /><!-- 소유자정보 --></h2>
        <%-- <div class="btn_right">
            <button type="button" id="btnOwnerNew" class="btn_s btnNew btn_s_min5"><spring:message code="global.btn.new" /></button>
            <button type="button" id="btnOwnerUpdate" class="btn_s btnSave btn_s_min5"><spring:message code="global.btn.create" /></button>
            <button type="button" id="btnOwnerSave" class="btn_s btnSave btn_s_min5" style="display:none;"><spring:message code="global.btn.create" /></button>
            <button type="button" id="btnOwnerCancel" class="btn_s btnCancel btn_s_min5" style="display:none;"><spring:message code="global.btn.cancel" /></button>
        </div> --%>
    </div>

    <div class="table_form form_width_100per">
        <table>
            <caption></caption>

            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carOwner" /><!-- 소유자 --></span></th>
                    <td class="ownerUseable">
                        <div class="form_search">
                            <input type="text" id="carOwnerNm" name="carOwnerNm" class="form_input carOwner" data-json-obj="true" >
                            <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true">
                            <a href="#;" id="ownerSearch" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                        </div>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.perPapaerNo" /><!-- 신분증번호 --></th>
                    <td class="ownerUseable">
                        <input id="carOwnerMathDocTp" name="carOwnerMathDocTp" class="form_comboBox" data-json-obj="true" style="width:120px">
                        <input type="text" id="carOwnerSsnCrnNo" name="carOwnerSsnCrnNo" class="form_input carOwner" data-json-obj="true" style="width:185px" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.hpNo" /><!-- 핸드폰번호 --></span></th>
                    <td class="ownerUseable">
                        <input type="text" id="carOwnerHpNo" name="carOwnerHpNo" class="form_input numberic carOwner" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화번호 --></th>
                    <td>
                        <input type="text" id="carOwnerTelNo" name="carOwnerTelNo" class="form_input numberic" data-json-obj="true"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.email" /><!-- 메일주소 --></th>
                    <td>
                        <input type="text" id="carOwnerMailNm" name="carOwnerMailNm" class="form_input" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.sex" /><!-- 성별 --></th>
                    <td>
                        <input id="carOwnerSexCd" name="carOwnerSexCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.zipCd" /><!-- 우편번호 --></th>
                    <td class="readonly_area">
                        <div class="form_search">
                            <input type="text" id="carOwnerZipCd" name="carOwnerZipCd" class="form_input" data-json-obj="true" readonly/>
                            <input type="hidden" id="carOwnerAddrSeq" name="carOwnerAddrSeq" data-json-obj="true">
                            <input type="hidden" id="carOwnerAddrTp" name="carOwnerAddrTp" data-json-obj="true">
                            <a href="#;" class="carOwnerZipCdSearch"></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.sungNm" /><!-- 성이름 --></th>
                    <td class="readonly_area">
                        <input type="text" id="carOwnerSungNm" name="carOwnerSungNm" class="form_input" data-json-obj="true" readonly/>
                        <input type="hidden" id="carOwnerSungCd" name="carOwnerSungCd" data-json-obj="true"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.cityNm" /><!-- 도시명 --></th>
                    <td class="readonly_area">
                        <input type="text" id="carOwnerCityNm" name="carOwnerCityNm" class="form_input" data-json-obj="true" readonly/>
                        <input type="hidden" id="carOwnerCityCd" name="carOwnerCityCd" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.distNm" /><!-- 지역 --></th>
                    <td class="readonly_area">
                        <input type="text" id="carOwnerDistNm" name="carOwnerDistNm" class="form_input" data-json-obj="true" readonly/>
                        <input type="hidden" id="carOwnerDistCd" name="carOwnerDistCd" data-json-obj="true"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.detlAddr" /><!-- 상세주소 --></th>
                    <td colspan="3">
                        <input type="text" id="carOwnerAddrDetlCont" name="carOwnerAddrDetlCont" class="form_input numberic" data-json-obj="true"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div style="display:none">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.lbl.visitorInfo" /><!-- 방문자정보 --></h2>
            <div class="btn_right">
                <button type="button" id="btnEqualCarOwner" class="btn_s btnNew btn_s_min5"><spring:message code="ser.btn.equalCarOwnerInfo" /></button>
            </div>
        </div>

        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.vsitr" /><!-- 방문자 --></th>
                        <td class="useable">
                            <div class="form_search">
                                <input type="text" id="driverNm" name="driverNm" class="form_input driver" data-json-obj="true">
                                <input type="hidden" id="driverId" name="driverId" data-json-obj="true">
                                <a href="#;" id="driverSearch" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.perPapaerNo" /><!-- 신분증번호 --></th>
                        <td class="useable">
                            <input id="driverMathDocTp" name="driverMathDocTp" class="form_comboBox" data-json-obj="true" style="width:120px">
                            <input type="text" id="driverSsnCrnNo" name="driverSsnCrnNo" class="form_input driver" data-json-obj="true" style="width:185px">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.hpNo" /><!-- 핸드폰번호 --></th>
                        <td class="useable">
                            <input type="text" id="driverHpNo" name="driverHpNo" class="form_input numberic driver" data-json-obj="true"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.tel" /><!-- 전화번호 --></th>
                        <td class="useable">
                            <input type="text" id="driverTelNo" name="driverTelNo" class="form_input numberic driver" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.email" /><!-- 메일주소 --></th>
                        <td class="useable">
                            <input type="text" id="driverMailNm" name="driverMailNm" class="form_input driver" data-json-obj="true"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.carOwnerRelCd" /><!-- 차량소유자관계 --></th>
                        <td>
                            <input id="carOwnerRelCd" name="carOwnerRelCd" class="form_comboBox driver" data-json-obj="true"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.zipCd" /><!-- 우편번호 --></th>
                        <td class="readonly_area">
                            <div class="form_search">
                                <input type="text" id="driverZipCd" name="driverZipCd" class="form_input" data-json-obj="true" readonly/>
                                <input type="hidden" id="driverAddrSeq" name="driverAddrSeq" data-json-obj="true">
                                <input type="hidden" id="driverAddrTp" name="driverAddrTp" data-json-obj="true">
                                <a href="#;" class="driverZipCdSearch"></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.sungNm" /><!-- 성이름 --></th>
                        <td class="readonly_area">
                            <input type="text" id="driverSungNm" name="driverSungNm" class="form_input" data-json-obj="true" readonly/>
                            <input type="hidden" id="driverSungCd" name="driverSungCd" data-json-obj="true"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.cityNm" /><!-- 도시명 --></th>
                        <td class="readonly_area">
                            <input type="text" id="driverCityNm" name="driverCityNm" class="form_input" data-json-obj="true" readonly/>
                            <input type="hidden" id="driverCityCd" name="driverCityCd" data-json-obj="true"/>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.distNm" /><!-- 지역 --></th>
                        <td class="readonly_area">
                            <input type="text" id="driverDistNm" name="driverDistNm" class="form_input" data-json-obj="true" readonly/>
                            <input type="hidden" id="driverDistCd" name="driverDistCd" data-json-obj="true"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.detlAddr" /><!-- 상세주소 --></th>
                        <td class="useable">
                            <input type="text" id="driverAddrDetlCont" name="driverAddrDetlCont" class="form_input driver" data-json-obj="true"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.sex" /><!-- 성별 --></th>
                        <td class="useable">
                            <input id="driverSexCd" name="driverSexCd" class="form_comboBox driver" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </form>
</section>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">

    var popupWindow;

    var mathDocTpList = [];
    var mathDocTpListC = [];

    <c:forEach var="obj" items="${mathDocTpList}">
        <c:if test="${obj.remark1 == 'P'}">
            mathDocTpList.push({"cmmCd" : "${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        </c:if>

        <c:if test="${obj.remark1 == 'C'}">
            mathDocTpListC.push({"cmmCd" : "${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        </c:if>
    </c:forEach>
    var mathDocTpMap = dms.data.arrayToMap(mathDocTpList, function(obj){return obj.cmmCd});

    /** 브랜드 코드 **/
    var brandCdList = [];
    <c:forEach var="obj" items="${brandCdDs}">
        brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd;});

    /** 소유자관계 코드 **/
    var ownerRelCdList = [];
    <c:forEach var="obj" items="${ownerRelCdDs}">
    ownerRelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var brandCdMap = dms.data.arrayToMap(ownerRelCdList, function(obj){return obj.cmmCd;});

    var sexCdList = [];
    <c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var sexCdMap = dms.data.arrayToMap(sexCdList, function(obj){return obj.cmmCd;});

    //증거유형
    getmathDocTpMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(mathDocTpMap[val] != undefined)
            returnVal = mathDocTpMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //브랜드 코드
    getBrandCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(brandCdMap[val] != undefined)
            returnVal = brandCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //성별유형
    sexCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(sexCdMap[val] != undefined)
            returnVal = sexCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    vinCustInfoSet = function(carId, vinNo){
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
            ,data:JSON.stringify({sCarId:carId, sVinNo:vinNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                    var data = result.data[0];

                    console.log("data vinCustInfoSet ::: ");
                    console.log(data);
                    $("#carId").val(dms.string.strNvl(data.carId));
                    $("#vinNo").val(dms.string.strNvl(data.vinNo));
                    $("#carRegNo").val(dms.string.strNvl(data.carRegNo));
                    $("#modelNm").val(dms.string.strNvl(data.ncarDstinCd == "O" ? data.temp1 : data.modelNm));
                    $("#carDispQty").data("kendoExtNumericTextBox").value(data.carDispQty);
                    $("#carBrandCd").data("kendoExtDropDownList").value(data.carBrandCd);
                    $("#ncarDstinCd").val(dms.string.strNvl(data.ncarDstinCd));
                    $("#carRunDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
                    $("#manufactYyMmDt").val(data.manufactYyMmDt);
                    $("#enginNo").val(dms.string.strNvl(data.enginNo));
                    $("#carlineCd").val(dms.string.strNvl(data.carlineCd));
                    $("#carlineNm").val(dms.string.strNvl(data.carlineNm));
                    $("#grteEndDt").data("kendoExtMaskedDatePicker").value(data.grteEndDt);
                    $("#custSaleDt").data("kendoExtMaskedDatePicker").value(data.custSaleDt);

                    $("#carOwnerId").val(dms.string.strNvl(data.carOwnerId));
                    $("#carOwnerNm").val(dms.string.strNvl(data.carOwnerNm));
                    $("#carOwnerHpNo").val(data.carOwnerHpNo);
                    $("#carOwnerTelNo").val(dms.string.strNvl(data.carOwnerTelNo));
                    $("#carOwnerZipCd").val(dms.string.strNvl(data.carOwnerZipCd));
                    $("#carOwnerMailNm").val(dms.string.strNvl(data.carOwnerMailNm));
                    $("#carOwnerSsnCrnNo").val(dms.string.strNvl(data.carOwnerSsnCrnNo));
                    $("#carOwnerCustTp").val(dms.string.strNvl(data.carOwnerCustTp));
                    $("#carOwnerCustCd").val(dms.string.strNvl(data.carOwnerCustCd));
                    $("#carOwnerPrefCommMthCd").val(dms.string.strNvl(data.carOwnerPrefCommMthCd));
                    $("#carOwnerPrefCommNo").val(dms.string.strNvl(data.carOwnerPrefCommNo));
                    $("#carOwnerOfficeTelNo").val(dms.string.strNvl(data.carOwnerOfficeTelNo));
                    $("#carOwnerMathDocTp").data("kendoExtDropDownList").value(data.carOwnerMathDocTp);
                    $("#carOwnerAddrSeq").val(dms.string.strNvl(data.carOwnerAddrSeq));
                    $("#carOwnerZipCd").val(dms.string.strNvl(data.carOwnerZipCd));
                    $("#carOwnerAddrTp").val(dms.string.strNvl(data.carOwnerAddrTp));
                    $("#carOwnerSungCd").val(dms.string.strNvl(data.carOwnerSungCd));
                    $("#carOwnerSungNm").val(dms.string.strNvl(data.carOwnerSungNm));
                    $("#carOwnerCityCd").val(dms.string.strNvl(data.carOwnerCityCd));
                    $("#carOwnerCityNm").val(dms.string.strNvl(data.carOwnerCityNm));
                    $("#carOwnerDistCd").val(dms.string.strNvl(data.carOwnerDistCd));
                    $("#carOwnerDistNm").val(dms.string.strNvl(data.carOwnerDistNm));
                    $("#carOwnerAddrDetlCont").val(dms.string.strNvl(data.carOwnerAddrDetlCont));
                    $("#carOwnerSeq").val(data.carOwnerSeq);
                    $("#carOwnerSexCd").val(dms.string.strNvl(sexCdGrid(data.carOwnerSexCd)));

                    $("#driverId").val(dms.string.strNvl(data.driverId));
                    $("#driverNm").val(dms.string.strNvl(data.driverNm));
                    $("#driverHpNo").val(dms.string.strNvl(data.driverHpNo));
                    $("#driverTelNo").val(dms.string.strNvl(data.driverTelNo));
                    $("#driverMailNm").val(dms.string.strNvl(data.driverMailNm));
                    $("#driverSsnCrnNo").val(dms.string.strNvl(data.driverSsnCrnNo));
                    $("#driverCustTp").val(dms.string.strNvl(data.driverCustTp));
                    $("#driverCustCd").val(dms.string.strNvl(data.driverCustCd));
                    $("#driverPrefCommMthCd").val(dms.string.strNvl(data.driverPrefCommMthCd));
                    $("#driverPrefCommNo").val(dms.string.strNvl(data.driverPrefCommNo));
                    $("#driverOfficeTelNo").val(dms.string.strNvl(data.driverOfficeTelNo));
                    $("#driverMathDocTp").data("kendoExtDropDownList").value(data.driverMathDocTp);
                    $("#driverAddrSeq").val(dms.string.strNvl(data.driverAddrSeq));
                    $("#driverZipCd").val(dms.string.strNvl(data.driverZipCd));
                    $("#driverAddrTp").val(dms.string.strNvl(data.driverAddrTp));
                    $("#driverSungCd").val(dms.string.strNvl(data.driverSungCd));
                    $("#driverSungNm").val(dms.string.strNvl(data.driverSungNm));
                    $("#driverCityCd").val(dms.string.strNvl(data.driverCityCd));
                    $("#driverCityNm").val(dms.string.strNvl(data.driverCityNm));
                    $("#driverDistCd").val(dms.string.strNvl(data.driverDistCd));
                    $("#driverDistNm").val(dms.string.strNvl(data.driverDistNm));
                    $("#driverAddrDetlCont").val(dms.string.strNvl(data.driverAddrDetlCont));
                    $("#driverSeq").val(data.driverSeq);
                    $("#driverSexCd").val(dms.string.strNvl(sexCdGrid(data.driverSexCd)));
                    $("#carOwnerRelCd").data("kendoExtDropDownList").value(data.carOwnerRelCd);
                }
            }
        });
    };

    $(document).ready(function() {

        // 출동주행거리
        $("#carRunDistVal, #carDispQty").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 소유자 증서유형
        $("#carOwnerMathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mathDocTpList
            ,optionLabel:" "
        });

        // 운전자 증서유형
        $("#driverMathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mathDocTpList
            ,optionLabel:" "
        });

        // 브랜드명
        $("#carBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,optionLabel:" "
        });

        // 차량소유자관계
        $("#carOwnerRelCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ownerRelCdList
            ,optionLabel:" "
            ,change:function(){
                $("#driverId").val("");
                $("#driverNm").val("");
                $("#driverCustTp").val("");
                $("#driverCustCd").val("");
                $("#driverMailNm").val("");
                $("#driverPrefCommMthCd").val("");
                $("#driverPrefCommNo").val("");
                $("#driverHpNo").val("");
                $("#driverTelNo").val("");
                $("#driverSsnCrnNo").val("");
                $("#driverOfficeTelNo").val("");
                $("#driverMathDocTp").data("kendoExtDropDownList").value("");
                $("#driverAddrSeq").val("");
                $("#driverZipCd").val("");
                $("#driverAddrTp").val("");
                $("#driverSungCd").val("");
                $("#driverSungNm").val("");
                $("#driverCityCd").val("");
                $("#driverCityNm").val("");
                $("#driverDistCd").val("");
                $("#driverDistNm").val("");
                $("#driverAddrDetlCont").val("");
                $("#driverSexCd").val("");

                $(".useable").removeClass("readonly_area");
                $(".driver").attr("readonly", false);

            }
        });

        // 차량소유자성별
        $("#carOwnerSexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:sexCdList
            ,optionLabel:" "
        });

        // 차량소유자성별
        $("#driverSexCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:sexCdList
            ,optionLabel:" "
        });

        // 제조년월
        $("#manufactYyMmDt").kendoExtMaskedDatePicker({
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 보증만료일자
        $("#grteEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 판매출고일자
        $("#custSaleDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.custInfoRegPopup.options.content.data;

         $("#carId").val(options.carId);

         if(dms.string.strNvl(options.carId) != ""){
             // 데이터 가져오기
             vinCustInfoSet(options.carId, options.vinNo);
         }


        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 검증 버튼.
        $("#btnVerify").kendoButton({
            click:function(e){
                var vinNo = dms.string.strNvl($("#vinNo").val());

                if(dms.string.isEmpty(vinNo)){
                    dms.notification.info("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />");
                    return false;
                } else if(vinNo.length != 17){
                    dms.notification.info("<spring:message code='ser.lnfo.chkVinNoLength' />");
                    return false;
                }

                $.ajax({
                    url:"<c:url value='/ser/cmm/vehOfCustInfo/selectDcsVehicleInfo.do' />"
                    ,data:JSON.stringify({sVinNo:$("#vinNo").val()})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                        if(dms.string.strNvl(result.data[0].carId) != ""){
                            $("#messageId").html("<spring:message code='ser.lbl.vinVerify' />");
                            conformKendoWindow.content( $(".msgDiv").html());
                            conformKendoWindow.open();
                            $(".yes, .no").click(function(){
                                if($(this).hasClass("yes")){
                                    $.ajax({
                                        url:"<c:url value='/ser/cmm/vehOfCustInfo/insertDcsVehicleInfo.do' />"
                                        ,data:JSON.stringify({sVinNo:$("#vinNo").val()})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,error:function(jqXHR, status, error){
                                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                        }
                                        ,success:function(result){
                                            vinCustInfoSet("", $("#vinNo").val());
                                            var data = {"vinNo":$("#vinNo").val()};
                                            options.callbackFunc(data);
                                            $("#btnCarMasterCancel").click();
                                        }
                                    });
                                    conformKendoWindow.close();
                                }
                                conformKendoWindow.close();
                            }).end();

                        }
                    }
                });
            }
        });

        $("#btnCarMasterCancel").kendoButton({
            click:function(e){
               $("#btnCarMasterCancel").hide();
               $("#btnCarUpdate").show();
            }
        });

        $("#btnEqualCarOwner").kendoButton({
            click:function(e){
                $("#driverId").val($("#carOwnerId").val());
                $("#driverNm").val($("#carOwnerNm").val());
                $("#driverCustTp").val($("#carOwnerCustTp").val());
                $("#driverCustCd").val($("#carOwnerCustCd").val());
                $("#driverMailNm").val($("#carOwnerMailNm").val());
                $("#driverPrefCommMthCd").val($("#carOwnerPrefCommMthCd").val());
                $("#driverPrefCommNo").val($("#carOwnerPrefCommNo").val());
                $("#driverHpNo").val($("#carOwnerHpNo").val());
                $("#driverTelNo").val($("#carOwnerTelNo").val());
                $("#driverSsnCrnNo").val($("#carOwnerSsnCrnNo").val());
                $("#driverOfficeTelNo").val($("#carOwnerOfficeTelNo").val());
                $("#driverMathDocTp").data("kendoExtDropDownList").value($("#carOwnerMathDocTp").data("kendoExtDropDownList").value());
                $("#driverAddrSeq").val($("#carOwnerAddrSeq").val());
                $("#driverZipCd").val($("#carOwnerZipCd").val());
                $("#driverAddrTp").val($("#carOwnerAddrTp").val());
                $("#driverSungCd").val($("#carOwnerSungCd").val());
                $("#driverSungNm").val($("#carOwnerSungNm").val());
                $("#driverCityCd").val($("#carOwnerCityCd").val());
                $("#driverCityNm").val($("#carOwnerCityNm").val());
                $("#driverDistCd").val($("#carOwnerDistCd").val());
                $("#driverDistNm").val($("#carOwnerDistNm").val());
                $("#driverAddrDetlCont").val($("#carOwnerAddrDetlCont").val());
                $("#driverSexCd").data("kendoExtDropDownList").value($("#carOwnerSexCd").val());
                $("#carOwnerRelCd").data("kendoExtDropDownList").value("01");

                $(".useable").addClass("readonly_area");
                $(".driver").attr("readonly", true);
            }
        });

        // 차량신규등록 버튼.
        $("#btnCarUpdate").kendoButton({
            click:function(e){
                $("#btnEqualCarOwner").click(); // 차량소유주와 동일

                if(dms.string.strNvl($("#carRegNo").val()) == "") {
                    dms.notification.info("<spring:message code='ser.lbl.carRegNo' var='carRegNo' /><spring:message code='global.info.emptyCheckParam' arguments='${carRegNo}' />");
                    return false;
                }
                if(dms.string.isNotEmpty($("#carOwnerNm").val())){
                    if(dms.string.isEmpty($("#carOwnerSsnCrnNo").val())){
                        dms.notification.info("<spring:message code='sal.lbl.perPapaerNo' var='perPapaerNo' /><spring:message code='global.info.emptyCheckParam' arguments='${perPapaerNo}' />");
                        return false;
                    }
                    if(dms.string.isEmpty($("#carOwnerHpNo").val())){
                        dms.notification.info("<spring:message code='ser.lbl.hpNo' var='hpNo' /><spring:message code='global.info.emptyCheckParam' arguments='${hpNo}' />");
                        return false;
                    }
                    if($("#carOwnerHpNo").val().length != 11){
                        dms.notification.info("<spring:message code='crm.info.hpno11DigitRequired'/>");
                        return false;
                    }
                }

                if(dms.string.isNotEmpty($("#driverNm").val())){
                    if(dms.string.isEmpty($("#driverHpNo").val())){
                        dms.notification.info("<spring:message code='ser.lbl.hpNo' var='hpNo' /><spring:message code='global.info.emptyCheckParam' arguments='${hpNo}' />");
                        return false;
                    }
                    if($("#driverHpNo").val().length != 11){
                        dms.notification.info("<spring:message code='crm.info.hpno11DigitRequired'/>");
                        return false;
                    }
                }

                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $("#custInfoRegform").serializeObject($("#custInfoRegform").serializeArrayInSelector("[data-json-obj='true']"));
                param.carBrandCd = $("#carBrandCd").data("kendoExtDropDownList").value();
                param.grteEndDt = $("#grteEndDt").data("kendoExtMaskedDatePicker").value();
                param.custSaleDt = $("#custSaleDt").data("kendoExtMaskedDatePicker").value();
                param.ncarDstinCd = dms.string.strNvl(param.ncarDstinCd) == "" ? "O" : $("#ncarDstinCd").val();
                param.carOwnerCustCd = dms.string.strNvl(param.ncarDstinCd) == "" ? "03" : "02";  //보유 : 02 , 타사 : 03
                param.carOwnerMathDocTp = $("#carOwnerMathDocTp").data("kendoExtDropDownList").value();
                param.carOwnerCustTp = dms.string.strNvl(param.carOwnerCustTp) == "" ? "01":param.carOwnerCustTp;
                param.carOwnerCustCd = dms.string.strNvl(param.carOwnerCustCd) == "" ? "01":param.carOwnerCustCd;
                param.carOwnerPrefCommMthCd = dms.string.strNvl(param.carOwnerPrefCommMthCd) == "" ? "01":param.carOwnerPrefCommMthCd;
                param.carOwnerPrefCommNo = dms.string.strNvl(param.carOwnerPrefCommNo) == "" ? param.carOwnerHpNo:param.carOwnerPrefCommNo;
                param.driverCustTp = dms.string.strNvl(param.driverCustTp) == "" ? "01":param.driverCustTp;
                param.driverCustCd = dms.string.strNvl(param.driverCustCd) == "" ? "01":param.driverCustCd;
                param.driverMathDocTp = $("#driverMathDocTp").data("kendoExtDropDownList").value();
                param.driverPrefCommMthCd = dms.string.strNvl(param.driverPrefCommMthCd) == "" ? "01":param.driverPrefCommMthCd;
                param.driverPrefCommNo = dms.string.strNvl(param.driverPrefCommNo) == "" ? param.driverHpNo:param.driverPrefCommNo;
                param.carOwnerRelCd = $("#carOwnerRelCd").data("kendoExtDropDownList").value();

                if(param.ncarDstinCd != "O"){
                    if(dms.string.isNotEmpty($("#enginNo").val())){
                        var enginNoSize = $("#enginNo").val().length;
                        if(enginNoSize < 12){
//                            dms.notification.info("<spring:message code='global.info.validation.min' />");
                            dms.notification.info("<spring:message code='ser.lbl.engnNo' var='engnNo' /><spring:message code='global.info.validation.min' arguments='${vinNo},${12}位' />");
                            return false;
                        }
                    }
                }

                $.ajax({
                    url:"<c:url value='/sal/cmm/multiVehOfCustInfo.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result){
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        //$("#carId").val(result);
                        //var data = {"vinNo":$("#vinNo").val(), "carId":$("#carId").val()};

                        // 소유자 custNo return
                        options.callbackFunc(result);
                        //vinCustInfoSet($("#carId").val(), $("#vinNo").val());
                    }
                });
            }
        });

        // 소유자주소
        $(".carOwnerZipCdSearch").click(function(){
            zipCdSearchPopup("owner");
        });

        // 방문자주소
        $(".driverZipCdSearch").click(function(){
            zipCdSearchPopup("driver");
        });

        custSearch = function(searchType) {

            if($(".useable").hasClass("readonly_area")){
                return false;
            }
            
            var custNm = "";
            if(typeof(searchType) != "undefined" && dms.string.isNotEmpty(searchType)){
                custNm = $("#"+searchType).val();
            }
            
            parent.openCustomerSearchPopup(custNm, function(data){
                if(searchType == "carOwnerNm"){
                    $("#carOwnerId").val(dms.string.strNvl(data[0].custNo));
                    $("#carOwnerNm").val(dms.string.strNvl(data[0].custNm));
                    $("#carOwnerCustTp").val(dms.string.strNvl(data[0].custTp));
                    $("#carOwnerCustCd").val(dms.string.strNvl(data[0].custCd));
                    $("#carOwnerMailNm").val(dms.string.strNvl(data[0].emailNm));
                    $("#carOwnerPrefCommMthCd").val(dms.string.strNvl(data[0].prefCommMthCd));
                    $("#carOwnerPrefCommNo").val(dms.string.strNvl(data[0].prefCommNo));
                    $("#carOwnerHpNo").val(data[0].hpNo);
                    $("#carOwnerTelNo").val(dms.string.strNvl(data[0].telNo));
                    $("#carOwnerSsnCrnNo").val(dms.string.strNvl(data[0].ssnCrnNo));
                    $("#carOwnerOfficeTelNo").val(dms.string.strNvl(data[0].officeTelNo));
                    $("#carOwnerMathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp);
                    $("#carOwnerAddrSeq").val(dms.string.strNvl(data[0].addrSeq));
                    $("#carOwnerZipCd").val(dms.string.strNvl(data[0].zipCd));
                    $("#carOwnerAddrTp").val(dms.string.strNvl(data[0].addrTp));
                    $("#carOwnerSungCd").val(dms.string.strNvl(data[0].sungCd));
                    $("#carOwnerSungNm").val(dms.string.strNvl(data[0].sungNm));
                    $("#carOwnerCityCd").val(dms.string.strNvl(data[0].cityCd));
                    $("#carOwnerCityNm").val(dms.string.strNvl(data[0].cityNm));
                    $("#carOwnerDistCd").val(dms.string.strNvl(data[0].distCd));
                    $("#carOwnerDistNm").val(dms.string.strNvl(data[0].distNm));
                    $("#carOwnerAddrDetlCont").val(dms.string.strNvl(data[0].addrDetlCont));
                    $("#carOwnerSexCd").val(dms.string.strNvl(sexCdGrid(data[0].sexCd)));
                } else {
                    $("#driverId").val(dms.string.strNvl(data[0].custNo));
                    $("#driverNm").val(dms.string.strNvl(data[0].custNm));
                    $("#driverCustTp").val(dms.string.strNvl(data[0].custTp));
                    $("#driverCustCd").val(dms.string.strNvl(data[0].custCd));
                    $("#driverMailNm").val(dms.string.strNvl(data[0].emailNm));
                    $("#driverPrefCommMthCd").val(dms.string.strNvl(data[0].prefCommMthCd));
                    $("#driverPrefCommNo").val(dms.string.strNvl(data[0].prefCommNo));
                    $("#driverHpNo").val(data[0].hpNo);
                    $("#driverTelNo").val(dms.string.strNvl(data[0].telNo));
                    $("#driverSsnCrnNo").val(dms.string.strNvl(data[0].ssnCrnNo));
                    $("#driverOfficeTelNo").val(dms.string.strNvl(data[0].officeTelNo));
                    $("#driverMathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp);
                    $("#driverAddrSeq").val(dms.string.strNvl(data[0].addrSeq));
                    $("#driverZipCd").val(dms.string.strNvl(data[0].zipCd));
                    $("#driverAddrTp").val(dms.string.strNvl(data[0].addrTp));
                    $("#driverSungCd").val(dms.string.strNvl(data[0].sungCd));
                    $("#driverSungNm").val(dms.string.strNvl(data[0].sungNm));
                    $("#driverCityCd").val(dms.string.strNvl(data[0].cityCd));
                    $("#driverCityNm").val(dms.string.strNvl(data[0].cityNm));
                    $("#driverDistCd").val(dms.string.strNvl(data[0].distCd));
                    $("#driverDistNm").val(dms.string.strNvl(data[0].distNm));
                    $("#driverAddrDetlCont").val(dms.string.strNvl(data[0].addrDetlCont));
                    $("#driverSexCd").val(dms.string.strNvl(sexCdGrid(data[0].sexCd)));
                }
            });
        };

        zipCdSearchPopup = function(saveType) {

            if($(".useable").hasClass("readonly_area")){
                return false;
            }

            parent.openzipCodeSearchPopup(function(data){
                if(saveType == "owner"){
                    //$("#carOwnerAddrSeq").val(dms.string.strNvl(data[0].seq));
                    $("#carOwnerZipCd").val(dms.string.strNvl(data[0].zipCd));
                    //$("#carOwnerAddrTp").val(dms.string.strNvl(data[0].addrTp));
                    $("#carOwnerSungCd").val(dms.string.strNvl(data[0].sungCd));
                    $("#carOwnerSungNm").val(dms.string.strNvl(data[0].sungNm));
                    $("#carOwnerCityCd").val(dms.string.strNvl(data[0].cityCd));
                    $("#carOwnerCityNm").val(dms.string.strNvl(data[0].cityNm));
                    $("#carOwnerDistCd").val(dms.string.strNvl(data[0].distCd));
                    $("#carOwnerDistNm").val(dms.string.strNvl(data[0].distNm));
                    $("#carOwnerAddrDetlCont").val(dms.string.strNvl(data[0].addrDetlCont));
                } else {
                    //$("#driverAddrSeq").val(dms.string.strNvl(data[0].seq));
                    $("#driverZipCd").val(dms.string.strNvl(data[0].zipCd));
                    //$("#driverAddrTp").val(dms.string.strNvl(data[0].addrTp));
                    $("#driverSungCd").val(dms.string.strNvl(data[0].sungCd));
                    $("#driverSungNm").val(dms.string.strNvl(data[0].sungNm));
                    $("#driverCityCd").val(dms.string.strNvl(data[0].cityCd));
                    $("#driverCityNm").val(dms.string.strNvl(data[0].cityNm));
                    $("#driverDistCd").val(dms.string.strNvl(data[0].distCd));
                    $("#driverDistNm").val(dms.string.strNvl(data[0].distNm));
                    $("#driverAddrDetlCont").val(dms.string.strNvl(data[0].addrDetlCont));
                }
            });
        };

        // 고객검색
        $("#ownerSearch").click(function(){
            custSearch("carOwnerNm");
        });

        // 고객검색
        $("#driverSearch").click(function(){
            custSearch("driverNm");
        });

        // 고객검색
        $("#carOwnerNm").keypress(function(e){
            if(e.keyCode === 13){
                e.preventDefault();
                custSearch("carOwnerNm");
            }
        });

        // 고객검색
        $("#driverNm").keypress(function(e){
            if(e.keyCode === 13){
                e.preventDefault();
                custSearch("driverNm");
            }
        });

    });

</script>

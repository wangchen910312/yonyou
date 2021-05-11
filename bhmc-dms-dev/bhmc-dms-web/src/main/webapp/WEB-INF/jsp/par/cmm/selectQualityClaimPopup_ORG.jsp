<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="tagFile.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="tagFile.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                    <a href="#" onclick="partFile.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="partFile.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                    <a href="#" onclick="packFile.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="packFile.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
    <!-- 부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- 조회 --></button>
                <button id="btnSend" class="btn_m btn_save"><spring:message code="par.btn.send" /><!-- 선택 --></button>
                <button id="btnDelete" class="btn_m btn_del"><spring:message code="par.btn.del" /><!-- 선택 --></button>
                <button id="btnClose" class="btn_m btn_save"><spring:message code="par.btn.close" /><!-- 닫기 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="claimForm">
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
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.purcOrdNo" /><!-- 오더번호 --></span></th>
                        <td>
                            <input id="orderNo" class="form_input" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.ordLine" /><!-- 오더라인 --></span></th>
                        <td>
                            <input id="orderLn" class="form_input" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></span></th>
                        <td>
                            <input id="partNo" class="form_input" data-mandatory="true" required />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.arrvDt" /><!-- 도착일자 --></span></th>
                        <td>
                            <input id="arrivalDate" data-type="maskDate" class="form_datepicker" data-mandatory="true" required/>
                            <input type="hidden" id="updtDt" class="form_input" />
                            <input type="hidden" id="claimCode" class="form_input" />
                            <input type="hidden" id="claimNo" class="form_input" />
                            <input type="hidden" id="isIndividualWrapped" class="form_input" />
                            <input type="hidden" id="isPackingSound" class="form_input" />
                            <input type="hidden" id="hasPartFragment" class="form_input" />
                            <input type="hidden" id="hasOuterWrapper" class="form_input" />
                            <input type="hidden" id="isOuterPackingSound" class="form_input" />
                            <input type="hidden" id="decideDateChar" class="form_input" />
                            <input type="hidden" id="dealDateChar" class="form_input" />
                            <input type="hidden" id="problemDateChar" class="form_input" />
                            <input type="hidden" id="arrivalDateChar" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.vin" /><!-- VIN번호 --></th>
                        <td>
                            <input id="vin" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.enginNo" /><!-- 엔진번호 --></th>
                        <td>
                            <input id="engineCylinder" class="form_input"/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.claimQty" /><!-- 클레임수량 --></span></th>
                        <td>
                            <input id="claimNum" data-type="number" class="form_numeric" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.problemDate" /><!-- 문제발견일자 --></span></th>
                        <td>
                            <input id="problemDate" data-type="maskDate" class="form_datepicker" data-mandatory="true" required />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.model" /><!-- 차형 --></span></th>
                        <td>
                            <input id="carModel" data-type="combo" class="form_comboBox" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.claimType" /><!-- 클레임유형 --></span></th>
                        <td>
                            <input id="claimType" data-type="combo" class="form_comboBox" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dealerClaimWay" /><!-- 클레임방식 --></span></th>
                        <td>
                            <input id="dealerClaimWay" data-type="combo" class="form_comboBox" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.prcStrgeCd" /><!-- 발송창고 --></span></th>
                        <td>
                            <input id="prcCode" data-type="combo" class="form_comboBox" data-mandatory="true" required/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlTp" /><!-- 배송방식 --></span></th>
                        <td>
                            <input id="deliveryType" data-type="combo" class="form_comboBox" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.transportNo" /><!-- 화물운송번호 --></th>
                        <td>
                            <input id="transportNo" class="form_input"/>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.deliveryRemark" /><!-- 운송비고 --></th>
                        <td colspan="5">
                            <input id="deliveryRemark" class="form_input"/>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr rowspan="2">
                        <th scope="row"><spring:message code="par.lbl.description" /><!-- 세부내용 --></th>
                        <td colspan="5">
                            <input id="description" class="form_input"/>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.tagFile" /><!-- 첨부(태그) --></th>
                        <td colspan="5">
                            <input id="tagFileName" name="tagFileName" class="form_file" />
                            <input type="hidden" id="tagFileUrl" name="tagFileUrl" data-json-obj="true" />
                        </td>
                        <td><span class="btn_file" id="tagFileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.partFile" /><!-- 첨부(부품) --></th>
                        <td colspan="5">
                            <input id="partFileName" name="partFileName" class="form_file" />
                            <input type="hidden" id="partFileUrl" name="partFileUrl" data-json-obj="true" />
                        </td>
                        <td><span class="btn_file" id="partFileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.packFile" /><!-- 첨부(포장) --></th>
                        <td colspan="5">
                            <input id="packFileName" name="packFileName" class="form_file" />
                            <input type="hidden" id="packFileUrl" name="packFileUrl" data-json-obj="true" />
                        </td>
                        <td><span class="btn_file" id="packFileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.claimants" /><!-- 부품경리 --></th>
                        <td>
                            <input id="claimants" class="form_input"/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.claimPerson" /><!-- 클레임신고인 --></span></th>
                        <td>
                            <input id="claimPerson" class="form_input" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.claimTelephone" /><!-- 신고인연락처 --></span></th>
                        <td>
                            <input id="telephone" class="form_input" data-mandatory="true" required/>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

 /************************************************************
 팝업옵션 설정
*************************************************************/
/**
* 팝업 옵션
*/
var options = parent.qualityClaimPopupWindow.options.content.data,
    carModelList          = [],
    claimTypeList         = [],
    dealerClaimWayList    = [],
    prcCodeList           = [],
    deliveryTypeList      = [],
    toDt                  = "${toDt}";



    carModelList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${carModelList}" varStatus="status">
    carModelList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    claimTypeList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${claimTypeList}" varStatus="status">
    claimTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    dealerClaimWayList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${dealerClaimWayList}" varStatus="status">
    dealerClaimWayList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    prcCodeList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${prcCodeList}" varStatus="status">
    prcCodeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    deliveryTypeList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${deliveryTypeList}" varStatus="status">
    deliveryTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {

        $("#claimNum").kendoExtNumericTextBox({
            format:"n0"
           ,spinners: false
        });

        //차형
        $("#carModel").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource : carModelList
            ,index : 0
        });

        //클레임유형
        $("#claimType").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource : claimTypeList
            ,index : 0
        });

        //클레임방식
        $("#dealerClaimWay").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource : dealerClaimWayList
            ,index : 0
        });

        //발송창고
        $("#prcCode").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource : prcCodeList
            ,index : 0
        });

        //배송방식
        $("#deliveryType").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource : deliveryTypeList
            ,index : 0
        });


        $("#arrivalDate").kendoExtMaskedDatePicker({
            format: "<dms:configValue code='dateFormat' />"
            ,dateValidMessage : "<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#problemDate").kendoExtMaskedDatePicker({
            format: "<dms:configValue code='dateFormat' />"
            ,dateValidMessage : "<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/


        // 저장 버튼
        $("#btnSave").kendoButton({
            click: function(e){

                var saveData = '';

                if(!checkValidation()){
                    return false;
                }

                //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
                //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
                //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];

                saveData = JSON.stringify(partsJs.validate.formJs.Hash);

                $.ajax({
                    url : "<c:url value='/par/pcm/claim/updateQualityClaim.do' />"
                  , type : "POST"
                  , data : saveData
                  , dataType : "json"
                  , contentType : 'application/json'
                  , async : false
                  , success : function(result) {

                      if (result.resultYn === true) {
                          dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.regSuccessParam' arguments='${claim}'/>");
                          $("#claimNo").val(result.claimNo);

                          $.ajax({
                              url : "<c:url value='/par/pcm/claim/selectQualityClaimByKey.do' />",
                              data: JSON.stringify({ sClaimNo : $("#claimNo").val()}),
                              type: "POST",
                              dataType : "json",
                              contentType : "application/json",
                              error : function(jqXHR,status,error) {
                                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                              }

                          }).done(function(result) {

                              //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
                              if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                                  return false;
                              }

                              partsJs.validate.groupObjAllDataSet(result);

                              if(!dms.string.isEmpty(result.claimCode)){
                                  $("#btnDelete").data("kendoButton").enable(true);
                              }else{
                                  $("#btnDelete").data("kendoButton").enable(false);
                              }

                              $("#btnSend").data("kendoButton").enable(true);

                          });
                      } else {
                          if(result === 0){
                              dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                          }
                          // 에러 메시지 확인.
                      }
                  }
                  , error : function(jqXHR,status,error) {
                      dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                  }
              });

            }
        });

        // 전송 버튼
        $("#btnSend").kendoButton({
            click: function(e){

                var urlParam,
                    qualityClaimVO;

                if(dms.string.isEmpty($("#isIndividualWrapped").val())){
                    $("#isIndividualWrapped").val(0);
                }
                if(dms.string.isEmpty($("#isPackingSound").val())){
                    $("#isPackingSound").val(0);
                }
                if(dms.string.isEmpty($("#hasPartFragment").val())){
                    $("#hasPartFragment").val(0);
                }
                if(dms.string.isEmpty($("#hasOuterWrapper").val())){
                    $("#hasOuterWrapper").val(0);
                }
                if(dms.string.isEmpty($("#isOuterPackingSound").val())){
                    $("#isOuterPackingSound").val(0);
                }

                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];


                if(dms.string.isEmpty($("#claimNo").val())){
                    //클레임번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#claimCode").val())){
                    if(dms.string.isEmpty($("#orderNo").val())){
                        //오더번호가 없습니다.
                        dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.required.field' arguments='${purcOrdNo}'/>");
                        return false;
                    }

                    if(dms.string.isEmpty($("#orderLn").val())){
                        //오더라인번호가 없습니다.
                        dms.notification.warning("<spring:message code='par.lbl.purcOrdLineNo' var='purcOrdLineNo' /><spring:message code='global.info.required.field' arguments='${purcOrdLineNo}'/>");
                        return false;
                    }

                    if(dms.string.isEmpty($("#partNo").val())){
                        //부품번호가 없습니다.
                        dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.required.field' arguments='${itemCd}'/>");
                        return false;
                    }

                    urlParam = "<c:url value='/par/pcm/claim/sendCreateQualityClaim.do' />";
                }else{
                    urlParam = "<c:url value='/par/pcm/claim/sendUpdateQualityClaim.do' />"
                }


                if(dms.string.isEmpty($("#arrivalDate").data("kendoExtMaskedDatePicker").value())){
                    //도착일자는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.required.field' arguments='${arrvDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#arrivalDateChar").val())){
                    //도착일자는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.required.field' arguments='${arrvDt}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#claimNum").data("kendoExtNumericTextBox").value())){
                    //클레임수량 정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimQty' var='claimQty' /><spring:message code='global.info.required.field' arguments='${claimQty}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#problemDate").data("kendoExtMaskedDatePicker").value())){
                    //문제발견일자는 필수 입력 사항입니다.
                      dms.notification.warning("<spring:message code='par.lbl.problemDate' var='problemDate' /><spring:message code='global.info.required.field' arguments='${problemDate}'/>");
                      return false;
                  }

                if(dms.string.isEmpty($("#problemDateChar").val())){
                  //문제발견일자는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.problemDate' var='problemDate' /><spring:message code='global.info.required.field' arguments='${problemDate}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#carModel").data("kendoExtDropDownList").value())){
                    //차형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.model' var='model' /><spring:message code='global.info.required.field' arguments='${model}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#claimType").data("kendoExtDropDownList").value())){
                    //클레임 유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimType' var='claimType' /><spring:message code='global.info.required.field' arguments='${claimType}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#dealerClaimWay").data("kendoExtDropDownList").value())){
                    //클레임 방식은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.dealerClaimWay' var='dealerClaimWay' /><spring:message code='global.info.required.field' arguments='${dealerClaimWay}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#prcCode").data("kendoExtDropDownList").value())){
                    //발송창고는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.prcStrgeCd' var='prcStrgeCd' /><spring:message code='global.info.required.field' arguments='${prcStrgeCd}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#deliveryType").data("kendoExtDropDownList").value())){
                    //배송방식은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.dlTp' var='dlTp' /><spring:message code='global.info.required.field' arguments='${dlTp}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#claimPerson").val())){
                    //클레임신고인정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimPerson' var='claimPerson' /><spring:message code='global.info.required.field' arguments='${claimPerson}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#telephone").val())){
                    //신고인 연락처 정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimTelephone' var='claimTelephone' /><spring:message code='global.info.required.field' arguments='${claimTelephone}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#description").val())){
                    //상세설명 정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.description' var='describe' /><spring:message code='global.info.required.field' arguments='${describe}'/>");
                    return false;
                }
                qualityClaimVO = partsJs.validate.formJs.Hash;


                $.ajax({
                    url : "<c:url value='/par/pcm/claim/updateQualityClaim.do' />"
                  , type : "POST"
                  , data : kendo.stringify(qualityClaimVO)
                  , dataType : "json"
                  , contentType : 'application/json'
                  , async : false
                  , success : function(result) {

                      if (result.resultYn === true) {
                          $.ajax({
                              url : urlParam//"<c:url value='/par/pcm/claim/sendQuelityClaim.do' />"
                             ,data: kendo.stringify(qualityClaimVO)
                             ,type: 'POST'
                             ,dataType : 'json'
                             ,contentType : 'application/json'
                             ,async : false
                             ,success : function(result) {
                                 if (result === 1) {

                                     //전송 완료 되었습니다.
                                     dms.notification.success("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.sendSuccessParam' arguments='${claimNo}'/>");

                                 } else {
                                     if(result === 0){
                                         //전송 실패하였습니다.
                                         dms.notification.error("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.err.sendFailedParam' arguments='${claimNo}'/>");
                                     }
                                 }
                             }
                             ,error : function(jqXHR,status,error) {
                                 dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                             }
                         });
                      } else {
                          if(result === 0){
                              dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                          }
                          // 에러 메시지 확인.
                      }
                  }
                  , error : function(jqXHR,status,error) {
                      dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                  }
              });
            }
        });

        // 삭제 버튼
        $("#btnDelete").kendoButton({
            click: function(e){

                var urlParam,
                    qualityClaimVO;

                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];


                if(dms.string.isEmpty($("#claimCode").val())){
                    //클레임번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                    return false;
                }

                qualityClaimVO = partsJs.validate.formJs.Hash;


                $.ajax({
                    url : "<c:url value='/par/pcm/claim/sendDeleteQuelityClaim.do' />"
                   ,data: kendo.stringify(qualityClaimVO)
                   ,type: 'POST'
                   ,dataType : 'json'
                   ,contentType : 'application/json'
                   ,async : false
                   ,success : function(result) {

                       if (result === 1) {

                           //전송 완료 되었습니다.
                           dms.notification.success("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.sendSuccessParam' arguments='${claimNo}'/>");

                       } else {
                           if(result === 0){
                               //전송 실패하였습니다.
                               dms.notification.error("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.err.sendFailedParam' arguments='${claimNo}'/>");
                           }
                       }
                   }
                   ,error : function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });
            }
        });

        // 닫기 버튼
        $("#btnClose").kendoButton({
            click: function(e){
                options.callbackFunc();
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        $("#claimNo").val(options.claimNo);
        // 조회조건 설정

        if(!dms.string.isEmpty($("#claimNo").val())){
            $.ajax({
                url : "<c:url value='/par/pcm/claim/selectQualityClaimByKey.do' />",
                data: JSON.stringify({ sClaimNo : $("#claimNo").val()}),
                type: "POST",
                dataType : "json",
                contentType : "application/json",
                error : function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);

                if(!dms.string.isEmpty(result.claimCode)){
                    $("#btnDelete").data("kendoButton").enable(true);
                }else{
                    $("#btnDelete").data("kendoButton").enable(false);
                }

                $("#btnSend").data("kendoButton").enable(true);

            });
        }else{
            $("#btnDelete").data("kendoButton").enable(false);
            $("#btnSend").data("kendoButton").enable(false);
        }

        if(dms.string.isEmpty($("#updtDt").val())){
            $("#btnSend").data("kendoButton").enable(false);
        }

    });

    /* *************************************************************************
     **************************태그파일업로드********************************************
     ***************************************************************************/
     //================================
     var tagFile = new Resumable({
         target : "<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize : 1 * 1024 * 1024
         ,simultaneousUploads : 4
         ,testChunks : true
         ,throttleProgressCallbacks : 1
         ,method : "octet"
     });
     tagFile.assignBrowse($('#tagFileSelect')[0]);

     //파일추가 이벤트
     tagFile.on('fileAdded', function(file) {

         $("#progressWindow").kendoWindow({
             width : "600px"
             ,height : "300px"
             ,title : "<spring:message code='global.lbl.fileSend'/>"     // 파일전송
             ,animation: false
             ,draggable : false
             ,visible : false
             ,resizable : false
             ,modal : true
         }).data("kendoWindow").center().open();


         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();

         //파일목록 출력
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         tagFile.upload();

     });
     tagFile.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     tagFile.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#tagFileUrl").val())) {
             $.ajax({
                 url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType : "json",
                 type : "get",
                 async : false,
                 cache : false,
                 success : function(id) {
                     _that.opt["query"]["resumableSessionId"] = id;
                     $("#tagFileUrl").val(id);
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#tagFileUrl").val();
         }


         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     tagFile.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();


         $("#progressWindow").data("kendoWindow").close();
         tagFile.files = [];
         $(".resumable-list").html("");
     });
     tagFile.on('fileSuccess', function(file, message) {

         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#tagFileName").val(result.fileNm);
             /*
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo : result.fileDocNo
                 ,fileNo : result.fileNo
                 ,fileNm : result.fileNm
                 ,fileSize : dms.string.formatFileSize(result.fileSize)
             });
             */
             //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
         }


     });
     tagFile.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded: ' + message + ')');
     });
     tagFile.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width : Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width : Math.min(Math.floor(tagFile.progress() * 100), 100)+ '%'});
     });
     /* *************************************************************************
     **************************태그파일업로드****************************************
     ***************************************************************************/

     /* *************************************************************************
     **************************부품파일업로드****************************************
     ***************************************************************************/
     var partFile = new Resumable({
         target : "<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize : 1 * 1024 * 1024
         ,simultaneousUploads : 4
         ,testChunks : true
         ,throttleProgressCallbacks : 1
         ,method : "octet"
     });
     partFile.assignBrowse($('#partFileSelect')[0]);

     //파일추가 이벤트
     partFile.on('fileAdded', function(file) {

         $("#progressWindow").kendoWindow({
             width : "600px"
             ,height : "300px"
             ,title : "<spring:message code='global.lbl.fileSend'/>"     // 파일전송
             ,animation: false
             ,draggable : false
             ,visible : false
             ,resizable : false
             ,modal : true
         }).data("kendoWindow").center().open();


         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();

         //파일목록 출력
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         partFile.upload();

     });
     partFile.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     partFile.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#partFileUrl").val())) {
             $.ajax({
                 url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType : "json",
                 type : "get",
                 async : false,
                 cache : false,
                 success : function(id) {
                     _that.opt["query"]["resumableSessionId"] = id;
                     $("#partFileUrl").val(id);
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#partFileUrl").val();
         }


         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     partFile.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();


         $("#progressWindow").data("kendoWindow").close();
         partFile.files = [];
         $(".resumable-list").html("");
     });
     partFile.on('fileSuccess', function(file, message) {

         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#partFileName").val(result.fileNm);
             /*
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo : result.fileDocNo
                 ,fileNo : result.fileNo
                 ,fileNm : result.fileNm
                 ,fileSize : dms.string.formatFileSize(result.fileSize)
             });
             */
             //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
         }


     });
     partFile.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded: ' + message + ')');
     });
     partFile.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width : Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width : Math.min(Math.floor(partFile.progress() * 100), 100)+ '%'});
     });
     /* *************************************************************************
     **************************부품파일업로드****************************************
     ***************************************************************************/

     /* *************************************************************************
     **************************팩파일업로드****************************************
     ***************************************************************************/
     var packFile = new Resumable({
         target : "<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize : 1 * 1024 * 1024
         ,simultaneousUploads : 4
         ,testChunks : true
         ,throttleProgressCallbacks : 1
         ,method : "octet"
     });
     packFile.assignBrowse($('#packFileSelect')[0]);

     //파일추가 이벤트
     packFile.on('fileAdded', function(file) {

         $("#progressWindow").kendoWindow({
             width : "600px"
             ,height : "300px"
             ,title : "<spring:message code='global.lbl.fileSend'/>"     // 파일전송
             ,animation: false
             ,draggable : false
             ,visible : false
             ,resizable : false
             ,modal : true
         }).data("kendoWindow").center().open();


         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();

         //파일목록 출력
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         packFile.upload();

     });
     packFile.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     packFile.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#packFileUrl").val())) {
             $.ajax({
                 url : "<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType : "json",
                 type : "get",
                 async : false,
                 cache : false,
                 success : function(id) {
                     _that.opt["query"]["resumableSessionId"] = id;
                     $("#packFileUrl").val(id);
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#packFileUrl").val();
         }


         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     packFile.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

         $("#progressWindow").data("kendoWindow").close();
         packFile.files = [];
         $(".resumable-list").html("");
     });
     packFile.on('fileSuccess', function(file, message) {

         var result = JSON.parse(message);
         if(result.status === "finished") {
             $("#packFileName").val(result.fileNm);
             /*
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo : result.fileDocNo
                 ,fileNo : result.fileNo
                 ,fileNm : result.fileNm
                 ,fileSize : dms.string.formatFileSize(result.fileSize)
             });
             */
             //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
         }


     });
     packFile.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded: ' + message + ')');
     });
     packFile.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width : Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width : Math.min(Math.floor(packFile.progress() * 100), 100)+ '%'});
     });
     /* *************************************************************************
     **************************팩파일업로드****************************************
     ***************************************************************************/

     function checkValidation(){
         if(dms.string.isEmpty($("#orderNo").val())){
             //오더번호정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.required.field' arguments='${purcOrdNo}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#orderLn").val())){
             //오더라인정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.ordLine' var='ordLine' /><spring:message code='global.info.required.field' arguments='${ordLine}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#partNo").val())){
             //부품번호정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.required.field' arguments='${itemCd}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#claimPerson").val())){
             //클레임신고인정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.claimPerson' var='claimPerson' /><spring:message code='global.info.required.field' arguments='${claimPerson}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#telephone").val())){
             //신고인 연락처 정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.claimTelephone' var='claimTelephone' /><spring:message code='global.info.required.field' arguments='${claimTelephone}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#claimNum").data("kendoExtNumericTextBox").value())){
             //클레임수량 정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.claimQty' var='claimQty' /><spring:message code='global.info.required.field' arguments='${claimQty}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#carModel").data("kendoExtDropDownList").value())){
             //차형은 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.model' var='model' /><spring:message code='global.info.required.field' arguments='${model}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#claimType").data("kendoExtDropDownList").value())){
             //클레임 유형은 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.claimType' var='claimType' /><spring:message code='global.info.required.field' arguments='${claimType}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#dealerClaimWay").data("kendoExtDropDownList").value())){
             //클레임 방식은 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.dealerClaimWay' var='dealerClaimWay' /><spring:message code='global.info.required.field' arguments='${dealerClaimWay}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#prcCode").data("kendoExtDropDownList").value())){
             //발송창고는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.prcStrgeCd' var='prcStrgeCd' /><spring:message code='global.info.required.field' arguments='${prcStrgeCd}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#deliveryType").data("kendoExtDropDownList").value())){
             //배송방식은 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.dlTp' var='dlTp' /><spring:message code='global.info.required.field' arguments='${dlTp}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#arrivalDate").data("kendoExtMaskedDatePicker").value())){
           //도착일자는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.required.field' arguments='${arrvDt}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#problemDate").data("kendoExtMaskedDatePicker").value())){
           //문제발견일자는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.problemDate' var='problemDate' /><spring:message code='global.info.required.field' arguments='${problemDate}'/>");
             return false;
         }

         return true;
     }

 </script>


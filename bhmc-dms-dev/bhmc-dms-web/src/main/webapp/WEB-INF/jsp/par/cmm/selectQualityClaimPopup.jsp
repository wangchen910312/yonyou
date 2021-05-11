<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- 저장 --></button>
                <button id="btnSend" class="btn_m btn_save"><spring:message code="par.btn.send" /><!-- 발송 --></button>
                <button id="btnDelete" class="btn_m btn_del"><spring:message code="par.btn.del" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="claimForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                    <col style="width:12%;">
                    <col style="width:13%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.purcOrdNo" /><!-- 오더번호 --></span></th>
                        <td>
                            <div class="form_search">
                                <input id="orderNo" class="form_input" data-mandatory="true" required/>
                                <a id="searchOrderNo"></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.ordLine" /><!-- 오더라인 --></span></th>
                        <td>
                            <input id="orderLn" class="form_input" data-mandatory="true" required/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></span></th>
                        <td>
                            <div class="form_search">
                                <input id="partNo" class="form_input" data-mandatory="true" required />
                                <a id="searchPartNo"></a>
                            </div>
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
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.description" /><!-- 세부내용 --></th>
                        <td colspan="5">
                            <input id="description" class="form_input"/>
                        </td>
                        <th scope="row"></th>
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
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.tagFile" /><!-- 첨부(태그) --></th>
                        <td colspan="2">
                            <input id="tagFileNm" class="form_input form_readonly" readonly="readonly" />
                        </td>
                        <td colspan="5">
                            <input type="file" id="tagFiles" name="tagFiles[]" class="form_file" />
                            <input type="hidden" id="tagFileUrl" name="tagFileUrl" />
                            <input type="hidden" id="tagFileDataCont" name="tagFileDataCont" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td colspan="3">
                            <img id="fileViewTag" name="imgFile" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.partFile" /><!-- 첨부(부품) --></th>
                        <td colspan="2">
                            <input id="partFileNm" class="form_input form_readonly" readonly="readonly" />
                        </td>
                        <td colspan="5">
                            <input type="file" id="partFiles" name="partFiles[]" class="form_file" />
                            <input type="hidden" id="partFileUrl" name="partFileUrl"/>
                            <input type="hidden" id="parFileDataCont" name="parFileDataCont" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td colspan="3">
                            <img id="fileViewPart" name="imgFile" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.packFile" /><!-- 첨부(포장) --></th>
                        <td colspan="2">
                            <input id="packFileNm" class="form_input form_readonly" readonly="readonly" />
                        </td>
                        <td colspan="5">
                            <input type="file" id="packFiles" name="packFiles[]" class="form_file" />
                            <input type="hidden" id="packFileUrl" name="packFileUrl"/>
                            <input type="hidden" id="packFileDataCont" name="packFileDataCont" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td colspan="3">
                            <img id="fileViewPack" name="imgFile" />
                        </td>
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

    var purcOrdListAndItemPopupWindow;
    function purcOrderStatusSearchPopup() {

        var left = 70,
        top = 30;

        //left = $("#orderNo").offset().left;
        x = left;
        //top = $("#orderNo").offset().top;
        y = top;

        purcOrdListAndItemPopupWindow = dms.window.popup({
            windowId:"purcOrdListAndItemPopupWindow"
            ,title:""
            ,width:700
            ,height:320
            ,content:{
                url:"<c:url value='/par/cmm/selectPurcOrdListAndItemPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"purcOrdNo":$("#orderNo").val()
                    ,"itemCd":$("#partNo").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            //$("#orderNo").val(data[0].purcOrdNo);
                            $("#orderNo").val(data[0].bmpOrdNo);
                            $("#orderLn").val(data[0].purcOrdLineNo);
                            $("#partNo").val(data[0].itemCd);
                        }
                        purcOrdListAndItemPopupWindow.close();
                    }
                }
            }
            /* ,position:{
                top : x
                ,left : y
            } */
        });

        $("#purcOrdListAndItemPopupWindow").closest(".k-window").css({
           top:x
           ,left:y
        });
    }

    $(document).ready(function() {

        //purcOrderStatus search popup
        $("#searchOrderNo").on('click', purcOrderStatusSearchPopup);
        $("#searchPartNo").on('click', purcOrderStatusSearchPopup);

        $("#claimNum").kendoExtNumericTextBox({
            format: "n0"
            ,decimals:0
            ,restrictDecimals: true
            ,min:0
            ,spinners:false
        });

        //차형
        $("#carModel").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carModelList
            ,index:0
        });

        //클레임유형
        $("#claimType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:claimTypeList
            ,index:0
        });

        //클레임방식
        $("#dealerClaimWay").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dealerClaimWayList
            ,index:0
        });

        //발송창고
        $("#prcCode").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:prcCodeList
            ,index:0
        });

        //배송방식
        $("#deliveryType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:deliveryTypeList
            ,index:0
        });


        $("#arrivalDate").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#problemDate").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        $("#tagFiles").on('change',  handleTagFileSelect);
        $("#partFiles").on('change', handlePartFileSelect);
        $("#packFiles").on('change', handlePackFileSelect);


        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveData = '';

                if(!checkValidation()){
                    return false;
                }

                //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
                //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];
                delete partsJs.validate.formJs.Hash['tagFiles'];
                delete partsJs.validate.formJs.Hash['partFiles'];
                delete partsJs.validate.formJs.Hash['packFiles'];
                delete partsJs.validate.formJs.Hash['tagFileNm'];
                delete partsJs.validate.formJs.Hash['partFileNm'];
                delete partsJs.validate.formJs.Hash['packFileNm'];


                saveData = JSON.stringify(partsJs.validate.formJs.Hash);
                $.ajax({
                    url:"<c:url value='/par/pcm/claim/updateQualityClaim.do' />"
                  , type:"POST"
                  , data:saveData
                  , dataType:"json"
                  , contentType:'application/json'
                  , async:true
                  , success:function(result) {

                      if (result.resultYn === true) {
                          dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.regSuccessParam' arguments='${claim}'/>");
                          $("#claimNo").val(result.claimNo);

                          $.ajax({
                              url:"<c:url value='/par/pcm/claim/selectQualityClaimByKey.do' />",
                              data:JSON.stringify({ sClaimNo:$("#claimNo").val()}),
                              type:"POST",
                              dataType:"json",
                              contentType:"application/json",
                              error:function(jqXHR,status,error) {
                                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                              }

                          }).done(function(result) {

                              //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
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
                ,beforeSend:function(){
                    dms.loading.show($("#windows"));
                }
                ,complete:function(){
                    dms.loading.hide($("#windows"));
                }
                , error:function(jqXHR,status,error) {
                    dms.loading.hide($("#windows"));
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
              });

            }
        });

        // 전송 버튼
        $("#btnSend").kendoButton({
            click:function(e){

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
                delete partsJs.validate.formJs.Hash[''];
                delete partsJs.validate.formJs.Hash['tagFiles'];
                delete partsJs.validate.formJs.Hash['partFiles'];
                delete partsJs.validate.formJs.Hash['packFiles'];
                delete partsJs.validate.formJs.Hash['tagFileNm'];
                delete partsJs.validate.formJs.Hash['partFileNm'];
                delete partsJs.validate.formJs.Hash['packFileNm'];
                qualityClaimVO = partsJs.validate.formJs.Hash;

                $.ajax({
                    url:"<c:url value='/par/pcm/claim/updateQualityClaim.do' />"
                  , type:"POST"
                  , data:kendo.stringify(qualityClaimVO)
                  , dataType:"json"
                  , contentType:'application/json'
                  , async:true
                  , success:function(result) {

                      if (result.resultYn === true) {
                          $.ajax({
                              url:urlParam//"<c:url value='/par/pcm/claim/sendQuelityClaim.do' />"
                             ,data:kendo.stringify(qualityClaimVO)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,async:false
                             ,success:function(result) {
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
                             ,error:function(jqXHR,status,error) {
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
                  ,beforeSend:function(){
                      dms.loading.show($("#windows"));
                  }
                  ,complete:function(){
                      dms.loading.hide($("#windows"));
                  }
                  , error:function(jqXHR,status,error) {
                      dms.loading.hide($("#windows"));
                      dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                  }
              });
            }
        });

        // 삭제 버튼
        $("#btnDelete").kendoButton({
            click:function(e){

                var urlParam,
                    qualityClaimVO;

                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];
                delete partsJs.validate.formJs.Hash['tagFiles'];
                delete partsJs.validate.formJs.Hash['partFiles'];
                delete partsJs.validate.formJs.Hash['packFiles'];
                delete partsJs.validate.formJs.Hash['tagFileNm'];
                delete partsJs.validate.formJs.Hash['partFileNm'];
                delete partsJs.validate.formJs.Hash['packFileNm'];


                if(dms.string.isEmpty($("#claimCode").val())){
                    //클레임번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                    return false;
                }

                qualityClaimVO = partsJs.validate.formJs.Hash;

                $.ajax({
                    url:"<c:url value='/par/pcm/claim/sendDeleteQuelityClaim.do' />"
                   ,data:kendo.stringify(qualityClaimVO)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:true
                   ,success:function(result) {

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
                    ,beforeSend:function(){
                        dms.loading.show($("#windows"));
                    }
                    ,complete:function(){
                        dms.loading.hide($("#windows"));
                    }
                    , error:function(jqXHR,status,error) {
                        dms.loading.hide($("#windows"));
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

               });
            }
        });


        /************************************************************
                    조회조건 설정
        *************************************************************/
        $("#claimNo").val(options.claimNo);
        // 조회조건 설정

        if(!dms.string.isEmpty($("#claimNo").val())){
            $.ajax({
                url:"<c:url value='/par/pcm/claim/selectQualityClaimByKey.do' />",
                data:JSON.stringify({ sClaimNo:$("#claimNo").val()}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
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

                $("#orderNo").attr("readonly",true);
                $("#orderNo").addClass("form_readonly");
                $("#orderLn").attr("readonly",true);
                $("#orderLn").addClass("form_readonly");
                $("#partNo").attr("readonly",true);
                $("#partNo").addClass("form_readonly");
                imageLoader();

                // claim complete button disable.
                if(!dms.string.isEmpty(options.claimEndYn)){

                    if(options.claimEndYn == "Y"){
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnSend").data("kendoButton").enable(false);
                        $("#btnDelete").data("kendoButton").enable(false);
                    }
                }

            });
        }else{
            $("#btnDelete").data("kendoButton").enable(false);
            $("#btnSend").data("kendoButton").enable(false);
        }

        if(dms.string.isEmpty($("#updtDt").val())){
            $("#btnSend").data("kendoButton").enable(false);
        }

    });


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

         if(dms.string.isEmpty($("#description").val())){
             //세부내용 정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.description' var='description' /><spring:message code='global.info.required.field' arguments='${description}'/>");
             return false;
         }

         return true;
     }

     //file Handler Func
     function handleTagFileSelect(evt){
         //input files
         var files = evt.target.files,
         //file 5MB size
             fileMaxSiz5Mb = 5 * 1024 * 1024,
         //fileView
             fileView = document.querySelector("#fileViewTag"),
             output = [];

         for(var i = 0,f; f = files[i]; i++){
             //file only one.
             if(i < 1){
                 //file size check
                 if(f.size > fileMaxSiz5Mb){
                     return false;
                 }

                 //file type check
                 if(!f.type.match("image.*")){
                     return false;
                 }

                 //fileName.
                 $("#tagFileUrl").val(f.name);
                 $("#tagFileNm").val(f.name);

                 var reader = new FileReader();

                 var file = f;

                 reader.onload = (function(theFile) {
                     return function(e) {

                         $("#tagFileDataCont").val(window.btoa(e.target.result));
                         fileView.src = e.target.result;
                         fileView.style.height = '100px';
                         fileView.style.width  = '300px';
                     };
                 })(file);
                 //readAsDataURL call
                 reader.readAsDataURL(file);
             }
         }
     }
     //file Handler Func
     function handlePartFileSelect(evt){
         //input files
         var files = evt.target.files;
         //file 5MB size
         var fileMaxSiz5Mb = 5 * 1024 * 1024;
         //fileView
         var fileView = document.querySelector("#fileViewPart");
         var output = [];
         for(var i = 0,f; f = files[i]; i++){
             //file only one.
             if(i < 1){
                 //file size check
                 if(f.size > fileMaxSiz5Mb){
                     return false;
                 }

                 //file type check
                 if(!f.type.match("image.*")){
                     return false;
                 }

                 //fileName.
                 $("#partFileUrl").val(f.name);
                 $("#partFileNm").val(f.name);

                 var reader = new FileReader();

                 var file = f;

                 reader.onload = (function(theFile) {
                     return function(e) {

                         $("#parFileDataCont").val(window.btoa(e.target.result));
                         fileView.src = e.target.result;
                         fileView.style.height = '100px';
                         fileView.style.width  = '300px';

                     };
                 })(file);
                 //readAsDataURL call
                 reader.readAsDataURL(file);
             }
         }
     }
     //file Handler Func
     function handlePackFileSelect(evt){
         //input files
         var files = evt.target.files;
         //file 5MB size
         var fileMaxSiz5Mb = 5 * 1024 * 1024;
         //fileView
         var fileView = document.querySelector("#fileViewPack");
         var output = [];
         for(var i = 0,f; f = files[i]; i++){
             //file only one.
             if(i < 1){
                 //file size check
                 if(f.size > fileMaxSiz5Mb){
                     return false;
                 }

                 //file type check
                 if(!f.type.match("image.*")){
                     return false;
                 }

                 //fileName.
                 $("#packFileUrl").val(f.name);
                 $("#packFileNm").val(f.name);

                 var reader = new FileReader();

                 var file = f;

                 reader.onload = (function(theFile) {
                     return function(e) {
                         $("#packFileDataCont").val(window.btoa(e.target.result));
                         fileView.src = e.target.result;
                         fileView.style.height = '100px';
                         fileView.style.width  = '300px';
                     };
                 })(file);
                 //readAsDataURL call
                 reader.readAsDataURL(file);
             }
         }
     }

     //imageLoader Func
     function imageLoader(){
         var fileViewTag   = document.querySelector("#fileViewTag"),
             fileViewPart  = document.querySelector("#fileViewPart"),
             fileViewPack  = document.querySelector("#fileViewPack"),
             bolbBytesTag  = $("#tagFileDataCont").val(),
             bolbBytesPart = $("#parFileDataCont").val(),
             bolbBytesPack = $("#packFileDataCont").val(),
             fileDataTag   = window.atob(bolbBytesTag),
             fileDataPart  = window.atob(bolbBytesPart),
             fileDataPack  = window.atob(bolbBytesPack);

         fileViewTag.src = fileDataTag;
         fileViewPart.src = fileDataPart;
         fileViewPack.src = fileDataPack;
         fileViewTag.style.height  = '100px';
         fileViewTag.style.width   = '300px';
         fileViewPart.style.height = '100px';
         fileViewPart.style.width  = '300px';
         fileViewPack.style.height = '100px';
         fileViewPack.style.width  = '300px';
         $("#tagFileNm").val($("#tagFileUrl").val());
         $("#partFileNm").val($("#partFileUrl").val());
         $("#packFileNm").val($("#packFileUrl").val());
     }

 </script>


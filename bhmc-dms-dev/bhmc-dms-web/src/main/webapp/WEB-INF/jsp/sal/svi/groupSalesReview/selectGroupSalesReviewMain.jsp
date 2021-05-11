<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script>

<div id="resizableContainer">
    <!-- 법인 - 집단판매 심사 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.grpSalesReview" /></h1> <!-- 법인 - 집단판매 심사 -->
            <div class="btn_right">
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                <button id="btnAllEval" class="btn_m"><spring:message code='sal.btn.allEval' /><!-- 일괄심사 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                <button class="btn_m" id="btnExcel"><spring:message code="global.btn.excelDownload" /></button> <!-- 엑셀다운로드 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.division' /></th><!-- 사업부 -->
                        <td>
                            <input id="sDiviCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                        <td>
                            <input id="sOffCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.sung" /></th><!-- 성 -->
                        <td>
                            <input id="sSungCd" name="sungCd" type="text" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.city" /></th><!-- 시  -->
                        <td>
                            <input id="sCityCd" name="cityCd" type="text" class="form_comboBox" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.applNumber" /></th> <!-- 신청번호 -->
                        <td>
                            <input name="sApplyNo" id="sApplyNo" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dlrCd" /></th><!-- 딜러코드  -->
                        <td>
                            <input name="sDlrCd" id="sDlrCd" type="text" class="form_input"">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                        <td>
                            <input name="sCustNm" id="sCustNm" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.item" /></th> <!-- 항목 -->
                        <td>
                            <input name="sAtcDstinCd" id="sAtcDstinCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.fincReqDt" /></th> <!-- 신청일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sApplyDtS" id="sApplyDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sApplyDtE" id="sApplyDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.evalDt" /></th> <!-- 심사일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sLastStartUpdt" id="sLastStartUpdt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sLastEndUpdt" id="sLastEndUpdt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.evalStatus" /></th> <!-- 심사상태 -->
                        <td>
                            <input name="sApproveCd" id="sApproveCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.evalYn" /></th> <!-- 심사여부 -->
                        <td>
                            <input name="sEvalRsltYn" id="sEvalRsltYn" type="text" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>


    <section id="detailViewWindow" class="pop_wrap" >
        <section class="group">
            <div class="header_area">
                <div id="btnAll" class="btn_right">
                    <button class="btn_s" id="btnSave"><spring:message code="global.btn.fix" /></button> <!-- 확정 -->
                    <button class="btn_s" id="btnPrint"><spring:message code="global.btn.print" /></button><!-- 인쇄 -->
                </div>
                <%-- <div id="btnCheck" class="btn_right" style="display:display">
                    <button class="btn_s" id="btnPrint"><spring:message code="global.btn.print" /></button><!-- 인쇄 -->
                </div> --%>
            </div>

            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:22%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <input type="hidden" id="reqSeq" name="reqSeq" data-bind="value:reqSeq" data-json-obj="true" >
                            <input type="hidden" id="usrId" name="usrId" data-bind="value:usrId" data-json-obj="true" >
                            <input type="hidden" id="headFileDocId" name="headFileDocId" data-bind="value:fileDocId" data-json-obj="true" >
                            <th scope="row"><spring:message code="global.lbl.evalRslt" /></th> <!-- 심사결과 -->
                            <td>
                                <label class="label_check"><input id="evalRsltY" name="evalRslt" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='global.btn.approval' /><!-- 승인--></label>
                                <label class="label_check"><input id="evalRsltN" name="evalRslt" type="radio" value="N" class="form_check"> <spring:message code='global.btn.nonApproval' /><!-- 불승인--></label>
                                <input type="hidden" id="evalRsltYn" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.evalRemark" /></th> <!-- 심사평가 -->
                            <td colspan="5">
                                <input id="remark" name="remark" type="text" value="" class="form_input">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th> <!-- 딜러코드 -->
                            <td colspan="3">
                                <div class="form_float">
                                    <div class="form_left" style="width:35%;">
                                            <input type="text" id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true" >
                                    </div>
                                    <div class="form_right" style="width:65%;">
                                        <input type="text"  id="dlrNm" name="dlrNm" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.officeNm" /></th> <!-- 사무소 -->
                            <td>
                                <input type="text"  id="dlrArea" name="dlrArea" readonly class="form_input form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.repCustNm" /></th> <!-- 대고객명 -->
                            <td colspan="3">
                                <input type="text" maxlength="35" id="custNm" name="custNm" readonly class="form_input form_readonly"  data-bind="value:custNm" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.contactUserNm" /></th> <!-- 연락자 -->
                            <td>
                                <input type="text" maxlength="10" id="prsnId" name="prsnId" readonly class="form_input form_readonly" data-bind="value:prsnId" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.cellphone" /></th> <!-- 핸드폰 -->
                            <td>
                                <input type="number" maxlength="11" data-name="<spring:message code="global.lbl.cellphone" />" id="hpNo" name="hpNo" readonly class="form_input form_readonly" data-bind="value:hpNo" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.officeTelNo" /></th> <!-- 유선번호 -->
                            <td>
                                <input type="number" maxlength="11" data-name="<spring:message code="global.lbl.cellphone" />" id="telNo" name="telNo" readonly class="form_input form_readonly" data-bind="value:telNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.addr" /></th> <!-- 주소 -->
                            <td colspan="3">
                                <input type="text" maxlength="60" id="addr" name="addr" readonly class="form_input form_readonly" data-bind="value:addr" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.item" /></th> <!-- 항목유형 -->
                            <td>
                                <input type="text" id="atcDstinCd" name="atcDstinCd" data-bind="value:atcDstinCd" class="form_comboBox" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.vehicleUse" /></th> <!-- 차량용도 -->
                            <td colspan="3">
                                <input type="text" maxlength="300" id="carUseTp" name="carUseTp" readonly class="form_input form_readonly" data-bind="value:carUseTp" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrUsrNm" /></th> <!-- 딜러항목담당자 -->
                            <td>
                                <input type="text" maxlength="10" id="prsnDlrCd" name="prsnDlrCd" readonly class="form_input form_readonly" data-bind="value:prsnDlrCd" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.telNumer" /></th> <!-- 연락처 -->
                            <td>
                                <input type="text" maxlength="12" data-name="<spring:message code="global.lbl.telNumer" />" id="prsnDlrTelNo" name="prsnDlrTelNo" atcDstinCd class="form_input form_readonly" data-bind="value:prsnDlrTelNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.contractDoc" /></th> <!-- 계약문서 -->
                            <td colspan="7">
                                <input id="contractFileNm" name="contractFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:contractFileNm">
                                <button type="button" id="contractFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="contractFileNo" name="contractFileNo"  class="form_input" style="width:5%" data-bind="value:contractFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.bussLicence" /></th> <!-- 사업자등록증 -->
                            <td colspan="7">
                                <input id="bussLicenceNm" name="bussLicenceNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:bussLicenceFileNm" >
                                <button type="button" id="bussLicence" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="bussLicenceNo" name="bussLicenceNo"  class="form_input" style="width:5%" data-bind="value:bussLicenceFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.etcFile" /></th> <!-- 기타문서 -->
                            <td colspan="7">
                                <input id="etcFileNm" name="etcFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:etcFileNm" >
                                <button type="button" id="etcFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="etcFileNo" name="etcFileNo"  class="form_input" style="width:5%" data-bind="value:etcFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.addDocument" /></th> <!-- 보충자료 -->
                            <td colspan="7">
                                <input id="addFileNm" name="addFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:addFileNm" >
                                <button type="button" id="addFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="addFileNo" name="addFileNo"  class="form_input" style="width:5%" data-bind="value:addFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.applyQty" /></th> <!-- 신청수량 -->
                            <td>
                                <input type="text" maxlength="10" id="reqQty" name="reqQty" class="form_input">
                            </td>
                            <td colspan="2">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="grid2"></div>
            </div>
            <div class="table_grid mt10">
                <div id="grid3"></div>
            </div>
        </section>


        <section id="evalPopupWindow" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right" >
                    <button class="btn_s" id="btnAllEvalSave"><spring:message code="global.btn.fix" /></button> <!-- 확정 -->
                </div>
            </div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col >
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRslt" /></th> <!-- 심사결과 -->
                            <td>
                                <ul class="tabmenu">
                                    <li id="popupEvalRsltY" class="on"><button type="button"><spring:message code="global.btn.approval" /></button></li> <!-- 승인 -->
                                    <li id="popupEvalRsltN" ><button type="button"><spring:message code="global.btn.nonApproval" /></button></li> <!-- 불승인 -->
                                    <input type="hidden" id="popupEvalRsltYn" name="popupEvalRsltYn" value="Y"/>
                                </ul>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRemark" /></th> <!-- 심사평가 -->
                            <td colspan="3">
                                <textarea id="popupRemark" name="popupRemark" rows="7" cols="" class="form_textarea" required data-name="<spring:message code="global.lbl.cont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section id="fileViewWindow" class="pop_wrap">
            <div class="table_grid mt10">
                <div id="fileGrid"></div>
            </div>
            <!-- 파일업로드 -->
            <input type="hidden" id="fileDocNo" />
            <input type="hidden" id="fileDocId" />
        </section>

        <section id="imageViewWindow" class="pop_wrap" >
            <div class='imgSlider_wrap' >
                <div class='imgSlider_scrollbox' id="fileHtml">
                </div>
            </div>
        </section>

    </section>

</section>

</div>
<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
    var sysDate = "${sysDate}";
    var fifteenDayBf = "${fifteenDayBf}";
    var detailPopOpenYn = "N";
    var evalPopOpenYn = "N";
    var usrEvalGrade = "${usrEvalGrade}";
    var loginUsrId = "${usrId}";

    /************* 상태 SELECT BOX  *******************/
    var evalYnList = [];
    <c:forEach var="obj" items="${evalYnInfo}">
        evalYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var evalYnMap = dms.data.arrayToMap(evalYnList, function(obj){return obj.cmmCd});
    /************* 상태 SELECT BOX  *******************/


    /************* 상태 SELECT BOX  *******************/
    var approveCdList = [];
    <c:forEach var="obj" items="${approveCdInfo}">
    if("${obj.cmmCd}" != 'A'){
        approveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    </c:forEach>
    var approveCdArr = dms.data.arrayToMap(approveCdList, function(obj){return obj.cmmCd});
    /************* 상태 SELECT BOX  *******************/

    /************* 항목 SELECT BOX  *******************/
    var atcDstinCdList = [];
    <c:forEach var="obj" items="${atcDstinCdInfo}">
    atcDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var atcDstinArr = dms.data.arrayToMap(atcDstinCdList, function(obj){return obj.cmmCd});
    /************* 항목 SELECT BOX  *******************/

    /************* 딜러지역 SELECT BOX  *******************/
    var distCdList = [];
    <c:forEach var="obj" items="${distCdInfo}">
    if("${obj.cmmCd}" != 'AA'){
        distCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    </c:forEach>
    var distCdArr = dms.data.arrayToMap(distCdList, function(obj){return obj.cmmCd});
    /************* 딜러지역 SELECT BOX  *******************/


    /************* 심사여부 SELECT BOX  ********************/
    var evalRsltYnList = [];
    <c:forEach var="obj" items="${evalYnInfo}">
    evalRsltYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var evalRsltYnArr = dms.data.arrayToMap(evalRsltYnList, function(obj){return obj.cmmCd});
    /************* 심사여부 SELECT BOX  *******************/




    /************* 사업부 SELECT BOX  *******************/
    var sdptDs = [];
    <c:forEach var="obj" items="${sdptList}">
        sdptDs.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
    </c:forEach>
    /************* 사업부 SELECT BOX  *******************/



    // 차종
    var carLineCdDSList = [];
    var carLineCdObj = {};
    <c:forEach var="obj" items="${carLineCdInfo}">
        carLineCdDSList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
        carLineCdObj["${obj.carlineCd}"] = "${obj.carlineCdNm}";
    </c:forEach>

    // 그리드 모델 콤보 DataSource
    var modelCdDSList = [];
    var modelCdObj = {};

    // 그리드 OCN 콤보 DataSource
    var ocnCdDSList = [];
    var ocnCdObj = {};

    // 그리드 외장색 콤보 DataSource
    var extColorCdDSList = [];
    var extColorCdObj = {};

    // 그리드 내장색 콤보 DataSource
    var intColorCdDSList = [];
    var intColorCdObj = {};

    function fnSelectGroupSalesApplicationDetail(dataItem){

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSlaesReviewDetail.do' />"
                ,data:JSON.stringify({"dlrCd":dataItem.dlrCd, "usrId":dataItem.usrId, "reqSeq":dataItem.reqSeq})
                ,async:false
            });

            detailList = responseJson.data;
            var pevalId = dataItem.pevalId;
            var reqNo = dataItem.reqNo;
            var reqQty = dataItem.reqQty;

            if( detailList[0] != null ){

                if(pevalId == loginUsrId && reqNo == usrEvalGrade){
                    $("#evalRsltYn").addClass("disabled");
                    $("#evalRsltY").prop("disabled","disabled");
                    $("#evalRsltN").prop("disabled","disabled");

                    $("#remark").addClass("disabled");
                    $("#remark").prop("disabled","disabled");

                    $("#btnSave").data("kendoButton").enable(false);
                }else{
                    $("#evalRsltYn").removeClass("disabled");
                    $("#evalRsltY").prop("disabled","");
                    $("#evalRsltN").prop("disabled","");

                    $("#remark").removeClass("disabled");
                    $("#remark").prop("disabled","");

                    $("#btnSave").data("kendoButton").enable(true);
                }


                $("#evalRsltY").attr("class", "on");
                $("#evalRsltN").attr("class", "");
                $("#evalRsltYn").val("Y");
                $("#remark").val("");

                $("#reqQty").attr("disabled", true);
                $("#reqQty").val(reqQty);

                if(dataItem.evalRsltYn == 'Y'){//승인
                    $("#evalRsltY").attr("class", "on");
                    $("#evalRsltN").attr("class", "");
                }else if(dataItem.evalRsltYn == 'N'){//불승인
                    $("#evalRsltY").attr("class", "");
                    $("#evalRsltN").attr("class", "on");
                }else {
                    $("#evalRsltY").attr("class", "");
                    $("#evalRsltN").attr("class", "");
                }

                $("#reqSeq").val(detailList[0].reqSeq);
                $("#usrId").val(detailList[0].usrId);
                $("#dlrCd").val(detailList[0].dlrCd);

                $("#dlrNm").val(detailList[0].dlrNm);
                $("#dlrArea").val(detailList[0].officeNm);

                $("#custNm").val(detailList[0].custNm);
                $("#prsnId").val(detailList[0].prsnId);
                $("#zipCd").val(detailList[0].zipCd);

                $("#addr").val(detailList[0].addr);
                $("#hpNo").val(detailList[0].hpNo);
                $("#telNo").val(detailList[0].telNo);
                $("#faxNo").val(detailList[0].faxNo);

                $("#atcDstinCd").data('kendoExtDropDownList').value(detailList[0].atcDstinCd);
                $("#atcCont").val(detailList[0].atcCont);

                $("#carUseTp").val(detailList[0].carUseTp);
                $("#prsnDlrCd").val(detailList[0].prsnDlrCd);
                $("#prsnDlrTelNo").val(detailList[0].prsnDlrTelNo);

                $("#retlAmt").val(detailList[0].retlAmt);
                //$("#rcptAmt").val(detailList[0].rcptAmt);
                //$("#dcAmt").val(detailList[0].dcAmt);

                $("#contractFileNm").val(detailList[0].contractFileNm);
                $("#bussLicenceNm").val(detailList[0].bussLicenceFileNm);
                $("#etcFileNm").val(detailList[0].etcFileNm);
                $("#addFileNm").val(detailList[0].addFileNm);
                $("#contractFileNo").val(detailList[0].contractFileNo);
                $("#bussLicenceNo").val(detailList[0].bussLicenceFileNo);
                $("#etcFileNo").val(detailList[0].etcFileNo);
                $("#addFileNo").val(detailList[0].addFileNo);

                fileDocId = detailList[0].fileDocId;

                $("#headFileDocId").val(fileDocId);


                //계약문서
                if($("#contractFileNm").val() != ""){
                    $("#contractFile").removeClass("form_disabled");
                    $("#contractFile").prop("disabled","");
                 }else {
                    $("#contractFile").addClass("form_disabled");
                    $("#contractFile").prop("disabled","disabled");
                 }



                //사업자등록증
                if($("#bussLicenceNm").val()  != ""){
                    $("#bussLicence").removeClass("form_disabled");
                    $("#bussLicence").prop("disabled","");
                 }else {
                    $("#bussLicence").addClass("form_disabled");
                    $("#bussLicence").prop("disabled","disabled");
                 }


                //기타자료
                if($("#etcFileNm").val() != ""){
                    $("#etcFile").removeClass("form_disabled");
                    $("#etcFile").prop("disabled","");
                 }else {
                    $("#etcFile").addClass("form_disabled");
                    $("#etcFile").prop("disabled","disabled");
                 }




                //보충자료
                if($("#addFileNm").val() != "" ){
                    $("#addFile").removeClass("form_disabled");
                    $("#addFile").prop("disabled","");
                 }else {
                    $("#addFile").addClass("form_disabled");
                    $("#addFile").prop("disabled","disabled");
                 }



            }else{
                // 해당하는 데이터가 없습니다.
                //dms.notification.warning("<spring:message code='sal.info.noDataMsg' />");
            }

            $('#grid2').data('kendoExtGrid').dataSource.page(1);
            $('#grid3').data('kendoExtGrid').dataSource.page(1);
    }
    function fnReSet(){

        $("#reqSeq").val("");
        $("#usrId").val("");
        $("#dlrCd").val("");
        //$("#dlrNm").val(detailList[0].dlrNm);
        //$("#dlrArea").val(detailList[0].dlrArea);

        $("#custNm").val("");
        $("#prsnId").val("");
        $("#zipCd").val("");

        $("#addr").val("");

        $("#hpNo").val("");
        $("#faxNo").val("");

        $("#atcDstinCd").data('kendoExtDropDownList').value("");
        $("#atcCont").val("");

        $("#carUseTp").val("");
        $("#prsnDlrCd").val("");
        $("#prsnDlrTelNo").val("");

        /* $("input[name='longDcss']").each(function(){
            if( this.value == "Y"){
                this.checked = true;
            }else{
                this.checked = false;
            }
        }); */

        //$("#carAllocHopeDt").data('kendoExtMaskedDatePicker').value("");

        //$("#btnAll").attr("style", "display:none");
        //$("#btnCheck").attr("style", "display:display");

        var grid = $('#grid').data('kendoExtGrid');
        grid.clearSelection();
        $('#grid2').data('kendoExtGrid').dataSource.data([]);
        $('#grid3').data('kendoExtGrid').dataSource.data([]);
    }

    $(document).ready(function () {

        //사업부
        $("#sDiviCd").kendoExtDropDownList({
            dataTextField:"sdptNm"
           ,dataValueField:"sdptCd"
           ,dataSource:sdptDs
           ,optionLabel:" "   // 전체
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(true);

               $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sSungCd").data("kendoExtDropDownList").enable(false);

               $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sCityCd").data("kendoExtDropDownList").enable(false);

               $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sCityCd").data("kendoExtDropDownList").enable(false);

               if(dataItem.sdptCd == ""){
                   $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sOffCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }

               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
                   ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
                   ,async:false
               });
               $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }
        });

        // 사무소
        $("#sOffCd").kendoExtDropDownList({
            dataTextField:"distOfficeNm"
           ,dataValueField:"distOfficeCd"
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sSungCd").data("kendoExtDropDownList").enable(true);

               $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sCityCd").data("kendoExtDropDownList").enable(false);

               $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sCityCd").data("kendoExtDropDownList").enable(false);

               if(dataItem.offCd == ""){
                   $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sSungCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }

               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/cmm/selectDealerSung.do' />"
                   ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":dataItem.distOfficeCd})
                   ,async:false
               });
               $("#sSungCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }
           ,optionLabel:" "   // 전체
        });
        $("#sOffCd").data("kendoExtDropDownList").enable(false);


        //성
        $("#sSungCd").kendoExtDropDownList({
            dataTextField:"saleDlrSungNm"
            ,dataValueField:"saleDlrSungCd"
            ,optionLabel:" "    // 전체
            ,select:function(e){
                var dataItem = this.dataItem(e.item);

                $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sCityCd").data("kendoExtDropDownList").enable(true);

                if(dataItem.sungCd == ""){
                    $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#sCityCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/cmm/selectDealerCity.do' />"
                    ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value(),"sSaleDlrSungCd":dataItem.saleDlrSungCd})
                    ,async:false
                });
                $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });
        $("#sSungCd").data("kendoExtDropDownList").enable(false);


        //시
        $("#sCityCd").kendoExtDropDownList({
            dataTextField:"saleDlrCityNm"
            ,dataValueField:"saleDlrCityCd"
            /*   //딜러검색
            ,select:function(e){
                var dataItem = this.dataItem(e.item);

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/cmm/selectDealer.do' />"
                    ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value()
                        ,"sSaleDlrSungCd":dataItem.saleDlrSungCd,"sSaleDlrCityCd":dataItem.saleDlrCityCd})
                    ,async:false
                });
            }
            */
            ,optionLabel:" "   // 전체
        });
        $("#sCityCd").data("kendoExtDropDownList").enable(false);

        $("#evalRsltYn").val("Y");
        //  // 심사결과:승인
        $("#evalRsltY").click(function(){
            /* if(!readyEvalRslt){
                return false;
            } */

            //$(this).siblings("li").removeClass("on");
            //$(this).addClass("on");
            $("#evalRsltYn").val("Y");

            $("#applyStartDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#applyEndDt").data("kendoExtMaskedDatePicker").enable(true);
        });
        // 심사결과:불승인
        $("#evalRsltN").click(function(){
            /* if(!readyEvalRslt){
                return false;
            } */

            //$(this).siblings("li").removeClass("on");
            //$(this).addClass("on");
            $("#evalRsltYn").val("N");

        });

        /******************************************************************************************************************************************/

        /*
         * max 500으로 지정. 여백이 있는경우는 줄여야함
         */

         $("#imageViewWindow").kendoWindow({
             animation:false
             ,draggable:false
             ,modal:true
             ,resizable:false
             ,visible:false
             ,title:"预览"
             ,width:"592px"
         }).data("kendoWindow");


         $("#fileViewWindow").kendoWindow({
             animation:false
             ,draggable:false
             ,modal:true
             ,resizable:false
             ,visible:false
             ,title:"添加文件"
             ,width:"700px"
             ,height:"250px"
         }).data("kendoWindow");


         $("#detailViewWindow").kendoWindow({
             animation:false
             ,draggable:true
             ,modal:false
             ,resizable:false
             ,visible:false
             ,title:"<spring:message code='sal.lbl.detailSearch' />"                        //상세보기
             ,width:"950px"
             ,height:"580px"
             ,open:function(e){
                 detailPopOpenYn = "Y";
             }
             ,close:function(e){
                 detailPopOpenYn = "N";
             }
         }).data("kendoWindow");




         $("#evalPopupWindow").kendoWindow({
             animation:false
             ,draggable:false
             ,modal:true
             ,resizable:false
             ,visible:false
             ,title:"<spring:message code='sal.btn.allEval' />"                             //일괄심사
             ,width:"650px"
             ,height:"200px"
             ,open:function(e){
                 evalPopOpenYn  = "Y";
             }
             ,close:function(e){
                 evalPopOpenYn  = "N";
             }
         }).data("kendoWindow");




        /**
        * 상태 콤보박스
        */
        $("#sApproveCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:approveCdList
           ,optionLabel:" "  // 전체
        });


         /**
          * 항목 콤보박스
          */
          $("#sAtcDstinCd").kendoExtDropDownList({
              dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:atcDstinCdList
             ,optionLabel:" "  // 전체
          });

          /**
           * 심사여부 콤보박스
           */
           $("#sEvalRsltYn").kendoExtDropDownList({
               dataTextField:"cmmCdNm"
              ,dataValueField:"cmmCd"
              ,dataSource:evalRsltYnList
              ,optionLabel:" "  // 전체
           });

        /**
         * 시작 신청일자 (From)
         */
         $("#sApplyDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,value:fifteenDayBf
         });
         /**
         * 종료 신청일자 (From)
         */
         $("#sApplyDtE").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            //,value:sysDate
         });

         /**
          * 시작 심사일자 (From)
          */
          $("#sLastStartUpdt").kendoExtMaskedDatePicker({
              format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
          });
         /**
          * 종료 심사일자 (From)
          */
          $("#sLastEndUpdt").kendoExtMaskedDatePicker({
              format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
          });

          /**
           * 배정 희망일자
           */

           $("#carAllocHopeDt").kendoExtMaskedDatePicker({
               format:"<dms:configValue code='dateFormat' />"
               ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
          });

         // 심사결과:승인
          $("#evalRsltY").click(function(){

              $(this).siblings("li").removeClass("on");
              $(this).addClass("on");
              $("#evalRsltYn").val("Y");
          });
         // 심사결과:불승인
          $("#evalRsltN").click(function(){

              $(this).siblings("li").removeClass("on");
              $(this).addClass("on");
              $("#evalRsltYn").val("N");
          });



          // 심사결과:승인
          $("#popupEvalRsltY").click(function(){

              $(this).siblings("li").removeClass("on");
              $(this).addClass("on");
              $("#popupEvalRsltYn").val("Y");
          });
         // 심사결과:불승인
          $("#popupEvalRsltN").click(function(){

              $(this).siblings("li").removeClass("on");
              $(this).addClass("on");
              $("#popupEvalRsltYn").val("N");
          });



        /**
         * 딜러지역 콤보박스
         */
         $("#distCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:distCdList
            ,enable:false
            //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
         });

        /**
         * 항목 콤보박스
         */
         $("#atcDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:atcDstinCdList
            //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            ,enable:false
         });


        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                fnReSet();
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

      //버튼 - 엑셀다운로드
        $("#btnExcel").kendoButton({
            click:function(e) {
                dms.ajax.excelExport({
                    "beanName":"groupSalesReviewService"
                    ,"templateFile":"GroupSalesReview_Tpl.xlsx"
                    ,"fileName":"groupSales.xlsx"
                    ,"sDiviCd":$("#sDiviCd").data("kendoExtDropDownList").value()
                    ,"sOffCd":$("#sOffCd").data("kendoExtDropDownList").value()
                    ,"sSungCd":$("#sSungCd").data("kendoExtDropDownList").value()
                    ,"sCityCd":$("#sCityCd").data("kendoExtDropDownList").value()
                    ,"sApplyNo":$("#sApplyNo").val()
                    ,"sCustNm":$("#sCustNm").val()
                    ,"sDlrCd":$("#sDlrCd").val()
                    ,"sApproveCd":$("#sApproveCd").data("kendoExtDropDownList").value()
                    ,"sEvalRsltYn":$("#sEvalRsltYn").data("kendoExtDropDownList").value()
                    ,"sAtcDstinCd":$("#sAtcDstinCd").data("kendoExtDropDownList").value()
                    ,"sApplyDtS":kendo.toString(kendo.parseDate($("#sApplyDtS").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                    ,"sApplyDtE":kendo.toString(kendo.parseDate($("#sApplyDtE").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                    ,"sLastStartUpdt":kendo.toString(kendo.parseDate($("#sLastStartUpdt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                    ,"sLastEndUpdt":kendo.toString(kendo.parseDate($("#sLastEndUpdt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                    ,"sUsrEvalGrade":usrEvalGrade
                    ,"sLoginUsrId":loginUsrId
                });

            }
        });

        //버튼 - 초기화
        $("#btnReset").kendoButton({
            click:function(e) {

                $("#remark").val("");
                $("#evalRsltYn").val("");
                $("#evalRsltY").click();

            }
        });

        //버튼 - 확정
        $("#btnSave").kendoButton({
            click:function(e) {
                //심사그리드
                var grid = $('#grid').data('kendoExtGrid');
                var selectIdx = grid.select().index();
                var data = grid.dataSource.view();
                var rows = grid.select();
                var selectVal = data[selectIdx];
                var arrSave = [];

                var approveCd ;
                var remark ;

                if( grid.select().index() < 0 ){
                    return;
                }

                //단일심사
                if(detailPopOpenYn == "Y"){

                    //심사결과 선택 (승인 / 거절)
                    if($("#evalRsltYn").val() == "" || $("#evalRsltYn").val() == null){
                        dms.notification.warning("请选择审批结果");
                        return false;
                    }


                    if($("#evalRsltYn").val() == 'Y'){
                        approveCd = 'C';
                    }else if($("#evalRsltYn").val() == 'N'){
                        approveCd = 'D';
                    }

                    remark = $("#remark").val();
                }
                //일괄심사
                else if(evalPopOpenYn == "Y") {
                    if($("#popupEvalRsltYn").val() == 'Y'){
                        approveCd = 'C';
                    }else if($("#popupEvalRsltYn").val() == 'N'){
                        approveCd = 'D';
                    }

                    remark = $("#popupRemark").val();

                }
                //기타 예외 상황.
                else {
                    return false;
                }


                if(!confirm("<spring:message code='global.btn.fix' var='reg' /><spring:message code='global.info.cnfrmMsg' arguments='${reg},' />")){
                    return;
                }

                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row);

                    arrSave.push(dataItem);

                });
                var saveData = {"updateList":arrSave,"approveCd":approveCd, "remark":remark};

                $.ajax({
                    url:"<c:url value='/sal/svi/groupSalesReview/saveGroupSalesReview.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus){

                        fnReSet();

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        if(detailPopOpenYn == "Y"){
                            $("#detailViewWindow").data("kendoWindow").close();
                        }else if(evalPopOpenYn == "Y"){
                            $("#evalPopupWindow").data("kendoWindow").close();
                        }
                    }
                });
            }
        });

        //버튼 - 출력
        $("#btnPrint").kendoButton({
            click:function(e) {
                dms.notification.warning("该功能开发中");
                //$('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 일괄심사
        $("#btnAllEval").kendoButton({
            click:function(e) {
                //심사그리드
                var grid = $('#grid').data('kendoExtGrid');
                var selectIdx = grid.select().index();
                var data = grid.dataSource.view();
                var rows = grid.select();
                var selectVal = data[selectIdx];
                var arrSave = [];

                var approveCd ;
                var remark ;

                var cnt = 0;
                $.each(rows, function(idx, val){
                    var data = grid.dataItem(val);
                    if(data.evalYn == "01"){
                        //$(this).prop("checked", false);
                        //$(".grid-checkbox-item", $("#grid")).prop("checked", false);
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                        $(this).closest("tr").removeClass("k-state-selected");
                        $(this).removeClass("k-state-selected");
                        cnt = 1;
                    }
                });
                if(cnt == 1){
                    // 심사완료된 건은 일괄심사 대상자가 아닙니다.
                    dms.notification.warning("<spring:message code='sal.info.groupSalesReviewMsg' />");
                }

                var rows = grid.select();
                if(rows.length < 2){
                    //일괄심사는 1건이상을 일괄로 처리하는 기능입니다. <br> 단일건은 수정버튼으로 처리하세요.
                    dms.notification.warning("<spring:message code='sal.info.evlAllMsg' />");
                    return false;
                }

                evalPopupOpen();


            }
        });

        //버튼 - 일괄심사 확정
        $("#btnAllEvalSave").kendoButton({
            click:function(e) {
                $("#btnSave").click();
            }
        });

        // 상세정보
        $("#btnViewDetail").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());
                if ( dms.string.isNotEmpty(selectedItem) ){

                    viewDetail(selectedItem);

                } else {
                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }
            }
            , enable:false
        })

        /*****************************************************************************
         ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
         *******************************************************************************/
         // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
         $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
             var gridId = e.delegateTarget.id
               , grid = $("#"+gridId+"").data("kendoExtGrid")
               , selectedItem = grid.dataItem(grid.select());

             if ( dms.string.isNotEmpty(selectedItem) ){

                 viewDetail(selectedItem);

             } else {

                 // {상세정보}을(를) 확인하여 주세요.
                 dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                 return;
             }



         });


         // 상세조회 후 팝업오픈
         function viewDetail(selectedVal){

             if( dms.string.isNotEmpty(selectedVal) ){
                 // 팝업오픈;
                 viewPopup();


                 /* if( selectedVal.approveCd == 'B' ){
                     $("#btnAll").attr("style", "display:display");
                     $("#btnCheck").attr("style", "display:none");
                 }else{
                     $("#btnAll").attr("style", "display:none");
                     $("#btnCheck").attr("style", "display:display");
                 } */


                 dlrCd = selectedVal.dlrCd;
                 usrId = selectedVal.usrId;
                 reqSeq = selectedVal.reqSeq;

                 fnSelectGroupSalesApplicationDetail(selectedVal);


             } else {
                 // {상세정보}을(를) 확인하여 주세요.
                 dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                 return;
             }
         }

         /******************************* 버튼 영역 end **************************************************************/

        //그리드 1번
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0721-115202"
            ,dataSource:{
                transport:{
                     read:{
                         url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSalesReview.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             // 사업부
                             params["sDiviCd"] = $("#sDiviCd").data("kendoExtDropDownList").value();
                             // 사무소
                             params["sOffCd"] = $("#sOffCd").data("kendoExtDropDownList").value();
                             // 성
                             params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();
                             // 도시
                             params["sCityCd"] = $("#sCityCd").data("kendoExtDropDownList").value();
                             // 신청번호
                             params["sApplyNo"] = $("#sApplyNo").val();
                             // 딜러지역
                             params["sDistCd"] = $("#sOffCd").data("kendoExtDropDownList").value();
                             // 딜러코드
                             params["sDlrCd"] = $("#sDlrCd").val();
                             // 고객명
                             params["sCustNm"] = $("#sCustNm").val();
                             // 상태
                             params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                             // 항목
                             params["sAtcDstinCd"] = $("#sAtcDstinCd").data("kendoExtDropDownList").value();
                             // 신청일자
                             params["sApplyDtS"] = $("#sApplyDtS").data("kendoExtMaskedDatePicker").value();
                             params["sApplyDtE"] = $("#sApplyDtE").data("kendoExtMaskedDatePicker").value();
                             // 상신일자(최종 데이터 변경일자)
                             params["sLastStartUpdt"] = $("#sLastStartUpdt").data("kendoExtMaskedDatePicker").value();
                             params["sLastEndUpdt"] = $("#sLastEndUpdt").data("kendoExtMaskedDatePicker").value();

                             //로그인 USER 심사등급
                             params["sUsrEvalGrade"] = usrEvalGrade;
                             params["sEvalRsltYn"] = $("#sEvalRsltYn").data("kendoExtDropDownList").value();

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"reqSeq",
                          fields:{
                              dlrCd:{type:"string"}             //딜러코드
                              ,usrId:{type:"string"}            //등록자
                              ,reqSeq:{type:"number"}           //신청일련번호
                              ,distCd:{type:"string"}           //딜러지역
                              ,dlrNm:{type:"string"}            //딜러이름
                              ,applyNo:{type:"string"}          //신청번호
                              ,atcDstinCd:{type:"string"}       //항목
                              ,custNm:{type:"string"}           //고객명
                              ,reqQty:{type:"number"}           //수량
                              ,assignQty:{type:"number"}        //배정수량
                              ,applyDt:{type:"date"}            //신청일자
                              ,evalDt:{type:"date"}             //심사일자
                              ,approveCd:{type:"string"}        //상태
                              ,evalRsltYn:{type:"string"}       //심사여부
                              ,realAmt:{type:"number"}          //지도가격
                              ,contractDocSeq:{type:"string"}   //계약문서일렬번호
                              ,crnDocSeq:{type:"string"}        //사업자등록증일련번호
                              ,etcDocSeq:{type:"string"}        //기타문서일련번호
                              ,addFileSeq:{type:"string"}       //추가자료일련번호
                              ,telNo:{type:"string"}            //전화번호
                              ,dlrNm:{type:"string"}            //딜러명
                              ,officeNm:{type:"string"}         //사무소명
                              ,whPrc:{type:"number"}
                              ,dcRate:{type:"number"}
                              ,aamt:{type:"number"}
                          }
                     }
                 }
            }
            ,height:460
            ,editable   :false
            ,autoBind:false
            ,navigatable:true
            ,change:function(e){

                if(this.select().length != 0){
                    var selectedVal = this.dataItem(this.select());
                    var applyNo = selectedVal.applyNo;

                    if ( dms.string.isNotEmpty(applyNo) ) {
                        $("#btnViewDetail").data("kendoButton").enable(true);
                    }


                };

            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"usrId", hidden:true}           // 등록자
                ,{field:"reqSeq", hidden:true}          // 일련번호
                ,{field:"realAmt", hidden:true}         // 지도가격
                ,{field:"contractDocSeq", hidden:true}  // 계약문서일련번호
                ,{field:"crnDocSeq", hidden:true}       // 사업자등록증일련번호
                ,{field:"etcDocSeq", hidden:true}       // 기타문서일련번호
                ,{field:"addFileSeq", hidden:true}      // 추가자료일련번호
                ,{field:"telNo", hidden:true}           // 전화번호
                ,{field:"dlrNm", hidden:true}           // 딜러명
                ,{field:"officeNm", hidden:true}        // 사무소명
                ,{field:"applyNo", title:"<spring:message code='global.lbl.applNumber' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                }  // 신청번호
                ,{field:"distCd", title:"<spring:message code='sal.lbl.officeNm' />"
                    ,width:80
                    //,template:"# if(distCdArr[distCd] != null) { # #= distCdArr[distCd].cmmCdNm# # }#"
                    ,attributes:{"class":"ac"}
                }  // 딜러지역
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />"
                    ,width:90
                    ,attributes:{"class":"ac"}
                }            // 딜러코드
                ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />"
                    ,width:200
                    ,attributes:{"class":"al"}
                }  // 딜러이름
                ,{field:"atcDstinCd", title:"<spring:message code='global.lbl.item' />"
                    ,width:80
                    ,template:"# if(atcDstinArr[atcDstinCd] != null) { # #= atcDstinArr[atcDstinCd].cmmCdNm# # }#"
                    ,attributes:{"class":"ac"}
                }  // 항목
                ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />"
                    ,width:200
                    ,attributes:{"class":"al"}
                }  // 고객명
                ,{field:"reqQty", title:"<spring:message code='global.lbl.qty' />"
                    ,width:50
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ar"}
                }  // 수량
                /* ,{field:"assignQty", title:"<spring:message code='global.lbl.assignmentUnit' />"
                    ,width:50
                    ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{"class":"ar"}
                }  // 배정수량 */
                ,{field:"applyDt", title:"<spring:message code='global.lbl.fincReqDt' />"
                    ,width:80
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                }  // 신청일자
                ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />"
                    ,width:60
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                }  // 심사일자
                ,{field:"approveCd", title:"<spring:message code='crm.lbl.evalStatus' />"
                    ,width:55
                    ,template:"# if(approveCdArr[approveCd] != null) { # #= approveCdArr[approveCd].cmmCdNm# # }#"
                    ,attributes:{"class":"ac"}
                }  // 심사상태
                ,{field:"evalYn", title:"<spring:message code='sal.lbl.evalYn' />"
                    ,width:60
                    ,template:"# if(evalYnMap[evalYn] != null) { # #= evalYnMap[evalYn].cmmCdNm# # }#"
                    ,attributes:{"class":"ac"}
                }  // 심사여부
                ,{field:"whPrc", title:"<spring:message code='sal.lbl.carRetlAmt' />", width:55, attributes:{"class":"ac"}, format:"{0:n2}"}        //지도가
                ,{field:"dcRate", title:"<spring:message code='global.lbl.dcRate' />", width:55, attributes:{"class":"ac"}, format:"{0:n2}"}         //할인율
                ,{field:"aamt", title:"<spring:message code='sal.lbl.rcptPrice' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}         //영수증발행가격
            ]
        });


        //그리드 설정
        $("#grid2").kendoExtGrid({
            gridId:"G-SAL-0721-115203"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/svo/groupSalesApplication/selectDetlVehPop.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = dlrCd;
                            params["sUsrId"] = usrId;
                            params["sReqSeq"] = reqSeq;


                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"vinNo"
                        ,fields:{
                             dlrCd        :{type:"string"}
                            ,usrId        :{type:"string"}
                            ,reqSeq       :{type:"string"}
                            ,reqLowerSeq  :{type:"string"}
                            ,vinNo        :{type:"string"}
                            ,dlrCd        :{type:"string"}
                            ,carlineNm    :{type:"string"}
                            ,modelNm      :{type:"string"}
                            ,stockVinNo1  :{type:"string"}
                            ,stockVinNo2  :{type:"string"}
                            ,fileDocId    :{type:"string"}
                            ,whPrc        :{type:"number"}
                            ,dcRate       :{type:"number"}
                            ,aamt         :{type:"number"}
                        }
                    }
                }
            }
            ,height:215
            ,editable:false
            ,multiSelectWithCheckbox:false
            ,autoBind:false
            ,navigatable:true
            ,pageable:false
            ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,change:function(e){

                var grid = e.sender;
                var selectRow = this.dataItem(this.select());
                var fileDocId = selectRow.fileDocId;
                reqLowerSeq = selectRow.reqLowerSeq ;

                $("#fileDocId").val(fileDocId);
                $("#fileDocNo").val(fileDocId);
                $('#fileGrid').data('kendoExtGrid').dataSource.page(1);


                //if( selectRow.reqNo != "" && selectRow.reqNo != null ){
                //    $('#grid3').data('kendoExtGrid').dataSource.page(1);
                //}
            }
            ,columns:[
                {field:"dlrCd", hidden:true}
                ,{field:"usrId", hidden:true}
                ,{field:"reqSeq", hidden:true}
                ,{field:"reqLowerSeq", hidden:true}
                ,{field:"fileDocId", hidden:true}
                ,{field:"carlineNm",title:"<spring:message code='global.lbl.carlineNm' />",width:80,   attributes:{"class":"al"}}     //차종명
                ,{field:"modelNm",  title:"<spring:message code='global.lbl.modelNm' />",  width:170,  attributes:{"class":"al"}}     //모델명
                //,{field:"stockVinNo1", title:"VIN NO1",   width:100,  attributes:{"class":"ac"}}     //Vin NO1
                //,{field:"stockVinNo2", title:"VIN NO2",   width:80,  attributes:{"class":"ac"}}      //Vin NO2
                ,{field:"vinNo",  title:"VIN NO",    width:120,  attributes:{"class":"ac"}}       //Vin NO
                ,{field:"whPrc",  title:"<spring:message code='sal.lbl.carRetlAmt' />"       ,width:60   ,attributes:{"class":"ar"}  ,format:"{0:n2}"} //지도가
                ,{field:"dcRate", title:"<spring:message code='sal.lbl.saleRate' />",   width:80,   attributes:{"class":"ac"},format:"{0:n2}"}     //할인율
                ,{field:"aamt",   title:"<spring:message code='sal.lbl.rcptPrice' />",   width:80,   attributes:{"class":"ac"},format:"{0:n2}"}     //영수증발행금액
                ,{_field:"_fileViewPop",      title:" ",   width:70,  attributes:{"class":"ac"}
                    ,template:"<span class='txt_label bg_blue' onClick='fileViewPop()'>图片下载</span>"
                }     //첨부파일
                ,{_field:"_imageViewPop",      title:"",   width:60,  attributes:{"class":"ac"}
                    ,template:"<span class='txt_label bg_green' onClick='imageViewPop()'>图片预览</span>"
                }     //미리보기
            ]
        });


        // 파일 그리드 시작
        $("#fileGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    },
                    parameterMap:function(options, operation) {
                        if (operation == "read") {
                            var params = {};
                            params["sFileDocNo"] = $("#fileDocId").val();

                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        fields:{
                            fileDocNo:{type:"string"}
                            ,fileNo:{type:"number"}
                            ,fileNm:{type:"string"}
                            ,fileSize:{type:"number"}
                        }
                    }
                }
            }
           ,autoBind:false
           ,editable:false
           ,height:200
           ,multiSelectWithCheckbox:true
           ,navigatable:false
           ,pageable:false
           ,resizable:false
           ,sortable:false
           ,filterable:false
           ,columns:[
               {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}           // 파일명
              ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"al"}}       // 파일크기
              ,{title:"",width:50,attributes:{"class":"ac"}
                  ,template:"<span class='txt_label bg_blue'>下载</span>"//다운로드
               }

           ]
        });
        // 파일 그리드 종료 //



        fileDownload = function(btnId){

            var fileDocNo = $("#headFileDocId").val();
            var fileNo = "";
            if(btnId == "contractFile"){//계약문서
                fileNo = $("#contractFileNo").val();
            }else if(btnId == "bussLicence"){//사업자등록증
                fileNo = $("#bussLicenceNo").val();
            }else if(btnId == "etcFile"){//기타
                fileNo = $("#etcFileNo").val();
            }else if(btnId == "addFile"){//보충자료
                fileNo = $("#addFileNo").val();
            }

            if(fileDocNo == "" || (fileDocNo != "" && fileNo == 0)){
                //TODO[판매] 다국어 처리 필요
                dms.notification.warning("没有添加的文件");
                return;
            }

            dms.fileManager.download(fileDocNo, fileNo);
        };

       //그리드 클릭 이벤트.
       $("#fileGrid tbody").on("click", "tr.k-state-selected td", function (e) {
           var row = $(this).closest("tr");
           var colIdx = $("td", row).index(this);

           if(colIdx == 3){
               var fileGrid = $('#fileGrid').data('kendoExtGrid');
               var dataItem = fileGrid.dataItem(fileGrid.select());

               if(dms.string.isNotEmpty(dataItem)){
                   dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
               }
           }
       });


        //그리드 3번 (심사정보 그리드)
        $("#grid3").kendoExtGrid({
            gridId:"G-SAL-0721-115204"
            ,dataSource:{
                transport:{
                     read:{
                         url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSalesReviewDetJdg.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var grid = $("#grid").data('kendoExtGrid');
                             var selectRow = grid.dataItem(grid.select());

                             var params = {};

                             params["sort"] = options.sort;

                             // 딜러코드
                             params["sDlrCd"] = selectRow.dlrCd;
                             // 등록자
                             params["sUsrId"] = selectRow.usrId;
                             // 일련번호
                             params["sReqSeq"] = selectRow.reqSeq;

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"reqNo",
                          fields:{
                              reqNo:{type:"number", hidden:true}  //요청번호
                              ,pevalId:{type:"string"}                 //심사담당자
                              ,evalDt:{type:"date"}                 //심사일자
                              ,evalRsltYn:{type:"string"}           //심사결과
                              ,remark:{type:"string"}                 //심사평가
                          }
                     }
                 }
            }
            ,height:150  //3line
            ,multiSelectWithCheckbox:false
            ,editable   :false
            ,autoBind:false
            ,navigatable:true
            ,selectable:"row"
            ,pageable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:[
                {field:"reqNo", hidden:true}       // 요청번호
                ,{field:"pevalId", title:"<spring:message code='global.lbl.screeningPrsnnl' />"
                    ,width:80
                    ,attributes:{"class":"ac"}
                }  // 심사담당자
                ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />"
                    ,width:60
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                }  // 심사일자
                ,{field:"evalRsltYn", title:"<spring:message code='global.lbl.evalRslt' />"
                    ,width:55
                    ,attributes:{"class":"ac"}
                }  // 심사결과
                ,{field:"remark", title:"<spring:message code='global.lbl.evalRemark' />"
                    ,width:50
                    ,attributes:{"class":"al"}
                }  // 심사평가
            ]
        });




        //팝업 오픈 ( 이미지 미리보기 )
        imageViewPop = function(e){

            var win = $("#imageViewWindow").data("kendoWindow");
            var grid = $("#grid2").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if(dms.string.isEmpty($("#fileDocNo").val())){
                dms.notification.warning("无预览图片");
            }else {
                //파일정보 가져오기.
                if(selectedItem.fileDocId != null && selectedItem.fileDocId != ""){
                    $.ajax({
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />",
                        data:JSON.stringify({sFileDocNo:selectedItem.fileDocId}),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    }).done(function(result) {

                        var content = "";
                        var fileUrl = "";
                        if(result.total != 0){
                            for(i=0;i<result.total;i++){
                                fileUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+result.data[i].fileDocNo+"&fileNo="+result.data[i].fileNo+"&inline=true";
                                content += "<li>";
                                content += "<img src=\'"+fileUrl+"\' >";
                                content += "</li>";
                            }
                            $("#fileHtml").html("<ul class='img_slider'>" + content + "</ul>");

                            //img_slider
                            var imgSlider = $("ul.img_slider").bxSlider({
                                pager:false,
                                infiniteLoop:false,
                                hideControlOnEnd:true
                            });

                            var sliderSize = $("ul.img_slider>li").size();
                            if(sliderSize < 2){
                                $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").addClass("disabled");
                            }else{
                                $(".bx-controls-direction .bx-prev").addClass("disabled");
                            }
                        }
                    });
                }else {
                    $("#fileHtml").empty(content);
                }

                win.center();
                win.open();
            }
        }


    }); //document.ready End

    //팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
     function viewPopup(){
         var win = $("#detailViewWindow").data("kendoWindow");
         win.center();
         win.open();
     }

     //팝업 오픈 ( 첨부파일 )
     function fileViewPop(){

         var win = $("#fileViewWindow").data("kendoWindow");
         win.center();
         win.open();
     }

     //일괄심사 팝업 오픈
     function evalPopupOpen(){

         var win = $("#evalPopupWindow").data("kendoWindow");
         win.center();
         win.open();
     }

//-->
</script>
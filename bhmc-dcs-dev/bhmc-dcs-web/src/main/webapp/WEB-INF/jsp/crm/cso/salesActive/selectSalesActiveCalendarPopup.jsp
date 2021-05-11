<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 영업활동 스케줄 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.salesActiveAdd" /><!-- 영업활동 등록 --></h1>
            <div class="btn_right">
                <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:14%;">
                    <col style="width:16%;">
                    <col style="width:14%;">
                    <col style="width:13%;">
                    <col style="width:31%;">
                </colgroup>
                <tbody id="salesActiveMgmtForm">
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span></th>
                        <td class="required_area">
                        <div>
                            <input type="hidden" id="salesActiveNo" name="salesActiveNo" data-json-obj="true" />
                            <input type="hidden" id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />
                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                            <input id="custNm" name="custNm" class="form_input form_readonly" disabled  />
                        </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.commMthCd' /><!-- 연락방식 --></span></th>
                        <td class="required_area">
                            <input id="commMthCd" name="commMthCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.commMthCd" />" data-bind="value:commMthCd" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.prefCommNo' /><!-- 선호연락처 --></span></th>
                        <td class="required_area">
                            <input id="prefCommNo" name="prefCommNo" class="form_input numberic" data-json-obj="true" maxlength="14"  required data-name="<spring:message code="global.lbl.prefCommNo" />" data-bind="value:prefCommNo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.planDt' /><!-- 계획일자 --></span></th>
                        <td class="required_area" colspan="3">
                            <div class="form_float">
                                <div class="date_left" style="width:52.5%;">
                                    <input id="planStartDt" name="planStartDt" class="form_datepicker" data-json-obj="true" required type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="crm.lbl.planDt" />" data-bind="value:planStartDt" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right" style="width:47.5%;">
                                    <input id="planEndDt" name="planEndDt" class="form_datepicker" data-json-obj="true" required type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="crm.lbl.planDt" />" data-bind="value:planEndDt" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.salesActiveTpCd' /><!-- 영업활동유형 --></span></th>
                        <td class="required_area">
                            <input id="salesActiveTpCd" name="salesActiveTpCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.salesActiveTpCd" />" data-bind="value:salesActiveTpCd" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.salesActiveDt' /><!-- 실제진행일 --></th>
                        <td colspan="3">
                            <div class="form_float">
                                <div class="date_left" style="width:52.5%;">
                                    <input id="activeStartDt" name="activeStartDt" class="form_datepicker" data-json-obj="true" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="crm.lbl.salesActiveDt" />" data-bind="value:activeStartDt" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right" style="width:47.5%;">
                                    <input id="activeEndDt" name="activeEndDt" class="form_datepicker" data-json-obj="true" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="crm.lbl.salesActiveDt" />" data-bind="value:activeEndDt" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.salesActiveStatCd' /><!-- 영업활동상태 --></span></th>
                        <td class="required_area">
                            <input id="salesActiveStatCd" name="salesActiveStatCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.salesActiveStatCd" />" data-bind="value:salesActiveStatCd" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></th>
                        <td>
                            <input id="pconCustNm" name="pconCustNm" class="form_input" />
                            <input type="hidden" id="pconCustNo" name="pconCustNo" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.pconPrefCommNo' /><!-- 연계인선호연락번호 --></th>
                        <td>
                            <input id="pconPrefCommNo" name="pconPrefCommNo" class="form_input numberic" data-json-obj="true" maxlength="14"  />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                        <td>
                            <input type="text" id="regUsrNm" name="regUsrNm" class="form_input form_readonly" disabled />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></span></th>
                        <td class="required_area">
                            <input type="text" id="scNm" name="scNm" class="form_input form_readonly" disabled />
                            <input type="hidden" id="scId" name="scId" data-json-obj="true" required data-name="<spring:message code="sal.lbl.salesAdvisor" />" data-bind="value:salesAdvisor" />
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></th>
                        <td colspan="5">
                            <input type="text" id="remark" name="remark" class="form_input form_readonly" disabled />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.activeCont' /><!-- 활동내용 --></span></th>
                        <td colspan="5" class="required_area">
                            <input type="text" id="activeCont" name="activeCont" class="form_input" data-json-obj="true" maxlength="1000" required data-name="<spring:message code="crm.lbl.activeCont" />" data-bind="value:activeCont" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.activeRsltCont' /><!-- 활동결과 --></th>
                        <td colspan="5">
                            <input type="text" id="activeRsltCont" name="activeRsltCont" class="form_input" data-json-obj="true" maxlength="1000" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.guideCmmtCont' /><!-- 지도평어내용 --></th>
                        <td colspan="5">
                            <input type="text" id="guideCmmtCont" name="guideCmmtCont" class="form_input" data-json-obj="true" maxlength="1000" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //내방 예약 팝업 -->

    <script type="text/javascript">


        // 영업활동유형 DS
        var salesActiveTpCdDs = [];
        var salesActiveTpCdArr = [];
        <c:forEach var="obj" items="${salesActiveTpCdList}">
            salesActiveTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
            salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        salesActiveTpCdArrVal = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = salesActiveTpCdArr[val];
            }
            return returnVal;
        };

        // 연락방식 DS
        var commMthCdDs = [];
        var commMthCdArr = [];
        <c:forEach var="obj" items="${commMthCdList}">
            commMthCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
            commMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        commMthCdArrVal = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = commMthCdArr[val];
            }
            return returnVal;
        };

        // 영업활동상태 DS
        var salesActiveStatCdDs = [];
        var salesActiveStatCdArr = [];
        <c:forEach var="obj" items="${salesActiveStatCdList}">
            salesActiveStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
            salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        salesActiveStatCdArrVal = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = salesActiveStatCdArr[val];
            }
            return returnVal;
        };



        $(document).ready(function() {

            // 영업활동유형
            $("#salesActiveTpCd").kendoExtDropDownList({
                dataSource:salesActiveTpCdDs
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:" "
                , index:0
            });

            // 연락방식
            $("#commMthCd").kendoExtDropDownList({
                dataSource:commMthCdDs
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:" "
                , index:0
            });

            // 영업활동상태
            $("#salesActiveStatCd").kendoExtDropDownList({
                dataSource:salesActiveStatCdDs
                , dataTextField:"text"
                , dataValueField:"value"
                , index:0
            });

            // 계획일자
            $("#planStartDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });
            $("#planEndDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });

            // 실제진행일
            $("#activeStartDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });
            $("#activeEndDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });


            var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");

            // 저장
            $("#btnSave").kendoButton({
                click:function(e){

                    // validation 시작  TODO 필수값 정해지면 다시 확인 (태그도 수정)
                    if (validator.validate()) {

                        if( $("#planStartDt").data("kendoExtMaskedDateTimePicker").value() > $("#planEndDt").data("kendoExtMaskedDateTimePicker").value() ){
                            // 계획일자  / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.planDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        }

                        var activeStartDt = $("#activeStartDt").data("kendoExtMaskedDateTimePicker").value()
                            , activeEndDt = $("#activeEndDt").data("kendoExtMaskedDateTimePicker").value()
                            , salesActiveStatCd = $("#salesActiveStatCd").data("kendoExtDropDownList").value()
                            , dataValidate = false
                        ;

                        if ( dms.string.isNotEmpty(activeStartDt) || dms.string.isNotEmpty(activeEndDt) || salesActiveStatCd === "02" ) {

                            if( dms.string.isEmpty(activeStartDt) ){
                               dataValidate = true;
                            }

                            if( dms.string.isEmpty(activeEndDt) ){
                               dataValidate = true;
                            }

                            if ( activeEndDt < activeStartDt ){
                                dataValidate = true;
                            }

                            if (dataValidate) {
                                // 실제진행일 을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.salesActiveDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                return false;

                            }

                            if ( salesActiveStatCd !== "02" ) {
                                // 영업활동상태 을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.salesActiveStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                return false;

                            }

                        }

                        var saveData = $("#salesActiveMgmtForm").serializeObject(
                                $("#salesActiveMgmtForm").serializeArrayInSelector("[data-json-obj='true']")
                        )

                        saveData.planStartDt = $("#planStartDt").data("kendoExtMaskedDateTimePicker").value();
                        saveData.planEndDt = $("#planEndDt").data("kendoExtMaskedDateTimePicker").value();
                        saveData.activeStartDt = $("#activeStartDt").data("kendoExtMaskedDateTimePicker").value();
                        saveData.activeEndDt = $("#activeEndDt").data("kendoExtMaskedDateTimePicker").value();

                        console.log("saveData:",JSON.stringify(saveData));
                        //return;

                        $.ajax({
                            url:"<c:url value='/crm/cso/salesActive/multiSalesActiveMgmts.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(result) {

                                if ( dms.string.isNotEmpty(result) ) {
                                    options.callbackFunc("SUCCESS");
                                } else {
                                    // 저장 / 에 실패 하였습니다.
                                    dms.notification.error("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.failedMsg' arguments='${arguMsg}'/>");
                                }

                            }
                        });

                    }
                 // validation 종료


                }

            });

            // 팝업 form 데이터 set
            var options = parent.popupWindow.options.content.data;

            console.log("#options:",options);
    /*
            console.log("totalSchedulerSeq:" + options.totalSchedulerSeq);
            console.log("schedulerSeq:" + options.schedulerSeq);
            console.log("schedulerTp:" + options.schedulerTp);
            console.log("title:" + options.title);
            console.log("start:" + options.start);
     */

            if( dms.string.isNotEmpty(options) ){

                var salesActiveNo = options.schedulerSeq;

                if( dms.string.isEmpty(salesActiveNo) ){

                    // 활동 번호가 없으면 신규 등록하기 위한 값 세팅
                    $("#custNm").val(options.custNm);
                    $("#custNo").val(options.custNo);
                    $("#prefCommNo").val(options.hpNo);
                    $("#planStartDt").data("kendoExtMaskedDateTimePicker").value(options.start);
                    $("#planEndDt").data("kendoExtMaskedDateTimePicker").value(options.start);
                    $("#scId").val(options.scId);
                    $("#scNm").val(options.scNm);

                    if( dms.string.isNotEmpty(options.saleOpptNo) ){

                        console.log('options.saleOpptNo:'+options.saleOpptNo)
                        $("#saleOpptNo").val(options.saleOpptNo);

                    }

                }else if( salesActiveNo >= 1 ){

                    var param = {
                            "sSalesActiveNo":salesActiveNo
                            };

                    console.log(JSON.stringify(param));
                    //return;

                    $.ajax({
                             url:"<c:url value='/crm/cso/salesActive/selectSalesActiveMgmtByKey.do' />"
                            ,data:JSON.stringify(param)      //파라미터
                            ,type:'POST'                        //조회요청
                            ,dataType:'json'                  //json 응답
                            ,contentType:'application/json'   //문자열 파라미터
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                    }).done(function(body) {

                        console.log(body);

                        $("#salesActiveNo").val(body.salesActiveNo);
                        $("#custNo").val(body.custNo);
                        $("#custNm").val(body.custNm);
                        $("#commMthCd").data("kendoExtDropDownList").value(body.commMthCd);
                        $("#prefCommNo").val(body.prefCommNo);
                        $("#planStartDt").data("kendoExtMaskedDateTimePicker").value(body.planStartDt);
                        $("#planEndDt").data("kendoExtMaskedDateTimePicker").value(body.planEndDt);
                        $("#salesActiveTpCd").data("kendoExtDropDownList").value(body.salesActiveTpCd);
                        $("#pconCustNm").val(body.pconCustNm);
                        $("#pconCustNo").val(body.pconCustNo);
                        $("#activeStartDt").data("kendoExtMaskedDateTimePicker").value(body.activeStartDt);
                        $("#activeEndDt").data("kendoExtMaskedDateTimePicker").value(body.activeEndDt);
                        $("#salesActiveStatCd").data("kendoExtDropDownList").value(body.salesActiveStatCd);
                        $("#pconPrefCommNo").val(body.pconPrefCommNo);
                        $("#regUsrNm").val(body.regUsrNm);
                        $("#scId").val(body.scId);
                        $("#scNm").val(body.scNm);
                        $("#remark").val(body.remark);
                        $("#activeCont").val(body.activeCont);
                        $("#activeRsltCont").val(body.activeRsltCont);
                        $("#guideCmmtCont").val(body.guideCmmtCont);


                        // 상태가 종료이면 읽기전용
                        if ( body.salesActiveStatCd === "03" ) {

                            // TODO 영업활동 캘린더(일) 에서 팝업을 오픈한경우 readonly로 변경
                            $("#commMthCd").data("kendoExtDropDownList").enable(false);
                            $("#prefCommNo").attr("disabled", true).addClass('form_readonly');
                            $("#planStartDt").data("kendoExtMaskedDateTimePicker").enable(false);
                            $("#planEndDt").data("kendoExtMaskedDateTimePicker").enable(false);
                            $("#salesActiveTpCd").data("kendoExtDropDownList").enable(false);
                            $("#pconCustNm").attr("disabled", true).addClass('form_readonly');
                            $("#activeStartDt").data("kendoExtMaskedDateTimePicker").enable(false);
                            $("#activeEndDt").data("kendoExtMaskedDateTimePicker").enable(false);
                            $("#salesActiveStatCd").data("kendoExtDropDownList").enable(false);
                            $("#pconPrefCommNo").attr("disabled", true).addClass('form_readonly');
                            $("#activeCont").attr("disabled", true).addClass('form_readonly');
                            $("#activeRsltCont").attr("disabled", true).addClass('form_readonly');
                            $("#guideCmmtCont").attr("disabled", true).addClass('form_readonly');

                            $("#btnSave").data("kendoButton").enable(false);

                        }


                    });

                }

            }

        });
    </script>

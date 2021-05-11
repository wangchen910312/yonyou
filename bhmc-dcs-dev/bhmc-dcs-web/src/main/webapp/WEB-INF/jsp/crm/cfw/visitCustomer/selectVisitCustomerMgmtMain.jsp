<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 전시장 유동량관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.visitCustMng" /><!-- 전시장 유동량관리 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="visitCustMgmtSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                        <button type="button" class="btn_m btn_add" id="visitCustMgmtReset"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                    </div>
                </div>
                <div class="table_form form_width_70per">
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
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input id="sCustNm" name="sCustNm" class="form_input" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="sHpNo" name="sHpNo" class="form_input" maxlength="14" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.visitDt" /><!-- 내방일  --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartVsitDt" name="sStartVsitDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndVsitDt" name="sEndVsitDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.visitStatCd" /><!-- 내방상태 --></th>
                                <td>
                                    <input id="sVsitStatCd" name="sVsitStatCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.resvDt" /><!-- 등록일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="visitCustomerGrid">
                    </div>
                </div>
            </section>
            <!-- //전시장 유동량관리 -->

        <!-- 내방 상세정보 form -->
        <div id="visitCustMgmtInputForm">

            <!-- 내방 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.visitDetlInfo" /><!-- 내방 상세 정보 --></h2>
                    <div class="left_area" id="reVisitLabel">
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span></th>
                                <td>
                                    <input type="hidden" id="vsitNo" name="vsitNo" data-json-obj="true" />
                                    <input type="hidden" id="leadNo" name="leadNo" data-json-obj="true" />
                                <div class="form_search" >
                                    <input type="text" id="custNm" name="custNm" class="form_input" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                    <a href="javascript:;" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="hpNo" name="hpNo" class="form_input numberic" maxlength="14" data-json-obj="true" data-name="<spring:message code="global.lbl.hpNo" />" data-bind="value:hpNo" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <input type="text" id="custNo" name="custNo" data-json-obj="true" class="form_input form_readonly" readonly />
                                </td>
                            </tr>
                            <tr>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //내방 상세 정보 -->

            <!-- 내방 상세 정보 -->
            <section class="group mt10">
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col style="width:20%;">
                            <col style="width:14%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.visitDt' /><!-- 내방일 --></span></th>
                                <td class="required_area">
                                    <input id="vsitDt" name="vsitDt" class="form_datetimepicker" data-json-obj="true" style="width:100%" required type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.vsitDt" />" data-bind="value:vsitDt" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.visitEndDt' /><!-- 내방종료일 --></th>
                                <td>
                                    <input id="vsitEndDt" name="vsitEndDt" class="form_datetimepicker" data-json-obj="true" style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.visitEndDt" />" data-bind="value:visitEndDt" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.withPrsCnt" /><!-- 동행자수 --></span></th>
                                <td class="required_area">
                                    <input id="withPrsnCnt" name="withPrsnCnt" class="form_numeric" data-json-obj="true" style="width:100%" required data-name="<spring:message code="global.lbl.withPrsCnt" />" data-bind="value:withPrsCnt" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.visitPathCd" /><!-- 내방출처 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <input id="vsitSrcCd" name="vsitSrcCd" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="global.lbl.visitPathCd" />" data-bind="value:vsitSrcCd" />
                                        </div>
                                        <div class="form_right">
                                            <input id="vsitSrcDetlCont" name="vsitSrcDetlCont" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.visitPpsCd" /><!-- 내방 목적 --></th>
                                <td>
                                    <input id="vsitGoalCd" name="vsitGoalCd" class="form_comboBox" data-json-obj="true" style="width:100%" data-name="<spring:message code="global.lbl.visitPpsCd" />" data-bind="value:vsitGoalCd" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.visitStatCd" /><!-- 내방상태 --></th>
                                <td>
                                    <input id="vsitStatCd" name="vsitStatCd" class="form_comboBox" data-json-obj="true" style="width:100%" data-name="<spring:message code="global.lbl.visitStatCd" />" data-bind="value:visitStatCd" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.resvDt" /><!-- 예약일시 --></th>
                                <td>
                                    <input id="resvDt" name="resvDt" class="form_datetimepicker form_readonly" data-json-obj="true" style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.resvDt" />" data-bind="value:resvDt" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptYn' /><!-- 판매기회여부 --></th>
                                <td>
                                    <input type="text" id="saleOpptYn" name="saleOpptYn" class="form_input form_readonly" style="width:100%" disabled/>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></th>
                                <td>
                                    <input type="text" id="saleOpptStepCd" name="saleOpptStepCd" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                <td>
                                    <input id="scId" name="scId" class="form_comboBox" data-json-obj="true" style="width:57%" data-name="<spring:message code="sal.lbl.salesAdvisor" />" data-bind="value:scId" />
                                    <button id="btnScSchduler" class="btn_s"><spring:message code="global.btn.viewScheduler" /><!-- 스케줄보기 --></button>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                                <td colspan="5">
                                    <textarea rows="4" cols="" id="remark" name="remark" class="form_textarea" style="width:100%;" maxlength="1000" data-json-obj="true" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                <td>
                                    <input id="regUsrId" name="regUsrId" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <input id="regDt" name="regDt" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //내방 상세 정보 -->

        </div>
        <!-- // 내방 상세정보 form -->


            <script type="text/javascript">

                var isGridReload            // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , visitCustomerMgmtNo   // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , sysDate = "${sysDate}"
                ;

                var popupWindow;            // 고객 검색 팝업
                var messagePopupWindow;     // 메시지 전송

                // 고객 검색 팝업
                $("#custSearch").click(function(){

                    popupWindow = dms.window.popup({
                        windowId:"customerSearchPopup"
                        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                        , content:{
                            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                            , data:{
                                "autoBind":false
                                , "type"  :null
                                , "callbackFunc":function(data){
                                    if(data.length >= 1) {

                                        console.log("고객팝업조회:" , data);

                                        $("#visitCustMgmtReset").click();
                                        $("#custNo").val(data[0].custNo);
                                        $("#custNm").val(data[0].custNm);
                                        $("#hpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                        $("#scId").data("kendoExtDropDownList").value(data[0].mngScId);

                                        popupWindow.close();

                                    }
                                }
                            }
                        }
                    });
                });

                // 폼 초기화
                function initForm(){

                    $("#reVisitLabel").empty();       // 재방문 라벨 초기화
                    $("#vsitNo").val("");
                    $("#leadNo").val("");
                    $("#custNo").val("");
                    $("#custNm").val("");
                    $("#hpNo").data("kendoMaskedTextBox").value("");
                    $("#vsitDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#withPrsnCnt").data("kendoExtNumericTextBox").value("0");
                    $("#vsitSrcCd").data("kendoExtDropDownList").value("");
                    $("#vsitSrcCd").data("kendoExtDropDownList").enable(false);
                    $("#vsitSrcDetlCont").data("kendoExtDropDownList").value("");
                    $("#vsitSrcDetlCont").data("kendoExtDropDownList").enable(false);
                    $("#vsitGoalCd").data("kendoExtDropDownList").value("");
                    $("#vsitStatCd").data("kendoExtDropDownList").value("03");
                    $("#resvDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#scId").data("kendoExtDropDownList").value("");
                    $("#saleOpptYn").val("");
                    $("#saleOpptStepCd").val("");
                    $("#regUsrId").val("");
                    $("#regDt").val("");
                    $("#remark").val("");

                    $("#hpNo").data("kendoMaskedTextBox").enable(true);
                    $("#hpNo").removeClass('form_readonly');
                    $("#remark").attr("disabled", false).removeClass('form_readonly');

                }

                // 내방 상세 조회
                function visitCustomerMgmtByKey(vsitNo){

                    var param = {
                            "sVsitNo":vsitNo
                            };

                    console.log("내방 고객상세 조회 파람:",JSON.stringify(param));
                    //return;

                    $.ajax({
                            url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMgmtByKey.do' />"
                            ,data:JSON.stringify(param)      //파라미터
                            ,type:'POST'                        //조회요청
                            ,dataType:'json'                  //json 응답
                            ,contentType:'application/json'   //문자열 파라미터
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                    }).done(function(body) {

                        console.log("내방 고객상세 조회 결과:",body);

                        initForm();

                        if(body.reVisitYn == "Y"){
                            $("#reVisitLabel").append("<span class='txt_label bg_green'><spring:message code='global.lbl.revisit' /></span>");    // 재방문
                        }

                        $("#vsitNo").val(body.vsitNo);
                        $("#leadNo").val(body.leadNo);
                        $("#custNo").val(body.custNo);
                        $("#custNm").val(body.custNm);
                        $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);

                        $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(body.vsitDt);
                        $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(body.vsitEndDt);
                        $("#withPrsnCnt").data("kendoExtNumericTextBox").value(body.withPrsnCnt);

                        console.log("vsitSrcCd:" + body.vsitSrcCd)
                        if ( dms.string.isNotEmpty(body.vsitSrcCd) ) {



                            $("#vsitSrcCd").data("kendoExtDropDownList").enable(true);
                            $("#vsitSrcCd").data("kendoExtDropDownList").value(body.vsitSrcCd);

                        }


                        var vsitSrcDetlCont = $("#vsitSrcDetlCont").data("kendoExtDropDownList");
                        // 내방출처가 캠페인인경우 내방출처 상세 정보 set
                        if(body.vsitSrcCd == "01"){
                                vsitSrcDetlCont.setDataSource(vsitSrcDetlContDs);
                                vsitSrcDetlCont.enable(true);
                                vsitSrcDetlCont.value(body.vsitSrcDetlCont);
                        }else{
                            vsitSrcDetlCont.setDataSource([]);
                            vsitSrcDetlCont.enable(false);
                        }

                        $("#vsitGoalCd").data("kendoExtDropDownList").value(body.vsitGoalCd);

                        $("#resvDt").data("kendoExtMaskedDateTimePicker").value(body.resvDt);

                        $("#saleOpptYn").val(body.saleOpptYn);


                        $("#scId").data("kendoExtDropDownList").value(body.scId);
                        $("#regUsrId").val(body.regUsrNm);
                        $("#regDt").val(body.regDt);

                        $("#remark").val(body.remark);

                        var vsitStatCd = body.vsitStatCd;
                        console.log("vsitStatCd:"+vsitStatCd)

                        /*
                        // 내방상태가 예약이 아니면 읽기전용???
                        if(vsitStatCd != "01"){
                            $("#vsitStatCd").data("kendoExtDropDownList").readonly();
                        }else{
                            $("#vsitStatCd").data("kendoExtDropDownList").enable(true);

                        }
                        */

                        $("#vsitStatCd").data("kendoExtDropDownList").value(vsitStatCd);

                    });

                }

                /******************************************************************************/
                /**********************내방이력 그리드 컬럼 데이터  설정 시작***************************/
                /******************************************************************************/
                // 내방상태
                var vsitStatCdDs = [];
                var vsitStatCdArr = [];
                <c:forEach var="obj" items="${vsitStatCdList}">
                    vsitStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    vsitStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                vsitStatCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = vsitStatCdArr[val];
                    }
                    return returnVal;
                };

                // 내방목적
                var vsitGoalCdDs = [];
                var vsitGoalCdArr = [];
                <c:forEach var="obj" items="${vsitGoalCdList}">
                    vsitGoalCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    vsitGoalCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                vsitGoalCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = vsitGoalCdArr[val];
                    }
                    return returnVal;
                };

                // 내방출처
                var vsitSrcCdDs = [];
                var vsitSrcCdArr = [];
                <c:forEach var="obj" items="${vsitSrcCdList}">
                    vsitSrcCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    vsitSrcCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                vsitSrcCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = vsitSrcCdArr[val];
                    }
                    return returnVal;
                };

                /******************************************************************************/
                /**********************내방이력 그리드 컬럼 데이터  설정 종료***************************/
                /******************************************************************************/

                // 잠재/보유고객
                var custCdArr = [];
                <c:forEach var="obj" items="${custCdList}">
                    custCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custCdArr[val];
                    }
                    return returnVal;
                };

                // 내방출처 상세
                var vsitSrcDetlContDs = [];
                <c:forEach var="obj" items="${vsitSrcDetlContList}">
                    vsitSrcDetlContDs.push({text:"${obj.makNm}", value:"${obj.makCd}"});
                </c:forEach>

                // 판매고문
                var usersDS = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                </c:forEach>

                $(document).ready(function() {


                    // s휴대전화
                    $("#sHpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // 내방 시작일
                    $("#sStartVsitDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 내방 종료일
                    $("#sEndVsitDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 내방 상태
                    $("#sVsitStatCd").kendoExtDropDownList({
                        dataSource:vsitStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 담당자
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // 등록 시작일
                    $("#sStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 등록 종료일
                    $("#sEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 휴대전화
                    $("#hpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });

                    // 방문 일시
                    $("#vsitDt").kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,value:sysDate
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 내방종료일
                    $("#vsitEndDt").kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 내방 예약 일시
                    $("#resvDt").kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#resvDt").data("kendoExtMaskedDateTimePicker").readonly();

                    // 내방출처
                    $("#vsitSrcCd").kendoExtDropDownList({
                        dataSource:vsitSrcCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                        , select:function(e) {

                            var dataItem = this.dataItem(e.item);
                            var vsitSrcDetlCont = $("#vsitSrcDetlCont").data("kendoExtDropDownList");

                            // 내방출처가 캠페인인경우 내방출처 상세 DS set
                            if(dataItem.value == "01"){
                                vsitSrcDetlCont.setDataSource(vsitSrcDetlContDs);
                                vsitSrcDetlCont.enable(true);
                            }else{
                                vsitSrcDetlCont.setDataSource([]);
                                vsitSrcDetlCont.enable(false);
                            }

                        }
                        , enable:false
                    });

                    // 내방출처 상세
                    $("#vsitSrcDetlCont").kendoExtDropDownList({
                        //dataSource:vsitSrcDetlContDs
                         dataTextField:"text"
                        , dataValueField:"value"
                        //, optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                        //, index:0
                        , enable:false
                    });

                    // 내방목적
                    $("#vsitGoalCd").kendoExtDropDownList({
                        dataSource:vsitGoalCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 내방 상태
                    $("#vsitStatCd").kendoExtDropDownList({
                        dataSource:vsitStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:2
                    });

                    // 동행자수
                    $("#withPrsnCnt").kendoExtNumericTextBox({
                         format:"#"
                        ,min:0
                        ,value:0
                    });


                    // 판매고문
                    $("#scId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    $(".tab_area").kendoExtTabStrip({
                        animation:false
                    });

                    // 내방 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#visitCustomerGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                    });


                    var validator = $("#visitCustMgmtInputForm").kendoExtValidator().data("kendoExtValidator");

                    // 내방 상세 정보 저장
                    $("#visitCustMgmtSave").kendoButton({
                        click:function(e){

                            //if (validator.validate()) {

                                if( dms.string.isEmpty($("#custNm").val()) ){
                                    // {고객명}을(를) 입력해주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.custNm' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if( dms.string.isEmpty($("#withPrsnCnt").data("kendoExtNumericTextBox").value()) ){
                                    // {동행자수}을(를) 입력해주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.withPrsCnt' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if( dms.string.isEmpty($("#vsitDt").data("kendoExtMaskedDateTimePicker").value()) ){
                                    // {내방일}을(를) 입력해주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.visitDt' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if( $("#vsitSrcCd").val() === "01" ){

                                    if( dms.string.isEmpty($("#vsitSrcDetlCont").val()) ){
                                        // 내방출처 상세 / 을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.vsitSrcDetlCd' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                    }

                                }

                                if($("#vsitNo").val() == 0 && $("#vsitStatCd").data("kendoExtDropDownList").value() === "02" ){
                                    // 내방상태를 취소로 등록 할 수 없습니다.
                                    dms.notification.warning("<spring:message code='crm.err.visitStatNOTcancel' />");
                                    return;
                                }

                                // TODO[이인문] 내방일 / 예약일 / 내방상태 validation BIZ 에서도 체크!
                                var vsitDt = $("#vsitDt").data("kendoExtMaskedDateTimePicker").value();
                                var resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
                                var vsitEndDt = $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value();

                                // 내방일을 입력한경우 내방상태 확인
                                if( dms.string.isNotEmpty(vsitDt) ){

                                    /*
                                    if( dms.string.isNotEmpty(vsitEndDt) ){

                                        if(vsitEndDt < vsitDt){
                                            // 내방종료일 / 을(를) 확인하여 주세요.
                                            dms.notification.warning("<spring:message code='global.lbl.visitEndRealDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                            return;
                                        }

                                    }
                                     */

                                    // 내방일이 있는경우 내방상태는 내방 필수
                                    if( $("#vsitStatCd").val() === "01" ){
                                        // 내방상태 / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.visitStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                    }

                                }

                                // 내방일종료일 입력한경우 내방상태 확인
                                if( dms.string.isNotEmpty(vsitEndDt)){

                                    if( dms.string.isEmpty(vsitDt) ){
                                        // 내방일 / 을(를) 입력해주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.visitDt' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                        return;
                                    }

                                    if(vsitEndDt <= vsitDt){
                                        // 내방종료일 / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.visitEndRealDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                    }

                                    // 내방일이 있는경우 내방상태는 내방 필수
                                    if( $("#vsitStatCd").val() === "01" ){
                                        // 내방상태 / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.visitStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                    }


                                }

                                // 내방상태가 내방일경우 내방일 필수
                                if( $("#vsitStatCd").val() === "03" ){
                                    if( dms.string.isEmpty(vsitDt) ){
                                        // 내방일 / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.visitDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                    }
                                }

                                var saveFormData = $("#visitCustMgmtInputForm").serializeObject(
                                        $("#visitCustMgmtInputForm").serializeArrayInSelector("[data-json-obj='true']")
                                    )
                                saveFormData.resvDt = resvDt;
                                saveFormData.vsitDt = vsitDt;
                                saveFormData.vsitEndDt = vsitEndDt;

                                console.log("saveData:" + JSON.stringify(saveFormData));
                                //return;

                                // 관심차 정보가 있을경우 validation 체크

                                var saveGridData = {};
                                var saveData = $.extend(
                                        {"visitCustomerVO":saveFormData}
                                        , saveGridData
                                )

                                console.log("visit saveData:" + JSON.stringify(saveData))
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/cfw/visitCustomer/multiVisitCustomerMgmt.do' />",
                                    data:JSON.stringify(saveData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        console.log("저장완료---------");

                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR > 0 ){
                                            // 저장 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                            $("#visitCustomerGrid").data("kendoExtGrid").dataSource.page(1);
                                            var vsitNo = jqXHR;
                                            isGridReload = true;
                                            visitCustomerMgmtNo = vsitNo;

                                        }else{
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                });
                                // ajax 종료

                            //}
                            // validatrion 종료


                        }
                    });

                    // 추가 ( 초기화 )
                    $("#visitCustMgmtReset").kendoButton({
                        click:function(e){

                            initForm();


                            // 추가 시 초기화 후 내방일 / 내방출처 / 예약일 / 상담시간 설정

                            $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(sysDate);
                            /*
                            $("#resvDt").data("kendoExtMaskedDateTimePicker").value(sysDate);
                            $("#vsitSrcCd").data("kendoExtDropDownList").value("02");        // 내방(현장)
                             */

                        }
                    });


                    // 스케줄보기
                    $("#btnScSchduler").kendoButton({
                        click:function(e) {

                            var scId = $("#scId").val();

                            if( dms.string.isEmpty(scId) ){
                                //판매고문 / 을(를) 입력해주세요.
                                dms.notification.warning("<spring:message code='sal.lbl.salesAdvisor' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                return;

                            }else{

                                var sScId = scId;

                                //window.open("<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarDayMain.do' />"+"?sScId="+sScId)
                                window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.activeMng' />", "<c:url value='/crm/cso/salesActive/selectSalesActiveCalendarDayMain.do' />"+"?sScId="+sScId); //활동 관리
                            }

                            console.log("scId:"+scId)

                        }
                    });

                    // 내방 그리드 시작
                    $("#visitCustomerGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        var sort= [];
                                        if ( dms.string.isEmpty(options.sort) ) {
                                            //sort = options.sort
                                            sort.push({dir:"desc", field:"vsitMgmt"});
                                        } else {
                                            sort = options.sort;
                                        }
                                        params["sort"] = sort;

                                        params["sCustNm"] = $("#sCustNm").val();
                                        params["sHpNo"] = $("#sHpNo").data("kendoMaskedTextBox").value();
                                        params["sStartVsitDt"] = $("#sStartVsitDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndVsitDt"] = $("#sEndVsitDt").data("kendoExtMaskedDatePicker").value();

                                        params["sScId"] = $("#sScId").data("kendoExtDropDownList").value();
                                        params["sVsitStatCd"] = $("#sVsitStatCd").data("kendoExtDropDownList").value();
                                        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("visitCustomerGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"vsitNo"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,vsitNo:{type:"string"}
                                        ,custNm:{type:"string"}
                                        ,resvDt:{type:"date"}
                                        ,vsitSrcCd:{type:"string"}
                                        ,vsitGoalCd:{type:"string"}
                                        ,vsitDt:{type:"date"}
                                        ,scNm:{type:"string"}
                                        ,regDt:{type:"date"}
                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedVal = this.dataItem(this.select());
                            var vsitNo = selectedVal.vsitNo;

                            if(vsitNo != null && vsitNo != "undefined" ){

                                // 내방 상세 조회
                                visitCustomerMgmtByKey(vsitNo);

                            }

                        }
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var grid        = $("#visitCustomerGrid").data("kendoExtGrid")
                            , rows = grid.tbody.find("tr")
                            , gridData
                            , selectRow
                            , vsitNo;

                            vsitNo = visitCustomerMgmtNo ;

                            if ( isGridReload && dms.string.isNotEmpty(vsitNo) ) {

                                rows.each(function(index, row) {

                                    gridData = grid.dataSource.at(index);

                                    if ( gridData.vsitNo === vsitNo ) {

                                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                        console.log("gridData.vsitNo:" + gridData.vsitNo + " || vsitNo " + vsitNo + " || isGridReload:" + isGridReload + " || selectRow:" ,selectRow );
                                        grid.select(selectRow);
                                    }

                                });

                                isGridReload = false;

                            }

                        }
                        ,editable:false
                        ,height:305
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}                 /* 고객명 */
                            ,{field:"custCd", title:"<spring:message code='global.lbl.custCd' />", width:100                  /* 잠재/보유고객 */
                                , template:'#= custCdArrVal(custCd)#'
                            }
                            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:110}                     /* 휴대전화 */
                            ,{field:"resvDt", title:"<spring:message code='global.lbl.resvDt' />", width:120                /* 예약일시 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"vsitSrcCd", title:"<spring:message code='global.lbl.visitPathCd' />", width:100          /* 내방출처 */
                                , template:'#= vsitSrcCdArrVal(vsitSrcCd)#'
                            }
                            ,{field:"vsitGoalCd", title:"<spring:message code='global.lbl.visitPpsCd' />", width:100          /* 내방목적 */
                                , template:'#= vsitGoalCdArrVal(vsitGoalCd)#'
                            }
                            ,{field:"vsitDt", title:"<spring:message code='global.lbl.visitDt' />", width:120                /* 내방일시 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"scNm", title:"<spring:message code='sal.lbl.salesAdvisor' />", width:100}                 /* 판매고문 */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                        ]
                    });
                    // 내방 그리드 종료


                });

            </script>
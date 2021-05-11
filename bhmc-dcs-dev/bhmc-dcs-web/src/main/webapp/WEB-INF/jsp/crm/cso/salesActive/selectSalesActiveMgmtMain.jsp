<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


            <!-- 영엽활동 관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.salesActiveMgmt' /><!-- 영엽활동관리 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                        <button type="button" class="btn_m btn_add" id="btnAdd" ><spring:message code='global.btn.add' /><!-- 추가 --></button>
                    </div>
                </div>

                <div class="table_form">
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
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveTpCd' /><!-- 영업활동유형 --></th>
                                <td>
                                    <input id="sSalesActiveTpCd" name="sSalesActiveTpCd" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="salesActiveMgmtGrid"></div>
                </div>

            </section>
            <!-- //영엽활동 관리 -->

            <!-- 영엽활동 상세정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.salesActiveInfo' /><!-- 영엽활동 상세정보 --></h2>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:36%;">
                            <col style="width:11%;">
                            <col style="width:15%;">
                            <col style="width:13%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody id="salesActiveMgmtForm" >
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span></th>
                                <td class="required_area">
                                    <div class="form_search" >
                                        <input type="hidden" id="salesActiveNo" name="salesActiveNo" data-json-obj="true" />
                                        <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                        <input id="custNm" name="custNm" class="form_input form_readonly" disabled  />
                                        <a href="javascript:;" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
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
                                <td class="required_area">
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
                                <th scope="row"><spring:message code='global.lbl.relCustInfo' /><!-- 연계인 --></th>
                                <td>
                                    <input id="pconCustNm" name="pconCustNm" class="form_input" />
                                    <input type="hidden" id="pconCustNo" name="pconCustNo" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveDt' /><!-- 실제진행일 --></th>
                                <td>
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
                                <th scope="row"><spring:message code='crm.lbl.pconPrefCommNo' /><!-- 연계인선호연락번호 --></th>
                                <td>
                                    <input id="pconPrefCommNo" name="pconPrefCommNo" class="form_input numberic" data-json-obj="true" maxlength="14"  />
                                </td>
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
                                <td></td>
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
            <!-- //영엽활동 상세정보 -->

            <script type="text/javascript">

                var popupWindow
                    , salesActiveNo
                    , salesActiveMgmtGrid
                    , isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    ;

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

                                        console.log(data);

                                        initForm();

                                        $("#custNo").val(data[0].custNo);
                                        $("#custNm").val(data[0].custNm);
                                        $("#prefCommNo").val(data[0].hpNo);
                                        $("#scId").val(data[0].mngScId);
                                        $("#scNm").val(data[0].mngScNm);

                                        // TODO 연계인 정보 set
                                        popupWindow.close();



                                    }
                                }
                            }
                        }
                    });

                });

                // 판매고문
                var usersDS = [];
                var usersArr = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                    usersArr["${obj.usrId}"] = "${obj.usrNm}";
                </c:forEach>
                usersArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = usersArr[val];
                    }
                    return returnVal;
                };

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

                // 잠재,보유고객
                var custCdMap = [];
                <c:forEach var="obj" items="${custCdList}">
                console.log("obj.cmmCdNm:"+"${obj.cmmCdNm}")
                    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custCdVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custCdMap[val];
                    }
                    return returnVal;
                };

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                    var grid = $("#salesActiveMgmtGrid").data("kendoExtGrid"),
                    row = $(e.target).closest("tr");
                    var dataItem = grid.dataItem(row);

                    window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                });

                // 폼 초기화
                function initForm(){

                    $("#salesActiveNo").val("");
                    $("#custNo").val("");
                    $("#custNm").val("");
                    $("#commMthCd").data("kendoExtDropDownList").value("");
                    $("#commMthCd").data("kendoExtDropDownList").enable(true);
                    $("#prefCommNo").val("").attr("disabled", false).removeClass('form_readonly');
                    $("#planStartDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#planStartDt").data("kendoExtMaskedDateTimePicker").enable(true);
                    $("#planEndDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#planEndDt").data("kendoExtMaskedDateTimePicker").enable(true);
                    $("#salesActiveTpCd").data("kendoExtDropDownList").value("");
                    $("#salesActiveTpCd").data("kendoExtDropDownList").enable(true);
                    $("#pconCustNm").val("").attr("disabled", false).removeClass('form_readonly');
                    $("#pconCustNo").val("");
                    $("#activeStartDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#activeStartDt").data("kendoExtMaskedDateTimePicker").enable(true);
                    $("#activeEndDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#activeEndDt").data("kendoExtMaskedDateTimePicker").enable(true);
                    $("#salesActiveStatCd").data("kendoExtDropDownList").value("");
                    $("#salesActiveStatCd").data("kendoExtDropDownList").enable(true);
                    $("#pconPrefCommNo").val("").attr("disabled", false).removeClass('form_readonly');
                    $("#regUsrNm").val("");
                    $("#scId").val("");
                    $("#scNm").val("");
                    $("#remark").val("");
                    $("#activeCont").val("").attr("disabled", false).removeClass('form_readonly');
                    $("#activeRsltCont").val("").attr("disabled", false).removeClass('form_readonly');
                    $("#guideCmmtCont").val("").attr("disabled", false).removeClass('form_readonly');

                    $("#btnSave").data("kendoButton").enable(true);

                }

                $(document).ready(function() {

                    // 판매고문
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // s영업활동유형
                    $("#sSalesActiveTpCd").kendoExtDropDownList({
                        dataSource:salesActiveTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

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

//                     var sActiveDt = $("#sActiveDt").data("kendoExtMaskedDatePicker");
//                     sActiveDt.enable(false);

                    // 휴대전화
//                     $("#sHpNo").kendoMaskedTextBox({
//                         mask:"00000000000000"
//                         , promptChar:" "
//                     });


                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#salesActiveMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                    });

                    var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");

                    // 저장
                    $("#btnSave").kendoButton({
                        click:function(e){


                            // validation 시작  TODO 필수값 정해지면 다시 확인 (태그도 수정)
                            if (validator.validate()) {

                                if( $("#planStartDt").data("kendoExtMaskedDateTimePicker").value() > $("#planEndDt").data("kendoExtMaskedDateTimePicker").value() ){
                                    // 계획일자 / 을(를) 확인하여 주세요.
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
                                    success:function(jqXHR, textStatus) {

                                        console.log("jqXHR:" ,jqXHR)
                                        console.log("textStatus:" ,textStatus)
                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR > 0 ){

                                            // 저장 / 이 완료 되었습니다.
                                            dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                            $("#salesActiveMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                                            resultKey = jqXHR;
                                            isGridReload = true;


                                        }else{
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                });

                            }
                            // validation 종료

                        }
                    });

                    // 추가
                    $("#btnAdd").kendoButton({
                        click:function(e){
                            initForm();
                        }
                    });

                    // 영업활동 그리드 시작
                    $("#salesActiveMgmtGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesActive/selectSalesActiveMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sScId"] = $("#sScId").data("kendoExtDropDownList").value();
                                        params["sSalesActiveTpCd"] = $("#sSalesActiveTpCd").data("kendoExtDropDownList").value();
                                        params["sCustNm"] = $("#sCustNm").val();

                                        console.log("salesActiveMgmtGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"salesActiveNo"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,salesActiveNo:{type:"string"}
                                        ,scNm:{type:"string"}
                                        ,salesActiveStatCd:{type:"string"}
                                        ,planStartDt:{type:"date"}
                                        ,planEndDt:{type:"date"}
                                        ,activeStartDt:{type:"date"}
                                        ,activeEndDt:{type:"date"}
                                        ,salesActiveTpCd:{type:"string"}
                                        ,activeCont:{type:"string"}
                                        ,activeRsltCont:{type:"string"}
                                        ,saleOpptNo:{type:"string"}
                                        ,custNm:{type:"string"}
                                        ,prefCommNo:{type:"string"}
                                        ,regDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            salesActiveNo = selectedItem.salesActiveNo;

                            if (dms.string.isNotEmpty(salesActiveNo)) {

                                var param = {
                                        "sSalesActiveNo":salesActiveNo
                                        };

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

                                    console.log("영업활동관리 상세 조회 결과:",body);

                                    initForm();

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
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var grid = $("#salesActiveMgmtGrid").data("kendoExtGrid")
                            , rows = grid.tbody.find("tr")
                            , gridData
                            , selectRow

                            //console.log("isGridReload:" + isGridReload);

                            if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {

                                rows.each(function(index, row) {

                                    gridData = grid.dataSource.at(index);

                                    if ( gridData.salesActiveNo === resultKey ) {

                                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                        grid.select(selectRow);
                                    }

                                });

                                isGridReload = false;

                            }

                        }
                        ,editable:false
                        ,height:265
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"salesActiveStatCd", title:"<spring:message code='crm.lbl.salesActiveStatCd' />", width:100       /* 영업활동상태 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= salesActiveStatCdArrVal(salesActiveStatCd)#'
                            }
                            ,{field:"planStartDt", title:"<spring:message code='crm.lbl.planStartDt' />", width:120                   /* 계획시작일자 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"planEndDt", title:"<spring:message code='crm.lbl.planEndDt' />", width:120                       /* 계획종료일자 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"salesActiveTpCd", title:"<spring:message code='crm.lbl.salesActiveTpCd' />", width:100           /* 영업활동유형 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= salesActiveTpCdArrVal(salesActiveTpCd)#'
                            }
                            ,{field:"activeCont", title:"<spring:message code='crm.lbl.activeCont' />", width:100}                    /* 활동내용 */
                            ,{field:"activeRsltCont", title:"<spring:message code='global.lbl.activeRsltCont' />", width:200}         /* 활동결과 */
                            ,{field:"saleOpptNo", title:"<spring:message code='global.lbl.saleOpptSeq' />", width:100}                /* 판매기회번호 */
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100                        // 고객명
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            ,{field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                , template:'#= custCdVal(custCd)#'
                            }
                            ,{field:"prefCommNo", title:"<spring:message code='global.lbl.prefCommNo' />", width:100}                 /* 선호연락처 */
                        ]
                    });
                    // 영업활동 그리드 종료

                });

            </script>
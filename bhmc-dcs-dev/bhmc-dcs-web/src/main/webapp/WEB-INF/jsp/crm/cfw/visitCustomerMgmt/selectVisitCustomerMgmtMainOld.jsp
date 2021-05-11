<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


            <!-- 내방 고객 관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.title.visitCustomerMgmt" /><!-- 내방 고객 관리 --></h1>
                    <div class="btn_right">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </div>
                </div>
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:20%;">
                            <col style="width:12%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>

                            <%-- <c:if test="${isManager}"> --%>
                                <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 담당SC --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" >
                                </td>
                                <script>

                                    // SC 목록
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

                                    $("#sScId").kendoExtDropDownList({
                                        dataSource:usersDS
                                        , dataTextField:"usrNm"
                                        , dataValueField:"usrId"
                                        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                                        , index:0
                                    });

                                </script>
                            <%-- </c:if> --%>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input id="sCustNm" name="sCustNm" class="form_input" maxlength="40" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.visitDt" /><!-- 내방일  --></th>
                                <td>
                                    <input id="sStartVisitDt" name="sStartVisitDt" class="form_datetimepicker" style="width:40%" >
                                     ~
                                    <input id="sEndVisitDt" name="sEndVisitDt" class="form_datetimepicker" style="width:40%" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="grid">
                    </div>
                </div>
            </section>
            <!-- //내방 고객 관리 -->

            <!-- 내방 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.title.visitDetlInfo" /><!-- 내방 상세 정보 --></h1>
                    <div class="btn_right">
                        <button id="visitCustMgmtReset" class="btn_s btn_reset"><spring:message code="global.btn.init" /><!-- 초기화 --></button>
                        <button id="visitCustMgmtCancel" class="btn_s"><spring:message code="global.lbl.resvCancel" /><!-- 예약취소 --></button>
                        <button id="visitCustMgmtSave" class="btn_s btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    </div>
                </div>
                <div class="table_form">
                <form id="visitCustMgmtInputForm" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:18%;">
                            <col style="width:32%;">
                            <col style="width:18%;">
                            <col style="width:32%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!--고객명  --></span></th>
                                <td class="required_area">
                                    <input type="hidden" id="visitSeq" name="visitSeq" >
                                    <input type="hidden" id="custNo" name="custNo" >
                                    <input id="custNm" name="custNm" class="form_input" style="width:50%" >
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></span></th>
                                <td class="required_area">
                                    <input id="hpNo" name="hpNo" class="form_input numberic" style="width:50%" maxlength="40" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.resvDt" /><!-- 예약일시 --></th>
                                <td>
                                    <input id="resvDt" name="resvDt" class="form_datetimepicker" style="width:50%" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.csltTmCd" /><!-- 상담시간 --></span></th>
                                <td class="required_area">
                                    <input id="csltTmCd" name="csltTmCd" class="form_comboBox" style="width:50%" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 담당 SC --></th>
                                <td>
                                    <!-- <input id="scNm" name="scNm" class="form_comboBox" style="width:50%" /> -->
                                    <input id="scId" name="scId" class="form_comboBox" style="width:50%" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.visitPathCd" /><!-- 내방 출처 --></span></th>
                                <td class="required_area">
                                    <input id="visitPathCd" name="visitPathCd" class="form_comboBox" style="width:50%" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.visitDt' /><!-- 내방일시 --></th>
                                <td>
                                    <input id="visitDt" name="visitDt" class="form_datetimepicker" style="width:50%" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.visitReasonCd" /><!-- 내방 사유 --></span></th>
                                <td class="required_area">
                                    <input id="visitReasonCd" name="visitReasonCd" class="form_comboBox" style="width:50%" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                                <td colspan="3">
                                    <textarea rows="4" cols="" id="remark" name="remark" class="form_textarea" style="width:100%;" maxlength="4000" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.cancReasonCd" /><!-- 취소사유 --></th>
                                <td colspan="3">
                                    <input id="cancReasonCd" name="cancReasonCd" class="form_comboBox" style="width:100%" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.cancReasonDetlCont" /><!-- 취소상세 --></th>
                                <td colspan="3">
                                    <textarea id="cancReasonDetlCont" name="cancReasonDetlCont" rows="3" cols="30" class="form_textarea" style="width:100%;" maxlength="100" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                <td>
                                    <input id="regUsrId" name="regUsrId" readonly class="form_input form_readonly" style="width:50%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <input id="regDt" name="regDt" readonly class="form_input form_readonly" style="width:50%" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                </div>
            </section>
            <!-- //내방 상세 정보 -->


            <script type="text/javascript">

                // 폼 초기화
                function initForm(){

                    $("#visitSeq").val("");
                    $("#custNo").val("");
                    $("#custNm").val("");
                    $("#hpNo").data("kendoMaskedTextBox").value("");
                    $("#resvDt").data("kendoDateTimePicker").value("");
                    $("#csltTmCd").data("kendoExtDropDownList").value("");
                    //$("#scNm").val("");
                    $("#scId").data("kendoExtDropDownList").value("");
                    $("#visitPathCd").data("kendoExtDropDownList").value("");
                    $("#visitDt").data("kendoDateTimePicker").value("");
                    $("#visitReasonCd").data("kendoExtDropDownList").value("");
                    $("#remark").val("");
                    $("#cancReasonCd").data("kendoExtDropDownList").value("");
                    $("#cancReasonDetlCont").val("");
                    $("#regUsrId").val("");
                    $("#regDt").val("");

                }

                $(document).ready(function() {

                    // 시승 예약 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#grid").data("kendoExtGrid").dataSource.page(1);
                        }
                    });


			        // 휴대전화
			        $("#hpNo").kendoMaskedTextBox({
			            mask:"00000000000000"
						, promptChar:" "
					});
			        $("#hpNo").focusout(function(){
			            $(this).val($.trim($(this).val()));
			        });

                    // 담당SC
                    $("#scId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                        , index:0
                    });


                    // 내방 시작일
                    $("#sStartVisitDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 내방 종료일
                    $("#sEndVisitDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 예약 일시
                    $("#resvDt").kendoDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                    });
                    var resvDtKdtp = $("#resvDt").data("kendoDateTimePicker");
                    resvDtKdtp.readonly();

                    // 상담 시간
                    var csltTmDs = [];
                    <c:forEach var="obj" items="${csltTmCdList}">
                        csltTmDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    </c:forEach>
                    $("#csltTmCd").kendoExtDropDownList({
                        dataSource:csltTmDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                        , index:0
                    });

                    var sysDate = new Date("<c:out value='${sysDate}' />");

                    // 방문 일시
                    $("#visitDt").kendoDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,value:sysDate
                    });

                    // 내방 출처
                    var visitPathCdDs = [];
                    var visitPathCdArr = [];
                    <c:forEach var="obj" items="${visitPathCdList}">
                        visitPathCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        visitPathCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    $("#visitPathCd").kendoExtDropDownList({
                        dataSource:visitPathCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                        , index:0
                    });
                    // grid - 내방 출처
                    visitPathCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = visitPathCdArr[val];
                        }
                        return returnVal;
                    };

                    // 내방 사유
                    var visitReasonCdDs = [];
                    var visitReasonCdArr = [];
                    <c:forEach var="obj" items="${visitReasonCdList}">
                        visitReasonCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        visitReasonCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    $("#visitReasonCd").kendoExtDropDownList({
                        dataSource:visitReasonCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                        , index:0
                    });
                    // grid - 내방 출처
                    visitReasonCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = visitReasonCdArr[val];
                        }
                        return returnVal;
                    };

                    // 취소 사유
                    var cancReasonCdDs = [];
                    <c:forEach var="obj" items="${cancReasonCdList}">
                        cancReasonCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    </c:forEach>
                    $("#cancReasonCd").kendoExtDropDownList({
                        dataSource:cancReasonCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                        , index:0
                    });


                    // 내방 상세 정보 저장
                    $("#visitCustMgmtSave").kendoButton({
                        click:function(e){

                            if($("#custNo").val() == "" || $("#hpNo").data("kendoMaskedTextBox").value() == "" || $("#resvDt").val() == "" || $("#csltTmCd").val() == "" || $("#visitPathCd").val() == "" || $("#visitReasonCd").val() == "" ){
                                // 내방정보 / 을(를) 확인하여 주세요.
                                dms.notification.info("<spring:message code='global.lbl.visitInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                return;
                            }

                            if($("#cancReasonCd").val() != "" || $("#cancReasonDetlCont").val() != ""){
                                // 예약취소 / 을(를) 선택해주세요.
                                dms.notification.info("<spring:message code='global.lbl.resvCancel' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;
                            }

                            var saveData = $("#visitCustMgmtInputForm").serializeObject();
                            saveData.resvDt = $("#resvDt").data("kendoDateTimePicker").value();
                            saveData.visitDt = $("#visitDt").data("kendoDateTimePicker").value();
                            console.log("saveData:" + JSON.stringify(saveData));
                            //return;

                            $.ajax({
                                url:"<c:url value='/crm/cfw/visitCustomerMgmt/updateVisitCustomerMgmt.do' />",
                                data:JSON.stringify(saveData),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(jqXHR, textStatus) {

                                    // 저장 / 이 완료 되었습니다.
                                    dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                                    initForm();
                                }
                            });

                        }
                    });

                    // 내방 상세 정보 초기화
                    $("#visitCustMgmtReset").kendoButton({
                        click:function(e){
                            initForm();
                        }
                    });

                    // 내방 예약 취소
                    $("#visitCustMgmtCancel").kendoButton({
                        click:function(e){

                            var visitSeq = $("#visitSeq").val();
                            var cancReasonCd = $("#cancReasonCd").val();
                            var cancReasonDetlCont = $("#cancReasonDetlCont").val();

                            if(visitSeq == "" || cancReasonCd == "" || cancReasonDetlCont == ""){
                                // 취소정보 / 을(를) 입력해주세요.
                                dms.notification.info("<spring:message code='global.lbl.resvInfo' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                return;
                            }

                            var saveData = {
                                    visitSeq:visitSeq
                                    ,cancReasonCd:cancReasonCd
                                    ,cancReasonDetlCont:cancReasonDetlCont
                            };

                            console.log("saveData:" + JSON.stringify(saveData));
                            //return;

                            $.ajax({
                                url:"<c:url value='/crm/cfw/visitCustomer/deleteVisitCustomer.do' />",
                                data:JSON.stringify(saveData),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(jqXHR, textStatus) {
                                    // 예약 / 이(가) 취소되었습니다.
                                    dms.notification.success("<spring:message code='global.lbl.resv' var='arguMsg' /><spring:message code='global.info.cancelSuccessParam' arguments='${arguMsg}'/>");
                                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                                    initForm();

                                }
                            });

                        }
                    });

                    //그리드 설정
                    $("#grid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cfw/visitCustomerMgmt/selectVisitCustomerMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sScId"] = $("#sScId").val();
                                        params["sCustNm"] = $("#sCustNm").val();

                                        params["sStartVisitDt"] = $("#sStartVisitDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndVisitDt"] = $("#sEndVisitDt").data("kendoExtMaskedDatePicker").value();

                                        console.log(kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"visitSeq"
                                    ,fields:{
                                        visitSeq:{type:"number", editable:false}
                                        ,regUsrNm:{type:"string", editable:false}
                                        ,resvDt:{type:"date", editable:false}
                                        ,visitDt:{type:"date", editable:false}
                                        ,regDt:{type:"date", editable:false}
                                    }
                                }
                            }
                        }
                        ,multiSelectWithCheckbox:false
                        ,change:function(e){

                            var selectedVal = this.dataItem(this.select());
                            var visitSeq = selectedVal.visitSeq;

                            if(visitSeq != null && visitSeq != "undefined" ){

                                var param = {
                                        "sVisitSeq":visitSeq
                                        };

                                console.log(JSON.stringify(param));
                                //return;

                                $.ajax({
                                        url:"<c:url value='/crm/cfw/visitCustomerMgmt/selectVisitCustomerMgmtByKey.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                        }
                                }).done(function(body) {

                                    console.log(body);

                                    initForm();

                                    $("#visitSeq").val(body.visitSeq);
                                    $("#custNo").val(body.custNo);
                                    $("#custNm").val(body.custNm);
                                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                                    $("#resvDt").data("kendoDateTimePicker").value(body.resvDt);
                                    $("#csltTmCd").data("kendoExtDropDownList").value(body.csltTmCd);
                                    //$("#scNm").val(body.scNm);
                                    //$("#scId").val(body.scId);
                                    $("#scId").data("kendoExtDropDownList").value(body.scId);
                                    $("#visitPathCd").data("kendoExtDropDownList").value(body.visitPathCd);

                                    if(body.visitDt !== null){
                                        $("#visitDt").data("kendoDateTimePicker").value(body.visitDt);
                                    }else{
                                        $("#visitDt").data("kendoDateTimePicker").value(sysDate);
                                    }
                                    $("#visitReasonCd").data("kendoExtDropDownList").value(body.visitReasonCd);
                                    $("#remark").val(body.remark);
                                    $("#cancReasonCd").data("kendoExtDropDownList").value(body.cancReasonCd);
                                    $("#cancReasonDetlCont").val(body.cancReasonDetlCont);
                                    $("#regUsrId").val(body.regUsrId);
                                    $("#regDt").val(body.regDt);

                                });

                            }

                        }
                        ,editable:false
                        ,sortable:false
                        ,columns:[
                             {field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}/* 고객명 */
                            ,{field:"resvDt", title:"<spring:message code='global.lbl.resvDt' />", width:150, attributes:{"class":"ac"}/* 예약일시 */
                                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"visitPathCd", title:"<spring:message code='global.lbl.visitPathCd' />", width:80/* 내방출처 */
                                ,template:'#= visitPathCdArrVal(visitPathCd)#'
                            }
                            ,{field:"visitReasonCd", title:"<spring:message code='global.lbl.visitReasonCd' />", width:80/* 내방사유 */
                                ,template:'#= visitReasonCdArrVal(visitReasonCd)#'
                            }
                            ,{field:"visitDt", title:"<spring:message code='global.lbl.visitDt' />", width:150, attributes:{"class":"ac"}/* 내방일시 */
                                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"scNm", title:"<spring:message code='crm.lbl.scId' />", width:100}/* 담당SC */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150, attributes:{"class":"ac"}/* 등록일 */
                                ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{title:""}
                        ]

                    });


                });

            </script>
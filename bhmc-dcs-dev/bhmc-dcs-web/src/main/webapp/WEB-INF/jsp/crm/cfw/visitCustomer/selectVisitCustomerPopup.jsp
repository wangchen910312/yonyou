<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 내방 예약 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.visitCustomer" /><!-- 내방 예약 --></h1>
            <div class="btn_right">
                <button id="visitSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:22%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody id="visitInputForm">

                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                        <td class="required_area">
                            <input type="text" id="custNm" name="custNm" data-json-obj="true" required disabled data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNo" />
                            <input type="hidden" id="vsitNo" name="vsitNo" data-json-obj="true" />
                            <input type="hidden" id="leadNo" name="leadNo" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></span></th>
                        <td class="required_area">
                            <input id="hpNo" name="hpNo" class="form_numeric" data-json-obj="true" maxlength="14" required data-name="<spring:message code="global.lbl.hpNo" />" data-bind="value:hpNo" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></span></th>
                        <td class="required_area">
                            <input type="hidden" id="scId" name="scId" data-json-obj="true" required data-name="<spring:message code="sal.lbl.salesAdvisor" />" data-bind="value:scId" />
                            <input type="text" id="scNm" name="scNm" class="form_input form_readonly" disabled />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.resvDt" /><!-- 예약일시 --></span></th>
                        <td class="required_area">
                            <input id="resvDt" name="start" class="form_datetimepicker" data-json-obj="true" required type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.resvDt" />" data-bind="value:resvDt" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.csltTmCd" /><!-- 상담시간 --></span></th>
                        <td class="required_area">
                            <input id="csltTmCd" name="csltTmCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.csltTmCd" />" data-bind="value:csltTmCd" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.visitPathCd" /><!-- 내방출처 --></span></th>
                        <td class="required_area" colspan="3" style="white-space:nowrap;">
                            <input id="vsitSrcCd" name="vsitSrcCd" class="form_comboBox" data-json-obj="true" style="width:200px;" required data-name="<spring:message code="global.lbl.visitPathCd" />" data-bind="value:visitPathCd" /><input id="vsitSrcDetlCont" name="vsitSrcDetlCont" class="form_comboBox" data-json-obj="true" style="width:214px;margin-left:5px;" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.visitStatCd" /><!-- 내방상태 --></span></th>
                        <td class="required_area">
                            <input id="vsitStatCd" name="vsitStatCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.visitStatCd" />" data-bind="value:visitStatCd" />
                        </td>
                    </tr>
                    <tr>

                        <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                        <td>
                            <input id="regUsrId" name="regUsrId" class="form_input form_readonly" disabled />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <input id="regDt" name="regDt" class="form_input form_readonly" disabled />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                        <td colspan="5">
                            <textarea id="remark" name="remark" rows="12" cols="30" class="form_textarea" data-json-obj="true" maxlength="1000" ></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //내방 예약 팝업 -->

    <script type="text/javascript">

        // 상담 시간
        var csltTmDs = [];
        <c:forEach var="obj" items="${csltTmCdList}">
            csltTmDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>

        // 내방 출처
        var vsitSrcCdDs = [];
        <c:forEach var="obj" items="${vsitSrcCdList}">
            vsitSrcCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>

        // 내방출처 상세
        var vsitSrcDetlContDs = [];
        <c:forEach var="obj" items="${vsitSrcDetlContList}">
            vsitSrcDetlContDs.push({text:"${obj.makNm}", value:"${obj.makCd}"});
        </c:forEach>

        // 내방상태
        var vsitStatCdDs = [];
        <c:forEach var="obj" items="${vsitStatCdList}">
            vsitStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>


        // 영업활동에서 팝업을 오픈한경우는 readonly
        function readonlyForm(){

            $("#custNm").attr("readonly", true);
            $("#hpNo").data("kendoMaskedTextBox").readonly();
            $("#hpNo").addClass("form_readonly");
            $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(false);

            $("#csltTmCd").data("kendoExtDropDownList").enable(false);
            $("#vsitSrcCd").data("kendoExtDropDownList").enable(false);
            $("#vsitSrcDetlCont").data("kendoExtDropDownList").enable(false);
            $("#vsitStatCd").data("kendoExtDropDownList").enable(false);

            $("#remark").attr("disabled", true).addClass('form_readonly');
            $("#visitSave").data("kendoButton").enable(false);

        }


        $(document).ready(function() {

            // 예약일시
            $("#resvDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });

            // 상담시간
            $("#csltTmCd").kendoExtDropDownList({
                dataSource:csltTmDs
                , dataTextField:"text"
                , dataValueField:"value"
                , index:0
            });

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
            });

            // 내방출처 상세
            $("#vsitSrcDetlCont").kendoExtDropDownList({
                //dataSource:vsitSrcCdDs
                  dataTextField:"text"
                , dataValueField:"value"
                //, optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                //, index:0
                , enable:false
            });


            // 내방상태
            $("#vsitStatCd").kendoExtDropDownList({
                dataSource:vsitStatCdDs
                , dataTextField:"text"
                , dataValueField:"value"
                //, optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                , index:0
            });

            // 휴대전화
            $("#hpNo").kendoMaskedTextBox({
                mask:"00000000000000"
    			, promptChar:" "
    		});

            var validator = $("#visitInputForm").kendoExtValidator().data("kendoExtValidator");

            // 방문 예약 저장
            $("#visitSave").kendoButton({
                click:function(e){

                    if (validator.validate()) {

                        if( $("#vsitSrcCd").val() === "01" ){
                            if( dms.string.isEmpty($("#vsitSrcDetlCont").val()) ){
                                // 내방출처 상세 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.vsitSrcDetlCd' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;
                            }
                        }

                        if($("#vsitStatCd").data("kendoExtDropDownList").value() === "03" ){
                            // 내방상태를 방문으로 등록 할 수 없습니다.
                            dms.notification.warning("<spring:message code='crm.err.visitStatNOTvisit' />");
                            return;
                        }

                        if($("#vsitNo").val() == 0 && $("#vsitStatCd").data("kendoExtDropDownList").value() === "02" ){
                            // 내방상태를 취소로 등록 할 수 없습니다.
                            dms.notification.warning("<spring:message code='crm.err.visitStatNOTcancel' />");
                            return;
                        }

                        var saveData =
                            $("#visitInputForm").serializeObject(
                                $("#visitInputForm").serializeArrayInSelector("[data-json-obj='true']")
                            );

                        // 스케쥴러에서는 name이 무조건 start/end. vo값으로 json 가공함. kendoExtMaskedDateTimePicker 에서는 YYYY-MM-DD HH:MM 으로 보여주고 전송시 :SS 붙임.
                        saveData.resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
                        saveData.custNm = $("#custNm").val();
                        delete saveData.start;
                        console.log("saveData:" + JSON.stringify(saveData));
                        //return;

                        $.ajax({
                            url:"<c:url value='/crm/cfw/visitCustomer/multiVisitCustomers.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {

                                // TODO 등록 / 수정 / 취소 구분
                                options.callbackFunc("SUCCESS");
                                //parent.popupWindow.close();
                            }
                        });


                    }

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

                // 영업활동에서 팝업을 오픈한경우는 readonly
                if ( options.salesActiveYn === "Y" ) {
                    readonlyForm();
                }

                var vsitNo = options.schedulerSeq;

                if( dms.string.isEmpty(vsitNo) ){

                    // 활동 번호가 없으면 신규 등록하기 위한 값 세팅
                    //$("#vsitNo").val("0");
                    $("#leadNo").val(options.leadNo);
                    $("#custNm").val(options.custNm);
                    $("#custNo").val(options.custNo);
                    $("#hpNo").data("kendoMaskedTextBox").value(options.hpNo);
                    $("#resvDt").data("kendoExtMaskedDateTimePicker").value(options.start);
                    $("#scId").val(options.scId);
                    $("#scNm").val(options.scNm);

                    // 리드번호가 있으면 내방 출처:IDCC로 set
                    if(dms.string.isNotEmpty(options.leadNo)){
                        $("#vsitSrcCd").data("kendoExtDropDownList").value("04");
                    }

                }else if( dms.string.isNotEmpty(vsitNo) ){

                    var param = {
                            "sVsitNo":vsitNo
                            };

                    console.log(JSON.stringify(param));
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

                        console.log(body);

                        $("#vsitNo").val(body.vsitNo);
                        $("#leadNo").val(body.leadNo);
                        $("#custNm").val(body.custNm);
                        $("#custNo").val(body.custNo);
                        $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                        $("#resvDt").data("kendoExtMaskedDateTimePicker").value(body.resvDt);

                        $("#csltTmCd").data("kendoExtDropDownList").value(body.csltTmCd);

                        $("#vsitSrcCd").data("kendoExtDropDownList").value(body.vsitSrcCd);
                        var vsitSrcDetlCont = $("#vsitSrcDetlCont").data("kendoExtDropDownList");
                        // 내방출처가 캠페인인경우 내방출처 상세 정보 set

                        if(body.vsitSrcCd == "01"){

                            vsitSrcDetlCont.setDataSource(vsitSrcDetlContDs);

                                // 내방출처 상세.. 영업활동에서 팝업 오픈한경우는 readonly
                                if ( options.salesActiveYn === "Y"  ) {
                                    vsitSrcDetlCont.enable(false);
                                } else {
                                    vsitSrcDetlCont.enable(true);
                                }

                                vsitSrcDetlCont.value(body.vsitSrcDetlCont);
                        }else{
                            vsitSrcDetlCont.setDataSource([]);
                            vsitSrcDetlCont.enable(false);
                        }

                        $("#scId").val(body.scId);
                        $("#scNm").val(body.scNm);


                        $("#vsitStatCd").data("kendoExtDropDownList").value(body.vsitStatCd);
                        $("#regUsrId").val(body.regUsrNm);
                        $("#regDt").val(body.regDt);

                        $("#remark").val(body.remark);

                        // 내방상태가 방문이면 팝업은 readonly
                        if(body.vsitStatCd == "03"){

                            readonlyForm();

                        }

                    });

                }

            }


        });
    </script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="tdrvCancel" class="btn_m btn_disabled"><spring:message code="global.lbl.resvCancel" /></button><!-- 예약취소 -->
            <button id="tdrvResvSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:24%;">
            </colgroup>
            <tbody id="tdrvInputForm">
                <tr>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                    <td class="readonly_area">
                        <input type="text" id="custNm" name="custNm" class="form_input" disabled />
                        <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" />
                        <input type="hidden" id="tdrvSeq" name="tdrvSeq" data-json-obj="true" />
                        <input type="hidden" id="tdrvStatCd" name="tdrvStatCd" data-json-obj="true" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hpNo" /></span></th><!-- 휴대전화 -->
                    <td class="required_area">
                        <input id="hpNo" name="hpNo" class="form_input numberic" data-json-obj="true" maxlength="14" required data-name="<spring:message code="global.lbl.hpNo" />" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.tdrvDt" /></span></th><!-- 시승일시 -->
                    <td class="required_area">
                        <input id="resvDt" name="start" class="form_datetimepicker" data-json-obj="true" required type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.tdrvDt" />" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.tdrvHmCd" /></span></th><!-- 시승시간 -->
                    <td class="required_area">
                        <input id="tdrvHmCd" name="tdrvHmCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.tdrvHmCd" />" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.carId" /></span></th><!-- 시승모델 -->
                    <td class="required_area">
                        <input type="text" id="modelNm" name="modelNm" class="form_input" disabled />
                        <input type="hidden" id="tdrvVinNo" name="tdrvVinNo" data-json-obj="true" required data-name="<spring:message code="crm.lbl.carId" />" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.tdrvClineCd" /></span></th><!-- 시승노선 -->
                    <td class="required_area">
                        <input id="tdrvClineCd" name="tdrvClineCd" class="form_comboBox" data-json-obj="true" style="width:60%" required data-name="<spring:message code="crm.lbl.tdrvClineCd" />" />
                        <button id="tdrvClineView" class="btn_s"><spring:message code="global.lbl.tdrvClineView" /></button><!-- 노선보기 -->
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="crm.lbl.tdrvPathCd" /></th><!-- 시승출처 -->
                    <td>
                        <input id="tdrvPathCd" name="tdrvPathCd" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.driversLicenseNo" /></th><!-- 면허번호 -->
                    <td>
                        <input type="text" id="tdrvLicenseNo" name="tdrvLicenseNo" maxlength="30" class="form_input" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.scId" /></th><!-- 담당 SC -->
                    <td class="readonly_area">
                        <input type="text" id="scNm" name="scNm" class="form_input" disabled />
                        <input type="hidden" id="scId" name="scId" data-json-obj="true" required data-name="<spring:message code="crm.lbl.scId" />" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="crm.lbl.tdrvTpCd" /></th><!-- 시승 타입 -->
                    <td colspan="5">
                <c:forEach var="obj" items="${tdrvTpCdList}" varStatus="status" >
                    <label class="label_check">
                        <input type="radio" id="tdrvTpCd_<c:out value='${obj.cmmCd}' />" name="tdrvTpCd" data-json-obj="true" class="form_check" value="<c:out value='${obj.cmmCd}' />" <c:if test="${status.index == 0}"> checked</c:if> >
                        <c:out value='${obj.cmmCdNm}' />
                    </label>
                </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.memo" /></th><!-- 메모 -->
                    <td colspan="5">
                        <textarea rows="3" cols="" id="remark" name="remark" class="form_textarea" data-json-obj="true" maxlength="4000" ></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.regUsrId" /></th> <!-- 등록자 -->
                    <td class="readonly_area">
                        <input type="text" id="regUsrNm" name="regUsrNm" class="form_input" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.regDt" /></th> <!-- 등록일 -->
                    <td class="readonly_area">
                        <input type="text" id="regDt" name="regDt" class="form_input" disabled />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

            <script id="viewTdrvClineTooltip" type="text/x-kendo-template">
                <div id="viewTdrvClineTmp" class="viewImg_popup" style="display:none">
                </div>
            </script>

    <script type="text/javascript">

        // 시승시간
        var tdrvHmCdDs = [];
        <c:forEach var="obj" items="${tdrvHmCdList}">
           tdrvHmCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
        </c:forEach>

        // 시승노선
        var tdrvClineCdDs = [];
        <c:forEach var="obj" items="${tdrvClineCdList}">
            tdrvClineCdDs.push({text:"${obj.clineNm}", value:"${obj.clineSeq}", fileDocNo:"${obj.fileDocNo}" , fileNo:"${obj.fileNo}"});
        </c:forEach>

        // 시승출처
        var tdrvPathCdDs = [];
        <c:forEach var="obj" items="${tdrvPathCdList}">
            tdrvPathCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
        </c:forEach>

        // 영업활동에서 팝업을 오픈한경우는 readonly
        function readonlyForm(){

            $("#hpNo").data("kendoMaskedTextBox").readonly();
            $("#hpNo").addClass("form_readonly");
            $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(false);

            $("#tdrvHmCd").data("kendoExtDropDownList").enable(false);
            $("#modelNm").attr("disabled", true).addClass('form_readonly');
            $("#tdrvClineCd").data("kendoExtDropDownList").enable(false);
            $("#tdrvPathCd").data("kendoExtDropDownList").enable(false);

            $("#remark").attr("disabled", true).addClass('form_readonly');
            $("#tdrvLicenseNo").attr("disabled", true).addClass('form_readonly');

            $("input:radio").attr("disabled", true);

            $("#tdrvClineView").data("kendoButton").enable(false);
            $("#tdrvCancel").data("kendoButton").enable(false);
            $("#tdrvResvSave").data("kendoButton").enable(false);

        }

        $(document).ready(function() {

            // 휴대전화
            $("#hpNo").kendoMaskedTextBox({
                mask:"00000000000000"
                , promptChar:" "
            });

            // 시승 일시
            $("#resvDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
            });

            // 시승시간
            $("#tdrvHmCd").kendoExtDropDownList({
                dataSource:dms.data.cmmCdFilter(tdrvHmCdDs)
                , dataTextField:"text"
                , dataValueField:"value"
                //, optionLabel:"<spring:message code='global.btn.select' />"   // 선택
                , index:0
            });

            // 시승노선
            $("#tdrvClineCd").kendoExtDropDownList({
                dataSource:dms.data.cmmCdFilter(tdrvClineCdDs)
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:" "
                , index:0
            });

            // 시승출처
            $("#tdrvPathCd").kendoExtDropDownList({
                dataSource:dms.data.cmmCdFilter(tdrvPathCdDs)
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:" "
                , index:0
            });


            // 노선보기 툴팁
            var tooltip = $("#tdrvClineView").kendoTooltip({
                position:"left"
                ,width:400
                ,height:40
                ,content:kendo.template($('#viewTdrvClineTooltip').html())
            }).data("kendoTooltip");

            // 마우스 오버시.
            tooltip.bind("show", function() {

                $("#viewTdrvClineTmp").html("");

                var  tdrvClineCd = $("#tdrvClineCd").data("kendoExtDropDownList")
                    , dataItem = tdrvClineCd.dataItem()
                    , fileDocNo
                    , fileNo
                    , text
                    , strHtml
                ;

                if( dms.string.isNotEmpty(dataItem.fileDocNo) ){

                    //TODO 빈값일때 마우스 오버되면 조그만한 영역 생겼다 사라지는거 잡아야함
                    $("#viewTdrvClineTmp").show();

                    fileDocNo = dataItem.fileDocNo;
                    fileNo = dataItem.fileNo;
                    text = dataItem.text;
                    imgUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + fileDocNo + "&fileNo=" + fileNo;

                    strHtml =
                         '  <div class="header_area">'
                        +'      <h2 class="title_basic"><spring:message code="crm.lbl.tdrvClineCd" /> - '+text+'</h2>'
                        +'  </div>'
                        +'  <div class="img_area">'
                        +'      <img src="'+imgUrl+'" alt="">'
                        +'  </div>';
                    $("#viewTdrvClineTmp").html(strHtml);

                } else {

                    $("#viewTdrvClineTmp").hide();
                }

            });

            var validator = $("#tdrvInputForm").kendoExtValidator().data("kendoExtValidator");

            // 시승 예약 저장
            $("#tdrvResvSave").kendoButton({
                click:function(e){

                    if (validator.validate()) {

                        if( $("#tdrvStatCd").val() === "02" && $("#tdrvStatCd").val() === "03" ){
                            // 시승상태 / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.tdrvStatCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        }

                        var saveData =
                            $("#tdrvInputForm").serializeObject(
                                $("#tdrvInputForm").serializeArrayInSelector("[data-json-obj='true']")
                            );
                        // 스케쥴러에서는 name이 무조건 start/end. vo값으로 json 가공함. kendoExtMaskedDateTimePicker 에서는 YYYY-MM-DD HH:MM 으로 보여주고 전송시 :SS 붙임.
                        saveData.resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
                        delete saveData.start;

                        $.ajax({
                            url:"<c:url value='/crm/cso/testDrive/multiTestDriveResvs.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(result) {

                                if (result === 1) {
                                    options.callbackFunc("SUCCESS");
                                } else {
                                    // 저장 / 에 실패 하였습니다.
                                    dms.notification.error("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.failedMsg' arguments='${arguMsg}'/>");
                                }

                            }
                            ,beforeSend:function(xhr) {
                                dms.loading.show();
                            }
                            ,complete:function(xhr, status) {
                                dms.loading.hide();
                            }
                        });

                    }

                }
            });

            // 시승 예약 취소
            $("#tdrvCancel").kendoButton({
                click:function(e){

                    var tdrvSeq = $("#tdrvSeq").val();

                    if ( tdrvSeq === "0" ) {
                        // 취소정보 / 을(를) 입력해주세요.
                        dms.notification.error("<spring:message code='global.lbl.resvInfo' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                        return;
                    }

                    var saveData = {
                            tdrvSeq:tdrvSeq
                    };

                    $.ajax({
                        url:"<c:url value='/crm/cso/testDrive/cancelTestDriveResv.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(result) {

                            if (result === 1) {
                                options.callbackFunc("CANCEL");
                            } else {
                                // 저장 / 에 실패 하였습니다.
                                dms.notification.error("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.failedMsg' arguments='${arguMsg}'/>");
                            }

                        }
                        ,beforeSend:function(xhr) {
                            dms.loading.show();
                        }
                        ,complete:function(xhr, status) {
                            dms.loading.hide();
                        }
                    });

                }
                , enable:false
            });

            // 시승 노선 보기
            $("#tdrvClineView").kendoButton({
                click:function(e){

                    var tdrvClineCd = $("#tdrvClineCd").val();

                    if(tdrvClineCd === ""){
                        // 시승노선 / 을(를) 선택해주세요.
                        dms.notification.error("<spring:message code='crm.lbl.tdrvClineCd' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    }
                }
            });


            // 팝업 form 데이터 set
            var options = parent.popupWindow.options.content.data;

            /*
            console.log("schedulerSeq:" + options.schedulerSeq);
            console.log("custNo:" + options.custNo);
            console.log("custNm:" + options.custNm);
            console.log("hpNo:" + options.hpNo);
            console.log("start:" + options.start);
            */

            if( dms.string.isNotEmpty(options) ){
                // 영업활동에서 팝업을 오픈한경우는 readonly
                if ( options.salesActiveYn === "Y" ) {
                    readonlyForm();
                }

                var tdrvSeq = options.schedulerSeq;

                if( dms.string.isEmpty(tdrvSeq) || tdrvSeq === "0" ){     // dms.string.isEmpty(tdrvSeq):영업활동 스케줄에서는 tdrvSeq 타입이 string 이기 때문에 isEmpty 해줘야함

                    // 활동 번호가 없으면 신규 등록하기 위한 값 세팅
                    $("#tdrvSeq").val(tdrvSeq);
                    $("#custNm").val(options.custNm);
                    $("#custNo").val(options.custNo);
                    $("#hpNo").data("kendoMaskedTextBox").value(options.hpNo);
                    $("#resvDt").data("kendoExtMaskedDateTimePicker").value(options.start);
                    $("#modelNm").val(options.modelNm);
                    $("#tdrvVinNo").val(options.tdrvVinNo);
                    $("#scId").val(options.scId);
                    $("#scNm").val(options.scNm);

                } else if ( tdrvSeq > 0 ) {

                    var param = {
                            "sTdrvSeq":tdrvSeq
                            };

                    //console.log(JSON.stringify(param));
                        //return;

                    $.ajax({
                            url:"<c:url value='/crm/cso/testDrive/selectTestDriveResvByKey.do' />"
                            ,data:JSON.stringify(param)      //파라미터
                            ,type:'POST'                        //조회요청
                            ,dataType:'json'                  //json 응답
                            ,contentType:'application/json'   //문자열 파라미터
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                            }
                    }).done(function(body) {

                        //console.log(body);

                        $("#tdrvSeq").val(body.tdrvSeq);
                        $("#tdrvStatCd").val(body.tdrvStatCd);
                        $("#custNm").val(body.custNm);
                        $("#custNo").val(body.custNo);
                        $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                        $("#resvDt").data("kendoExtMaskedDateTimePicker").value(body.resvDt);
                        $("#tdrvHmCd").data("kendoExtDropDownList").value(body.tdrvHmCd);
                        $("#tdrvVinNo").val(body.tdrvVinNo);
                        $("#modelNm").val(body.modelNm);
                        $("#tdrvClineCd").data("kendoExtDropDownList").value(body.tdrvClineCd);
                        $("#tdrvPathCd").data("kendoExtDropDownList").value(body.tdrvPathCd);
                        $("#scId").val(body.scId);
                        $("#scNm").val(body.scNm);
                        $("input:radio[id='tdrvTpCd_"+body.tdrvTpCd+"']").prop("checked", true);
                        $("#remark").val(body.remark);
                        $("#regUsrNm").val(body.regUsrNm);
                        $("#regDt").val(body.regDt);
                        $("#tdrvLicenseNo").val(body.tdrvLicenseNo)

                        // 수정일경우
                        if(options.salesActiveYn !== "Y" && body.tdrvSeq > 0){
                            var tdrvCancelButton = $("#tdrvCancel").data("kendoButton") ;
                            tdrvCancelButton.enable(true);
                            $("#tdrvCancel").removeClass("btn_disabled");
                        }

                        // 시승상태가 시승이면 팝업은 readonly
                        if(body.tdrvStatCd === "03"){
                            readonlyForm();
                        }

                    });

                }

            }

        });
    </script>

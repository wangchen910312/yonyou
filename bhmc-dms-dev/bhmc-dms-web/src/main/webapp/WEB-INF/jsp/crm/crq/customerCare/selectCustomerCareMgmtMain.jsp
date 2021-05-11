<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">
            <!-- 고객케어 관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.custCareMgmt' /><!-- 고객케어 관리 --></h1>
                    <div class="btn_right">
                        <!-- // ************************** 그리드 팝업 호출 / 팝업 버튼 추가 **************************** -->
                    <dms:access viewId="VIEW-D-11359" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnViewAdd" class="btn_m btn_add"><spring:message code='global.btn.add' /><!-- 추가 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11360" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                    </dms:access>
                        <!-- // ************************** 그리드 팝업 호출 / 팝업 버튼 추가 **************************** -->
                    <dms:access viewId="VIEW-D-11361" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11362" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_delete" id="btnDelete" ><spring:message code='global.btn.del' /><!-- 삭제 --></button>
                    </dms:access>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.custCareNm' /><!-- 고객케어명 --></th>
                                <td>
                                    <input type="text" id="sCustCareNm" name="sCustCareNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></th>
                                <td>
                                    <input id="sActiveTpCd" name="sActiveTpCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.custExtrTermCd' /><!-- 고객추출조건 --></th>
                                <td>
                                    <input id="sCustExtrTermCd" name="sCustExtrTermCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartStartDt" name="sStartStartDt" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sStartEndDt" name="sStartEndDt" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="custCareMgmtGrid" class="resizable_grid"></div>
                </div>

            </section>
            <!-- //고객케어 관리 -->
        </div>
<!--  ************************** 그리드 팝업 호출 / 팝업 영역 지정 **************************** -->
            <!-- 고객케어 상세정보 -->
            <section id="custCareMgmtPopup" class="pop_wrap">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.custCareInfo' /><!-- 고객케어 상세정보 --></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11363" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnRcpeExtr" ><spring:message code='crm.btn.rcpeExtrMapping' /><!-- 추출 실행 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11364" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:13%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody id="salesActiveMgmtForm" >
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custCareNm' /><!-- 고객케어명 --></span></th>
                                <td colspan="3">
                                    <input type="hidden" id="custCareSeq" name="custCareSeq" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareSeq" />" />
                                    <input id="custCareNm" name="custCareNm" class="form_input" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custCareNm" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></span></th>
                                <td>
                                    <input id="activeTpCd" name="activeTpCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.activeTpCd" />" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.useYn' /><!-- 사용여부 --></th>
                                <td>
                                    <input id="useYn" name="useYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.useYn" />" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.custExtrAutoYn' /><!-- 대상자자동추출 --></th>
                                <td>
                                    <input id="custExtrAutoYn" name="custExtrAutoYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrAutoYn" />" />
                                    <input type="hidden" id="tmpCustExtrAutoYn" name="tmpCustExtrAutoYn" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.autoActiveYn' /><!-- 자동발송여부 --></th>
                                <td>
                                    <input id="autoActiveYn" name="autoActiveYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.autoActiveYn" />" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.smsResvHm' /><!--  자동발송시간--></th>
                                <td colspan="3">
                                    <input id="smsResvHm" name="smsResvHm" class="form_datepicker" data-json-obj="true" type="date" data-name="<spring:message code="crm.lbl.smsResvHm" />" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.mesgTmpl' /><!-- 메세지템플릿 --></th>
                                <td colspan="3">
                                    <input id="activeTmplId" name="activeTmplId" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="global.lbl.mesgTmpl" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrTermCd' /><!-- 고객추출조건 --></span></th>
                                <td colspan="3">
                                    <input id="custExtrTermCd" name="custExtrTermCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrTermCd" />" style="width:50%;" />
                                    <input type="text" id="custExtrTermPrid" name="custExtrTermPrid" class="form_input" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrTermPrid" />" style="width:50px" />
                                    <span id="custCareDay" class="span_txt"><!-- 일 --></span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></span></th>
                                <td>
                                    <input id="startDt" name="startDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.startDt" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.endDt' /><!-- 종료일 --></span></th>
                                <td>
                                    <input id="endDt" name="endDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.endDt" />" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.extrDgreCnt' /><!-- 추출차수 --></th>
                                <td>
                                    <input type="text" id="extrDgreCnt" name="extrDgreCnt" class="form_input form_readonly" readonly />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.lastExtrDt' /><!-- 마지막추출일 --></th>
                                <td>
                                    <input type="text" id="lastExtrDt" name="lastExtrDt" class="form_input form_readonly" disabled />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.custCareCont' /><!-- 고객케어내용 --></th>
                                <td colspan="3" rowspan="2">
                                    <textarea rows="2" cols="" id="custCareCont" name="custCareCont" class="form_textarea" maxlength="1000" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareCont" />" style="height:42px;"></textarea>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                <td>
                                    <input type="text" id="regUsrNm" name="regUsrNm" class="form_input form_readonly" disabled />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <input id="regDt" name="regDt" class="form_input form_readonly" disabled />
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <th scope="row"></th>
                                <td colspan="3">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //고객케어 상세정보 -->
<!--  ************************** 그리드 팝업 호출 / 팝업 영역 지정 **************************** -->

            <script type="text/javascript">

            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/
            // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
            $("#custCareMgmtGrid").on("dblclick", "tr.k-state-selected", function (e) {

                var gridId = e.delegateTarget.id
                  , grid = $("#"+gridId+"").data("kendoExtGrid")
                  , selectedItem = grid.dataItem(grid.select())
                ;

                if ( dms.string.isNotEmpty(selectedItem) ){

                    viewDetail(selectedItem);

                } else {

                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }

            });


         // 날짜 검증
            function fnChkDateValue(e){
                var  elmt  = e.sender.element[0],
                     id    = elmt.id,
                     toYY,
                     toMM,
                     toDD,
                     frYY,
                     frMM,
                     frDD;

                //등록시작일
                if(id === 'startDt'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#endDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'endDt'){//등록종료일
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#startDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            };

            // 상세조회 후 팝업오픈
            function viewDetail(selectedItem){

                // 초기화
                initForm();

                if( dms.string.isNotEmpty(selectedItem) ){

                    // 고객케어 상세 조회
                    var custCareSeq = selectedItem.custCareSeq;

                    if ( dms.string.isNotEmpty(custCareSeq) ) {

                        var param = {
                                "sCustCareSeq":custCareSeq
                                };

                        $.ajax({
                                url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmtByKey.do' />"
                                ,data:JSON.stringify(param)      //파라미터
                                ,type:'POST'                        //조회요청
                                ,dataType:'json'                  //json 응답
                                ,contentType:'application/json'   //문자열 파라미터
                                ,async:false
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                                }
                        }).done(function(body) {

                            //console.log("고객케어 관리 상세 조회 결과:",body);

                            initForm();

                            $("#custCareSeq").val(body.custCareSeq);
                            $("#custCareNm").val(body.custCareNm);
                            $("#useYn").data("kendoExtDropDownList").value(body.useYn);
                            $("#activeTpCd").data("kendoExtDropDownList").value(body.activeTpCd);
                            $("#autoActiveYn").data("kendoExtDropDownList").value(body.autoActiveYn);
                            if(body.autoActiveYn == "Y"){
                                $("#activeTmplId").data("kendoExtDropDownList").setDataSource(smsTemplateDs);
                            }
                            $("#activeTmplId").data("kendoExtDropDownList").value(body.activeTmplId);
                            $("#custExtrTermCd").data("kendoExtDropDownList").value(body.custExtrTermCd);
                            $("#custExtrAutoYn").data("kendoExtDropDownList").value(body.custExtrAutoYn);

                            var smsResvHm = body.smsResvHm;

                            if ( dms.string.isNotEmpty(smsResvHm) ) {
                                var str = smsResvHm;
                                var strHH  = str.substr(0,2);
                                var strMM = str.substring(2,4);
                                smsResvHm = strHH+":"+strMM;
                                $("#smsResvHm").data("kendoTimePicker").value(smsResvHm);       //예약 발송 시간
                            } else {
                                $("#smsResvHm").data("kendoTimePicker").value("");              //예약 발송 시간
                            };

                            $("#tmpCustExtrAutoYn").val(body.custExtrAutoYn);
                            $("#custExtrTermPrid").val(body.custExtrTermPrid);
                            $("#custCareCont").val(body.custCareCont);

                            $("#extrDgreCnt").val(body.extrDgreCnt);
                            $("#lastExtrDt").val(body.lastExtrDt);
                            $("#regUsrNm").val(body.regUsrNm);
                            $("#regDt").val(body.regDt);

                            var dateCompare = false;

                            // 오늘날짜 - 시작일 비교 ( 시작일이 지났으면 true )
                            if ( kendo.parseDate("${sysDate}") >= kendo.parseDate(body.startDt) ) {
                                dateCompare = true;
                            };

                            // 대상자 추출 버튼 활성화:날짜 체크 ( 자동/수동여부에 상관없이 추출이 시작되면 조건이 바뀌면 안됨 )
                            //if ( !dateCompare && body.custExtrAutoYn === "N" && body.useYn === "Y" ) {
                            if ( body.custExtrAutoYn === "N" && body.useYn === "Y" ) {
                                $("#btnRcpeExtr").data("kendoButton").enable(true);
                            }

                            // min 옵션 다시 설정 ( 안해주면 지난날짜 안나옴 )
                            var startDt = $("#startDt").data("kendoExtMaskedDatePicker");
                            var endDt = $("#endDt").data("kendoExtMaskedDatePicker");

                            /*  고객케어 상세정보 리드온리
                            **  1. 대상자자동추출가 Y:시작일이후 - 현재일 >= 시작일 일경우 사용여부 빼고 리드온리
                            **  2. 대상자자동추출가 N:시작일이전 - 현재일 < 시작일 인경우 Y로 변경시.... 기존 대상자 목록 삭제하시겠습니까? confirm -> 기존 대상자 목록 삭제
                            **  --------------------------
                            **  시작일 이후에는 읽기전용
                            */
                            if ( dateCompare ) {
                                readonlyForm();
                                // min 옵션 다시 설정 ( 안해주면 지난날짜 안나옴 )
                                startDt.min(new Date(body.startDt));
                                endDt.min(new Date(body.endDt));

                            };

                            // min 옵션 다시 설정 ( 안해주면 지난날짜 안나옴 )
                            startDt.value(body.startDt);
                            endDt.value(body.endDt);

                        });

                    };

                };

                var win = $("#custCareMgmtPopup").data("kendoWindow");
                win.center();
                win.open();

            }
            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/

                var custCareSeq
                    , isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , popupWindow
                    , isSmsUseYn = "N"
                ;

                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어미션유형 DS
                var activeTpCdDs = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                // 템플릿 - SMS
                var smsTemplateDs = [];
                <c:forEach var="obj" items="${smsTemplateList}">
                    smsTemplateDs.push({text:"${obj.mesgTmplNm}", value:"${obj.mesgTmplNo}"});
                </c:forEach>

                // 고객추출조건명 DS
                var custExtrTermCdDs = [];
                <c:forEach var="obj" items="${custExtrTermCdList}">
                    custExtrTermCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}", "remark1":"${obj.remark1}"});
                </c:forEach>

                // form - 읽기전용
                function readonlyForm(){

                    $("#custCareNm").attr("readonly", true).addClass("form_readonly");

                    $("#startDt").data("kendoExtMaskedDatePicker").readonly(true);
                    $("#startDt").addClass("form_readonly");
                    $("#endDt").data("kendoExtMaskedDatePicker").readonly(true);
                    $("#endDt").addClass("form_readonly");
                    $("#smsResvHm").data("kendoTimePicker").readonly(true);
                    $("#smsResvHm").addClass("form_readonly");

                    $("#activeTpCd").data("kendoExtDropDownList").readonly(true);
                    $("#activeTpCd").parent().addClass("readonly_area")
                    $("#custExtrTermCd").data("kendoExtDropDownList").readonly(true);
                    $("#custExtrTermCd").parent().addClass("readonly_area")
                    $("#custExtrTermPrid").parent().addClass("readonly_area")

                    $("#custCareCont").attr("readonly", true).addClass('form_readonly');

                    $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(true);
                    $("#custExtrAutoYn").parent().addClass("readonly_area")
                    $("#autoActiveYn").data("kendoExtDropDownList").readonly(true);
                    $("#autoActiveYn").parent().addClass("readonly_area")

                    $("#activeTmplId").data("kendoExtDropDownList").readonly(true);
                    $("#activeTmplId").parent().addClass("readonly_area")

                }

                // 폼 초기화
                function initForm(){

                    var sysDate = new Date("<c:out value='${sysDate}' />");
                    var yy = sysDate.getFullYear();
                    var mm = sysDate.getMonth();
                    var dd = sysDate.getDate()

                    $("#startDt").parent().removeClass("readonly_area");                                     //시작일
                    var startDt = $("#startDt").data("kendoExtMaskedDatePicker")
                    startDt.value("");
                    startDt.readonly(false);
                    startDt.min(new Date(yy,mm,dd));
                    startDt.max(new Date(2099, 11, 31));

                    $("#btnRcpeExtr").data("kendoButton").enable(false);

                    $("#custCareSeq").val("");
                    $("#custCareNm").val("").attr("readonly", false).removeClass('form_readonly');

                    $("#startDt").data("kendoExtMaskedDatePicker").value("");
                    $("#startDt").data("kendoExtMaskedDatePicker").readonly(false);
                    $("#startDt").removeClass("form_readonly");
                    $("#endDt").data("kendoExtMaskedDatePicker").value("");
                    $("#endDt").data("kendoExtMaskedDatePicker").readonly(false);
                    $("#endDt").removeClass("form_readonly");

                    $("#smsResvHm").data("kendoTimePicker").value("");
                    $("#smsResvHm").data("kendoTimePicker").readonly(false);
                    $("#smsResvHm").removeClass("form_readonly");

                    $("#activeTpCd").data("kendoExtDropDownList").value("01");
                    $("#activeTpCd").data("kendoExtDropDownList").readonly(false);
                    $("#activeTpCd").parent().removeClass("readonly_area")

                    $("#custExtrTermCd").data("kendoExtDropDownList").value("");
                    $("#custExtrTermCd").data("kendoExtDropDownList").readonly(false);
                    $("#custExtrTermCd").parent().removeClass("readonly_area")
                    $("#custExtrTermPrid").parent().removeClass("readonly_area")

                    $("#custCareCont").val("").attr("readonly", false).removeClass('form_readonly');

                    $("#tmpCustExtrAutoYn").val("");
                    $("#custExtrAutoYn").data("kendoExtDropDownList").value("N");
                    $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(false);
                    $("#custExtrAutoYn").parent().removeClass("readonly_area")

                    $("#autoActiveYn").data("kendoExtDropDownList").value("N");
                    $("#autoActiveYn").data("kendoExtDropDownList").readonly(false);
                    $("#autoActiveYn").parent().removeClass("readonly_area")

                    $("#custExtrTermPrid").val("");

                    $("#activeTmplId").data("kendoExtDropDownList").value("");
                    $("#activeTmplId").data("kendoExtDropDownList").readonly(false);
                    $("#activeTmplId").parent().removeClass("readonly_area");

                    $("#extrDgreCnt").val("");
                    $("#lastExtrDt").val("");
                    $("#regUsrNm").val("");
                    $("#regDt").val("");

                    $("#useYn").data("kendoExtDropDownList").value("Y");

                    smsTmpEnabled();

                }

                function smsTmpEnabled(){

                    // 실행유형:SMS, 대상자자동추출:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                    var activeTpCd = $("#activeTpCd").data("kendoExtDropDownList");        // 실행유형
                    var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList");// 대상자자동추출
                    var autoActiveYn = $("#autoActiveYn").data("kendoExtDropDownList");    // 자동발송여부
                    var activeTmplId = $("#activeTmplId").data("kendoExtDropDownList");
                    var smsResvHm = $("#smsResvHm").data("kendoTimePicker");       // 자동발송시간

                    if ( activeTpCd.value() === "02" && custExtrAutoYn.value() === "Y" ) {

                        autoActiveYn.enable(true);

                        if ( autoActiveYn.value() === "Y" ) {
                            smsResvHm.enable(true);
                            activeTmplId.enable(true);
                            activeTmplId.setDataSource(smsTemplateDs);
                            isSmsUseYn = "Y";
                            $("#smsResvHm").parent().parent().parent().prev().addClass("bu_required");
                            $("#smsResvHm").parent().parent().parent().prev().css('font-weight', 'bold');

                        } else {
                            smsResvHm.enable(false);
                            smsResvHm.value("");
                            activeTmplId.enable(false);
                            activeTmplId.setDataSource("");
                            isSmsUseYn = "N";
                        }

                    } else {
                        smsResvHm.enable(false);
                        smsResvHm.value("");
                        autoActiveYn.enable(false);
                        autoActiveYn.value("N");
                        activeTmplId.enable(false);
                        activeTmplId.setDataSource("");
                        isSmsUseYn = "N";
                    }

                }

                // 검색조건 : 시작일-종료일 날짜 비교
                fnChkSearchDate = function(e){
                    //if(dms.string.isEmpty($(this).val())){return;}
                    if(dms.string.isEmpty(e.data.from.val())){return;}
                    if(dms.string.isEmpty(e.data.to.val())){return;}

                    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
                    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
                    if(startDt > endDt){
                        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
                        $(this).focus();
                    }
                }

                $(document).ready(function() {

                    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
                    $("#custCareMgmtPopup").kendoWindow({
                        animation:false
                        ,draggable:true
                        ,modal:false
                        ,resizable:false
                        ,visible:false
                        ,title:"<spring:message code='crm.menu.custCareMgmt' />"      // <!-- 고객케어 관리 -->
                        ,width:"950px"
                        ,height:"350px"
                    }).data("kendoWindow");
                    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************

                    // s실행유형
                    $("#sActiveTpCd").kendoExtDropDownList({
                        dataSource:activeTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s시작일
                    $("#sStartStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#sStartEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 시작일
                    $("#startDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                        ,change:fnChkDateValue
                    });
                    $("#endDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                        ,change:fnChkDateValue
                    });

                    // SMS 자동발송 일시
                    $("#smsResvHm").kendoTimePicker({
                            format:"HH:mm"
                    });
                    $("#smsResvHm").data("kendoTimePicker").enable(false);

                    // 사용여부
                    $("#useYn").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(useYnDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:1
                    });

                    // 실행유형
                    $("#activeTpCd").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(activeTpCdDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:1
                        , change:function(e) {

                            // 실행유형:SMS, 대상자자동추출:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 대상자자동추출
                    $("#custExtrAutoYn").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(useYnDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                        , change:function(e) {

                            var dataItem = this.dataItem(e.item);

                            if ( dataItem.value === "Y" ) {
                            } else if ( dataItem.value === "N" ) {
                            }

                            // 실행유형:SMS, 대상자자동추출:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 자동발송여부
                    $("#autoActiveYn").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(useYnDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                        , enable:false
                        , change:function(e) {

                            // 실행유형:SMS, 대상자자동추출:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 메세지템플릿
                    $("#activeTmplId").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(smsTemplateDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                        , enable:false
                    });

                    // 고객추출조건
                    $("#sCustExtrTermCd").kendoExtDropDownList({
                        dataSource:custExtrTermCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 고객추출조건
                    $("#custExtrTermCd").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(custExtrTermCdDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                        , change:function() {
                            if (this.dataItem(this.select())) {
                                $("#custCareDay").html(this.dataItem(this.select()).remark1);
                            }
                        }
//                         , select:function(){
//                             if (this.dataItem(this.select())) {
//                                 $("#custCareDay").html(this.dataItem(this.select()).remark1);
//                             }
//                         }
                    });

                    // 추가
                    $("#btnViewAdd").kendoButton({
                        click:function(e){
                            viewDetail();
                        }
                    })

                    // 상세정보
                    $("#btnViewDetail").kendoButton({
                        click:function(e){

                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
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
                    });

                    // 대상자 추출
                    $("#btnRcpeExtr").kendoButton({
                        click:function(e){

                            // 개발중
                            //dms.notification.warning("<spring:message code='global.msg.eveloping' />");
                            //return;

                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isEmpty(selectedVal) ) {

                                // 고객케어명 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.custCareNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;

                            } else if ( dms.string.isNotEmpty(selectedVal) ) {

                                var custCareSeq = selectedVal.custCareSeq;
                                var custExtrTermCd = selectedVal.custExtrTermCd;
                                var custExtrTermPrid = selectedVal.custExtrTermPrid;
                                var extrDgreCnt = selectedVal.extrDgreCnt;
                                var custExtrAutoYn = selectedVal.custExtrAutoYn;
                                var activeTpCd = selectedVal.activeTpCd;

                                if ( dms.string.isEmpty(custExtrTermCd) ) {
                                        // {고객추출번호}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custCareSeq' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(custExtrTermCd) ) {
                                        // {고객추출조건}을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrTermCd' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(custExtrTermPrid) ) {
                                        // {고객추출조건 일(기간)}을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrTermPrid' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(extrDgreCnt) ) {
                                        // {추출차수}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.extrDgreCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( custExtrAutoYn !== "N" ) {
                                        // {대상자자동추출}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(activeTpCd) ) {
                                        // {실행유형}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.activeTpCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                var param = {
                                          "custCareSeq":custCareSeq
                                        , "custExtrTermCd":custExtrTermCd
                                        , "custExtrTermPrid":custExtrTermPrid
                                        , "extrDgreCnt":extrDgreCnt
                                        , "custExtrAutoYn":custExtrAutoYn
                                        , "activeTpCd":activeTpCd

                                }
                                //console.log("saveData:",JSON.stringify(param));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/selectTargetExtractSave.do' />",
                                    data:JSON.stringify(param),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {

                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR === "00" ){

                                            // {대상자 추출}이(가) 완료 되었습니다.
                                            dms.notification.success("<spring:message code='crm.lbl.rcpeExtrSeq' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                            resultKey = custCareSeq;
                                            isGridReload = true;

                                        } else if(textStatus == "success" && jqXHR === "02" ){
                                            // 추출할 대상자가 존재하지 않습니다.
                                            dms.notification.info("<spring:message code='crm.err.targetEmptyUsr' />");
                                        } else {
                                         // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.error("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                    ,beforeSend:function(xhr) {
                                        dms.loading.show();
                                    }
                                    ,complete:function(xhr, status) {
                                        dms.loading.hide();
                                    }
                                });

                            };

                        }
                        , enable:false
                    });

                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){

                            if(crmJs.isDateValidPeriod($("#sStartStartDt").data("kendoExtMaskedDatePicker").value()
                                    ,$("#sStartEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                                $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                            }else{
                                $("#sStartEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                                $("#sStartEndDt").focus();
                                return false;
                            }
                        }
                    });

                    // 삭제
                    $("#btnDelete").kendoButton({
                        click:function(e){

                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isEmpty(selectedVal) ) {

                                // 고객케어명 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.custCareNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;

                            } else if ( dms.string.isNotEmpty(selectedVal) ) {

                                /**
                                 *  시작전인경우 삭제 , 추출된 대상자도 삭제 ( 수동추출인경우 대상자가 있을수 있음. / 시작전이면 콜센터 전송이 안되기 때문에 콜센터 전송은 신경 안써도됨. )
                                 **/
                                // 오늘날짜 - 시작일 비교 ( 시작일이 지났으면 true )
                                if ( kendo.parseDate("${sysDate}") >= kendo.parseDate(selectedVal.startDt) ) {
                                    // 시작일 이후 고객케어는 삭제가 불가 합니다.
                                    dms.notification.warning("<spring:message code='crm.info.aftStartDtNotDelete' />");
                                    return;
                                };

                                var param = {
                                        "sCustCareSeq":selectedVal.custCareSeq
                                        };

                                //return;

                                $.ajax({
                                        url:"<c:url value='/crm/crq/customerCare/deleteCustomerCareMgmt.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                        }
                                        ,success:function(jqXHR, textStatus) {

                                            // 저장완료일경우 해당 데이터를 다시 조회한다.
                                            if(textStatus == "success" && jqXHR === 1 ){

                                                // 고객케어일련번호 / 삭제 성공하였습니다
                                                dms.notification.success("<spring:message code='crm.lbl.custCareSeq' var='arguMsg' /><spring:message code='global.info.delSuccessParam' arguments='${arguMsg}'/>");

                                                $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                            }else{
                                                // 저장정보 / 을(를) 확인하여 주세요.
                                                dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
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
                        , enable:false

                    });

                    var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");
                    // 저장
                    $("#btnSave").kendoButton({
                        click:function(e){

                            // validation 시작
                            if (validator.validate()) {

                                if ( isSmsUseYn === "Y" ) {
                                    if( dms.string.isEmpty($("#activeTmplId").data("kendoExtDropDownList").value()) ) {
                                        // 메세지템플릿 / 을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.mesgTmpl' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                    }
                                };


                                var activeTpCd = $("#activeTpCd").data("kendoExtDropDownList").value();
                                var autoActiveYn = $("#autoActiveYn").data("kendoExtDropDownList").value();
                                var smsResvHm = kendo.toString($("#smsResvHm").data("kendoTimePicker").value(), "HHmm");

                                if ( activeTpCd === "02" && autoActiveYn === "Y" ) {

                                    if( dms.string.isEmpty($("#activeTmplId").data("kendoExtDropDownList").value()) ) {
                                        // 메세지템플릿 / 을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.mesgTmpl' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                    }

                                    if ( dms.string.isEmpty(smsResvHm) ) {
                                        // 자동발송시간 / 을(를) 입력해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.smsResvHm' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                                        return;

                                    };

                                };

                                var startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
                                var endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();
                                if ( startDt > endDt ) {
                                        // 종료일 / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.endDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                var dateCompare = false;
                                // 오늘날짜 - 시작일 비교 ( 시작일이 지났으면 true )
                                if ( kendo.parseDate("${sysDate}") > kendo.parseDate(startDt) ) {
                                    dateCompare = true;
                                };

                                if ( dms.string.isEmpty($("#custCareSeq").val()) && dateCompare ) {
                                    // 시작일  / 을(를) 확인하여 주세요.
                                    dms.notification.warning("<spring:message code='crm.lbl.startDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    return;
                                };

                                // 수정일때:대상자자동추출를 변경할때
                                var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                                var tmpCustExtrAutoYn = $("#tmpCustExtrAutoYn").val();

                                // 시작일 이전 - N으로 -> Y로 변경시
                                if ( dateCompare && tmpCustExtrAutoYn === "N" && custExtrAutoYn === "Y" ) {

                                    // 메시지 발송 confirm
                                    dms.window.confirm({
                                        message:"<spring:message code='crm.info.custExtrConfirm'/>"     // // 삭제하시겠습니까?
                                        ,callback:function(result){
                                            if(result){
                                                customerCareSave("Y");
                                            }else{
                                                return;
                                            };
                                        }
                                    });
                                    // 메시지 발송 confirm

                                } else {
                                    customerCareSave("Y");  //수정
                                };

                            }
                            // validation 종료

                        }
                    });

                    // 고객캐어미션 그리드 시작
                    $("#custCareMgmtGrid").kendoExtGrid({
                        gridId:"G-CRM-0721-112701"
                        ,dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sCustCareNm"] = $("#sCustCareNm").val();
                                        params["sActiveTpCd"] = $("#sActiveTpCd").data("kendoExtDropDownList").value();
                                        params["sCustExtrTermCd"] = $("#sCustExtrTermCd").data("kendoExtDropDownList").value();
                                        params["sStartStartDt"] = $("#sStartStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sStartEndDt"] = $("#sStartEndDt").data("kendoExtMaskedDatePicker").value();

                                        //console.log("custCareMgmtGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"custCareSeq"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,custCareSeq:{type:"number"}
                                        ,custCareNm:{type:"string"}
                                        ,activeTpCdNm:{type:"string"}
                                        ,activeTmplIdNm:{type:"string"}
                                        ,useYn:{type:"string"}
                                        ,activeTpCd:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,activeTmplId:{type:"string"}
                                        ,custExtrTermCd:{type:"string"}
                                        ,custExtrAutoYn:{type:"string"}
                                        ,custExtrTermPrid:{type:"string"}
                                        ,custCareCont:{type:"string"}
                                        ,regUsrNm:{type:"string"}
                                        ,custExtrTermCdNm:{type:"string"}
                                        ,startDt:{type:"date"}
                                        ,endDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                        ,regDt:{type:"date"}
                                        ,regDtFormat:{type:"date", editable:false}
                                        ,startDt:{type:"date"}
                                        ,startDtFormat:{type:"date", editable:false}

                                    }
                                }
                                ,parse:function(d) {
                                    if(d.data){
                                        $.each(d.data, function(idx, elem) {
                                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                            elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                                        });
                                    }
                                    return d;
                                }
                            }
                        }
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid")
                            , rows = grid.tbody.find("tr")
                            , gridData
                            , selectRow

                            if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {

                                rows.each(function(index, row) {

                                    gridData = grid.dataSource.at(index);

                                    if ( gridData.custCareSeq === resultKey ) {

                                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                        grid.select(selectRow);
                                    }

                                });

                                isGridReload = false;

                            }

                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            var custCareSeq = selectedItem.custCareSeq;

                            if (dms.string.isNotEmpty(custCareSeq)) {

                                $("#btnViewDetail").data("kendoButton").enable(true);

                                //오늘날짜 < 시작일 - 시작전인경우 삭제 , 추출된 대상자도 삭제 ( 수동추출인경우 대상자가 있을수 있음. / 시작전이면 콜센터 전송이 안되기 때문에 콜센터 전송은 신경 안써도됨. )
                                if ( kendo.parseDate("${sysDate}") < kendo.parseDate(selectedItem.startDt) ) {
                                    $("#btnDelete").data("kendoButton").enable(true);
                                }else {
                                    $("#btnDelete").data("kendoButton").enable(false);
                                };

                            }

                        }
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                                ,filterable:false
                            }
                            ,{field:"custCareNm", title:"<spring:message code='crm.lbl.custCareNm' />", width:150}                //고객케어명
                            ,{field:"custCareCont", title:"<spring:message code='crm.lbl.custCareCont' />", width:150}            //고객케어내용
                            ,{field:"activeTpCdNm", title:"<spring:message code='crm.lbl.activeTpCd' />", width:100               //실행유형
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"activeTmplIdNm", title:"<spring:message code='global.lbl.mesgTmpl' />", width:100 }          // 메세지템플릿
                            ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:110         //대상자자동추출
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrTermCdNm", title:"<spring:message code='crm.lbl.custExtrTermCd' />", width:100       //고객추출조건코드
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrTermPrid", title:"<spring:message code='crm.lbl.custExtrTermPrid' />", width:110     //고객추출주기 일(기간)
                                ,attributes:{ "style":"text-align:right"}
                            }
                            ,{field:"extrDgreCnt", title:"<spring:message code='crm.lbl.extrDgreCnt' />", width:100               // 추출차수
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"startDtFormat", title:"<spring:message code='crm.lbl.startDt' />", width:100                 // 시작일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (startDtFormat!== null ){# #= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                            ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:60                            //사용여부
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100}                 //등록자
                            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100                  //등록일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }


                        ]
                        //,autoBind:false
                        ,editable:false
                        ,navigatable:false
                        ,selectable:"row"
                        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
                        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                        ,enableTooltip:true               //Tooltip 적용, default:false
                    });
                    // 고객캐어미션 그리드 종료

                });

                function customerCareSave(confrimChk) {

                    if ( confrimChk === "N" ){
                        return;
                    };

                    var saveData = $("#salesActiveMgmtForm").serializeObject(
                            $("#salesActiveMgmtForm").serializeArrayInSelector("[data-json-obj='true']")
                    )
                    saveData.startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
                    saveData.endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();
                    saveData.smsResvHm = kendo.toString($("#smsResvHm").data("kendoTimePicker").value(), "HHmm");
                    saveData.autoActiveYn = $("#autoActiveYn").val();

                    //return;

                    $.ajax({
                        url:"<c:url value='/crm/crq/customerCare/multiCustomerCareMgmts.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        async:false,
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            // 저장완료일경우 해당 데이터를 다시 조회한다.
                            if(textStatus == "success" && jqXHR > 0 ){

                                // options.callbackFunc(jqXHR);

                                // 저장 / 이 완료 되었습니다.
                                dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                resultKey = jqXHR;
                                isGridReload = true;
                                $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                var win = $("#custCareMgmtPopup").data("kendoWindow");
                                win.close();

                            }else{
                                // 저장정보 / 을(를) 확인하여 주세요.
                                dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            }

                        }
                        ,beforeSend:function(xhr) {
                            dms.loading.show();
                        }
                        ,complete:function(xhr, status) {
                            dms.loading.hide();
                        }
                    });

                };



            </script>

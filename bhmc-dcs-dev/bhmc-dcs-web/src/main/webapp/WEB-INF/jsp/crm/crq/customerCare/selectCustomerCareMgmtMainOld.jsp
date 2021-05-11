<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 고객케어 관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.custCareMgmt' /><!-- 고객케어 관리 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnRcpeExtr" ><spring:message code='crm.btn.rcpeExtrMapping' /><!-- 대상자 추출 --></button>
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                        <button type="button" class="btn_m btn_add" id="btnAdd" ><spring:message code='global.btn.add' /><!-- 추가 --></button>
                        <button type="button" class="btn_m btn_delete" id="btnDelete" ><spring:message code='global.btn.del' /><!-- 삭제 --></button>
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
                                <th scope="row"><spring:message code='crm.lbl.custCareNm' /><!-- 고객케어명 --></th>
                                <td>
                                    <input type="text" id="sCustCareNm" name="sCustCareNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></th>
                                <td>
                                    <input id="sActiveTpCd" name="sActiveTpCd" class="form_comboBox" />
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                            <tr>
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
                                <th scope="row"><spring:message code='crm.lbl.endDt' /><!-- 종료일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sEndStartDt" name="sEndStartDt" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndEndDt" name="sEndEndDt" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="custCareMgmtGrid"></div>
                </div>

            </section>
            <!-- //고객케어 관리 -->

            <!-- 고객케어 상세정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.custCareInfo' /><!-- 고객케어 상세정보 --></h2>
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
                                    <input type="hidden" id="custCareSeq" name="custCareSeq" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareSeq" />" data-bind="value:custCareSeq" />
                                    <input type="hidden" id="batOperId" name="batOperId" data-json-obj="true" data-name="<spring:message code="global.lbl.batOperId" />" data-bind="value:batOperId" />
                                    <input id="custCareNm" name="custCareNm" class="form_input" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custCareNm" />" data-bind="value:custCareNm" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></span></th>
                                <td>
                                    <input id="startDt" name="startDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.startDt" />" data-bind="value:startDt" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.endDt' /><!-- 종료일 --></span></th>
                                <td>
                                    <input id="endDt" name="endDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.endDt" />" data-bind="value:endDt" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></span></th>
                                <td>
                                    <input id="activeTpCd" name="activeTpCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.activeTpCd" />" data-bind="value:activeTpCd" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrTermNo' /><!-- 고객추출조건 --></span></th>
                                <td>
                                    <input id="custExtrTermNo" name="custExtrTermNo" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrTermNo" />" data-bind="value:custExtrTermNo" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.custCareCont' /><!-- 고객케어내용 --></th>
                                <td colspan="3" rowspan="2">
                                    <textarea rows="3" cols="" id="custCareCont" name="custCareCont" class="form_textarea" maxlength="1000" data-json-obj="true" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareCont" />" data-bind="value:custCareCont" style="height:42px;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.custExtrAutoYn' /><!-- 고객추출자동여부 --></th>
                                <td>
                                    <input id="custExtrAutoYn" name="custExtrAutoYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrAutoYn" />" data-bind="value:custExtrAutoYn" />
                                    <input type="hidden" id="tmpCustExtrAutoYn" name="tmpCustExtrAutoYn" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.autoActiveYn' /><!-- 자동발송여부 --></th>
                                <td>
                                    <input id="autoActiveYn" name="autoActiveYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.autoActiveYn" />" data-bind="value:autoActiveYn" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                                <td colspan="3">
                                    <span class="form_search">
                                        <input type="text" id="custExtrCycleCont" name="custExtrCycleCont" class="form_input form_readonly" readonly data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrCycleCont" />" data-bind="value:custExtrCycleCont" />
                                        <a href="javascript:;" id="custSearch" ></a>
                                    </span>
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
                                <th scope="row"><spring:message code='crm.lbl.activeTmplId' /><!-- SMS템플릿 --></th>
                                <td>
                                    <input id="activeTmplId" name="activeTmplId" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="crm.lbl.activeTmplId" />" data-bind="value:activeTmplId" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.useYn' /><!-- 사용여부 --></th>
                                <td>
                                    <input id="useYn" name="useYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.useYn" />" data-bind="value:useYn" />
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
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //고객케어 상세정보 -->


            <script type="text/javascript">

                var custCareSeq
                    , isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , popupWindow
                    , isSmsUseYn = "N"
                ;

                // 주기 설정 팝업
                $("#custSearch").click(function(){

                    var sysDate = "${sysDate}"+" 00:00:00";
                    var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                    var startDt = $("#startDt").val();

                    console.log("sysDate:"+sysDate)
                    console.log("startDt:"+startDt)

                    //if ( startDt <= sysDate || custExtrAutoYn === "N" ) {
                    if ( custExtrAutoYn === "N" ) {
                        return;
                    }

                    popupWindow = dms.window.popup({
                        windowId:"cronPopup"
                        , title:"<spring:message code='crm.lbl.cronSetting' />"   // 주기설정
                        , height:600
                        , content:{
                            url:"<c:url value='/crm/cmm/cronMaker/selectCronMakerPopup.do'/>"
                            , data:{
                                "autoBind" :false
                                , "type"   :null
                                , "cronTxt":$("#custExtrCycleCont").val()
                                , "callbackFunc":function(data){

                                    if ( dms.string.isNotEmpty(data) ) {
                                        $("#custExtrCycleCont").val(data);
                                    }
                                    popupWindow.close();
                                }
                            }
                        }
                    });
                });


                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어미션유형 DS
                var activeTpCdDs = [];
                var activeTpCdArr = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    activeTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                activeTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = activeTpCdArr[val];
                    }
                    return returnVal;
                };

                // 템플릿 - SMS
                var smsTemplateDs = [];
                var smsTemplateArr = [];
                <c:forEach var="obj" items="${smsTemplateList}">
                    smsTemplateDs.push({text:"${obj.mesgTmplNm}", value:"${obj.mesgTmplNo}"});
                    smsTemplateArr["${obj.mesgTmplNo}"] = "${obj.mesgTmplNm}";
                </c:forEach>
                smsTemplateArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = smsTemplateArr[val];
                    }
                    return returnVal;
                };

                // 고객추출조건명 DS
                var custExtrTermNoDs = [];
                var custExtrTermNoArr = [];
                <c:forEach var="obj" items="${custExtrTermNoList}">
                    custExtrTermNoDs.push({text:"${obj.custExtrTermNm}", value:"${obj.custExtrTermNo}"});
                    custExtrTermNoArr["${obj.custExtrTermNo}"] = "${obj.custExtrTermNm}";
                </c:forEach>
                custExtrTermNoArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custExtrTermNoArr[val];
                    }
                    return returnVal;
                };


                // form - 읽기전용
                function readonlyForm(){

                    $("#custCareNm").attr("readonly", true).addClass("form_readonly");

                    $("#startDt").data("kendoExtMaskedDatePicker").readonly(true);
                    $("#startDt").addClass("form_readonly");
                    $("#endDt").data("kendoExtMaskedDatePicker").readonly(true);
                    $("#endDt").addClass("form_readonly");

                    $("#activeTpCd").data("kendoExtDropDownList").readonly(true);
                    $("#activeTpCd").parent().addClass("readonly_area")
                    $("#custExtrTermNo").data("kendoExtDropDownList").readonly(true);
                    $("#custExtrTermNo").parent().addClass("readonly_area")

                    $("#custCareCont").attr("readonly", true).addClass('form_readonly');

                    $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(true);
                    $("#custExtrAutoYn").parent().addClass("readonly_area")
                    $("#autoActiveYn").data("kendoExtDropDownList").readonly(true);
                    $("#autoActiveYn").parent().addClass("readonly_area")

                    $("#custExtrCycleCont").attr("readonly", true).addClass('form_readonly');

                    $("#activeTmplId").data("kendoExtDropDownList").readonly(true);
                    $("#activeTmplId").parent().addClass("readonly_area")

                }

                // 폼 초기화
                function initForm(){

                    $("#custCareSeq").val("");
                    $("#batOperId").val("");
                    $("#custCareNm").val("").attr("readonly", false).removeClass('form_readonly');

                    $("#startDt").data("kendoExtMaskedDatePicker").value("");
                    $("#startDt").data("kendoExtMaskedDatePicker").readonly(false);
                    $("#startDt").removeClass("form_readonly");
                    $("#endDt").data("kendoExtMaskedDatePicker").value("");
                    $("#endDt").data("kendoExtMaskedDatePicker").readonly(false);
                    $("#endDt").removeClass("form_readonly");

                    $("#activeTpCd").data("kendoExtDropDownList").value("01");
                    $("#activeTpCd").data("kendoExtDropDownList").readonly(false);
                    $("#activeTpCd").parent().removeClass("readonly_area")

                    $("#custExtrTermNo").data("kendoExtDropDownList").value("");
                    $("#custExtrTermNo").data("kendoExtDropDownList").readonly(false);
                    $("#custExtrTermNo").parent().removeClass("readonly_area")

                    $("#custCareCont").val("").attr("readonly", false).removeClass('form_readonly');

                    $("#tmpCustExtrAutoYn").val("");
                    $("#custExtrAutoYn").data("kendoExtDropDownList").value("N");
                    $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(false);
                    $("#custExtrAutoYn").parent().removeClass("readonly_area")

                    $("#autoActiveYn").data("kendoExtDropDownList").value("N");
                    $("#autoActiveYn").data("kendoExtDropDownList").readonly(false);
                    $("#autoActiveYn").parent().removeClass("readonly_area")

                    $("#custExtrCycleCont").val("").attr("readonly", true).addClass('form_readonly');

                    $("#activeTmplId").data("kendoExtDropDownList").value("");
                    $("#activeTmplId").data("kendoExtDropDownList").readonly(false);
                    $("#activeTmplId").parent().removeClass("readonly_area");

                    $("#extrDgreCnt").val("");
                    $("#lastExtrDt").val("");
                    $("#regUsrNm").val("");
                    $("#regDt").val("");

                    $("#useYn").data("kendoExtDropDownList").value("Y");

                    $("#btnDelete").data("kendoButton").enable(false);
                    $("#btnRcpeExtr").data("kendoButton").enable(false);

                }

                // 필터를 지정하면 저장후 value 선택시 버그 있음. 따라서 함수로 만들어서 저장후 드롭다운리스트를 다시 드려줌.
                var custExtrTermNoDDL = function(){
                    $("#custExtrTermNo").kendoExtDropDownList({
                        dataSource:custExtrTermNoDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , filter:"contains"
                        //, filtering:onFiltering
                        , index:0
                    });
                };

                $(document).ready(function() {

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

                    // s종료일
                    $("#sEndStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#sEndEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 시작일
                    $("#startDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#endDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 사용여부
                    $("#useYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:1
                    });

                    // 실행유형
                    $("#activeTpCd").kendoExtDropDownList({
                        dataSource:activeTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:1
                        , change:function(e) {

                            // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 고객추출자동여부
                    $("#custExtrAutoYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                        , change:function(e) {

                            var dataItem = this.dataItem(e.item);

                            if ( dataItem.value === "Y" ) {
                                //$("#custExtrCycleCont").val("");
                                $("#custExtrCycleCont").attr("readonly", false).removeClass("form_readonly");
                            } else if ( dataItem.value === "N" ) {
                                $("#custExtrCycleCont").attr("readonly", true).addClass('form_readonly');
                            }

                            // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // 자동발송여부
                    $("#autoActiveYn").kendoExtDropDownList({
                        dataSource:useYnDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                        , enable:false
                        , change:function(e) {

                            // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                            smsTmpEnabled();

                        }
                    });

                    // SMS템플릿
                    $("#activeTmplId").kendoExtDropDownList({
                        //dataSource:smsTemplateDs
                         dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                        , enable:false
                    });

                    // 고객추출조건 드롭다운 리스트
                    custExtrTermNoDDL();

                    function smsTmpEnabled(){

                        // 실행유형:SMS, 고객추출자동여부:Y, 자동발송여부:Y 일때 - SMS 템플릿 활성화
                        var activeTpCd = $("#activeTpCd").data("kendoExtDropDownList");        // 실행유형
                        var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList");// 고객추출자동여부
                        var autoActiveYn = $("#autoActiveYn").data("kendoExtDropDownList");    // 자동발송여부
                        var activeTmplId = $("#activeTmplId").data("kendoExtDropDownList");

                        console.log("activeTpCd:"+activeTpCd.value()+" || custExtrAutoYn:"+custExtrAutoYn.value()+" || autoActiveYn:"+autoActiveYn.value()+" || activeTmplId:"+activeTmplId.value() );

                        if ( activeTpCd.value() === "02" && custExtrAutoYn.value() === "Y" ) {

                            autoActiveYn.enable(true);

                            if ( autoActiveYn.value() === "Y" ) {
                                activeTmplId.enable(true);
                                activeTmplId.setDataSource(smsTemplateDs);
                                isSmsUseYn = "Y";

                            } else {
                                activeTmplId.enable(false);
                                activeTmplId.setDataSource("");
                                isSmsUseYn = "N";
                            }

                        } else {
                            autoActiveYn.enable(false);
                            autoActiveYn.value("N");
                            activeTmplId.enable(false);
                            activeTmplId.setDataSource("");
                            isSmsUseYn = "N";
                        }

                    }


                    // 대상자 추출
                    $("#btnRcpeExtr").kendoButton({
                        click:function(e){

                            var custExtrTermNo = $("#custExtrTermNo").data("kendoExtDropDownList").value();
                            var extrDgreCnt = $("#extrDgreCnt").val();
                            var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                            var activeTpCd = $("#activeTpCd").data("kendoExtDropDownList").value();

                            if ( dms.string.isEmpty(custExtrTermNo) ) {
                                    // {고객추출조건}을(를) 선택해주세요.
                                    dms.notification.warning("<spring:message code='crm.lbl.custExtrTermNo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                    return;
                            }

                            if ( dms.string.isEmpty(extrDgreCnt) ) {
                                    // {추출차수}을(를) 확인하여 주세요.
                                    dms.notification.warning("<spring:message code='crm.lbl.extrDgreCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    return;
                            }

                            if ( custExtrAutoYn !== "N" ) {
                                    // {고객추출자동여부}을(를) 확인하여 주세요.
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
                                    , "custExtrTermNo":custExtrTermNo
                                    , "extrDgreCnt":extrDgreCnt
                                    , "custExtrAutoYn":custExtrAutoYn
                                    , "activeTpCd":activeTpCd

                            }
                            console.log("saveData:",JSON.stringify(param));
                            //return;

                            $.ajax({
                                url:"<c:url value='/crm/crq/customerCare/selectTargetExtractSave.do' />",
                                data:JSON.stringify(param),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {

                                    console.log("jqXHR:",jqXHR)
                                    console.log("status:",status)
                                    console.log("error:",error)

                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },
                                success:function(jqXHR, textStatus) {

                                    console.log("jqXHR:" ,jqXHR)
                                    console.log("textStatus:" ,textStatus)

                                    // 저장완료일경우 해당 데이터를 다시 조회한다.
                                    if(textStatus == "success" && jqXHR === true ){

                                        // {대상자 추출}이(가) 완료 되었습니다.
                                        dms.notification.success("<spring:message code='crm.lbl.rcpeExtrSeq' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                        // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                        $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                        resultKey = custCareSeq;
                                        isGridReload = true;

                                    }else{
                                        // 저장정보 / 을(를) 확인하여 주세요.
                                        dms.notification.error("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    }

                                }
                            });

                        }
                        , enable:false
                    });

                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                    });

                    var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");

                    // 저장
                    $("#btnSave").kendoButton({
                        click:function(e){

                            // validation 시작  TODO 필수값 정해지면 다시 확인 (태그도 수정)
                            if (validator.validate()) {

                                if ( isSmsUseYn === "Y" ) {
                                    if( dms.string.isEmpty($("#activeTmplId").data("kendoExtDropDownList").value()) ) {
                                        // SMS템플릿 / 을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.activeTmplId' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                    }
                                }

                                if ( $("#startDt").data("kendoExtMaskedDatePicker").value() > $("#endDt").data("kendoExtMaskedDatePicker").value() ) {
                                        // 시작일  / 을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.startDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( $("#custExtrAutoYn").data("kendoExtDropDownList").value() === "Y" && dms.string.isEmpty($("#custExtrCycleCont").val()) ) {
                                        // {고객추출주기}을(를) 입력해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrCycleCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                var confrimChk = true;

                                // 수정일때:고객추출자동여부를 변경할때
                                if ( $("#custCareSeq").val() > 0 ) {

                                    // 시작일 이전에 대상자 추출후 자동실행여부를 Y로 변경할때
                                    var sysDate = "${sysDate}"+" 00:00:00";
                                    var startDt = $("#startDt").val();
                                    var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                                    var tmpCustExtrAutoYn = $("#tmpCustExtrAutoYn").val();

                                    if ( startDt > sysDate ) {
                                        if ( tmpCustExtrAutoYn === "N" && custExtrAutoYn === "Y" ) {
                                            // 고객추출자동여부를 Y로 변경할경우 기존 대상자 목록은 삭제됩니다. 계속 하시겠습니까?
                                            if (confirm("<spring:message code='crm.info.custExtrConfirm' />")) {
                                                confrimChk = true;
                                                console.log("N에서 Y로 변경");
                                            } else {
                                                confrimChk = false;
                                            }
                                        }
                                    }
                                }

                                if(!confrimChk){
                                    return;
                                }

                                var saveData = $("#salesActiveMgmtForm").serializeObject(
                                        $("#salesActiveMgmtForm").serializeArrayInSelector("[data-json-obj='true']")
                                )
                                saveData.startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
                                saveData.endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();
                                saveData.custExtrCycleCont = $("#custExtrCycleCont").val();
                                saveData.autoActiveYn = $("#autoActiveYn").val();

                                console.log("saveData:",JSON.stringify(saveData));
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/multiCustomerCareMgmts.do' />",
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
                                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

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
                            smsTmpEnabled();
                        }
                    });

                    // 삭제
                    $("#btnDelete").kendoButton({
                        click:function(e){

                            // TODO 추출 대상자 확인후 추출 대상자가 없으면 삭제.
                            custCareSeq = $("#custCareSeq").val();

                            if (dms.string.isEmpty(custCareSeq)) {
                                // 고객케어명 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.custCareNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;

                            } else if (dms.string.isNotEmpty(custCareSeq)) {

                                var param = {
                                        "sCustCareSeq":custCareSeq
                                        };

                                $.ajax({
                                        url:"<c:url value='/crm/crq/customerCare/deleteCustomerCareMgmt.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                        }
                                }).done(function(jqXHR, textStatus) {


                                    console.log("jqXHR:" ,jqXHR)      // 삭제 수량
                                    console.log("textStatus:" ,textStatus)

                                    // 저장완료일경우 해당 데이터를 다시 조회한다.
                                    if(textStatus == "success" && jqXHR === 1 ){

                                        // 고객케어일련번호 / 삭제 성공하였습니다
                                        dms.notification.success("<spring:message code='crm.lbl.custCareSeq' var='arguMsg' /><spring:message code='global.info.delSuccessParam' arguments='${arguMsg}'/>");
                                        initForm();

                                        $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                    }else{
                                        // 저장정보 / 을(를) 확인하여 주세요.
                                        dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    }

                                });

                            }

                        }
                        , enable:false

                    });

                    // 고객캐어미션 그리드 시작
                    $("#custCareMgmtGrid").kendoExtGrid({
                        dataSource:{
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
                                        params["sStartStartDt"] = $("#sStartStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sStartEndDt"] = $("#sStartEndDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndStartDt"] = $("#sEndStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndEndDt"] = $("#sEndEndDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("custCareMgmtGrid param:"+kendo.stringify(params));

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
                                        ,useYn:{type:"string"}
                                        ,activeTpCd:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,activeTmplId:{type:"string"}
                                        ,custExtrTermNo:{type:"string"}
                                        ,custExtrAutoYn:{type:"string"}
                                        ,custExtrCycleCont:{type:"string"}
                                        ,custCareCont:{type:"string"}
                                        ,startDt:{type:"date"}
                                        ,endDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                        ,regDt:{type:"date"}

                                    }
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            custCareSeq = selectedItem.custCareSeq;

                            if (dms.string.isNotEmpty(custCareSeq)) {

                                var param = {
                                        "sCustCareSeq":custCareSeq
                                        };

                                $.ajax({
                                        url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmtByKey.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                        }
                                }).done(function(body) {

                                    console.log("고객케어 관리 상세 조회 결과:",body);

                                    initForm();

                                    $("#btnDelete").data("kendoButton").enable(true);
                                    $("#custCareSeq").val(body.custCareSeq);
                                    $("#batOperId").val(body.batOperId);
                                    $("#custCareNm").val(body.custCareNm);
                                    $("#useYn").data("kendoExtDropDownList").value(body.useYn);
                                    $("#activeTpCd").data("kendoExtDropDownList").value(body.activeTpCd);
                                    $("#autoActiveYn").data("kendoExtDropDownList").value(body.autoActiveYn);
                                    $("#activeTmplId").data("kendoExtDropDownList").value(body.activeTmplId);
                                    $("#custExtrTermNo").data("kendoExtDropDownList").value(body.custExtrTermNo);
                                    $("#custExtrAutoYn").data("kendoExtDropDownList").value(body.custExtrAutoYn);
                                    $("#tmpCustExtrAutoYn").val(body.custExtrAutoYn);
                                    $("#custExtrCycleCont").val(body.custExtrCycleCont);
                                    $("#custCareCont").val(body.custCareCont);

                                    $("#startDt").data("kendoExtMaskedDatePicker").value(body.startDt);
                                    $("#endDt").data("kendoExtMaskedDatePicker").value(body.endDt);

                                    $("#extrDgreCnt").val(body.extrDgreCnt);
                                    $("#lastExtrDt").val(body.lastExtrDt);
                                    $("#regUsrNm").val(body.regUsrNm);
                                    $("#regDt").val(body.regDt);

                                    // 고객추출조건 드롭다운리스트 다시 그려줌
                                    custExtrTermNoDDL();

                                    var sysDate = "${sysDate}"+" 00:00:00";
                                    var dateCompare = false;

                                    // 오늘날짜 - 시작일 비교 ( 시작일이 지났으면 true )
                                    if ( sysDate >= body.startDt ) {
                                        dateCompare = true;
                                    };

                                    // 대상자 추출 버튼 활성화:날짜 체크 ( 자동/수동여부에 상관없이 추출이 시작되면 조건이 바뀌면 안됨 )
                                    if ( !dateCompare && body.custExtrAutoYn === "N" && body.useYn === "Y" ) {
                                        $("#btnRcpeExtr").data("kendoButton").enable(true);
                                    }

                                    smsTmpEnabled();

                                    /*  고객케어 상세정보 리드온리
                                    **  1. 고객추출자동여부가 Y:시작일이후 - 현재일 >= 시작일 일경우 사용여부 빼고 리드온리
                                    **  2. 고객추출자동여부가 N:시작일이전 - 현재일 < 시작일 인경우 Y로 변경시.... 기존 대상자 목록 삭제하시겠습니까? confirm -> 기존 대상자 목록 삭제
                                    **  --------------------------
                                    **  시작일 이후에는 읽기전용
                                    */
                                    if ( dateCompare ) {
                                        readonlyForm();
                                    }

                                });


                            }

                        }
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid")
                            , rows = grid.tbody.find("tr")
                            , gridData
                            , selectRow

                            //console.log("isGridReload:" + isGridReload);

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
                        //,autoBind:false
                        ,editable:false
                        ,height:305
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"custCareNm", title:"<spring:message code='crm.lbl.custCareNm' />", width:100}            /* 고객케어명 */
                            ,{field:"custCareCont", title:"<spring:message code='crm.lbl.custCareCont' />", width:100}        /* 고객케어내용 */
                            ,{field:"activeTpCd", title:"<spring:message code='crm.lbl.activeTpCd' />", width:100             /* 실행유형 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= activeTpCdArrVal(activeTpCd)#'
                            }
                            ,{field:"custExtrTermNo", title:"<spring:message code='crm.lbl.custExtrTermNo' />", width:100             /* 고객추출조건 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= custExtrTermNoArrVal(custExtrTermNo)#'
                            }
                            ,{field:"activeTmplId", title:"<spring:message code='crm.lbl.activeTmplId' />", width:100         /* SMS템플릿 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= smsTemplateArrVal(activeTmplId)#'
                            }
                            ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:110      /* 고객추출자동여부*/
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrCycleCont", title:"<spring:message code='crm.lbl.custExtrCycleCont' />", width:110}      /* 고객추출주기*/
                            ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:60                        /* 사용여부*/
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt' />", width:100                    /* 시작일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100}             /* 등록자 */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                        ]
                    });
                    // 고객캐어미션 그리드 종료

                });

            </script>
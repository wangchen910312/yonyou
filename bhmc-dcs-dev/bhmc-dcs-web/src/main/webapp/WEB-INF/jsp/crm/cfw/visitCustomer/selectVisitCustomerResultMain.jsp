<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->

            <!-- 전시장 유동량관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.vsitCustResult" /><!-- 전시장 유동량 결과 입력 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnTdrvResv" ><spring:message code='global.btn.tdrvResv' /><!-- 시승예약 --></button>
                        <button type="button" class="btn_m" id="btnSaleOppt" ><spring:message code='global.lbl.saleOppt' /><!-- 판매기회 --></button>
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="visitCustMgmtSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                        <button type="button" class="btn_m btn_cancel" id="visitCustMgmtCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
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
                                <td class="required_area">
                                    <input type="hidden" id="vsitNo" name="vsitNo" data-json-obj="true" />
                                    <input type="hidden" id="leadNo" name="leadNo" data-json-obj="true" />
                                    <input type="hidden" id="docId" name="docId" data-json-obj="true" />
                                <div class="form_search" >
                                    <input id="custNm" name="custNm" class="form_input" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNm" />" data-bind="value:custNm" />
                                    <a href="javascript:;" id="custSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="hpNo" name="hpNo" class="form_input numberic" maxlength="14" data-json-obj="true" data-name="<spring:message code="global.lbl.hpNo" />" data-bind="value:hpNo" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <input type="hidden" id="custNo" name="custNo" data-json-obj="true" data-name="<spring:message code="global.lbl.custNo" />" data-bind="value:custNo" />
                                    <input id="viewCustNo" name="custNo" class="form_input form_readonly" disabled />
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
                                <th scope="row"><spring:message code='global.lbl.visitDt' /><!-- 내방일 --></th>
                                <td class="readonly_area">
                                    <input id="vsitDt" name="vsitDt" class="form_datetimepicker form_readonly" data-json-obj="true" style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.vsitDt" />" data-bind="value:vsitDt" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.visitEndDt' /><!-- 내방종료일 --></span></th>
                                <td class="required_area">
                                    <input id="vsitEndDt" name="vsitEndDt" class="form_datetimepicker" data-json-obj="true" required style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.visitEndDt" />" data-bind="value:visitEndDt" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.withPrsCnt" /><!-- 동행자수 --></th>
                                <td class="readonly_area">
                                    <input id="withPrsnCnt" name="withPrsnCnt" class="form_numeric form_readonly" data-json-obj="true" style="width:100%" data-name="<spring:message code="global.lbl.withPrsCnt" />" data-bind="value:withPrsCnt" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.visitPathCd" /><!-- 내방출처 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <span class="required_area"><input id="vsitSrcCd" name="vsitSrcCd" class="form_comboBox" data-json-obj="true" data-name="<spring:message code="global.lbl.visitPathCd" />" data-bind="value:vsitSrcCd" /></span>
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
                                <td class="readonly_area">
                                    <input id="vsitStatCd" name="vsitStatCd" class="form_comboBox" data-json-obj="true" style="width:100%" required data-name="<spring:message code="global.lbl.visitStatCd" />" data-bind="value:visitStatCd" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.resvDt" /><!-- 예약일시 --></th>
                                <td class="readonly_area">
                                    <input id="resvDt" name="resvDt" class="form_datetimepicker form_readonly" data-json-obj="true" required style="width:100%" type="date" data-format="<dms:configValue code='dateFormat' /> HH:mm" data-name="<spring:message code="global.lbl.resvDt" />" data-bind="value:resvDt" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.compareBrandCd" /><!-- 비교 타사 브랜드 --></th>
                                <td>
                                    <input id="compareBrandCd" name="compareBrandCd" class="form_comboBox" data-json-obj="true" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.compareModelCd" /><!-- 비교 타사 모델 --></th>
                                <td>
                                    <input type="text" id="compareModelCd" name="compareModelCd" class="form_input" data-json-obj="true" maxlength="25" style="width:100%" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.tdrvYn' /><!-- 시승여부 --></th>
                                <td>
                                    <label class="label_check"><input type="checkbox" id="tdrvYn" name="tdrvYn" class="form_check" data-json-obj="true" style="width:100%" value="Y" /></label>
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
                                <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                                <td colspan="5">
                                    <textarea rows="4" cols="" id="remark" name="remark" class="form_textarea" style="width:100%;" maxlength="1000" data-json-obj="true" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                <td class="required_area">
                                    <input type="hidden" id="scId" name="scId" data-json-obj="true" data-name="<spring:message code="sal.lbl.salesAdvisor" />" data-bind="value:scId" />
                                    <input type="text" id="scNm" name="scNm" class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                <td>
                                    <input id="regUsrId" name="regUsrId" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <input id="regDt" name="regDt" class="form_input form_readonly" style="width:100%" disabled />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //내방 상세 정보 -->

        </div>
        <!-- // 내방 상세정보 form -->


            <div class="clfix">
                <div class="left_areaStyle">
<!-- *************************************************************************
**************************파일업로드2:그리드 추가 html 추가 *********************
***************************************************************************-->
                    <!-- 첨부파일 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h3>
                            <div class="btn_right">
                                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                            </div>
                        </div>

                        <div class="table_grid">
                            <div id="fileGrid">
                            </div>
                        </div>

                    </section>
                    <!-- //첨부파일 -->
<!-- *************************************************************************
**************************파일업로드2:그리드 추가 html 추가 *********************
***************************************************************************-->
                </div>
                <div class="right_areaStyle">
                    <!-- 관심차 -->
                    <section class="group">
                        <div class="header_area">
                            <h3 class="title_basic"><spring:message code="global.lbl.intrCar" /><!-- 관심차 --></h3>
                            <div class="btn_right">
                                <button class="btn_s btn_add" id="btnAddVehic" ><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                                <button class="btn_s btn_delete" id="btnDelVehic" ><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
                                <button class="btn_s btn_cancel" id="btnCancelVehic" ><spring:message code='global.btn.cancel' /></button> <!-- 취소 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="carGrid">
                            </div>
                        </div>
                    </section>
                    <!-- //관심차 -->
                </div>
            </div>

            <!-- 내방이력 그리드 -->
            <section class="group">
                <div class="header_area">
                    <h3 class="title_basic"><spring:message code="global.lbl.visitHis" /><!-- 내방이력 --></h3>
                </div>
                <div class="table_grid">
                    <div id="tab1Grid"></div>
                </div>
            </section>
            <!-- //내방이력 그리드 -->

            <script type="text/javascript">

                var isGridReload            // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , visitCustomerMgmtNo   // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                ;

                // 관심차 체크박스
                $("#carGrid").on("click", "input.flagYn", function(e){

                    var carGrid = $("#carGrid").data("kendoExtGrid");
                    var uid = $(this).data("uid");

                    $("input.flagYn", "#carGrid").prop("checked", false);
                    $(this).prop("checked", true);

                    $.each(carGrid.dataSource.view(), function(idx, dataItem){
                        dataItem.set("flagYn", "N");
                    });

                    carGrid.dataSource.getByUid(uid).set("flagYn", "Y");

                });

                /*****************************************************************************
                **************************파일업로드3:파일 다운로드  ****************************
                *******************************************************************************/
                $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
                   var grid = $("#fileGrid").data("kendoExtGrid");
                   var dataItem = grid.dataItem(grid.select());

                   if( dms.string.isNotEmpty(dataItem) ){
                       dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
                   }
                });
               /*****************************************************************************
                **************************파일업로드3:파일 다운로드  ****************************
                *******************************************************************************/

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

                                        $("#custNo").val(data[0].custNo);
                                        $("#custNm").val(data[0].custNm);
                                        $("#hpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                        $("#scId").val(data[0].mngScId);
                                        $("#scNm").val(data[0].mngScNm);

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
                    $("#docId").val("");
                    $("#custNo").val("");
                    $("#viewCustNo").val("");
                    $("#custNm").val("");
                    $("#hpNo").data("kendoMaskedTextBox").value("");
                    $("#vsitDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#withPrsnCnt").data("kendoExtNumericTextBox").value("0");
                    $("#vsitSrcCd").data("kendoExtDropDownList").value("02");
                    $("#vsitSrcDetlCont").data("kendoExtDropDownList").value("");
                    $("#vsitGoalCd").data("kendoExtDropDownList").value("");
                    $("#vsitStatCd").data("kendoExtDropDownList").value("03");
                    $("#resvDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#compareBrandCd").data("kendoExtDropDownList").value("");
                    $("#compareModelCd").val("");
                    $("#scId").val("");
                    $("#scNm").val("");
                    $("#saleOpptYn").val("");
                    $("#saleOpptStepCd").val("");
                    $("#regUsrId").val("");
                    $("#regDt").val("");
                    $("#remark").val("");
                    $("#tdrvYn:checkbox").prop("checked",false);

                    $("#hpNo").data("kendoMaskedTextBox").enable(true);
                    $("#hpNo").removeClass('form_readonly');
                    $("#remark").attr("disabled", false).removeClass('form_readonly');

                    // 버튼 초기화
                    $("#btnTdrvResv").data("kendoButton").enable(false);         // 시승예약
                    $("#btnSaleOppt").data("kendoButton").enable(false);         // 판매기회
                    $("#visitCustMgmtSave").data("kendoButton").enable(false);   // 저장

                    // 첨부파일
                    $("#fileGrid").data("kendoExtGrid").dataSource.data([])
                    // 관심차 초기화
                    $("#carGrid").data("kendoExtGrid").dataSource.data([])

                    // 탭 그리드 초기화
                    $("#tab1Grid").data("kendoExtGrid").dataSource.data([]);

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

                        $("#btnTdrvResv").data("kendoButton").enable(true);         // 시승예약
                        $("#btnSaleOppt").data("kendoButton").enable(true);         // 판매기회
                        $("#visitCustMgmtSave").data("kendoButton").enable(true);   // 저장

                        if(body.reVisitYn == "Y"){
                            $("#reVisitLabel").append("<span class='txt_label bg_green'><spring:message code='global.lbl.revisit' /></span>");    // 재방문
                        }

                        $("#vsitNo").val(body.vsitNo);
                        $("#leadNo").val(body.leadNo);
                        $("#docId").val(body.docId);
                        $("#custNo").val(body.custNo);
                        $("#viewCustNo").val(body.custNo);
                        $("#custNm").val(body.custNm);
                        $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);

                        $("#vsitDt").data("kendoExtMaskedDateTimePicker").value(body.vsitDt);
                        $("#vsitEndDt").data("kendoExtMaskedDateTimePicker").value(body.vsitEndDt);
                        $("#withPrsnCnt").data("kendoExtNumericTextBox").value(body.withPrsnCnt);

                        $("#vsitSrcCd").data("kendoExtDropDownList").value(body.vsitSrcCd);
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
                        $("#compareBrandCd").data("kendoExtDropDownList").value(body.compareBrandCd);
                        $("#compareModelCd").val(body.compareModelCd);

                        $("#saleOpptYn").val(body.saleOpptYn);
                        $("#saleOpptStepCd").val(saleOpptStepCdArrVal(body.saleOpptStepCd));


                        $("#scId").val(body.scId);
                        $("#scNm").val(body.scNm);
                        $("#regUsrId").val(body.regUsrNm);
                        $("#regDt").val(body.regDt);

                        $("#remark").val(body.remark);

                        if ( body.tdrvYn === "Y" ) {
                            $("#tdrvYn:checkbox").prop("checked",true);
                        } else {
                            $("#tdrvYn:checkbox").prop("checked",false);
                        }


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

                        $("#carGrid").data("kendoExtGrid").dataSource.read();
                        $("#fileGrid").data("kendoExtGrid").dataSource.read();

                        // TODO 전시장 유동량 목록에 고객번호가 없는경우도 있음. 고객번호가 없는경우 내방이력 그리드 조회 하지말자
                        var grid = $("#visitCustomerGrid").data("kendoExtGrid");
                        var selectedVal = grid.dataItem(grid.select());
                        var custNo = selectedVal.custNo;

                        if ( dms.string.isNotEmpty(custNo) ) {
                            $("#tab1Grid").data("kendoExtGrid").dataSource.read();
                        }

                    });

                }

                /******************************************************
                 * 관심차종 그리드 (DataSource)- 시작
                 ******************************************************/
                 //차종조회
                 var carLineCdDSList = [];
                 var carLineCdObj = {};
                 <c:forEach var="obj" items="${carLineCdInfo}">
                    carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
                    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
                 </c:forEach>

                 //그리드 모델 콤보 DataSource
                 var modelCdDSList = [];
                 var modelCdObj = {};

                 // 그리드 외장색 콤보 DataSource
                 var extColorCdDSList = [];
                 var extColorCdObj = {};

                 // 그리드 내장색 콤보 DataSource
                 var intColorCdDSList = [];
                 var intColorCdObj = {};

                 // 차량모델DS (검색조건이랑 그리드. 두곳에서 사용중이라서 function 으로 뺐음)
                 function getModelCdDSList(carlineCd){

                     if (dms.string.isEmpty(carlineCd)) {
                         return;
                     }

                     var responseJson = dms.ajax.getJson({
                         url:_contextPath + "/sal/cnt/contractPackage/selectModel.do"
                         ,data:JSON.stringify({"carlineCd":carlineCd})
                         ,async:false
                     });
                     modelCdDSList = responseJson.data;

                     if(modelCdDSList === null){
                         // 해당 차종에 따른 모델이 없습니다. 차종을 다시 선택해주세요.
                         dms.notification.error("<spring:message code='crm.lbl.carLineNOTmodel' />");
                         return;
                     }

                     return modelCdDSList;


                 }
                 /**
                  * 차종에 따른 모델 조회 ( 드롭다운 리스트 )
                  */
                 function selectCarlineCd(e) {
                     var dataItem = this.dataItem(e.item);

                     modelCdDSList = getModelCdDSList(dataItem.carlineCd);

                     $("#sIntrModel").data("kendoExtDropDownList").setDataSource(modelCdDSList);

                 };

                 /**
                  * 차종에 따른 모델 조회 ( 관심차 그리드 )
                  */
                 function selectGridCarlineCd(e) {
                     var dataItem = this.dataItem(e.item);

                     var grid = $("#carGrid").data("kendoExtGrid");
                     var selectRow = grid.dataItem(grid.select());

                     selectRow.set("carlineNm", dataItem.carlineNm);
                     selectRow.set("modelCd", '');
                     selectRow.set("modelNm", '');
                     selectRow.set("extColorCd", '');
                     selectRow.set("extColorNm", '');
                     selectRow.set("intColorCd", '');
                     selectRow.set("intColorNm", '');

                     modelCdDSList = getModelCdDSList(dataItem.carlineCd);

                     modelCdObj = {};
                     if(modelCdDSList != null){
                         $.each(modelCdDSList, function(idx, obj){
                             modelCdObj[obj.modelCd] = obj.modelNm;
                         });
                     }

                 };

                 // 모델에 따른 외장색 조회
                 function selectGridModelCd(e) {

                     var dataItem = this.dataItem(e.item);
                     var grid = $("#carGrid").data("kendoExtGrid");
                     var selectRow = grid.dataItem(grid.select());

                     selectRow.set("modelNm", dataItem.modelNm);
                     selectRow.set("extColorCd", '');
                     selectRow.set("extColorNm", '');
                     selectRow.set("intColorCd", '');
                     selectRow.set("intColorNm", '');

                     var responseJson = dms.ajax.getJson({
                         url:_contextPath + "/sal/cnt/contractPackage/selectExtColor.do"
                         ,data:JSON.stringify({"modelCd":dataItem.modelCd})
                         ,async:false
                     });
                     extColorCdDSList = responseJson.data;

                     if(extColorCdDSList === null){
                         // 해당 모델에 따른 외장색이 없습니다. 모델을 다시 선택해주세요.
                         dms.notification.error("<spring:message code='crm.lbl.modelNOToutColor' />");
                         return;
                     }

                     extColorCdObj = {};
                     if(extColorCdDSList != null){
                         $.each(extColorCdDSList, function(idx, obj){
                             extColorCdObj[obj.extColorCd] = obj.extColorNm;
                         });
                     }

                 };

                 //외장색에 따른 내장색 조회:모델값으로 조회
                 function selectGridExtColorCd(e) {
                     var dataItem = this.dataItem(e.item);
                     var grid = $("#carGrid").data("kendoExtGrid");
                     var selectRow = grid.dataItem(grid.select());

                     selectRow.set("extColorNm", dataItem.extColorNm);
                     selectRow.set("intColorCd", '');
                     selectRow.set("intColorNm", '');

                     var responseJson = dms.ajax.getJson({
                         url:_contextPath + "/sal/cnt/contractPackage/selectIntColor.do"
                         ,data:JSON.stringify({"modelCd":selectRow.modelCd})
                         ,async:false
                     });
                     intColorCdDSList = responseJson.data;

                     if(intColorCdDSList === null){
                         // 해당 외장색에 따른 내장색이 없습니다. 외장색을 다시 선택해주세요.
                         dms.notification.error("<spring:message code='crm.lbl.outColorNOTintColor' />");
                         return;
                     }

                     intColorCdObj = {};
                     if(intColorCdDSList != null){
                         $.each(intColorCdDSList, function(idx, obj){
                             intColorCdObj[obj.intColorCd] = obj.intColorNm;
                         });
                     }
                 };

                 //내장색 선택
                 function selectGridIntColorCd(e) {
                     var dataItem = this.dataItem(e.item);
                     var grid = $("#carGrid").data("kendoExtGrid");
                     var selectRow = grid.dataItem(grid.select());

                     selectRow.set("intColorNm", dataItem.intColorNm);
                 };

                 //1 Grid- 차종의 template 정의
                 function bf_selectCarLine(carlineCd) {
                    if(carlineCd == ""){
                        return "";
                    }else{
                        return carLineCdObj[carlineCd];
                    }
                 }

                 //2 Grid- 모델의 template 정의
                 function bf_selectModel(modelCd, modelNm){

                     if ( dms.string.isEmpty(modelNm) ||  dms.string.isEmpty(modelCd) ){
                         return "";
                     }
                     if(modelNm != ""){
                         return modelNm;
                     }
                     if(modelCd == ""){
                         return "";
                     }

                     return modelCdObj[modelCd];
                 }

                 //4 Grid - 외장색의 template 정의
                 function bf_selectExtColor(extColorCd, extColorNm){

                     if ( dms.string.isEmpty(extColorNm) ||  dms.string.isEmpty(extColorCd) ){
                         return "";
                     }
                     if ( extColorNm != "" ) {
                        return extColorNm;
                     }
                     if ( extColorCd == "" ) {
                         return "";
                     }
                     return extColorCdObj[extColorCd];
                 }

                 //5 Grid - 내장색의 template 정의
                 function bf_selectIntColor(intColorCd, intColorNm){

                     if ( dms.string.isEmpty(intColorCd) ||  dms.string.isEmpty(intColorNm) ){
                         return "";
                     }
                     if(intColorNm != ""){
                         return intColorNm;
                     }
                     if(intColorCd == ""){
                         return "";
                     }
                     return intColorCdObj[intColorCd];
                 }
                 /******************************************************
                 * 관심차종 그리드 (DataSource)- 종료
                 ******************************************************/

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

                // 성별
                var sexCdArr = [];
                <c:forEach var="obj" items="${sexCdList}">
                    sexCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                sexCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = sexCdArr[val];
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

                // 내방출처 상세
                var vsitSrcDetlContDs = [];
                <c:forEach var="obj" items="${vsitSrcDetlContList}">
                    vsitSrcDetlContDs.push({text:"${obj.makNm}", value:"${obj.makCd}"});
                </c:forEach>

                // 구매시기

                // 비교타사브랜드
                var compareBrandCdDs = [];
                var compareBrandCdArr = [];
                <c:forEach var="obj" items="${compareBrandCdList}">
                    compareBrandCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    compareBrandCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                compareBrandCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = compareBrandCdArr[val];
                    }
                    return returnVal;
                };

                // 판매기회단계 DS
                var saleOpptStepCdArr = [];
                <c:forEach var="obj" items="${saleOpptStepCdList}">
                    saleOpptStepCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                saleOpptStepCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = saleOpptStepCdArr[val];
                    }
                    return returnVal;
                };

                /******************************************************************************/
                /**********************내방이력 그리드 컬럼 데이터  설정 종료***************************/
                /******************************************************************************/


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
                    $("#hpNo").focusout(function(){
                        $(this).val($.trim($(this).val()));
                    });

                    // 방문 일시
                    $("#vsitDt").kendoExtMaskedDateTimePicker({
                        format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#vsitDt").data("kendoExtMaskedDateTimePicker").readonly(true);

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
                    $("#resvDt").data("kendoExtMaskedDateTimePicker").readonly();           // TODO 리드온리 속성은 validate 안먹음

                    // 내방출처
                    $("#vsitSrcCd").kendoExtDropDownList({
                        dataSource:vsitSrcCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:2
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
                    $("#vsitStatCd").data("kendoExtDropDownList").readonly(true);

                    // 동행자수
                    $("#withPrsnCnt").kendoExtNumericTextBox({
                         format:"#"
                        ,min:0
                        ,value:0
                    });
                    $("#withPrsnCnt").data("kendoExtNumericTextBox").enable(true);

                    // 비교타사브랜드
                    $("#compareBrandCd").kendoExtDropDownList({
                        dataSource:compareBrandCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 시승예약
                    $("#btnTdrvResv").kendoButton({
                        click:function(e){


                            // 내방 리스트 그리드의 선택된 vsitNo
                            var grid = $("#visitCustomerGrid").data("kendoExtGrid")
                            , selectedVal = grid.dataItem(grid.select())
                            , vsitNo
                            , custRegResult = false

                            if ( dms.string.isNotEmpty(selectedVal) ) {

                                vsitNo = selectedVal.vsitNo;
                                custNm = selectedVal.custNm;
                                hpNo = selectedVal.hpNo;

                                if( dms.string.isEmpty(custNm) ){
                                    // {고객명}을(를) 저장해 주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.custNm' var='arguMsg' /><spring:message code='crm.err.checkSave' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if( dms.string.isEmpty(hpNo) ){
                                    // {휴대전화}을(를) 저장해 주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='crm.err.checkSave' arguments='${arguMsg}'/>");
                                    return;
                                }

                                //window.open("<c:url value='/crm/cso/testDrive/selectTestDriveResvMain.do' />?vsitNo="+vsitNo); //시승 예약
                                window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.testDriveResv' />", "<c:url value='/crm/cso/testDrive/selectTestDriveResvMain.do' />?vsitNo="+vsitNo, "VIEW-I-10249"); //시승 예약

                            } else {
                                // {내방정보}을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.visitInfo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;
                            }

                        }
                        , enable:false
                    });

                    // 판매기회
                    $("#btnSaleOppt").kendoButton({
                        click:function(e){

                            // 내방 리스트 그리드의 선택된 vsitNo
                            var grid = $("#visitCustomerGrid").data("kendoExtGrid")
                            , selectedVal = grid.dataItem(grid.select())
                            , vsitNo
                            , custNo
                            , custRegResult = false

                            if ( dms.string.isNotEmpty(selectedVal) ) {

                                vsitNo = selectedVal.vsitNo;
                                custNo = selectedVal.custNo;
                                custNm = selectedVal.custNm;
                                hpNo = selectedVal.hpNo;

                                if( dms.string.isEmpty(custNm) ){
                                    // {고객명}을(를) 저장해 주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.custNm' var='arguMsg' /><spring:message code='crm.err.checkSave' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if( dms.string.isEmpty(hpNo) ){
                                    // {휴대전화}을(를) 저장해 주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.hpNo' var='arguMsg' /><spring:message code='crm.err.checkSave' arguments='${arguMsg}'/>");
                                    return;
                                }

                                if ( dms.string.isNotEmpty(custNo) ) {

                                    custRegResult = true;

                                } else {

                                    // 판매기회 등록전. 고객번호가 없으면 고객 등록후 넘어간다.
                                    $.ajax({
                                            url:"<c:url value='/crm/cfw/visitCustomer/customerInfoReg.do' />?vsitNo="+vsitNo
                                            //,data:JSON.stringify(param)      //파라미터
                                            ,type:'POST'                        //조회요청
                                            ,dataType:'json'                  //json 응답
                                            ,contentType:'application/json'   //문자열 파라미터
                                            ,async:false
                                            ,error:function(jqXHR,status,error){
                                                dms.notification.error(jqXHR.responseJSON.errors);
                                            }
                                    }).done(function(jqXHR,status) {
                                        console.log("custRegResult:" , custRegResult)

                                        custRegResult = true;
                                        custNo = jqXHR;

                                        // TODO 고객등록 -> 내방번호에 고객번호 수정 -> 그리드 새로고침하면 고객번호가 있기 때문에 문제 없는데. 해당 탭에서 새로고침 안하고 다시 판매기회를 가게되면 고객번호가 없으므로 분제가됨
                                        // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                        $("#visitCustomerGrid").data("kendoExtGrid").dataSource.page(1);
                                        //var vsitNo = jqXHR;
                                        isGridReload = true;
                                        visitCustomerMgmtNo = vsitNo;

                                    });

                                }

                            } else {
                                // {내방정보}을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.visitInfo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;
                            }

                            console.log("custRegResult:",custRegResult)
                            // TODO 판매기회로 넘어갈때 해당 내방으로 등록된 판매기회가 있는지 체크해야 하나??
                            if ( custRegResult ) {

                                console.log("2222")
                                //window.open("<c:url value='/crm/cso/salesOppt Mgmt/selectSalesOpptMgmtMain.do' />?vsitNo="+vsitNo); //판매기회관리
                                window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.opportunityMng' />", "<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMain.do' />?vsitNo="+vsitNo+"&custNo="+custNo, "VIEW-I-10237"); //판매기회관리

                            //} else {
                                // {내방정보}을(를) 확인하여 주세요.
                                //dms.notification.warning("<spring:message code='global.lbl.visitInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                //return;
                            }

                        }
                        , enable:false
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

                            if (validator.validate()) {

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

                                    if( dms.string.isNotEmpty(vsitEndDt) ){

                                        if(vsitEndDt < vsitDt){
                                            // 내방종료일 / 을(를) 확인하여 주세요.
                                            dms.notification.warning("<spring:message code='global.lbl.visitEndRealDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                            return;
                                        }

                                    }

                                    // 내방일이 있는경우 내방상태는 내방 필수
                                    if( $("#vsitStatCd").val() != "03" ){
                                        // 내방상태를 내방으로 입력해주세요.
                                        dms.notification.warning("<spring:message code='crm.err.visitStatConfirm' />");
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
                                    if( $("#vsitStatCd").val() != "03" ){
                                        // 내방상태를 내방으로 입력해주세요.
                                        dms.notification.warning("<spring:message code='crm.err.visitStatConfirm' />");
                                        return;
                                    }

                                }

                                // 내방상태가 내방일경우 내방일 필수
                                if( $("#vsitStatCd").val() == "03" ){
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
                                saveFormData.custNm = $("#custNm").val();

                                console.log("saveData:" + JSON.stringify(saveFormData));
                                //return;

                                // 그리드 validation
                                var carGrid = $("#carGrid").data("kendoExtGrid");
                                var saveGridData = carGrid.getCUDData("insertList", "updateList", "deleteList");

                                var insertList = saveGridData.insertList.length;        // grid insert 항목 // 수정일때..
                                var gridDataLength;                                     // grid data 수량     // 신규일때(dataSource를 안불러옴), 수정일때 ..
                                if( dms.string.isEmpty($("#vsitNo").val()) ){
                                    gridDataLength = 0;
                                }else{
                                    gridDataLength = carGrid._data.length;
                                }

                                var gridDataChk = parseInt(insertList)+parseInt(gridDataLength);

                                /*
                                // 내방에서는 관심차가 필수 항목이 아님.
                                if(gridDataChk < 1 ){
                                    // 관심차 / 을(를) 입력해주세요.
                                    dms.notification.warning("<spring:message code='global.lbl.intrCar' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    return;
                                }
                                */
                                // 관심차 정보가 있을경우 validation 체크
                                if(gridDataChk > 0 ) {

                                    // 그리드 무결성 점검
                                    var dataValidate = false;
                                    $.each(saveGridData.insertList, function(idx, row){
                                        if(row.carlineCd == ""){
                                           // 선택하지 않은 차종이 있습니다.
                                           dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCarLine}' />");
                                           dataValidate = true;
                                           return false;
                                        }
                                        if(row.modelCd == ""){
                                            // 선택하지 않은 모델이 있습니다.
                                            dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                                            dataValidate = true;
                                            return false;
                                        }
                                        if(row.extColorCd == ""){
                                            // 선택하지 않은 외장색이 있습니다.
                                            dms.notification.info("<spring:message code='crm.lbl.extColorCd' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                                            dataValidate = true;
                                            return false;
                                        }
                                        if(row.intColorCd == ""){
                                            // 선택하지 않은 내장색이 있습니다.
                                            dms.notification.info("<spring:message code='crm.lbl.intColorCd' var='globalLblModel' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblModel}' />");
                                            dataValidate = true;
                                            return false;
                                        }
                                     });

                                    if(dataValidate){ return false; }

                                    if($("input.flagYn:checked", "#carGrid").length != 1 ){
                                        // 대표차 / 을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='global.lbl.typicalCar' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                        return false;
                                    }

                                }

                                var saveData = $.extend(
                                        {"visitCustomerVO":saveFormData}
                                        , saveGridData
                                )

                                console.log("visit saveData:" + JSON.stringify(saveData))
                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/cfw/visitCustomer/multiVisitCustomerResultMgmt.do' />",
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

                            }
                            // validatrion 종료

                        }
                        , enable:false
                    });

                    // 취소 - 초기화 또는 다시 조회
                    $("#visitCustMgmtCancel").kendoButton({
                        click:function(e){

                            /*
                            **  초기화 기능 아님!!
                            ** 선택된 방문에 대한 재조회
                            */
                            var vsitNo = $("#vsitNo").val();
                            if(vsitNo ==  ""){
                                initForm();
                            } else {

                                // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                $("#visitCustomerGrid").data("kendoExtGrid").dataSource.page(1);
                                isGridReload = true;
                                visitCustomerMgmtNo = vsitNo;

                            }

                        }
                    });

                    // 추가 - carGrid
                    $("#btnAddVehic").kendoButton({
                        click:function(e) {

                            $("#carGrid").data("kendoExtGrid").dataSource.insert(0,{
                                seq:""

                                ,carlineCd  :""
                                ,carlineNm  :""
                                ,modelCd    :""
                                ,modelNm    :""
                                ,extColorCd :""
                                ,extColorNm :""
                                ,intColorCd :""
                                ,intColorNm :""

                                ,refTableNm:"CR_0206T"
                                ,flagYn:"N"
                            });
                        }
                    });

                    // 삭제 - carGrid
                    $("#btnDelVehic").kendoButton({
                       click:function(e) {

                           var grid = $("#carGrid").data("kendoExtGrid");
                           var rows = grid.select();

                           rows.each(function(index, row) {
                               grid.removeRow(row);
                           });

                       }
                    });

                    // 취소 - carGrid
                    $("#btnCancelVehic").kendoButton({
                       click:function(e) {
                           $('#carGrid').data('kendoExtGrid').cancelChanges();
                       }
                    });

                    // 내방 그리드 시작
                    $("#visitCustomerGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerResults.do' />"
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
                                            sort.push({dir:"desc", field:"vsitResult"});
                                        } else {
                                            sort = options.sort
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
                                        ,regUsrNm:{type:"string"}
                                        ,resvDt:{type:"date"}
                                        ,vsitDt:{type:"date"}
                                        ,vsitEndDt:{type:"date"}
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
                            ,{field:"vsitDt", title:"<spring:message code='global.lbl.visitDt' />", width:120                /* 내방일시 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"vsitEndDt", title:"<spring:message code='global.lbl.visitEndDt' />", width:120           /* 내방종료일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"reVsitYn", title:"<spring:message code='global.lbl.revisit' />", width:100               /* 재방문 */
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}                 /* 고객명 */
                            ,{field:"sexCd", title:"<spring:message code='global.lbl.sex' />", width:60                       /* 성별 */
                                , attributes:{"class":"ac"}
                                , template:'#= sexCdArrVal(sexCd)#'
                            }
                            ,{field:"custCd", title:"<spring:message code='global.lbl.custCd' />", width:100                  /* 잠재/보유고객 */
                                , template:'#= custCdArrVal(custCd)#'
                            }
                            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:110}                     /* 휴대전화 */
                            ,{field:"vsitSrcCd", title:"<spring:message code='global.lbl.visitPathCd' />", width:100          /* 내방출처 */
                                , template:'#= vsitSrcCdArrVal(vsitSrcCd)#'
                            }
                            ,{field:"vsitGoalCd", title:"<spring:message code='global.lbl.visitPpsCd' />", width:100          /* 내방목적 */
                                , template:'#= vsitGoalCdArrVal(vsitGoalCd)#'
                            }
                            ,{field:"carLineNm", title:"<spring:message code='global.lbl.intrCarLine' />", width:150}         /* 관심차종*/
                            ,{field:"modelNm", title:"<spring:message code='global.lbl.intrModel' />", width:220}             /* 관심모델 */
                            ,{field:"compareBrandCd", title:"<spring:message code='global.lbl.compareBrandCd' />", width:120  /* 비교 타사 브랜드 */
                                , template:'#= compareBrandCdArrVal(compareBrandCd)#'
                            }
                            ,{field:"compareModelCd", title:"<spring:message code='global.lbl.compareModelCd' />", width:100} /* 비교 타사 모델 */
                            ,{field:"scNm", title:"<spring:message code='sal.lbl.salesAdvisor' />", width:100}                 /* 판매고문 */
                            ,{field:"saleOpptYn", title:"<spring:message code='global.lbl.saleOpptYn' />", width:100           /* 판매기회여부 */
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:150   /* 판매기회단계 */
                                , template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                            }
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                     /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                        ]
                    });
                    // 내방 그리드 종료


                /* *************************************************************************
                **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
                ***************************************************************************/
                    // 파일 그리드 시작 //
                    $("#fileGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        // 내방 리스트 그리드의 선택된 CUST_NO
                                        var grid = $("#visitCustomerGrid").data("kendoExtGrid");
                                        var dataItem = grid.dataItem(grid.select());

                                        params["sFileDocNo"] = $("#docId").val();
                                        console.log("fileGrid:"+kendo.stringify(params));

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
//                        ,change:function(e){
//                             var dataItem = e.sender.dataItem(e.sender);

//                             if(dms.string.isNotEmpty(dataItem)){
//                                 dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
//                             }
//                        }
                       ,autoBind:false
                       ,editable:false
                       ,height:135
                       ,multiSelectWithCheckbox:true
                       ,navigatable:false
                       ,pageable:false
                       ,sortable:false
                       ,selectable:"multiple"
                       ,columns:[
                           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
                          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
                          ,{title:""}

                       ]
                   });
                   // 파일 그리드 종료 //
                /* *************************************************************************
                **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
                ***************************************************************************/

                    // 관심차 그리드 시작 //
                    $("#carGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cmm/carLineInfo/selectCarLineInfo.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;


                                        /*
                                         * 1. 판매기회 그리드의 선택된 SALE_OPPT_SEQ
                                         * 2. 리드/내방번호가 있으면 리드/내방번호

                                        var grid = $("#visitCustomerGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());

                                        var carGridRefTableNm;
                                        var carGridRefKeyNm;

                                        if( dms.string.isNotEmpty(selectedVal) ){
                                            carGridRefTableNm = "CR_0206T";
                                            carGridRefKeyNm = selectedVal.vsitNo;
                                        }else{
                                            //carGridRefTableNm = "CR_0202T";
                                            //carGridRefKeyNm = selectedVal.leadNo;
                                        }
                                        */

                                        params["sRefTableNm"]           = "CR_0206T";
                                        params["sRefKeyNm"]             = $("#vsitNo").val()

                                        console.log('carGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                         seq           :{type:"string"}
                                        ,rnum          :{type:"number" , editable:false}
                                        ,carlineCd     :{type:"string"}
                                        ,carlineNm     :{type:"string"}
                                        ,modelCd       :{type:"string"}
                                        ,modelNm       :{type:"string"}
                                        ,extColorCd    :{type:"string"}
                                        ,extColorNm    :{type:"string"}
                                        ,intColorCd    :{type:"string"}
                                        ,intColorNm    :{type:"string"}
                                        ,flagYn        :{type:"string", editable:true}
                                        ,regDt         :{type:"date"}
                                        ,updtDt        :{type:"date"}
                                    }
                                }
                            }
                        }
                       ,multiSelectWithCheckbox:true
                       ,editableOnlyNew:true
                       ,editableOnlyNewExcludeColumns:["modelCd"]
                       ,autoBind:false
                       //,editable:false
                       ,height:135
                       ,navigatable:false
                       ,pageable:false
                       ,sortable:false
                       ,selectable:"multiple"

                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:45, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{  // 관심차종
                                 field:"carlineCd"
                                ,title:"<spring:message code='global.lbl.intrCarLine' />"
                                ,width:150
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#=bf_selectCarLine(carlineCd)#"
                                ,editor:function (container, options){
                                    if( options.model.seq == "" || options.model.carlineCd == ""){
                                        $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            , dataTextField:"carlineNm"
                                            , dataValueField:"carlineCd"
                                            , dataSource:carLineCdDSList
                                            , select:selectGridCarlineCd
                                            /*
                                            , change:function(e){
                                                if(modelCdDSList == null){return false;}

                                                var grid = $("#carGrid").data("kendoExtGrid");
                                                var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(3)");
                                                grid.editCell(modelCell);

                                            }
                                            */
                                        });
                                    }else{
                                        container.context.innerText = dms.string.strNvl(carLineCdObj[options.model.carlineCd]);
                                    }
                                }
                            }
                            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
                            ,{    // 관심모델
                                 field:"modelCd"
                                ,title:"<spring:message code='global.lbl.intrModel' />"
                                ,width:150
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#= bf_selectModel(modelCd, modelNm) #"
                                ,editor:function (container, options){

                                    if(     options.model.carlineCd != "" && (options.model.modelCd == "" || options.model.seq == "") ){
                                        $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            ,dataTextField:"modelNm"
                                            ,dataValueField:"modelCd"
                                            ,dataSource:modelCdDSList
                                            , select:selectGridModelCd
                                            /*
                                            , change:function(e){

                                                if(extColorCdDSList == null){return false;}

                                                var grid = $("#carGrid").data("kendoExtGrid");
                                                var extColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(5)");

                                                grid.editCell(extColorCell);

                                            }
                                            */
                                        });
                                    }else{
                                        if(options.model.modelNm != ""){
                                            container.context.innerText = options.model.modelNm;
                                        }else{
                                            // 관심차종 / 을(를) 선택해주세요.
                                            container.context.innerText = "<spring:message code='global.lbl.intrCarLine' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                       }
                                   }
                               }
                           }
                           ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
                           ,{    // 외장색
                                 field:"extColorCd"
                                ,title:"<spring:message code='global.lbl.extColor' />"
                                ,width:100
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#= bf_selectExtColor(extColorCd, extColorNm) #"
                                ,editor:function (container, options){

                                    if( options.model.modelCd != "" && (options.model.extColorCd == "" || options.model.seq == "" ) ){
                                        $('<input name="extColorCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            ,dataTextField:"extColorNm"
                                            ,dataValueField:"extColorCd"
                                            ,dataSource:extColorCdDSList
                                            ,select:selectGridExtColorCd
                                            /*
                                            ,change:function(e){
                                                if(intColorCdDSList == null){return false;}

                                                var grid = $("#carGrid").data("kendoExtGrid");
                                                var intColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(7)");
                                                grid.editCell(intColorCell);
                                            }
                                            */
                                        });
                                    }else{
                                        if(options.model.extColorNm != ""){
                                            container.context.innerText = options.model.extColorNm;
                                        }else{
                                            // 관심모델 / 을(를) 선택해주세요.
                                            container.context.innerText = "<spring:message code='global.lbl.intrModel' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                        }
                                    }
                                }
                            }
                            ,{field:"extColorCd", hidden:true}       // 외장색
                            ,{    // 내장색
                                 field:"intColorCd"
                                ,title:"<spring:message code='global.lbl.intColor' />"
                                ,width:100
                                //,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                                ,template:"#= bf_selectIntColor(intColorCd, intColorNm) #"
                                ,editor:function (container, options){

                                    if(     options.model.extColorCd != "" && (options.model.intColorCd == "" || options.model.seq == "") ){
                                        $('<input name="intColorCd" data-bind="value:' + options.field + '"/>')
                                        .appendTo(container)
                                        .kendoExtDropDownList({
                                            autoBind:false
                                            ,dataTextField:"intColorNm"
                                            ,dataValueField:"intColorCd"
                                            ,dataSource:intColorCdDSList
                                            ,select:selectGridIntColorCd
                                        });
                                    }else{
                                        if(options.model.intColorNm != ""){
                                            container.context.innerText = options.model.intColorNm;
                                        }else{
                                            // 외장색 / 을(를) 선택해주세요.
                                            container.context.innerText = "<spring:message code='crm.lbl.extColorCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                        }
                                    }
                                }
                            }
                            ,{field:"intColorNm", hidden:true}       // 내장색
                            ,{template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:45, attributes:{"class":"ac"}}
                       ]
                   });
                   // 관심차 그리드 종료 //

                    // tab1Grid 그리드 시작
                    $("#tab1Grid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cfw/visitCustomer/selectVisitCustomerMgmtHistorys.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        // 내방 리스트 그리드의 선택된 CUST_NO
                                        var grid = $("#visitCustomerGrid").data("kendoExtGrid");
                                        var selectedVal = grid.dataItem(grid.select());
                                        if ( dms.string.isNotEmpty(selectedVal) ) {
                                            params["sCustNo"] = selectedVal.custNo;
                                        }

                                        console.log("내방이력 그리드 " + kendo.stringify(params));

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
                                        ,vsitNo:{type:"string", editable:false}
                                        ,regUsrNm:{type:"string", editable:false}
                                        ,resvDt:{type:"date", editable:false}
                                        ,vsitDt:{type:"date", editable:false}
                                        ,regDt:{type:"date", editable:false}
                                    }
                                }
                            }
                        }
                        ,autoBind:false
                        ,editable:false
                        ,height:273
                        ,navigatable:false
                        ,pageable:false
                        ,sortable:false
                        //,selectable:"row"
                        ,columns:[

                                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                        ,attributes:{"class":"ac"}
                                    }
                                    ,{field:"vsitDt", title:"<spring:message code='global.lbl.visitDt' />", width:120, attributes:{"class":"ac"}/* 내방일시 */
                                        ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                                    }
                                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}/* 고객명 */
                                    ,{field:"custCd", title:"<spring:message code='global.lbl.custCd' />", width:100      /* 잠재/보유고객 */
                                        ,template:'#= custCdArrVal(custCd)#'
                                    }
                                    ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:110}/* 휴대전화 */
                                    ,{field:"vsitSrcCd", title:"<spring:message code='global.lbl.visitPathCd' />", width:100/* 내방출처 */
                                        ,template:'#= vsitSrcCdArrVal(vsitSrcCd)#'
                                    }
                                    ,{field:"carLineNm", title:"<spring:message code='global.lbl.intrCarLine' />", width:150}/* 관심차종*/
                                    ,{field:"modelNm", title:"<spring:message code='global.lbl.intrModel' />", width:220}/* 관심모델 */
                                    ,{field:"compareBrandCd", title:"<spring:message code='global.lbl.compareBrandCd' />", width:120        /* 비교 타사 브랜드 */
                                        ,template:'#= compareBrandCdArrVal(compareBrandCd)#'
                                    }
                                    ,{field:"compareModelCd", title:"<spring:message code='global.lbl.compareModelCd' />", width:120}/* 비교 타사 모델 */
                                    ,{field:"scNm", title:"<spring:message code='sal.lbl.salesAdvisor' />", width:100}  /* 판매고문 */
                                    ,{field:"saleOpptYn", title:"<spring:message code='global.lbl.saleOpptYn' />", width:100, attributes:{"class":"ac"}}/* 판매기회여부 */
                                    ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}/* 등록일 */
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{title:""}
                        ]

                    });
                    // tab1Grid 그리드 종료


                /* *************************************************************************
                **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
                ***************************************************************************/
                    //========파일삭제
                    $("#fileDelete").click(function(){
                        var grid = $("#fileGrid").data("kendoExtGrid");
                        var rows = grid.select();

                        if (rows.length < 1) {
                            //목록을 선택하여 주십시오.
                            dms.notification.info("<spring:message code='global.info.required.select'/>");
                            return;
                        }

                        var deleteList = [];
                        rows.each(function(index, row) {
                            var dataItem = grid.dataItem(row);
                            deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
                        });

                        $.ajax({
                            url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                            ,data:JSON.stringify(deleteList)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR, status, error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(jqXHR, textStatus) {

                                grid.dataSource._destroyed = [];
                                grid.dataSource.read();

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });
                    });

                    /* *************************************************************************
                     **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
                     ***************************************************************************/

                });



                /* *************************************************************************
                **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
                ***************************************************************************/
                //================================
                var r = new Resumable({
                    target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
                    ,chunkSize:1 * 1024 * 1024
                    ,simultaneousUploads:4
                    ,testChunks:true
                    ,throttleProgressCallbacks:1
                    ,method:"octet"
                });
                r.assignBrowse($('#fileSelect')[0]);

                //파일추가 이벤트
                r.on('fileAdded', function(file) {

                    $("#progressWindow").kendoWindow({
                        width:"600px"
                        ,height:"300px"
                        ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
                        ,animation:false
                        ,draggable:false
                        ,visible:false
                        ,resizable:false
                        ,modal:true
                    }).data("kendoWindow").center().open();


                    $('.resumable-progress, .resumable-list').show();
                    $('.resumable-progress .progress-resume-link').hide();
                    $('.resumable-progress .progress-pause-link').show();

                    //파일목록 출력
                    $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
                    $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

                    //업로드 시작
                    r.upload();

                });
                r.on('pause', function() {
                    $('.resumable-progress .progress-resume-link').show();
                    $('.resumable-progress .progress-pause-link').hide();
                });
                r.on('uploadStart', function() {

                    var _that = this;

                    if (_that.opt["query"] == null) {
                         _that.opt["query"] = {};
                    }

                    if (dms.string.isEmpty($("#docId").val())) {
                        $.ajax({
                            url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                            dataType:"json",
                            type:"get",
                            async:false,
                            cache:false,
                            success:function(id) {
                                _that.opt["query"]["resumableSessionId"] = id;
                                $("#docId").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 docId를 변경해준다
                            }
                        });
                    } else {
                        _that.opt["query"]["resumableSessionId"] = $("#docId").val();   // 파일업로드8:기존꺼에 추가할경우 docId 설정
                    }

//                     if (_that.opt["query"] == null) {
//                         _that.opt["query"] = {};
//                     }

//                     if (_that.opt["query"]["resumableSessionId"] == null) {
//                         $.ajax({
//                             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
//                             dataType:"json",
//                             type:"get",
//                             async:false,
//                             cache:false,
//                             success:function(id) {
//                                 _that.opt["query"]["resumableSessionId"] = id;
//                                 $("#docId").val(id);
//                             }
//                         });
//                     }

                    $('.resumable-progress .progress-resume-link').hide();
                    $('.resumable-progress .progress-pause-link').show();
                });
                r.on('complete', function() {

                    var _that = this;

                    $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

                    console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

                    $("#progressWindow").data("kendoWindow").close();
                    r.files = [];
                    $(".resumable-list").html("");
                });
                r.on('fileSuccess', function(file, message) {
                    console.log("===============");
                    console.log(message);

                    var result = JSON.parse(message);
                    if(result.status === "finished") {
                        $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                            fileDocNo:result.fileDocNo
                            ,fileNo:result.fileNo
                            ,fileNm:result.fileNm
                            ,fileSize:dms.string.formatFileSize(result.fileSize)
                        });
                        //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
                    }


                });
                r.on('fileError', function(file, message) {
                    $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
                });
                r.on('fileProgress', function(file) {
                    var fileProgress = 0;

                    if (file instanceof ResumableChunk) {
                        fileProgress = file.fileObj.progress();
                    } else {
                        fileProgress = file.progress();
                    }

                    $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
                    $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
                    $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
                });
                /* *************************************************************************
                **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
                ***************************************************************************/
            </script>
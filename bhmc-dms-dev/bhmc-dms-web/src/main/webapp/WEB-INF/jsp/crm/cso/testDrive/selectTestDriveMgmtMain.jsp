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
        <div id="resizableContainer">
            <!-- 시승 관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.testDriveMng" /><!-- 시승 관리 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11110" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11111" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:23%;">
                            <col>
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 客户--></th>
                                <td>
                                    <input type="text" id="sCust" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnSearch" >
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
                                <th scope="row"><spring:message code="global.lbl.prsNm" /><!-- 담당 SC --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.testDriveModel" /><!-- 시승모델 --></th>
                                <td>
                                    <input id="sModelCd" name="sModelCd" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.satisFactionStat" /><!-- 만족도조사상태 --></th>
                                <td>
                                    <input id="sCustStsfStatCd" name="sCustStsfStatCd" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                                <td>
                                    <input type="text" id="sTdrvVinNo" name="sTdrvVinNo" value="" class="form_input"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.tdrvDt" /><!-- 시승일 --></th>
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
                                <th scope="row"><spring:message code="crm.lbl.tdrvStatCd" /><!-- 시승 상태 --></th>
                                <td>
                                    <input type="text" id="sTdrvStatCd" name="sTdrvStatCd" value="" class="form_comboBox"  />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                <td>
                                    <input type="text" id="sCustNo" name="sCustNo" value="" class="form_input"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="tdrvMgmtGrid" class="resizable_grid">
                    </div>
                </div>
            </section>
            <!-- //시승 관리 -->
        </div>

        <section id="testDriveMgmtPopup" class="pop_wrap">
            <!-- 시승 일지 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.tdrvLog" /><!-- 시승 일지 --></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11112" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_save" id="tdrvMgmtSave" ><spring:message code="global.btn.save" /><!-- 저장 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form">
                <form id="tdrvMgmtInputForm" >
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
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.custStsfCd" /><!-- 고객만족도 --></span></th>
                                <td class="required_area">
                                    <input type="hidden" id="tdrvSeq" name="tdrvSeq" required data-name="<spring:message code="crm.lbl.tdrvSeq" />" />
                                    <input type="hidden" id="tdrvVinNo" name="tdrvVinNo" required data-name="<spring:message code="crm.lbl.tdrvVinNo" />" />
                                    <input type="hidden" id="tdrvContractDocNo" name="tdrvContractDocNo" >
                                    <input id="custStsfCd" name="custStsfCd" class="form_comboBox" required data-name="<spring:message code="crm.lbl.custStsfCd" />" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.saleFcstCd" /><!-- 판매전망 --></th>
                                <td>
                                    <input id="saleFcstCd" name="saleFcstCd" class="form_comboBox" data-name="<spring:message code="crm.lbl.saleFcstCd" />" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.memo" /><!-- 메모 --></th>
                                <td colspan="3" rowspan="4">
                                    <textarea rows="5" cols="" id="remark" name="remark" class="form_textarea" maxlength="1000" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.befRunDistVal" /><!-- 이전 주행거리 --></th>
                                <td class="required_area">
                                    <input id="befRunDistVal" name="befRunDistVal" class="form_numeric" required data-name="<spring:message code="crm.lbl.befRunDistVal" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.aftRunDistVal" /><!-- 이후 주행거리 --></th>
                                <td class="required_area">
                                    <input id="aftRunDistVal" name="aftRunDistVal" class="form_numeric" required data-name="<spring:message code="crm.lbl.aftRunDistVal" />" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.befRfuelQty" /><!-- 이전 주유량 --></th>
                                <td>
                                    <input id="befRfuelQty" name="befRfuelQty" class="form_numeric" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.aftRfuelQty" /><!-- 이후 주유량 --></th>
                                <td>
                                    <input id="aftRfuelQty" name="aftRfuelQty" class="form_numeric" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.intPblmYn" /><!-- 내장 이상유무 --></th>
                                <td>
                                    <label class="label_check"><input type="radio" id="intPblmYn_Y" name="intPblmYn" class="form_check" value="Y" > <spring:message code="crm.lbl.problemY" /></label><!-- 있음 -->
                                    <label class="label_check"><input type="radio" id="intPblmYn_N" name="intPblmYn" class="form_check" value="N" checked > <spring:message code="crm.lbl.problemN" /></label><!-- 없음 -->
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.extPblmYn" /><!-- 외장 이상유무 --></th>
                                <td>
                                    <label class="label_check"><input type="radio" id="extPblmYn_Y" name="extPblmYn" class="form_check" value="Y" > <spring:message code="crm.lbl.problemY" /></label><!-- 있음 -->
                                    <label class="label_check"><input type="radio" id="extPblmYn_N" name="extPblmYn" class="form_check" value="N" checked > <spring:message code="crm.lbl.problemN" /></label><!-- 없음 -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                </div>
            </section>
            <!-- //시승 일지 -->

            <!-- *************************************************************************
            **************************파일업로드2:그리드 추가 html 추가 *********************
            ***************************************************************************-->
            <!-- 시승 계약서 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11113" hasPermission="${dms:getPermissionMask('READ')}">
                        <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11114" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                    </dms:access>
                    </div>
                </div>

                <div class="table_grid">
                    <div id="fileGrid">
                    </div>
                </div>

            </section>
            <!-- //시승 계약서 -->
            <!-- *************************************************************************
            **************************파일업로드2:그리드 추가 html 추가 *********************
            ***************************************************************************-->

        </section>

            <script type="text/javascript">
            var mathDocTpMap = [];
            <c:forEach var="obj" items="${mathDocTpList}" >
            mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            </c:forEach>

            var custStsfStatList = [];
            var custStsfStatMap = [];
            <c:forEach var="obj" items="${custStsfStatCdList}" >
            custStsfStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            custStsfStatMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            </c:forEach>


            var tdrvStatCdList = [];
            var tdrvStatCdMap = [];
            <c:forEach var="obj" items="${tdrvStatCdList}" >
            tdrvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            tdrvStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            </c:forEach>

            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/
            // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
            $("#tdrvMgmtGrid").on("dblclick", "tr.k-state-selected", function (e) {

                var gridId = e.delegateTarget.id
                  , grid = $("#"+gridId+"").data("kendoExtGrid")
                  , selectedItem = grid.dataItem(grid.select())
                ;

                if ( dms.string.isNotEmpty(selectedItem) ){

                    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
                    viewDetail(selectedItem);

                } else {

                    // 선택해주세요.
                    dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                    return;
                }



            });

            // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
            function viewDetail(selectedItem){

                // from 초기화
                initForm();

                // 고객케어 상세 조회
                if ( dms.string.isNotEmpty(selectedItem) ) {

                    var tdrvSeq = selectedItem.tdrvSeq;

                    if( dms.string.isNotEmpty(tdrvSeq) ){

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
                                ,async:false
                                ,error:function(jqXHR,status,error) {
                                    dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                                }
                        }).done(function(body) {

                            //console.log(body);

                            initForm();

                            $("#tdrvSeq").val(body.tdrvSeq);
                            $("#tdrvVinNo").val(body.tdrvVinNo);

                            var tdrvContractDocNo = body.tdrvContractDocNo;
                            if ( dms.string.isNotEmpty(tdrvContractDocNo) ) {
                                $("#tdrvContractDocNo").val(tdrvContractDocNo);
                                $("#fileGrid").data("kendoExtGrid").dataSource.read();
                            }

                            $("#custStsfCd").data("kendoExtDropDownList").value(body.custStsfCd);
                            $("#saleFcstCd").data("kendoExtDropDownList").value(body.saleFcstCd);

                            $("#befRunDistVal").data("kendoExtNumericTextBox").value(body.befRunDistVal);
                            $("#aftRunDistVal").data("kendoExtNumericTextBox").value(body.aftRunDistVal);
                            $("#befRfuelQty").data("kendoExtNumericTextBox").value(body.befRfuelQty);
                            $("#aftRfuelQty").data("kendoExtNumericTextBox").value(body.aftRfuelQty);

                            $("input:radio[id='intPblmYn_"+body.intPblmYn+"']").prop("checked", true);
                            $("input:radio[id='extPblmYn_"+body.extPblmYn+"']").prop("checked", true);

                            $("#remark").val(body.remark);

                            // 시승상태 예약취소
                            if ( body.tdrvStatCd === "02" ) {

                                $("#custStsfCd").data("kendoExtDropDownList").enable(false);
                                $("#saleFcstCd").data("kendoExtDropDownList").enable(false);
                                $("#befRunDistVal").data("kendoExtNumericTextBox").enable(false);
                                $("#aftRunDistVal").data("kendoExtNumericTextBox").enable(false);
                                $("#befRfuelQty").data("kendoExtNumericTextBox").enable(false);
                                $("#aftRfuelQty").data("kendoExtNumericTextBox").enable(false);
                                $("input:radio").attr("disabled", true);
                                $("#remark").attr("disabled", true).addClass('form_readonly');

                            } else {

                                // 버튼 활성화
                                $("#tdrvMgmtSave").data("kendoButton").enable(true);
                                //$("#fileDelete").data("kendoButton").enable(true);
                                // TODO 파일찾기 버튼 span 으로 된거 활성/비활성화 시키기

                            }

                        });

                    }

                };

                // 팝업 오픈
                var testDriveMgmtPopup = $("#testDriveMgmtPopup").data("kendoWindow");
                testDriveMgmtPopup.center();
                testDriveMgmtPopup.open();

            };
            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/

            /*****************************************************************************
             **************************파일업로드3:파일 다운로드  ****************************
             *******************************************************************************/
             $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
                var grid = $("#fileGrid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());

                if(dms.string.isNotEmpty(dataItem)){
                    dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
                }
             });
            /*****************************************************************************
             **************************파일업로드3:파일 다운로드  ****************************
             *******************************************************************************/

                var tdrvMgmtGrid
                    , tdrvMgmtSeq
                    , tdrvSeq
                    , isGridReload = false


                // SC 목록
                var usersDS = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                </c:forEach>

                // 시승모델
                var carIdDs = [];
                <c:forEach var="obj" items="${carIdList}">
                    carIdDs.push({text:"${obj.modelNm}", value:"${obj.modelCd}"});
                </c:forEach>

                // 고객만족도
                var custStsfCdDs = [];
                <c:forEach var="obj" items="${custStsfCdList}">
                    custStsfCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                // 판매전망
                var saleFcstCdDs = [];
                <c:forEach var="obj" items="${saleFcstCdList}">
                    saleFcstCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                // 시승시간
                var tdrvHmCdDs = [];
                <c:forEach var="obj" items="${tdrvHmCdList}">
                   tdrvHmCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                //검색조건:시작일-완료일 날짜 비교
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

                // 폼 초기화
                function initForm(){

                    // form 초기화
                    $("#tdrvSeq").val("");
                    $("#tdrvVinNo").val("");
                    $("#tdrvContractDocNo").val("");
                    $("#custStsfCd").data("kendoExtDropDownList").value("");
                    $("#custStsfCd").data("kendoExtDropDownList").enable(true);
                    $("#saleFcstCd").data("kendoExtDropDownList").value("");
                    $("#saleFcstCd").data("kendoExtDropDownList").enable(true);
                    $("#befRunDistVal").data("kendoExtNumericTextBox").value("");
                    $("#befRunDistVal").data("kendoExtNumericTextBox").enable(true);
                    $("#aftRunDistVal").data("kendoExtNumericTextBox").value("");
                    $("#aftRunDistVal").data("kendoExtNumericTextBox").enable(true);
                    $("#befRfuelQty").data("kendoExtNumericTextBox").value("");
                    $("#befRfuelQty").data("kendoExtNumericTextBox").enable(true);
                    $("#aftRfuelQty").data("kendoExtNumericTextBox").value("");
                    $("#aftRfuelQty").data("kendoExtNumericTextBox").enable(true);
                    $("input:radio").attr("disabled", false);
                    $("#intPblmYn_N").prop("checked", true);
                    $("#extPblmYn_N").prop("checked", true);
                    $("#remark").val("").attr("disabled", false).removeClass('form_readonly');

                    // 버튼 초기화
                    $("#tdrvMgmtSave").data("kendoButton").enable(false);
                    //$("#fileDelete").data("kendoButton").enable(false);       // TODO 파일찾기 버튼 span 으로 된거 활성/비활성화 시키기

                    // 첨부파일 그리드 초기화
                    $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

                }

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                    var grid = $("#tdrvMgmtGrid").data("kendoExtGrid"),
                    row = $(e.target).closest("tr");
                    var dataItem = grid.dataItem(row);

                    window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
                });

                $(document).ready(function() {

                    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
                    $("#testDriveMgmtPopup").kendoWindow({
                        animation:false
                        ,draggable:true
                        ,modal:false
                        ,resizable:false
                        ,visible:false
                        ,title:"<spring:message code='crm.menu.testDriveMng' />"      // <!-- 시승 관리 -->
                        ,width:"950px"
                        ,height:"340px"
                    }).data("kendoWindow");
                    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************

                    // show/hide
                    $("#btnHidden").kendoButton({
                        click:function(e){
                            $("#hiddenTable").toggle();
                            resizeGrid();
                        }
                    });

                    // 만족도조사상태
                    $("#sCustStsfStatCd").kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "   // 전체
                        , dataSource:dms.data.cmmCdFilter(custStsfStatList)
                    });

                 // 만족도조사상태
                    $("#sTdrvStatCd").kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "   // 전체
                        , dataSource:dms.data.cmmCdFilter(tdrvStatCdList)
                    });

                    // 판매고문
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // 시승 시작일
                    $("#sStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 시승 종료일
                    $("#sEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 시승 시작일은 종료일보다 클수가 없다.
//                     $("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);
//                     $("#sEndDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);

                    // 시승모델
                    $("#sModelCd").kendoExtDropDownList({
                        dataSource:carIdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 고객만족도
                    $("#custStsfCd").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(custStsfCdDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                    });

                    // 판매전망
                    $("#saleFcstCd").kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(saleFcstCdDs)
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , index:0
                    });

                    // 주행거리
                    $("#befRunDistVal").kendoExtNumericTextBox({
                        format:"#"
                        ,min:0
                        ,value:0
                    });

                    $("#aftRunDistVal").kendoExtNumericTextBox({
                        format:"#"
                        ,min:0
                        ,value:0
                    });

                    // 주유량
                    $("#befRfuelQty").kendoExtNumericTextBox({
                        format:"#"
                        ,min:0
                        ,value:0
                    });

                    $("#aftRfuelQty").kendoExtNumericTextBox({
                        format:"#"
                        ,min:0
                        ,value:0
                    });

                    // 시승 예약 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            if(dms.date.isValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                                    ,$("#sEndDt").data("kendoExtMaskedDatePicker").value())){
                                $("#tdrvMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                            }else{
                                dms.notification.warning('<spring:message code="global.err.checkDateValue"/>');
                                $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                                $("#sEndDt").focus();
                            }
                        }
                    });

                    // 상세정보
                    $("#btnViewDetail").kendoButton({
                        click:function(e){

                            var grid = $("#tdrvMgmtGrid").data("kendoExtGrid");
                            var selectedItem = grid.dataItem(grid.select());
                            if ( dms.string.isNotEmpty(selectedItem) ){

                                viewDetail(selectedItem);

                            } else {

                                // 선택해주세요.
                                dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                                return;
                            }

                        }
                        , enable:false
                    })

                    // 시승 일지 저장
                    $("#tdrvMgmtSave").kendoButton({
                        click:function(e){
                            tdrvMgmtSave();
                        }
                        , enable:false
                    });

                    var validator = $("#tdrvMgmtInputForm").kendoExtValidator().data("kendoExtValidator");

                    // 시승 일지 저장
                    function tdrvMgmtSave(){

                        if (validator.validate()) {

                            var befRunDistVal = $("#befRunDistVal").data("kendoExtNumericTextBox").value();
                            var aftRunDistVal = $("#aftRunDistVal").data("kendoExtNumericTextBox").value();

                            if ( aftRunDistVal <= befRunDistVal ) {
                                // 주행거리 / 을(를) 확인하여 주세요.
                                dms.notification.info("<spring:message code='global.lbl.runDist' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                return;
                            }

                            var saveData = $("#tdrvMgmtInputForm").serializeObject();

                            //console.log("saveData:" + JSON.stringify(saveData));
                            //return;

                            $.ajax({
                                url:"<c:url value='/crm/cso/testDrive/updateTestDriveMgmt.do' />",
                                data:JSON.stringify(saveData),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                },

                                success:function(result) {

                                    if (result === 1) {

                                        // 저장 / 이 완료 되었습니다.
                                        dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                        // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                        isGridReload = true;
                                        tdrvMgmtSeq = $("#tdrvSeq").val();
                                        $("#tdrvMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                        // 팝업 닫기
                                        var testDriveMgmtPopup = $("#testDriveMgmtPopup").data("kendoWindow");
                                        testDriveMgmtPopup.close();

                                    } else {
                                        // 저장정보 / 을(를) 확인하여 주세요.
                                        dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    }

                                }
                                ,beforeSend:function(xhr) {
                                    dms.loading.show($("#testDriveMgmtPopup"));
                                }
                                ,complete:function(xhr, status) {
                                    dms.loading.hide($("#testDriveMgmtPopup"));
                                }
                            });

                        }



                    }

                    // 시승관리 그리드
                    $("#tdrvMgmtGrid").kendoExtGrid({
                        gridId:"G-CRM-0519-172125"
                        ,dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/testDrive/selectTestDriveMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sCust"] = $("#sCust").val();
                                        params["sScId"] = $("#sScId").val();
                                        params["sModelCd"] = $("#sModelCd").val();
                                        params["sTdrvVinNo"] = $("#sTdrvVinNo").val();
                                        params["sCustNo"] = $("#sCustNo").val();
                                        params["sCustStsfStatCd"] = $("#sCustStsfStatCd").data("kendoExtDropDownList").value();
                                        params["sTdrvStatCd"] = $("#sTdrvStatCd").data("kendoExtDropDownList").value();

                                        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                                        //console.log(kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"tdrvSeq"
                                    ,fields:{
                                        carlineNm:{type:"string", editable:false}
                                        ,modelNm:{type:"string", editable:false }
                                        ,tdrvSeq:{type:"number"}
                                        ,carRegNo:{type:"string"}
                                        ,custNm:{type:"string"}
                                        ,custNo:{type:"string"}
                                        ,custCdNm:{type:"string"}
                                        ,hpNo:{type:"string"}
                                        ,mathDocTp:{type:"string", editable:false}
                                        ,ssnCrnNo:{type:"string", editable:false}
                                        ,resvDt:{type:"date"}
                                        ,tdrvHmCdNm:{type:"string"}
                                        ,custStsfCdNm:{type:"string"}
                                        ,scNm:{type:"string"}
                                        ,regDt:{type:"date"}
                                        ,regDtFormat:{type:"date", editable:false}
                                        ,resvDtFormat:{type:"date", editable:false}
                                        ,tdrvLicenseNo:{type:"string",editable:false}
                                        ,tdrvStatCd:{type:"string",editable:false}

                                    }
                                }
                                ,parse:function(d) {
                                    if(d.data){
                                        $.each(d.data, function(idx, elem) {
                                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                            elem.resvDtFormat = kendo.parseDate(elem.resvDt, "<dms:configValue code='dateFormat' />");
                                        });
                                    }
                                    return d;
                                }
                            }
                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            var tdrvSeq = selectedItem.tdrvSeq;

                            if( dms.string.isNotEmpty(tdrvSeq) ){
                                $("#btnViewDetail").data("kendoButton").enable(true);
                            }

                        }
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var rows = this.tbody.find("tr")
                                , gridData
                                , selectRow

                            tdrvSeq = tdrvMgmtSeq ;

                            //console.log("tdrvSeq:",tdrvSeq+" | isGridReload:",isGridReload);
                            if ( isGridReload && dms.string.isNotEmpty(tdrvSeq) ) {

                                rows.each(function(index, row) {

                                    tdrvMgmtGrid = $("#tdrvMgmtGrid").data("kendoExtGrid");
                                    gridData = tdrvMgmtGrid.dataSource.at(index);

                                    if ( gridData.tdrvSeq.toString() === tdrvSeq ) {        // 시승번호 = number 이기 때문에 toStirng() 해줘야함.
                                        selectRow = tdrvMgmtGrid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                        tdrvMgmtGrid.select(selectRow);
                                    }

                                });

                                isGridReload = false;

                            }

                        }
                        ,editable:false
                        ,navigatable:false
                        ,selectable:"row"
                        ,filterable:{
                            mode:"row"
                        }
                        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
                        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                        ,enableTooltip:true               //Tooltip 적용, default:false
                        ,columns:[
                            // {field:"tdrvSeq", title:"tdrvSeq", width:60, sortable:false}                            /* 시승모델 */
                            {field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:80,attributes:{"class":"ac"} }  /* 차종명 */
                            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:200,attributes:{"class":"ac"} }      /* 모델명 */
                            ,{field:"tdrvVinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150,attributes:{"class":"ac"} }      /* VIN */
                            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:80,attributes:{"class":"ac"}}           /* 차량번호 */
                            ,{field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:140,attributes:{"class":"ac"}}            // 고객번호
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100,attributes:{"class":"ac"}            // 고객명
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            , {field:"custCdNm", title:"<spring:message code='global.lbl.custCd' />", width:100, attributes:{"class":"ac"}}    //잠재/보유고객
                            , {field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100}             /* 휴대전화 */
                            , {field:"mathDocTp"  , title:"<spring:message code='global.lbl.mathDocTp' />", width:100, attributes:{"class":"ac"}, sortable:false
                              , template:"#if (mathDocTp != null){# #= mathDocTpMap[mathDocTp]# #}#" }                  // 증거유형
                            , {field:"ssnCrnNo"  , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:150, attributes:{"class":"ac"}}
                            , {field:"tdrvStatCd"  , title:"<spring:message code='crm.lbl.tdrvStatCd' />", width:60, attributes:{"class":"ac"}
                                , template:"#if (tdrvStatCd != null){# #= tdrvStatCdMap[tdrvStatCd]# #}#" }         //  시승상태

                            , {field:"custStsfStatCd"  , title:"<spring:message code='crm.lbl.satisFactionStat' />", width:100, attributes:{"class":"ac"}, sortable:false
                              , template:"#if (custStsfStatCd != null){# #= custStsfStatMap[custStsfStatCd]# #}#" }         // 만족도조사상태
                            , {field:"tdrvLicenseNo", title:"<spring:message code='crm.lbl.driversLicenseNo' />", width:80}             /* 면허증 번호 */

                              ,{field:"resvDtFormat", title:"<spring:message code='global.lbl.tdrvResvDt' />", width:110          // 시승예약일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (resvDtFormat !== null ){# #= kendo.toString(data.resvDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                            }
                            ,{field:"resvDtFormat", title:"<spring:message code='crm.lbl.realTestDrvDt' />", width:110          // 실제 시승일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (resvDtFormat !== null ){# #= kendo.toString(data.resvDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                            }
                            , {field:"aftRunDistVal"  , title:"<spring:message code='crm.lbl.distance' />", width:60, attributes:{"class":"ac"}, sortable:false
                                ,template:function(dataItem){
                                    var spanObj = dataItem.aftRunDistVal-dataItem.befRunDistVal;
                                    if (spanObj <= 0) {
                                        spanObj = "-";
                                    }
                                    return spanObj;
                                }
                            }         //  거리
                            , {field:"tdrvHmCdNm", title:"<spring:message code='crm.lbl.tdrvHmCd' />", width:80, attributes:{"class":"ac"}}    //시승시간
                            , {field:"custStsfCdNm", title:"<spring:message code='crm.lbl.custStsfCd' />", width:90, attributes:{"class":"ac"}}    //고객만족도
                            ,{field:"scNm", title:"<spring:message code='global.lbl.prsNm' />", width:100, attributes:{"class":"ac"}}                /* 담당SC */
                            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100          // 등록일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }


                        ]

                    });
                    // 시승관리 그리드

                    /* *************************************************************************
                     **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
                     ***************************************************************************/
                         // 파일 그리드 시작 //
                         $("#fileGrid").kendoExtGrid({
                             gridId:"G-CRM-0519-172126"
                             ,dataSource:{
                                 transport:{
                                     read:{
                                         url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                                     },
                                     parameterMap:function(options, operation) {
                                         if (operation === "read") {

                                             var params = {};
                                             params["sFileDocNo"] = $("#tdrvContractDocNo").val();
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
                            ,height:135
                            ,sortable :false
                            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
                            ,navigatable:false
                            ,pageable:false
                            ,columns:[
                                      {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                                          ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                                      }
                                      ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                                          ,attributes:{"class":"ar"}
                                          ,template:"#= dms.string.formatFileSize(fileSize) #"
                                      }
                            ]
                        });
                        // 파일 그리드 종료 //
                     /* *************************************************************************
                     **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
                     ***************************************************************************/


                     /* *************************************************************************
                      **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
                      ***************************************************************************/
                      //========파일삭제
                      $("#fileDelete").kendoButton({
                          click:function(e){

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


                          }
                          //, enable:false        // TODO 파일찾기 버튼 span 으로 된거 활성/비활성화 시키기
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

                    if (dms.string.isEmpty($("#tdrvContractDocNo").val())) {
                        $.ajax({
                            url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                            dataType:"json",
                            type:"get",
                            async:false,
                            cache:false,
                            success:function(id) {
                                _that.opt["query"]["resumableSessionId"] = id;
                                $("#tdrvContractDocNo").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 tdrvContractDocNo 를 변경해준다
                            }
                        });
                    } else {
                        _that.opt["query"]["resumableSessionId"] = $("#tdrvContractDocNo").val();   // 파일업로드8:기존꺼에 추가할경우 tdrvContractDocNo 설정
                    }

                    $('.resumable-progress .progress-resume-link').hide();
                    $('.resumable-progress .progress-pause-link').show();
                });
                r.on('complete', function() {

                    var _that = this;

                    $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

                    //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

                    $("#progressWindow").data("kendoWindow").close();
                    r.files = [];
                    $(".resumable-list").html("");
                });
                r.on('fileSuccess', function(file, message) {
                    //console.log("===============");
                    //console.log(message);

                    var result = JSON.parse(message);
                    if(result.status === "finished") {
                        $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                            fileDocNo:result.fileDocNo
                            ,fileNo:result.fileNo
                            ,fileNm:result.fileNm
                            ,fileSize:result.fileSize
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
                **************************파일업로드4:스크립트 추가 $(document).ready 밖 *****
                ***************************************************************************/

            </script>
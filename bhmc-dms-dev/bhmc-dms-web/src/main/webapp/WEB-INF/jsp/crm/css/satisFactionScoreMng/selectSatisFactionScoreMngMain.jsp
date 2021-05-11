<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->

        <div id="resizableContainer">
            <!-- 만족도 조사 낮은 점수 처리 관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.satisFactionScoreMng"/><!-- 만족도 조사 낮은 점수 처리 관리 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11187" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11188" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:18%;">
                            <col>
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.custNm'/><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input"  placeholder="<spring:message code='crm.lbl.custNmHpNo' />" />
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /><!-- 더많음  ?件?情--></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:18%;">
                            <col style="width:10%;">
                            <col style="width:18%;">
                            <col style="width:9%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/><!-- 만족도 조사명 --></th>
                                <td>
                                    <input type="text" id="sStsfIvstNm" name="sStsfIvstNm" maxlength="33" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstMthCd"/><!-- 만족도 조사유형 --></th>
                                <td>
                                    <input value="" id="sStsfIvstMthCd" name="sStsfIvstMthCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd"/><!-- 만족도 조사수단 --></th>
                                <td>
                                    <input value="" id="sStsfIvstExpdCd" name="sStsfIvstExpdCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstTpCd"/><!-- 조사 타입 --></th>
                                <td>
                                    <input value="" id="sStsfIvstTpCd" name="sStsfIvstTpCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.stsfIvstDt"/><!-- 만족도 조사시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker" data-type="maskDate" >
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker" data-type="maskDate">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.vocRegDt"/><!-- 낮은점수 처리요청시간 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartVocRegDt" name="sStartVocRegDt" class="form_datepicker" data-type="maskDate" >
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndVocRegDt" name="sEndVocRegDt" class="form_datepicker" data-type="maskDate">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.saAndsc"/><!-- 담당자 --></th>
                                <td>
                                    <input type="text" id="sMngUsrNm" name="sMngUsrNm" maxlength="100" value="" class="form_input">
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="satisUsrGrid" class="resizable_grid"></div>
                </div>
            </section>
            <!-- //만족도 조사 낮은 점수 처리 관리 -->
        </div>

            <!-- stansWindowPopup start -->
            <section id="satisFactionScoreMngWindow" class="pop_wrap">

                <!-- 낮은 점수 처리 상세정보 -->
                <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="crm.lbl.lowScorePorcDetail"/><!-- 낮은 점수 처리 상세정보 --></h2>
                        <div class="btn_right">
                        <dms:access viewId="VIEW-D-12582" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_m btn_save" id="btnSave"><spring:message code='global.btn.save'/><!-- 저장 --></button>
                        </dms:access>
                        </div>
                    </div>
                    <div class="table_form" id="satisFactionScoreMngForm">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:13%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.vocProcId"/><!-- 실처리자--></span></th>
                                    <td>
                                        <input type="hidden" id="vocProcId" name="vocProcId" data-json-obj="true" />
                                        <div class="form_search" onclick="pprocSearchPopOpen();">
                                            <input type="text" id="vocProcNm" name="vocProcNm" class="form_input" style="width:100%" data-json-obj="true" />
                                            <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                        </div>
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.lowScoreActionDt"/><!-- 낮은점수 조치일 --></span></th>
                                    <td>
                                        <input id="vocProcDt" name="vocProcDt" class="form_datepicker" />
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>
                                    <th></th>
                                    <td></td>
                                 </tr>
                                 <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.vocProcCont"/><!-- 처리내용 --></span></th>
                                    <td colspan="7">
                                        <textarea id="vocProcCont" name="vocProcCont" rows="2" cols="" class="form_textarea" data-json-obj='true'></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!-- //낮은 점수 처리 상세정보 -->

                <!-- 탭메뉴 전체 영역 -->
                <div  id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active"><spring:message code='global.lbl.dtlInfo'/><!-- 상세정보 --></li>
                        <li><spring:message code='crm.title.surveyQeusDetail'/><!-- 설문항목 상세 --></li>
                    </ul>
                    <!-- //탭메뉴 -->

                    <!-- 탭 상단 버튼 -->
                    <span class="btn_right_absolute">
                    </span>
                    <!-- 탭 상단 버튼 -->

                    <!-- 탭내용1 -->
                    <div><!-- 탭안의 내용이 타이틀이나 버튼부터 시작하면 class="mt0" 추가 -->
                        <!-- 낮은 점수 상세정보 -->
                        <section class="group">
                            <div class="table_form">
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
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/><!-- 만족도 조사명 --></th>
                                            <td colspan="3">
                                                <input id="stsfIvstNm" name="stsfIvstNm" readonly class="form_input form_readonly">
                                            </td>
                                            <th scope="row"><spring:message code='crm.lbl.stsfIvstTpCd' /><!-- 조사타입 --></th>
                                            <td class="readonly_area">
                                                <input id="stsfIvstTpCd" name="stsfIvstTpCd" readonly="readonly" class="form_comboBox form_readonly"/>
                                            </td>
                                            <th scope="row"><spring:message code='crm.lbl.stsfIvstMthCd' /><!-- 만족도 조사 유형 --></th>
                                            <td class="readonly_area">
                                                <input id="stsfIvstMthCd" name="stsfIvstMthCd" readonly="readonly" class="form_comboBox form_readonly"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd"/><!-- 만족도 조사 수단 --></th>
                                            <td class="readonly_area">
                                                <input id="stsfIvstExpdCd" name="stsfIvstExpdCd" readonly="readonly" class="form_comboBox form_readonly"/>
                                            </td>
                                            <th scope="row"><spring:message code='crm.lbl.stsfIvstDt'/><!-- 만족도 조사일 --></th>
                                            <td>
                                                <input id="stsfIvstDt" name="stsfIvstDt" readonly class="form_datepicker ac form_readonly">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.stsfIvstEmpId"/><!-- 만족도 조사인 --></th>
                                            <td>
                                                <input id="stsfIvstEmpId" name="stsfIvstEmpId" readonly  class="form_input form_readonly">
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstScoreVal"/><!-- 만족도 조사점수 --></th>
                                            <td>
                                                <input type="text" id="stsfIvstScoreVal" name="stsfIvstScoreVal" readonly class="form_input ar form_readonly">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.cmplReasonCont"/><!-- 총결 --></th>
                                            <td colspan="7">
                                                <textarea rows="3" cols="" id="cmplReasonCont" name="cmplReasonCont" readonly class="form_textarea form_readonly"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                        <!-- //낮은 점수 상세정보 -->
                    </div>
                    <!-- 탭내용1 -->

                    <!-- 탭내용2 -->
                    <div>
                        <!-- 만족도 조사 상세결과 -->
                        <section class="group">
                            <div class="table_grid mt10">
                                <div id="satisFactionGrid"></div>
                            </div>
                        </section>
                        <!-- //만족도 조사 상세결과 -->
                    </div>
                    <!-- 탭내용2 -->

                </div>
                <!-- 탭메뉴 전체 영역 -->
            </section>


      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    var userSearchPopupWin;

    //1.그리드 만족도조사 유형 콤보  DataSource
    var stsfIvstMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstMthCdList}">
    stsfIvstMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var stsfIvstMthCdListMap = dms.data.arrayToMap(stsfIvstMthCdList, function(obj){ return obj.cmmCd; });

    //2.그리드 만족도조사 수단 콤보  DataSource
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
    stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var stsfIvstExpdCdListMap = dms.data.arrayToMap(stsfIvstExpdCdList, function(obj){ return obj.cmmCd; });

    //3.그리드 만족도조사 타입 콤보  DataSource
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
    stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var stsfIvstTpCdListMap = dms.data.arrayToMap(stsfIvstTpCdList, function(obj){ return obj.cmmCd; });

    // 처리인팝업
    function pprocSearchPopOpen() {

        userSearchPopupWin = dms.window.popup({
             windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                 url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                     "autoBind":false
                    ,"type"  :null
                    ,"callbackFunc":function(data){

                        if (data.length >= 1) {
                            var usrId = data[0].usrId;
                            var usrNm = data[0].usrNm;
                            //console.log("usrId : ",usrId+" | usrNm :"+usrNm);
                            $("#vocProcId").val(usrId);
                            $("#vocProcNm").val(usrNm);
                        };

                        userSearchPopupWin.close();
                    }
                }
            }
        })

    };

    function initForm(){

        $("#vocProcId").val("");
        $("#vocProcNm").val("");
        $("#vocProcDt").data("kendoExtMaskedDatePicker").value("");
        $("#vocProcCont").val("");
        $("#stsfIvstNm").val("");
        $("#stsfIvstMthCd").data("kendoExtDropDownList").value("");
        $("#stsfIvstTpCd").data("kendoExtDropDownList").value("");
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").value("");
        $("#stsfIvstDt").data("kendoExtMaskedDatePicker").value("");
        $("#stsfIvstEmpId").val("");
        $("#stsfIvstScoreVal").val("");
        $("#cmplReasonCont").val("");

    };

    function gridCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        //VOC요청 여부가 "Y" 인 것만 조회( 만족도조사결과와 만졷고 조사 낮은점수 처리관리 쿼리 같이 사용함)
        params["sVocYn"] = "Y";
        params["sCustNm"] = $("#sCustNm").val();
        params["sStsfIvstNm"] = $("#sStsfIvstNm").val();
        params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
        params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
        params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
        params["sStartVocRegDt"] = $("#sStartVocRegDt").data("kendoExtMaskedDatePicker").value();
        params["sEndVocRegDt"] = $("#sEndVocRegDt").data("kendoExtMaskedDatePicker").value();
        params["sMngUsrNm"] = $("#sMngUsrNm").val();

        return params;

    };

    $(document).ready(function() {

        $("#tabstrip, .tab_area").kendoExtTabStrip({
            animation:false
        });

        // show/hide
        $("#btnHidden").kendoButton({
            click:function(e){
                $("#hiddenTable").toggle();
                resizeGrid();
            }
        });

        $("#vocProcDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /*****************************************************************************
         ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
         *******************************************************************************/
         // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
         $("#satisUsrGrid").on("dblclick", "tr.k-state-selected", function (e) {

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

        // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
        function viewPopup(){
         var win = $("#satisFactionScoreMngWindow").data("kendoWindow");
         win.center();
         win.open();
        }

        // 팝업 종료 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
        function closePopup(){
         var win = $("#satisFactionScoreMngWindow").data("kendoWindow");
         win.close();
        }

        // 상세조회 후 팝업오픈
        function viewDetail(selectedItem){

            if( dms.string.isNotEmpty(selectedItem) ){
                // 팝업오픈;
                viewPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }

        // 유형
        $("#sStsfIvstMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stsfIvstMthCdList
        });

        // 수단
        $("#sStsfIvstExpdCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stsfIvstExpdCdList
        });

        // 타입
        $("#sStsfIvstTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stsfIvstTpCdList
        });

        // 낮은점수 상세정보 - 유형
        $("#stsfIvstMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stsfIvstMthCdList
        });

        // 낮은점수 상세정보 - 수단
        $("#stsfIvstExpdCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stsfIvstExpdCdList
        });

        // 낮은점수 상세정보 - 타입
        $("#stsfIvstTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stsfIvstTpCdList
        });

        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sStartVocRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sEndVocRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#stsfIvstDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /*************************************************************
         *   버튼 셋팅
        *************************************************************/

        setKendoDate = function( dtValue ) {
            return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
        };

        ////버튼 - 엑셀Export
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var params = {};
                params = gridCommonParams();

                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    if(crmJs.isDateValidPeriod($("#sStartVocRegDt").data("kendoExtMaskedDatePicker").value()
                            ,$("#sEndVocRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                     // 만족도 조사 낮은점수 처리관리 목록 엑셀Export 수량 데이터를 조회한다.
                        $.ajax({
                            url:"<c:url value='/crm/css/satisFactionScoreMng/selectSatisFactionScoreMngsExcelExportCnt.do' />",
                            data:JSON.stringify(params),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(resultCnt) {

                                //console.log("resultCnt : ",resultCnt)
                                <c:set value="10000" var="maxCnt" />;
                                var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                                if ( resultCnt > excelMaxExportCnt ) {
                                    // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                                    dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                                    return;
                                };

                                var sysDateExcelNm = "${sysDateExcelNm}";

                                // 20170808 엑셀 익스포트는 정렬이 안먹음. 따라서 기본 정렬인 만족도 조사일로 추출됨.

                                dms.ajax.excelExport({
                                    "beanName":"satisFactionMobileResultService"
                                    ,"templateFile":"SatisFactionScoreMngMain_Tpl.xlsx"
                                    ,"fileName":"<spring:message code='crm.menu.satisFactionScoreMng' />_"+sysDateExcelNm+".xlsx"
                                    ,"sVocYn":"Y"
                                    ,"sCustNm":$("#sCustNm").val()
                                    ,"sStsfIvstNm":$("#sStsfIvstNm").val()
                                    ,"sStsfIvstMthCd":$("#sStsfIvstMthCd").data("kendoExtDropDownList").value()
                                    ,"sStsfIvstExpdCd":$("#sStsfIvstExpdCd").data("kendoExtDropDownList").value()
                                    ,"sStsfIvstTpCd":$("#sStsfIvstTpCd").data("kendoExtDropDownList").value()
                                    ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                                    ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                                    ,"sStartVocRegDt":setKendoDate($("#sStartVocRegDt").data("kendoExtMaskedDatePicker").value())
                                    ,"sEndVocRegDt":setKendoDate($("#sEndVocRegDt").data("kendoExtMaskedDatePicker").value())
                                });

                            }

                        });
                    }else{
                        $("#sEndVocRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                        $("#sEndVocRegDt").focus();
                    }
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }





            }

        });

        ////버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    if(crmJs.isDateValidPeriod($("#sStartVocRegDt").data("kendoExtMaskedDatePicker").value()
                            ,$("#sEndVocRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                        $('#satisUsrGrid').data('kendoExtGrid').dataSource.read(1);
                    }else{
                        $("#sEndVocRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                        $("#sEndVocRegDt").focus();
                    }
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
        });

        ////버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#vocProcId").val())){
                    //실처리자을(를) 입력해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.vocProcId' var='custStsfSurvey' /><spring:message code='global.info.emptyCheckParam' arguments='${custStsfSurvey}' />");
                    return;
                }

                if(dms.string.isEmpty($("#vocProcDt").val())){
                    //처리일을(를) 입력해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.vocProcDt' var='custStsfSurvey' /><spring:message code='global.info.emptyCheckParam' arguments='${custStsfSurvey}' />");
                    return;
                }

                if(dms.string.isEmpty($("#vocProcCont").val())){
                    //처리내용을(를) 입력해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.vocProcCont' var='custStsfSurvey' /><spring:message code='global.info.emptyCheckParam' arguments='${custStsfSurvey}' />");
                    return;
                }

                var params = {};

                var grid = $("#satisUsrGrid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());

                params["dlrCd"] = selectedItem.dlrCd;
                params["vocProcId"] = $("#vocProcId").val();
                params["vocProcDt"] = kendo.parseDate($("#vocProcDt").val(), "<dms:configValue code='dateFormat' />");
                params["vocProcCont"] = $("#vocProcCont").val();
                params["stsfIvstRsltSeq"] = selectedItem.stsfIvstRsltSeq;

                $.ajax({
                    url:"<c:url value='/crm/css/satisFactionScoreMng/updateVocResult.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify(params)
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        closePopup();
                        $('#satisUsrGrid').data('kendoExtGrid').dataSource.read(1);
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show($("#satisFactionScoreMngWindow"));
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide($("#satisFactionScoreMngWindow"));
                    }
                });
            }
        });
        ////버튼 - 행추가
        ////버튼 - 저장
        $("#btnRowSave").kendoButton({
            click:function(e){
                //개발중 입니다.
                dms.notification.info("<spring:message code='global.msg.eveloping'/>");
            }
        });

        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
        $("#satisFactionScoreMngWindow").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.menu.satisFactionScoreMng' />"      // 만족도조사 낮은점수 처리관리
            ,width:"950px"
            ,height:"460px"
        }).data("kendoWindow");
        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#satisUsrGrid").kendoExtGrid({
            gridId:"G-CRM-0419-201200"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/css/satisFactionScoreMng/selectSatisFactionScoreMngs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;

                            if ( dms.string.isEmpty(options.sort) ){
                                params["sort"]                  = [{"field":"vocRegDtFormat","dir":"desc"}];
                            } else {
                                params["sort"]                  = options.sort;
                            }

                            params = $.extend(params, gridCommonParams());

                            //console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"dlrCd"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,vocRegDt:{type:"date", validation:{required:true}} //낮은점수 처리요청 시간
                                ,vocRegDtFormat:{type:"date", validation:{required:true}} //낮은점수 처리요청 시간
                                ,vocProcDt:{type:"date", validation:{required:true}} //낮은점수 조치일
                                ,vocProcDtFormat:{type:"date", validation:{required:true}} //낮은점수 조치일
                                ,stsfIvstDt:{type:"date", validation:{required:true}} //만족도 조사 일시
                                ,stsfIvstDtFormat:{type:"date", validation:{required:true}} //만족도 조사 일시
                                ,startDt:{type:"date", validation:{required:true}} //만족도 조사 시작일
                                ,endDt:{type:"date", validation:{required:true}} //만족도 조사 종료일
                                ,callCenRsltDt:{type:"date", validation:{required:false}} //콜센터결과일
                                ,callCenRsltDtFormat:{type:"date", validation:{required:false}} //콜센터결과일
                                ,stsfIvstScoreVal:{type:"number", validation:{required:true}} //만족도조사점수
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.vocRegDt = kendo.parseDate(elem.vocRegDt, "<dms:configValue code='dateFormat' />");
                                    elem.vocRegDtFormat = kendo.parseDate(elem.vocRegDt, "<dms:configValue code='dateFormat' />");
                                    elem.vocProcDt = kendo.parseDate(elem.vocProcDt, "<dms:configValue code='dateFormat' />");
                                    elem.vocProcDtFormat = kendo.parseDate(elem.vocProcDt, "<dms:configValue code='dateFormat' />");
                                    elem.stsfIvstDt = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                    elem.stsfIvstDtFormat = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                    elem.startDt = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                                    elem.endDt = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                                    elem.callCenRsltDt = kendo.parseDate(elem.callCenRsltDt, "<dms:configValue code='dateFormat' />");
                                    elem.callCenRsltDtFormat = kendo.parseDate(elem.callCenRsltDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,selectable:"row"
            ,change:function(e){

                initForm();

                var selectedItem = this.dataItem(this.select());
                if (selectedItem != null) {

                    $("#stsfIvstNm").val(selectedItem.stsfIvstNm);
                    $("#stsfIvstMthCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstMthCd);//조사유형
                    $("#stsfIvstExpdCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstExpdCd);//조사수단
                    $("#stsfIvstTpCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstTpCd);//조사타입
                    $("#stsfIvstDt").data("kendoExtMaskedDatePicker").value(selectedItem.stsfIvstDt);//만족도 조사시간
                    $("#stsfIvstEmpId").val(selectedItem.usrNm);//만족도 조사인
                    $("#stsfIvstScoreVal").val(selectedItem.stsfIvstScoreVal);//만족도 조사점수
                    $("#cmplReasonCont").val(selectedItem.cmplReasonCont);//불만족 원인
                    $("#vocProcDt").data("kendoExtMaskedDatePicker").value(selectedItem.vocProcDt);//낮은점수 처리일
                    $("#vocProcId").val(selectedItem.vocProcId);//낮은점수 처리자
                    $("#vocProcNm").val(selectedItem.vocProcNm);
                    $("#vocProcCont").val(selectedItem.vocProcCont);//낮은점수 처리내용

                    $("#satisFactionGrid").data("kendoExtGrid").dataSource.read();
                }

            }
            , editable:false
            ,navigatable:true
            ,sortable:true
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
               ,{field:"stsfIvstNm", title:"<spring:message code='crm.lbl.stsfIvstNm'/>",width:150, attributes:{"class":"al"}}// 만족도 조사명
               ,{field:"stsfIvstMthCdNm", title:"<spring:message code='crm.lbl.stsfIvstMthCd'/>", attributes:{"class":"ac"},width:100,sortable:false}  //만족도 조사 유형
               ,{field:"stsfIvstExpdCdNm", title:"<spring:message code='crm.lbl.stsfIvstExpdCd'/>", attributes:{"class":"ac"},width:110,sortable:false} //만족도 조사 수단
               ,{field:"stsfIvstTpCdNm", title:"<spring:message code='crm.lbl.stsfIvstTpCd'/>", attributes:{"class":"ac"},width:100,sortable:false} //조사 타입
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",width:100,attributes:{"class":"al"}}// 고객명
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>",width:100,attributes:{"class":"ac"}}// 이동전화
               ,{field:"purcMngNm", title:"<spring:message code='crm.lbl.companyContacts'/>", attributes:{"class":"al"}, width:100}//구매담당자 명
               ,{field:"useCustNm", title:"<spring:message code='crm.lbl.driver'/>", attributes:{"class":"al"}, width:100}//방문자명
               ,{field:"useHpNo", title:"<spring:message code='crm.lbl.driverHp'/>", attributes:{"class":"ac"}, width:100}//방문자 이동전화
               ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//담당자
               ,{field:"vocRegDtFormat", title:"<spring:message code='crm.lbl.vocRegDt' />",width:110,attributes:{"class":"ac"} //낮은점수 처리요청시간
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(vocRegDtFormat !== '' && vocRegDtFormat !== null){# #= kendo.toString(data.vocRegDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }
               ,{field:"vocProcDtFormat", title:"<spring:message code='crm.lbl.lowScoreActionDt' />",width:110,attributes:{"class":"ac"}    //낮은점수 조치일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(vocProcDtFormat !== '' && vocProcDtFormat !== null){# #= kendo.toString(data.vocProcDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }
               ,{field:"stsfIvstDtFormat", title:"<spring:message code='crm.lbl.stsfIvstDt' />",width:110    //만족도 조사일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(stsfIvstDtFormat !== '' && stsfIvstDtFormat !== null){# #= kendo.toString(data.stsfIvstDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }
               ,{field:"usrNm", title:"<spring:message code='global.lbl.stsfIvstEmpId'/>",width:100,attributes:{"class":"ac"}}// 만족도 조사인
               ,{field:"stsfIvstScoreVal", title:"<spring:message code='crm.lbl.stsfIvstScoreVal'/>",attributes:{"class":"ar"},width:100
                   ,format:"{0:n2}"
               }  // 만족도 조사점수
               ,{field:"stsfIvstYnNm", title:"<spring:message code='crm.lbl.stsfIvstYn'/>",attributes:{"class":"ac"},width:100}              // 만족여부
               ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont'/>",width:150,attributes:{"class":"ac"}}// 총결
               ,{field:"callRsltCdNm"  , title:"<spring:message code="crm.lbl.callRsltCd" />", width:100,sortable:false}    //콜결과
               ,{field:"callCenRsltDtFormat", title:"<spring:message code='crm.lbl.callCenRsltDt'/>",width:100,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,template:"#if(callCenRsltDtFormat !== '' && callCenRsltDtFormat !== null){# #= kendo.toString(data.callCenRsltDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }// 콜센터 결과일자
            ]
        });

        /*************************************************************
         *   낮은점수 처리활동 그리드 셋팅
        *************************************************************/

        /*************************************************************
         *   만족도 조사 상세결과 그리드 셋팅
        *************************************************************/
        //그리드 설정
            $("#satisFactionGrid").kendoExtGrid({
                gridId:"G-CRM-0808-095821"
                ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/css/satisFactionPresentResult/selectSurveyResults.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"]    = options.pageSize;
                                params["pageIndex"]             = options.page;
                                params["firstIndex"]            = options.skip;
                                params["lastIndex"]             = options.skip + options.take;
                                params["sort"]                  = options.sort;

                                var grid = $('#satisUsrGrid').data('kendoExtGrid');
                                var selectedItem = grid.dataItem(grid.select());
                                params["sDlrCd"] = selectedItem.dlrCd;
                                params["sStsfIvstRsltSeq"] = selectedItem.stsfIvstRsltSeq;
                                params["sStsfIvstSeq"] = selectedItem.seq;
                                params["sSubyTmplSeq"] = selectedItem.subyTmplSeq;

                                $("#cmplReasonCont").val(selectedItem.cmplReasonCont);

//                                console.log(params);
                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                            model:{
                                id:"dlrCd"
                                ,fields:{
                                    rnum:{type:"string", editable:false}
                                    ,dlrCd:{type:"string"} //딜러코드
                                    ,seq:{type:"string"} // 일련번호
                                    ,stsfIvstRsltSeq:{type:"string"} //만족도조사결과일련번호
                                    ,stsfIvstSeq:{type:"string"} //만족도 조사 일련번호
                                    ,subyTmplSeq:{type:"string"} //설문템플릿 일련번호
                                    ,qestSeq:{type:"string"} //질문일련번호
                                    ,subyTmplSeq:{type:"string"}//설문템플릿 일련번호
                                    ,subyTmplQestSeq:{type:"string"}//설문문항 일련번호
                                    ,qestTpCd:{type:"string"}//질문유형코드
                                    ,cmplReasonContCd:{type:"string"}//불만족원인
                                    ,qestCont:{type:"string"}//질문내용
                                    ,qestWgtVal:{type:"string"}//질문가중치값
                                    //,answSeq:{type:"string"} //답변
                                    ,answCont:{type:"string"} //답변
                                    ,sbjvAnswCont:{type:"string"} //주관식 답변내용
                                    ,answScoreVal:{type:"string"} //문항점수
                                }
                            }
                    }
                }
                ,multiSelectWithCheckbox:false
                ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                //,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:fa
                ,height:255
                ,editable:false
                ,filterable:false
                ,scrollable: {
                    virtual: true
                }
                ,scrollable:true
                /* ,editable:{
                     mode:"incell"
                    ,confirmation:false
                } */
                ,autoBind:false
                ,navigatable:true
                ,sortable:true
                ,pageable:false
                ,selectable:"row"
                ,columns:[
                   {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}, filterable:false}// 캠페인코드
                   ,{field:"qestCont", title:"<spring:message code='crm.lbl.qestCont'/>", attributes:{"class":"al"}, width:300 }//질문내용
                   ,{field:"qestWgtVal", title:"<spring:message code='crm.lbl.qestWgtVal'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }//가중치
                   ,{field:"answCont", title:"<spring:message code='crm.lbl.answ'/>", attributes:{"class":"al"}, width:150 }//답변
                   ,{field:"sbjvAnswCont", title:"<spring:message code='crm.lbl.sbjvAnswCont'/>", attributes:{"class":"al"}, width:150 }//주관식 답변내용
                   ,{field:"answScoreVal", title:"<spring:message code='crm.lbl.answScoreVal'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }//문항점수
                ]
            });


    }); //end ready

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- *************************************************************************
**************************파일업로드1********************************************
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
**************************파일업로드1********************************************
***************************************************************************-->

<!-- 기본정보 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.campaignResultMng" /></h1><!-- 캠페인결과 관리 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-I-12939" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m" id="btnDefaultTargSum" ><spring:message code='crm.btn.defaultTargSum' /><!-- 기본목표값 계산 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12566" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m" id="btnViewDetail" ><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12565" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-I-12940" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_excel" id="btnCtlRltMgmtExcelExp" ><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인명 --></th>
                        <td>
                            <input id="sMakNm" name="sMakNm" class="form_input" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.cpiCd" /><!-- 캠페인 코드 --></th>
                        <td>
                            <input id="sMakCd" name="sMakCd" class="form_input" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.hostCd" /><!-- 주최 --></th>
                        <td>
                            <input id="sHostCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.campaignDt" /><!-- 캠페인일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartDt" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndDt" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                        <td>
                            <div class="form_float">
                                <div class="form_left" >
                                    <input id="sMakTpCd" class="form_comboBox" />
                                </div>
                                <div class="form_right">
                                    <input id="sMakSubTpCd" class="form_comboBox" />
                                </div>
                            </div>
                        </td>
                        <th></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="mcdGrid" class="resizable_grid"></div>
        </div>

        <section id="campaignResultWindow" class="pop_wrap">
        <!-- 탭메뉴 전체 영역 -->
        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="rsltInputTab" class="k-state-active"><spring:message code="crm.title.rsltInput" /><!-- 결과 조회 확인 --></li>
<%--                 <li id="cropTab"><spring:message code="global.title.crop" /> <!-- 업체평가 --></li> --%>
                <%--<li id="saleEmpSurveyTab"><spring:message code="crm.title.saleEmpSurvey" /> <!-- 영업사원 설문 --></li>--%>
                <li id="prsnContTab"><spring:message code="crm.title.prsnCont" /> <!-- 책임자 의견 --></li><%--2016.09.01--%>
            </ul>
            <div id="rsltInputTabDiv" class="mt0">

                <!-- 조회 조건 타이틀 시작 -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.lbl.actTotAmt" /></h2><!-- 활동총비용 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-I-12941" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s" id="btnSaveVehic"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                    </dms:access>
                    </div>
                </div>
                <!-- 조회 조건 타이틀 종료 -->

                <!-- 조회 조건 시작 -->
                <div class="table_form" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:30%;">
                            <col style="width:10%;">
                            <col style="width:50%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.actTotAmt"/></th><!-- 활동총비용 -->
                                <td>
                                    <input id="actTotAmt" name="actTotAmt" class="form_numeric ar" maxlength="10" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 조회 조건 종료 -->
                <!-- 그리드 기능 버튼 시작 -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.rsltInput" /></h2><!-- 결과 조회 확인 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-I-12942" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s" id="btnGoalResultSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                    </dms:access>
                    </div>
                </div>
                <!-- 그리드 기능 버튼 종료 -->
                <div class="table_grid">
                    <div id="goalResultGrid"></div>
                </div>
            </div> <!-- 결과 조회 확인 -->
<%--             <div id="cropTabDiv" class="mt0">
                <!-- 조회 조건 타이틀 시작 -->
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.crop" /></h2><!-- 업체평가 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-I-12944" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s" id="btnCropSearch"><spring:message code="crm.btn.survey" /></button><!-- 설문 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12943" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s" id="btnCropSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                    </dms:access>
                    </div>
                </div>
                <!-- 조회 조건 타이틀 종료 -->

                <!-- 조회 조건 시작 -->
                <div class="table_form" role="search" data-btnid="btnCropSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:50%;">
                            <col style="width:10%;">
                            <col style="width:30%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.cropEvaltSheet"/></th><!-- 업체 평가서 -->
                                <td>
                                    <input id="sSeq" class="form_comboBox" />
                                    <input type="hidden" id="searchFlag" name="searchFlag" value="F" >
                                </td>
                                <th scope="row"> <spring:message code="crm.lbl.person" /> </th><!-- 직원 -->
                                <td>
                                    <input id="sEmpNm" name="sEmpNm" class="form_input" disabled="disabled" />
                                    <input type="hidden" id="sEmpId" name="sEmpId" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 조회 조건 종료 -->

                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstripCrop" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="defaultInfoTab" class="k-state-active"><spring:message code='crm.title.survey'/><!-- 설문 --></li>
                    </ul>

                    <!-- 설문 -->
                    <div>
                        <form id="surveyInfoForm" >
                            <div class="survey">
                                <h2 id="surveyName"></h2>
                                <div id="survey_content01" class="survey_content" style="height:284px;">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- //설문 -->
                </div>
            </div> <!-- 업체평가 --> --%>
            <div id="prsnContTabDiv" class="mt0">
                <div class="clfix" style="height:434px;">
                        <!-- 책임자 의견 -->
                        <section class="left_areaStyle">
                            <div class="header_area">
                               <h2 class="title_basic"><spring:message code="crm.title.prsnCont" /></h2><!-- 책임자 의견 --><%--2016.09.01--%>
                                <div class="btn_right">
                                </div>
                            </div>
                            <div class="table_form" style="height:400px;">
                                <form id="prsnContForm" >
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:100%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td class="required_area" style="height:390px;">
                                                    <input id="dlrCd" name="dlrCd" type="hidden">
                                                    <input id="pltCd" name="pltCd" type="hidden">
                                                    <input id="makCd" name="makCd" type="hidden">
                                                    <input id="seq" name="seq" type="hidden">
                                                    <input id="ivstTp" name="ivstTp" type="hidden">
                                                    <input id="docId" name="docId" type="hidden">
                                                    <textarea id="prsnOpnCont" name="prsnOpnCont" class="form_textarea" onKeyUp="txtLimit(this, '2000');"  style="width:100%;height:100%;"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </section>
                        <!-- 책임자의견 파일 업로드 -->
<!-- *************************************************************************
**************************파일업로드2********************************************
***************************************************************************-->
                          <section class="right_areaStyle">
                              <div class="header_area">
                                  <div class="btn_right">
                                  <dms:access viewId="VIEW-I-12948" hasPermission="${dms:getPermissionMask('READ')}">
                                      <button class="btn_s" id="btnSearchFile" ><spring:message code="global.btn.search" /><!-- 파일조회 --></button>
                                  </dms:access>
<%--                                       <button class="btn_s" id="btnSaveFile" ><spring:message code="global.btn.save" /><!-- 파일저장 --></button> --%>
                                    <dms:access viewId="VIEW-I-12947" hasPermission="${dms:getPermissionMask('READ')}">
                                      <button type="button" class="btn_s" id="btnPrsnContSave" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                                    </dms:access>
                                    <dms:access viewId="VIEW-I-12946" hasPermission="${dms:getPermissionMask('READ')}">
                                      <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                                    </dms:access>
                                    <dms:access viewId="VIEW-I-12945" hasPermission="${dms:getPermissionMask('READ')}">
                                      <span class="btn_s" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                                    </dms:access>
                                  </div>
                              </div>
                              <div class="table_grid">
                                <div id="fileGrid"></div>
                              </div>
                          </section>
<!-- *************************************************************************
**************************파일업로드2********************************************
***************************************************************************-->
                </div>

            </div> <!-- 담당자 의견 -->
        </div>
        </section>
    </section>
</div>
<!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    var isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
    ;

    var popupWindow;

    var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makSubTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
//    var budGetList   = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
//    var mediaList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    <c:forEach var="obj" items="${hostList}">
        hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makTpList}">
        makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makSubTpList}">
        makSubTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    //1.만족도 조사명 콤보 DataSource
    var stsfIvstNmList = [{"seq":"", "stsfIvstNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstNmList}">
    stsfIvstNmList.push({
        "seq":"${obj.seq}"
        ,"stsfIvstNm":"${obj.stsfIvstNm}"
        ,"useYn":"${obj.delYn}"
        });
    </c:forEach>
    var stsfIvstNmMap = dms.data.arrayToMap(stsfIvstNmList, function(obj){ return obj.seq; });

    function callBackFunc(){
        //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
        //$("#tabstrip-1", parent.document).html(customerForm);
        //$("#tabFormIframe").contents().find("#customerForm").html();
    }

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#mcdGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
          , grid = $("#"+gridId+"").data("kendoExtGrid")
          , selectedItem = grid.dataItem(grid.select())
        ;

        fnViewDetail();

    });

    // 문자열 byte 체크
    var txtLimit = function(obj, limitByte) {

        var currLen = 0;
        var size = 0;
        var charCode, chr = null;
        for( var i = 0 ; i < obj.value.length ; i++ ) {

            chr = obj.value.charAt(i);
            charCode = chr.charCodeAt(0);

            if (charCode <= 0x00007F) size += 1; else
            if (charCode <= 0x0007FF) size += 2; else
            if (charCode <= 0x00FFFF) size += 3;
            else size += 4;

            //console.log("charCode:",charCode+" | size:",size)
            if(size > limitByte ){

                var rtnVal = "";

                for( var j = 0 ; j < currLen ; j++ ) {
                    rtnVal += obj.value.charAt(j);
                }

                obj.value = rtnVal;
                // 텍스트를 {?} byte 초과하여 작성할 수 없습니다.
                dms.notification.warning("<spring:message code='crm.info.byteLimitInfo' arguments='"+limitByte+"' />");
                return false;

            };

            currLen++;
        };
    };

    var mode = "N";

    // 팝업 상세 조회
    function fnViewDetail(){

        var grid = $("#mcdGrid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        if ( dms.string.isNotEmpty(selectedItem) ){

            $("#dlrCd").val(selectedItem.dlrCd);    // 딜러코드
            $("#pltCd").val(selectedItem.pltCd);    // 사업장코드
            $("#makCd").val(selectedItem.makCd);    // 캠페인번호

            // 결과 조회 확인 탭의 그리드 조회
            $("#goalResultGrid").data("kendoExtGrid").dataSource.page(1);
            $("#tabstrip").data("kendoExtTabStrip").select(0);
            $("#actTotAmt").data("kendoExtNumericTextBox").value(selectedItem.actTotAmt);

            var win = $("#campaignResultWindow").data("kendoWindow");
            win.center();
            win.open();

        } else {

            // 선택해주세요.
            dms.notification.info("<spring:message code='crm.info.chkSelectItemMsg' />");
            return;
        };

    };

$(document).ready(function() {

    $("#campaignResultWindow").kendoWindow({
        pinned:true,
        modal:false,
        resizable:false,
        visible:false,
        animation:false,
        title:"<spring:message code='crm.menu.campaignResultMng' />",
        width:"950px",
        height:"500px"
    }).data("kendoWindow");




    $("#sEmpId").val("${userId}");
    $("#sEmpNm").val("${userNm}");

//    $("#sEmpId02").val("${userId}");
//    $("#sEmpNm02").val("${userNm}");

//     $("#btnCropSave").show();
//    $("#btnSaleEmpSurveySave").show();

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

    //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 주최.   hostList
    $("#sHostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:hostList
    });

    // 유형.   makTpList
    $("#sMakTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:makTpList
        , select:onSelectMakTpCdSearch
    });

    // 유형상세.   makSubTpList
    $("#sMakSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
    });

    // 활동총비용
    $("#actTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);

    // 상태.   statList
    /* $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:statList
    }); */

    setKendoDate = function( dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };

      /**
       * 유형에 따른 유형 Sub 조회(조회조건)
       */
       function onSelectMakTpCdSearch(e) {

           var dataItem = this.dataItem(e.item);

           $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sMakSubTpCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.cmmCd == ""){
               $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:_contextPath + "/crm/mcm/campaignResult/selectMakTpCdList.do"
               ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
               ,async:false
           });

           $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

       };


    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem != null){

                mode = "U";

                $("#dlrCd").val(selectedItem.dlrCd);    // 딜러코드
                $("#pltCd").val(selectedItem.pltCd);    // 사업장코드
                $("#makCd").val(selectedItem.makCd);    // 캠페인번호

                if (selectTabId == "rsltInputTab") {

                    // 목표 그리드 조회
                    var grid = $("#goalResultGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);
                    $("#actTotAmt").data("kendoExtNumericTextBox").value(selectedItem.actTotAmt);

/*                 } else if (selectTabId == "cropTab"){

                    $("#surveyName").empty();
                    $("#survey_content01 > ul").empty();
                    $('#searchFlag').val("F");

                    $("#btnCropSave").show();

                    // 설문결과 조회후 설문결과가 있으면 업체평가서 데이터소스를 설문지로....

                    var sMakCd = $("#makCd").val();
                    var sEmpId = $("#sEmpId").val();

                    $.ajax({
                        url:"<c:url value='/crm/mcm/campaignResult/selectSatisFactionSurveyResult.do' />"
                        ,data:JSON.stringify({"sMakCd":sMakCd, "sEmpId":sEmpId})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {

                            //console.log("jqXHR : ",jqXHR);
                            var stsfIvstNm = jqXHR.stsfIvstNm;
                            var subyTmplSeq = jqXHR.seq;

                            var sSeqDDL = $("#sSeq").data("kendoExtDropDownList");

                            if ( subyTmplSeq > 0 ) {

                                var stsfIvstMthCdDs = [{"seq":subyTmplSeq,"stsfIvstNm":stsfIvstNm}];

                                sSeqDDL.setDataSource(stsfIvstMthCdDs);
                                sSeqDDL.select(0);                          //설문지 일련번호
                                sSeqDDL.enable(false);
                                $("#btnCropSearch").click();

                                $("#survey_content01 ul li textarea").attr("readonly", true).addClass("form_readonly");
                                $("#survey_content01 ul li input:checkbox").prop("disabled", true);
                                $("#survey_content01 ul li input:radio").prop("disabled", true);
                                $("#btnCropSave").hide();
                                $("#btnCropSearch").hide();


                            } else {

                                sSeqDDL.setDataSource(dms.data.cmmCdFilter(stsfIvstNmList));
                                sSeqDDL.enable(true);
                                $("#btnCropSave").show();
                                $("#btnCropSearch").show();

                            }

                        }
                    });
 */
                } else if (selectTabId == "prsnContTab") {

                    $.ajax({
                        url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                        ,data:JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sMakCd":selectedItem.makCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
//                            dms.notification.error(jqXHR.responseJSON.errors);
                            $("#seq").val("");
                            $("#ivstTp").val("");
                            $("#prsnOpnCont").val("");
                            $("#docId").val("");
                            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일
                        }
                        ,success:function(jqXHR, textStatus) {
                            console.log(jqXHR);
                            $("#seq").val(jqXHR.seq);
                            $("#ivstTp").val(jqXHR.ivstTp);
                            $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                            $("#docId").val(jqXHR.docId);
                            if (dms.string.isNotEmpty(jqXHR.docId)) {
                                $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
                            };
                        }
                    });

                }

            } else {
                mode = "N";
            }
        }
    });

/*************************************************************
이벤트 정의
*************************************************************/

    // 조회버튼
    $("#btnSearch").kendoButton({
        click:function(e) {

            var grid = $("#mcdGrid").data("kendoExtGrid");
            grid.dataSource.page(1);

            mode = "N";

            $("#dlrCd").val("");
            $("#makCd").val("");

            var kendoTab = $("#tabstrip").data("kendoExtTabStrip").select();

            if (kendoTab[0].id == "rsltInputTab") {

                $("#goalResultGrid").data("kendoExtGrid").dataSource._destroyed = [];
                $("#goalResultGrid").data("kendoExtGrid").dataSource.page(1);

/*             } else if (kendoTab[0].id == "cropTab"){

                $("#surveyName").empty();
                $("#survey_content01 > ul").empty();
                $('#searchFlag').val("F");

//                 $("#btnCropSave").show();
 */
            } else if (kendoTab[0].id == "prsnContTab") {

                $("#seq").val("");
                $("#ivstTp").val("");
                $("#prsnOpnCont").val("");

            }
        }
    });

    //버튼 - 엑셀저장
    $("#btnCtlRltMgmtExcelExp").kendoButton({
        click:function(e) {

            //var grid = $("#mcdGrid").data("kendoExtGrid");
            var sysDateExcelNm = new Date();
            var sysDtVal;
            sysDtVal = sysDateExcelNm.getFullYear()+"-";
            sysDtVal += sysDateExcelNm.getMonth()+1;
            sysDtVal += "-"+sysDateExcelNm.getDate();
            sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

            console.log("Excel Export mcdGrid Result : "+ sysDateExcelNm);
            console.log($("#sStartDt").data("kendoExtMaskedDatePicker").value());
            console.log($("#sStartDt").val());
            console.log($("#sStartDt").data("kendoExtMaskedDatePicker").value());
            console.log($("#sStartDt").val());

            dms.ajax.excelExport({
                "beanName":"campaignResultService"
                ,"templateFile":"CampaignRltMgmtListExp_Tpl.xlsx"
                ,"fileName":"<spring:message code='crm.menu.campaignResultMng' />_"+sysDtVal+".xlsx"
                ,"sMakNm":$("#sMakNm").val()
                ,"sMakCd":$("#sMakCd").val()
                ,"sHostCd":$("#sHostCd").val()
                ,"sMakTpCd":$("#sMakTpCd").val()
                ,"sMakSubTpCd":$("#sMakSubTpCd").val()
                ,"sStatCd":"03"//$("#sStatCd").val()
                ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                ,"sExcelTp":"CampaignRltMgmtList"
            });
        }
    });

    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            fnViewDetail();

        }
        , enable:true
    });

    //버튼 - 기본목표 결과계산
    $("#btnDefaultTargSum").kendoButton({
        click:function(e) {

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isEmpty(selectedItem) ){
                // 선택해주세요.
                dms.notification.info("<spring:message code='crm.info.chkSelectItemMsg' />");
                return;
            };

            var param = {};
            param["makCd"] = selectedItem.makCd;
            var statFlag;
            $.each(statList, function(i) {
                if(statList[i].cmmCdNm == selectedItem.statNm){
                    statFlag = statList[i].cmmCd;
                }
            });
            if(statFlag != "03"){
                dms.notification.info("<spring:message code='crm.info.OnlyActivityIsCounted'/>");
                return;
            }
            // 기본목표 결과계산 confirm
            dms.window.confirm({
                message:"<spring:message code='crm.info.defaultTargSumConfirm'/>"       // 현재 캠페인의 진행상태가 [심사완료]인  전체 기본목표값이 계산됩니다. 기본목표값 계산을 수행하시겠습니까?
                ,callback:function(result){
                    if(result){

                        var url = "<c:url value='/crm/cmm/campaignResult/selectCrmDefultTargSum.do' />";

                        var json = {};

                        $.ajax({
                            url:url
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                            ,data:JSON.stringify(json)
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(data) {

//                              console.log("data::::" + data.result);
                                resultKey = selectedItem.makCd;
                                isGridReload = true;
                                mode = "U";
                                grid.dataSource.read();

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                            ,beforeSend:function(xhr){
                                dms.loading.show();
                            }
                            ,complete:function(xhr,status){
                                dms.loading.hide();
                            }
                        });

                    }else{
                        //취소버튼 클릭 로직
                        return;
                    }
                }
            });
            // 기본목표 결과계산 confirm

        }
    });



    // 결과 조회 확인 탭
    //버튼 - 활동총비용 저장
    $("#btnSaveVehic").kendoButton({
        click:function(e) {
            // 활동총비용
            if ( dms.string.isEmpty($("#actTotAmt").val())){
                dms.notification.warning("<spring:message code='crm.lbl.actTotAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#actTotAmt").focus();
                return false;
            }

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            var makTpCd;
            if ( dms.string.isNotEmpty(selectedItem) ){
                makTpCd = selectedItem.makTpCd;
            }

            var param = {};

            param["makCd"] = $("#makCd").val();
            param["actTotAmt"] = $("#actTotAmt").data("kendoExtNumericTextBox").value();
            param["makTpCd"] = makTpCd;
            param["befMakTpCd"] = makTpCd;

            console.log(param);
            // kjlee $("#mcdGrid")

            $.ajax({
                url:"<c:url value='/crm/mcm/marketingCampaign/updateMarketingCampaigns.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(param)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {

                    console.log(data);
                    if (data.length > 0) {
                        resultKey = $("#makCd").val();
                        isGridReload = true;
                        mode = "U";
                        grid.dataSource.read();
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
//                     $("#mcdGrid").data("kendoExtGrid").dataSource.page(1);
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#campaignResultWindow"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#campaignResultWindow"));
                }
            });

        }
    });

    //버튼 - 저장
    $("#btnGoalResultSave").kendoButton({
        click:function(e) {

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {
                var gridGoalResult = $("#goalResultGrid").data("kendoExtGrid");

                var saveData = gridGoalResult.getCUDData("insertList", "updateList", "deleteList");
                if (gridGoalResult.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (gridGoalResult.gridValidation()) {

                    $.ajax({
                        url:"<c:url value='/crm/mcm/campaignResult/multiGoalResults.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            gridGoalResult.dataSource._destroyed = [];
                            gridGoalResult.dataSource.page(1);

                            resultKey = $("#makCd").val();
                            isGridReload = true;
                            mode = "U";
                            grid.dataSource.read();

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#campaignResultWindow"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#campaignResultWindow"));
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }
    });

    // 업체평가 탭
    // 유형
    $("#sSeq").kendoExtDropDownList({
        dataTextField:"stsfIvstNm"
        , dataValueField:"seq"
        //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        ,dataSource:dms.data.cmmCdFilter(stsfIvstNmList)
    });

    $("#btnCropSave").kendoButton({
        click:function(e){

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if(selectedItem!=null) {

                if($("#sSeq").val() == ""){
                    //업체 평가서(을)를 선택해 주시기 바랍니다.
                    dms.notification.info("<spring:message code='crm.lbl.cropEvaltSheet' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                    $("#sSeq").focus();
                    return;
                }

                if($('#searchFlag').val() == "F"){
                    //설문(을)를 선택하세요.
                    dms.notification.info("<spring:message code='crm.btn.survey' var='playSurvey' /><spring:message code='global.info.check.field' arguments='${playSurvey}' />");
                    return;
                }

                var nameArr = [];
                var val = [];
                var seq = $("#sSeq").val();
                var strArr = [];
                //라디오 버튼 Validation시작
                $(":radio[name ^='rad01_']").each(function(index){
                    nameArr[index] = $(this).attr("name");
                });

                var uniqueNames = [];

                $.each(nameArr,function(i,el){
                    if($.inArray(el,uniqueNames) === -1)
                        uniqueNames.push(el)
                        //uniqueNames[i] = el;
                });

                if(!validChk(uniqueNames,"noTxt")){
                    return;
                }

                var stsfIvstYn = $("input:radio[name=stsfIvstYn]:checked").val();
                if (  dms.string.isEmpty(stsfIvstYn) ) {
                    // {만족여부} 을(를) 선택하세요.
                    dms.notification.warning("<spring:message code='crm.lbl.stsfIvstYn' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                    return;
                };

                //var nm2="";
                var params = [];
                var idx = 0;
                for(var k=0; k<uniqueNames.length;k++){
                    var rad_nm = uniqueNames[k];
                    if($("input:radio[name="+rad_nm+"]").is(":checked")){
                        obj = {};
                        obj["makCd"] = $("#makCd").val();//만족도 조사 결과 일련번호
                        obj["stsfIvstRsltSeq"] = "0";//만족도 조사 결과 일련번호
                        obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                        obj["subyTmplSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-sts");//설문 템플릿 일련번호
                        obj["qestSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-stqs");//질문 일련번호
                        obj["qestWgtVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-qwv");//질문 가중치
                        obj["qestTpCd"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-qtc");//질문 유형코드
                        obj["answSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-is");//질문일련번호
                        obj["answScoreVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-score");
                        obj["empId"] = $("#sEmpId").val();
                        obj["sbjvAnswCont"] = "";
                        obj["stsfIvstYn"] = stsfIvstYn;
                        obj["cmplReasonCont"] = $("#txt01_cmplReasonCont").val();
                        params.push(obj);
                        idx++;
                    }
                }
                //CheckBox Validation시작
                nameArr = [];
                $(":checkbox[name ^='chk01_']").each(function(index){
                    nameArr[index] = $(this).attr("name");
                });

                uniqueNames = [];


                $.each(nameArr,function(i,el){
                    if($.inArray(el,uniqueNames) === -1)
                        uniqueNames.push(el)
                        //uniqueNames[i] = el;
                });

                if(!validChk(uniqueNames,"noTxt")){
                    return;
                }

                $(":checkbox[name ^='chk01_']").each(function(index){
                    if($(this).is(":checked")){

                        obj = {};
                        obj["makCd"] = $("#makCd").val();//만족도 조사 결과 일련번호
                        obj["stsfIvstRsltSeq"] = "0";//만족도 조사 결과 일련번호
                        obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                        obj["subyTmplSeq"] = $(this).attr("data-sts");//설문 템플릿 일련번호
                        obj["qestSeq"] = $(this).attr("data-stqs");//질문 일련번호
                        obj["qestWgtVal"] = $(this).attr("data-qwv");//질문 가중치
                        obj["qestTpCd"] = $(this).attr("data-qtc");//질문 유형코드
                        obj["answSeq"] = $(this).attr("data-is");//답변 일련번호
                        obj["answScoreVal"] = $(this).attr("data-score");
                        obj["sbjvAnswCont"] = "";
                        obj["empId"] = $("#sEmpId").val();
                        obj["stsfIvstYn"] = stsfIvstYn;
                        obj["cmplReasonCont"] = $("#txt01_cmplReasonCont").val();

                        params.push(obj);
                        idx++;
                    }
                });

                //textArea Validation시작
                nameArr = [];
                $("textarea[name ^='txt01_']").each(function(i){
                    nameArr[i] = $(this).attr("id");
                });

                uniqueNames = [];

                $.each(nameArr,function(i,el){
                    if($.inArray(el,uniqueNames) === -1)
                        uniqueNames.push(el)
                        //uniqueNames[i] = el;
                });

                for(var p=0; p<uniqueNames.length;p++){
                    var txt_nm = uniqueNames[p];

                    if($('#'+txt_nm+'').val() != "" && $('#'+txt_nm+'').val() != null && $('#'+txt_nm+'').attr("data-sts") != undefined){
                        obj = {};
                        obj["makCd"] = $("#makCd").val();//만족도 조사 결과 일련번호
                        obj["stsfIvstRsltSeq"] = "0";//만족도 조사 결과 일련번호
                        obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                        obj["subyTmplSeq"] = $('#'+txt_nm+'').attr("data-sts");//설문 템플릿 일련번호
                        obj["qestSeq"] = $('#'+txt_nm+'').attr("data-stqs");//질문 일련번호
                        obj["qestWgtVal"] = $('#'+txt_nm+'').attr("data-qwv");//질문 가중치
                        obj["qestTpCd"] = $('#'+txt_nm+'').attr("data-qtc");//질문 유형코드
                        obj["answSeq"] = null;//답변 일련번호
                        obj["answScoreVal"] = 0;
                        obj["sbjvAnswCont"] = $('#'+txt_nm+'').val();
                        obj["empId"] = $("#sEmpId").val();
                        obj["stsfIvstYn"] = stsfIvstYn;
                        obj["cmplReasonCont"] = $("#txt01_cmplReasonCont").val();

                        params.push(obj);
                        idx++;
                    }
                    /* console.log("html::"+$('#'+txt_nm+'').html());
                    console.log("val::"+$('#'+txt_nm+'').val()); */
                }

                if(!validChk(uniqueNames,"txt")){
                    return;
                }

                if ( params.length <= 0 ) {
                    // {설문결과}을(를) 입력해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.stsfIvstRsltCont' var='custStsfSurvey' /><spring:message code='global.info.emptyCheckParam' arguments='${custStsfSurvey}' />");
                    return;
                }

                console.log(JSON.stringify({"insertList":params}));

                $.ajax({
                    url:"<c:url value='/crm/mcm/campaignResult/multiCampaign01AnswerSurveys.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify({"insertList":params})
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#survey_content01 > ul").empty();
                        //설문에 응해주셔서 감사합니다.
                        //var htmladd = "<tr><th colspan='2'><h1 class='title_basic'  align='center'><spring:message code='crm.info.surveySucess'/> </h1></th></tr>";
                        var htmladd = '<li><p class="txt_thanks"><spring:message code="crm.info.surveySucess"/></p></li>';
                        $("#survey_content01 > ul").append(htmladd);
                        $('#searchFlag').val("F");
//                         $("#btnCropSave").hide();
//                         $("#btnCropSearch").hide();
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#campaignResultWindow"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#campaignResultWindow"));
                    }
                });
            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }

    });

    function validChk(uniqueNames,txt){
        var nm = "";
        for(var j=0; j<uniqueNames.length;j++){
            nm = uniqueNames[j];

            if(txt == "noTxt"){
                if(!$("input[name="+nm+"]").is(":checked")){
                    //응답하지 않은 설문 문항이 있습니다.
                    dms.notification.info("<spring:message code='crm.info.noSurveyCheck'/>");
                    return false;
                }
            }
        }
        return true;
    }

    //조회
    $("#btnCropSearch").kendoButton({
        click:function(e){

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {

                if($("#sSeq").val() == ""){
                    //업체 평가서(을)를 선택해 주시기 바랍니다.
                    dms.notification.info("<spring:message code='crm.lbl.cropEvaltSheet' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                    $('#searchFlag').val("F");
                    $('#sSeq').focus();
                    return;
                }

                $('#searchFlag').val("T");

                $("#surveyName").empty();
                var surveyName = $("#sSeq").data("kendoExtDropDownList").text();
                $("#surveyName").append(surveyName);

                $("#survey_content01 > ul").empty();
                var sSeq = $("#sSeq").val();
                var sMakCd = $("#makCd").val();
                var sEmpId = $("#sEmpId").val();

                $.ajax({
                    url:"<c:url value='/crm/mcm/campaignResult/selectSatisFactionSurvey01s.do'/>",
                    data:JSON.stringify({"sSeq":sSeq, "sMakCd":sMakCd, "sEmpId":sEmpId}),
                    async:false,
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                }).done(function(result) {

                    var questionList = result["questionList"];
                    var questionListCnt = result["questionListCnt"];
                    var answerList = result["answerList"];
                    var answerListCnt = result["answerListCnt"];

                    var template = "";
                    var result = "";
                    var cmplReasonCont = "";
                    var stsfIvstYn = "";

                    var data = [];
                    var lastIdx;

                    // 시작헤드
                    var headTmpl = '<li><h3>#:index #. #:qestCont # #:answSelCntCont #</h3><div class="answer_area">';

                    // 라디오(객관식 단일)
                    var singleTmpl = '<p><label class="label_check"><input type="radio" id="rad01_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                                      'class="form_check"'+
                                      'name="rad01_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                      'value="#:itemSeq #"'+
                                      '#if(checkFlag === "Y"){#checked=checked#}#'+
                                      'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#" data-score="#:answScoreVal#" /> #:answCont #</label></p>';

                    // 체크박스(객관식 다중)
                    var multiTmpl = '<p><label class="label_check"><input type="checkbox" id="chk01_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                                      'class="form_check"'+
                                      'name="chk01_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                      'value="#:itemSeq #"'+
                                      '#if(checkFlag === "Y"){#checked=checked#}#'+
                                      'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#" data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#"/>#:answCont #</label></p>';

                    // 주관식
                    var shortTmpl = '<textarea rows="4" cols="" id="txt01_#:subyTmplSeq #_#:subyTmplQestSeq #" maxlength="1333" '+
                                      'class="form_textarea"'+
                                      'name="txt01_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                      'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#" style="width:100%;">#:checkFlag #</textarea>';

                    // 종료
                    var tailTmpl = '</div></li>';

                    //만족여부
                    var stsfIvstYnTmpl = '<li style="border-top:1px solid black;"><h3><spring:message code="crm.lbl.stsfIvstYn"/></h3><div class="answer_area"><p>'
                                       + '<label class="label_check"><input type="radio" id="stsfIvstY" name="stsfIvstYn" value="Y" class="form_check" '+'#if(stsfIvstYn === "Y"){#checked=checked#}#'+'/>&nbsp;<spring:message code="crm.lbl.satisfaction"/></label>&nbsp;&nbsp;'
                                       + '<label class="label_check"><input type="radio" id="stsfIvstN" name="stsfIvstYn" value="N" class="form_check" '+'#if(stsfIvstYn === "N"){#checked=checked#}#'+'/>&nbsp;<spring:message code="crm.lbl.dissatisfied"/></label>'
                                       + '</p></div></li>';

                    // 총결
                    var cmplReasonContTmpl = '<li><h3><spring:message code="crm.lbl.cmplReasonCont"/></h3><div class="answer_area">'+
                                              '<textarea rows="4" cols="" id="txt01_cmplReasonCont" maxlength="1333" '+
                                                'class="form_textarea"'+
                                                'name="txt01_cmplReasonCont'+
                                                'style="width:100%;">#:cmplReasonCont #</textarea></div></li>';

                    //문제 for
                    for(var i=0;i < questionList.length;i++){
                        var subyTmplSeq = questionList[i].subyTmplSeq;
                        var subyTmplQestSeq = questionList[i].subyTmplQestSeq;
                        //체크박스의 경우 선택할수 있는  갯수가 정해져 있을경우 문제옆에 선택가능한 갯수를 표현해 준다.
                        var answSelCntCont = "";
                        if ( questionList[i].qestTpCd == "02" && questionList[i].answSelCnt > 0 ) {
                            answSelCntCont = '('+questionList[i].answSelCnt+' <spring:message code="crm.lbl.selected"/>'+')';
                        };

                        template = kendo.template(headTmpl);
                        data = {
                                index:(i+1)
                                ,qestCont:questionList[i].qestCont
                                ,answSelCntCont:answSelCntCont
                        }
                        result += template(data);
                        lastIdx = (data.index)+1;
                        //답변 for
                        for(var j=0;j < answerList.length;j++){
                            if(questionList[i].qestTpCd == "01"){
                                //객관식 단답형
                                if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                    template = kendo.template(singleTmpl);
                                    data = {subyTmplSeq:answerList[j].subyTmplSeq
                                            ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                            , itemSeq:answerList[j].itemSeq
                                            , answCont:answerList[j].answCont
                                            , answScoreVal:answerList[j].answScoreVal
                                            , qestWgtVal:questionList[i].qestWgtVal
                                            , qestTpCd:questionList[i].qestTpCd
                                            , checkFlag:answerList[j].itemSeq == answerList[j].answSeq ? "Y":"N"
                                    }
                                    result += template(data);
                                }
                            }else if(questionList[i].qestTpCd == "02"){
                                //객관식 다답형
                                if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                    template = kendo.template(multiTmpl);
                                    data = {subyTmplSeq:answerList[j].subyTmplSeq
                                            ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                            , itemSeq:answerList[j].itemSeq
                                            , answCont:answerList[j].answCont
                                            , answScoreVal:answerList[j].answScoreVal
                                            , qestWgtVal:questionList[i].qestWgtVal
                                            , qestTpCd:questionList[i].qestTpCd
                                            , checkFlag:answerList[j].itemSeq == answerList[j].answSeq ? "Y":"N"
                                    }
                                    result += template(data)
                                }
                            }else{
                                //주관식
                                if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                    template = kendo.template(shortTmpl);
                                    data = {subyTmplSeq:answerList[j].subyTmplSeq
                                            ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                            , itemSeq:answerList[j].itemSeq
                                            , answScoreVal:answerList[j].answScoreVal
                                            , qestWgtVal:questionList[i].qestWgtVal
                                            , qestTpCd:questionList[i].qestTpCd
                                            , checkFlag:answerList[j].sbjvAnswCont != null ? answerList[j].sbjvAnswCont:""
                                    }
                                    result += template(data);
                                }
                            }

                            if(answerList[j].stsfIvstYn != "" && answerList[j].stsfIvstYn != null){
                                stsfIvstYn = answerList[j].stsfIvstYn;
                            }
                            if(answerList[j].cmplReasonCont != "" && answerList[j].cmplReasonCont != null){
                                cmplReasonCont = answerList[j].cmplReasonCont;
                            }
                        }
                    }

                    //만족여부 추가
                    template = kendo.template(stsfIvstYnTmpl);
                    data = {stsfIvstYn:stsfIvstYn}
                    result += template(data);

                    //총결
                    template = kendo.template(cmplReasonContTmpl);
                    data = {cmplReasonCont:cmplReasonCont}
                    result += template(data);

                    result += tailTmpl;
                    $("#survey_content01 > ul").append(result);

                });
            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }
    });

    $("#tabstripCrop").kendoExtTabStrip({
        animation:false
        , select:function(e) {

        }
    });

    //담당자 의견 탭
    //버튼 - 저장
    $("#btnPrsnContSave").kendoButton({
       click:function(e){

           var grid = $('#mcdGrid').data('kendoExtGrid');
           var selectedItem = grid.dataItem(grid.select());
           if(selectedItem!=null) {

               // 화면 필수 체크
               if ( dms.string.isEmpty($("#prsnOpnCont").val())){
                   dms.notification.warning("<spring:message code='crm.lbl.prsnCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   $("#prsnOpnCont").focus();
                   return false;
               }

               var json = $("#prsnContForm").serializeObject();

               //console.log("prsnContForm"+JSON.stringify(json));

               var url = "";

               if(json.ivstTp == ""){
                   url = "<c:url value='/crm/mcm/campaignResult/insertPrsnConts.do' />";
               }else{
                   url = "<c:url value='/crm/mcm/campaignResult/updatePrsnConts.do' />";
               }
               $.ajax({
                   url:url
                   ,dataType:"json"
                   ,type:"POST"
                   ,contentType:"application/json"
                   ,data:JSON.stringify(json)
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors);
                   }
                   ,success:function(data) {
                       dms.notification.success("<spring:message code='global.info.success'/>");

                       $.ajax({
                           url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                           ,data:JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sMakCd":selectedItem.makCd})
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,error:function(jqXHR,status,error) {
//                               dms.notification.error(jqXHR.responseJSON.errors);
                               $("#seq").val("");
                               $("#ivstTp").val("");
                               $("#prsnOpnCont").val("");
                               $("#docId").val("");
                               $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일
                           }
                           ,success:function(jqXHR, textStatus) {
                               $("#seq").val(jqXHR.seq);
                               $("#ivstTp").val(jqXHR.ivstTp);
                               $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                               $("#docId").val(jqXHR.docId);
                               if (dms.string.isNotEmpty(jqXHR.docId)) {
                                   $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
                               };

                               resultKey = $("#makCd").val();
                               isGridReload = true;
                               mode = "U";
                               grid.dataSource.read();
                           }
                           ,beforeSend:function(xhr){
                               dms.loading.show($("#campaignResultWindow"));
                           }
                           ,complete:function(xhr,status){
                               dms.loading.hide($("#campaignResultWindow"));
                           }
                       });
                   }
               });
           } else {
               //캠페인 목록을 먼저 선택해 주십시오.
               dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
           }
       }
       , enable:true
    });

    //파일탭 조회
    $("#btnSearchFile").kendoButton({
        click:function(e) {
            if ( dms.string.isEmpty($("#docId").val())){
                dms.notification.warning("<spring:message code='global.lbl.file' var='returnMsg' /><spring:message code='crm.info.noinfoData' arguments='${returnMsg}' />");
                return false;
            }
            $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //파일탭 저장
    $("#btnSaveFile").kendoButton({
        click:function(e) {
            if ( dms.string.isEmpty($("#docId").val())){
                dms.notification.warning("<spring:message code='global.lbl.file' var='returnMsg' /><spring:message code='crm.info.noinfoData' arguments='${returnMsg}' />");
                return false;
            }
            $("#btnPrsnContSave").click();
        }
    });

/* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
//========파일삭제
$("#fileDelete").click(function(){
    var grid = $("#fileGrid").data("kendoExtGrid");
    var rows = grid.select();
    var selectedItem = grid.dataItem(grid.select());

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

$("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
    var grid = $("#fileGrid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    if(dms.string.isNotEmpty(dataItem)){
        dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
    }
});
/* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

/* *************************************************************************
 **************************파일업로드5********************************************
 ***************************************************************************/
 // 파일 그리드 시작    //
$("#fileGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["sFileDocNo"] = $("#docId").val();

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
           ,height:400
           ,navigatable:false
           ,pageable:false
           ,sortable:false
           ,multiSelectWithCheckbox:true
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
 **************************파일업로드5********************************************
 ***************************************************************************/

     //그리드 설정(캠페인 마스터)
     $("#mcdGrid").kendoExtGrid({
         gridId:"G-CRM-0731-160202"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/campaignResult/selectCampaignResults.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"]    = options.pageSize;
                         params["pageIndex"]             = options.page;
                         params["firstIndex"]            = options.skip;
                         params["lastIndex"]             = options.skip + options.take;
                         params["sort"]                  = options.sort;

                         params["sMakNm"]      = $("#sMakNm").val();
                         params["sMakCd"]      = $("#sMakCd").val();
                         params["sHostCd"]     = $("#sHostCd").val();
                         params["sMakTpCd"]    = $("#sMakTpCd").val();
                         params["sMakSubTpCd"] = $("#sMakSubTpCd").val();
                         params["sStatCd"]     = "03";//$("#sStatCd").val();
                         params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                         //console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 errors:"error"
                 ,data:"data"
                 ,total:"total"
                 ,model:{
                     id:"makCd"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , makNm:{type:"string", editable:false}
                         , regDt:{type:"date", editable:false}
                         , regDtFormat:{type:"date", editable:false}
                         , hostCd:{type:"string", editable:false}
                         , hostNm:{type:"string", editable:false}
                         , statCd:{type:"string", editable:false}
                         , statNm:{type:"string", editable:false}
                         , makTpCd:{type:"string", editable:false}
                         , makTpSubTpNm:{type:"string", editable:false}
                         , rcpeNm:{type:"string", editable:false}
                         , targCustCnt:{type:"number", editable:false}
                         , startDt:{type:"date", editable:false}
                         , startDtFormat:{type:"date", editable:false}
                         , endDt:{type:"date", editable:false}
                         , endDtFormat:{type:"date", editable:false}
                         , budgetAmt:{type:"number", editable:false}
                         , regUsrId:{type:"string", editable:false}
                         , telCsltCnt:{type:"number", editable:false}
                         , visitCnt:{type:"number", editable:false}
                         , recordSaveCnt:{type:"number", editable:false}
                         , salesOpptCnt:{type:"number", editable:false}
                         , venCnt:{type:"number", editable:false}
                         , venAmt:{type:"number", editable:false}
                         , visitResvCnt:{type:"number", editable:false}
                         , actTotAmt:{type:"number", editable:false}
                         , dlrCd:{type:"string", editable:false}
                         , pltCd:{type:"string", editable:false}
                     }
                 }
                 ,parse:function(d) {
                     if(d.data){
                         $.each(d.data, function(idx, elem) {
                             elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                             elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                             elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                         });
                     }
                     return d;
                 }
             }
             ,requestEnd:function(e){
                 if (e.type !== "read"){
                     //this.page(1);
                 }
             }
         }
         ,dataBound:function(e) {
             // 캠페인목록에서 makCd 가지고 온경우 해당 grid dataBound 시 makCd 찾아서 선택, 상세조회 이벤트 준다
             var grid = $("#mcdGrid").data("kendoExtGrid")
             , rows = grid.tbody.find("tr")
             , gridData
             , selectRow
             if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {
                 rows.each(function(index, row) {
                     gridData = grid.dataSource.at(index);
                     if ( gridData.makCd === resultKey ) {
                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                         grid.select(selectRow);
                     }
                 });
                 isGridReload = false;
             }
         }
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", width:130, attributes:{"class":"ac"}, sortable:true}       // 캠페인코드
            ,{field:"makNm", title:"<spring:message code='global.lbl.crNm' />", width:200, sortable:true}      // 캠페인명
//            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"
            }
            ,{field:"hostCd", title:"<spring:message code='global.lbl.hostCd' />", hidden:true}                       // 주최
            ,{field:"hostNm", title:"<spring:message code='global.lbl.hostCd' />", width:100, attributes:{"class":"ac"}, sortable:false}       // 주최
            ,{field:"makTpCd", title:"<spring:message code='global.lbl.type' />", hidden:true}    // 유형
            ,{field:"makTpSubTpNm", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"},sortable:false}    // 유형
            ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", hidden:true}   // 상태
            ,{field:"statNm", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}, sortable:false}   // 상태
            //,{field:"rcpeNm", title:"<spring:message code='global.lbl.rcpeNm' />", width:100, sortable:true}      // 대상
            ,{field:"targCustCnt", title:"<spring:message code='global.lbl.targCustCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 목표인수
//            ,{field:"startDt", title:"<spring:message code='global.lbl.startDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
//            ,{field:"endDt", title:"<spring:message code='global.lbl.EndDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
            ,{field:"startDtFormat", title:"<spring:message code='global.lbl.startDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"endDtFormat", title:"<spring:message code='global.lbl.EndDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", sortable:true}    // 예산
            ,{field:"actTotAmt", title:"<spring:message code='crm.lbl.actTotAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", sortable:true}    // 활동총비용
//             ,{field:"telCsltCnt", title:"<spring:message code='crm.lbl.telCsltCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 전화상담 수량
            ,{field:"visitCnt", title:"<spring:message code='crm.lbl.visitCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 내방 수량
//             ,{field:"recordSaveCnt", title:"<spring:message code='crm.lbl.recordSaveCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 기록저장 수량
            ,{field:"salesOpptCnt", title:"<spring:message code='crm.lbl.salesOpptCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 영업기회 수량
            ,{field:"venCnt", title:"<spring:message code='crm.lbl.venCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 거래 수량
            ,{field:"venAmt", title:"<spring:message code='crm.lbl.venAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", sortable:true}    // 거래 금액
            ,{field:"visitResvCnt", title:"<spring:message code='crm.lbl.visitResvCnt' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 내방예약 수량
            ,{field:"smsSuccessCnt", title:"<spring:message code='crm.lbl.smsSuccessCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:##,###}", sortable:true}    // SMS 발송성공수량
            ,{field:"serCompCnt", title:"<spring:message code='crm.lbl.serviceCompCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:##,###}", sortable:true}    // 정비완료수량
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}    // 등록자
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:false          //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         , navigatable:true
         , selectable:"row"
     });


    //그리드 설정(목표)
     $("#goalResultGrid").kendoExtGrid({
         gridId:"G-CRM-0725-204302"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/campaignResult/selectGoalResults.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         //console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , seq:{type:"string", editable:false}
                         , targCd:{type:"string", editable:false}
                         , targNm:{type:"string", editable:false}
                         , targCntVal:{type:"number", editable:false}
                         , targRsltVal:{type:"number", validation:{required:true}}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         ,edit:function(e) {
             if(!e.model.isNew()) {
                 if (!dms.string.isEmpty(e.model.targCd) && e.sender.columns[e.container.index()].field == "targRsltVal") {
                     this.closeCell();
                 }
             }
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:334
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
            ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
            ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />", width:500}       // 상세내역
            ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:100, attributes:{"class":"ac"}}   // 목표수치값
            ,{field:"targRsltVal", title:"<spring:message code='global.lbl.targRsltVal' />", width:100, attributes:{"class":"ac"}}   // 목표결과
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });

});

/* *************************************************************************
 **************************파일업로드4********************************************
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
                 $("#docId").val(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#docId").val();
     }

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
 **************************파일업로드4********************************************
 ***************************************************************************/

</script>
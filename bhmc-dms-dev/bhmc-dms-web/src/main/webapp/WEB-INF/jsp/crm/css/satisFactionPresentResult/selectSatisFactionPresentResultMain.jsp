<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.satisFactionPresentResult'/><!-- 만족도 조사결과 현황 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11182" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11183" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_info" id="btnStsfRstInvalidity"><spring:message code="crm.btn.stsfRstInvalidity"/><!-- 조사결과 무효처리 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11184" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_save" id="btnLowScoreSave"><spring:message code="crm.btn.lowScoreAction" /><!-- 낮은 점수 처리 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11185" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11186" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
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
                                    <input type="text" id="sStsfIvstNm" name="sStsfIvstNm" maxlength="100" value="" class="form_input">
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
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstDt"/><!-- 만족도 조사일 --></th>
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
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstYn"/><!-- 만족여부 --></th>
                                <td>
                                    <input id="sStsfIvstYn" name="sStsfIvstYn" class="form_comboBox">
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
                    <div id="presentUsrGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>

            <section id="presentUsrWindow" class="pop_wrap">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.surveyQeusDetail'/></h2><!-- 설문항목상세 -->
                    <div class="btn_right">
                        <spring:message code="crm.lbl.stsfIvstScoreVal"/>:<input id="stsfIvstScoreVal" name="stsfIvstScoreVal" class="form_numeric ar form_readonly" readonly style="width:50%;" >
                    </div>
                </div>
                <div class="table_grid">
                    <div id="presentDetailGrid"></div>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"> <spring:message code='crm.lbl.stsfIvstYn'/> </h2><!-- 만족여부 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:100%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <p><label class="label_check">
                                       <input type="radio" id="stsfIvstY" name="stsfIvstYn" value="Y" class="form_check form_readonly" disabled />&nbsp;<spring:message code="crm.lbl.satisfaction"/></label><label class="label_check">
                                       <input type="radio" id="stsfIvstN" name="stsfIvstYn" value="N" class="form_check form_readonly" disabled />&nbsp;<spring:message code="crm.lbl.dissatisfied"/>
                                       </label></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"> <spring:message code='crm.lbl.cmplReasonCont'/> </h2><!-- 총결 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:100%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <%-- <th scope="row"><spring:message code='crm.lbl.cmplReasonCont'/>불만족 원인 여부</th> --%>
                                <td>
                                    <textarea rows="4" cols="4" class="form_textarea form_readonly" id="cmplReasonCont" name="cmplReasonCont" readonly ></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
/*************************************************************
데이터 셋업
*************************************************************/
    //만족도 조사 유형
    var stsfIvstMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstMthCdList}">
        stsfIvstMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //만족도 조사 수단
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
        stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //조사 타입
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
        stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    // 만족여부
    var stsfIvstYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstYnList}">
        stsfIvstYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    function gridCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        params["sCustNm"] = $("#sCustNm").val();
        params["sStsfIvstNm"] = $("#sStsfIvstNm").val();
        params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
        params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
        params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
        params["sStsfIvstYn"] = $("#sStsfIvstYn").data("kendoExtDropDownList").value();
        params["sSatisFactionPresentResult"] = "Y"
        params["sMngUsrNm"] = $("#sMngUsrNm").val();

        return params;

    };

    $(document).ready(function() {


        //만족도 조사점수
        $("#stsfIvstScoreVal").kendoExtNumericTextBox({
            format:"n2"
            ,min:0
            ,value:0
            ,spinners:false             // 증,감 화살표
        });

        // show/hide
        $("#btnHidden").kendoButton({
            click:function(e){
                $("#hiddenTable").toggle();
                resizeGrid();
            }
        });

        $("#sStsfIvstYn").kendoExtDropDownList({
            dataSource:stsfIvstYnList
            , dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            ,index:0
        });

        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
        $("#presentUsrWindow").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.title.stsfPresentResult' />"      // 만족도조사 설문결과
            ,width:"950px"
            ,height:"510px"
        }).data("kendoWindow");
        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************

        /*****************************************************************************
         ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
         *******************************************************************************/
         // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
         $("#presentUsrGrid").on("dblclick", "tr.k-state-selected", function (e) {

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
            var win = $("#presentUsrWindow").data("kendoWindow");
            win.center();
            win.open();
        }

        // 팝업 종료 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
        function closePopup(){
            var win = $("#presentUsrWindow").data("kendoWindow");
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

        //만족도 조사일 From - To
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /*************************************************************
         *   버튼 셋팅
        *************************************************************/

        setKendoDate = function( dtValue){
            return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
        };

        ////버튼 - 엑셀Export
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var params = {};
                params = gridCommonParams();


                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){

                 // 만족도 조사결과 현황 엑셀Export 수량 데이터를 조회한다.
                    $.ajax({
                        url:"<c:url value='/crm/css/satisFactionPresentResult/selectSatisFactionPresentResultsExcelExportCnt.do' />",
                        data:JSON.stringify(params),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(resultCnt) {

                            <c:set value="10000" var="maxCnt" />;
                            var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                            if ( resultCnt > excelMaxExportCnt ) {
                                // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                                dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                                return;
                            };

                            var sysDateExcelNm = "${sysDateExcelNm}";

                            dms.ajax.excelExport({
                                "beanName":"satisFactionMobileResultService"
                                ,"templateFile":"SatisFactionPresentResult_Tpl.xlsx"
                                ,"fileName":"<spring:message code='crm.menu.satisFactionPresentResult' />_"+sysDateExcelNm+".xlsx"
                                ,"sCustNm":$("#sCustNm").val()
                                ,"sStsfIvstNm":$("#sStsfIvstNm").val()
                                ,"sStsfIvstMthCd":$("#sStsfIvstMthCd").data("kendoExtDropDownList").value()
                                ,"sStsfIvstExpdCd":$("#sStsfIvstExpdCd").data("kendoExtDropDownList").value()
                                ,"sStsfIvstTpCd":$("#sStsfIvstTpCd").data("kendoExtDropDownList").value()
                                ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                                ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                                ,"sStsfIvstYn":$("#sStsfIvstYn").data("kendoExtDropDownList").value()
                                ,"sSatisFactionPresentResult":"Y"
                            });

                        }
                    });

                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
            ,enable:false
        });

        ////버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $('#presentDetailGrid').data('kendoExtGrid').dataSource.data([]);
                    $("#cmplReasonCont").val("");
                    $("#stsfIvstScoreVal").data("kendoExtNumericTextBox").value("");
                    $('#presentUsrGrid').data('kendoExtGrid').dataSource.read(1);
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
            }
        });

        //btn - 상세
        $("#btnDetail").kendoButton({
            click:function(e){
                var grid = $("#presentUsrGrid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());
                if ( dms.string.isNotEmpty(selectedItem) ){

                    viewDetail(selectedItem);

                } else {

                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }
            }
            ,enable:false
        });

        ////버튼 - 조사결과 무효처리
        $("#btnStsfRstInvalidity").kendoButton({
            click:function(e){

                var grid = $('#presentUsrGrid').data('kendoExtGrid');
                var selectedItem = grid.select();//presentUsrGrid.dataItem(presentUsrGrid.select());
                var rows = selectedItem;
                var params = [];
                var noImplementCnt = 0;//만족도 조사를 시행하지 않은 인원 count
                $.each(rows,function(idx,row){
                    obj = {};
                    obj["dlrCd"] = grid.dataItem(row).dlrCd //딜러코드
                    obj["stsfIvstRsltSeq"] = grid.dataItem(row).stsfIvstRsltSeq //만족도조사결과 일련번호

                    if(dms.string.strNvl(grid.dataItem(row).stsfIvstDt) == ""){
                        noImplementCnt++;
                    }

                    params.push(obj);
                });

                if(params.length == 0){
                    //고객명을(를) 선택하세요.
                    dms.notification.info("<spring:message code='global.lbl.custNm' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                    return;
                }

                if(noImplementCnt > 0){
                    //아직 만족도 조사가 시행되지 않은 인원이 포함되어 있습니다.
                    dms.notification.info("<spring:message code='crm.info.stsfImplementNoUsers' />");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/crm/css/satisFactionPresentResult/multiStsfResultInvalidity.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify({"updateList":params})
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#btnSearch").click();
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                });

                $('#presentDetailGrid').data('kendoExtGrid').dataSource.data([]);
                $("#cmplReasonCont").val("");
                $("#stsfIvstScoreVal").data("kendoExtNumericTextBox").value("");
                $('#presentUsrGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        ////버튼 - 낮은점수 처리
        $("#btnLowScoreSave").kendoButton({
            click:function(e) {
                var grid = $("#presentUsrGrid").data("kendoExtGrid");
                var rows = grid.select();
                var params = [];
                var noImplementCnt = 0;//만족도 조사를 시행하지 않은 인원 count
                var afterLowScoreCnt = 0;// 낮은점수결과를 진행한 인원 count
                $.each(rows,function(idx, row) {
                    //gridData = ;

                    obj = {};
                    obj["dlrCd"] = grid.dataItem(row).dlrCd //딜러코드
                    obj["stsfIvstRsltSeq"] = grid.dataItem(row).stsfIvstRsltSeq //만족도조사결과 일련번호
                    obj["custNo"] = grid.dataItem(row).custNo//고객번호
                    obj["stsfIvstNm"] = grid.dataItem(row).stsfIvstNm//만족도 조사명
                    obj["stsfIvstExpdCd"] = grid.dataItem(row).stsfIvstExpdCd//만족도 조사명
                    obj["rcpeExtrSeq"] = grid.dataItem(row).rcpeExtrSeq//만족도 조사명
                    obj["custTargYn"] = 'Y'//고객대상여부
                    obj["delYn"] = 'N'//삭제여부
                    obj["useYn"] = 'Y'//사용여부
                    obj["vocYn"] = 'Y'//VOC 요청여부

                    if(dms.string.strNvl(grid.dataItem(row).stsfIvstDt) == ""){
                        noImplementCnt++;
                    }

                    if(grid.dataItem(row).vocYn == "Y"){
                        afterLowScoreCnt++;
                    }

                    params.push(obj);
                });

                if(params.length == 0){
                    //고객명을(를) 선택하세요.
                    dms.notification.info("<spring:message code='global.lbl.custNm' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                    return;
                }

                if(noImplementCnt > 0){
                    //아직 만족도 조사가 시행되지 않은 인원이 포함되어 있습니다.
                    dms.notification.info("<spring:message code='crm.info.stsfImplementNoUsers' />");
                    return;
                }

                if(afterLowScoreCnt > 0){
                    //이미 낮은점수 처리를 요청한 인원이 포함되어 있습니다.
                    dms.notification.info("<spring:message code='crm.info.lowScoreAfterUsers' />");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/crm/css/satisFactionPresentResult/updateSatisFactionPresentResults.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify({"insertList":params})
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#btnSearch").click();
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                });

            }
        });

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#presentUsrGrid").kendoExtGrid({
            gridId:"G-CRM-0104-091700"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/css/satisFactionPresentResult/selectSatisFactionPresentResults.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params = $.extend(params, gridCommonParams());

                            //console.log("만족도 조사 결과 현황:",params);
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
                                rnum:{type:"string", editable:false}
                                ,stsfIvstDt:{type:"date", validation:{required:true}} //만족도 조사 일시
                                ,stsfIvstDtFormat:{type:"date",   editable:false} //수정일자
                                ,stsfIvstScoreVal:{type:"number", validation:{required:true}} //만족도 조사점수
                                ,callCenRsltDt:{type:"date", validation:{required:false}} //콜센터결과일
                                ,callCenRsltDtFormat:{type:"date", validation:{required:false}} //콜센터결과일
                                ,vocRegDt:{type:"date", validation:{required:false}} //낮은점수 처리요청시간
                                ,vocRegDtFormat:{type:"date", validation:{required:false}} //낮은점수 처리요청시간
                                ,vocProcDt:{type:"date", validation:{required:false}} //낮은점수 조치일
                                ,vocProcDtFormat:{type:"date", validation:{required:false}} //낮은점수 조치일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.stsfIvstDtFormat = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                    elem.callCenRsltDtFormat = kendo.parseDate(elem.callCenRsltDt, "<dms:configValue code='dateFormat' />");
                                    elem.callCenRsltDtFormat = kendo.parseDate(elem.callCenRsltDt, "<dms:configValue code='dateFormat' />");
                                    elem.vocRegDtFormat = kendo.parseDate(elem.vocRegDt, "<dms:configValue code='dateFormat' />");
                                    elem.vocProcDtFormat = kendo.parseDate(elem.vocProcDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                         }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());

                if(dataItem != null){
                    $("#presentDetailGrid").data("kendoExtGrid").dataSource.read(1);
                    $("#btnDetail").data("kendoButton").enable(true);
                    $("#cmplReasonCont").val(dataItem.cmplReasonCont);
                    $("#stsfIvstScoreVal").data("kendoExtNumericTextBox").value(dataItem.stsfIvstScoreVal);

                    $("input:radio[name=stsfIvstYn]").prop("checked",false);

                    if ( dataItem.stsfIvstYn === "Y" ) {
                        $("input:radio[name=stsfIvstYn][value='Y']").prop("checked",true);
                        $("input:radio[name=stsfIvstYn][value='N']").prop("checked",false);
                    } else if ( dataItem.stsfIvstYn === "N" ) {
                        $("input:radio[name=stsfIvstYn][value='Y']").prop("checked",false);
                        $("input:radio[name=stsfIvstYn][value='N']").prop("checked",true);
                    }

                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,editable:false
            ,dataBound:function (e) {
                var dataItems = e.sender.dataSource.view();

                if ( dataItems.length > 0 ) {
                    $("#btnExcelExport").data("kendoButton").enable(true);
                } else {
                    $("#btnExcelExport").data("kendoButton").enable(false);
                };
            }
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
               ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//서비스고문/판매고문
               ,{field:"stsfIvstDtFormat", title:"<spring:message code='crm.lbl.stsfIvstDt' />", width:100   // 만족도 조사일
                   ,attributes:{"class":"ac"}
                   ,template:"#if (stsfIvstDt !== null ){# #= kendo.toString(data.stsfIvstDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"usrNm", title:"<spring:message code='global.lbl.stsfIvstEmpId'/>",attributes:{"class":"ac"},width:100}  // 만족도 조사인
               ,{field:"stsfIvstScoreVal", title:"<spring:message code='crm.lbl.stsfIvstScoreVal'/>",attributes:{"class":"ar"},width:100
                   ,format:"{0:n2}"
               }  // 만족도 조사점수
               ,{field:"stsfIvstYnNm", title:"<spring:message code='crm.lbl.stsfIvstYn'/>",attributes:{"class":"ac"},width:100} // 만족여부
               ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont'/>",attributes:{"class":"al"},width:100}   // 총결
               ,{field:"callRsltCdNm"  , title:"<spring:message code="crm.lbl.callRsltCd" />", width:100,sortable:false}    //콜결과
               ,{field:"callCenRsltDtFormat", title:"<spring:message code='crm.lbl.callCenRsltDt'/>",width:100,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,template:"#if(callCenRsltDtFormat !== '' && callCenRsltDtFormat !== null){# #= kendo.toString(data.callCenRsltDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }// 콜센터 결과일자
               ,{field:"vocRegDtFormat", title:"<spring:message code='crm.lbl.vocRegDt' />",width:110,attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(vocRegDtFormat !== '' && vocRegDtFormat !== null){# #= kendo.toString(data.vocRegDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }//낮은점수 처리요청시간
               ,{field:"vocProcDtFormat", title:"<spring:message code='crm.lbl.lowScoreActionDt' />",width:110,attributes:{"class":"ac"}
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(vocProcDtFormat !== '' && vocProcDtFormat !== null){# #= kendo.toString(data.vocProcDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
               }//낮은점수 조치일
            ]
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#presentDetailGrid").kendoExtGrid({
            gridId:"G-CRM-0722-175613"
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

                            var grid = $('#presentUsrGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());
                            params["sDlrCd"] = selectedItem.dlrCd;
                            params["sStsfIvstRsltSeq"] = selectedItem.stsfIvstRsltSeq;
                            params["sStsfIvstSeq"] = selectedItem.stsfIvstSeq;
                            params["sSubyTmplSeq"] = selectedItem.subyTmplSeq;

                            $("#cmplReasonCont").val(selectedItem.cmplReasonCont);

//                            console.log(params);
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
                                ,qestTpCd:{type:"string"}//질문 타입코드
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
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            ,editable:false
            ,filterable:false
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:false
            ,selectable:"row"
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no'/>" ,width:50,attributes:{"class":"ac"}}
               ,{field:"qestCont", title:"<spring:message code='crm.lbl.qestCont'/>", attributes:{"class":"al"}, width:300 }//질문내용
               ,{field:"qestWgtVal", title:"<spring:message code='crm.lbl.qestWgtVal'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }//가중치
               ,{field:"qestTpCdNm", title:"<spring:message code='crm.lbl.qestTpCdSummary'/>", attributes:{"class":"ac"}, width:100 , sortable:false}//질문 타입
               ,{field:"answCont", title:"<spring:message code='crm.lbl.answ'/>", attributes:{"class":"al"}, width:150 }//답변
               ,{field:"sbjvAnswCont", title:"<spring:message code='crm.lbl.sbjvAnswCont'/>", attributes:{"class":"al"}, width:150 }//주관식 답변내용
               ,{field:"answScoreVal", title:"<spring:message code='crm.lbl.answScoreVal'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:80 }//문항점수
            ]
        });


    }); //end ready
</script>
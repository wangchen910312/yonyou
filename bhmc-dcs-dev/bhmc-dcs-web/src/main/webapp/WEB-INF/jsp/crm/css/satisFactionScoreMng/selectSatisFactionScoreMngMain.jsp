<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <!-- 만족도 조사 낮은 점수 처리 관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.satisFactionScoreMng"/></h1><!-- 만족도 조사 낮은 점수 처리 관리 -->
                    <div class="btn_right">
                        <button class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /></button><!-- 조회 -->
                        <%-- <button class="btn_m btn_save"  id="btnSave"><spring:message code='global.btn.save'/></button><!-- 저장 --> --%>
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
                            <col style="width:11%;">
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/></th><!-- 만족도 조사명 -->
                                <td>
                                    <input type="text" id="sStsfIvstNm" name="sStsfIvstNm" maxlength="33" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstMthCd"/></th><!-- 만족도 조사유형 -->
                                <td>
                                    <input value="" id="sStsfIvstMthCd" name="sStsfIvstMthCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstTpCd"/></th><!-- 조사 타입 -->
                                <td>
                                    <input value="" id="sStsfIvstTpCd" name="sStsfIvstTpCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd"/></th><!-- 만족도 조사수단 -->
                                <td>
                                    <input value="" id="sStsfIvstExpdCd" name="sStsfIvstExpdCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.stsfIvstDt"/></th><!-- 만족도 조사시간 -->
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
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="satisUsrGrid"></div>
                </div>

                <%-- <div class="table_grid mt10">
                    <table class="grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">No</th><!-- No -->
                                <th scope="col" data-field="data2">客户名</th><!-- 고객명 -->
                                <th scope="col" data-field="data3">满意度调查名</th><!-- 만족도 조사명 -->
                                <th scope="col" data-field="data4">分类</th><!-- 유형 -->
                                <th scope="col" data-field="data5">执行类型</th><!-- 실행타입 -->
                                <th scope="col" data-field="data6">问卷日期</th><!-- 만족도 조사 일시 -->
                                <th scope="col" data-field="data7">通话状态</th><!-- 통화 상태 -->
                                <th scope="col" data-field="data8">分数</th><!-- 점수 -->
                                <th scope="col" data-field="data9">低分处理日期</th><!-- 낮은 점수 조치일 -->
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div> --%>
            </section>
            <!-- //만족도 조사 낮은 점수 처리 관리 -->


            <!-- stansWindowPopup start -->
            <section id="satisFactionScoreMngWindow" class="pop_wrap">

                <!-- 낮은 점수 처리 상세정보 -->
                <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code="crm.lbl.lowScorePorcDetail"/></h2><!-- 낮은 점수 처리 상세정보 -->
                        <div class="btn_right">
                            <button class="btn_m btn_save"  id="btnSave"><spring:message code='global.btn.save'/></button><!-- 저장 -->
                        </div>
                    </div>
                    <div class="table_form" id="satisFactionScoreMngForm">
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
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.vocProcId"/></span></th><!-- 실처리인-->
                                    <td>
                                        <input type="text" id="vocProcId" name="vocProcId" class="form_comboBox" data-json-obj='true' />
                                    </td>
                                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.vocProcDt"/></span></th><!-- 처리일 -->
                                    <td>
                                        <input id="vocProcDt" name="vocProcDt" class="form_datepicker" />
                                    </td>
                                    <th></th>
                                    <td></td>
                                    <th></th>
                                    <td></td>
                                 </tr>
                                 <tr>
                                    <th scope="row"><spring:message code="crm.lbl.vocProcCont"/></th><!-- 처리내용 -->
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
                        <li class="k-state-active"><spring:message code='global.lbl.dtlInfo'/></li> <!-- 상세정보 -->
                        <li><spring:message code='crm.title.surveyQeusDetail'/></li> <!-- 설문항목 상세 -->
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
                            <%-- <div class="header_area">
                                <h2 class="title_basic"><spring:message code='crm.lbl.lowScoreDetail'/></h2><!-- 낮은 점수 상세정보 -->
                            </div> --%>
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
                                        <col style="width:15%;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/></th><!-- 만족도 조사명 -->
                                            <td colspan="3">
                                                <input id="stsfIvstNm" name="stsfIvstNm" readonly class="form_input form_readonly">
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstMthCd"/></th><!-- 조사유형 -->
                                            <td class="readonly_area">
                                                <input id="stsfIvstMthCd" name="stsfIvstMthCd" readonly="readonly" class="form_comboBox form_readonly"/>
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstTpCd"/></th><!-- 조사 타입 -->
                                            <td class="readonly_area">
                                                <input id="stsfIvstTpCd" name="stsfIvstTpCd" readonly="readonly" class="form_comboBox form_readonly"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd"/></th><!-- 만족도 조사 수단 -->
                                            <td class="readonly_area">
                                                <input id="stsfIvstExpdCd" name="stsfIvstExpdCd" readonly="readonly" class="form_comboBox form_readonly"/>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.stsfIvstDt'/></th><!-- 만족도 조사시간 -->
                                            <td>
                                                <input id="stsfIvstDt" name="stsfIvstDt" readonly class="form_datepicker ac form_readonly">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.stsfIvstEmpId"/></th><!-- 만족도 조사인 -->
                                            <td>
                                                <input id="stsfIvstEmpId" name="stsfIvstEmpId" readonly  class="form_input form_readonly">
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.stsfIvstScoreVal"/></th><!-- 만족도 조사점수 -->
                                            <td>
                                                <input type="number" id="stsfIvstScoreVal" name="stsfIvstScoreVal" readonly class="form_input ac form_readonly">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.cmplReasonCont"/></th><!-- 불만족 원인 -->
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
                            <%-- <div class="header_area">
                                <h2 class="title_basic"><spring:message code="crm.title.satisfactionDetailResult"/></h2><!-- 만족도 조사 상세결과 -->
                            </div> --%>

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
    $("#tabstrip, .tab_area").kendoExtTabStrip({
        animation:false
    });

/*************************************************************
데이터 셋업
*************************************************************/

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


    $(document).ready(function() {

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

        var assignUserDS = [];
        var assignUserArr = [];
        <c:forEach var="obj" items="${assignUserList}">
            assignUserDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
            assignUserArr["${obj.usrId}"] = "${obj.usrNm}";
        </c:forEach>

        $(".form_comboBox").kendoExtDropDownList();

        // 유형
        $("#sStsfIvstMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstMthCdList
        });

        // 수단
        $("#sStsfIvstExpdCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstExpdCdList
        });

        // 타입
        $("#sStsfIvstTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstTpCdList
        });

        // 낮은점수 상세정보 - 유형
        $("#stsfIvstMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstMthCdList
        });

        // 낮은점수 상세정보 - 수단
        $("#stsfIvstExpdCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstExpdCdList
        });

        // 낮은점수 상세정보 - 타입
        $("#stsfIvstTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstTpCdList
        });

        //시간 template
        /* $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */

        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#stsfIvstDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#stsfIvstDt2").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#closeDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#evalAllocDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#pmoDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#procDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#mthAchvHm").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#saleDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 실 처리자
        $("#vocProcId").kendoExtDropDownList({
            dataSource:assignUserDS
            , dataTextField:"usrNm"
            , dataValueField:"usrId"
            , optionLabel:" "
            , index:0
        });

        /*************************************************************
         *   버튼 셋팅
        *************************************************************/
        ////버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                /* $('#presentDetailGrid').data('kendoExtGrid').dataSource.data([]);
                $("#cmplReasonCont").val(""); */
                $('#satisUsrGrid').data('kendoExtGrid').dataSource.read(1);
            }
        });
        ////버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e){
                //개발중 입니다.
                //dms.notification.info("<spring:message code='global.msg.eveloping'/>");

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

                // 내방 리스트 그리드의 선택된 CUST_NO
                var grid = $("#satisUsrGrid").data("kendoExtGrid");
                var selectedItem = grid.dataItem(grid.select());

                params["dlrCd"] = selectedItem.dlrCd;
                params["vocProcId"] = $("#vocProcId").data("kendoExtDropDownList").value();
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
                        //$("#btnSearch").click();
                        closePopup();
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



        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#satisUsrGrid").kendoExtGrid({
            gridId:"G-CRM-0726-202009"
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
                            params["sort"]                  = options.sort;

                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
                            /* params["sCmplReasonContYn"] = $("#sCmplReasonContYn").data("kendoExtDropDownList").value(); */
                            params["sStsfIvstScoreVal"] = $("#sStsfIvstScoreVal").val();
                            params["sStsfIvstNm"] = $("#sStsfIvstNm").val();

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
                                ,seq:{type:"string"} //만족도조사 일련번호
                                ,dlrCd:{type:"string"}
                                ,custNo:{type:"string", validation:{required:true}} //고객번호
                                ,custNm:{type:"string", validation:{required:true} } //고객명
                                ,stsfIvstNm:{type:"string",  validation:{required:true}} // 만족도 조사명
                                ,stsfIvstMthCd:{type:"string", validation:{required:true}} //만족조조사 유형코드
                                ,stsfIvstTpCd:{type:"string", validation:{required:true}} //만족도 조사 타입코드
                                ,stsfIvstExpdCd:{type:"string", validation:{required:true}} //만족도조사 수단코드
                                ,stsfIvstDt:{type:"date", validation:{required:true}} //만족도 조사 일시
                                ,stsfIvstDtFormat:{type:"date", validation:{required:true}} //만족도 조사 일시
                                ,startDt:{type:"date", validation:{required:true}} //만족도 조사 시작일
                                ,endDt:{type:"date", validation:{required:true}} //만족도 조사 종료일
                                ,callCenRsltCont:{type:"string", validation:{required:false}} //통화상태
                                ,stsfIvstScoreVal:{type:"number", validation:{required:true}} //점수
                                ,vocProcDt:{type:"date", validation:{required:true}} //낮은점수 조치일
                                ,vocProcDtFormat:{type:"date", validation:{required:true}} //낮은점수 조치일
                                ,vocProcId:{type:"string", validation:{required:true}} //낮은점수 조치인
                                ,vocProcCont:{type:"string", validation:{required:true}} //낮은점수 내용
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.stsfIvstDtFormat = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                    elem.vocProcDtFormat = kendo.parseDate(elem.vocProcDt, "<dms:configValue code='dateFormat' />");
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
            //,height:300
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,change:function(e){

                var selectedItem = this.dataItem(this.select());
                if (selectedItem != null) {
                    $("#stsfIvstNm").val(selectedItem.stsfIvstNm);
                    $("#stsfIvstMthCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstMthCd);//조사유형
                    $("#stsfIvstExpdCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstExpdCd);//조사수단
                    $("#stsfIvstTpCd").data("kendoExtDropDownList").value(selectedItem.stsfIvstTpCd);//조사타입
                    $("#stsfIvstDt").data("kendoExtMaskedDatePicker").value(selectedItem.stsfIvstDt);//만족도 조사시간
                    $("#stsfIvstEmpId").val(selectedItem.stsfIvstEmpId);//만족도 조사인
                    $("#stsfIvstScoreVal").val(selectedItem.stsfIvstScoreVal);//만족도 조사점수
                    $("#cmplReasonCont").val(selectedItem.cmplReasonCont);//불만족 원인
                    $("#vocProcDt").data("kendoExtMaskedDatePicker").value(selectedItem.vocProcDt);//낮은점수 처리일
                    $("#vocProcId").data("kendoExtDropDownList").value(selectedItem.vocProcId);//낮은점수 처리자
                    $("#vocProcCont").val(selectedItem.vocProcCont);//낮은점수 처리내용

                    $("#satisFactionGrid").data("kendoExtGrid").dataSource.read();
                }

            }
            , editable:false
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,columns:[
               {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}, filterable:false}//
               ,{field:"seq", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 만족도 일련번호
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"ac"}}// 고객명
               ,{field:"stsfIvstNm", title:"<spring:message code='crm.lbl.stsfIvstNm'/>", attributes:{"class":"ac"}}// 만족도 조사명
               ,{field:"stsfIvstMthCd", title:"<spring:message code='crm.lbl.stsfIvstMthCd'/>", attributes:{"class":"ac"}
                   ,template:"#=stsfIvstMthCdListMap[stsfIvstMthCd].cmmCdNm#"
                   ,editor:function(container, options) {
                       $('<input required name="stsfIvstMthCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stsfIvstMthCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stsfIvstMthCd"></span>').appendTo(container);
                       //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                   }
               }// 조사유형
               ,{field:"stsfIvstExpdCd", title:"<spring:message code='crm.lbl.stsfIvstExpdCd'/>", attributes:{"class":"ac"}
                   ,hidden:true
                   ,template:"#=stsfIvstExpdCdListMap[stsfIvstExpdCd].cmmCdNm#"
                   ,editor:function(container, options) {
                       $('<input required name="stsfIvstExpdCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stsfIvstExpdCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stsfIvstExpdCd"></span>').appendTo(container);
                       //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                   }
               }// 조사수단
               ,{field:"stsfIvstTpCd", title:"<spring:message code='crm.lbl.stsfIvstTpCd'/>", attributes:{"class":"ac"}
                   ,template:"#=stsfIvstTpCdListMap[stsfIvstTpCd].cmmCdNm#"
                   ,editor:function(container, options) {
                       $('<input required name="stsfIvstTpCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stsfIvstTpCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stsfIvstTpCd"></span>').appendTo(container);
                       //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                   }
               }// 조사타입
               /* ,{field:"stsfIvstDt", title:"<spring:message code='global.lbl.stsfIvstDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } */// 시작일
               ,{field:"stsfIvstDtFormat", title:"<spring:message code='global.lbl.stsfIvstDt' />", width:150
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(stsfIvstDtFormat !== '' && stsfIvstDtFormat !== null){# #= kendo.toString(data.stsfIvstDt, '<dms:configValue code='dateTimeFormat' />') # #}else{# - #}#"
               }
               ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt'/>",attributes:{"class":"ac"}
                   ,hidden:true
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }// 시작일
               ,{field:"endDt", title:"<spring:message code='crm.lbl.endDt'/>",attributes:{"class":"ac"}
                   ,hidden:true
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }// 종료일
               ,{field:"callCenRsltCont", title:"<spring:message code='crm.lbl.callStatus'/>",attributes:{"class":"ac"}}// 통화상태
               ,{field:"stsfIvstScoreVal", title:"<spring:message code='crm.lbl.stsfIvstScoreVal'/>",attributes:{"class":"ac"}}// 점수
               /* ,{field:"vocProcDt", title:"<spring:message code='crm.lbl.vocProcDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } */// 낮은점수 조치일
               ,{field:"vocProcDtFormat", title:"<spring:message code='crm.lbl.vocProcDt' />", width:150
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if(vocProcDtFormat !== '' && vocProcDtFormat !== null){# #= kendo.toString(data.vocProcDt, '<dms:configValue code='dateTimeFormat' />') # #}else{# - #}#"
               }
               ,{field:"vocProcId", title:"<spring:message code='crm.lbl.vocProcId'/>",attributes:{"class":"ac"},hidden:true}// 낮은점수 조치일
               ,{field:"vocPorcCont", title:"<spring:message code='crm.lbl.vocProcCont'/>",attributes:{"class":"ac"},hidden:true}// 낮은점수 조치일
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
                            //url:"<c:url value='/crm/css/satisFactionPresent/selectSurveyResults.do' />"
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
                                params["sCustNo"] = selectedItem.custNo;
                                params["sStsfIvstSeq"] = selectedItem.seq;

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
                ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:fa
                ,height:200
                ,editable:false
                ,filterable:false
                /* ,editable:{
                     mode:"incell"
                    ,confirmation:false
                } */
                ,autoBind:false
                ,navigatable:true
                ,sortable:true
                ,pageable:false
                ,columns:[
                   {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}, filterable:false}// 캠페인코드
                   ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
                   ,{field:"seq", title:"<spring:message code='global.lbl.seq'/>", attributes:{"class":"ac"}, hidden:true}//일련번호
                   ,{field:"stsfIvstRsltSeq", title:"<spring:message code='crm.lbl.stsfIvstRsltSeq'/>", attributes:{"class":"ac"}, hidden:true}//만족도조사결과일련번호
                   ,{field:"stsfIvstSeq", title:"<spring:message code='crm.lbl.stsfIvstSeq'/>", attributes:{"class":"ac"}, hidden:true}//만족도 조사 일련번호
                   ,{field:"subyTmplSeq", title:"<spring:message code='crm.lbl.subyTmplSeq'/>", attributes:{"class":"ac"}, hidden:true}//설문템플릿 일련번호
                   //,{field:"qestSeq", title:"<spring:message code='crm.lbl.qestSeq'/>", attributes:{"class":"ac"}, hidden:true}//질문일련번호
                   ,{field:"qestSeq", title:"", attributes:{"class":"ac"}, hidden:true}//답변일련번호
                   ,{field:"subyTmplSeq", title:"<spring:message code='crm.lbl.sbjvAnswCont'/>", attributes:{"class":"ac"}, hidden:true}//설문템플릿 일련번호
                   ,{field:"subyTmplQestSeq", title:"<spring:message code='crm.lbl.subyTmplQestSeq'/>", attributes:{"class":"ac"}, hidden:true}//설문문항 일련번호
                   ,{field:"qestTpCd", title:"<spring:message code='crm.lbl.qestTpCd'/>", attributes:{"class":"ac"}, hidden:true}//질문유형
                   ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont'/>", attributes:{"class":"ac"}, hidden:true}//불만족원인
                   ,{field:"qestCont", title:"<spring:message code='crm.lbl.qestCont'/>", attributes:{"class":"ac"}}//질문내용
                   ,{field:"qestWgtVal", title:"<spring:message code='crm.lbl.qestWgtVal'/>", attributes:{"class":"ac"}}//가중치
                   //,{field:"answSeq", title:"<spring:message code='crm.lbl.answ'/>", attributes:{"class":"ac"}}//답변
                   ,{field:"answCont", title:"<spring:message code='crm.lbl.answ'/>", attributes:{"class":"ac"}}//답변
                   ,{field:"sbjvAnswCont", title:"<spring:message code='crm.lbl.sbjvAnswCont'/>", attributes:{"class":"ac"}}//주관식 답변내용
                   ,{field:"answScoreVal", title:"<spring:message code='crm.lbl.answScoreVal'/>", attributes:{"class":"ac"}}//문항점수
                ]
            });


    }); //end ready

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
          if(id === 'sStartDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sEndDt'){//등록종료일
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
     }


    $(document).ready(function(){
     // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
        $("#satisFactionScoreMngWindow").kendoWindow({
            animation:false
            ,draggable:false
            ,modal:true
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.menu.satisFactionScoreMng' />"      // 만족도조사 낮은점수 처리관리
            ,width:"950px"
            ,height:"550px"
        }).data("kendoWindow");
        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
    });
</script>
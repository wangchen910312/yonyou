<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.satisFactionPresentResult'/></h1><!-- 만족도 조사결과 현황 -->
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_info" id="btnStsfRstInvalidity"><spring:message code="crm.btn.stsfRstInvalidity"/></button><!-- 조사결과 무효처리 -->
                        <button type="button" class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                        <button type="button" class="btn_m btn_save" id="btnLowScoreSave"><spring:message code="crm.btn.lowScoreAction" /></button> <!-- 낮은 점수 처리 -->
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </div>
                </div>

                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:22%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/></th><!-- 만족도 조사명 -->
                                <td>
                                    <input type="text" id="sStsfIvstNm" name="sStsfIvstNm" maxlength="100" value="" class="form_input">
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
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstScoreVal"/></th><!-- 만족도 조사점수 -->
                                <td>
                                    <input value="" id="sStsfIvstScoreVal" name="sStsfIvstScoreVal" data-type="number"  class="form_numeric" maxlength="3">
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
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.cmplReasonContYn"/></th><!-- 불만족 원인 여부 -->
                                <td>
                                    <input id="sCmplReasonContYn" name="sCmplReasonContYn" class="form_comboBox">
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div class="header_area">
                    <h2 class="title_basic"></h2>
                    <div class="btn_right">
                        <%-- <button type="button" class="btn_s btn_info" id="btnStsfRstInvalidity"><spring:message code="crm.btn.stsfRstInvalidity"/></button><!-- 조사결과 무효처리 --> --%>
                    </div>
                </div>
                <div class="table_grid mt10">
                    <div id="presentUsrGrid"></div>
                </div>
            </section>

            <section id="presentUsrWindow" class="pop_wrap">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.surveyQeusDetail'/></h2><!-- 설문항목상세 -->
                    <div class="btn_right">
                        <spring:message code="crm.lbl.stsfIvstScoreVal"/>:<input type="text" id="stsfIvstScoreVal" name="stsfIvstScoreVal" class="form_input ar form_readonly" readonly style="width:50%;" >
                    </div>
                </div>
                <div class="table_grid">
                    <div id="presentDetailGrid"></div>
                </div>



                <div class="header_area">
                    <h2 class="title_basic"> <spring:message code='crm.lbl.cmplReasonCont'/> </h2><!-- 불만족 원인 -->
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
                                    <textarea rows="4" cols="4" class="form_textarea" id="cmplReasonCont" name="cmplReasonCont" readonly ></textarea>
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

    //조회조건 - 불만족 원인여부
    $("#sCmplReasonContYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });



    $(document).ready(function() {

        //만족도 조사점수
        $("#sStsfIvstScoreVal").kendoExtNumericTextBox({
            format:"n0"
           ,decimals:0                // 소숫점
           ,min:0
           ,spinners:false             // 증,감 화살표
        });


        // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
        $("#presentUsrWindow").kendoWindow({
            animation:false
            ,draggable:false
            ,modal:true
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.title.stsfPresentResult' />"      // 만족도조사 설문결과
            ,width:"950px"
            ,height:"500px"
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
/*
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
 */
        //시간 template
        $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });


        /*************************************************************
         *   버튼 셋팅
        *************************************************************/
        ////버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                $('#presentDetailGrid').data('kendoExtGrid').dataSource.data([]);
                $("#cmplReasonCont").val("");
                $("#stsfIvstScoreVal").val("");
                $('#presentUsrGrid').data('kendoExtGrid').dataSource.read(1);
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
                $.each(rows,function(idx,row){
                    obj = {};
                    obj["dlrCd"] = grid.dataItem(row).dlrCd //딜러코드
                    obj["stsfIvstRsltSeq"] = grid.dataItem(row).stsfIvstRsltSeq //만족도조사결과 일련번호

                    params.push(obj);
                });

                if(params.length == 0){
                    //고객명을(를) 선택하세요.
                    dms.notification.info("<spring:message code='global.lbl.custNm' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
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
                });

                $('#presentDetailGrid').data('kendoExtGrid').dataSource.data([]);
                $("#cmplReasonCont").val("");
                $("#stsfIvstScoreVal").val("");
                $('#presentUsrGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        ////버튼 - 낮은점수 처리
        $("#btnLowScoreSave").kendoButton({
            click:function(e) {
                var grid = $("#presentUsrGrid").data("kendoExtGrid");
                var rows = grid.select();
                var params = [];

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
                    /*
                    obj["seq"] = gridData.dlrCd //만족도 조사 일련번호
                    obj["custNo"] = gridData.custNo//고객번호
                    obj["custNm"] = gridData.custNm//고객번호
                    obj["stsfIvstDt"] = gridData.stsfIvstDt//만족도 조사일
                    obj["stsfIvstEmpId"] = gridData.stsfIvstEmpId //만족도 조사인
                    obj["stsfIvstScoreVal"] = gridData.stsfIvstScoreVal //점수
                    */

//                    grid.removeRow(row);
                    params.push(obj);
                });

                if(params.length == 0){
                    //고객명을(를) 선택하세요.
                    dms.notification.info("<spring:message code='global.lbl.custNm' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
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
                });

            }
        });

        /* $("#presentUsrGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#presentDetailGrid").data("kendoExtGrid").dataSource.read(1);
        }); */



        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#presentUsrGrid").kendoExtGrid({
            gridId:"G-CRM-0722-173526"
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

                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
                            params["sCmplReasonContYn"] = $("#sCmplReasonContYn").data("kendoExtDropDownList").value();
                            params["sStsfIvstScoreVal"] = $("#sStsfIvstScoreVal").val();
                            params["sStsfIvstNm"] = $("#sStsfIvstNm").val();
/*                             params["sStsfIvstMthCd"]       = $("#sStsfIvstExpdCd").val();
                            params["sStsfIvstExpdCd"]       = $("#sStsfIvstExpdCd").val();
                            params["sStsfIvstTpCd"]   = $("#sStsfIvstTpCd").val(); */

//                            console.log(params);
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
                                ,seq:{type:"string"} //만족도조사 일련번호
                                ,dlrCd:{type:"string"}
                                ,custNo:{type:"string", validation:{required:true}} //고객번호
                                ,stsfIvstNm:{type:"string",  validation:{required:true}} // 만족도 조사명
                                ,stsfIvstMthCd:{type:"string", validation:{required:true}} //만족조조사 유형코드
                                ,stsfIvstExpdCd:{type:"string", validation:{required:true}} //만족도조사 수단코드
                                ,stsfIvstTpCd:{type:"string", validation:{required:true}} //만족도 조사 타입코드
                                ,custNm:{type:"string", validation:{required:true} } //고객명
                                ,stsfIvstDt:{type:"date", validation:{required:true}} //만족도 조사 일시
                                ,usrNm:{type:"string", validation:{required:true} } //조사담당ㅈㅏ
                                ,hpNo:{type:"string", validation:{required:true} } //전화번호
                                ,startDt:{type:"date", validation:{required:true}} //만족도 조사 시작일
                                ,endDt:{type:"date", validation:{required:true}} //만족도 조사 종료일
                                ,callCenRsltCont:{type:"string", validation:{required:true}} //통화상태
                                ,stsfIvstScoreVal:{type:"number", validation:{required:true}} //만족도 조사점수
                                ,cmplReasonCont:{type:"string", validation:{required:false}} //불만족 원인
                                //,col2:{type:"date", validation:{required:true}} //낮은점수 조치일
                            }
                        }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());

                if(dataItem != null){
                    $("#presentDetailGrid").data("kendoExtGrid").dataSource.read(1);
                    $("#btnDetail").data("kendoButton").enable(true);
                    $("#cmplReasonCont").val(dataItem.cmplReasonCont);
                    $("#stsfIvstScoreVal").val(dataItem.stsfIvstScoreVal);
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:300
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,editable:false
            ,autoBind:false
            ,columns:[
               {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}//
               ,{field:"seq", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 만족도 일련번호
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
               ,{field:"stsfIvstNm", title:"<spring:message code='crm.lbl.stsfIvstNm'/>", attributes:{"class":"al"}}// 만족도 조사명
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
               }// 수단코드
               ,{field:"stsfIvstExpdCd", title:"<spring:message code='crm.lbl.stsfIvstExpdCd'/>", attributes:{"class":"ac"}
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
               }// 타입코드
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
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"ac"}}// 고객명
               ,{field:"stsfIvstDt", title:"<spring:message code='global.lbl.stsfIvstDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }// 만족도조사시간
               ,{field:"usrNm", title:"<spring:message code='global.lbl.stsfIvstEmpId'/>",attributes:{"class":"ac"}}// 만족도 조사인
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>",attributes:{"class":"ac"}}// 전화번호
               ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }// 시작일
               ,{field:"endDt", title:"<spring:message code='crm.lbl.endDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }// 종료일
               ,{field:"callCenRsltCont", title:"<spring:message code='crm.lbl.callStatus'/>",attributes:{"class":"ac"}}// 통화상태
               ,{field:"stsfIvstScoreVal", title:"<spring:message code='crm.lbl.stsfIvstScoreVal'/>",attributes:{"class":"ac"}}// 점수
               ,{field:"cmplReasonCont", title:"<spring:message code='global.lbl.stsfIvstEmpId'/>",attributes:{"class":"ar"} }// 불만족 원인
               //,{field:"col2", title:"<spring:message code='crm.lbl.lowScoreReqDt'/>",attributes:{"class":"ac"}}// 낮은점수 처리 요청일
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
                            params["sCustNo"] = selectedItem.custNo;
                            params["sStsfIvstSeq"] = selectedItem.stsfIvstSeq;

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
            ,height:280
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
               {field:"rnum", title:"<spring:message code='global.lbl.no'/>" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"seq", title:"<spring:message code='global.lbl.seq'/>", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"stsfIvstRsltSeq", title:"<spring:message code='crm.lbl.stsfIvstRsltSeq'/>", attributes:{"class":"ac"}, hidden:true}//만족도조사결과일련번호
               ,{field:"stsfIvstSeq", title:"<spring:message code='crm.lbl.stsfIvstSeq'/>", attributes:{"class":"ac"}, hidden:true}//만족도 조사 일련번호
               ,{field:"subyTmplSeq", title:"<spring:message code='crm.lbl.subyTmplSeq'/>", attributes:{"class":"ac"}, hidden:true}//설문템플릿 일련번호
               //,{field:"qestSeq", title:"<spring:message code='crm.lbl.qestSeq'/>", attributes:{"class":"ac"}, hidden:true}//질문일련번호
               ,{field:"qestSeq", title:"", attributes:{"class":"ac"}, hidden:true}//답변일련번호
               ,{field:"subyTmplSeq", title:"<spring:message code='crm.lbl.sbjvAnswCont'/>", attributes:{"class":"ac"}, hidden:true}//설문템플릿 일련번호
               ,{field:"subyTmplQestSeq", title:"<spring:message code='crm.lbl.subyTmplQestSeq'/>", attributes:{"class":"ac"}, hidden:true}//설문문항 일련번호
               ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont'/>", attributes:{"class":"ac"}, hidden:true}//불만족원인
               ,{field:"qestCont", title:"<spring:message code='crm.lbl.qestCont'/>", attributes:{"class":"ac"}}//질문
               ,{field:"qestWgtVal", title:"<spring:message code='crm.lbl.qestWgtVal'/>", attributes:{"class":"ac"}}//가중치
               ,{field:"qestTpCd", title:"<spring:message code='crm.lbl.qestTpCdSummary'/>", attributes:{"class":"ac"}}//질문유형
               //,{field:"answSeq", title:"<spring:message code='crm.lbl.answ'/>", attributes:{"class":"ac"}}//답변
               ,{field:"answCont", title:"<spring:message code='crm.lbl.answ'/>", attributes:{"class":"ac"}}//답변
               ,{field:"sbjvAnswCont", title:"<spring:message code='crm.lbl.sbjvAnswCont'/>", attributes:{"class":"ac"}}//주관식 답변내용
               ,{field:"answScoreVal", title:"<spring:message code='crm.lbl.answScoreValSummary'/>", attributes:{"class":"ac"}}//점수
            ]
        });


    }); //end ready
</script>
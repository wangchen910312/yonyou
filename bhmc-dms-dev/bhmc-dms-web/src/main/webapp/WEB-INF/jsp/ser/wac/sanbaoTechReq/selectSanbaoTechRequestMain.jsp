<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 신청현황 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.sanboTecReq" /></h1> <!-- 삼보기술제출 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12119" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12118" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_btnExcel" id="btnExcelExport" ><spring:message code="global.btn.excelDownload" /></button> <!-- 엑셀다운 -->
                    </dms:access>

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
                            <th scope="row"><spring:message code="ser.lbl.carRegDt" /></th> <!-- 등록일자 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromDt" name="sFromDt" class="form_datepicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToDt" name="sToDt" class="form_datepicker ac" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                            <td>
                                <input type="text" id="sVinNo" maxlength="17" name="sVinNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.statNm" /></th> <!-- 상태 -->
                            <td>
                                <input type="text" id="sStatCd" name="sStatCd" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="grid" class="resizable_grid"></div>
            </div>
        </section>
        <!-- //신청현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12117" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_init btn_s_min5" id="btnInit"><spring:message code="global.btn.init" /></button> <!-- 초기화 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12116" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_save btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12115" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_delete btn_s_min5" id="btnDelete" disabled><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12114" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_request btn_s_min5" id="btnReq" disabled><spring:message code="global.btn.req" /></button> <!-- 신청 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12113" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button> <!-- 취소 -->
                    </dms:access>
                </div>
            </div>
        </section>

        <div class="clfix">
            <form id="sanbaoTecReqForm">
            <!-- 차종정보 -->
                <section class="left_areaStyle">
                    <div class="header_area pt0">
                        <h2 class="title_basic"><spring:message code="ser.lbl.carLineInfo" /></h2> <!-- 차량정보 -->
                    </div>
                    <div class="table_form form_width_100per">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:20%;">
                                <col style="width:30%;">
                                <col style="width:20%;">
                                <col style="width:30%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                                    <td class="bor_none">
                                        <div class="form_search">
                                            <input type="text" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" />
                                            <a href="javascript:custPopupWindow();"></a>
                                        </div>
                                    </td>
                                    <th scope="row" class="bor_none"></th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.hqApproveNm" /></th><!-- 판정인 -->
                                    <td>
                                        <input type="text" id="judgNm" name="judgNm" readonly class="form_input form_readonly" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.judgDt" /></th> <%-- 판정일자 --%>
                                    <td class="readonly_area">
                                        <input type="text" id="judgDt" name="judgDt" readonly class="form_datetimepicker ac" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.runDist" /></th> <!-- 주행거리 -->
                                    <td>
                                        <input type="text" id="runDistVal" name="runDistVal" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.telNo" /></th> <!-- 전화번호 -->
                                    <td>
                                        <input type="text" id="telNo" name="telNo" readonly class="form_input form_readonly" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.wartDt" /></th> <!-- 보증시작일 -->
                                    <td class="readonly_area">
                                        <input type="text" id="wartStartDt" name="wartStartDt" readonly class="form_datetimepicker ac" data-json-obj="true" />
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.creDt" /></th><!-- 생산일자 -->
                                    <td class="readonly_area">
                                        <input type="text" id="creDt" name="creDt" readonly class="form_datetimepicker ac" data-json-obj="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label><input type="checkbox" name="pblmErrChk" id="pblmErrChk" class="form_check"><spring:message code="ser.lbl.diffCd" /> </label></th> <!-- 난제고장 -->
                                    <td>
                                        <input type="text" id="pblmErrCd" name="pblmErrCd" class="form_comboBox" data-json-obj="true"/>
                                    </td>
                                    <th scope="row"><label><input type="checkbox" name="emgcAlrtChk" id="emgcAlrtChk" class="form_check"><spring:message code="ser.lbl.samBoCd" /> </label></th> <!-- 삼보긴급 -->
                                    <td>
                                        <input type="text" id="emgcAlrtCd" name="emgcAlrtCd" class="form_comboBox" data-json-obj="true"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 파일업로드관련 include page -->
                    <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfo.jsp"></jsp:include>
                    <!-- 파일업로드관련 include page -->
                </section>
                <!-- //차종정보 -->

                <!-- 의견 -->
                <section class="right_areaStyle">
                    <div class="header_area pt0">
                        <h2 class="title_basic"><spring:message code="ser.title.cont" /></h2> <!-- 의견사항 -->
                    </div>
                    <div class="table_form form_width_100per">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:22%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.emgcReasonCont" /></span></th> <!-- 긴급정황설명 -->
                                    <td>
                                        <textarea rows="4" cols="" id="emgcReasonCont" maxLength="600" name="emgcReasonCont" class="form_textarea" data-json-obj="true" style="height:70px"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dlrProcOpnCnt" /></span></th> <!-- 딜러처리 의견 및 방안 -->
                                    <td>
                                        <textarea rows="4" cols="" id="dlrProcOpnCont" maxLength="600" name="dlrProcOpnCont" class="form_textarea" data-json-obj="true" style="height:70px"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.bhmcProcCont" /></th> <!-- BMMC 처리의견 -->
                                    <td>
                                        <textarea rows="4" cols="" readonly id="bmpProcCont" maxLength="600" name="bmpProcCont" class="form_textarea form_readonly" style="height:80px"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_form mt5">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:100%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="label_check ml15"><input type="radio" disabled name="opnTp" id="opnTp_R" value="R" class="form_check">
                                            <span id="opnTpTx_R" name="opnTpTx"><spring:message code="ser.lbl.errCont" /></span>
                                        </label> <!-- 오류설명 -->
                                        <label class="label_check"><input type="radio" disabled name="opnTp" id="opnTp_S" value="S" class="form_check">
                                            <span id="opnTpTx_S" name="opnTpTx"><spring:message code="ser.lbl.keepRepair" /></span>
                                        </label> <!-- 유지보수 -->
                                        <label class="label_check"><input type="radio" disabled name="opnTp" id="opnTp_A" value="A" class="form_check">
                                            <span id="opnTpTx_A" name="opnTpTx"><spring:message code="ser.lbl.proSolved" /></span>
                                        </label> <!-- 문제해결 -->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="header_area">
                        <div class="btn_right">
                            <dms:access viewId="VIEW-D-12112" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_m" id="btnQir" disabled><spring:message code="ser.btn.qir" /></button><!--QIR -->
                            </dms:access>
                            <dms:access viewId="VIEW-D-12111" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_m" id="btnRoHist" disabled><spring:message code="ser.btn.btnRoHist" /></button><!--R/O 이력 팝업 -->
                            </dms:access>
                        </div>
                    </div>
                </section>
                <!-- //의견 -->
                <input type="hidden" id="approveNo" name="approveNo" data-json-obj="true" />
                <input type="hidden" id="judgId" name="judgId" data-json-obj="true" />
                <input type="hidden" id="docNo" name="docNo" data-json-obj="true" />
                <input type="hidden" id="statCd" name="statCd" data-json-obj="true" />
                <input type="hidden" id="enginNo" name="enginNo" data-json-obj="true" />
                <input type="hidden" id="carOwnerId" name="carOwnerId" data-json-obj="true" />
                <input type="hidden" id="carOwnerNm" name="carOwnerNm" data-json-obj="true" />
                <input type="hidden" id="dlrCd" name="dlrCd" />
            </form>
        </div>
    </div>
</div>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- script -->
<script type="text/javascript">
var isTablet="${isTablet}"+"";
var _width=920;//web
if(isTablet == "true"){
    _width=950;//tablet
}


/** 상태 **/
var statList = [];
<c:forEach var="obj" items="${stateDs}">
    statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var statMap = dms.data.arrayToMap(statList, function(obj){return obj.cmmCd;});

/** 난제고장 **/
var pblmErrList = [];
<c:forEach var="obj" items="${pblmErrDs}">
    pblmErrList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

/** 긴급경계 **/
var emgcAlrtList = [];
<c:forEach var="obj" items="${emgcAlrtDs}">
     emgcAlrtList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

/** 고객 팝업 **/
var vehOfCustInfoSearchPopup;
/** 정비이력 **/
var repairOrderSearchPopup;

//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

$(document).ready(function() {

    /** 고객 팝업 **/
    custPopupWindow = function(){

        vehOfCustInfoSearchPopup = dms.window.popup({
            windowId:"vehOfCustInfoSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "sanboCust":"Y"
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            //필드 초기화
                            initAll();
                            //고객정보 , 차량정보 세팅

                            custInfoSet(data[0]);
                            $("#statCd").val("O");
                            /** 버튼 세팅 **/
                            setButtonEnable("");
                        }
                    }
                }
            }
        });
    };

    /** 정비이력 조회 팝업 **/
    selectRepairOrderSearchPopupWindow = function (e){

         repairOrderSearchPopup = dms.window.popup({
             windowId:"repairOrderSearchPopup"
             , width:_width//todo khskhs 사이즈변경 완료
             , height:550
             , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
             , content:{
                 url:"<c:url value='/ser/cmm/popup/selectRepairOrderSearchPopup.do'/>"
                 , data:{
                     "autoBind":false
                     , "listType":"01"
                     , "callbackFunc":function(data){

                     }
                 }
             }
         });
     };



    /********************** 초기 데이터  설정 ***************************/
    /**조회조건 시작일자 **/
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**조회조건 종료일자**/
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    /** 상태코드  콤보박스 **/
    $("#sStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:statList
        ,optionLabel:" "  // 선택
        ,index:0
    });

    /** 난제고장  콤보박스 **/
    $("#pblmErrCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pblmErrList
        ,optionLabel:" "  // 선택
        ,enable:false
        ,index:0
    });

    /** 긴급경계  콤보박스 **/
    $("#emgcAlrtCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:emgcAlrtList
        ,optionLabel:" "  // 선택
        ,enable:false
        ,index:0
    });

    /**판정일자**/
    $("#judgDt").kendoDatePicker({

       format:"{0:<dms:configValue code='dateFormat' />}"
    });

    /**보증시작일**/
    $("#wartStartDt").kendoDatePicker({

       format:"{0:<dms:configValue code='dateFormat' />}"
    });

    /**생산일자**/
    $("#creDt").kendoDatePicker({

       format:"{0:<dms:configValue code='dateFormat' />}"
    });

   /**주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표

    });

   /** checkBox 클릭시 ComboBox 활성화**/
   $("#pblmErrChk , #emgcAlrtChk").click(function(e){
       $("#pblmErrCd").data("kendoExtDropDownList").enable($("#pblmErrChk").prop("checked"));
       $("#emgcAlrtCd").data("kendoExtDropDownList").enable($("#emgcAlrtChk").prop("checked"));
   });

   setStatCd = function(value){

       var resultVal = "";
       if( dms.string.strNvl(value) != ""){
           if(statMap[value] != undefined)
           resultVal =  statMap[value].cmmCdNm;
       }
       return resultVal;
   };

   /********************** 버튼 설정 ***************************/

   /** 조회 **/
   $("#btnSearch").kendoButton({

       click:function(e){
           getGridSearch();
       }
   });



   /** 초기화 **/
   $("#btnInit").kendoButton({

       click:function(e){

           initAll();

       }
   });

   /** 저장 **/
   $("#btnSave").kendoButton({

       click:function(e){

           requestSaveData("O");
       }

   });

   //엑셀버튼
   $("#btnExcelExport").kendoButton({

       click:function(e){
           dms.ajax.excelExport({
               "beanName"         :"sanbaoTechRequestService"
               ,"templateFile"    :"SanbaoTecRequestList_Tpl.xlsx"
               ,"fileName"        :"<spring:message code='ser.title.sanboTecReq' />.xlsx"
               ,"sFromDt"         :$("#sFromDt").val()
               ,"sToDt"           :$("#sToDt").val()
               ,"sVinNo"          :$("#sVinNo").val()
               ,"sStatCd"         :$("#sStatCd").val()
           });
       }
   });


   /** 삭제 **/
   $("#btnDelete").kendoButton({

       click:function(e){


           $("#messageId").html("<spring:message code='ser.lbl.del' var='global_lbl_del' />"+
                                "<spring:message code='global.info.cnfrmMsg' arguments='${global_lbl_del}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
            if($(this).hasClass("yes")){
                     conformKendoWindow.close();
                     deleteData();
                }else{
                    conformKendoWindow.close();
                }
            }).end();

       }
   });
   /** 요청 **/
   $("#btnReq").kendoButton({

       click:function(e){

           $("#messageId").html("<spring:message code='ser.lbl.quest' var='ser_lbl_quest' />"+
                              "<spring:message code='global.info.cnfrmMsg' arguments='${ser_lbl_quest}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                requestSaveData("Q");
                }else{
                    conformKendoWindow.close();
                }
            }).end();
       }
   });

   /** 요청취소 **/
   $("#btnReqCancel").kendoButton({

       click:function(e){

           $("#messageId").html("<spring:message code='ser.lbl.reqCancel' var='ser_lbl_reqCancel' />"+
                                "<spring:message code='global.info.cnfrmMsg' arguments='${ser_lbl_reqCancel}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                requestSaveData("QC");
                }else{
                    conformKendoWindow.close();
                }
            }).end();



       }
   });
   /** 정비이력 **/
   $("#btnRoHist").kendoButton({

       click:function(e){

           selectRepairOrderSearchPopupWindow();

       }
   });
   /** Qir **/
   $("#btnQir").kendoButton({

       click:function(e){

           var qirUrl="";
           if (dms.string.strNvl("${dlrCd}") == "A07AA"){
               qirUrl = "http://osqc.hyundai-motor.com/qims/LoginH.jsp";
           } else {
               qirUrl = "http://osqc.hyundai-motor.com/qims/servlet/hkmc.qims.common.LoginChkServlet?ccc=" + "${userId}" + "&gubun=A";
           }

           window.open(qirUrl, "_blank");


       }
   });


   /** Field 초기화 **/
   initAll = function (e){

       $("#sanbaoTecReqForm").get(0).reset();
       $("#docNo").val("");
       $("#fileKeyNm").val("");
       $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
       setButtonEnable("");

   };

   /********************** 버튼 설정 ***************************/

   getGridSearch = function(e){
       $("#grid").data("kendoExtGrid").dataSource.data([]);
       $("#grid").data("kendoExtGrid").dataSource.read();
   };

    /** 버튼 세팅 **/
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "O":/** 작성중 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(true);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(true);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(true);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                $("#btnQir").data("kendoButton").enable(true);     /** QIR **/

                setFileButton("Y");
                      break;
            case "A":/** 완료 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(false);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                $("#btnQir").data("kendoButton").enable(true);        /** QIR **/

                setFileButton("N");
                      break;
            case "Q":/** 제출 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(false);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(true);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                $("#btnQir").data("kendoButton").enable(true);     /** QIR **/

                setFileButton("N");
                      break;
            case "W":/** 접수 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(false);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(true);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                $("#btnQir").data("kendoButton").enable(true);     /** QIR **/

                setFileButton("N");
                      break;
            case "R":/**반송 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(true);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(true);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(true);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                $("#btnQir").data("kendoButton").enable(true);     /** QIR **/

                setFileButton("Y");
                      break;
            case "S":/**유지보수 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(true);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(false);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(true);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);  /** 신청취소 **/

                setFileButton("Y");
                      break;
            default :
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(true);       /** 저장 **/
                $("#btnDelete").data("kendoButton").enable(false);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                $("#btnQir").data("kendoButton").enable(true);        /** QIR **/


                setFileButton("N");
                     break;
        }
    };
    setFileButton("N");


    /** 저장 데이터  **/
    function requestSaveData(statCd){

        /* validation Check*/
         if(!saveDataValidation()){
            return;
         }

         $("#statCd").val(statCd);


         var fileGrid = $("#fileGrid").data("kendoExtGrid");

         var formSaveData = $("#sanbaoTecReqForm").serializeObject($("#sanbaoTecReqForm").serializeArrayInSelector("[data-json-obj='true']"));
         formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
         formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
         formSaveData.wartStartDt = $("#wartStartDt").data("kendoDatePicker").value();
         formSaveData.statCd = statCd;

         if(!$("#emgcAlrtChk").prop("checked")  ){
             formSaveData.emgcAlrtCd = "";
         }
         if(!$("#pblmErrChk").prop("checked")  ){
             formSaveData.pblmErrCd = "";
         }

         var docNo =  $("#docNo").val();


         //var validator = $("#kendoSanbaoReqForm").kendoExtValidator().data("kendoSanbaoReqForm");


             $.ajax({
                 url:"<c:url value='/ser/wac/sanbaoTechReq/multiSanbaoTechRequest.do' />"
                ,data:JSON.stringify(formSaveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result , textStatus){


                    $("#docNo").val(result);
                    $("#statCd").val((statCd == "QC") ? "O":statCd);


                    //selectedYn = true;
                    selectedYn = ( dms.string.isEmpty($("#sStatCd").val() )  && ((statCd != "O" ) || (docNo == "" )) );
                    if(selectedYn){
                        gridRow = $("#grid").data("kendoExtGrid").select().index();
                        getGridSearch();
                    }


                    fileGrid.dataSource.data([]);
                    fileGrid.dataSource.read();

                    setButtonEnable($("#statCd").val());
                    setOpnTpSet($("#statCd").val());

                    dms.notification.success("<spring:message code='global.info.success' />");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
             });
    }

    /** 삭제 데이터  **/
    function deleteData(){

        $("#messageId").html("<spring:message code='ser.lbl.del' var='delete' />"+
                             "<spring:message code='global.info.cnfrmMsg' arguments='${delete}' />");
        conformKendoWindow.content( $(".msgDiv").html());
        conformKendoWindow.open();
        $(".yes, .no").click(function(){
            if($(this).hasClass("yes")){
                conformKendoWindow.close();

                var formSaveData = $("#sanbaoTecReqForm").serializeObject($("#sanbaoTecReqForm").serializeArrayInSelector("[data-json-obj='true']"));
                formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
                formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
                formSaveData.wartStartDt = $("#wartStartDt").data("kendoDatePicker").value();


                //var validator = $("#kendoSanbaoReqForm").kendoExtValidator().data("kendoSanbaoReqForm");


                    $.ajax({
                        url:"<c:url value='/ser/wac/sanbaoTechReq/deleteSanbaoTechRequest.do' />"
                       ,data:JSON.stringify(formSaveData)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,success:function(result , textStatus){
                           initAll();
                           selectedYn = false;
                           $("#grid").data("kendoExtGrid").dataSource.data([]);
                           $("#grid").data("kendoExtGrid").dataSource.read();

                           dms.notification.success("<spring:message code='global.info.deleteSuccess' />");
                       }
                       ,beforeSend:function(xhr){
                           dms.loading.show($("#resizableContainer"));
                       }
                       ,complete:function(xhr,status){
                           dms.loading.hide($("#resizableContainer"));
                       }
                    });
            }else{
                conformKendoWindow.close();
            }


        }).end();

    }

    /** data Validation Check**/
    function saveDataValidation(){


        var msgText;
        var result = true;

        if( dms.string.isEmpty(  $("#vinNo").val() ) ) {
            msgText = "<spring:message code='ser.lbl.vinNo' var='global_lbl_vinNo' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_vinNo}' />";
                      result =  false;

        }else if( dms.string.isEmpty(  $("#emgcReasonCont").val() ) ){
            msgText = "<spring:message code='ser.lbl.emgcReasonCont' var='emgcReasonCont' />"+
                      "<spring:message code='global.info.required.field' arguments='${emgcReasonCont}' />";
                      $("#emgcReasonCont").focus();
                      result =  false;
        }else if( dms.string.isEmpty(  $("#dlrProcOpnCont").val() ) ){
            msgText = "<spring:message code='ser.lbl.dlrProcOpnCnt' var='dlrProcOpnCont' />"+
                      "<spring:message code='global.info.required.field' arguments='${dlrProcOpnCont}' />";
                      $("#emgcReasonCont").focus();
                      result =  false;
        }else if( (dms.string.isEmpty($("#pblmErrCd").val()) && dms.string.isEmpty($("#emgcAlrtCd").val())) ||
                  (($("#pblmErrChk").prop("checked") == false) &&  ($("#emgcAlrtChk").prop("checked") == false))
        ){

            msgText = "<spring:message code='ser.lbl.pblAlrtCd' var='pblAlrtCd' />"+
                      "<spring:message code='global.info.check.field' arguments='${pblAlrtCd}' />";
                      $("#pblmErrCd").focus();
                      result =  false;
        }
        if(!result) dms.notification.warning(msgText);

        return result;


    };



    /** 결과값 Set **/
    getResultDataSet = function(result){


        $("#docNo").val(dms.string.strNvl(result.docNo));
        $("#approveNo").val(dms.string.strNvl(result.approveNo));
        $("#bmpProcCont").val(dms.string.strNvl(result.bmpProcCont));
        $("#carOwnerId").val(dms.string.strNvl(result.carOwnerId));
        $("#carOwnerNm").val(dms.string.strNvl(result.carOwnerNm));
        $("#dlrProcOpnCont").val(dms.string.strNvl(result.dlrProcOpnCont));
        $("#emgcReasonCont").val(dms.string.strNvl(result.emgcReasonCont));
        $("#enginNo").val(dms.string.strNvl(result.enginNo));
        $("#fileKeyNm").val(dms.string.strNvl(result.fileKeyNm));
        $("#statCd").val(dms.string.strNvl(result.statCd));
        $("#vinNo").val(dms.string.strNvl(result.vinNo));


         if(dms.string.isNotEmpty(result.pblmErrCd)  ){
            $("#pblmErrChk").prop("checked",true);
            $("#pblmErrCd").data("kendoExtDropDownList").enable(true);
            $("#pblmErrCd").data("kendoExtDropDownList").value(dms.string.strNvl(result.pblmErrCd));
        }else {
            $("#pblmErrChk").prop("checked",false);
            $("#pblmErrCd").data("kendoExtDropDownList").enable(false);
            $("#pblmErrCd").data("kendoExtDropDownList").value("");
        }

        if(dms.string.isNotEmpty(result.emgcAlrtCd)  ){
            $("#emgcAlrtChk").prop("checked",true);
            $("#emgcAlrtCd").data("kendoExtDropDownList").enable(true);
            $("#emgcAlrtCd").data("kendoExtDropDownList").value(dms.string.strNvl(result.emgcAlrtCd));
        }else{
            $("#emgcAlrtChk").prop("checked",false);
            $("#emgcAlrtCd").data("kendoExtDropDownList").enable(false);
            $("#emgcAlrtCd").data("kendoExtDropDownList").value("");
        }



        $("#runDistVal").data("kendoExtNumericTextBox").value( Number(dms.string.defaultString(result.itemChkDt,"0")) );
        $("#wartStartDt").data("kendoDatePicker").value( dms.string.strNvl(result.wartStartDt) );
        $("#creDt").data("kendoDatePicker").value( dms.string.strNvl(result.creDt) );
        $("#judgDt").data("kendoDatePicker").value( dms.string.strNvl(result.judgDt) );
        $("#judgId").val(dms.string.strNvl(result.judgId));
        $("#judgNm").val(dms.string.strNvl(result.judgNm));
        $("#telNo").val(dms.string.strNvl(result.telNo));


        setOpnTpSet(result.opnTp);

    };

    /** 차량정보, 고객정보 셋팅 **/
    custInfoSet = function(data){
        $("#vinNo").val(data.vinNo);
        $("#runDistVal").data("kendoExtNumericTextBox").value(data.carRunDistVal);
        $("#creDt").data("kendoDatePicker").value(data.signOffDt);
        $("#wartStartDt").data("kendoDatePicker").value(data.grteStartDt);
        $("#enginNo").val(data.enginNo);
        $("#carOwnerId").val(data.carOwnerId);
        $("#carOwnerNm").val(data.carOwnerNm);

        $("#pblmErrChk").prop("checked",false);
        $("#pblmErrCd").data("kendoExtDropDownList").enable(false);
        $("#pblmErrCd").data("kendoExtDropDownList").value("");

        $("#emgcAlrtChk").prop("checked",false);
        $("#emgcAlrtCd").data("kendoExtDropDownList").enable(false);
        $("#emgcAlrtCd").data("kendoExtDropDownList").value("");

    };

 // 내용checkBox 설정
    setOpnTpSet = function(opnTp){

        $("input[name='opnTp']").each(function(){
            if(!this.checked){
                $("input[name='opnTp']").prop("checked", false);
                $("span[name='opnTpTx']").removeClass("txt_label bg_blue");
            }
        });

        if(dms.string.strNvl(opnTp) != "" && dms.string.strNvl(opnTp) != "Q"){
            eval($("#opnTp_"+opnTp)).prop("checked", true);
            eval($("#opnTpTx_"+opnTp)).addClass("txt_label bg_blue");
        }

    };

    /** 그리드 **/
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000189"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoTechReq/selectSanbaoTechRequestMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"] = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sStatCd"] = $("#sStatCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,vin:{type:"string" }
                       ,statCd:{type:"string"}
                       ,dlrSignReqDt:{type:"date" }
                       ,judgDt:{type:"date"}
                       ,judgNm:{type:"number"}
                       ,delayDay:{type:"number"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:true
        ,editable:false
        ,height:150
        ,sortable:false
        ,resizable:false
        ,filterable:false                 // 필터링 기능 사용안함
        //,multiSelectWithCheckbox:true
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }

            if(isTablet == "true"){
                $("#grid > .k-grid-content").height(100);
            }
        }
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());

            var params = {};
            params["sVinNo"] = selectedVal.vinNo;
            params["sDocNo"] = selectedVal.docNo;


            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoTechReq/selectSanbaoTechRequestByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){


                   getResultDataSet(result);
                   $("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#statCd").val());
                  // dms.notification.success("<spring:message code='global.info.searchSuccess' />");

                }

            }) ;

        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:70, attributes :{"class":"al"}}
                   ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:100, attributes :{"class":"al"}}
                   ,{field:"statCd", title:"<spring:message code='ser.lbl.statNm' />", width:50
                       ,attributes :{"class":"al"}
                       ,template:"#=setStatCd(statCd)#"
                       ,editor:function(container, options){
                           $('<input required data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,dataValueField:"cmmCd"
                               ,dataSource:statList
                           });
                           $('<span class="k-invalid-msg" data-for="statCd"></span>').appendTo(container);
                          }


                   }
                   ,{field:"dlrSignReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:80
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"judgDt", title:"<spring:message code='ser.lbl.judgDt' />", width:80
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"judgNm", title:"<spring:message code='ser.lbl.hqApproveNm' />", width:100, attributes :{"class":"ar"}}
                   ,{field:"delayDay", title:"<spring:message code='ser.lbl.delayDay' />", width:50, attributes :{"class":"ar"}}
                 ]

    });

    if(isTablet == "true"){
        if(window.matchMedia('(max-width:1024px)').matches){
            $("#grid").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }


});
</script>
<!-- //script -->


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<!-- 신청현황 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.sanboReq" /></h1> <!-- 삼보요청 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12110" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12109" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_btnExcel" id="btnExcelDown" ><spring:message code="global.btn.excelDownload" /></button> <!-- 엑셀다운 -->
                    </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup  id="sanboColGroup">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
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
                            <th scope="row"><spring:message code="ser.lbl.docNo" /></th> <!-- 문서번호  -->
                            <td>
                                <input type="text" id="sDocNo" name="sDocNo" class="form_input" />
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
            <!-- 신청현황 그리드 -->
            <div class="table_grid mt10">
                <div id="gridMaster" class="resizable_grid"></div>
            </div>
        </section>
        <!-- //신청현황 -->

        <section class="group">
            <div class="header_area">
                 <div class="btn_right">
                    <dms:access viewId="VIEW-D-12108" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_init btn_s_min5" id="btnInit" disabled><spring:message code="global.btn.init" /></button> <!-- 초기화 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12107" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_save btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12106" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_delete btn_s_min5" id="btnDelete" disabled><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12105" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_request btn_s_min5" id="btnReq" disabled><spring:message code="global.btn.req" /></button> <!-- 신청 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12104" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button> <!-- 취소 -->
                    </dms:access>
                </div>
            </div>
        </section>
        <form id="sanbaoForm" name="sanbaoForm">
            <div id="kendoSanbaoReqForm">
                <div class="clfix">
                    <!-- 차종정보 -->
                    <section class="left_areaStyle">
                         <div class="header_area pt0">
                            <h2 class="title_basic"><spring:message code="ser.lbl.carLineInfo" /></h2> <!-- 차종정보 -->
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
                                                <input type="text" id="vinNo" name="vinNo" readonly="readonly" class="form_input form_readonly" data-json-obj="true" />
                                                <a href="javascript:custPopupWindow();"></a>
                                            </div>
                                        </td>
                                        <th scope="row" class="bor_none"></th>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="ser.lbl.hqApproveNm" /></th><!-- 판정인 -->
                                        <td>
                                            <input type="text" id="judgNm" name="judgNm" readonly="readonly" class="form_input form_readonly" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.judgDt" /></th> <%-- 판정일자 --%>
                                        <td class="readonly_area">
                                            <input type="text" id="judgDt" name="judgDt" readonly="readonly" class="form_datetimepicker ac" data-json-obj="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="ser.lbl.runDist" /></th> <!-- 주행거리 -->
                                        <td>
                                            <input type="text" id="runDistVal" name="runDistVal" readonly="readonly" class="form_numeric form_readonly ar" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.telNo" /></th> <!-- 전화번호 -->
                                        <td>
                                            <input type="text" id="telNo" name="telNo" readonly="readonly" class="form_input form_readonly" data-json-obj="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="ser.lbl.wartDt" /></th> <!-- 보증시작일 -->
                                        <td class="readonly_area">
                                            <input type="text" id="wartStartDt" name="wartStartDt" readonly class="form_datetimepicker ac" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.creDt" /></th><!-- 생산일자 -->
                                        <td class="readonly_area">
                                            <input type="text" id="creDt" name="creDt" readonly="readonly" class="form_datetimepicker ac" data-json-obj="true" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- 탭메뉴 전체 영역 -->
                        <div id="tabstrip" class="tab_area">
                            <!-- 탭메뉴 -->
                            <ul>
                                <li class="k-state-active"><spring:message code="ser.lbl.item" /></li>
                                <li><spring:message code="ser.lbl.file" /></li>

                            </ul>
                            <!-- 부품 그리드 -->
                            <div>
                                <div class="btn_right_absolute">
                                    <dms:access viewId="VIEW-D-12103" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s btn_add btn_s_min5" id="btnGridAdd" disabled><spring:message code="global.btn.rowAdd" /></button>
                                    </dms:access>
                                    <dms:access viewId="VIEW-D-12102" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s btn_delete btn_s_min5" id="btnGridDel" disabled><spring:message code="global.btn.rowDel" /></button>
                                    </dms:access>
                                    <dms:access viewId="VIEW-D-12101" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnGridCan" disabled><spring:message code="global.btn.cancel" /></button>
                                    </dms:access>
                                </div>
                                <div class="table_grid">
                                    <div id="gridPart" class="grid"></div>
                                </div>
                            </div>
                            <!-- 부품 그리드 -->
                            <div>
                            <!-- 파일업로드관련 include page -->
                                <div class="btn_right_absolute">
                                    <dms:access viewId="VIEW-D-12100" hasPermission="${dms:getPermissionMask('READ')}">
                                    <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 파일찾기 -->
                                    </dms:access>
                                    <dms:access viewId="VIEW-D-12099" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s" disabled><spring:message code="global.btn.fileDelete" /></button>
                                    </dms:access>
                                </div>
                                <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                            <!-- 파일업로드관련 include page -->
                            </div>
                       </div>
                        <!-- //탭메뉴 전체 영역 -->
                    </section>
                    <!-- //차종정보 -->

                    <!-- 의견 -->
                    <section class="right_areaStyle">
                        <div class="header_area pt0">
                            <h2 class="title_basic"><spring:message code="ser.title.cont"  /></h2> <!-- 의견사항 -->
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
                                            <textarea rows="3" cols="" id="emgcReasonCont" maxLength="600" name="emgcReasonCont" class="form_textarea" data-json-obj="true" style="height:72px"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dlrProcOpnCnt" /></span></th> <!-- 딜러처리 의견 및 방안 -->
                                        <td>
                                            <textarea rows="3" cols="" id="dlrProcOpnCont" maxLength="600" name="dlrProcOpnCont" class="form_textarea" data-json-obj="true" style="height:72px"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="ser.lbl.bmpProcCont" /></th> <!-- BMP 처리의견 -->
                                        <td>
                                            <textarea rows="3" cols="" readonly id="bmpProcCont" maxLength="600" name="bmpProcCont" class="form_textarea form_readonly" style="height:78px"></textarea>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                        <th scope="row"><spring:message code="ser.lbl.wrtrDt" /></th> <!-- 작성일자 -->
                                        <td>
                                            <input type="text" id="wrtrDt" name="wrtrDt" class="form_datepicker ac" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.itemChkDt" /></th> <!-- 물류확인일 -->
                                        <td>
                                            <input type="text" id="itemChkDt" name="itemChkDt" readonly="readonly" class="form_datepicker form_readonly ac" data-json-obj="true" />
                                        </td>
                                    </tr> --%>
                                </tbody>
                            </table>
                        </div>

                        <div class="header_area">
                            <div class="btn_right">
                              <%--   <button type="button" class="btn_s btn_save" id="wrtrSave"><spring:message code="global.btn.save" /></button> <!-- 저장 --> --%>
                            </div>
                        </div>
                        <div class="table_form form_width_100per">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:22%;">
                                    <col style="width:28%;">
                                    <col style="width:22%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.wrtrDt" /></span></th> <!-- 작성일자 -->
                                        <td>
                                            <input type="text" id="wrtrDt" name="wrtrDt" class="form_datepicker ac" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.itemChkDt" /></th> <!-- 물류확인일 -->
                                        <td>
                                            <input type="text" id="itemChkDt" name="itemChkDt" readonly="readonly" class="form_datepicker form_readonly ac" data-json-obj="true" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="header_area">
                            <div class="btn_right">
                                <dms:access viewId="VIEW-D-12098" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <!-- <input type="hidden" id="itemTax" value='1.17' />  -->
                </div>
            </div>
        </form>
    </div>
</div>
<!-- script -->
<script type="text/javascript" charset="UTF-8">
//세율 (0.16)
var vatCode = "${vatCd}";
var vatCd = dms.string.isEmpty(vatCode)?0.16:Number(vatCode);
vatCd = vatCd + 1;

var isTablet="${isTablet}";
var _width=920;//web
if(isTablet == "true"){
    _width=950;//tablet
}

var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
}

/**공통코드: 상태코드   **/
var statList = [];
<c:forEach var="obj" items="${stateDs}">
    statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var statMap = dms.data.arrayToMap(statList, function(obj){return obj.cmmCd;});


/** 고객 팝업 **/
var vehOfCustInfoSearchPopup;
/** 부품 조회 팝업 **/
var itemSalePrcPopupWindow;
/** 정비이력 조회 팝업 **/
var repairOrderSearchPopup;

//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

$(document).ready(function() {

    setStatCd = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(statMap[value] != undefined)
            resultVal =  statMap[value].cmmCdNm;
        }
        return resultVal;
    };

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
                            $("#docNo").val("");
                            $("#statCd").val("O");
                            /** 버튼 세팅 **/
                            setButtonEnable($("#statCd").val());
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
             , width:_width //todo khskhs 사이즈변경 완료
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

    /** 부품 조회 팝업 **/
    partSearchPopupWindow = function (){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }


        itemSalePrcPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='ser.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                ,data:{
                     "autoBind":true
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(jsonObj){
                        if(jsonObj.length > 0) {

                            var grid = $('#gridPart').data('kendoExtGrid');
                            var itemTax = vatCd;

                            $.each(jsonObj, function(idx, data){

                                var copyData = {};
                                var result = true;
                                $.each(grid.dataSource._data , function(i , partData){
                                    if(partData.itemCd == data.itemCd){
                                        result = false;
                                    }
                                });
                                if(result){
                                    copyData = {
                                              dlrCd :data.dlrCd
                                            , itemCd:data.itemCd
                                            , itemNm:data.itemNm
                                            , reqQty:1
                                            , saleUnitCd:data.stockUnitCd
                                            , salePrc:data.salePrcAmt
                                            , saleAmt:Number( ( ( ( data.salePrcAmt * 1 ).toFixed(2) ) * itemTax ).toFixed(2) )  //  ((부품단가 * markup * 수량 ) * tax)
                                    };
                                    grid.dataSource.add(copyData);
                                }

                            });
                        }
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

    /** 상태코드   **/
    $("#sStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:statList
        ,optionLabel:" "  // 선택
        ,index:0
    });

    /**판정일자,보증시작일,생산일자,품목확인일자**/
    $("#judgDt,#wartStartDt,#creDt,#itemChkDt").kendoDatePicker({
       format:"{0:<dms:configValue code='dateFormat' />}"
    });

    /**작성일자**/
    $("#wrtrDt").kendoExtMaskedDatePicker({
       format:"{0:<dms:configValue code='dateFormat' />}"
      ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


   /**주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표

    });

    /********************** 초기 데이터  설정 ***************************/


    /** Field 초기화 **/
    initAll = function (e){

        $("#sanbaoForm").get(0).reset();
        $("#docNo").val("");
        $("#fileKeyNm").val("");
        //$("#gridMaster").data("kendoExtGrid").dataSource.data([]);
        $("#gridPart").data("kendoExtGrid").dataSource.data([]);
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        setButtonEnable("");

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

    };

    /** 버튼 세팅 **/
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "O":/** 작성중 **/
                $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);         /** 초기화 **/
                $("#btnExcelDown").data("kendoButton").enable(true);    /** 저장 **/
                $("#btnSave").data("kendoButton").enable(true);         /** 엑셀다운 **/
                $("#btnDelete").data("kendoButton").enable(true);       /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(true);          /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);   /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);       /** 정비이력 **/
                //$("#wrtrSave").data("kendoButton").enable(true);      /*작성일자 저장*/
                $("#btnGridAdd").data("kendoButton").enable(true);      /*그리드 저장*/
                $("#btnGridDel").data("kendoButton").enable(true);      /*그리드 삭제*/
                $("#btnGridCan").data("kendoButton").enable(true);      /*그리드 취소*/

                setFileButton("Y");
                      break;
            case "A":/** 완료 **/
                $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);         /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);        /** 저장 **/
                $("#btnExcelDown").data("kendoButton").enable(true);    /** 엑셀다운 **/
                $("#btnDelete").data("kendoButton").enable(false);      /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);         /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false);   /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);       /** 정비이력 **/
                //$("#wrtrSave").data("kendoButton").enable(false);     /*작성일자 저장*/
                $("#btnGridAdd").data("kendoButton").enable(false);     /*그리드 저장*/
                $("#btnGridDel").data("kendoButton").enable(false);     /*그리드 삭제*/
                $("#btnGridCan").data("kendoButton").enable(false);     /*그리드 취소*/

                setFileButton("N");
                      break;
            case "Q":/** 제출 **/
                $("#btnSearch").data("kendoButton").enable(true);      /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);        /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);       /** 저장 **/
                $("#btnExcelDown").data("kendoButton").enable(true);   /** 엑셀다운 **/
                $("#btnDelete").data("kendoButton").enable(false);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(true);   /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);      /** 정비이력 **/
                //$("#wrtrSave").data("kendoButton").enable(false);    /*작성일자 저장*/
                $("#btnGridAdd").data("kendoButton").enable(false);    /*그리드 저장*/
                $("#btnGridDel").data("kendoButton").enable(false);    /*그리드 삭제*/
                $("#btnGridCan").data("kendoButton").enable(false);    /*그리드 취소*/

                setFileButton("N");
                      break;
            case "S":/**접수 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);      /** 저장 **/
                $("#btnExcelDown").data("kendoButton").enable(true);  /** 엑셀다운 **/
                $("#btnDelete").data("kendoButton").enable(false);    /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);       /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(true);  /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                //$("#wrtrSave").data("kendoButton").enable(false);   /*작성일자 저장*/
                $("#btnGridAdd").data("kendoButton").enable(false);   /*그리드 저장*/
                $("#btnGridDel").data("kendoButton").enable(false);   /*그리드 삭제*/
                $("#btnGridCan").data("kendoButton").enable(false);   /*그리드 취소*/

                setFileButton("N");
                      break;
            case "R":/**반송 **/
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnExcelDown").data("kendoButton").enable(true);  /** 저장 **/
                $("#btnSave").data("kendoButton").enable(true);       /** 엑셀다운 **/
                $("#btnDelete").data("kendoButton").enable(true);     /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(true);        /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false); /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                //$("#wrtrSave").data("kendoButton").enable(true);    /*작성일자 저장*/
                $("#btnGridAdd").data("kendoButton").enable(true);    /*그리드 저장*/
                $("#btnGridDel").data("kendoButton").enable(true);    /*그리드 삭제*/
                $("#btnGridCan").data("kendoButton").enable(true);    /*그리드 취소*/

                setFileButton("Y");
                      break;
            default :
                $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                $("#btnInit").data("kendoButton").enable(true);       /** 초기화 **/
                $("#btnSave").data("kendoButton").enable(false);      /** 저장 **/
                $("#btnExcelDown").data("kendoButton").enable(true);  /** 엑셀다운 **/
                $("#btnDelete").data("kendoButton").enable(false);    /** 삭제 **/
                $("#btnReq").data("kendoButton").enable(false);       /** 신청 **/
                $("#btnReqCancel").data("kendoButton").enable(false); /** 신청취소 **/
                $("#btnRoHist").data("kendoButton").enable(true);     /** 정비이력 **/
                //$("#wrtrSave").data("kendoButton").enable(false);   /*작성일자 저장*/
                $("#btnGridAdd").data("kendoButton").enable(false);   /*그리드 저장*/
                $("#btnGridDel").data("kendoButton").enable(false);   /*그리드 삭제*/
                $("#btnGridCan").data("kendoButton").enable(false);   /*그리드 취소*/

                setFileButton("N");
                     break;
        }
    };
    setFileButton("N");


    function saveDataValidation(){

        // 작성일자, 긴급정황설명 ,

        var msgText;
        var result = true;
        var gridPart = $("#gridPart").data("kendoExtGrid");

        if( !dms.string.isNotEmpty(  $("#vinNo").val() ) ) {
            msgText = "<spring:message code='ser.lbl.vinNo' var='global_lbl_vinNo' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_vinNo}' />";
                      result =  false;

        }else if( !dms.string.isNotEmpty(  $("#emgcReasonCont").val() ) ){
            msgText = "<spring:message code='ser.lbl.emgcReasonCont' var='ser_lbl_emgcReasonCont' />"+
                      "<spring:message code='global.info.required.field' arguments='${ser_lbl_emgcReasonCont}' />";
                      $("#emgcReasonCont").focus();
                      result =  false;
        }else if( !dms.string.isNotEmpty( $("#dlrProcOpnCont").val() ) ){
            <enhance:out escapeXml="false">

            msgText = "<spring:message code='ser.lbl.dlrProcOpnCnt' var='ser_lbl_dlrProcOpnCnt' />"+
                      "<spring:message code='global.info.required.field' arguments='${ser_lbl_dlrProcOpnCnt}' />";
                      $("#dlrProcOpnCont").focus();
                      result =  false;
             </enhance:out>

        }else if(  !dms.string.isNotEmpty( $("#wrtrDt").val() ) ){
            msgText = "<spring:message code='ser.lbl.wrtrDt' var='global_lbl_wrtrDt' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_wrtrDt}' />";
                      $("#wrtrDt").focus();
                      result =  false;
        }

        $.each(gridPart.dataSource._data , function(i , partData){
            if( dms.string.strNvl(partData.parOrdNo) == ""){
                msgText = "<spring:message code='ser.lbl.parOrdNo' var='parOrdNo' />"+
                "<spring:message code='global.info.validation.required' arguments='${parOrdNo}' />";
                result =  false;
           }
        });

        if(!result) dms.notification.warning(msgText);

        return result;
    };


    /** 저장 데이터  **/
    function requestSaveData(statCd){

        /* validation Check*/
         if(!saveDataValidation()){
            return;
         }


         var gridPart = $("#gridPart").data("kendoExtGrid");
         var fileGrid = $("#fileGrid").data("kendoExtGrid");

         var formSaveData = $("#sanbaoForm").serializeObject($("#sanbaoForm").serializeArrayInSelector("[data-json-obj='true']"));
         formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
         formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
         formSaveData.wartStartDt = $("#wartStartDt").data("kendoDatePicker").value();
         formSaveData.wrtrDt = $("#wrtrDt").data("kendoExtMaskedDatePicker").value();
         //formSaveData.itemChkDt = $("#itemChkDt").data("kendoDatePicker").value();
         formSaveData.statCd =  statCd;


         var partSaveData = gridPart.getCUDData("insertList", "updateList", "deleteList");
         var params =  $.extend(
                 {"sanbaoVO":formSaveData}
                ,{"sanbaoPartVO":partSaveData}
          );

         var docNo = $("#docNo").val();

         //var validator = $("#kendoSanbaoReqForm").kendoExtValidator().data("kendoSanbaoReqForm");

         if(gridPart.gridValidation()){

             $.ajax({
                 url:"<c:url value='/ser/wac/sanbaoReq/multiSanbaoRequests.do' />"
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result , textStatus){

                    $("#docNo").val(result);
                    $("#statCd").val( (statCd == "QC" ) ?  "O":statCd );

                    selectedYn = ( dms.string.isEmpty($("#sStatCd").val() )  && ((statCd != "O" ) || (docNo == "" )) );
                    if(statCd){
                        gridRow = $("#gridMaster").data("kendoExtGrid").select().index();
                        $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                        $("#gridMaster").data("kendoExtGrid").dataSource.read();
                    }


                    fileGrid.dataSource.data([]);
                    gridPart.dataSource.data([]);
                    fileGrid.dataSource.read();
                    gridPart.dataSource.read();

                    setButtonEnable($("#statCd").val());
                    dms.notification.success("<spring:message code='global.info.success' />");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
             });
         }else{
             dms.notification.warning("<spring:message code='global.info.check.input' />");
         }
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

                var formSaveData = $("#sanbaoForm").serializeObject($("#sanbaoForm").serializeArrayInSelector("[data-json-obj='true']"));
                formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
                formSaveData.creDt = $("#creDt").data("kendoDatePicker").value();
                formSaveData.wartStartDt = $("#wartStartDt").data("kendoDatePicker").value();
                formSaveData.wrtrDt = $("#wrtrDt").data("kendoExtMaskedDatePicker").value();

                //var validator = $("#kendoSanbaoReqForm").kendoExtValidator().data("kendoSanbaoReqForm");
                    $.ajax({
                        url:"<c:url value='/ser/wac/sanbaoReq/deleteSanbaoRequests.do' />"
                       ,data:JSON.stringify(formSaveData)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,success:function(result , textStatus){
                           initAll();
                           $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                           $("#gridMaster").data("kendoExtGrid").dataSource.read();

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

    /********************** 버튼 설정 ***************************/

    /** 조회 **/
    $("#btnSearch").kendoButton({

        click:function(e){

            selectedYn = false;
            $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
            $("#gridMaster").data("kendoExtGrid").dataSource.read();

        }
    });

    /** 엑셀다운 **/
    $("#btnExcelDown").kendoButton({

        click:function(e){

            dms.ajax.excelExport({
                "beanName"         :"sanbaoRequestService"
                ,"templateFile"    :"SanbaoRequestList_Tpl.xlsx"
                ,"fileName"        :"<spring:message code='ser.title.sanboReq' />.xlsx"
                ,"sFromDt"         :$("#sFromDt").val()
                ,"sToDt"           :$("#sToDt").val()
                ,"sVinNo"          :$("#sVinNo").val()
                ,"sStatCd"         :$("#sStatCd").val()
                ,"sDocNo"          :$("#sDocNo").val()
                ,"sTabId"          :"sanbaoRequestListT"                                // TAB ID
            });
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
            requestSaveData($("#statCd").val());
        }

    });

    /** 삭제 **/
    $("#btnDelete").kendoButton({

        click:function(e){

            deleteData();

        }
    });
    /** 요청 **/
    $("#btnReq").kendoButton({

        click:function(e){

            requestSaveData("Q");

        }
    });
    /** 요청취소 **/
    $("#btnReqCancel").kendoButton({

        click:function(e){


            requestSaveData("QC");

        }
    });
    /** 정비이력조회 **/
    $("#btnRoHist").kendoButton({

        click:function(e){
            selectRepairOrderSearchPopupWindow();
        }
    });
    /** 그리드 행추가 **/
    $("#btnGridAdd").kendoButton({

        click:function(e){
            partSearchPopupWindow();
        }
    });

    /** 그리드 행삭제 **/
    $("#btnGridDel").kendoButton({

        click:function(e){

            var grid = $("#gridPart").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    /** 그리드 행취소 **/
    $("#btnGridCan").kendoButton({

        click:function(e){

            $('#gridPart').data('kendoExtGrid').cancelChanges();

        }
    });



    /** 작성일자 저장 **/
    /* $("#wrtrSave").kendoButton({

        click:function(e){

            requestSaveData();
        }
    }); */

    /** 부품 계산**/
    calPartAmt = function(e){

        var grid = $("#gridPart").data("kendoExtGrid");
        var gridData = grid.dataSource._data;

        var selectedVal = grid.dataItem(grid.select());

        // ROUND ( ROUND ( 부품단가 * MARK UP * 수량  , 2) * TAX , 2)
        var reqQty  = Number(selectedVal.reqQty); //수량
        var itemTax = vatCd;
        var salePrc = Number(selectedVal.salePrc); //단가
        var saleAmt = Number( ( (salePrc * reqQty).toFixed(2) * itemTax).toFixed(2)  );

        selectedVal.set("saleAmt",saleAmt);

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
        $("#judgNm").val(dms.string.strNvl(result.judgNm));
        $("#judgDt").data("kendoDatePicker").value(dms.string.strNvl(result.judgDt));


        $("#runDistVal").data("kendoExtNumericTextBox").value( Number(dms.string.defaultString(result.itemChkDt,"0")) );
        $("#itemChkDt").data("kendoDatePicker").value( dms.string.strNvl(result.itemChkDt) );
        $("#wartStartDt").data("kendoDatePicker").value( dms.string.strNvl(result.wartStartDt) );
        $("#creDt").data("kendoDatePicker").value( dms.string.strNvl(result.creDt) );
        $("#wrtrDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.wrtrDt) );


    };

    /********************** 버튼 설정 ***************************/


    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000179"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoReq/selectSanbaoRequestMains.do' />"
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
                         params["sDocNo"] = $("#sDocNo").val();
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
                        rnum:{type:"number", editable:false }
                       ,docNo:{type:"string", editable:false } // 문서번호
                       ,vinNo:{type:"string", editable:false, validation:{required:true} }//차대번호
                       ,statCd:{type:"string", editable:false }//상태
                       ,dlrSignReqDt:{type:"date"  } //청구일
                       ,judgDt:{type:"date", editable:false }//판정일
                       ,judgNm:{type:"string", editable:false } // 판정자
                       ,delayDay:{type:"number", editable:false } // 지연일
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,sortable:false
        ,autoBind:true
        ,height:150
        ,resizable:false
        //,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:_selectable
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }
            if(isTablet == "true"){
                $("#gridMaster > .k-grid-content").height(100);
            }
        }
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());


            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var docNo = selectedVal.docNo;

            var params = {};
            params["sVinNo"] = selectedVal.vinNo;
            params["sDocNo"] = selectedVal.docNo;


            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoReq/selectSanbaoRequestByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){

                   getResultDataSet(result);

                   $("#gridPart").data("kendoExtGrid").dataSource.data([]);
                   $("#gridPart").data("kendoExtGrid").dataSource.read();
                   $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                   $("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#statCd").val());
                   //dms.notification.success("<spring:message code='global.info.searchSuccess' />");

                }

            }) ;
        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:100, attributes :{"class":"al"}}//삼포문서번호
                   ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:100, attributes :{"class":"al"}}//빈번호
                   ,{field:"statCd", title:"<spring:message code='ser.lbl.statNm' />", width:80
                       ,attributes :{"class":"ac"} //statList statMap
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

                   }//상태
                   ,{field:"dlrSignReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:80
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }//요청일자
                   ,{field:"judgDt", title:"<spring:message code='ser.lbl.judgDt' />", width:80
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }//판정일자
                   ,{field:"judgNm", title:"<spring:message code='ser.lbl.hqApproveNm' />", width:100
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }//판정인
                   ,{field:"delayDay", title:"<spring:message code='ser.lbl.delayDay' />", width:50, attributes :{"class":"ar"}}//지연일자
                 ]

    });

    /**부품 그리드 **/
    $("#gridPart").kendoExtGrid({
        gridId:"G-SER-1011-000180"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoReq/selectSanbaoRequestParts.do' />"
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

                         params["sDocNo"] = $("#docNo").val();
                         //params["sDlrCd"] = $("#sDlrCd").val();

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
                        rnum:{type:"number", editable:false }
                       ,itemCd:{type:"string", editable:false, validation:{required:true} }//부품코드
                       ,itemNm:{type:"string", editable:false }//부품명
                       ,parOrdNo:{type:"string", editable:true, validation:{required:true} }// 부품주문번호
                       ,reqQty:{type:"number", editable:true, validation:{required:true} } //수량
                       ,saleUnitCd:{type:"string", editable:false }//단위
                       ,salePrc:{type:"number", editable:false } // 단가
                       ,saleAmt:{type:"number", editable:true }//금액
                       ,docNo:{type:"string", editable:true }//문서번호
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:123
        ,resizable:false
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:_selectable
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[0]).attr("name");
             if(fieldName=="itemAmt" ){
                 this.closeCell();
             }
        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes :{"class":"al"}}
                   ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:80, attributes :{"class":"al"}}
                   ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150, attributes :{"class":"al"}}
                   ,{field:"parOrdNo", title:"<spring:message code='ser.lbl.parOrdNo' />", width:80
                       ,attributes :{"class":"al"}
                       ,editor:function(container, options){
                           $('<input required id="parOrdNo" name="parOrdNo" maxLength=20 class="form_input" data-name="<spring:message code="ser.lbl.parOrdNo" />" data-bind="value:' + options.field + '"/>').appendTo(container)
                           $('<span class="k-invalid-msg" data-for="parOrdNo"></span>').appendTo(container);
                        }
                   }
                   ,{field:"reqQty", title:"<spring:message code='ser.lbl.itemQty' />", width:40
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="reqQty" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n0"                // n0:###,###, n2:###,###.##
                              ,decimals:0                // 소숫점
                              ,min:1
                              ,value:0
                              ,spinners:false
                              ,change:calPartAmt
                           });
                           $('<span class="k-invalid-msg" data-for="reqQty"></span>').appendTo(container);
                        }
                   }
                   ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:50, attributes :{"class":"ac"}, hidden:true}
                   ,{field:"salePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:50, attributes :{"class":"ar"}, hidden:true}
                   ,{field:"saleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:50, attributes :{"class":"ar"} , hidden:true}
                   ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:50, attributes :{"class":"ar"} , hidden:true}
                 ]

    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    if(isTablet == true || isTablet == "true"){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#sanboColGroup col");
            $(colEmt[0]).css("width","6%");
            $(colEmt[1]).css("width","24%");
            $("#gridMaster").parents(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }

});
</script>
<!-- //script -->

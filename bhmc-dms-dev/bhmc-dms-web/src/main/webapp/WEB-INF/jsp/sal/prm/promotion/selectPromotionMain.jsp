<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 프로모션 관리 -->
<div id="resizableContainer">
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.promotionMng" /></h1><!-- 프로모션 관리 -->
        <div class="btn_right">
            <button class="btn_m" id="btnViewDetail"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
            <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.promotionType' /></th><!-- 프로모션유형 -->
                    <td>
                        <input id="sPromotionTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.approveYn' /></th><!-- 승인여부 -->
                    <td>
                        <input id="sApproveCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.promotionTime' /></th><!-- 프로모션기간 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<section id="callPromotionWindow" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s " id="btnApproval"><spring:message code="global.btn.approval" /></button><!-- 승인 -->
            <button type="button" class="btn_s " id="btnApprovalReq"><spring:message code="global.btn.applyReq" /></button><!-- 승인요청 -->
            <button type="button" class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            <button type="button" class="btn_s btn_delete" id="btnDel"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
        </div>
    </div>

    <div class="clfix">
        <div class="left_areaStyle">
        <form id="detailForm" name="detailForm" method="POST" action="/">
        <!-- 프로모션 정보 -->
        <section class="group">
            <div class="header_area pt0">
                <h2 class="title_basic"><spring:message code='global.title.promotionInfo' /></h2><!-- 프로모션 정보 -->
            </div>
            <div class="table_form form_width_100per" >
                <table >
                    <caption></caption>
                    <colgroup>
                        <col style="width:20%;">
                        <col style="width:45%;">
                        <col style="width:15%;">
                        <col style="width:20%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.promotionType' /></span></th><!-- 프로모션 유형 -->
                            <td>
                                <input id="promotionTp" name="promotionTp" type="text" data-json-obj="true" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.approveYn' /></th><!-- 승인여부 -->
                            <td class="readonly_area">
                                <input id="approveCd" name="approveCd" value="A" type="text" data-json-obj="true" disabled="disabled" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.promotionNm' /></span></th><!-- 프로모션명 -->
                            <td>
                                <input id="promotionNm" name="promotionNm" class="form_input" type="text" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.promotionOwn' /></span></th><!-- 프로모션주관 -->
                            <td><input id="promotionOwnCd" name="promotionOwnCd" class="form_comboBox" type="text" data-json-obj="true"></td>
                        </tr>
                        <tr >
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.promotionTime' /></span></th><!-- 프로모션기간 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="startDt" name="startDt" type="text" class="form_datepicker" data-json-obj="true">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="endDt" name="endDt" type="text" class="form_datepicker" data-json-obj="true">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.contractTpArea' /></span></th><!-- 대상계약유형 -->
                            <td colspan="3">
                                <div id="contractTpArea" style="list-style:none;"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //프로모션 정보 -->


        <!-- 프로모션 정산 -->
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.promotionAccount' /></h2><!-- 프로모션 정산 -->
            </div>
            <div class="table_form form_width_100per" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:20%;">
                        <col style="width:80%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.budnRate' /></span></th><!-- 정산비율 -->
                            <td>
                                <span class="span_txt"><spring:message code='sal.lbl.factory' /></span><!-- 제조사 -->
                                <input id="imsBudnRate" name="imsBudnRate" type="text"  class="form_input ar" style="width:50px" data-json-obj="true" > <span class="span_txt">%</span>
                                <span class="span_txt ml15"><spring:message code='global.lbl.dealer' /></span><!-- 딜러 -->
                                <input id="dlrBudnRate" name="dlrBudnRate" type="text"  class="form_input ar" style="width:50px" data-json-obj="true" > <span class="span_txt">%</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.promotionMemo' /></th><!-- 프로모션 메모 -->
                            <td >
                                <input id="remark" name="remark" type="text" class="form_input"  data-json-obj="true" >
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //프로모션 정산 -->


        <!-- 프로모션 유형 적용방법-->
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.promotionWay' /></h2><!-- 프로모션 유형 적용방법-->
            </div>
            <div class="table_form form_width_100per" >
                <table >
                    <caption></caption>
                    <colgroup>
                        <col style="width:20%;">
                        <col style="width:38%;">
                        <col style="width:16%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.applyTp' /></th><!-- 적용방법 -->
                            <td>
                                <ul class="tabmenu">
                                    <input id="applyTp" name="applyTp" type="hidden" value="F" data-json-obj="true" />
                                    <input id="promotionCd" name="promotionCd" type="hidden" data-json-obj="true" />
                                    <li id="btnRate" ><button type="button" onclick="btnClick('R');"><spring:message code='global.lbl.methodRate' /></button></li><!-- 정률(비율) -->
                                    <li id="btnAmt" class="on"><button type="button" onclick="btnClick('F');"><spring:message code='global.lbl.methodAmt' /></button></li><!-- 정액(금액) -->
                                </ul>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.applyAmt' /></span></th><!-- 적용금액 -->
                            <td>
                                <div id="amtDiv"><input id="promotionAmt1" name="promotionAmt1" type="text"  class="form_input ar" data-json-obj="true"></div>
                                <div id="rateDiv" style="display:none;" ><input id="promotionAmt2" name="promotionAmt2" type="text" class="form_input ar" style="width:83%;" data-json-obj="true"> <span class="span_txt">%</span></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //프로모션 유형 적용방법 -->
        </form>
    </div>

    <div class="right_areaStyle">
        <!-- 프로모션 대상 고객 -->
        <section class="group">
            <div class="header_area pt0">
                <h2 class="title_basic"><spring:message code='gloabl.title.promotionTargetCust' /></h2><!-- 프로모션 대상 고객 -->
                <div class="btn_right">
                    <button class="btn_xs" id="btnAddCust" ><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                    <button class="btn_xs" id="btnDelCust" ><spring:message code='global.btn.rowDel' /></button><!-- 삭제 -->
                    <button class="btn_xs" id="btnExcelImport"><spring:message code="global.btn.excelImport" /></button>
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="custGrid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>
        <!-- //프로모션 대상 고객 -->

        <!-- 프로모션 대상 차종 -->
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='gloabl.title.promotionTargetCarline' /></h2><!-- 프로모션 대상 차종 -->
            </div>
            <!-- 조회 조건 시작 -->
            <div class="header_area pt0">
                <!-- 검색조건 -->
                <div class="left_area ml0">
                    <ul class="txt_input mt0">
                        <li>
                            <span class="span_bg"><spring:message code='global.lbl.targetCarline' /></span><!-- 대상차종 -->
                            <input id="carlineCd" type="text"  style="width:146px;">
                        </li>
                    </ul>
                </div>
                <!-- //검색조건 -->
                <!-- 버튼 -->
                <div class="btn_right">
                    <button class="btn_xs " id="btnSearchR"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </div>
                <!-- //버튼 -->
            </div>
            <div class="clfix">
                <div class="left_areaStyle" style="width:45%">
                    <div class="table_grid">
                        <div id="searchModelGrid"></div>
                    </div>
                </div>
                <ul class="promotion_btn pt_v1">
                    <li><button class="btn_s btn_next" id="btnAddR"></button></li>
                    <li><button class="btn_s btn_prev" id="btnDelR"></button></li>
                </ul>
                <div class="right_areaStyle" style="width:45%">
                    <div class="table_grid">
                        <div id="targetModelGrid"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //프로모션 대상 차종 -->
        </div>
    </div>
</section>
</div>



<!-- script -->
<script type="text/javascript">

var promotionUploadPopupWin;


/**
 * 차종 콤보
 */
var carlineList = [];
<c:forEach var="obj" items="${carlineNames}">
carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

/**
 * 프로모션 유형
 */
var promotionTpList = [];
<c:forEach var="obj" items="${promotionTpInfo}">
promotionTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var promotionTpArr = dms.data.arrayToMap(promotionTpList, function(obj){return obj.cmmCd});

/**
 * 승인여부
 */
var approveCdList = [];
<c:forEach var="obj" items="${approveCdInfo}">
approveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var approveCdArr = dms.data.arrayToMap(approveCdList, function(obj){return obj.cmmCd});

/**
 * 적용방법 SAL132
 */
var applyTpList = [];
<c:forEach var="obj" items="${applyTpInfo}">
applyTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var applyTpArr = dms.data.arrayToMap(applyTpList, function(obj){return obj.cmmCd});

/**
 * 대상 계약유형 SAL003
 */
var contractTpList = [];
<c:forEach var="obj" items="${contractTpInfo}">
contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var contractTpArr = dms.data.arrayToMap(contractTpList, function(obj){return obj.cmmCd});



/**
 * 프로모션주관
 */
var promotionOwnDs = [];
<c:forEach var="obj" items="${promotionOwnList}">
promotionOwnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var promotionOwnMap = dms.data.arrayToMap(promotionOwnDs, function(obj){return obj.cmmCd});



$(document).ready(function() {
    var dlrCd;                  //딜러코드
    var promotionCd;            //프로모션코드
    var resetYn = "LAOD";       //초기화여부

    fnInit();

    // 본문 팝업 설정
    $("#callPromotionWindow").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.promotionMng' />"      // 프로모션 관리
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");


    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                fn_gridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    /**
     * 차종 콤보박스
     */
    $("#carlineCd").kendoExtDropDownList({
      dataTextField:"carlineNm"
      ,dataValueField:"carlineCd"
      ,dataSource:carlineList
      ,optionLabel:" "
    });
    $("#carlineCd").on("change", function (){
        var grid = $("#searchModelGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.data([]);
        grid.dataSource.read();
    });


    //조회조건 - 적용시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 적용종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 프로모션유형선택 SAL010
    $("#sPromotionTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:promotionTpList
        ,optionLabel:" "  // 선택
    });


    //승인여부 유형  SAL131
    //조회조건 - 승인여부선택
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:approveCdList
        ,optionLabel:" "  // 선택
    });

    /*************************** 검색조건 END ******************************************/


    //상세내용 - 적용시작일
    $("#startDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //상세내용 - 적용종료일
    $("#endDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //상세내용 - 시작일, 종료일
    $("#startDt").on('change', {from:$("#startDt"), to:$("#endDt")}, salesJs.event.fnChkSearchDate);
    $("#endDt").on('change',   {from:$("#startDt"), to:$("#endDt")}, salesJs.event.fnChkSearchDate);

    //상세내용 - 프로모션유형선택
    $("#promotionTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:promotionTpList
        ,optionLabel:" "  // 선택
    });


    //상세내용 - 승인여부선택
    $("#approveCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:approveCdList
        ,optionLabel:" "  // 선택
    });




    //상세내용 - 프로모션주관
    $("#promotionOwnCd").kendoExtDropDownList({
      dataTextField:"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:promotionOwnDs
      ,index:1
    });

    /****************************** 상세내용 END***************************************/



    //승인
    $("#btnApproval").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var data = grid.dataSource.view();
            var selectIdx = grid.select().index();

            if(data.length == 0){
                dms.notification.warning("<spring:message code='global.info.noSearchDataMsg'/>");
                //조회된 데이터가 없습니다.
                return false;
            }else {
                if(selectIdx ==  -1 ){
                    dms.notification.warning("<spring:message code='sal.lbl.promotionData' var='promotionData' /><spring:message code='global.info.validation.select' arguments='${promotionData}' />");
                    //프로모션을 선택해 주십시오.
                    return false;
                }
            }


            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];


            if( selectVal.approveCd == "C" ){
                dms.notification.warning("<spring:message code='sal.info.approveSuccess' />");
                //이미 심사승인 처리 되였습니다.
                return false;
            }else if( selectVal.approveCd != "B" ){
                dms.notification.warning("<spring:message code='sal.info.applyStatMsg' />");
                //상태가 '승인신청'일 경우만 심사 가능합니다.
                return false;
            }

            var params = {};
            params["dlrCd"] = selectVal.dlrCd;                  // 딜러코드
            params["promotionCd"] = selectVal.promotionCd;      // 프로모션코드


            // 승인 하시겠습니까?
            if (confirm("<spring:message code='global.btn.approval' var='approval' /><spring:message code='global.info.cnfrmMsg' arguments='${approval},' />") == false ){
                return false;
            }

            $.ajax({
                url:"<c:url value='/sal/prm/promotion/promotionApproval.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(params),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    $("#callPromotionWindow").data("kendoWindow").close();
                    //승인이 완료되었습니다.
                    dms.notification.warning("<spring:message code='global.btn.approval' var='approval' /><spring:message code='global.info.successMsg' arguments='${approval},' />");
                }
            });


        }

    });



    //승인요청
    $("#btnApprovalReq").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var data = grid.dataSource.view();
            var selectIdx = grid.select().index();

            if(data.length == 0){
                dms.notification.warning("<spring:message code='global.info.noSearchDataMsg'/>");
                //조회된 데이터가 없습니다.
                return false;
            }else {
                if(selectIdx ==  -1 ){
                    dms.notification.warning("<spring:message code='sal.lbl.promotionData' var='promotionData' /><spring:message code='global.info.validation.select' arguments='${promotionData}' />");
                    //프로모션을 선택해 주십시오.
                    return false;
                }
            }


            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if( selectVal.approveCd == "C" ){
                dms.notification.warning("<spring:message code='sal.info.approveSuccess' />");
                //이미 심사승인 처리 되였습니다.
                return false;
            }else if( selectVal.approveCd == "B" ){
                dms.notification.warning("<spring:message code='global.lbl.applyReg' var='approval' /><spring:message code='global.info.successMsg' arguments='${approval},' />");
                //승인요청이 완료되었습니다.
                return false;
            }else if( selectVal.approveCd != "A" ){
                dms.notification.warning("<spring:message code='sal.info.applyReqStatMsg' />");
                //상태가 '입력'일 경우만 심사요청이 가능합니다.
                return false;
            }



            var params = {};
            params["dlrCd"] = selectVal.dlrCd;                  // 딜러코드
            params["promotionCd"] = selectVal.promotionCd;      // 프로모션코드


            // 승인요청 하시겠습니까?
            if (confirm("<spring:message code='global.lbl.applyReg' var='approval' /><spring:message code='global.info.cnfrmMsg' arguments='${approval},' />") == false ){
                return false;
            }

            $.ajax({
                url:"<c:url value='/sal/prm/promotion/approvalReqPromotion.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(params),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    $("#callPromotionWindow").data("kendoWindow").close();
                    //승인요청이 완료되었습니다.
                    dms.notification.warning("<spring:message code='global.lbl.applyReg' var='approval' /><spring:message code='global.info.successMsg' arguments='${approval},' />");
                }
            });
        }

    });



    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndDt").focus();
               return false;
            }
            
            resetYn = 'READ';
            fnReset();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });




    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {

            //프로모션유형
            if($("#promotionTp").data("kendoExtDropDownList").value() == ''){
                dms.notification.warning("<spring:message code='global.lbl.promotionType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#promotionTp").focus();
                return false;
            }

            //프로모션명
            if ( dms.string.isEmpty($("#promotionNm").val())){
                dms.notification.warning("<spring:message code='global.lbl.promotionNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#promotionNm").focus();
                return false;
            }

            //프로모션 기간
            if ( dms.string.isEmpty($("#startDt").val()) || dms.string.isEmpty($("#endDt").val())){
                dms.notification.warning("<spring:message code='sal.info.promotionTime'/>");
                return false;
            }

            //대상계약유형
            var contractTpList = "";
            var cnt = 0;
            $.each(contractTpDataSet, function(idx, obj) {
                if($("#contractTp"+idx).is(":checked") == true ){
                    contractTpList += $("#contractTp"+idx).val()+",";
                    cnt = cnt+1;
                }
            });
            if ( cnt == 0){
                dms.notification.success("<spring:message code='global.lbl.contractTpArea' var='contractTp' /><spring:message code='global.info.emptyCheckParam' arguments='${contractTp}' />");
                return false;
            }


            if(!$("#promotionCd").val() == ''){

                if( $("#approveCd").val() != "A" ){
                    dms.notification.warning("<spring:message code='sal.info.applyInputStatMsg' />");
                    //'입력'상태일 경우에만 수정이 가능합니다.
                    return false;
                }

            }

            var custGrid = $("#custGrid").data("kendoExtGrid");
            var targetModelGrid = $("#targetModelGrid").data("kendoExtGrid");
            var saveData1 = custGrid.getCUDData("insertList", "updateList", "deleteList");
            var saveData2 = targetModelGrid.getCUDData("insertList", "updateList", "deleteList");


            // form 데이터 및 그리드 변경 데이터 세팅
            var param = $.extend(
               {"promotionVO":$("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"))}
               ,{"contractTp":contractTpList }
               ,{"custVO":saveData1}
               ,{"modelVO":saveData2}
            );

            param.promotionVO.startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
            param.promotionVO.endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();

            //if(custGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/prm/promotion/multiSavePromotion.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.notification.error(request.responseJSON.errors[0].errorMessage);
                    }
                }).done(function(result) {
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#callPromotionWindow").data("kendoWindow").close();
                    //수정이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.btn.update' var='update' /><spring:message code='global.info.successMsg' arguments='${update},' />");
                });
            //}
        }
    });

    //삭제
    $("#btnDel").kendoButton({
        //icon:"close",
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var data = grid.dataSource.view();
            var selectIdx = grid.select().index();

            if(data.length == 0){
                dms.notification.warning("<spring:message code='global.info.noSearchDataMsg'/>");
                //조회된 데이터가 없습니다.
                return false;
            }else {
                if(selectIdx ==  -1 ){
                    dms.notification.warning("<spring:message code='sal.lbl.promotionData' var='promotionData' /><spring:message code='global.info.validation.select' arguments='${promotionData}' />");
                    //프로모션을 선택해주십시오.
                    return false;
                }
            }

            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if( selectVal.approveCd != "A" ){
                dms.notification.warning("<spring:message code='sal.info.applyInputDeleteMsg' />");
                //'입력'상태일 경우에만 삭제 가능합니다.
                return false;
            }

            // 삭제하시겠습니까?
            if (confirm("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />") == false ){    //삭제하시겠습니까?
                return false;
            }else {


                var data = {};
                data["dlrCd"] = selectVal.dlrCd;                  // 딜러코드
                data["promotionCd"] = selectVal.promotionCd;      // 프로모션코드


                $.ajax({
                    url:"<c:url value='/sal/prm/promotion/deletePromotion.do' />",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    data:JSON.stringify(data),
                    error:function(jqXHR,status,error){
                        console.log(jqXHR);
                    },
                    success:function(data){
                        grid.dataSource.read();
                        fnReset();
                        $("#callPromotionWindow").data("kendoWindow").close();
                        //삭제가 완료되었습니다.
                        dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.successMsg' arguments='${del},' />");
                    }
                });
            }
        }
    });


    //신규
    $("#btnReset").kendoButton({
        click:function(e){

            //초기화여부
            resetYn = "RESET";

            fnReset();
            //var grid = $("#grid").data("kendoExtGrid");
            //grid.clearSelection();

            viewDetailPopup();  // 상세팝업
        }
    });



    /************* 대상 고객 관련버튼 이벤트 ****************************************/

    //버튼 - 추가
    $("#btnAddCust").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            if(resetYn == "READ" && grid.select().index() == -1){
                dms.notification.warning("<spring:message code='global.lbl.promotion' var='promotion' /><spring:message code='global.info.validation.select' arguments='${promotion},' />");
                //프로모션을 선택해주세요.
                return false;
            }else {
                $("#custGrid").data("kendoExtGrid").dataSource.insert(0, {
                    "dlrCd":dlrCd
                    ,"promotionCd":promotionCd
                    ,"custCd":""
                });
            }
        }
    });







    // 삭제
    $("#btnDelCust").kendoButton({
        click:function(e){
            var custGrid = $("#custGrid").data("kendoExtGrid");
            var rows = custGrid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            rows.each(function(index, row) {
                custGrid.removeRow(row);
            });

        }
    });

    /************ 대상 고객 관련버튼 이벤트 END *****************************************/





    /************* 대상 차종 관련 버튼 이벤트 ****************************************/

    //대상차종 조회
    $("#btnSearchR").kendoButton({
        click:function(e){
            $('#searchModelGrid').data('kendoExtGrid').dataSource.read();
        }
    });


    // 추가
    $("#btnAddR").kendoButton({
        click:function(e){
            var grid = $("#searchModelGrid").data("kendoExtGrid");
            var selectRows = grid.select();

            if(selectRows.length > 0){

                $.each(selectRows, function(idx, val){
                    var data = grid.dataItem(val);

                    if(!isTargetModelGrid(data.modelCd)){
                        $('#targetModelGrid').data('kendoExtGrid').dataSource.insert(idx, {
                             modelCd   : data.modelCd
                            ,modelNmNc : data.modelNmNc
                            ,modelNm   : data.modelNm
                        });
                    }
                });

            }
        }
    });

    // 추가 시, vehicleItemList2에  데이터가 존재 유무 체크.
    function isTargetModelGrid(item){
        var flag = false;
        var grid2 = $('#targetModelGrid').data('kendoExtGrid');
        var rows = grid2.tbody.find("tr");

        rows.each(function(index, row){
            var data = grid2.dataItem(row);

            if(item == data.modelCd){
                flag = true;
            }
        });
        return flag;
    }


    // 삭제
    $("#btnDelR").kendoButton({
        click:function(e){
            var targetGrid = $("#targetModelGrid").data("kendoExtGrid");
            var rows = targetGrid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            rows.each(function(index, row) {
                targetGrid.removeRow(row);
            });

        }
    });



    //버튼 - 일괄등록
    $("#btnExcelImport").kendoButton({
        click:function(e) {
            if($("#promotionCd").val() == ""){
                //dms.notification.warning("Import할 대상고객의 프로모션을 선택해주세요.");
                dms.notification.warning("请先选择需要Iport的促销客户对象");
                return false;
            }

            promotionUploadPopupWin = dms.window.popup({
                title:"促销客户对象"                 //프로모션 대상고객
                ,windowId:"promotionUploadPopupWin"
                ,height:360
                ,width:800
                ,content:{
                    url:"<c:url value='/sal/prm/promotion/uploadPopupMain.do'/>",
                    data:{
                        "promotionCd":promotionCd
                        ,"dlrCd":dlrCd
                        ,"callbackFunc":function(){
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });




    /************* 대상 차종 관련 버튼 이벤트 ****************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115002"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/prm/promotion/selectPromotion.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sPromotionTp"] = $("#sPromotionTp").val();      // 프로모션 유형
                        params["sApproveCd"] = $("#sApproveCd").val();          // 승인여부
                        params["sStartDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();              // 프로모션기간-시작일
                        params["sEndDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();                  // 프로모션기간-종료일


                        //params["sGb"] = "C";
                        //params["sModelCd"] = "B3S4N361F   G";
                        //params["sContractDt"] = "20160206";
                        //params["sDlrCd"] = "A07AA";

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"promotionCd"
                    ,fields:{
                        promotionCd :{type:"string"}
                        ,promotionNm:{type:"string"}
                        ,promotionTp:{type:"string"}
                        ,approveCd  :{type:"string"}
                        ,startDt    :{type:"date"}
                        ,endDt      :{type:"date"}
                        ,applyTp    :{type:"string"}
                        ,promotionAmt:{type:"number"}
                        ,promotionOwnCd:{type:"string"}
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        //,height:450
        ,pageable:false
        ,editable:false
        //,autoBind:false
        /*
        ,change:function(e) {

            if(e.sender.dataSource._data.length != 0){

                if(this.select().length == 1){
                    var selectedVal = this.dataItem(this.select());


                    $("#promotionTp").data("kendoExtDropDownList").value(selectedVal.promotionTp);
                    $("#approveCd").data("kendoExtDropDownList").value(selectedVal.approveCd);
                    $("#promotionCd").val(selectedVal.promotionCd);
                    $("#promotionNm").val(selectedVal.promotionNm);
                    $("#startDt").data("kendoExtMaskedDatePicker").value(selectedVal.startDt);
                    $("#endDt").data("kendoExtMaskedDatePicker").value(selectedVal.endDt);
                    $("#imsBudnRate").val(selectedVal.imsBudnRate);
                    $("#dlrBudnRate").val(selectedVal.dlrBudnRate);
                    $("#remark").val(selectedVal.remark);
                    $("#applyTp").val(selectedVal.applyTp);
                    $("#promotionOwnCd").data("kendoExtDropDownList").value(selectedVal.promotionOwnCd);
                    if(selectedVal.applyTp == 'R'){//정률(비율)
                        $("#promotionAmt2").val(selectedVal.promotionAmt);
                        $("#promotionAmt1").val(0);
                        $("#btnAmt").attr("class", "");
                        $("#btnRate").attr("class", "on");
                        $("#amtDiv").attr("style", "display:none");
                        $("#rateDiv").attr("style", "display:display");
                    }else if(selectedVal.applyTp == 'F'){//정액(금액)
                        $("#promotionAmt1").val(selectedVal.promotionAmt);
                        $("#promotionAmt2").val(0);
                        $("#btnAmt").attr("class", "on");
                        $("#btnRate").attr("class", "");
                        $("#amtDiv").attr("style", "display:display");
                        $("#rateDiv").attr("style", "display:none");
                    }

                    //대상계약유형 체크박스
                    $("#contractTpAll").prop("checked",false);
                    if(selectedVal.contractTp != null && selectedVal.contractTp != ""){
                        var listData = selectedVal.contractTp.split(",");
                        $.each(contractTpDataSet, function(idx, obj) {
                            for(var i=0; i < listData.length; i++){
                                $("#contractTp"+idx).prop("checked",obj.cmmCd == listData[i] ? true:false);
                                if(obj.cmmCd == listData[i]){
                                    break;
                                }
                            }
                        });
                    }else {
                        //대상 판매유형 체크박스.
                        $.each(contractTpDataSet, function(idx, obj) {
                            $("#contractTp"+idx).prop("checked",false);
                        });
                    }


                    dlrCd = selectedVal.dlrCd;
                    promotionCd = selectedVal.promotionCd;

                    $('#searchModelGrid').data('kendoExtGrid').dataSource.data([]);
                    $('#custGrid').data('kendoExtGrid').dataSource.page(1);
                    $('#targetModelGrid').data('kendoExtGrid').dataSource.page(1);
               }
            }
        }
        */
        ,columns:[
             {field:"promotionTp",    title:"<spring:message code='global.lbl.promotionType' />",width:130, attributes:{"class":"al"}  //프로모션 유형
                ,template:"# if(promotionTpArr[promotionTp] != null) { # #= promotionTpArr[promotionTp].cmmCdNm# # }#"
             }
            ,{field:"promotionNm",   title:"<spring:message code='global.lbl.promotionNm' />",  width:150, attributes:{"class":"al"}} //프로모션명
            ,{field:"approveCd",     title:"<spring:message code='global.lbl.approveYn' />",    width:80,  attributes:{"class":"ac"}  //승인여부
                ,template:"# if(approveCdArr[approveCd] != null) { # #= approveCdArr[approveCd].cmmCdNm# # }#"
             }
            ,{field:"startDt",       title:"<spring:message code='global.lbl.startDt' />",      width:80,  attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //시작일
            ,{field:"endDt",         title:"<spring:message code='global.lbl.EndDt' />",        width:80,  attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //종료일
            ,{field:"applyTp",       title:"<spring:message code='global.lbl.applyTp' />",      width:80,  attributes:{"class":"ac"}, template:"#= applyTpArr[applyTp].cmmCdNm #"} //적용방법
            ,{field:"promotionAmt",  title:"<spring:message code='global.lbl.amtSaleRate' />",  width:100, attributes:{"class":"ar"}, format:"{0:##,###.0}"} //금액/할인율
            ,{field:"promotionOwnCd",title:"<spring:message code='sal.lbl.promotionOwn' />",    width:80, attributes:{"class":"ac"}
                ,template:"# if(promotionOwnMap[promotionOwnCd] != null) { # #= promotionOwnMap[promotionOwnCd].cmmCdNm# # }#"
             } //프로모션주관
        ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        fn_gridDBclick(selectedItem);
        viewDetailPopup();
    });
    fn_gridDBclick = function(selectedVal){
        if( selectedVal != null && selectedVal != 'undefined'){

            $("#promotionTp").data("kendoExtDropDownList").value(selectedVal.promotionTp);
            $("#approveCd").data("kendoExtDropDownList").value(selectedVal.approveCd);
            $("#promotionCd").val(selectedVal.promotionCd);
            $("#promotionNm").val(selectedVal.promotionNm);
            $("#startDt").data("kendoExtMaskedDatePicker").value(selectedVal.startDt);
            $("#endDt").data("kendoExtMaskedDatePicker").value(selectedVal.endDt);
            $("#imsBudnRate").val(selectedVal.imsBudnRate);
            $("#dlrBudnRate").val(selectedVal.dlrBudnRate);
            $("#remark").val(selectedVal.remark);
            $("#applyTp").val(selectedVal.applyTp);
            $("#promotionOwnCd").data("kendoExtDropDownList").value(selectedVal.promotionOwnCd);
            if(selectedVal.applyTp == 'R'){//정률(비율)
                $("#promotionAmt2").val(selectedVal.promotionAmt);
                $("#promotionAmt1").val(0);
                $("#btnAmt").attr("class", "");
                $("#btnRate").attr("class", "on");
                $("#amtDiv").attr("style", "display:none");
                $("#rateDiv").attr("style", "display:display");
            }else if(selectedVal.applyTp == 'F'){//정액(금액)
                $("#promotionAmt1").val(selectedVal.promotionAmt);
                $("#promotionAmt2").val(0);
                $("#btnAmt").attr("class", "on");
                $("#btnRate").attr("class", "");
                $("#amtDiv").attr("style", "display:display");
                $("#rateDiv").attr("style", "display:none");
            }

            //대상계약유형 체크박스
            $("#contractTpAll").prop("checked",false);
            if(selectedVal.contractTp != null && selectedVal.contractTp != ""){
                var listData = selectedVal.contractTp.split(",");
                $.each(contractTpDataSet, function(idx, obj) {
                    for(var i=0; i < listData.length; i++){
                        $("#contractTp"+idx).prop("checked",obj.cmmCd == listData[i] ? true:false);
                        if(obj.cmmCd == listData[i]){
                            break;
                        }
                    }
                });
            }else {
                //대상 판매유형 체크박스.
                $.each(contractTpDataSet, function(idx, obj) {
                    $("#contractTp"+idx).prop("checked",false);
                });
            }


            dlrCd = selectedVal.dlrCd;
            promotionCd = selectedVal.promotionCd;

            $('#searchModelGrid').data('kendoExtGrid').dataSource.data([]);
            $('#custGrid').data('kendoExtGrid').dataSource.page(1);
            $('#targetModelGrid').data('kendoExtGrid').dataSource.page(1);
        }
    }



    //대상고객 그리드 설정
    $("#custGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/prm/promotion/selectPromotionCust.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;                  // 딜러코드
                        params["sPromotionCd"] = promotionCd;      // 프로모션코드

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"regDt"
                    ,fields:{
                         dlrCd :{type:"string"}
                        ,promotionCd:{type:"string"}
                        ,custCd:{type:"string"}
                        ,custNm:{type:"string"}
                        ,regDt :{type:"date"}
                        ,updtDt:{type:"date"}
                    }
                }
            }
        }
        ,height:184
        ,pageable:false
        ,autoBind:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,filterable:false
        ,columns:[
                    {field:"custCd", title:"<spring:message code='global.lbl.custNo' />", width:120//고객코드
                        ,attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                            if(!options.model.isNew()){
                                container.context.innerText = options.model.custCd
                                return ;
                            }
                            $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectBpPopupWindow();"></a></div>')
                            .appendTo(container)
                          }
                     }
                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />",   width:180, attributes:{"class":"ac"}}  //고객명
                   ]
    });


    //조회모델 그리드
    $("#searchModelGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/prm/promotion/selectPromotionModel.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        //params["dlrCd"] = dlrCd;                               // 딜러코드
                        //params["sPromotionCd"] = promotionCd;                   // 프로모션코드
                        params["carlineCd"] = $("#carlineCd").val();           // 차량코드

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"modelCd"
                    ,fields:{
                        modelCd:{type:"string"}
                       ,modelNmNc:{type:"string"}
                       ,modelNm:{type:"string"}
                    }
                }
            }
        }
        ,height:161
        ,pageable:false
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,multiSelectWithCheckbox:true
        ,columns:[
                    {field:"modelNm", title:"<spring:message code='sal.lbl.searchModel' />",    width:100, attributes:{"class":"al"}} //조회모델명
                   ]
    });



    //대상모델 목록 그리드
    $("#targetModelGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/prm/promotion/selectPromotionTargetModel.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;                               // 딜러코드
                        params["sPromotionCd"] = promotionCd;                   // 프로모션코드
                        params["sCarlineCd"] = $("#carlineCd").val();           // 차량코드

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"regDt",
                    fields:{
                        dlrCd   :{type:"string"}
                       ,promotionCd:{type:"string"}
                       ,modelCd :{type:"string"}
                       ,modelNmNc :{type:"string"}
                       ,modelNm:{type:"string"}
                       ,regDt   :{type:"date"}
                       ,updtDt  :{type:"date"}
                    }
                }
            }
        }
        ,height:161
        ,pageable:false
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,multiSelectWithCheckbox:true
        ,columns:[
                    {field:"modelNm", title:"<spring:message code='global.lbl.targetModel' />",    width:100, attributes:{"class":"al"}} //대상모델명
                   ]
    });






});

function fnInit(){
/*
    var data = [{"codeCd":"N","codeNm":"일반판매"}
               ,{"codeCd":"P","codeNm":"선출고"}
               ,{"codeCd":"G","codeNm":"집단판매"}
               ];
*/
    //대상계약유형 SAL003
    var innerHtml = "";
    //var data = dms.data.getUsrCodeList(false , "USL003");
    contractTpDataSet = contractTpList;
    if(contractTpDataSet.length > 0){
        innerHtml +="<label class='label_check' for='contractTpAll' title='<spring:message code='global.lbl.all' />'>"
                  + "<input type='checkbox' id='contractTpAll' name='contractTpAll' class='form_check' onClick='chkAll(this.id)' />&nbsp;" + "<spring:message code='global.lbl.all' />"
                  + "</label>";
        $.each(contractTpList, function(idx, obj) {
            innerHtml +="<label class='label_check' for='contractTp" + idx + "' title='" + obj.cmmCdNm + "'>"
                      + "<input type='checkbox' name='contractTp' id='contractTp" + idx + "' class='form_check' value=" + obj.cmmCd + " />&nbsp;" + obj.cmmCdNm
                      + "</label>";
        });
    }
    $("#contractTpArea").html(innerHtml);
}

//상세내용 팝업 호출
function viewDetailPopup(){
    var win = $("#callPromotionWindow").data("kendoWindow").center().open();
}

function chkAll(id){
    var chk = $("#"+id).is(":checked");//.attr('checked');
    var grpId = "";
    var dataS = "";
    if(id == 'contractTpAll') {
        grpId = 'contractTp';
        dataS = contractTpDataSet;
    }

    if(chk) {
        $.each(dataS, function(idx, obj) {
            $("#"+grpId+idx).prop("checked",true);
        });
    }else  {
        $.each(dataS, function(idx, obj) {
            $("#"+grpId+idx).prop("checked",false);
        });
    }
}



//초기화
function fnReset() {
    $("#promotionTp").data("kendoExtDropDownList").value("");
    $("#approveCd").data("kendoExtDropDownList").value("A");
    $("#startDt").data("kendoExtMaskedDatePicker").value("");
    $("#endDt").data("kendoExtMaskedDatePicker").value("");

    //대상 판매유형 체크박스.
    $.each(contractTpDataSet, function(idx, obj) {
        $("#contractTp"+idx).prop("checked",false);
    });

    $("#imsBudnRate").val("");
    $("#dlrBudnRate").val("");
    $("#remark").val("");
    $("#bpGroup").val("01");
    $("#amt").val(0);
    $("#rate").val(0);
    $("#promotionCd").val("");
    $("#promotionNm").val("");
    $("#applyTp").val("F");
    $("#promotionAmt1").val(0);
    $("#promotionAmt2").val(0);
    $("#carlineCd").data("kendoExtDropDownList").value("");

    $('#custGrid').data('kendoExtGrid').dataSource.data([]);
    $('#searchModelGrid').data('kendoExtGrid').dataSource.data([]);
    $('#targetModelGrid').data('kendoExtGrid').dataSource.data([]);

    var grid = $("#grid").data("kendoExtGrid");
    grid.clearSelection();
}



//적용방법 버튼
function btnClick(btn){
    if(btn == "R"){
        $("#btnAmt").attr("class", "");
        $("#btnRate").attr("class", "on");
        $("#applyTp").val("R");
        $("#amtDiv").attr("style", "display:none");
        $("#rateDiv").attr("style", "display:display");
    }else if(btn == "F"){
        $("#btnAmt").attr("class", "on");
        $("#btnRate").attr("class", "");
        $("#applyTp").val("F");
        $("#amtDiv").attr("style", "display:display");
        $("#rateDiv").attr("style", "display:none");
    }
}



var popupWindow;
//고객 팝업 열기 함수.
function selectBpPopupWindow(){
  popupWindow = dms.window.popup({
      windowId:"bpCdPopup"
      ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
      ,content:{
          url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
          ,data:{
              "type":"custom1"
              , "closeYn":"Y"
              ,"autoBind":true
              ,"callbackFunc":function(data){
                  var grid = $('#custGrid').data('kendoExtGrid');
                  var dataItems = grid.dataSource._data;
                  var checkVal = true;

                  // 중복값 체크
                  $.each(dataItems, function(idx, obj){
                      if(data[0].custCd == obj.subBpCd){
                          checkVal = false;
                      }
                  });
                  if(checkVal){
                      var dataItem = grid.dataItem(grid.select());

                      dataItem.custCd = data[0].custNo;
                      dataItem.custNm = data[0].custNm;
                      grid.refresh();
                  }
                  //popupWindow.close();
              }
          }
      }
  });
}


</script>
<!-- //script -->
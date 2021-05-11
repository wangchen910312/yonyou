<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약종합조회 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.contractTot' /></h1> <!-- 계약종합조회 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10967" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnBlueLinkPrint" type="button" class="btn_m"><spring:message code='sal.btn.saleBlueLink' /></button>   <!-- Bluelink 버튼,   이거 이름 바껴야함  -->
                <button id="btnSaleAccountPrint" type="button" class="btn_m"><spring:message code='sal.btn.saleAccountPrint' /></button>   <!-- 완성차판매정산서 -->
                <button id="btnSanbaoPrint" type="button" class="btn_m" style="display:none;"><spring:message code='ser.btn.sanbaoPrint' /></button>   <!-- 삼포증 -->
                <button id="btnViewPrint" type="button" class="btn_m"><spring:message code='sal.btn.giDoc' /></button>           <!-- 출고증 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10764" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10763" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th>  <!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" class="form_comboBox" />
                    </td>
                    <%-- <th scope="row"><spring:message code='global.lbl.contractDt' /></th> --%>        <!-- 계약일자 -->
                    <th scope="row" class="th_form"><input id="tSearchDt" class="form_comboBox" style="width:70%"></th>        <!-- 계약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>  <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" maxlength="17" class="form_input" style="text-transform:uppercase;"/>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>      <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.channelType" /></th>  <!-- 채널유형 -->
                    <td>
                        <input id="sDstbChnCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrOrg" /></th>    <!-- 2급딜러 -->
                    <td>
                        <input id="sLv2DlrOrgCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <%-- <dms:access viewId="" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_s" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
            <%-- </dms:access> --%>
        </div>
    </div>

    <!-- 계약내역 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="contGrid" class="resizable_grid"></div>
    </div>
    <!-- 계약내역 그리드 종료 -->
</section>
</div>
<!-- //계약관리 -->

<!-- hidden값  -->
<span style="display:none">

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedContractNo" value="" />

</span>
</section>
<!-- //계약관리 화면 -->

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";
var langCd = "${lang}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

//임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//계약상태 SAL002
var contractStatCdList = [];
var contractStatCdArray = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    <c:if test="${obj.cmmCd ne '10' and obj.cmmCd ne '90' }">
        contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    contractStatCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var searchDSList = [];
var contDtNm = "<spring:message code='global.lbl.contractDt' />";       // 계약일자
var deliveryDtNm = "<spring:message code='sal.lbl.deliveryDt' />";      // 소매일자
var cancleDtNm = "<spring:message code='global.lbl.cancDt' />";         // 취소일자
searchDSList.push({"cmmCd":"01", "cmmCdNm":contDtNm});
searchDSList.push({"cmmCd":"02", "cmmCdNm":deliveryDtNm});
searchDSList.push({"cmmCd":"03", "cmmCdNm":cancleDtNm});

//할인레벨 :SAL156
/* var dcLvlCdObj = {};
<c:forEach var="obj" items="${dcLvlCdDS}">
    dcLvlCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach> */

//여부(Y/N) COM020
/* var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
 */

//채널유형 COM072
var dstbChnList = [];
<c:forEach var="obj" items="${dstbChnDs}">
    dstbChnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//2급딜러 리스트
var lvTwoDlrList = [];
<c:forEach var="obj" items="${lvTwoDlrDs}">
    lvTwoDlrList.push({"cmmCd":"${obj.sdlrCd}", "cmmCdNms":"${obj.sdlrNms}", "cmmCdNm":"${obj.sdlrNm}"});
</c:forEach>

var popupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(contractStatCdList)
       ,optionLabel:"<spring:message code='sal.lbl.all' />"   //전부
    });

    //날짜검색조건 텍스트
    $("#tSearchDt").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:searchDSList,
        value:"01"
    });

    // 계약/소매 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:threeMonthDay
    });

    // 계약/소매 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 계약시작일은 계약종료일보다 클수가 없다.
    //$("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);
    //$("#sEndDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);

    // 채널유형
    $("#sDstbChnCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(dstbChnList)
       ,optionLabel:" "
    });

    // 2급딜러
    $("#sLv2DlrOrgCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNms"
       ,dataValueField :"cmmCd"
       ,dataSource:lvTwoDlrList
       ,optionLabel:" "
    });

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(true);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(false);
    }

    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                if(grid.select().length > 1){
                    //목록을 1건만 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }else{
                    viewDetailPopup(selectedItem);
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    $("#btnViewPrint").kendoButton({    // 출고증
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){

                if(grid.select().length == 1){
                    if(selectedItem.contractStatCd != "50"){
                        // 고객인도 상태에서만 출고증출력이 가능합니다.
                        dms.notification.info("<spring:message code='sal.info.giSettlementPrintMsg' />");
                        return;
                    }else{
                        viewPrintPopup(selectedItem);
                    }
                }else{
                    //목록을 1건만 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    $("#btnSaleAccountPrint").kendoButton({    // 완성차판매정산서
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){

                if(grid.select().length == 1){
                    if(selectedItem.contractStatCd != "50"){
                        // 고객인도 상태에서만 출고증출력이 가능합니다.
                        dms.notification.info("<spring:message code='sal.info.giCheckPrintMsg' />");
                        return;
                    }else{
                        var iReportParam = "&sDlrCd="+selectedItem.dlrCd+"&sContractNo="+selectedItem.contractNo;
                        var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectContractSalesAccountPrint.cpt' />"+iReportParam;
                        var newWindow=open(iReportUrl, "<spring:message code='sal.btn.saleAccountPrint' />", 'top=0,left=0,width=800,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
                    }
                }else{
                    //목록을 1건만 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });


    $("#btnSanbaoPrint").kendoButton({    // 삼포증
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){

                if(grid.select().length == 1){
                    if(selectedItem.contractStatCd != "50"){
                        // 고객인도 상태에서만 출고증출력이 가능합니다.
                        dms.notification.info("<spring:message code='sal.info.giCheckPrintMsg' />");
                        return;
                    }else{
                        var iReportParam = "";
                        if($("#vinNo").val() != ""){
                            iReportParam = "&sVinNo="+selectedItem.vinNo;
                        }
                        var iReportUrl = "<c:url value='/ReportServer?reportlet=ser/selectSanbaoDocRpt.cpt' />"+iReportParam;
                        var newWindow=open(iReportUrl, "<spring:message code='ser.btn.sanbaoPrint' />", 'top=0,left=0,width=800,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
                    }
                }else{
                    //목록을 1건만 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    // 블루 링크 버튼
    $("#btnBlueLinkPrint").kendoButton({
         enable:false
        ,click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){

                if(grid.select().length == 1){
                    if(selectedItem.contractStatCd != "50"){
                        dms.notification.info("<spring:message code='global.lbl.custDelivery' var='globalLblCustDelivery' /><spring:message code='sal.btn.saleBlueLink' var='salBtnSaleBlueLink' /><spring:message code='sal.info.chkStatConfirm' arguments='${globalLblCustDelivery},${salBtnSaleBlueLink}' />");
                        return;
                    }else{
                        var iReportUrl = "https://bhmc.hyundaibluelink.com.cn/dlw/dlwInstance.do";
                        iReportUrl += "?userId="+selectedItem.saleEmpNo+"&userPw="+selectedItem.saleEmpPw+"&cnttNo="+selectedItem.contractNo+"&pgmCd=P0032&refrPgmCd=P0033&csmc=B&natCd="+langCd+"";
                        var newWindow=open(iReportUrl, "<spring:message code='sal.info.BlueLink' />", 'top=0,left=0,toolbar=yes,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
                    }
                }else{
                    //목록을 1건만 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    $("#btnSearch").kendoButton({ // 조회
         enable:true,
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

             $('#contGrid').data('kendoExtGrid').dataSource.page(1);
         }
    });


    if('${orderNo}' != ""){
        reSearch('${orderNo}');
    }

  //엑셀버튼
    $("#btnExcel").kendoButton({

        click:function(e){

            dms.ajax.excelExport({
                "beanName"         :"contractProgressService"
                ,"templateFile"    :"ContractProgressList_Tpl.xlsx"
                ,"fileName"        :"<spring:message code='sal.title.contractTot' />.xlsx"
                ,"sDlrCd"          :dlrCd
                ,"sSaleEmpNo"      :$("#sSaleEmpNo").val()
                ,"sContractCustNm" :$("#vContractCustNm").val()
                ,"sContractCustNo" :$("#sContractCustNo").val()
                ,"sContractStatCd" :$("#sContractStatCd").val()
                ,"sComboDt"        :$("#tSearchDt").data("kendoExtDropDownList").value()
                ,"sStartDt"        :dms.string.strNvl(kendo.toString(kendo.parseDate($("#sStartDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sEndDt"          :dms.string.strNvl(kendo.toString(kendo.parseDate($("#sEndDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sVinNo"          :$("#sVinNo").val()
                ,"savedContractNo" :$("#savedContractNo").val()
                ,"sDstbChnCd"      :$("#sDstbChnCd").data("kendoExtDropDownList").value()
                ,"sLv2DlrOrgCd"    :$("#sLv2DlrOrgCd").data("kendoExtDropDownList").value()
            });
        }
    });

   // 메인 그리드
    $("#contGrid").kendoExtGrid({
        gridId :"G-SAL-1025-0013112"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractProgress/selectContractProgressSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 고객명
                        params["sContractCustNm"] = $("#vContractCustNm").val();
                        //고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        // 계약상태
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        //계약일자 , 소매일자, 취소일자
                        params["sComboDt"] = $("#tSearchDt").data("kendoExtDropDownList").value();
                        // 계약일자
                        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndDt"]   = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                        // vin no
                        params["sVinNo"] = $("#sVinNo").val().toUpperCase();
                        // 채널유형
                        params["sDstbChnCd"] = $("#sDstbChnCd").data("kendoExtDropDownList").value();
                        // 2급딜러
                        params["sLv2DlrOrgCd"] = $("#sLv2DlrOrgCd").data("kendoExtDropDownList").value();

                        // 계약번호
                        params["savedContractNo"] = $("#savedContractNo").val();
                        params["sContractNo"] = $("#sContractNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"contractNo",
                    fields :{
                         rnum          :{type :"number", editable:false} //딜러코드
                        ,dlrCd         :{type :"string"}
                        ,contractNo    :{type :"string"}                //계약번호
                        ,contractDt    :{type :"date"}                  //계약일자
                        ,realDlDt    :{type :"date"}                    //소매일자
                        ,contractStatNm :{type :"string"}               //계약상태
                        ,contractCustNo :{type :"string"}               //계약고객번호
                        ,custNm         :{type :"string"}
                        ,vinNo      :{type :"string"}                   //VIN NO
                        ,carlineCd  :{type :"string"}                   //차종코드
                        ,carlineNm  :{type :"string"}                   //차종명
                        ,fscCd      :{type :"string"}                   //모델코드
                        ,fscNm      :{type :"string"}                   //모델명
                        ,ocnCd      :{type :"string"}                   //OCN코드
                        ,ocnNm      :{type :"string"}                   //OCN명
                        ,extColorCd :{type :"string"}                   //외장색상코드
                        ,extColorNm :{type :"string"}                   //외장색
                        ,intColorCd :{type :"string"}                   //내장색상코드
                        ,intColorNm :{type :"string"}                   //내장색명
                        ,cnclDt    :{type :"date"}                      //해약일자
                        ,saleEmpNo  :{type :"string"}                   //판매사원번호
                        ,saleEmpNm  :{type :"string"}                   //판매사원명
                        ,dstbChnNm  :{type :"string"}                   //채널유형
                        ,lv2DlrYn   :{type :"string"}                   //2급딜러여부
                        ,lv2DlrOrgNm:{type :"string"}                   //2급딜러명
                        ,realCarAmt :{type :"number"}                   //순차량금액
                        ,realPayAmt :{type :"number"}                   //실제지불금액
                        ,dcApproveYn:{type :"string"}                   //할인레벨승인여부
                        ,dcLvlCd    :{type :"string"}                   //할인레벨코드
                    }
                }
            }
        }
        ,dataBound :function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var saveContNo = $("#savedContractNo").val();

            if(saveContNo != ""){
                var rows = e.sender.tbody.children();

                var selectRow
                  , grid = $("#contGrid").data("kendoExtGrid");

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.contractNo == saveContNo){

                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                         grid.select(selectRow);
                    }
                });
            }
            $("#savedContractNo").val("");      // 초기화
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default :false
       ,appendEmptyColumn:false           //빈컬럼 적용. default :false
       ,enableTooltip:false              //Tooltip 적용, default :false
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "80", "100", "200"]
       }
       ,height:434
       ,editable:false
       ,resizable:true
       ,autoBind:true
       ,selectable:"row"
       ,navigatable:true
       ,sortable:{mode:"single"}
       ,change:function(e){
           var dataItem = this.dataItem(this.select());
           if(this.select().length == 1
                   && dms.string.strNvl(dataItem.contractStatCd) == "50"
                   && dms.string.isNotEmpty(dataItem.saleEmpNo)
                   && dms.string.isNotEmpty(dataItem.saleEmpPw)){
               $("#btnBlueLinkPrint").data("kendoButton").enable(true);
           }else{
               $("#btnBlueLinkPrint").data("kendoButton").enable(false);
           }
        }
       ,columns :[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:50, attributes:{"class":"ac"}}  //번호
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:120}               //계약번호
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}  //계약일
          ,{field:"realDlDt", title:"<spring:message code='sal.lbl.deliveryDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}  //소매일자
          ,{field:"contractStatNm", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90
            ,template:function(dataItem){
                if(dataItem.contractStatCd == "10"){
                    return "<span class='txt_label bg_yellow'>" + dataItem.contractStatNm + "</span>";
                }else if(dataItem.contractStatCd == "20"){
                    return "<span class='txt_label bg_green'>" + dataItem.contractStatNm + "</span>";
                }else if(dataItem.contractStatCd == "50"){
                    return "<span class='txt_label bg_blue'>" + dataItem.contractStatNm + "</span>";
                }else if(dataItem.contractStatCd == "90" || dataItem.contractStatCd == "91"){
                    return "<span class='txt_label bg_red'>" + dataItem.contractStatNm + "</span>";
                }
                return contractStatNm;
            }
          }    //계약상태
          ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}             //계약고객번호
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"al"}, width:150}    //vinNo
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:100}                       //고객명
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", attributes:{"class":"al"}, width:60}    //차종코드
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", attributes:{"class":"al"}, width:100}     //차종명
          ,{field:"fscCd", title:"modelCd", hidden:true, attributes:{"class":"al"}}            //모델코드
          ,{field:"fscNm", title:"<spring:message code='global.lbl.model' />", attributes:{"class":"al"}, width:150}   //모델명
          ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />", attributes:{"class":"al"}, width:60}    //OCN코드
          ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />", attributes:{"class":"al"}, width:150}     //OCN명
          ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", attributes:{"class":"al"}, width:80}     //외장색코드
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", attributes:{"class":"al"}, width:140}    //외장색명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", attributes:{"class":"al"}, width:80}     //내장색상코드
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", hidden:true}                       //내장색명
          ,{field:"cnclDt", title:"<spring:message code='sal.lbl.cnclDt' />", attributes:{"class":"ac"}, width:90, format:"{0:<dms:configValue code='dateFormat' />}"}  //해제일자
          ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.saleEmpNo' />", hidden:true}                     //판매사원번호
          ,{field:"saleEmpNm", title:"<spring:message code='sal.lbl.saleEmp' />", attributes:{"class":"al"}, width:90 , attributes:{"class":"ac"}} //판매사원명
          ,{field:"dstbChnNm", title:"<spring:message code='sal.lbl.channelType' />", attributes:{"class":"al"}, width:100}          // 채널유형
          ,{field:"lv2DlrOrgNm", title:"<spring:message code='global.lbl.lv2DlrNm' />", attributes:{"class":"al"}, width:100}          // 2급딜러명
          ,{field:"retlAmt", title:"<spring:message code='sal.lbl.carRetlAmt' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}" }    //지도가:공장지도가
          ,{field:"realCarAmt", title:"<spring:message code='sal.lbl.realCarAmts' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}" }    //순차량금액
          ,{field:"realPayAmt", title:"<spring:message code='sal.lbl.realPayAmt' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}"}       // 실제지불금액
          ,{field:"dcApproveYn", title:"<spring:message code='sal.lbl.dcApproveYn' />", attributes:{"class":"ac"}, width:100,hidden:true }  // 제한가격초과여부
          ,{field:"dcApproveYnNm", title:"<spring:message code='sal.lbl.dcApproveYn' />", attributes:{"class":"ac"}, width:100 , attributes:{"class":"ac"}, hidden:true}  // 제한가격초과여부
          ,{field:"dcLvlCd", title:"<spring:message code='sal.lbl.dcLvlCd' />", attributes:{"class":"ac"}, width:70, hidden:true }       // 할인레벨
          ,{field:"dcLvlCdNm", title:"<spring:message code='sal.lbl.dcLvlCd' />", attributes:{"class":"ac"}, width:80, attributes:{"class":"ac"}, hidden:true}       // 할인레벨
       ]
   });

    // 그리드 더블클릭.
   $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#contGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       viewDetailPopup(selectedItem);
   });


});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/

// 검색조건
function reSearch(contNo){
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    $("#savedContractNo").val(contNo);  // 계약번호
    $("#sContractNo").val("");          // 계약번호
    $("#vContractCustNm").val("");
    $("#sContractCustNm").val("");
    $("#sContractCustNo").val("");
    $("#sContractStatCd").data("kendoExtDropDownList").value("");  // 계약상태
    $("#tSearchDt").data("kendoExtDropDownList").value("01");  // 계약상태
    $("#sStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sEndDt").data("kendoExtMaskedDatePicker").value("");
    $("#sVinNo").val("");
}

// 상세내용 팝업 호출
function viewDetailPopup(data){
    var windowHeight = $(window).innerHeight();
    var vHeight = 0;
    if(windowHeight >= 870){
        vHeight = 770;
    }else if(windowHeight >= 800){
        vHeight = 625;
    }else if(windowHeight >= 580){
        vHeight = 500;
    }else{
        vHeight = 450;
    }

    var sDlrCd = dlrCd
      , sContractNo  = "";

    if(typeof(data) != "undefined"){
        sDlrCd = data.dlrCd;
        sContractNo  = data.contractNo;
    }

    mainPopupWindow = dms.window.popup({
        windowId:"contractMntPopup"
        ,title:"<spring:message code='sal.title.retailContractOrd' />"      // 계약관리
        //,width :950
        ,width :1100
        ,height:vHeight
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/cnt/contractMnt/selectContractMntPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sDlrCd":sDlrCd                   // 딜러코드
                ,"sContractNo":sContractNo         // 딜러명
                ,"sStatCd":"900"                   // 팝업 조회만
                ,"callbackFunc":function(data){
                    if (data.msg == "save"){
                        reSearch(data.cntNo);

                        if( typeof(data.cntTp) != "undefined"){
                            if(data.cntTp == "01"){ $("#cntTp01").click(); }
                        }
                        $('#contGrid').data('kendoExtGrid').dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                 }
            }
        }
    });
}

//출고증 팝업 호출
function viewPrintPopup(data){
    var sDlrCd = dlrCd
    , sContractNo  = "";

    if(typeof(data) != "undefined"){
      sDlrCd = data.dlrCd;
      sContractNo  = data.contractNo;
    }

    var printItemUrl = "<c:url value='/ReportServer?reportlet=sale/selectSaleGiDocPrint.cpt&sDlrCd="+sDlrCd+"&sContractNo="+sContractNo+"' />";
    var newWindow=open(printItemUrl,"<spring:message code='sal.btn.giDoc' />",'top=0,left=0,width=925,height=600,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
}

//고객명 enter

$("#vContractCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter
/*
$("#vContractCustNm").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {

            bf_searchCustomer();
        }
    }else{
        cleanCustCheck();
    }
});
*/

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vContractCustNm").val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
        $("#sContractCustNo").val('');
        $("#sContractCustNm").val('');
    }
}


//CRM 고객 조회
bf_searchCustomer = function(){
    //전체권한자는 고객전체 검색 가능.
    var sMngScId = "";
    if(saleAdminYn != "Y"){
        sMngScId = userId;
    }

    var responseJson = {};
    if( dms.string.trim($("#vContractCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vContractCustNm").val(), "sMngScId":sMngScId})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sContractCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vsContractCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":dms.string.isEmpty($("#vContractCustNm").val())?false:true
                    , "closeYn":"Y"
                    , "custNm":$("#vContractCustNm").val()
                    , "mngScId":sMngScId
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vContractCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

/********************************
 ** 자식 popup에서 호출
 ********************************/

//2급딜러조회
function bf_searchSecondDealerSearchPopup(obj)  {
    if( obj["lv2DlrYn"] != "Y" ){
        return ;
    }
    popupWindow = dms.window.popup({
        windowId :"secondDealerSearchPopupWin"    // 2급딜러조회 팝업
        ,title :"<spring:message code='sal.title.secondGradeDlrInfo'/>"   // 2급딜러정보
        ,content :{
            url :"<c:url value='/sal/btc/secondDealer/selectSecondDealerSearchPopup.do'/>"
            ,data:{
                "autoBind":false
                , "lv2DlrCd" : obj["lv2DlrOrgCd"]
                ,"callbackFunc" :function(data){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_searchSecondDealerSearchPopupCallBack(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

//고객조회
function bf_pSearchCustomer(obj) {

    popupWindow = dms.window.popup({
        windowId :"customerSearchPopup"
        , title :"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        , content :{
            url :"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data :{
                "autoBind" :true
                , "custNm" :obj["sIdNm"]
                , "closeYn":"Y"
                , "type"   :null
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_customerSet(data);
                    }
                //    popupWindow.close();
                }
            }
        }
    });
}

// 신차 vin no조회
function bf_pSearchVinNo(obj) {

    popupWindow = dms.window.popup({
        windowId :"vinNoContractPopup"
        , title :"<spring:message code='sal.title.carSearch' />"   // 차량조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractMnt/selectContractReVinNoSearchPopup.do'/>"
            , data :{
                "autoBind" :false
                , "type"   :null
                , "sDlrCd" :obj["sDlrCd"]
                , "sCarlineCd" :obj["sCarlineCd"]
                , "sCarlineNm" :obj["sCarlineNm"]
                , "sModelCd" :obj["sModelCd"]
                , "sModelNm" :obj["sModelNm"]
                , "sOcnCd" :obj["sOcnCd"]
                , "sOcnNm" :obj["sOcnNm"]
                , "sExtColorCd" :obj["sExtColorCd"]
                , "sExtColorNm" :obj["sExtColorNm"]
                , "sIntColorCd" :obj["sIntColorCd"]
                , "sIntColorNm" :obj["sIntColorNm"]
                , "sVinNo" :obj["sVinNo"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_vinNoSet(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });

}

// 우편번호 찾기
function bf_pSearchZipCode(obj){

    zipCodeSearchPopupWin = dms.window.popup({
        windowId :"zipCodeSearchPopupWin"
        , title :"<spring:message code='cmm.title.zipcode.search' />"   // 우편번호 조회
        , modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data :{
                "autoBind" :true
                , "sZipCd":obj["sZipCd"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        data[0].custTp = obj["custTp"];
                        iframeWindowObject.bf_custZipCodeSearchCallBack(data);
                    }
                    zipCodeSearchPopupWin.close();
                }
            }
        }
    });
}

// 용품조회
function bf_pSearchGoodsSearchPopup(obj){

    popupWindow = dms.window.popup({
        windowId:"goodsItemSearchPopup"
        ,width:700
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":obj["dlrCd"]
                , "sCarlineCd" :obj["carlineCd"]
                , "sGoodsCd"   :obj["goodsCd"]
                , "sPkgItemCd" :obj["pkgItemCd"]
                ,"callbackFunc":function(data, type){
                    var windowElement = $("#contractMntPopup");
                    var iframeDomElement = windowElement.children("iframe")[0];
                    var iframeWindowObject = iframeDomElement.contentWindow;
                    iframeWindowObject.bf_goodsSearchPopupCallBack(data, type);

                    popupWindow.close();
                }
            }
        }
    });
}

// 중고차 vin no 조회 검색
function bf_pSearchUsedCarVinNo(obj){

    popupWindow = dms.window.popup({
        windowId :"VinNoContractPopup"
        , title :"<spring:message code='sal.title.usedCarSearch' />"   // 중고차조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractRe/selectContractReUsedCarSearchPopup.do'/>"
            , data :{
                "autoBind" :true
                , "type"   :null
                , "sDlrCd" :obj["sDlrCd"]
                , "sVinNo" :obj["sVinNo"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_searchUsedCarVinNoCallBack(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

//-->
</script>
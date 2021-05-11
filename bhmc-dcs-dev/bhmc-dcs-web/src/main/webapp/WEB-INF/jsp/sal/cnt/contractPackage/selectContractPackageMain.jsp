<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 집단판매 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.contPackage' /></h1>    <!-- 집단판매 -->
        <div class="btn_right">
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            <button id="btnRefresh" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dealer" /></th>        <!-- 딜러 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sDlrCd" readonly class="form_input form_readonly" />
                                    <a href="javascript:bf_dealerSearchPopup();"><spring:message code='global.btn.search' /></a>    <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sDlrNm" readonly class="form_input form_readonly" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractType' /></th>      <!-- 계약유형 -->
                    <td>
                        <input id="sContractTp" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>       <!-- 판매담당자 -->
                    <td class="readonly_area">
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" class="form_input" />
                                    <a href="javascript:bf_searchCustomer('search');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" readonly class="form_input form_readonly" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                    <td>
                        <input id="sCustTp" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.grpContractNo' /></th>       <!-- 그룹계약번호 -->
                    <td>
                        <input id="sGrpContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th>       <!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="contGrid"></div>
    </div>
</section>
<!-- //집단판매 -->


<section id="callContractPackageWindow" class="pop_wrap">
<form id="contForm" name="contForm" method="POST">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnPayPrint"  type="button" class="btn_m" style="display:none"><spring:message code='sal.btn.payPrint' /></button>             <!-- 결산서출력 -->
            <button id="btnContPrint" type="button" class="btn_m" style="display:none"><spring:message code='sal.btn.contPrint' /></button>            <!-- 계약서출력 -->
            <button id="btnCancel"    type="button" class="btn_m" style="display:none"><spring:message code='sal.btn.contCancel' /></button>           <!-- 해약 -->
            <button id="btnApproval"  type="button" class="btn_m" style="display:none"><spring:message code='global.btn.fix' /></button>               <!-- 확정 -->
            <button id="btnSave"      type="button" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>                          <!-- 저장 -->
            <button id="btnUpdate"    type="button" class="btn_m btn_modify" style="display:none"><spring:message code='global.btn.update' /></button> <!-- 수정 -->
        </div>
    </div>

    <!-- 계약상세정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.retailContractDetail' /></h2>       <!-- 계약상세정보 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:9%;">
                    <col style="width:13%;">
                    <col style="width:9%;">
                    <col style="width:27%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                        <td>
                            <input id="grpContractNo" name="grpContractNo" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <input id="contractDt" name="contractDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.saleOpptSeq' /></th>        <!-- 판매기회번호 -->
                        <td>
                            <input id="saleOpptSeq" name="saleOpptSeq" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.lv2DlrYn' /></th>        <!-- 2급딜러여부 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:24%;">
                                    <input id="lv2DlrYn" name="lv2DlrYn" class="form_comboBox" data-json-obj="true">
                                </div>
                                <div class="form_left" style="width:30%;">
                                    <div class="form_search">
                                        <input id="lv2DlrOrgCd" name="lv2DlrOrgCd" class="form_input" data-json-obj="true">
                                        <!-- 개발진행 예정중입니다. -->
                                        <a href="javascript:alert('<spring:message code='global.info.developIng' />')"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                    </div>
                                </div>
                                <div class="form_right" style="width:46%;">
                                    <input id="lv2DlrOrgNm" readonly class="form_input form_readonly" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.salesMngNo' /></th> <!-- 영업대표 -->
                        <td>
                            <input id="saleMngNm" name="saleMngNm" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.payTp' /></th>   <!-- 지불방식 -->
                        <td>
                            <input id="payTp" name="payTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th>      <!-- 인도요청일 -->
                        <td>
                            <input id="dlReqDt" name="dlReqDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractType' /></th>              <!-- 계약유형 -->
                        <td>
                            <input id="contractTp" name="contractTp" readonly class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>   <!-- 판매담당자 -->
                        <td>
                            <input id="saleEmpNo" name="saleEmpNo" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"></th>
                        <td colspan="5"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약상세정보 -->

    <!-- 고객정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.custinfo' /></h2>         <!-- 고객정보 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:21%;">
                    <col style="width:7%;">
                    <col style="width:8%;">
                    <col style="width:7%;">
                    <col style="width:12%;">
                    <col style="width:8%;">
                    <col style="width:27%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="contractCustNo" name="contractCustNo" readonly class="form_input" data-json-obj="true" />
                                        <a href="javascript:bf_searchCustomer('cust');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custNm" name="custNm" readonly class="form_input form_readonly" data-json-obj="true" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>   <!-- 고객유형 -->
                        <td>
                            <input id="custTpNm" readonly class="form_input form_readonly ac" />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 대표전화번호 -->
                        <td class="readonly_area">
                            <input id="telNo1" name="telNo1" readonly class="form_input" data-json-obj="true" />
                            <input type="hidden" id="telNo2" name="telNo2" data-json-obj="true" />     <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>  <!-- 신분증유형 -->
                        <td>
                            <div class="form_float">
                                <div id="cust_01" class="form_left readonly_area" style="width:40%;">
                                    <input id="ssnCrnTp_01" readonly class="form_comboBox" />
                                </div>
                                <div id="cust_02" class="form_left readonly_area" style="display:none; width:40%;">
                                    <input id="ssnCrnTp_02" readonly class="form_comboBox" />
                                </div>
                                <div class="form_right" style="width:60%;">
                                    <input id="ssnCrnNo" name="ssnCrnNo" readonly class="form_input form_readonly" data-json-obj="true" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //고객정보 -->

    <!-- 차량정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2>   <!-- 차량정보 -->
            <div class="btn_right">
                <button type="button" id="btnCarAdd" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>     <!-- 행추가 -->
                <button type="button" id="btnCarDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>     <!-- 행삭제 -->
                <button type="button" id="btnCarCancel" class="btn_s"><spring:message code='global.btn.cancel' /></button>  <!-- 취소 -->
            </div>
        </div>
        <div class="table_grid">
            <div id="carGrid"></div>
        </div>
        <div class="table_form mt10">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:90%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.remark' /></th>        <!-- 비고 -->
                        <td>
                            <textarea id="remark" name="remark" rows="2" cols="" class="form_textarea" data-json-obj="true"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량정보 -->


<!-- hidden값  -->
<span style="display:none">
   <!-- 고객유형 -->
   <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

   <!--
        계약상태:SAL029
        10      계약생성
        20      계약확정
        90      계약해약
    -->
   <input id="contractStatCd" name="contractStatCd" data-json-obj="true" />

   <!-- 저장 후 선택될 그룹계약번호 -->
   <input id="savedGrpContractNo"/>

   <!-- 차종수량 -->
   <input id="carlineCnt" name="carlineCnt" data-json-obj="true" />

   <!-- 차량수량 -->
   <input id="carCnt" name="carCnt" data-json-obj="true" />

   <!-- 총판매 금액 -->
   <input id="totSaleAmt" name="totSaleAmt" data-json-obj="true" />

   <!-- 딜러코드:차종 조회용 -->
   <input id="dlrCd" />

</span>

</form>
</section>

<script>
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
//yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
//HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var vCustNo = "";               // 검색 조회 고객

//집단계약생성 전 데이터
var bfObj = {};

//차종조회
var carLineCdDSList = [];
var carLineCdObj = {};
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};

// 그리드 OCN 콤보 DataSource
var ocnCdDSList = [];
var ocnCdObj = {};

// 그리드 외장색 콤보 DataSource
var extColorCdDSList = [];
var extColorCdObj = {};

// 그리드 내장색 콤보 DataSource
var intColorCdDSList = [];
var intColorCdObj = {};

//판매사원 리스트
var selectSaleEmpDSList = [];
var selectSaleEmpObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
    selectSaleEmpObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];       // 집단 판매만.
var contractTpObj = {};        // 그리드용
<c:forEach var="obj" items="${contractTpDS}">
    <c:if test="${obj.cmmCd eq 'G'}">
        sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// CRM001:고객유형 (01:개인, 02:법인)
var sCustTpDSList = [];
<c:forEach var="obj" items="${custTpDS}">
    sCustTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//집단 계약상태 SAL029
var contractStatCdDSList = [];
var contractStatCdObj = {};
<c:forEach var="obj" items="${contractStatCdDS}">
  contractStatCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  contractStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//지불방식:SAL071
var amtPayTpDSList = [];
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//여부(Y/N) COM020
var ynList = [];
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//주요인증문서유형(신분증유형):CRM024
var ssnCrnTpPList = [];        // remark1 - P:개인
var ssnCrnTpCList = [];        // remark1 - C:법인
<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>


var popupWindow;
var dealerSearchPopupWin;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callContractPackageWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.retailContractDetail' />"      // 계약상세정보
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");


    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                fn_contGridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });


    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            if( ($("#sStartContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndContractDt").data("kendoExtMaskedDatePicker").value() == null)
              ||($("#sEndContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartContractDt").data("kendoExtMaskedDatePicker").value() == null)){
              //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }

            $('#contGrid').data('kendoExtGrid').dataSource.read();
            refreshAll();
            fn_btnState();  // 버튼상태
        }
   });

   // 저장
   $("#btnSave").kendoButton({
       enable:true,
       click:function(e){

          popupWindow = dms.window.popup({
              windowId:"messagePopup"
              ,title:false
              ,width :300
              ,height:110
              ,modal:true
              ,content:{
                  url:"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                  ,data:{
                      "type":null
                      ,"autoBind":false
                      , msg:"<spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />"
                      , btnMsg01:"<spring:message code='global.btn.save' />"
                      , btnMsg02:"<spring:message code='global.btn.cancel' />"
                      ,"callbackFunc":function(data){
                          if (data.msg == "01"){
                              save('create');
                           }else{
                               return false;
                           }
                       }
                  }
              }
          });
       }
   });

   // 수정
   $("#btnUpdate").kendoButton({
       enable:true,
       click:function(e){

           popupWindow = dms.window.popup({
               windowId:"messagePopup"
               ,title:false
               ,width :300
               ,height:110
               ,modal:true
               ,content:{
                   url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                   ,data:{
                       "type":null
                       ,"autoBind":false
                       , msg:"<spring:message code='global.lbl.update' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />"
                       , btnMsg01:"<spring:message code='global.btn.update' />"
                       , btnMsg02:"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc":function(data){
                           if (data.msg == "01"){
                               save('update');
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });
       }
   });

   $("#btnRefresh").kendoButton({ // 초기화
       click:function(e){
           refreshAll();
           fn_btnState();  // 버튼상태
           viewDetailPopup();  // 상세팝업.
       }
   });

   // 생성
   $("#btnApproval").kendoButton({
       enable:true,
       click:function(e){

           if($("#grpContractNo").val() == ""){
               // 대상을 선택하십시오.
               dms.notification.info("<spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.validation.select' arguments='${globalLblRcpeNm}' />");
               return false;
           }

           if(bfObj == null ){
               var formData = $("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"));
               var v_Flag = false;
               $.each(formData, function(key, value){
                   if( bfObj[key] != value ){
                       v_Flag = true;
                   }
               });

               if(v_Flag){
                   // 변경사항이 있습니다.<br />수정처리 이후 다시 계약생성을 하여 주십시오.
                   dms.notification.info("<spring:message code='sal.info.conCreateChkMsg' />");
                   return false;
               }
           }

           var gridList = $("#carGrid").data("kendoExtGrid").getCUDData("iList", "uList", "dList");
           if(    gridList.iList.length > 0
               || gridList.uList.length > 0
               || gridList.dList.length > 0){

               // 변경사항이 있습니다.<br />수정처리 이후 다시 계약생성을 하여 주십시오.
               dms.notification.info("<spring:message code='sal.info.conCreateChkMsg' />");
               return false;
           }

           // 계약생성
           if( $("#contractStatCd").val() == "10" ){

               popupWindow = dms.window.popup({
                   windowId:"messagePopup"
                   ,title:false
                   ,width :300
                   ,height:110
                   ,modal:true
                   ,content:{
                       url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                       ,data:{
                           "type":null
                           ,"autoBind":false
                               // xxxx(계약)를(을) 생성 하시겠습니까?
                           , msg:"("+$("#grpContractNo").val() +")"+" <spring:message code='sal.info.contractCreateMsg' />"
                           , btnMsg01:"<spring:message code='sal.btn.contractCreate' />"
                           , btnMsg02:"<spring:message code='global.btn.cancel' />"
                           ,"callbackFunc":function(data){
                               if (data.msg == "01"){
                                   approval();
                               }else{
                                    return false;
                                }
                            }
                       }
                   }
               });

           }else{
               // 저장시에만 계약생성이 가능합니다.
               dms.notification.info("<spring:message code='sal.info.checkContractSave' />");
           }
       }
   });

   // 계약생성 단계일시만 가능
   $("#btnCancel").kendoButton({  // 해약
       click:function(e){

           if($("#grpContractNo").val() == ""){
               // 대상을 선택하십시오.
               dms.notification.info("<spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.validation.select' arguments='${globalLblRcpeNm}' />");
               return false;
           }

           popupWindow = dms.window.popup({
               windowId:"messagePopup"
               ,title:false
               ,width :330
               ,height:90
               ,modal:true
               ,content:{
                   url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                   ,data:{
                       "type":null
                       ,"autoBind":false
                                // xxxx(계약번호) 계약을 취소 하시겠습니까??
                       , msg:"("+$("#grpContractNo").val() +")"+ "<spring:message code='sal.info.contractClose' />"
                       , btnMsg01:"<spring:message code='global.lbl.del' />"
                       , btnMsg02:"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc":function(data){
                           if (data.msg == "01"){
                               cancel();
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });

       }
   });

   $("#btnContPrint").kendoButton({//계약서출력
       click:function(e){
           // 계약서출력 개발진행 예정중입니다.
           alert("<spring:message code='sal.btn.contPrint' /> <spring:message code='global.info.developIng' />");
       }
   });

   $("#btnPayPrint").kendoButton({//계약서출력
       click:function(e){
           // 결산서출력 개발진행 예정중입니다.
           alert("<spring:message code='sal.btn.payPrint' /> <spring:message code='global.info.developIng' />");
       }
   });

   $("#btnCarAdd").kendoButton({   // 차량 - 행추가
        click:function(e){

            /*
            var grid = $("#carGrid").data("kendoExtGrid");
            var rows = grid.select();
            if (rows.length >= 1) {
                var selectRow = grid.dataItem(grid.select());
                if(selectRow.modelCd == ""
                    || selectRow.ocnCd == ""
                    || selectRow.extColorCd == ""
                    || selectRow.intColorCd == ""
                   ){
                    return false;
                }
            }
            */

            $('#carGrid').data('kendoExtGrid').dataSource.insert(0, {
                 dlrCd:dlrCd
                 ,grpContractNo:""
                 ,seq:0
                 ,carlineCd  :""
                 ,carlineNm  :""
                 ,modelCd    :""
                 ,modelNm    :""
                 ,ocnCd      :""
                 ,ocnNm      :""
                 ,extColorCd :""
                 ,extColorNm :""
                 ,intColorCd :""
                 ,intColorNm :""
                 ,retlPrc    :0
                 ,promotionNo:""
                 ,promotionAmt:0
                 ,carCnt     :0
                 ,realCarAmt :0
                 ,realPayAmt :0
            });

            var grid = $("#carGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr:eq(0)").closest('tr');
            rows.addClass("k-state-selected");

        }
    });

   $("#btnCarDel").kendoButton({      // 차량 - 행삭제
       click:function(e){
           var grid = $("#carGrid").data("kendoExtGrid");
           var rows = grid.select();

           if (rows.length < 1) {
               //목록을 선택하여 주십시오.
               dms.notification.info("<spring:message code='global.info.required.select'/>");
               return;
           }

           rows.each(function(index, row) {
               grid.removeRow(row);
           });
       }
   });

   $("#btnCarCancel").kendoButton({    // 차량 - 취소
       click:function(e) {
           $('#carGrid').data('kendoExtGrid').cancelChanges();
       }
   });

   $("#custTp").val("01");       // 계약자 고객유형
   $("#sContractCustNo").on('change', fnCheckCustValue);
   $("#sDlrCd").val(dlrCd);        // 딜러코드
   $("#sDlrNm").val(dlrNm);        // 딜러명

   //판매담당자
   $("#sSaleEmpNo").kendoExtDropDownList({
       dataTextField:"saleEmpNm"
      ,dataValueField:"saleEmpCd"
      ,dataSource:selectSaleEmpDSList
      ,optionLabel:" "
   });

   // 계약유형
   $("#sContractTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:sContractTpList
       ,optionLabel:" "
   });

   // 고객유형
   $("#sCustTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:sCustTpDSList
      ,optionLabel:" "
   });

   // 계약상태
   $("#sContractStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractStatCdDSList
       ,optionLabel:" "
    });

   // 계약 시작일
   $("#sStartContractDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });

   // 계약 종료일
   $("#sEndContractDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

   // 계약시작일은 계약종료일보다 클수가 없다.
   $("#sStartContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);
   $("#sEndContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);


   // 계약일
   $("#contractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

   // 2급딜러여부
   $("#lv2DlrYn").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ynList
      ,index:0
   });

   // 영업대표
   $("#saleMngNm").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:[{"cmmCd":"", "cmmCdNm":"", "useYn":""}, {"cmmCd":"", "cmmCdNm":"", "useYn":""}]
   });

   // 지불방식
   $("#payTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:amtPayTpDSList
      ,optionLabel:" "
   });

   // 인도요청일
   $("#dlReqDt").kendoExtMaskedDatePicker({
     //value:toDay,
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 계약유형
   $("#contractTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:sContractTpList
      ,index:0
   });

   // 판매담당자
   $("#saleEmpNo").kendoExtDropDownList({
       dataTextField:"saleEmpNm"
      ,dataValueField:"saleEmpCd"
      ,dataSource:selectSaleEmpDSList
      ,optionLabel:" "
   });

   $("#custTpNm").val("<spring:message code='global.lbl.personal' />");     // 개인

   // 개인:신분증유형
   $("#ssnCrnTp_01").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ssnCrnTpPList
      ,optionLabel:" "
   });

   // 법인:법인유형
   $("#ssnCrnTp_02").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ssnCrnTpCList
      ,optionLabel:" "
   });

   // 메인 그리드
   $("#contGrid").kendoExtGrid({
       gridId:"G-SAL-0721-113321"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/cnt/contractPackage/selectContractPackageSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};
                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       // 딜러코드
                       params["sDlrCd"] = $("#sDlrCd").val();
                       // 계약유형
                       params["sContractTp"] = $("#sContractTp").data("kendoExtDropDownList").value();
                       // 판매사원
                       params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                       // 고객
                       params["sContractCustNo"] = $("#sContractCustNo").val();
                       // 고객 유형
                       params["sCustTp"] = $("#sCustTp").data("kendoExtDropDownList").value();
                       // 그룹계약번호
                       params["sGrpContractNo"] = $("#sGrpContractNo").val();
                       // 계약상태
                       params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                       // 계약일자
                       params["sStartContractDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                       params["sEndContractDt"]   = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();

                       return kendo.stringify(params);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch:false
           ,schema:{
               model:{
                   id:"grpContractNo",
                   fields:{
                        dlrCd         :{type:"string", editable:false} //딜러코드
                       ,grpContractNo :{type:"string"}               //그룹계약번호
                       ,contractDt    :{type:"date"}                 //계약일
                       ,contractTp    :{type:"string"}               //계약유형
                       ,contractStatCd:{type:"string"}               //계약상태
                       ,contractCustNo:{type:"string"}               //계약고객번호
                       ,custNm        :{type:"string"}
                       ,saleEmpNm     :{type:"string"}               //판매사원이름
                       ,carlineCnt    :{type:"number"}               //차종수량
                       ,carCnt        :{type:"number"}               //차량수량
                       ,totSaleAmt    :{type:"number"}               //총판매금액
                   }
               }
           }
       }
       ,dataBound:function(e) {
           // 저장시에만 계약번호가 1회 들어있음.
           var saveContNo = $("#savedGrpContractNo").val();

           if(saveContNo != ""){
               var rows = e.sender.tbody.children();

               $.each(rows, function(idx, row){
                   var dataItem = e.sender.dataItem(row);
                   if(dataItem.grpContractNo == saveContNo){
                       fn_contGridDBclick(dataItem);
                   }
               });
           }
           $("#savedGrpContractNo").val("");      // 초기화
       }
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
      ,appendEmptyColumn:true           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,pageable:{
          refresh:true
          ,pageSize:20
          //,pageSizes:[ "20", "40", "80", "100", "all" ]
          ,pageSizes:[ "20", "40", "80", "100" ]
      }
      ,height:434
      ,editable   :false
      ,resizable:true
      ,autoBind:false
      ,selectable:"row"
      ,navigatable:true
      //,sortable:false
      //,edit:onEditMainCd
      ,columns:[
         {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}         // 딜러코드
         ,{field:"grpContractNo", title:"<spring:message code='sal.lbl.grpContractNo' />", width:100}      //그룹번호
         ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}      //계약일
         ,{field:"contractTp", title:"<spring:message code='global.lbl.contractType' />", attributes:{"class":"ac"}, width:90, template:"#= dms.string.strNvl(contractTpObj[contractTp])#" }    //계약유형
         ,{field:"contractStatCd", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90, template:"#= dms.string.strNvl(contractStatCdObj[contractStatCd]) #" }    //계약상태
         ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}             //계약고객번호
         ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"ac"}, width:100}                    //고객명
         ,{field:"saleEmpNm", title:"<spring:message code='global.lbl.saleEmpNo' />", hidden:true, width:10}    //판매사원번호
         ,{field:"carlineCnt", title:"<spring:message code='sal.lbl.carlineCnt' />", attributes:{"class":"ar"}, width:80, format:"{0:n0}"}    //차종수량
         ,{field:"carCnt", title:"<spring:message code='sal.lbl.carCnt' />", attributes:{"class":"ar"}, width:80, format:"{0:n0}"}            //차량수량
         ,{field:"totSaleAmt", title:"<spring:message code='sal.lbl.payTotAmt' />", attributes:{"class":"ar"}, width:80,format:"{0:n2}"}      //총판매금액
      ]
  });


   // 그리드 더블클릭.
  $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
      var grid = $("#contGrid").data("kendoExtGrid");
      var selectedItem = grid.dataItem(grid.select());
      fn_contGridDBclick(selectedItem);
      viewDetailPopup();
  });


  // 그리드 주문번호 더블클릭.
  fn_contGridDBclick = function(selectedItem){
      if( selectedItem != null && selectedItem != 'undefined'){

          $("#dlrCd").val(selectedItem.dlrCd);
          $("#grpContractNo").val(selectedItem.grpContractNo);  // 집단 계약번호
          $("#contractDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractDt);   // 계약일
          $("#contractDt").data("kendoExtMaskedDatePicker").enable(false);                    // 계약일 수정불가
          $("#contractStatCd").val(selectedItem.contractStatCd);                     // 계약상태
          fn_btnState(selectedItem.contractStatCd);                                  // 버튼숨김

          $("#saleOpptSeq").val(selectedItem.saleOpptSeq);   //판매기회번호
          $("#lv2DlrYn").data("kendoExtDropDownList").value(selectedItem.lv2DlrYn == "Y" ? "Y":"N");    //2급딜러여부
          $("#lv2DlrOrgCd").val(selectedItem.lv2DlrOrgCd);     //2급딜러조직코드
          $("#lv2DlrOrgNm").val(selectedItem.lv2DlrOrgNm);     //2급딜러조직

          $("#saleMngNm").data("kendoExtDropDownList").value(selectedItem.saleMngNm);         // 영업대표
          $("#dlReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.dlReqDt);      // 인도요청일
          $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);       // 계약유형

          $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);           // 지불방식
          $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자


          /* 계약 고객정보 세팅 */
          var custTp = selectedItem.custTp;
          $("#custTp").val(custTp);       // 계약 고객유형
          /** 계약고객정보 **/
          if(custTp == "02"){  // 법인
              $("#cust_01").hide();
              $("#cust_02").show();
              custTpNm = "<spring:message code='global.lbl.corporation' />";      // 법인

              $("#ssnCrnTp_02").data("kendoExtDropDownList").value('');
          }else{            // 개인
              $("#cust_02").hide();
              $("#cust_01").show();
              custTpNm = "<spring:message code='global.lbl.personal' />";         // 개인

              $("#ssnCrnTp_01").data("kendoExtDropDownList").value('');
          }

          $("#custTpNm").val(custTpNm);                 // 고객유형
          $("#contractCustNo").val(selectedItem.contractCustNo);       // 고객코드
          $("#custNm").val(selectedItem.custNm);       // 고객명
          $("#telNo1").val(selectedItem.telNo1);       // 전화번호1
          $("#telNo2").val(selectedItem.telNo2);       // 전화번호2
          $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.mathDocTp); // 신분증유형 / 법인유형
          $("#ssnCrnNo").val(selectedItem.ssnCrnNo);  // 증서번호

          $("#remark").val(selectedItem.remark);    // 비고

          $("#carlineCnt").val(selectedItem.carlineCnt);           // 차종수량  - 차량Grid row 수
          $("#carCnt").val(selectedItem.carlineCnt);               // 차량수량  - 전체 차량수
          $("#totSaleAmt").val(selectedItem.totSaleAmt);           // 총판매 금액

          $("#carGrid").data('kendoExtGrid').dataSource.read();     // 차량Grid 조회

       // 저장 상태일 경우 obj 저장
          if(selectedItem.contractStatCd == "10"){
              bfObj = $("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"));
          }else{
              bfObj = {};
          }

      }
  }

  // 차량 grid
  $("#carGrid").kendoExtGrid({
      gridId:"G-SAL-0721-113322"
      ,dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/sal/cnt/contractPackage/selectPackageItemSearch.do' />"
              },
              parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};
                      //params["recordCountPerPage"] = options.pageSize;
                      //params["pageIndex"] = options.page;
                      //params["firstIndex"] = options.skip;
                      //params["lastIndex"] = options.skip + options.take;
                      //params["sort"] = options.sort;

                      // 딜러코드
                      params["sDlrCd"] = $("#dlrCd").val();
                      // 집단계약 번호
                      params["sGrpContractNo"] = $("#grpContractNo").val();

                      //console.log('grid params:',kendo.stringify(params) );
                      return kendo.stringify(params);

                  }else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,requestEnd:function(e) {
              if (e.type != "read") {}
          }
          ,schema:{
              model:{
                  id:"seq",
                  fields:{
                       dlrCd:{type:"string", editable:false} // 딜러코드
                      ,grpContractNo:{type:"string"}         // 그룹계약번호
                      ,seq:{type:"number"}                   // 일련번호
                      ,carlineCd  :{type:"string"}           //
                      ,carlineNm  :{type:"string"}           //
                      ,modelCd    :{type:"string"}           //
                      ,modelNm    :{type:"string"}           //
                      ,ocnCd      :{type:"string"}           //
                      ,ocnNm      :{type:"string"}           //
                      ,extColorCd :{type:"string"}           //
                      ,extColorNm :{type:"string"}           //
                      ,intColorCd :{type:"string"}           //
                      ,intColorNm :{type:"string"}           //
                      ,retlPrc    :{type:"number"}           //
                      ,promotionNo:{type:"string"}           //
                      ,promotionAmt:{type:"number"}          //
                      ,carCnt     :{type:"number"}           //
                      ,realCarAmt :{type:"number"}           //
                      ,realPayAmt :{type:"number"}           //
                  }
              }
          }
      }
      ,dataBound:function(e) {
          var rows = e.sender.tbody.children();
      }
     ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
     ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
     ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
     ,appendEmptyColumn:false           //빈컬럼 적용. default:false
     ,enableTooltip:true               //Tooltip 적용, default:false
     ,height:127
     ,editable:{
          mode:"incell"
         ,confirmation:false
     }
     ,autoBind:false
     ,navigatable:false
     ,selectable:"row"
     ,sortable:false
     ,pageable:false
     ,filterable:false
     ,edit:function(e){
         var eles = e.container.find("input");
         var fieldName;
         if(eles.length > 1){
             fieldName = eles[eles.length-1].getAttribute("name");
         }else{
             fieldName = eles.attr("name");
         }

        var input = e.container.find(".k-input");

        var rows = e.sender.select();
        var selectedItem = e.sender.dataItem(rows[0]);

        if(fieldName == "retlPrc"){
             this.closeCell();
        }
        if(fieldName == "realCarAmt"){
            this.closeCell();
        }
        if(fieldName == "realPayAmt"){
            this.closeCell();
        }
        if(fieldName == "promotionAmt"){
            var promotionNo = dms.string.strNvl(selectedItem.promotionNo);
            if(promotionNo == ""){
                // 프로모션 없을 시 할인금액 입력 불가.
                this.closeCell();
            }else{
                input.blur(function(){
                    bf_sumCarAmt(selectedItem);     // 차량 금액 계산
                });
            }
        }

        if(fieldName == "carCnt"){
            input.blur(function(){
                bf_sumCarAmt(selectedItem);     // 차량 금액 계산

            });
        }

     }
     ,columns:[
         {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
        ,{field:"grpContractNo", hidden:true}       // 그룹계약번호
        ,{field:"seq", hidden:true}                 // 일련번호
        ,{  // 차량
            field:"carlineCd"
           ,title:"<spring:message code='global.lbl.carLine' />"
           ,width:90
           ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
           ,attributes:{"class":"ac"}
           ,template:"#=bf_selectCarLine(carlineCd)#"
           ,editor:function (container, options){
               if( options.model.seq == "" || options.model.carlineCd == ""){
                   $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       , dataTextField:"carlineNm"
                       , dataValueField:"carlineCd"
                       , dataSource:carLineCdDSList
                       , select:selectGridCarlineCd
                       , change:function(e){
                           if(modelCdDSList == null){return false;}

                           var grid = $("#carGrid").data("kendoExtGrid");
                           var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(5)");
                           grid.editCell(modelCell);
                       }
                   });
               }else{
                   container.context.innerText = dms.string.strNvl(carLineCdObj[options.model.carlineCd]);
               }
           }
        }
        ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
        ,{    // 모델
            field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:150
            , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            ,template:"#= bf_selectModel(modelCd, modelNm) #"
            ,editor:function (container, options){

                if(     options.model.carlineCd != ""
                    && (options.model.modelCd == "" || options.model.seq == "") ){
                    $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"modelNm"
                        ,dataValueField:"modelCd"
                        ,dataSource:modelCdDSList
                        , select:selectGridModelCd
                        , change:function(e){
                            if(ocnCdDSList == null){return false;}

                            var grid = $("#carGrid").data("kendoExtGrid");
                            var ocnCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(7)");
                            grid.editCell(ocnCell);
                        }
                    });
                }else{
                    if(options.model.modelNm != ""){
                        container.context.innerText = options.model.modelNm;
                    }else{
                        container.context.innerText = dms.string.strNvl(modelCdObj[options.model.modelCd]);
                    }
                }
            }
        }
        ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
        ,{    // OCN
            field:"ocnCd",   title:"<spring:message code='global.lbl.ocn' />", width:140
            , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            ,template:"#= bf_selectOcn(ocnCd, ocnNm) #"
            ,editor:function (container, options){

                if(     options.model.modelCd != ""
                    && (options.model.ocnCd == "" || options.model.seq == "" ) ){
                    $('<input name="ocnCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"ocnNm"
                        ,dataValueField:"ocnCd"
                        ,dataSource:ocnCdDSList
                        ,select:selectGridOcnCd
                        ,change:function(e){
                            if(extColorCdDSList == null){return false;}

                            var grid = $("#carGrid").data("kendoExtGrid");
                            var extColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(9)");
                            grid.editCell(extColorCell);
                        }
                    });
                }else{
                    if(options.model.ocnNm != ""){
                        container.context.innerText = options.model.ocnNm;
                    }else{
                        container.context.innerText = dms.string.strNvl(ocnCdObj[options.model.ocnCd]);
                    }
                }
            }
        }
        ,{field:"ocnNm", title:"ocnNm", hidden:true}       // 모델명
        ,{    // 외장색
            field:"extColorCd",   title:"<spring:message code='global.lbl.extColor' />", width:80
            , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            ,template:"#= bf_selectExtColor(extColorCd, extColorNm) #"
            ,editor:function (container, options){

                if(     options.model.ocnCd != ""
                    && (options.model.extColorCd == "" || options.model.seq == "" ) ){
                    $('<input name="extColorCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"extColorNm"
                        ,dataValueField:"extColorCd"
                        ,dataSource:extColorCdDSList
                        , select:selectGridExtColorCd
                        ,change:function(e){
                            if(intColorCdDSList == null){return false;}

                            var grid = $("#carGrid").data("kendoExtGrid");
                            var intColorCell = $("#carGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(11)");
                            grid.editCell(intColorCell);
                        }
                    });
                }else{
                    if(options.model.extColorNm != ""){
                        container.context.innerText = options.model.extColorNm;
                    }else{
                        container.context.innerText = dms.string.strNvl(extColorCdObj[options.model.extColorCd]);
                    }
                }
            }
        }
        ,{field:"extColorNm", hidden:true}       // 외장색
        ,{    // 내장색
            field:"intColorCd",   title:"<spring:message code='global.lbl.intColor' />", width:80
            , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            ,template:"#= bf_selectIntColor(intColorCd, intColorNm) #"
            ,editor:function (container, options){

                if(     options.model.extColorCd != ""
                    && (options.model.intColorCd == "" || options.model.seq == "") ){
                    $('<input name="intColorCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"intColorNm"
                        ,dataValueField:"intColorCd"
                        ,dataSource:intColorCdDSList
                        ,select:selectGridIntColorCd
                    });
                }else{
                    if(options.model.intColorNm != ""){
                        container.context.innerText = options.model.intColorNm;
                    }else{
                        container.context.innerText = dms.string.strNvl(intColorCdObj[options.model.intColorCd]);
                    }
                }
            }
        }
        ,{field:"intColorNm", hidden:true}       // 내장색

        ,{  //시장지도가
            field:"retlPrc"
           ,title:"<spring:message code='sal.lbl.retlPrc' />"
           ,width:90
           ,attributes:{"class":"ar"}
           ,format:"{0:n2}"
           //,editor:function (container, options){}
        }
        , { //할인유형
            field:"promotionNo", title:"<spring:message code='sal.lbl.promotionNo' />", width:120
            ,attributes:{"class":"ac"}
            ,editor:function(container, options) {
                 if(!options.model.isNew()){
                     container.context.innerText = options.model.promotionNo
                     return ;
                    }
                $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:bf_PromotionPopup(\''+options.model.retlPrc+'\', \''+options.model.dlrCd+'\', \''+options.model.carlineCd+'\', \''+options.model.carlineNm+'\', \''+options.model.modelCd+'\', \''+options.model.modelNm+'\');" /></a></div>')
                .appendTo(container)
            }
          }
        ,{  //할인금액
            field:"promotionAmt"
           ,title:"<spring:message code='global.lbl.dcAmt' />"
           ,width:90
           ,attributes:{"class":"ar"}
           ,format:"{0:n2}"
        }
        ,{  //수량
            field:"carCnt"
           ,title:"<spring:message code='global.lbl.qty' />"
           ,width:70
           ,attributes:{"class":"ar"}
           //,format:"{0:n0}"
           ,editor:function(container, options){
               $('<input name="carCnt" data-bind="value:' + options.field + '" data-format="' + options.format + '" />')
               .focus(function(){ this.select(); })
               .appendTo(container)
               .kendoExtNumericTextBox({
                   format:"n0"
                   ,spinners:true
               });

           }
        }
        ,{  //대당 가격
            field:"realCarAmt"
           ,title:"<spring:message code='sal.lbl.oneCarAmt' />"
           ,width:80
           ,attributes:{"class":"ar"}
           ,format:"{0:n2}"
        }
        ,{  //합금액
            field:"realPayAmt"
           ,title:"<spring:message code='sal.lbl.sumRealPayAmt' />"
           ,width:90
           ,attributes:{"class":"ar"}
           ,format:"{0:n2}"
        }
     ]
 });

});
/******************************************
 * ready () = End =
 ******************************************/

 // 초기화
function refreshAll() {

    $("#dlrCd").val('');
    $("#grpContractNo").val('');  // 집단 계약번호
    $("#contractDt").data("kendoExtMaskedDatePicker").value(toDay);        // 계약일
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(true);     // 계약일 수정불가
    $("#contractStatCd").val('');              // 계약상태

    $("#saleOpptSeq").val('');   //판매기회번호
    $("#lv2DlrYn").data("kendoExtDropDownList").select(0);  //2급딜러여부
    $("#lv2DlrOrgCd").val('');     //2급딜러조직코드
    $("#lv2DlrOrgNm").val('');     //2급딜러조직

    $("#saleMngNm").data("kendoExtDropDownList").value('');      // 영업대표
    $("#dlReqDt").data("kendoExtMaskedDatePicker").value('');  // 인도요청일
    $("#contractTp").data("kendoExtDropDownList").select(0);      // 계약유형

    $("#payTp").data("kendoExtDropDownList").value('');           // 지불방식
    $("#saleEmpNo").data("kendoExtDropDownList").value('');       // 판매담당자

    $("#custTp").val('01');     // 고객유형:개인
    $("#custTpNm").val("<spring:message code='global.lbl.personal' />");    // 개인
    $("#contractCustNo").val('');       // 고객코드
    $("#custNm").val('');               // 고객명
    $("#telNo1").val('');               // 전화번호1
    $("#telNo2").val('');               // 전화번호2
    $("#ssnCrnTp_01").data("kendoExtDropDownList").value('');
    $("#ssnCrnTp_02").data("kendoExtDropDownList").value('');
    $("#cust_02").hide();
    $("#cust_01").show();
    $("#ssnCrnNo").val('');  // 증서번호
    $("#remark").val('');    // 비고

    $("#carlineCnt").val('0');           // 차종수량  - 차량Grid row 수
    $("#carCnt").val('0');               // 차량수량  - 전체 차량수
    $("#totSaleAmt").val('0');           // 총판매 금액

    $("#carGrid").data('kendoExtGrid').dataSource.data([]);

    bfObj = {};
}

 //검색조건
 function reSearch(contNo){
     $("#sContractTp").data("kendoExtDropDownList").value('G');  // 계약유형
     $("#sDlrCd").val('');      // 고객
     $("#sDlrNm").val('');      // 고객명
     $("#sCustTp").data("kendoExtDropDownList").value('01');     // 고객유형
     $("#sGrpContractNo").val(contNo);      // 그룹번호
     $("#sContractStatCd").data("kendoExtDropDownList").value('');  // 계약상태
     $("#sStartContractDt").data("kendoExtMaskedDatePicker").value('');
     $("#sEndContractDt").data("kendoExtMaskedDatePicker").value('');
 }

/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);

    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("carlineNm", dataItem.carlineNm);

    selectRow.set("modelCd", '');
    selectRow.set("modelNm", '');

    selectRow.set("ocnCd", '');
    selectRow.set("ocnNm", '');

    selectRow.set("extColorCd", '');
    selectRow.set("extColorNm", '');

    selectRow.set("intColorCd", '');
    selectRow.set("intColorNm", '');

    selectRow.set("retlPrc", 0);
    selectRow.set("promotionNo", '');
    selectRow.set("promotionAmt", 0);
    selectRow.set("carCnt", 0);
    selectRow.set("realCarAmt", 0);
    selectRow.set("realPayAmt", 0);

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/cnt/contractPackage/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    //console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;

    modelCdObj = {};
    if(modelCdDSList != null){
        $.each(modelCdDSList, function(idx, obj){
            modelCdObj[obj.modelCd] = obj.modelNm;
        });
    }
};

// 모델에 따른 OCN 조회
function selectGridModelCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    //selectRow.modelNm = dataItem.modelNm;
    //selectRow.retlPrc = 0;                      // 차량가격 초기화

    selectRow.set("modelNm", dataItem.modelNm);

    selectRow.set("ocnCd", '');
    selectRow.set("ocnNm", '');

    selectRow.set("extColorCd", '');
    selectRow.set("extColorNm", '');

    selectRow.set("intColorCd", '');
    selectRow.set("intColorNm", '');


   //그리드 외장색 콤보 DataSource
    extColorCdDSList = [];
    extColorCdObj = {};

   //그리드 내장색 콤보 DataSource
    intColorCdDSList = [];
    intColorCdObj = {};


    selectRow.set("retlPrc", 0);
    selectRow.set("promotionNo", '');
    selectRow.set("promotionAmt", 0);
    selectRow.set("carCnt", 0);
    selectRow.set("realCarAmt", 0);
    selectRow.set("realPayAmt", 0);


    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/cnt/contractPackage/selectOcn.do"
        ,data:JSON.stringify({"carlineCd":selectRow.carlineCd, "modelCd":dataItem.modelCd})
        ,async:false
    });
    ocnCdDSList = responseJson.data;

    ocnCdObj = {};
    if(ocnCdDSList != null){
        $.each(ocnCdDSList, function(idx, obj){
            ocnCdObj[obj.ocnCd] = obj.ocnNm;
        });
    }
};

//OCN에 따른 외장색 조회:모델값으로 조회
function selectGridOcnCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    //selectRow.ocnNm = dataItem.ocnNm;
    //selectRow.retlPrc = Number(dms.string.strNvl(dataItem.msPrc));

    selectRow.set("ocnNm", dataItem.ocnNm);

    selectRow.set("extColorCd", '');
    selectRow.set("extColorNm", '');

    selectRow.set("intColorCd", '');
    selectRow.set("intColorNm", '');

    selectRow.set("retlPrc", Number(dms.string.strNvl(dataItem.msPrc)));
    selectRow.set("promotionNo", '');
    selectRow.set("promotionAmt", 0);
    selectRow.set("carCnt", 0);
    selectRow.set("realCarAmt", 0);
    selectRow.set("realPayAmt", 0);


    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/cnt/contractPackage/selectExtColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd})
        ,async:false
    });
    extColorCdDSList = responseJson.data;

    extColorCdObj = {};
    if(extColorCdDSList != null){
        $.each(extColorCdDSList, function(idx, obj){
            extColorCdObj[obj.extColorCd] = obj.extColorNm;
        });
    }
};

//외장색에 따른 내장색 조회:모델값으로 조회
function selectGridExtColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    //selectRow.extColorNm = dataItem.extColorNm;

    selectRow.set("extColorNm", dataItem.extColorNm);

    selectRow.set("intColorCd", '');
    selectRow.set("intColorNm", '');


    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/cnt/contractPackage/selectIntColor.do"
        ,data:JSON.stringify({"modelCd":selectRow.modelCd})
        ,async:false
    });
    intColorCdDSList = responseJson.data;

    intColorCdObj = {};
    if(intColorCdDSList != null){
        $.each(intColorCdDSList, function(idx, obj){
            intColorCdObj[obj.intColorCd] = obj.intColorNm;
        });
    }
};

//내장색 선택
function selectGridIntColorCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#carGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    //selectRow.intColorNm = dataItem.intColorNm;

    selectRow.set("intColorNm", dataItem.intColorNm);
};

//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return carLineCdObj[carlineCd];
    }
}

//2 Grid- 모델의 template 정의
function bf_selectModel(modelCd, modelNm){
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return modelCdObj[modelCd];
}

//3 Grid - OCN의 template 정의
function bf_selectOcn(ocnCd, ocnNm){
    if(ocnNm != ""){
        return ocnNm;
    }
    if(ocnCd == ""){
        return "";
    }
    return ocnCdObj[ocnCd];
}

//4 Grid - 외장색의 template 정의
function bf_selectExtColor(extColorCd, extColorNm){
    if(extColorNm != ""){
        return extColorNm;
    }
    if(extColorCd == ""){
        return "";
    }
    return extColorCdObj[extColorCd];
}

//5 Grid - 내장색의 template 정의
function bf_selectIntColor(intColorCd, intColorNm){
    if(intColorNm != ""){
        return intColorNm;
    }
    if(intColorCd == ""){
        return "";
    }
    return intColorCdObj[intColorCd];
}

// 차량Grid - row 가격 계산
function bf_sumCarAmt(options){
    var retlPrc = 0             // 시장가
      , promotionAmt = 0        // 할인금액
      , carCnt = 0              // 수량
      , realCarAmt = 0          // 1대당 가격
      , realPayAmt = 0;         // 합금액

    retlPrc = Number(options.retlPrc);
    promotionAmt = Number(options.promotionAmt);
    carCnt = Number(options.carCnt);

    // 대당 가격 = 시장가 - 할인금액
    realCarAmt = retlPrc - promotionAmt;

    // 합금액 = 1대가격 * 수량
    realPayAmt = realCarAmt * carCnt;

    options.set("realCarAmt", realCarAmt);
    options.set("realPayAmt", realPayAmt);

    //options.realCarAmt = realCarAmt;
    //options.realPayAmt = realPayAmt;
}

// 차량Grid = total 차종수, 차량수, 합금액 계산
function bf_sumCarCnt(){

    var grid = $("#carGrid").data("kendoExtGrid");
    var rows = grid.tbody.find("tr");
    var carTotCnt = 0
      , carTotSaleAmt = 0;

    $("#carlineCnt").val(Number(rows.length));

    $.each(rows, function(idx, row){
       var item = grid.dataItem(row);
       carTotCnt += item.carCnt;
       carTotSaleAmt += item.realPayAmt;
    });

    $("#carCnt").val(carTotCnt);
    $("#totSaleAmt").val(carTotSaleAmt);
}

// 차량 item의 프로모션 팝업
function bf_PromotionPopup(retlPrc, sDlrCd, sCarlineCd, sCarlineNm, sModelCd, sModelNm){

  // 차량 가격이 없을 시.
  if( Number(retlPrc) <= 0){
      dms.notification.info("<spring:message code='sal.lbl.retlPrc' var='salLblRetlPrc' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRetlPrc}' />");
      return false;
  }

  if( dms.string.strNvl(sDlrCd) == ""){
      dms.notification.info("<spring:message code='global.lbl.dealer' var='globalLblDealer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDealer}' />");
      return false;
  }

  if( dms.string.strNvl(sCarlineCd) == ""){
      dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
      return false;
  }

  if( dms.string.strNvl(sModelCd) == ""){
      dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
      return false;
  }

  var sContractTp = $("#contractTp").data("kendoExtDropDownList").value()
    , sCustNo = $("#contractCustNo").val()
    , sCustNm = $("#custNm").val()
    , sContractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();

  popupWindow = dms.window.popup({
      windowId:"promotionNoPopup"
      ,title:"<spring:message code='sal.title.contPackagePromotionSearch' />"   // 집단판매 프로모션 조회
      ,modal:true
      ,content:{
          url:"<c:url value='/sal/cnt/contractPackage/selectCntPackagePromotionPopup.do' />"
          ,data:{
              "type":null
              ,"autoBind":true
              ,"dlrCd" :sDlrCd            // 딜러코드
              ,"contractTp":sContractTp   // 계약유형
              ,"custNo":sCustNo           // 고객번호
              ,"custNm":sCustNm           // 고객명
              ,"carlineCd":sCarlineCd     // 차종
              ,"carlineNm":sCarlineNm     // 차종명
              ,"modelCd":sModelCd         // 모델
              ,"modelNm":sModelNm         // 모델명
              ,"contractDt":sContractDt   // 계약일
              ,"retlPrc":retlPrc
              ,"callbackFunc":function(data){
                  var grid = $('#carGrid').data('kendoExtGrid');
                  var dataItem = grid.dataItem(grid.select());

                  dataItem.set("promotionNo", data[0].promotionCd);
                  dataItem.set("promotionAmt", data[0].promotionAmt);

                  bf_sumCarAmt(dataItem);

                  popupWindow.close();

              }
          }
      }
  });
}

//딜러조회
bf_dealerSearchPopup = function(){
    dealerSearchPopupWin = dms.window.popup({
        windowId:"dealerSearchPopupWin"
        ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        , modal:true
        , content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"closeAfterSelect":true
                    ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#dlrCd").val(data[0].dlrCd);
                            $("#dlrNm").val(data[0].dlrNm);
                        }
                    }
                }
        }
    });
}

//CRM 고객 데이터 조회
bf_searchCustomer = function(obCd){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        //console.log(data);

                        var custTp = data[0].custTp;
                        var custTpNm = "";
                        // 계약고객
                        if(obCd == 'cust'){
                            $("#custTp").val(custTp);

                            if(custTp == "02"){  // 법인
                                $("#cust_01").hide();
                                $("#cust_02").show();
                                custTpNm = "<spring:message code='global.lbl.corporation' />";      // 법인
                                $("#ssnCrnTp_02").data("kendoExtDropDownList").value('');
                            }else{            // 개인
                                $("#cust_02").hide();
                                $("#cust_01").show();
                                custTpNm = "<spring:message code='global.lbl.personal' />";         // 개인
                                $("#ssnCrnTp_01").data("kendoExtDropDownList").value('');
                            }

                            $("#custTpNm").val(custTpNm);

                            $("#contractCustNo").val(data[0].custNo);       // 고객코드
                            $("#custNm").val(data[0].custNm);               // 고객명

                            $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
                            $("#ssnCrnNo").val(data[0].ssnCrnNo);  // 증서번호
                            $("#telNo1").val(data[0].telNo);       // 전화번호1
                            $("#telNo2").val(data[0].telNo);       // 전화번호2

                        }       // 검색
                        else{
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            vCustNo = data[0].custNo;
                        }
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

/** 무결성 검사 **/
function save_Validate(){
    bf_sumCarCnt(); // 차종Grid row 계산

    // 계약일자
    if( $("#contractDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
        return false;
    }

    // 2급딜러 여부
    if( $("#lv2DlrYn").data("kendoExtDropDownList").value() == "Y" ){
        if( $("#lv2DlrOrgCd").val() == ""){
            // 2급딜러을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.lv2DlrOrg' var='salLblLv2DlrOrg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblLv2DlrOrg}' />");
            return false;
        }
    }

    // 지불방식
    if( $("#payTp").data("kendoExtDropDownList").value() == "" ){
        // {지불방식}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
        return false;
    }

    // 인도요청일
    if( $("#dlReqDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        return false;
    }

    // 판매담당자
    if( $("#saleEmpNo").data("kendoExtDropDownList").value() == "" ){
        // {판매담당자}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.salPrsnNm' var='globalLblSalPrsnNm' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblSalPrsnNm}' />");
        return false;
    }

    // 고객코드
    if( $("#contractCustNo").val() == "" ){
        // {판매담당자}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        return false;
    }

    return true;
}

// 저장
function save(mFlag){

    /** 무결성 검사 **/
    if( !save_Validate() ){
       return false;
    }

    var param = $.extend(
             { "packageVO":$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']")) }
            ,{ "multiFlag":mFlag }
            , $("#carGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList")
    );

    // 차량정보 무결성 체크
    var dataValidate = false;
    $.each(param.insertList, function(idx, row){
        if(row.carCnt == ""){
           // 수량을 선택하여 주세요.
           dms.notification.info("<spring:message code='global.lbl.qty' var='globalLblQty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblQty}' />");
           dataValidate = true;
           return false;
        }

        if(Number(row.realCarAmt) <= 0){
            // 대당 가격을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.oneCarAmt' var='salLblOneCarAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblOneCarAmt}' />");
            dataValidate = true;
            return false;
        }

        if(Number(row.realPayAmt) <= 0){
            // 대당 가격을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.sumRealPayAmt' var='salLblSumRealPayAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblSumRealPayAmt}' />");
            dataValidate = true;
            return false;
        }
     });
    $.each(param.updateList, function(idx, row){
        if(row.carCnt == ""){
            // 수량을 선택하여 주세요.
            dms.notification.info("<spring:message code='global.lbl.qty' var='globalLblQty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblQty}' />");
            dataValidate = true;
            return false;
         }

         if(Number(row.realCarAmt) <= 0){
             // 대당 가격을 선택하여 주세요.
             dms.notification.info("<spring:message code='sal.lbl.oneCarAmt' var='salLblOneCarAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblOneCarAmt}' />");
             dataValidate = true;
             return false;
         }

         if(Number(row.realPayAmt) <= 0){
             // 대당 가격을 선택하여 주세요.
             dms.notification.info("<spring:message code='sal.lbl.sumRealPayAmt' var='salLblSumRealPayAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblSumRealPayAmt}' />");
             dataValidate = true;
             return false;
         }
    });
    if(dataValidate){ return false; }


    // 계약상태
    if( $("#contractStatCd").val() == "" ){
        param.packageVO.contractStatCd = "10";      // 계약등록
    }

    param.packageVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();     // 계약일
    param.packageVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();           // 인도요청일

    $.ajax({
        url:"<c:url value='/sal/cnt/contractPackage/multiContractPackages.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success:function(jqXHR, textStatus) {
            var grid = $("#contGrid").data("kendoExtGrid");
            refreshAll();
            reSearch(jqXHR);                       // 조회조건 세팅
            $("#savedGrpContractNo").val(jqXHR);   // 저장된 계약번호
            grid.dataSource.read();
            $("#callContractPackageWindow").data("kendoWindow").close();

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });

}

// 생성
function approval(){

    var param = {};
    param.grpContractNo = $("#grpContractNo").val();          // 집단계약번호

    $.ajax({
        url:"<c:url value='/sal/cnt/contractPackage/approvalPackage.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(error);
        },
        success:function(jqXHR, textStatus) {
            var grid = $("#contGrid").data("kendoExtGrid");
            refreshAll();
            reSearch(jqXHR);                       // 조회조건 세팅
            $("#savedGrpContractNo").val(jqXHR);   // 승인한 그룹계약번호
            grid.dataSource.read();
            $("#callContractPackageWindow").data("kendoWindow").close();

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}

// 해약
function cancel(){

    if($("#grpContractNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약삭제 승인전
    if( $("#contractStatCd").val() == "10" ){
        var param = {};
        param.grpContractNo = $("#grpContractNo").val();          // 집단계약번호

        $.ajax({
            url:"<c:url value='/sal/cnt/contractPackage/deleteContractPackage.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태
                $("#callContractPackageWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });

    }else{
        // 계약승인 이전단계에서만 삭제가 가능합니다.
        dms.notification.info("<spring:message code='global.lbl.contractAcptReq' var='globalLblContractAcptReq' /><spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalLblContractAcptReq}, ${globalLblDel}' />");
        return false;
    }
}

//상세내용 팝업 호출
function viewDetailPopup(){
    var win = $("#callContractPackageWindow").data("kendoWindow").center().open();
}

/**
 * 버튼 상태 관리
 */
function fn_btnState(state){
    switch(state){
        case '10':     // 계약생성 (저장상태:해약가능)
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnCancel").show();
            $("#btnApproval").show();
            $("#btnSave").hide();
            $("#btnUpdate").show();

            $("#btnCarAdd").show();
            $("#btnCarDel").show();
            $("#btnCarCancel").show();
        break;
        case '20':     // 계약확정 :해약 불가
            $("#btnPayPrint").hide();
            $("#btnContPrint").show();
            $("#btnCancel").hide();
            $("#btnApproval").hide();
            $("#btnSave").hide();
            $("#btnUpdate").hide();

            $("#btnCarAdd").hide();
            $("#btnCarDel").hide();
            $("#btnCarCancel").hide();
            break;
        case '90':     // 계약해약
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnCancel").hide();
            $("#btnApproval").hide();
            $("#btnSave").hide();
            $("#btnUpdate").hide();

            $("#btnCarAdd").hide();
            $("#btnCarDel").hide();
            $("#btnCarCancel").hide();
            break;
        default:     // 작성전
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnCancel").hide();
            $("#btnApproval").hide();
            $("#btnSave").show();
            $("#btnUpdate").hide();

            $("#btnCarAdd").show();
            $("#btnCarDel").show();
            $("#btnCarCancel").show();
            break;
    }

    $("#btnViewDetail").show();
    $("#btnRefresh").show();
    $("#btnSearch").show();
}

// 검색조건:계약일자의 시작일-종료일 날짜 비교
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

//검색조건:고객
fnCheckCustValue = function(){
    if($("#sContractCustNo").val() != vCustNo){
        $("#sContractCustNm").val("");
    }
}

</script>
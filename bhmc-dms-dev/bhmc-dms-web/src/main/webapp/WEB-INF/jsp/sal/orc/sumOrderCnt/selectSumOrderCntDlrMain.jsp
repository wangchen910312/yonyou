<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


    <!-- 종합오더현황-딜러 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='global.title.sumOrderCntDlr' /></h1><!-- 종합오더현황-딜러 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10969" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>   <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
	                <col style="width:5%;">
	                <col style="width:19%;">
	                <col style="width:8%;">
	                <col style="width:16%;">
	                <col style="width:8%;">
	                <col style="width:18%;">
	                <col style="width:8%;">
	                <col>
	            </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"></th>
                        <td>
                            <label for="sRadioY" class="label_check">
                                <input type="radio" id="sRadioY" name="sRadio" value="Y" checked class="form_check" onClick="javascript:changedRadio(true);"/>
                                <spring:message code='sal.lbl.regularOrd' /><!-- 常规订单 -->
                            </label> <!-- 정규오더 -->
                            <label for="sRadioN" class="label_check">
                                <input type="radio" id="sRadioN" name="sRadio" value="N" class="form_check" onClick="javascript:changedRadio(false);"/>
                                <spring:message code='sal.lbl.notRegularOrd' /><!-- 非常规订单 -->
                            </label> <!-- 비정규오더 -->
                        </td>
                        <th scope="row" class="group-OrdTpOnlN1"><span class="bu_required"><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td class="required_area group-OrdTpOnlN1" >
                            <input name="sOrdTpN1" id="sOrdTpN1" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdTpNotN1" style="display:none;"><span class="bu_required"><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td class="required_area group-OrdTpNotN1" style="display:none;">
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt2"><span class="bu_required"><spring:message code="global.lbl.orderWeek" /></span></th> <!-- 주문주차 -->
                        <td class="required_area group-OrdDt2">
                            <input name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt1" style="display:none;"><span class="bu_required"><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdDtS" id="sOrdDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdDtE" id="sOrdDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                        <td>
                            <input id="sModelCd" class="form_comboBox" />
                            <input id="hiddenFscCode" type="hidden" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                        <td>
                            <input id="sOcnCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.extIntColor' /></th>        <!-- 외장/내장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox" style="width:49%"/>
                            <input id="sIntColorCd" class="form_comboBox" style="width:49%"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="mt0">
<%--             <div class="btn_left">
                <ul class="txt_input child_borderNone">
                    <li>
                         <span class="form_numeric font_bold"><spring:message code='sal.lbl.totOrdQty' />&nbsp;:&nbsp;<span id="mainTot" name="mainTot">0</span></span>     <!-- 건수:-->
                    </li>
                </ul>
            </div> --%>
            <div class="header_area">
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13277" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnExcelExport1"><spring:message code="global.btn.excelExport" /></button>
                    </dms:access>
                </div>
             </div>
            <div class="table_grid">
                <div id="mainGrid" class="resizable_grid"></div>
            </div>
        </div>
        <!-- //종합오더현황-딜러 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.campaign.detailInfo' /></h2>    <!-- 상세정보 -->

           <div class="btn_right">
            <dms:access viewId="VIEW-D-13277" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnExcelExport2"><spring:message code="global.btn.excelExport" /></button>
            </dms:access>
         </div>
        </div>
        <div class="mt0">
            <div class="table_grid">
                <div id="subGrid"></div>
            </div>
        </div>
        <!-- //상세정보 -->
    </section>
</div>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var sysDate = "${sysDate}";
var fifteenDayBf = "${fifteenDayBf}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var subParam = {};

//주문유형 SAL137 N1만
var ordTpListN1 = [];
<c:forEach var="obj" items="${ordTpDS}">
    <c:if test="${obj.cmmCd eq 'N1'}">
      ordTpListN1.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//주문유형 SAL137 N1제외
var ordTpList = [];
<c:forEach var="obj" items="${ordTpDS}">
    <c:if test="${obj.cmmCd ne 'N1'}">
      ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//주문유형 SAL137 전체
var ordTpAllList = [];
<c:forEach var="obj" items="${ordTpDS}">
  ordTpAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//주문유형 SAL137 전부 for List ComboBox
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>

// 차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 주차
var ordYyMmPridList = [];
<c:forEach var="obj" items="${ordYyMmPridInfo}">
    ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
</c:forEach>

// 주문상태 SAL150
var ordStatCdList = [];
var ordStatCdObj = {};
<c:forEach var="obj" items="${ordStatCdDS}">
    ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//BTO주문상태 SAL135
var btoOrdStatCdList = [];
var btoOrdStatCdObj = {};
<c:forEach var="obj" items="${btoOrdStatCdDS}">
  btoOrdStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  btoOrdStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//하치장 SAL152
var vinmVlocCdList = [];
var vinmVlocCdObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  vinmVlocCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
            var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
            var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
            var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

            if($("#sRadioY").prop("checked")){
                if( strOrdYyMmPrid == null || strOrdYyMmPrid == '' ){
                    // 주문주차 를(을) 입력해주세요.
                    dms.notification.info("<spring:message code='global.lbl.orderWeek' var='orderWeek' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderWeek},' />");
                    return;
                }
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
            $("#subGrid").data('kendoExtGrid').dataSource.data([]);     // 상세 Grid
        }



    });

    //주문유형
    $("#sOrdTpN1").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpListN1
       //,select:onSelectOrdTp
       ,value:"N1"
    });

    //주문유형
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       //,select:onSelectOrdTp
       //,optionLabel:" "  // 선택
    });


    function makeOrdDt(ordFullDt){
        var mm = ordFullDt.getMonth()+1; //월
        var dd = ordFullDt.getDate(); // 일
        var yy = ordFullDt.getFullYear(); // 년도
        var fullDt;

        if(mm<10){ // 월이 한자리 수 이면
           mm = "0"+mm.toString();
        }

        if(dd<10){ // 일이 한자리 수 이면
            dd = "0"+dd.toString();
         }
        fullDt = yy.toString()+mm.toString()+dd.toString();
        return fullDt;
    }

    // 엑셀 상단부 export 버튼
    $("#btnExcelExport1").kendoButton({
       click:function(e){

           var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
           var sOrdPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
           var sOrdsTp = $('input:radio[name=sRadio]:checked').val();
           var sOrdStartDt = $("#sOrdDtS").data('kendoDatePicker').value();
           var sOrdEndDt = $("#sOrdDtE").data('kendoDatePicker').value();

           if(sOrdStartDt != null && sOrdStartDt != "" && sOrdEndDt != null && sOrdEndDt != ""){
               var sOrdStartDtstrTmp = makeOrdDt(sOrdStartDt);
               var sOrdEndDtstrTmp = makeOrdDt(sOrdEndDt);
           }

           /*
           if((sOrdStartDt.getMonth()+1)<10){ // 월이 한자리 수 이면
               var sOrdStartDtstr = sOrdStartDt.getFullYear().toString()+"0"+(sOrdStartDt.getMonth()+1).toString()+sOrdStartDt.getDate().toString();
           }else{ // 두자리수
               var sOrdStartDtstr = sOrdStartDt.getFullYear().toString()+(sOrdStartDt.getMonth()+1).toString()+sOrdStartDt.getDate().toString();
           }
           */


           var sModelCd = "";
           var sFscCd = "";

           if(sOrdTp == "Y"){
               sOrdStartDt = "";
               sOrdEndDt = "";
               strOrdTp = "N1";
           }else{
               sOrdPrid = "";
           }

         
           var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList").value();

           if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                sModelCd = $("#hiddenFscCode").val();
           }else{
                sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
           }

           // OCN
           var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList").value();
           // 외장색
           var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList").value();
           // 내장색
           var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList").value();
           var srchTp = $('input:radio[name=sRadio]:checked').val();
           var sMainSubDivision = true;  // true 일때가 메인 그리드임 ..
           // 엑셀 export시에 같은 Service를 사용하기 때문에 Main그리드와 Sub 그리드를 구분하기 위해 Flag를 두었음, 문제가 된다면 삭제 할것..  (by 이동준)



           if(srchTp == 'Y'){ // 정규오더
               dms.ajax.excelExport({
                   "beanName":"sumOrderCntService"
                   ,"templateFile":"sumOderCntDlrMainInfo_Tpl.xlsx"
                   ,"fileName":"sumOderCntDlrMainInfo.xlsx"
                   ,"sOrdPrid":$("#sOrdYyMmPrid").data("kendoExtDropDownList").value() // 주문 주차
                   ,"strOrdTp":strOrdTp // 주문 유형
                   ,"sOrdsTp":sOrdsTp //
                   ,"sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value() // 차종
                   // 여기 까지가 기본

                   ,"sModelCd":sModelCd //
                   ,"sFscCd":sFscCd //
                   ,"sOcnCd":sOcnCd //
                   ,"sExtColorCd":sExtColorCd //
                   ,"sIntColorCd":sIntColorCd //
                   ,"sModelCd":sModelCd //
                   ,"sMainSubDivision":sMainSubDivision
               });
           }else{ // 비정규 오더
                 // 주문유형 : sOrdTp
                 
               dms.ajax.excelExport({
                   "beanName":"sumOrderCntService"
                   ,"templateFile":"sumOderCntDlrMainInfo_Tpl.xlsx"
                   ,"fileName":"sumOderCntDlrMainInfo.xlsx"
                   ,"strOrdTp":strOrdTp // 주문 유형
                   ,"sOrdsTp":sOrdsTp //
                   ,"sOrdStartDtstrTmp":sOrdStartDtstrTmp
                   ,"sOrdEndDtstrTmp":sOrdEndDtstrTmp
                   ,"sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value() // 차종
                   // 여기 까지가 기본

                    ,"sModelCd":sModelCd //
                   ,"sFscCd":sFscCd //
                   ,"sOcnCd":sOcnCd //
                   ,"sExtColorCd":sExtColorCd //
                   ,"sIntColorCd":sIntColorCd //
                   ,"sModelCd":sModelCd //
                   ,"sMainSubDivision":sMainSubDivision
               });
           }

       }
    });



   // 엑셀 상단부 export 버튼

    $("#btnExcelExport2").kendoButton({
       click:function(e){

           var grid = $("#mainGrid").data("kendoExtGrid");
           var selectedItem = grid.dataItem(grid.select());
          //R19092902175 订单综合详情  明细查询修改 详细情况 下载功能  贾明 2019-10-9 start
           var sOrdTp = $('input:radio[name=sRadio]:checked').val();
           var dtOrdDtS = $("#sOrdDtS").val();
           var dtOrdDtE = $("#sOrdDtE").val();
           var ordGradeCd = selectedItem.ordGradeCd
          //R19092902175 订单综合详情  明细查询修改 详细情况 下载功能  贾明 2019-10-9 end

            var sDlrCd = selectedItem.dlrCd;
            var sOrdYyMmDt= "Y" == sOrdTp ? selectedItem.ordYyMmDt:"";
            var sOrdPrid = selectedItem.week;
            var sOrdsTp = selectedItem.ordTp;
            var sCarlineCd = selectedItem.carlineCd;
            var sModelCd = selectedItem.modelCd;
            var sOcnCd = selectedItem.ocnCd;
            var sExtColorCd = selectedItem.extColorCd;
            var sIntColorCd = selectedItem.intColorCd;
            var sregUsrId =selectedItem.regUsrId;
            var sMainSubDivision = false; // false 일때는 서브 그리드 ..
             // 엑셀 export시에 같은 Service를 사용하기 때문에 Main그리드와 Sub 그리드를 구분하기 위해 Flag를 두었음, 문제가 된다면 삭제 할것..  (by 이동준)

           dms.ajax.excelExport({
               "beanName":"sumOrderCntService"
               ,"templateFile":"sumOderCntDlrSubInfo_Tpl.xlsx"
               ,"fileName":"sumOderCntDlrSubInfo.xlsx"
                ,"sDlrCd" : sDlrCd
                ,"sOrdYyMmDt" : sOrdYyMmDt
                ,"sOrdStartDt": dtOrdDtS
                ,"sOrdEndDt": dtOrdDtE
                ,"sOrdPrid" : sOrdPrid
                ,"sOrdsTp" : sOrdsTp
                ,"sCarlineCd" : sCarlineCd
                ,"sModelCd" : sModelCd
                ,"sOcnCd" : sOcnCd
                ,"sExtColorCd" : sExtColorCd
                ,"sIntColorCd" : sIntColorCd
                ,"sMainSubDivision" : sMainSubDivision
                ,"sregUsrId":sregUsrId
                ,"sordGradeCd":ordGradeCd
           });

       }
    });



    /**
     * 주문주차 콤보박스
     */
     $("#sOrdYyMmPrid").kendoExtDropDownList({
         dataTextField:"btoYmwNm"
        ,dataValueField:"btoYmwCd"
        ,dataSource:ordYyMmPridList
        //,optionLabel:""  // 선택
        //,index:ordYyMmPridList.length
     });

    /**
     * 주문유형변경 이벤트
     */
     function onSelectOrdTp(e) {

         var ordTpCd = this.dataItem(e.item).cmmCd;

         if( ordTpCd != null && ordTpCd != ""){

             if( ordTpCd == "N1" ){

                 $("#sOrdDtS").data("kendoDatePicker").value("");
                 $("#sOrdDtE").data("kendoDatePicker").value("");

                 $(".group-OrdDt1").hide();
                 $(".group-OrdDt2").show();
             }else{
                 if( $("#sOrdDtS").data("kendoDatePicker").value() == "" || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
                     $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
                     $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
                 }

                 $(".group-OrdDt2").hide();
                 $(".group-OrdDt1").show();
             }
         }

         $("#sCarlineCd").data("kendoExtDropDownList").value("");
         $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);

         $("#sModelCd").data("kendoExtDropDownList").enable(false);
         $("#sOcnCd").data("kendoExtDropDownList").enable(false);
         $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
         $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
     };

     /**
      * 시작일자 (From)
      */
      $("#sOrdDtS").kendoDatePicker({
          value:fifteenDayBf
         ,format:"{0:<dms:configValue code='dateFormat' />}"
      });

      /**
      * 종료일자 (From)
      */
      $("#sOrdDtE").kendoDatePicker({
          value:sysDate
         ,format:"{0:<dms:configValue code='dateFormat' />}"
      });

      //차종
      $("#sCarlineCd").kendoExtDropDownList({
          dataTextField:"carlineNm"
         ,dataValueField:"carlineCd"
         ,dataSource:carLineCdList
         ,optionLabel:" "   // 전체
         ,select:function(e){
             var dataItem = this.dataItem(e.item);
             $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sModelCd").data("kendoExtDropDownList").enable(true);

             $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
             $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

             $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

             $("#hiddenFscCode").val("");

             if(dataItem.carlineCd == ""){
                 $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
                 $("#sModelCd").data("kendoExtDropDownList").enable(false);
                 return false;
             }

             var responseJson = dms.ajax.getJson({
                 url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
                 ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
                 ,async:false
             });
             $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
      });

      // 모델
      $("#sModelCd").kendoExtDropDownList({
          dataTextField:"fscNm"
         ,dataValueField:"fscCd"
         ,optionLabel:" "   // 전체
         ,select:function(e){
             var dataItem = this.dataItem(e.item);
             $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sOcnCd").data("kendoExtDropDownList").enable(true);

             $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

             $("#hiddenFscCode").val("");

             if(dataItem.modelCd == ""){
                 $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
                 $("#sOcnCd").data("kendoExtDropDownList").enable(false);
                 return false;
             }
             var responseJson = dms.ajax.getJson({
                 url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
                 ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
                 ,async:false
             });
             $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         }
      });
      $("#sModelCd").data("kendoExtDropDownList").enable(false);

      // ocn
      $("#sOcnCd").kendoExtDropDownList({
           dataTextField: "ocnNm"
          ,dataValueField:"ocnCd"
          ,optionLabel:" "   // 전체
          ,select:function(e){

              $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

              $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

              $("#hiddenFscCode").val("");

              if(this.dataItem(e.item).ocnCd == ""){
                  $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                  $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                  return false;
              }

              var responseJson = dms.ajax.getJson({
                  url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                  ,data:JSON.stringify({"sModelCd":e.dataItem.modelCd})
                  ,async:false
                  ,success:function(data) {
                      $("#hiddenFscCode").val(e.dataItem.modelCd);
                  }
              });

              $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
          }
      });
      $("#sOcnCd").data("kendoExtDropDownList").enable(false);

      //외장색
      $("#sExtColorCd").kendoExtDropDownList({
           dataTextField: "extColorNm"
          ,dataValueField:"extColorCd"
          ,optionLabel:" "   // 전체
          ,select:function(e){
              if(this.dataItem(e.item).extColorCd == ""){
                  $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                  $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                  return false;
              }

              $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

              var responseJson = dms.ajax.getJson({
                  url:"<c:url value='/sal/veh/vehicleMaster/selectIntColorCombo.do' />"
                  ,data:JSON.stringify({"sModelCd":$("#hiddenFscCode").val()})
                  ,async:false
              });
              $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
          }
      });
      $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

      //내장색
      $("#sIntColorCd").kendoExtDropDownList({
           dataTextField: "intColorNm"
          ,dataValueField:"intColorCd"
          ,optionLabel:" "   // 전체
      });
      $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 메인 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0322-114112"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrs.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        var sOrdTp = $('input:radio[name=sRadio]:checked').val();
                        var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                        var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                        var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
                        var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();
                        var sModelCd = "";
                        var sFscCd = "";

                        if(sOrdTp == "Y"){
                            dtOrdDtS = "";
                            dtOrdDtE = "";
                            strOrdTp = "N1";
                        }else{
                            strOrdYyMmPrid = "";

                        }

                        params["sOrdsTp"] = sOrdTp;
                        params["strOrdTp"] = strOrdTp;
                        params["sOrdPrid"] = strOrdYyMmPrid;
                        params["sOrdStartDt"] = dtOrdDtS;
                        params["sOrdEndDt"] = dtOrdDtE;

                        //딜러코드
                        params["sDlrCd"] = dlrCd;

                        // 차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델

                        // OCN
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();

                        // 외장색
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();

                        // 내장색
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                        //console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"ordNo",
                    fields:{
                         dlrCd :{type:"string", editable:false} //딜러코드
                        ,ordNo:{type:"string"}            //오더번호
                        ,ordYyMmDt:{type:"string"}        //오더년월일자
                        ,yyMm:{type:"string"}
                        ,week:{type:"string"}             //오더주차
                        ,ordStatCd:{type:"string"}        //주문상태코드
                        ,carlineCd:{type:"string"}        //
                        ,carlineNm:{type:"string"}        //
                        ,modelCd:{type:"string"}          //
                        ,modelNm:{type:"string"}          //
                        ,ocnCd:{type:"string"}            //
                        ,ocnNm:{type:"string"}            //
                        ,extColorCd:{type:"string"}       //
                        ,extColorNm:{type:"string"}       //
                        ,intColorCd:{type:"string"}       //
                        ,intColorNm:{type:"string"}       //
                        ,ordTp:{type:"string"}            //주문유형
                        ,ordGradeCd:{type:"string"}       //주문등급
                        ,ordQty:{type:"number"}           //주문요청수량
                        ,fstConfirmQty:{type:"number"}    //1차심사결과
                        ,scndConfirmQty:{type:"number"}   //2차심사결과
                        ,scndParIsffAdjQty:{type:"number"}   //심사미통과수량
                        ,wtOrdQty:{type:"number"}       //승인대기수량
                        ,dlrCnclQty:{type:"number"}     //승인후취소수량
                        ,finalConfQty:{type:"number"}     //최종확인수량
                        ,ordNo:{type:"string"}     //오더번호
                        ,cnclQty:{type:"number"}        //취소수량
                        ,nonAlocQty:{type:"number"}        //미배정수량
                        ,pdiQty:{type:"number"}         //PDI수량
                        ,vinQty:{type:"number"}         //VIN배정수량
                        ,gateOutQty:{type:"number"}     //법인출고수량
                        ,dlrInQty:{type:"number"}     //딜러입고수량
                        ,dlrOutQty:{type:"number"}     //딜러출고수량
                        ,ordNo:{type:"string"}      //오더번호
                    }
                }
            }
            ,aggregate:[
                          { field:"ordQty", aggregate:"sum" }
                         ,{ field:"fstConfirmQty", aggregate:"sum" }
                         ,{ field:"scndConfirmQty", aggregate:"sum" }
                         ,{ field:"scndParIsffAdjQty", aggregate:"sum" }
                         ,{ field:"wtOrdQty", aggregate:"sum" }
                         ,{ field:"dlrCnclQty", aggregate:"sum" }
                         ,{ field:"finalConfQty", aggregate:"sum" }
                         ,{ field:"cnclQty", aggregate:"sum" }
                         ,{ field:"nonAlocQty", aggregate:"sum" }
                         ,{ field:"pdiQty", aggregate:"sum" }
                         ,{ field:"missSetQty", aggregate:"sum" }
                         ,{ field:"tranMissQty", aggregate:"sum" }
                         ,{ field:"vinQty", aggregate:"sum" }
                         ,{ field:"gateOutQty", aggregate:"sum" }
                         ,{ field:"dlrInQty", aggregate:"sum" }
                         ,{ field:"dlrOutQty", aggregate:"sum" }

                      ]
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            //console.log("e.sender.pager.dataSource._total:::"+e.sender.pager.dataSource._total);

            //$("#mainTot").text(addcomma(Number(e.sender.pager.dataSource._total)));
        }
       ,reorderable:false    //컬럼순서변경가능여부
       ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
       ,height:110
       ,editable:false
       ,autoBind:true
       ,navigatable:true
       ,selectable:"row"
       ,filterable:false                 // 필터링 기능 사용안함
       ,sortable:false
       ,pageable :{
           refresh :true
           ,pageSize :500
           ,pageSizes :[ "500", "1000", "1500", "2000"]
       }
       ,columns:[
          {field:"dlrCd"            ,title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                                       // 딜러코드
          ,{field:"ordNo"           ,hidden:true}       // 오더번호
          ,{field:"ordYyMmDt"       ,hidden:true}       // 오더번호
          ,{field:"yyMm"            ,hidden:true}       // 오더년월
          ,{field:"week"            ,hidden:true}       // 오더주차
          ,{field:"regUsrId"            ,hidden:true}       // 下单人ID
          ,{field:"ordStatCd"       ,sortable:false, hidden:true, template:"#= ordStatCdObj[ordStatCd] #"}                                  // 주문상태
          ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
          ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"al"}}//차종description
          ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:160, attributes:{"class":"al"}} //모델description
          ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
          ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:160, attributes:{"class":"al"}} //OCNdescription
          ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
          ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}} //외장색description
          ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code
          ,{field:"ordTp"           ,title:"<spring:message code='global.lbl.orderType' />"     ,width:160  ,attributes:{"class":"al"},  template:"#= ordTpObj[ordTp] #",footerAttributes:{style:"visibility:hidden;"}}   // 주문유형
          ,{field:"ordGradeCd"      ,title:"<spring:message code='global.lbl.orderGrade' />"    ,width:80   ,attributes:{"class":"ac"},footerAttributes:{style:"visibility:hidden;"}}     // 주문등급
          ,{field:"ordQty"          ,title:"<spring:message code='global.lbl.reqQty' />"        ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //요청수량
          ,{field:"fstConfirmQty"   ,title:"<spring:message code='global.lbl.fstConfirmQty' />" ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //1차심사
          ,{field:"scndConfirmQty"        ,title:"<spring:message code='global.lbl.scndConfirmQty' />"      ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
              ,footerTemplate:"#=kendo.toString(sum)#"
              ,footerAttributes:{style:"text-align:right;"}
             }          //2차심사
          ,{field:"scndParIsffAdjQty"        ,title:"<spring:message code='sal.lbl.evalRequestQty' />"      ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
             ,footerTemplate:"#=kendo.toString(sum)#"
             ,footerAttributes:{style:"text-align:right;"}
            }          //심사미통과
          ,{field:"wtOrdQty"        ,title:"<spring:message code='global.lbl.wtOrdQty' />"      ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //승인대기
          ,{field:"dlrCnclQty"      ,title:"<spring:message code='global.lbl.dlrCnclQty' />"    ,width:100  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //승인후취소
           ,{field:"finalConfQty"         ,title:"<spring:message code='sal.lbl.finalConfQty' />"       ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
               ,footerTemplate:"#=kendo.toString(sum)#"
               ,footerAttributes:{style:"text-align:right;"}
              }          //최종확인
           ,{field:"nonAlocQty"         ,title:"<spring:message code='global.lbl.nOrdQty' />"       ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
               ,footerTemplate:"#=kendo.toString(sum)#"
               ,footerAttributes:{style:"text-align:right;"}
              }          //미배정
          ,{field:"pdiQty"          ,title:"<spring:message code='global.lbl.orderAssignQty' />",width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //오다배정

           ,{field:"missSetQty"          ,title:"<spring:message code='sal.lbl.misSetQty' />",width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
               ,footerTemplate:"#=kendo.toString(sum)#"
               ,footerAttributes:{style:"text-align:right;"}
            }          //임무배정

            ,{field:"tranMissQty"          ,title:"<spring:message code='sal.lbl.tranSchQty' />",width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
                ,footerTemplate:"#=kendo.toString(sum)#"
                ,footerAttributes:{style:"text-align:right;"}
            }          //배송임무

          ,{field:"vinQty"          ,title:"<spring:message code='global.lbl.vinQty' />"        ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //VIN배정
          ,{field:"gateOutQty"      ,title:"<spring:message code='global.lbl.dlrSaleQty' />"    ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //법인출고
          ,{field:"dlrInQty"      ,title:"<spring:message code='sal.lbl.stockCnt' />"    ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //재고
          ,{field:"dlrOutQty"      ,title:"<spring:message code='sal.lbl.retlQty' />"    ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //소매
       ]
   });

   // 그리드 더블클릭
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
         //R19092902175 订单综合详情  明细查询修改 贾明 2019-10-9 
         var sOrdTp = $('input:radio[name=sRadio]:checked').val();
         var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
         var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();
       if(selectedItem != null){
           subParam = {
                   "sDlrCd":selectedItem.dlrCd
                 , "sOrdYyMmDt":"Y" == sOrdTp ? selectedItem.ordYyMmDt:""
                 , "sOrdStartDt":"Y" == sOrdTp ? "":dtOrdDtS
                 , "sOrdEndDt":"Y"  ==  sOrdTp ? "":dtOrdDtE
                 , "sOrdPrid":selectedItem.week
                 , "sOrdsTp":selectedItem.ordTp
                 , "sCarlineCd":selectedItem.carlineCd
                 , "sModelCd":selectedItem.modelCd
                 , "sOcnCd":selectedItem.ocnCd
                 , "sExtColorCd":selectedItem.extColorCd
                 , "sIntColorCd":selectedItem.intColorCd
                 , "sOrdNo":selectedItem.ordNo
                 //2018-12-28 add byfengdequan 明细显示根据下单人ID
                 , "sregUsrId":selectedItem.regUsrId
                 , "sordGradeCd":selectedItem.ordGradeCd
                
                 
                 
            };
           $("#subGrid").data('kendoExtGrid').dataSource.data([]);     // 상세 Grid
           // 상세정보 Grid 조회
           $('#subGrid').data('kendoExtGrid').dataSource.read();
       }
   });

   // 상세정보
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-114113"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubs.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       //var params = {};
                       //params["recordCountPerPage"] = options.pageSize;
                       //params["pageIndex"] = options.page;
                       //params["firstIndex"] = options.skip;
                       //params["lastIndex"] = options.skip + options.take;
                       //params["sort"] = options.sort;

                       //console.log('subParam:',kendo.stringify(subParam) );
                       return kendo.stringify(subParam);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"ordSeq",
                   fields:{
                        //totCnt :{type:"number", editable:false} //전체 갯수
                        ordTp:{type:"string"}         //주문유형
                       ,ordStatCd:{type:"string"}     //오더상태명
                       ,ordDate:{type:"date"}         //주문등록일자
                       ,chrgCd:{type:"string"}        //주문자
                       ,ordSeq:{type:"string"}        //주문번호
                       //,salesNo:{type:"string"}     //영업번호
                       ,vinmVloc:{type:"string"}      //하치장명
                       ,fndlDt:{type:"string"}          //납기예정일
                       //,carlineCd:{type:"string"}   //
                       ,carlineNm:{type:"string"}     //
                       //,modelCd:{type:"string"}     //
                       ,modelNm:{type:"string"}       //
                       //,ocnCd:{type:"string"}       //
                       ,ocnNm:{type:"string"}         //
                       //,extColorCd:{type:"string"}  //
                       ,extColorNm:{type:"string"}    //
                       //,intColorCd:{type:"string"}  //
                       ,intColorNm:{type:"string"}    //
                       ,vinNo:{type:"string"}         //VIN NO
                       ,inno:{type:"date"}
                       ,pdiDt:{type:"date"}           //PDI배정일
                       ,vinDt:{type:"date"}           //VIN배정일
                       ,retailDt:{type:"date"}        //출고일자
                       ,dlrGrDt:{type:"date"}        //입고일자
                       ,custSaleDt:{type:"date"}        //판매일자
                       ,regUsrId:{type:"string"}
                       ,ordDt:{type:"date"}

                       ,retailDtStr:{type:"date"}
                       ,dlrGrDtStr:{type:"date"}
                       ,custSaleDtStr:{type:"date"}


                   }
               }
           }
       }
      ,reorderable:false    //컬럼순서변경가능여부
      ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
      ,editable:false
      ,autoBind:false
      ,navigatable:true
      ,sortable:false
      ,pageable:false
      ,height:200
      ,columns:[
          {field:"ordTp"
           ,title:"<spring:message code='global.lbl.orderType' />"
           ,width:140
           ,attributes:{"class":"ac"}
           ,template:"#= ordTpObj[ordTp] #"
           ,filterable:{
               cell:{
                   showOperators:false
                   ,template: function (e) {
                          e.element.kendoExtDropDownList({
                              dataSource:ordTpAllList
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,valuePrimitive:true
                              ,optionLabel:" "
                          });
                      }
               }
           }
          }         // 주문유형
         ,{field:"ordStatCd"
           ,title:"<spring:message code='global.lbl.ordStat' />"
           ,width:80
           ,attributes:{"class":"al"}
           ,template:"#= ordStatCdObj[ordStatCd] #"
           ,filterable:{
               cell:{
                   showOperators:false
                   ,template: function (e) {
                          e.element.kendoExtDropDownList({
                              dataSource:ordStatCdList
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,valuePrimitive:true
                              ,optionLabel:" "
                          });
                      }
               }
           }
          } // 주문상태
         ,{field:"ordDt"      ,title:"<spring:message code='global.lbl.chrgDt' />"        ,width:100       , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 주문일자
         ,{field:"regUsrId"       ,title:"<spring:message code='global.lbl.chrgCd' />"        ,width:80       , attributes:{"class":"ac"}}                                          // 주문자
         ,{field:"ordSeq"       ,title:"<spring:message code='global.lbl.ordNo' />"         ,width:80       , attributes:{"class":"al"}}                                         // 주문번호
         ,{field:"vinmVloc"
           ,title:"<spring:message code='sal.lbl.plant' />"
           ,width:140
           ,attributes:{"class":"al"}
           ,template:"#=dms.string.strNvl(vinmVlocCdObj[vinmVloc])#"
           ,filterable:{
               cell:{
                   showOperators:false
                   ,template: function (e) {
                          e.element.kendoExtDropDownList({
                              dataSource:vinmVlocCdList
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,valuePrimitive:true
                              ,optionLabel:" "
                          });
                      }
               }
           }
          }    // 공장
         ,{field:"inno"       ,title:"<spring:message code='sal.estimatedPayDt' />"       ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 수납예정일
         ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />"
             ,width:60
             ,headerAttributes:{style:"text-align:center;"}
         }  // 차종코드
         ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />"
             ,width:90
             ,headerAttributes:{style:"text-align:center;"}
         }  // 차종명칭
         ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
             ,width:120
             ,headerAttributes:{style:"text-align:center;"}
         }  // 차관
         ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />"
             ,width:60
             ,headerAttributes:{style:"text-align:center;"}
             ,attributes:{"class":"ac"}
         }  // OCN코드
         ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />"
             ,width:120
             ,headerAttributes:{style:"text-align:center;"}
         }  // OCN명칭
         ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />"
             ,width:60
             ,headerAttributes:{style:"text-align:center;"}
         }  // 외장색코드
         ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />"
             ,width:80
             ,headerAttributes:{style:"text-align:center;"}
         }  // 외장색명칭
         ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />"
             ,width:60
             ,headerAttributes:{style:"text-align:center;"}
         }  // 내장색코드
         ,{field:"vinNo"        ,title:"<spring:message code='global.lbl.vinNo' />"         ,width:150      , attributes:{"class":"ac"}}                                          // VIN
         ,{field:"pdiDt"        ,title:"<spring:message code='global.llbl.pdiDt' />"        ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// PDI배정일
         ,{field:"vinDt"        ,title:"<spring:message code='global.lbl.vinDt' />"         ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// VIN배정일
         ,{field:"retailDtStr"     ,title:"<spring:message code='sal.lbl.factoryPltGidt' />"   ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 공장출고일자
         ,{field:"dlrGrDtStr"     ,title:"<spring:message code='sal.lbl.grDt' />"              ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 입고일
         ,{field:"custSaleDtStr"  ,title:"<spring:message code='sal.lbl.saleDt' />"            ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 판매일

      ]
  });
});

//radio 버튼 처리
function changedRadio(flg){
   if(flg){
       $("#sRadioY").prop("checked", true);
       $("#sOrdDtS").data("kendoDatePicker").value("");
       $("#sOrdDtE").data("kendoDatePicker").value("");

       $(".group-OrdTpNotN1").hide();
       $(".group-OrdTpOnlN1").show();
       $(".group-OrdDt1").hide();
       $(".group-OrdDt2").show();
   }else{
       if( $("#sOrdDtS").data("kendoDatePicker").value() == "" || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
           $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
           $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
       }

       $(".group-OrdTpNotN1").show();
       $(".group-OrdTpOnlN1").hide();

       $(".group-OrdDt1").show();
       $(".group-OrdDt2").hide();
   }
}

//문자를 받아서 3자리마다 콤마를 찍어 반환한다.
function addcomma(arg) {
    var v = arg.toString();

    tmp=v.split('.');
    var str=new Array();
    var v=tmp[0].replace(/,/gi,''); //콤마를 빈문자열로 대체

    for(var i=0;i<=v.length;i++){ //문자열만큼 루프를 돈다.

        str[str.length]=v.charAt(v.length-i); //스트링에 거꾸로 담음

        if(i%3==0&&i!=0&&i!=v.length){ //첫부분이나, 끝부분에는 콤마가 안들어감
            str[str.length]='.'; //세자리마다 점을 찍음 - 배열을 핸들링할때 쉼표가 들어가면 헛갈리므로
        }
    }

    str=str.reverse().join('').replace(/\./gi,','); //배열을 거꾸로된 스트링으로 바꾼후에, 점을 콤마로 치환

    if(str.substring(0,1) == "-" && str.substring(1,2) == ","){
        str = "-" + str.substring(2);
    }

    //return (tmp.length==2 && parseInt(tmp[1]) > 0)?str+'.'+tmp[1]:str;
    return str;
}
</script>
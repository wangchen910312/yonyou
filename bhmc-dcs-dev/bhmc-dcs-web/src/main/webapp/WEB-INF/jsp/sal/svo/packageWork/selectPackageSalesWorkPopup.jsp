<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 집단판매업무신청 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnConfirm" class="btn_m"><spring:message code='sal.btn.submit' /></button>       	  			<!-- 신청 -->
            <button id="btnSave" class="btn_m"><spring:message code='global.btn.save' /></button>             			<!-- 저장 -->
            <button id="btnDelete" class="btn_m"><spring:message code='global.btn.del' /></button>            			<!-- 삭제 -->
            <button id="btnPrint" class="btn_m"><spring:message code='global.btn.print' /></button>           			<!-- 인쇄 -->
            <%-- <button id="btnClose" class="btn_m"><spring:message code='global.btn.close' /></button> --%>           <!-- 닫기 -->
        </div>
    </div>


    <form id="packageForm" name="packageForm" method="POST">
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col style="width:15%;">
                    <col style="width:35%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.reqDt'/></span></th>   <!-- 신청일자 -->
                        <td>
                            <input id="reqDt" name="reqDt" class="form_datepicker" data-json-obj="true" />
                            <!--
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="reqStartDt" name="reqStartDt" class="form_datepicker" data-json-obj="true" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="reqEndDt" name="reqEndDt" class="form_datepicker" data-json-obj="true" />
                                </div>
                            </div>
                             -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.applNumber' /></th>       <!-- 신청번호 -->
                        <td>
                            <input id="reqSeq" name="reqSeq" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlrCd' /></span></th>       <!-- 딜러코드 -->
                        <td>
                            <input id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlrNm' /></span></th>       <!-- 딜러명 -->
                        <td>
                            <input id="dlrNm" readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <%-- <tr>
                        <th scope="row"><spring:message code='sal.lbl.approveStat' /></th>       <!-- 승인상태 -->
                        <td>
                            <input id="approveCd" name="approveCd" disabled class="form_comboBox form_disabled" data-json-obj="true" />
                        </td>
                        <td></td>
                    </tr> --%>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /></span></th><!-- 고객명 -->
                        <td>
                            <input type="text" maxlength="50" id="custNm" name="custNm" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.itemTp' /></span></th><!-- 항목유형 -->
                        <td>
                            <input id="atcDstinCd" name="atcDstinCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.etcCarRePolicy' /></span></th><!-- 기타경쟁차량및관련정책 -->
                        <td class="required_area" colspan="3">
                            <textarea id="feePolicyCont" name="feePolicyCont" rows="3" cols="" maxlength="350" class="form_textarea" data-json-obj="true"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <%-- <th scope="row"><spring:message code='global.lbl.dmsOpen' /></th><!-- 공시여부 -->
                        <td>
                            <ul class="tabmenu">
                                <li id="dmsOpenY"><button type="button">公示</button></li><!-- 공시 -->
                                <li id="dmsOpenN" class="on"><button type="button">未公示</button></li><!-- 미공시 -->
                                <input type="hidden" id="dmsOpenYn" name="dmsOpenYn" data-json-obj="true">
                            </ul>
                        </td> --%>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.poaOffer' /></span></th> <!-- 제조사인증서제공<br>필요여부 -->
                        <td>
                            <%--
                            <ul class="tabmenu">
                                <li id="poaOfferY"><button type="button"><spring:message code='global.lbl.offer' /></button></li><!-- 제공 -->
                                <li id="poaOfferN" class="on"><button type="button"><spring:message code='global.lbl.nonOffer' /></button></li><!-- 미제공 -->
                                <input type="hidden" id="poaOfferYn" name="poaOfferYn" data-json-obj="true">
                            </ul>
                             --%>
                            &nbsp;
                            <label class="label_check"><input id="poaOfferY" name="poaOffer" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='global.lbl.offer' /><!-- 제공--></label>
                            <label class="label_check"><input id="poaOfferN" name="poaOffer" type="radio" value="N" class="form_check"> <spring:message code='global.lbl.nonOffer' /><!-- 미제공--></label>
                            <input type="hidden" id="poaOfferYn" name="poaOfferYn" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.applysDt' /></th>       <!-- 임명일자 -->
	                    <td>
	                        <div class="form_float">
	                            <div class="date_left">
	                                <input id="applyStartDt" disabled class="form_datepicker form_disabled">
	                                <span class="txt_from">~</span>
	                            </div>
	                            <div class="date_right">
	                                <input id="applyEndDt" disabled class="form_datepicker form_disabled">
	                            </div>
	                        </div>
	                    </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <span style="display:none">
            <input type="hidden" id="usrId" name="usrId" data-json-obj="true" />
            <input type="hidden" id="usrNm" name="usrNm" data-json-obj="true" />
            <input type="hidden" id="approveCd"  data-json-obj="true" />
            <input type="hidden" id="delYn" />
        </span>
    </form>


    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.lbl.carCnt' /></h2>       <!-- 차량내역 -->
        <div class="btn_right">
            <button class="btn_s" id="btnAddDetail"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
            <button class="btn_s" id="btnDelDetail"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
            <%-- <button class="btn_s btn_cancel" id="btnCancelDetail"><spring:message code='global.btn.cancel' /></button> --%><!-- 취소 -->
        </div>
    </div>
    <div class="table_grid">
        <div id="vehicleGrid"></div>
    </div>


    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.title.evalRlt' /></h2>       <!-- 심사내역 -->
    </div>
    <div class="table_grid">
        <div id="evlGrid"></div>
    </div>

</section>
<!-- //집단판매업무신청 팝업 -->

<!-- script -->
<script>
var toDay = "${toDay}";
var oneDay = "${oneDay}";

// 차종
var carLineCdDSList = [];
var carLineCdObj = {};

// 그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};

<c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
  carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//항목 SAL151
var atcDstinCdDSList = [];
<c:forEach var="obj" items="${atcDstinCdDS}">
    atcDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//상태 SAL184
var stateTpDSList = [];
<c:forEach var="obj" items="${stateTpDS}">
    stateTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//그리드 모델 콤보 DataSource
var modelCdDSList = [];

$(document).ready(function() {

    // 승인상태
/*     $("#approveCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stateTpDSList
       ,optionLabel:" "           //선택
    }); */

    $(document).keypress(function(event){
        if(event.which == "13"){
            return false;
        }
    });

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    $("#dlrCd").val(options.sDlrCd);
    $("#dlrNm").val(options.sDlrNm);
    $("#usrId").val(options.sUsrId);
    $("#usrNm").val(options.sUsrNm);
    $("#reqSeq").val(options.sReqSeq);

    // 항목
    $("#atcDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:atcDstinCdDSList
       , optionLabel:" "           //선택
    });

    //등록일자
    $("#reqDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:toDay
    });

    //확정일자
    $("#confirmDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    
    //위임일자
    $("#applyStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
    $("#applyEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });


   // DMS시스템에서 공시 여부:공시
   $("#dmsOpenY").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#dmsOpenYn").val("Y");

   });
   // DMS시스템에서 공시 여부:미공시
   $("#dmsOpenN").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#dmsOpenYn").val("N");
   });
   $("#dmsOpenN").click();

   // BRAND에서 위임장 제공여부:공시
   $("#poaOfferY").click(function(){
       //$(this).siblings("li").removeClass("on");
       //$(this).addClass("on");
       $("#poaOfferYn").val("Y");

   });
   // BRAND에서 위임장 제공여부:미공시
   $("#poaOfferN").click(function(){
       //$(this).siblings("li").removeClass("on");
       //$(this).addClass("on");
       $("#poaOfferYn").val("N");
   });
   $("#poaOfferN").click();

   
   
   // 저장 버튼
   $("#btnSave").kendoButton({
       click:function(e){
    	   
    	   if(fnValidationChk()){
           
	           //신청차량
	           var grid = $("#vehicleGrid").data("kendoExtGrid");
	           var data = grid.dataSource.view();
	           var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
	
	           if(data.length == 0 ){
	               dms.notification.info("<spring:message code='ser.title.carInfo' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
	               return;
	           }

	           var rows = grid.tbody.find("tr");
	           var beforCarline = "",nowCarline = "",dupCnt = 0,carCnt = 0;carlineData = 0;modelData = 0;
	           var data = grid.dataSource.view();
	           $.each(rows, function(idx, row){
	               var item = grid.dataItem(row);
	               //if(item.useYn == "Y"){useCnt++;}
	               nowCarline = item.carlineCd;
	               if(idx > 0){
	                   var val = data[idx-1];
	                   beforCarline = val.carlineCd;
	               }

	               if(item.appQty == 0){carCnt++;}
	               if(nowCarline == beforCarline){dupCnt++;}
	               
	               if(item.carlineCd == ""){carlineData++;}
	               if(item.modelCd == ""){modelData++;}
	           });

	           if (carlineData > 0) {
	               //차종은(는) 필수 입력사항 입니다. [车种是必输项目] 
	               dms.notification.warning("<spring:message code='global.lbl.carLine' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
	               return;
	           }
	           
	           if (modelData > 0) {
	        	   //모델은(는) 필수 입력사항 입니다. [车款是必输项目]   
	               dms.notification.info("<spring:message code='global.lbl.model' var='carline' /><spring:message code='global.info.duplicateCheck' arguments='${carline}' />");
	               return;
	           }
	           
	           
	           if (dupCnt > 0) {
	               //차종은 중복될 수 없습니다.
	               dms.notification.info("<spring:message code='global.lbl.carLine' var='carline' /><spring:message code='global.info.duplicateCheck' arguments='${carline}' />");
	               return;
	           }

	           if (carCnt > 0) {
	               //수량이 0보다 작거나 같을 수 없습니다.
	               dms.notification.info("<spring:message code='global.err.chkZeroQty' />");
	               return;
	           }

	           if(!confirm("<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />")){
	               return;
	           }


	           var paramData = $("#packageForm").serializeObject($("#packageForm").serializeArrayInSelector("[data-json-obj='true']"));
	           //paramData.reqStartDt = $("#reqStartDt").data("kendoExtMaskedDatePicker").value();
	           //paramData.reqEndDt   = $("#reqEndDt").data("kendoExtMaskedDatePicker").value();
	           paramData.reqDt = $("#reqDt").data("kendoExtMaskedDatePicker").value();
	           paramData.submitGubun = "save";

	           // form 데이터 및 그리드 변경 데이터 세팅
	           var saveData = $.extend(
	              {"packageSaleWorkVO":paramData}
	              ,{"vehicleVO":saveData}
	           );



	           $.ajax({
	               url:"<c:url value='/sal/svo/packageWork/multiPackageSalesWorkPopup.do' />",
	               data:JSON.stringify(saveData),
	               type:"POST",
	               dataType:"json",
	               contentType:"application/json",
	               error:function(jqXHR,status,error){
	                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
	               }
	
	           }).done(function(result) {
	
	               var data = [];
	               data.msg = 'save';
	               options.callbackFunc(data);
	
	               fnSelectLoading(result["packageSalesWorkVO"].reqSeq);
	               
				
	               $("#btnSave").data("kendoButton").enable(true);        
	               $("#btnDelete").data("kendoButton").enable(true);       
	               $("#btnConfirm").data("kendoButton").enable(true);  
	               $("#btnPrint").data("kendoButton").enable(true); 
	               
	               $("#btnAddDetail").data("kendoButton").enable(true); 
	               $("#btnDelDetail").data("kendoButton").enable(true); 
	           });
    	   }

       }
   });

   // 확정 버튼
   $("#btnConfirm").kendoButton({
       click:function(e){
    	   
    	   
    	   
    	   if(fnValidationChk()){
               
	           //신청차량
	           var grid = $("#vehicleGrid").data("kendoExtGrid");
	           var data = grid.dataSource.view();
	           var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
	
	           if(data.length == 0 ){
	               dms.notification.info("<spring:message code='ser.title.carInfo' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
	               return;
	           }

	           var rows = grid.tbody.find("tr");
	           var beforCarline = "",nowCarline = "",dupCnt = 0,carCnt = 0;carlineData = 0;modelData = 0;
	           var data = grid.dataSource.view();
	           $.each(rows, function(idx, row){
	               var item = grid.dataItem(row);
	               //if(item.useYn == "Y"){useCnt++;}
	               nowCarline = item.carlineCd;
	               if(idx > 0){
	                   var val = data[idx-1];
	                   beforCarline = val.carlineCd;
	               }

	               if(item.appQty == 0){carCnt++;}
	               if(nowCarline == beforCarline){dupCnt++;}
	               
	               if(item.carlineCd == ""){carlineData++;}
	               if(item.modelCd == ""){modelData++;}
	           });

	           if (carlineData > 0) {
	               //차종은(는) 필수 입력사항 입니다. [车种是必输项目] 
	               dms.notification.warning("<spring:message code='global.lbl.carLine' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
	               return;
	           }
	           
	           if (modelData > 0) {
	        	   //모델은(는) 필수 입력사항 입니다. [车款是必输项目]   
	               dms.notification.info("<spring:message code='global.lbl.model' var='carline' /><spring:message code='global.info.duplicateCheck' arguments='${carline}' />");
	               return;
	           }
	           
	           
	           
	           if (dupCnt > 0) {
	               //차종은 중복될 수 없습니다.
	               dms.notification.info("<spring:message code='global.lbl.carLine' var='carline' /><spring:message code='global.info.duplicateCheck' arguments='${carline}' />");
	               return;
	           }

	           if (carCnt > 0) {
	               //수량이 0보다 작거나 같을 수 없습니다.
	               dms.notification.info("<spring:message code='global.err.chkZeroQty' />");
	               return;
	           }

	           if(!confirm("<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />")){
	               return;
	           }


	           var paramData = $("#packageForm").serializeObject($("#packageForm").serializeArrayInSelector("[data-json-obj='true']"));
	           //paramData.reqStartDt = $("#reqStartDt").data("kendoExtMaskedDatePicker").value();
	           //paramData.reqEndDt   = $("#reqEndDt").data("kendoExtMaskedDatePicker").value();
	           paramData.reqDt = $("#reqDt").data("kendoExtMaskedDatePicker").value();
	           paramData.submitGubun = "confirm";

	           // form 데이터 및 그리드 변경 데이터 세팅
	           var saveData = $.extend(
	              {"packageSaleWorkVO":paramData}
	              ,{"vehicleVO":saveData}
	           );



	           $.ajax({
	               url:"<c:url value='/sal/svo/packageWork/multiPackageSalesWorkPopup.do' />",
	               data:JSON.stringify(saveData),
	               type:"POST",
	               dataType:"json",
	               contentType:"application/json",
	               error:function(jqXHR,status,error){
	                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
	               }
	
	           }).done(function(result) {
	
	               var data = [];
	               data.msg = 'save';
	               options.callbackFunc(data);
	
	               fnSelectLoading(result["packageSalesWorkVO"].reqSeq);
	               
				
	               $("#btnSave").data("kendoButton").enable(false);        
	               $("#btnDelete").data("kendoButton").enable(false);       
	               $("#btnConfirm").data("kendoButton").enable(false);  
	               $("#btnPrint").data("kendoButton").enable(true); 
	               
	               $("#btnAddDetail").data("kendoButton").enable(false); 
	               $("#btnDelDetail").data("kendoButton").enable(false); 
	           });
    	   }   
	           
           /* var param = {};
           param.dlrCd = $("#dlrCd").val();
           param.usrId = $("#usrId").val();
           param.reqSeq = $("#reqSeq").val();

           if(!confirm("<spring:message code='global.btn.applyReq' var='globalBtnApplyReq' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnApplyReq}' />")){
               return;
           }

           $.ajax({
               url:"<c:url value='/sal/svo/packageWork/confirmPackageSalesWorkPopup.do' />",
               data:JSON.stringify(param),
               type:'POST',
               dataType:'json',
               contentType:'application/json',
               //async:false,
               error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               },
               success:function(jqXHR, textStatus) {
                   var data = [];
                   data.msg = 'save';
                   options.callbackFunc(data);

                   //$("#approveCd").data("kendoExtDropDownList").value("B");
                   $("#approveCd").val("B");
                   $("#btnSave").data("kendoButton").enable(false);          // 저장숨김
                   $("#btnDelete").data("kendoButton").enable(false);        // 삭제숨김
                   $("#btnConfirm").data("kendoButton").enable(false);       // 확정숨김
                   $("#btnPrint").data("kendoButton").enable(true); 
                   
                   $("#btnAddDetail").data("kendoButton").enable(false); 
                   $("#btnDelDetail").data("kendoButton").enable(false); 
                   
                   fnDisabledView("false");
               }
           }); */
       }
   });

   // 삭제 버튼
   $("#btnDelete").kendoButton({
       click:function(e){

           if(  $("#dlrCd").val() == "" || $("#usrId").val() == "" || $("#reqNo").val() == ""){
               parent.popupWindow.close();
               return false;
           }

           var param = {};
           param.dlrCd = $("#dlrCd").val();
           param.usrId = $("#usrId").val();
           param.reqSeq = $("#reqSeq").val();

           $.ajax({
               url:"<c:url value='/sal/svo/packageWork/deletePackageSalesWorkPopup.do' />",
               data:JSON.stringify(param),
               type:'POST',
               dataType:'json',
               contentType:'application/json',
               //async:false,
               error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               },
               success:function(jqXHR, textStatus) {
                    var data = [];
                    data.msg = 'save';
                    options.callbackFunc(data);
               }
           });
       }
   });

   // 닫기 버튼
   $("#btnClose").kendoButton({
       click:function(e){
           //var data = [];
           //data.msg = 'close';
           //options.callbackFunc(data);
           parent.popupWindow.close();
       }
   });


   
   
   
	//인쇄
	$("#btnPrint").kendoButton({ 		
	    click:function(e){
	    	//개발진행 예정중입니다.
	    	dms.notification.error("<spring:message code='global.info.developIng'/>");
	    }
	});
   
   
   
	
    //차량내역 - 취소
    $("#btnCancelDetail").kendoButton({
        click:function(e) {
            $('#vehicleGrid').data('kendoExtGrid').cancelChanges();
        }
    });



    //차량내역  - 추가
    $("#btnAddDetail").kendoButton({
        click:function(e) {

            $('#vehicleGrid').data('kendoExtGrid').dataSource.insert(0, {
                "dlrCd":$("#dlrCd").val()                   //딜러코드
                ,"usrId":$("#usrId").val()                  //사용자ID
                ,"reqSeq":$("#reqSeq").val()                 //요청일련번호
                ,"carlineCd":""
                ,"modelCd":""
                ,"modelNm":""
                ,"appQty":0                                //수량
            });

        }
    });

    //차량내역  - 삭제
    $("#btnDelDetail").kendoButton({
        click:function(e) {
            var grid = $("#vehicleGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

	
	
   
   // 차량내역 Grid
   $("#vehicleGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkPopupVehicle.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};


                        params["sDlrCd"] = $("#dlrCd").val();           // 딜러코드
                        params["sUsrId"] = $("#usrId").val();           // 사용자id
                        params["sReqSeq"] = $("#reqSeq").val();         // 요청일련번호

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id :"pk",
                    fields:{
                         dlrCd:{type:"string"}                 // 딜러코드
                        ,usrId:{type:"string"}                 // 사용자ID
                        ,reqSeq:{type:"number"}                // 요청번호
                        ,carlineCd :{type:"string"}            // 차종코드
                        //,carlineNm:{type:"string"}             // 모델코드
                        ,modelCd:{type:"string"}               // 모델코드
                        ,modelNm:{type:"string"}               // 모델코드
                        ,appQty:{type:"number",validation:{required:true}}                // 수량
                        ,reqRc:{type:"string"}                 // 고객요구 D/C
                        ,regDt:{type:"date"}
                        ,updtDt:{type:"date"}
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:true
       ,filterable:false
       ,height:100
       ,sortable:false
       ,pageable:false
       ,columns:[
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqSeq", hidden:true}      // 요청번호
          ,{  // 차량
              field:"carlineCd"
             ,title:"<spring:message code='global.lbl.carLine' />"
             ,width:200
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
             ,template:"#=bf_selectCarLine(carlineCd)#"
             ,editor:function (container, options){
                 if( options.model.reqSeq == "" || options.model.carlineCd == ""){
                     $('<input required name="carlineNm" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                         , dataTextField:"carlineNm"
                         , dataValueField:"carlineCd"
                         , dataSource:carLineCdDSList
                         , select:selectGridCarlineCd
                     });
                 }else{
                     container.context.innerText = carLineCdObj[options.model.carlineCd];
                 }
             }
          }
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
          ,{    // 모델
              field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:200
              , headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
              ,template:"#= bf_selectModel(modelCd, modelNm) #"
              ,editor:function (container, options){

                  if(     options.model.carlineCd != ""
                      && (options.model.modelCd == "" || options.model.reqSeq == "") ){
                      $('<input required name="modelCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"modelNm"
                          ,dataValueField:"modelCd"
                          ,dataSource:modelCdDSList
                      });
                  }else{
                      if(options.model.modelNm != ""){
                          container.context.innerText = options.model.modelNm;
                      }else{
                          //container.context.innerText = modelCdObj[options.model.modelCd];
                          container.context.innerText = "<spring:message code='global.lbl.carLine' var='carline' /><spring:message code='global.info.chkSelectItemMsg' arguments='${carline}' />";
                      }
                  }
              }
          }
          ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
          ,{field:"appQty", title:"<spring:message code='global.lbl.qty'/>", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}     // 수량
          //,{field:"reqRc", title:"<spring:message code='global.lbl.reqRc'/>", width:100, attributes:{"class":"ar"}}     // 고객요청DC
       ]
   });


   // 심사Grid
   $("#evlGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkPopupEvl.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        // 딜러코드
                        params["sDlrCd"] = $("#dlrCd").val();
                        // 사용자id
                        params["sUsrId"] = $("#usrId").val();
                        // 요청일련번호
                        params["sReqSeq"] = $("#reqSeq").val();

                        //console.log('evlGrid params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"reqNo",
                    fields:{
                         dlrCd:{type:"string"}                 // 딜러코드
                        ,usrId:{type:"string"}                 // 사용자ID
                        ,reqSeq:{type:"number"}                // 요청번호
                        ,reqNo :{type:"number"}                // 일련번호
                        ,pevalId   :{type:"string"}            //심사자ID
                        ,evalDt    :{type:"date"}              //심사일자
                        ,evalRsltYn:{type:"string"}            //심사결과여부
                        ,remark    :{type:"string"}            //비고
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,filterable:false
       ,height:90
       ,editable:false
       ,autoBind:false
       ,selectable:"row"
       ,sortable:false
       ,pageable:false
       ,columns:[
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqSeq", hidden:true}      // 요청번호
          ,{field:"reqNo", hidden:true}       // 일련번호
          ,{  // 심사자
              field:"pevalId"
             ,title:"<spring:message code='global.lbl.peval' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
          }
          ,{  // 심사일자
              field:"evalDt"
             ,title:"<spring:message code='global.lbl.evalDt' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
             ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{  // 심사결과
              field:"evalRsltYn"
             ,title:"<spring:message code='global.lbl.evalRslt' />"
             ,width:80
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,template:"#=evalRsltYn=='Y'?'<spring:message code='global.btn.approval'/>':'<spring:message code='global.btn.nonApproval'/>'#"
          }
          ,{  // 심사평가
              field:"remark"
             ,title:"<spring:message code='global.lbl.evalRemark' />"
             ,width:100
             ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,attributes:{"class":"ac"}
          }
       ]
   });


   function fnSelectLoading (reqSeq){

       var dtSet = {};
        // 상세조회
        if(Number(options.sReqSeq) > 0 ){
            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/sal/svo/packageWork/selectPackageSalesWorkPopupContain.do"
                ,data:JSON.stringify({"sDlrCd":options.sDlrCd, "sUsrId":options.sUsrId, "sReqSeq":options.sReqSeq})
                ,async:false
            });
           dtSet = responseJson.data[0];
        }
        //저장후 재조회.
        else if(typeof(reqSeq) != "undefined"){
            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/sal/svo/packageWork/selectPackageSalesWorkPopupContain.do"
                ,data:JSON.stringify({"sDlrCd":options.sDlrCd, "sUsrId":options.sUsrId, "sReqSeq":reqSeq})
                ,async:false
            });
           dtSet = responseJson.data[0];
        }
        /* alert(Number(options.sReqSeq) == 0 && typeof(reqSeq) == "undefined" );
        if(Number(options.sReqSeq) == 0 && typeof(reqSeq) == "undefined" ){
            fnDisabledView("true");
        } */

        

        if(dtSet != null && dtSet.reqSeq != null){
            //$("#reqStartDt").data("kendoExtMaskedDatePicker").value(dtSet.reqStartDt);   //등록일자
            //$("#reqEndDt").data("kendoExtMaskedDatePicker").value(dtSet.reqEndDt);
            $("#reqDt").data("kendoExtMaskedDatePicker").value(dtSet.reqDt);

            $("#dlrNm").val(dtSet.dlrNm);    //딜러명
            $("#custNm").val(dtSet.custNm);    //고객명
            $("#reqSeq").val(dtSet.reqSeq);    //신청번호
     
            $("#atcDstinCd").data("kendoExtDropDownList").value(dtSet.atcDstinCd);    //항목
            //$("#atcIntroCont").val(dtSet.atcIntroCont);    //고객명
            //$("#approveCd").data("kendoExtDropDownList").value(dtSet.approveCd);    //승인상태
            $("#approveCd").val(dtSet.approveCd);    //승인상태
         
            $("#feePolicyCont").val(dtSet.feePolicyCont);    //경쟁차 수수료 상관정책

            // DMS시스템에서 공시여부
            $("#dmsOpenYn").val(dtSet.dmsOpenYn);
            if(dtSet.dmsOpenYn == "Y"){
                $("#dmsOpenY").click();
            }else{
                $("#dmsOpenN").click();
            }

            // BRAND에서 위임장 제공여부
            $("#poaOfferYn").val(dtSet.poaOfferYn);
            if(dtSet.poaOfferYn == "Y"){
                $("#poaOfferY").click();
            }else{
                $("#poaOfferN").click();
            }

            
            $("#applyStartDt").data("kendoExtMaskedDatePicker").value(dtSet.applyStartDt);		//임명기간-시작일 
            $("#applyEndDt").data("kendoExtMaskedDatePicker").value(dtSet.applyEndDt);			//임명기간-종료일 

            $('#evlGrid').data('kendoExtGrid').dataSource.read();
            $("#vehicleGrid").data('kendoExtGrid').dataSource.read();
        }


       /**
        * 승인구분:버튼 표시
        **/
        // 저장
        if(dtSet.approveCd == "A"){
            $("#btnSave").data("kendoButton").enable(true);        
            $("#btnDelete").data("kendoButton").enable(true);       
            $("#btnConfirm").data("kendoButton").enable(true);  
            $("#btnPrint").data("kendoButton").enable(true); 
            
            $("#btnAddDetail").data("kendoButton").enable(true); 
            $("#btnDelDetail").data("kendoButton").enable(true); 
            
            fnDisabledView("true");
        }  // 승인신청:확정
        else if(dtSet.approveCd == "B" || dtSet.approveCd == "C" || dtSet.approveCd == "D" ){
            $("#btnSave").data("kendoButton").enable(false);        
            $("#btnDelete").data("kendoButton").enable(false);       
            $("#btnConfirm").data("kendoButton").enable(false);     
            $("#btnPrint").data("kendoButton").enable(true); 
            
            $("#btnAddDetail").data("kendoButton").enable(false); 
            $("#btnDelDetail").data("kendoButton").enable(false); 
            
            fnDisabledView("false");
        }   
        else{
            $("#btnConfirm").data("kendoButton").enable(true);       
            $("#btnSave").data("kendoButton").enable(true);          
            $("#btnDelete").data("kendoButton").enable(false);    
            $("#btnPrint").data("kendoButton").enable(false); 
            
            $("#btnAddDetail").data("kendoButton").enable(true); 
            $("#btnDelDetail").data("kendoButton").enable(true); 
            
            fnDisabledView("true");
        }
   }


   fnSelectLoading();




    /********************************************************************************************************/


});

// 검색조건:계약일자의 시작일-종료일 날짜 비교
/*
fnChkSearchDate = function(e){
    if(dms.string.isEmpty($(this).val())){return;}

    var startDt = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
    var endDt = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}
*/

/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/veh/vehicleMaster/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;

    modelCdObj = [];
    $.each(modelCdDSList, function(idx, obj){
        modelCdObj[obj.modelCd] = obj.modelNm;
    });
};


//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return dms.string.strNvl(carLineCdObj[carlineCd]);
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
    return dms.string.strNvl(modelCdObj[modelCd]);
}



function fnDisabledView(stat){
    if(stat == 'false'){
        $("#reqDt").data("kendoExtMaskedDatePicker").enable(false);                     //신청일자
        $("#custNm").prop("disabled","disabled").addClass("form_disabled");                 //고객명
        $("#atcDstinCd").data("kendoExtDropDownList").enable(false);                       //항목유형
        //$("#atcIntroCont").prop("disabled","disabled").addClass("form_disabled");           //항목소개
        $("#feePolicyCont").prop("disabled","disabled").addClass("form_disabled");          //경쟁차량수수료관련정책
        $("#poaOfferYn").addClass("disabled");                                      //제조사인증서제공필요여부
        $("#poaOfferY").prop("disabled","disabled")
        $("#poaOfferN").prop("disabled","disabled")
    }else {
        $("#reqDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#custNm").prop("disabled","").removeClass("form_disabled");
        $("#atcDstinCd").data("kendoExtDropDownList").enable(true);
        //$("#atcIntroCont").prop("disabled","").removeClass("form_disabled");
        $("#feePolicyCont").prop("disabled","").removeClass("form_disabled");
        $("#poaOfferYn").removeClass("disabled");
        $("#poaOfferY").prop("disabled","")
        $("#poaOfferN").prop("disabled","")
    }
}



function fnValidationChk(){
	/*
    if($("#reqStartDt").data("kendoExtMaskedDatePicker").value() == "" || $("#reqEndDt").data("kendoExtMaskedDatePicker").value() == ""){
        // {등록일자}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.carRegDt' var='globalLblCarRegDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarRegDt}' />");
        return false;
    }
    */

    if( dms.string.isEmpty($("#reqDt").data("kendoExtMaskedDatePicker").value()) ){
        // {등록일자}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.carRegDt' var='globalLblCarRegDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarRegDt}' />");
        return false;
    }

    if($("#custNm").val() == ""){
        // 고객명을 입력해주세요.
        dms.notification.info("<spring:message code='global.lbl.custNm' var='globalLblCustNm' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblCustNm}' />");
        $("#custNm").focus();
        return false;
    }

    if($("#atcDstinCd").data("kendoExtDropDownList").value() == "" ){
        // {항목}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.item' var='globalLblItem' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblItem}' />");
        $("#atcDstinCd").focus();
        return false;
    }

    /* if( dms.string.isEmpty($("#atcIntroCont").val()) ){
        // {항목소개}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.atcIntroCont' var='globalLblAtcIntroCont' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblAtcIntroCont}' />");
        $("#atcIntroCont").focus();
        return false;
    } */

    if( dms.string.isEmpty($("#feePolicyCont").val()) ){
        // {경쟁차 수수료 상관정책}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.etcCarRePolicy' var='etcCarRePolicy' /><spring:message code='global.info.chkSelectItemMsg' arguments='${etcCarRePolicy}' />");
        $("#feePolicyCont").focus();
        return false;
    }
    
    return true;
}

</script>
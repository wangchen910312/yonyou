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
                        </td>
                        <th scope="row"><spring:message code='global.lbl.applNumber' /></th>       <!-- 신청번호 -->
                        <td>
                            <input type="text" id="reqSalNo" name="reqSalNo" readonly class="form_input form_readonly" data-json-obj="true" />
                            <input type="hidden" id="reqSeq" name="reqSeq" data-json-obj="true"/>
                        </td>
                    </tr>
                    <%-- <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlrCd' /></span></th>       <!-- 딜러코드 -->
                        <td>
                            <input id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlrNm' /></span></th>       <!-- 딜러명 -->
                        <td>
                            <input id="dlrNm" readonly class="form_input form_readonly" />
                        </td>
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
                        <th scope="row"><spring:message code='global.lbl.atcIntroCont' /></th>       <!-- 항목소개 -->
                        <td colspan="3">
                            <textarea id="atcIntroCont" rows="2" cols="" class="form_textarea" data-json-obj="true"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.etcCarRePolicy' /></span></th><!-- 기타경쟁차량및관련정책 -->
                        <td class="required_area" colspan="3">
                            <textarea id="feePolicyCont" name="feePolicyCont" rows="3" cols="" maxlength="350" class="form_textarea" data-json-obj="true"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.poaOffer' /></span></th> <!-- 항목확인서제공여부 -->
                        <td>
                            &nbsp;
                            <label class="label_check"><input id="poaOfferY" name="poaOffer" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='sal.lbl.ok' /><!-- 제공--></label>
                            <label class="label_check"><input id="poaOfferN" name="poaOffer" type="radio" value="N" class="form_check"> <spring:message code='sal.lbl.no' /><!-- 미제공--></label>
                            <input type="hidden" id="poaOfferYn" name="poaOfferYn" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.applysDt' /></th>       <!-- 권한부여기한 -->
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
            <input type="text" id="usrId" name="usrId" data-json-obj="true" />
            <input type="text" id="usrNm" name="usrNm" data-json-obj="true" />
            <input type="text" id="approveCd"  data-json-obj="true" />
            <input type="text" id="delYn" />
            <input type="text" id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true" />
            <input type="text" id="dlrNm" readonly class="form_input form_readonly" />
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
<c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdDSList.push({"carlineNm":"${obj.carlineNm}", "carlineCd":"${obj.carlineCd}"});
</c:forEach>
var carLineCdMap = dms.data.arrayToMap(carLineCdDSList, function(obj){return obj.carlineCd;});


//항목 SAL151
var atcDstinCdDSList = [];
<c:forEach var="obj" items="${atcDstinCdDS}">
    atcDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var atcDstinCdMap = dms.data.arrayToMap(atcDstinCdDSList, function(obj){return obj.cmmCd;});

//상태 SAL184
var stateTpDSList = [];
<c:forEach var="obj" items="${stateTpDS}">
    stateTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var stateTpMap = dms.data.arrayToMap(stateTpDSList, function(obj){return obj.cmmCd;});


//그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdMap = {};

$(document).ready(function() {

 // 팝업 설정값
    var parentData = parent.popupWindow.options.content.data;
    var pData = parentData.sData;

    $("#dlrCd").val(pData.dlrCd);
    $("#dlrNm").val(pData.dlrNm);
    $("#usrId").val(pData.usrId);
    $("#usrNm").val(pData.usrNm);
    $("#reqSeq").val(pData.reqSeq);
    $("#reqSalNo").val(pData.reqSalNo);


    /**
     * 차종에 따른 모델 조회
     */
     /*
    selectGridCarlineList = function(e) {

        var grid = $("#vehicleGrid").data("kendoExtGrid");
        var selectRow = grid.dataItem(grid.select());
        if(selectRow != null){
            selectRow.set("modelCd", "");
            selectRow.set("modelNm", "");
            selectRow.set("dirty", "true");
        }

        var dataItem = this.dataItem(e.item);
        if(dms.string.isNotEmpty(dataItem.carlineCd)){
            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/sal/veh/vehicleMaster/selectModel.do"
                ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async:false
            });
            modelCdDSList = responseJson.data;
            modelCdMap = [];
            if(modelCdDSList != null){
                $.each(modelCdDSList, function(idx, obj){
                    modelCdMap[obj.modelCd] = obj.modelNm;
                });
            }
        }
    }; */

    selectGridCarlineList = function(e) {

        var grid = $("#vehicleGrid").data("kendoExtGrid");
        var selectRow = grid.dataItem(grid.select());
        var dataItem = this.dataItem(e.item);
        selectGridCarlineDs({"sCarlineCd":dataItem.carlineCd});
    };

    selectGridCarlineDsList = function(carlineCd) {

        selectGridCarlineDs({"sCarlineCd":carlineCd});

    };

    selectGridCarlineDs = function(params) {

        modelCdDSList = [];
        modelCdMap = {};

        $.ajax({
            url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            async:false,
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus){
                if(result.data.length > 0 ){
                   // setFieldClear("01");

                    $.each(result.data , function(index , obj){
                        modelCdDSList.push({modelNm:obj.fscNm, modelCd:obj.fscCd})
                        //modelCdMap[obj.modelCd] = obj.fscNm;
                    })
                    modelCdMap = dms.data.arrayToMap(modelCdDSList, function(obj){return obj.modelCd;});
                }
            }
        });
    }

/*
        var dataItem = this.dataItem(e.item);
        if(dms.string.isNotEmpty(dataItem.carlineCd)){
            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/sal/veh/vehicleMaster/selectModel.do"
                ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async:false
            });
            modelCdDSList = responseJson.data;
            modelCdMap = [];
            if(modelCdDSList != null){
                $.each(modelCdDSList, function(idx, obj){
                    modelCdMap[obj.modelCd] = obj.modelNm;
                });
            }
        } */

    selectGridModelCd = function(carLine) {
        modelCdDSList = [];
        modelCdMap = {};

        $.ajax({
            url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />",
            data:JSON.stringify({"carlineCd":carLine}),
            type:'POST',
            dataType:'json',
            async:false,
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus){
                if(result.data.length > 0 ){
                   // setFieldClear("01");
                    modelCdDSList = [];
                    modelCdMap = {};
                    $.each(result.data , function(index , obj){
                        modelCdDSList.push({modelNm:obj.modelNm, modelCd:obj.modelCd})
                        //modelCdMap[obj.modelCd] = obj.fscNm;
                    })
                    modelCdMap = dms.data.arrayToMap(modelCdDSList, function(obj){return obj.modelCd;});
                }
            }
        });

       /*  if(dms.string.isNotEmpty(carLine)){
            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/sal/veh/vehicleMaster/selectModel.do"
                ,data:JSON.stringify({"carlineCd":carLine})
                ,async:false
            });
            modelCdDSList = responseJson.data;
            //modelCdMap = {};
            if(modelCdDSList != null){
                $.each(modelCdDSList, function(idx, obj){
                    modelCdMap[obj.modelCd] = obj.modelNm;
                });
            }
        } */
    };

    //1 Grid- 차종의 template 정의
    setCarLineMap = function (val) {
        var returnVal = "";
        if(val != null && val != ""){
            if(carLineCdMap[val] != undefined)
            returnVal = carLineCdMap[val].carlineNm;
        }
        return returnVal;
    }

    //2 Grid- 모델의 template 정의
    setModelMap = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          if(modelCdMap[val] != undefined)
          returnVal = modelCdMap[val].modelNm;
      }
      return returnVal;
    }

    $(document).keypress(function(event){
        if(event.which == "13"){
            return false;
        }
    });

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


	       if($("#custNm").val() == ""){
                // 고객명을 입력해주세요.
                dms.notification.info("<spring:message code='global.lbl.custNm' var='globalLblCustNm' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblCustNm}' />");
                $("#custNm").focus();
                return false;
            }

	       dms.window.confirm({
               message:"<spring:message code='global.btn.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save}' />"
               ,title :"<spring:message code='global.btn.save' />"
               ,callback:function(result){
                   if(result){
                       savePopupData("A");
                   }else{
                       return false;
                   }
               }
           });

       }
   });

   // 확정 버튼
   $("#btnConfirm").kendoButton({
       click:function(e){

    	   if(fnValidationChk()){

    	       dms.window.confirm({
                   message:"<spring:message code='sal.btn.submit' var='submit' /><spring:message code='global.info.cnfrmMsg' arguments='${submit}' />"
                   ,title :"<spring:message code='sal.btn.submit' />"
                   ,callback:function(result){
                       if(result){
                           savePopupData("B");
                       }else{
                           return false;
                       }
                   }
               });
    	   }
       }
   });


   // 삭제 버튼
   $("#btnDelete").kendoButton({
       click:function(e){

           if(  $("#dlrCd").val() == "" || $("#usrId").val() == "" || $("#reqNo").val() == ""){
               parent.popupWindow.close();
               return false;
           }

           var param = { dlrCd : $("#dlrCd").val()
                        ,usrId : $("#usrId").val()
                       ,reqSeq : $("#reqSeq").val()
               };

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
                    parentData.callbackFunc(data);
                    parent.popupWindow.close();
               }
           });
       },enable:false
   });

   // 닫기 버튼
   $("#btnClose").kendoButton({
       click:function(e){
           parent.popupWindow.close();
       }
   });

   //버튼 - 출력
   $("#btnPrint").kendoButton({
       click:function(e) {
           var sDlrCd = $("#dlrCd").val();
           var sUsrId = $("#usrId").val();
           var sReqSeq = $("#reqSeq").val();

           var printParam =  "&sDlrCd="+sDlrCd+"&sUsrId="+sUsrId+"&sReqSeq="+sReqSeq;
           var printReportUrl = "<c:url value='/ReportServer?reportlet=sale/screenRelation/selectGroupTaskrRegRpt.cpt'/>"+printParam;
           var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
       }
       ,enable:false
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

    savePopupData = function(stat){

        var grid = $("#vehicleGrid").data("kendoExtGrid");
        //var gridData = grid.getCUDData("insertList", "updateList", "deleteList");
        var gridData = grid.dataSource.data();
        
        if(gridData.length == 0 ){
            dms.notification.info("<spring:message code='ser.title.carInfo' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
            return;
        }

        var rows = grid.tbody.find("tr");
        var beforCarline = "",nowCarline = "",dupCnt = 0,carCnt = 0;carlineData = 0;modelData = 0;
        var data = grid.dataSource._data;
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
        /*  if (dupCnt > 0) {
            //차종은 중복될 수 없습니다.
            dms.notification.info("<spring:message code='global.lbl.carLine' var='carline' /><spring:message code='global.info.duplicateCheck' arguments='${carline}' />");
            return;
        } */
        if (carCnt > 0) {
            //수량이 0보다 작거나 같을 수 없습니다.
            dms.notification.info("<spring:message code='global.err.chkZeroQty' />");
            return;
        }

        var paramData = $("#packageForm").serializeObject($("#packageForm").serializeArrayInSelector("[data-json-obj='true']"));
        paramData.reqDt           = $("#reqDt").data("kendoExtMaskedDatePicker").value();
        paramData.submitGubun     = stat;
        paramData.orgApproveCd    = $("#approveCd").val();
        paramData.approveCd       = stat;
        paramData.dlrNm           = $("#dlrNm").val();
        paramData.custNm          = $("#custNm").val();
        paramData.reqSeq          = $("#reqSeq").val();
        paramData.reqSalNo        = $("#reqSalNo").val();
        paramData.atcDstinCd      = $("#atcDstinCd").val();
        paramData.feePolicyCont   = $("#feePolicyCont").val();
        paramData.atcIntroCont    = $("#atcIntroCont").val();
        paramData.dmsOpenYn       = $("#dmsOpenYn").val();
        paramData.poaOfferYn      = $("#poaOfferYn").val();
        paramData.applyStartDt    = $("#applyStartDt").data("kendoExtMaskedDatePicker").value();
        paramData.applyEndDt      = $("#applyEndDt").data("kendoExtMaskedDatePicker").value();

        var saveData = $.extend(
             {"packageSaleWorkVO":paramData}
            ,{"vehicleListVO":{"insertList" : gridData , "updateList" : [] , "deleteList" : []}}
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
             ,success:function (result, textStatus){

                 $("#reqSeq").val(result["packageSalesWorkVO"].reqSeq);
                 fnSelectLoading($("#reqSeq").val());
                 parentData.callbackFunc(result);

             }
             ,beforeSend:function(xhr){
                 dms.loading.show($("#window"));
             }
             ,complete:function(xhr,status){
                 dms.loading.hide($("#window"));
             }
         });
    };


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
                        ,carlineCd:{type:"string"}    //차종코드
                        ,carlineNm:{type:"string"}    //차종명
                        ,modelNm:{type:"string"}      //차관명
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
       ,autoBind:false
       ,height:143
       ,sortable:false
       ,pageable:false
       ,edit:function(e){
           var field = e.container.find("input");
           var fieldName;
           if(field.length > 1){
               fieldName = field[field.length-1].getAttribute("name");
           }else{
               fieldName = field.attr("name");
           }

           if( $("#approveCd").val() != "" ){
               if(fieldName == "carlineCd"){
                   if( $("#approveCd").val() != "A" ){
                       this.closeCell();
                   }
               }
               if(fieldName == "modelCd"){
                   if($("#approveCd").val() != "A" ){
                       this.closeCell();
                   }
               }
               if(fieldName == "appQty"){
                   if($("#approveCd").val() != "A" ){
                       this.closeCell();
                   }
               }
               if(fieldName == "reqRc"){
                   if($("#approveCd").val() != "A" ){
                       this.closeCell();
                   }
               }
           }

       }
       ,columns:[
           {field:"carlineCd", title:"<spring:message code='global.lbl.carlineNm' />",width:140, attributes:{"class":"al"}
              ,template:"#=setCarLineMap(carlineCd)#"
              ,editor:function (container, options){
                  $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                       autoBind:false
                      ,dataTextField:"carlineNm"
                      ,dataValueField:"carlineCd"
                      ,dataSource:carLineCdDSList
                      ,template:"#= carlineNm #"
                      ,select: selectGridCarlineList
                      ,valuePrimitive:true
                      ,height:180
                      ,change:function(e){
                          var grid = $("#vehicleGrid").data("kendoExtGrid");
                          // 해당 그리드의 tr객체중 선택한 열을 찾아 7번째 컬럼의 객체를 가져온다. (hidden포함해서 0부터 시작)
                          var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(2)");
                          grid.editCell(modelCell);
                          var selectedVal = grid.dataItem(grid.select());
                          selectedVal.set("modelCd", "");

                      }
                  });
              }
          }//차종code
          ,{field:"modelCd", title:"<spring:message code='global.lbl.model' />", width:150, attributes:{"class":"al"}
              //,template:"#= setModelMap(modelCd) #"
              ,template: function(dataItem){

                  if( dms.string.isNotEmpty(dataItem.modelCd) ){
                      if( dataItem.modelCd.length == 5 ){
                          selectGridCarlineDsList(dataItem.carlineCd);
                      }else{
                          //selectGridModelCd(dataItem.carlineCd);
                          return "";
                      }
                  }
                  var returnObj = "";
                  returnObj = dms.string.strNvl(setModelMap(dataItem.modelCd));
                  return returnObj;
              }
              ,editor:function (container, options){
                  $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                       autoBind:false
                      ,valuePrimitive:true
                      ,height:180
                      ,dataTextField:"modelNm"
                      ,dataValueField:"modelCd"
                      ,template: "#= setModelMap(modelCd) #"
                      ,dataSource:modelCdDSList
                  });
              }
          }       // 모델명
          ,{field:"appQty", title:"<spring:message code='global.lbl.qty'/>", width:80, attributes:{"class":"ar"}, format:"{0:n0}"
             ,editor:function(container, options){
              $('<input name="appQty" maxLength="5" data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtNumericTextBox({
                      min:0
                     ,max:10000
                      //,spinners:false
                  });
              }
          }     // 수량
          ,{field:"reqRc", title:"<spring:message code='sal.lbl.reqRc'/>", width:80, attributes:{"class":"ar"}}  // 고객희망할인가
          ,{field:"reqQuar", title:"<spring:message code='sal.lbl.reqQuar'/>", width:80, attributes:{"class":"ar"}
              ,editor:function(container, options){
                  $('<input name="reqQuar" maxLength="100" data-bind="value:' + options.field + '"  />')
                  .appendTo(container);
              }
          }  // 배치요구
          ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />", width:120, attributes:{"class":"ac"},hidden:true}//차종description
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqSeq", hidden:true}      // 요청번호
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드

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
       ,height:95
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
          ,{field:"pevalId",title:"<spring:message code='global.lbl.peval' />",width:100,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"},attributes:{"class":"ac"}}// 심사자
          ,{field:"evalDt",title:"<spring:message code='global.lbl.evalDt' />",width:100,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"},attributes:{"class":"ac"}
              ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }// 심사일자
          ,{field:"evalRsltYn",title:"<spring:message code='global.lbl.evalRslt' />",width:80,attributes:{"class":"ac"}
            // ,template:"#=evalRsltYn=='Y'?'<spring:message code='global.btn.approval'/>':'<spring:message code='global.btn.nonApproval'/>'#"
          }// 심사결과
          ,{field:"remark", title:"<spring:message code='global.lbl.evalRemark' />", width:100
             ,attributes:{"class":"al"}
          }// 심사평가
       ]
   });




   detailSet = function(detailData){

       if(detailData != null && detailData.reqSeq != null){
           $("#reqDt").data("kendoExtMaskedDatePicker").value(detailData.reqDt);

           $("#dlrNm").val(detailData.dlrNm);      //딜러명
           $("#custNm").val(detailData.custNm);    //고객명
           $("#reqSeq").val(detailData.reqSeq);    //신청번호
           $("#reqSalNo").val(detailData.reqSalNo);    //신청번호

           $("#atcDstinCd").data("kendoExtDropDownList").value(detailData.atcDstinCd);    //항목
           $("#approveCd").val(detailData.approveCd);    //승인상태

           $("#feePolicyCont").val(detailData.feePolicyCont);    //경쟁차 수수료 상관정책
           $("#atcIntroCont").val(detailData.atcIntroCont);    //고객명

           // DMS시스템에서 공시여부
           $("#dmsOpenYn").val(detailData.dmsOpenYn);
           if(detailData.dmsOpenYn == "Y"){
               $("#dmsOpenY").click();
           }else{
               $("#dmsOpenN").click();
           }

           // BRAND에서 위임장 제공여부
           $("#poaOfferYn").val(detailData.poaOfferYn);

           $("input[name='poaOffer']:radio:input[value="+detailData.poaOfferYn+"]").prop("checked", true);

           $("#applyStartDt").data("kendoExtMaskedDatePicker").value(detailData.applyStartDt);      //임명기간-시작일
           $("#applyEndDt").data("kendoExtMaskedDatePicker").value(detailData.applyEndDt);          //임명기간-종료일

           setButtonEnable(detailData.approveCd);
           $('#evlGrid').data('kendoExtGrid').dataSource.read();
           $("#vehicleGrid").data('kendoExtGrid').dataSource.read();
       }

   };

   setButtonEnable = function(stat){

       if(stat == "A"){
           $("#btnSave").data("kendoButton").enable(true);
           $("#btnDelete").data("kendoButton").enable(true);
           $("#btnConfirm").data("kendoButton").enable(true);
           $("#btnPrint").data("kendoButton").enable(true);

           $("#btnAddDetail").data("kendoButton").enable(true);
           $("#btnDelDetail").data("kendoButton").enable(true);

           fnDisabledView("true");
       }  // 승인신청:확정
       else if(stat == "B" || stat == "C" || stat == "D" ){
           $("#btnSave").data("kendoButton").enable(false);
           $("#btnDelete").data("kendoButton").enable(false);
           $("#btnConfirm").data("kendoButton").enable(false);
           $("#btnPrint").data("kendoButton").enable((stat == "B" || stat == "D") ? false : true);

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

   };


   function fnDisabledView(stat){
       if(stat == 'false'){
           $("#reqDt").data("kendoExtMaskedDatePicker").enable(false);                     //신청일자
           $("#custNm").prop("disabled","disabled").addClass("form_disabled");             //고객명
           $("#atcDstinCd").data("kendoExtDropDownList").enable(false);                       //항목유형
           $("#feePolicyCont").prop("disabled","disabled").addClass("form_disabled");      //경쟁차량수수료관련정책
           $("#atcIntroCont").prop("disabled","disabled").addClass("form_disabled");      //경쟁차량수수료관련정책
           $("#poaOfferYn").addClass("disabled");                                          //제조사인증서제공필요여부
           $("#poaOfferY").prop("disabled","disabled")
           $("#poaOfferN").prop("disabled","disabled")
       }else {
           $("#reqDt").data("kendoExtMaskedDatePicker").enable(true);
           $("#custNm").prop("disabled","").removeClass("form_disabled");
           $("#atcDstinCd").data("kendoExtDropDownList").enable(true);
           $("#feePolicyCont").prop("disabled","").removeClass("form_disabled");
           $("#atcIntroCont").prop("disabled","").removeClass("form_disabled");
           $("#poaOfferYn").removeClass("disabled");
           $("#poaOfferY").prop("disabled","")
           $("#poaOfferN").prop("disabled","")
       }
   };



   function fnSelectLoading (reqSeq){

        var sReqSeq;
        if(Number(pData.reqSeq) > 0 ){
            sReqSeq = pData.reqSeq;
        }else if(typeof(reqSeq) != "undefined"){
            sReqSeq = reqSeq;
        }
        var params = {"sDlrCd":pData.dlrCd, "sUsrId":pData.usrId, "sReqSeq":sReqSeq};
       if( sReqSeq != undefined){
            $.ajax({
                url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkPopupContain.do' />",
                data:JSON.stringify(params),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function (detailData, textStatus){
                    detailSet(detailData.data[0]);

                }
            });
       }
   };
   fnSelectLoading();
/********************************************************************************************************/
});



function fnValidationChk(){

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
    if( dms.string.isEmpty($("#feePolicyCont").val()) ){
        // {경쟁차 수수료 상관정책}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.etcCarRePolicy' var='etcCarRePolicy' /><spring:message code='global.info.chkSelectItemMsg' arguments='${etcCarRePolicy}' />");
        $("#feePolicyCont").focus();
        return false;
    }

    return true;
}

</script>
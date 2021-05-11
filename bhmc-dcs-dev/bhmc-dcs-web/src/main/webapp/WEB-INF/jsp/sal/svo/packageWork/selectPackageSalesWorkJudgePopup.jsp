<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 집단판매업무심사 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="left_area">
            <%-- <span class="span_txt"><spring:message code="global.lbl.dealer" /></span>    <!-- 딜러 -->
            <span class="readonly_area">
                <input id="sDlrCd" readonly class="form_input" style="width:156px;" />
            </span> --%>
            <span class="txt_label bg_green">${userId} : Lv${usrEvalGrade}</span>
        </div>
        <div class="btn_right">
            <button id="btnConfirm" class="btn_m"><spring:message code='global.btn.fix' /></button>                 <!-- 확정 -->
            <button id="btnPrint" class="btn_m btn_print"><spring:message code='global.btn.print' /></button>       <!-- 인쇄 -->
            <button id="btnClose" class="btn_m"><spring:message code='ser.btn.cancel' /></button>                   <!-- 취소 -->
        </div>
    </div>

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
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th>       <!-- 등록일자 -->
                    <td class="readonly_area">
                        <input id="reqDt" name="reqDt" class="form_datepicker" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.applNumber' /></th>       <!-- 신청번호 -->
                    <td>
                        <input id="reqSalNo" readonly class="form_input form_readonly">
                        <input type="hidden" id="evalYn" />
                        <input type="hidden" id="reqNo" />
                        <input type="hidden" id="reqSeq" />
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>       <!-- 딜러코드 -->
                    <td>
                        <input id="dlrCd" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrNm' /></th>       <!-- 딜러명 -->
                    <td>
                        <input id="dlrNm" readonly class="form_input form_readonly">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.custNm' /></th>        <!-- 고객명 -->
                    <td>
                        <input id="custNm" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.item' /></th>         <!-- 항목 -->
                    <td>
                        <input id="atcDstinCd" readonly class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.atcIntroCont' /></th>       <!-- 항목소개 -->
                    <td colspan="3">
                        <textarea id="atcIntroCont" rows="2" cols="" readonly class="form_textarea form_readonly"></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.rivalCar' /><br><spring:message code='global.lbl.fee' /><br><spring:message code='global.lbl.rePolicy' /></th>     <!-- 경쟁차<br>수수료<br>상관정책 -->
                    <td colspan="3">
                        <textarea id="feePolicyCont" rows="3" cols="" readonly class="form_textarea form_readonly"></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.poaOffer' /></th>       <!-- 항목확인서제공여부 -->
                    <td>
                        <label class="label_check"><input id="poaOfferY" name="poaOffer" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='global.lbl.yes' /><!-- 예--></label>
                        <label class="label_check"><input id="poaOfferN" name="poaOffer" type="radio" value="N" class="form_check"> <spring:message code='global.lbl.n' /><!-- 아니오--></label>
                        <input type="hidden" id="poaOfferYn" />
                    </td>
                    <th scope="row"><span id="applyDt" class="bu_required"><spring:message code='sal.lbl.applysDt' /></span></th>       <!-- 임명일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="applyStartDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="applyEndDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.evalRslt' /></span></th>    <!-- 심사결과 -->
                    <td>
                        <label class="label_check"><input id="tabEvalRsltY" name="tabEvalRslt" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='sal.lbl.approvals' /><!-- 승인--></label>
                        <label class="label_check"><input id="tabEvalRsltN" name="tabEvalRslt" type="radio" value="N" class="form_check"> <spring:message code='sal.btn.reject' /><!-- 거절--></label>
                        <input type="hidden" id="evalRslt" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.evalRemark' /></th>  <!-- 심사평가 -->
                    <td colspan="3">
                        <textarea id="remark" rows="2" cols="" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.lbl.carCnt' /></h2>       <!-- 차량내역 -->
    </div>
    <div class="table_grid">
        <div id="vehicleGrid"></div>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.lbl.evalRemark' /></h2>       <!-- 심사평가 -->
    </div>
    <div class="table_grid">
        <div id="evlGrid"></div>
    </div>

    <span style="display:none">
        <input type="hidden" id="reqNo" name="reqNo" />
        <input type="hidden" id="usrId" />
    </span>

</section>
<!-- //집단판매업무심사 팝업 -->

<!-- script -->
<script>

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

var toDay = "${toDay}";
var oneDay = "${oneDay}";

var usrEvalGrade = "${usrEvalGrade}";
var loginUsrId = "${userId}";
var wrkDstinCd = "${wrkDstinCd}";

//차종
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

//그리드 모델 콤보 DataSource
var modelCdDSList = [];

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



$(document).ready(function() {
    $(document).keypress(function(event){
        if(event.which == "13"){
            return false;
        }
    });

    // 팝업 설정값
    var parentData = parent.popupWindow.options.content.data;
    var pData = parentData.sData;

    $("#dlrCd").val(pData.dlrCd);
    $("#dlrNm").val(pData.dlrNm);
    $("#usrId").val(pData.usrId);
    $("#usrNm").val(pData.usrNm);
    $("#reqSeq").val(pData.reqSeq);
    $("#reqSalNo").val(pData.reqSalNo);
    $("#reqNo").val(pData.reqNo);
    $("#evalYn").val(pData.evalYn);

    var readyPoaOffer = true, readyDmsOpen = true, readyEvalRslt = true;

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


   // DMS시스템에서 공시 여부:공시
   $("#dmsOpenY").click(function(){
       if(!readyDmsOpen){
           return false;
       }

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#dmsOpenYn").val("Y");
   });
   // DMS시스템에서 공시 여부:미공시
   $("#dmsOpenN").click(function(){
       if(!readyDmsOpen){
           return false;
       }

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#dmsOpenYn").val("N");
   });

/*    // BRAND에서 위임장 제공여부:공시
   $("#poaOfferY").click(function(){
       if(!readyPoaOffer){
           return false;
       }

       //$(this).siblings("li").removeClass("on");
       //$(this).addClass("on");
       $("#poaOfferYn").val("Y");
   });
   // BRAND에서 위임장 제공여부:미공시
   $("#poaOfferN").click(function(){
       if(!readyPoaOffer){
           return false;
       }

       //$(this).siblings("li").removeClass("on");
       //$(this).addClass("on");
       $("#poaOfferYn").val("N");
   });
     */

   //위임일자
   $("#applyStartDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
  });
   $("#applyEndDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
  });

   // 심사결과:승인
   $("#tabEvalRsltY").click(function(){
       if(!readyEvalRslt){
           return false;
       }

       //$(this).siblings("li").removeClass("on");
       //$(this).addClass("on");
       $("#evalRslt").val("Y");
   });
   // 심사결과:불승인
   $("#tabEvalRsltN").click(function(){
       if(!readyEvalRslt){
           return false;
       }

       //$(this).siblings("li").removeClass("on");
       //$(this).addClass("on");
       $("#evalRslt").val("N");
   });


// 확정 버튼
   $("#btnConfirm").kendoButton({
       click:function(e){

           var applyStartDt = $("#applyStartDt").data("kendoExtMaskedDatePicker").value();
           var applyEndDt = $("#applyEndDt").data("kendoExtMaskedDatePicker").value();

           if($("input[name='poaOffer']:checked").val() == "Y"){
               if( dms.string.isEmpty(applyStartDt)){
                   dms.notification.info("<spring:message code='sal.info.chkApplyStartDtPlz'/>"); //확정버튼 시 수권기간 입력 필요합니다.
                   return false;
               }
               if( dms.string.isEmpty(applyEndDt)){
                   dms.notification.info("<spring:message code='sal.info.chkApplyStartDtPlz'/>"); //확정버튼 시 수권기간 입력 필요합니다.
                   return false;
               }

               if(applyStartDt > applyEndDt){
                   dms.notification.info("<spring:message code='sal.lbl.applysDt' var='applysDt' />"+
                                         "<spring:message code='global.info.validation.pattern' arguments='${applysDt}' />");
                   return false;
               }
           }


         //global.info.validation.pattern



           var param = {};
           var evalRsltYn = $('input[name="tabEvalRslt"]:checked').val();

           param.dlrCd  = $("#dlrCd").val();
           param.usrId  = $("#usrId").val();
           param.reqSeq = $("#reqSeq").val();

           param.evalRsltYn   = evalRsltYn;
           param.remark       = $("#remark").val();
           param.usrEvalGrade = usrEvalGrade;

           if( evalRsltYn == 'Y'){
               if(pData.evalGradeCd == usrEvalGrade){
                   approveCd = 'C';
               }else{
                   approveCd = 'B';
               }
           }else {
               approveCd = 'D';
           }

           param.applyStartDt = applyStartDt     //위임일자
           param.applyEndDt   = applyEndDt       //위임일자
           param.approveCd    = approveCd;

           dms.window.confirm({
               message:"<spring:message code='global.btn.fix' var='fix' /><spring:message code='global.info.cnfrmMsg' arguments='${fix}' />"
               ,title :"<spring:message code='global.btn.fix' />"
               ,callback:function(result){
                   if(result){

                       $.ajax({
                           url:"<c:url value='/sal/svo/packageWork/confirmPackageSalesWorkJudgePopup.do' />",
                           data:JSON.stringify(param),
                           type:'POST',
                           dataType:'json',
                           contentType:'application/json',
                           async:false,
                           error:function(jqXHR,status,error) {
                               dms.notification.error(jqXHR.responseJSON.errors);
                           },
                           success:function(jqXHR, textStatus) {
                                var data = [];
                                data.msg = 'save';
                                parentData.callbackFunc(data);
                                //parent.popupWindow.close();
                           }
                       });

                   }else{
                       return false;
                   }
               }
           });
       }
   });

    //버튼 - 출력
    $("#btnPrint").kendoButton({
        click:function(e) {
            var sDlrCd = $("#dlrCd").val();
            var sUsrId = $("#usrId").val();
            var sReqSeq = $("#reqSeq").val();

            var printParam =  "&sDlrCd="+sDlrCd+"&sUsrId="+sUsrId+"&sReqSeq="+sReqSeq;
            var printReportUrl = "<c:url value='/ReportServer?reportlet=sale/screenRelation/selectGroupTaskEvalRpt.cpt'/>"+printParam;
            var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
        }
    });

   // 닫기 버튼
   $("#btnClose").kendoButton({
       click:function(e){
           parent.popupWindow.close();
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
                    id :"reqSeq",
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
       ,height:100
       ,sortable:false
       ,pageable:false
       ,editable:false
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
          ,{field:"reqRc", title:"<spring:message code='sal.lbl.reqRc'/>", width:100, attributes:{"class":"ar"}}     // 고객희망할인가
          ,{field:"reqQuar", title:"<spring:message code='sal.lbl.reqQuar'/>", width:80, attributes:{"class":"ar"}}  // 배치요구
       ]
   });


   // 심사Grid
   $("#evlGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkJudgePopupEvl.do' />"
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
          ,{field:"pevalId",title:"<spring:message code='global.lbl.peval' />",width:70, attributes:{"class":"ac"}}// 심사자
          ,{field:"evalDt",title:"<spring:message code='global.lbl.evalDt' />",width:100, attributes:{"class":"ac"}// 심사일자
             ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{field:"evalRsltYn",title:"<spring:message code='global.lbl.evalRslt' />",width:80, attributes:{"class":"ac"}
            // ,template:"#=evalRsltYn=='Y'?'<spring:message code='global.btn.approval'/>':'<spring:message code='global.btn.nonApproval'/>'#"// 심사결과
          }
          ,{field:"remark",title:"<spring:message code='global.lbl.evalRemark' />",width:150, attributes:{"class":"al"}} // 심사평가
       ]
   });

    detailSet = function(){

        $.ajax({
            url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkPopupDetail.do' />",
            data:JSON.stringify({"sDlrCd":pData.dlrCd, "sUsrId":pData.usrId, "sReqSeq":pData.reqSeq}),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(detailData, textStatus){

                if( detailData != null ){

                    $("#reqDt").data("kendoExtMaskedDatePicker").value(detailData.reqDt);

                    $("#dlrNm").val(detailData.dlrNm);    //딜러명
                    $("#custNm").val(detailData.custNm);    //고객명

                    $("#atcDstinCd").data("kendoExtDropDownList").value(detailData.atcDstinCd);    //항목
                    $("#atcDstinCd").data("kendoExtDropDownList").enable(false);

                    $("#atcIntroCont").val(detailData.atcIntroCont);    //고객명

                    $("#feePolicyCont").val(detailData.feePolicyCont);    //경쟁차 수수료 상관정책

                    // DMS시스템에서 공시여부
                    $("#dmsOpenYn").val(detailData.dmsOpenYn);

                    if(detailData.dmsOpenYn == "Y"){
                        $("#dmsOpenY").click();
                    }else{
                        $("#dmsOpenN").click();
                    }
                    readyDmsOpen = false;

                    // BRAND에서 위임장 제공여부
                    $("#poaOfferYn").val(detailData.poaOfferYn);

                    $("input[name='poaOffer']:radio:input[value="+detailData.poaOfferYn+"]").prop("checked", true);
                    $("#poaOfferY").attr("disabled", "true");
                    $("#poaOfferN").attr("disabled", "true");

                    //applyDt
                    if(detailData.poaOfferYn == "N"){
                        $("#applyDt").removeClass("bu_required");
                    }


                    $("#applyStartDt").data("kendoExtMaskedDatePicker").value(dms.string.strNvl(detailData.applyStartDt));   //위임일자
                    $("#applyEndDt").data("kendoExtMaskedDatePicker").value(dms.string.strNvl(detailData.applyEndDt));       //위임일자

                    $("#evalRslt").val(dms.string.defaultString(detailData.evalRsltYn,"Y"));

                    $("input[name='tabEvalRslt']:radio:input[value="+$("#evalRslt").val()+"]").prop("checked", true);
                    $("#remark").val(dms.string.strNvl(detailData.remark));       // 비고


                    /**
                     * 승인구분:버튼 표시
                     **/
                     if($("#evalYn").val() == "02"){
                         $("#btnConfirm").show();      // 확정보임
                         readyEvalRslt = true;                      // 심사결과 잠금
                         $("#remark").val('');
                         $("#remark").attr("disabled", false);   // 심사평가
                         $("#applyStartDt").data("kendoExtMaskedDatePicker").enable(true);
                         $("#applyEndDt").data("kendoExtMaskedDatePicker").enable(true);
                     }else{
                         $("#btnConfirm").hide();      // 확정숨김
                         readyEvalRslt = false;                      // 심사결과 잠금
                         $("#remark").attr("disabled", true);   // 심사평가
                         $("#applyStartDt").data("kendoExtMaskedDatePicker").enable(false);
                         $("#applyEndDt").data("kendoExtMaskedDatePicker").enable(false);
                         $("#tabEvalRsltY").attr("disabled", true);
                         $("#tabEvalRsltN").attr("disabled", true);
                     }

                     $('#evlGrid').data('kendoExtGrid').dataSource.read();
                }
            }
        });

    };

    detailSet();

});




</script>
<!-- //script -->
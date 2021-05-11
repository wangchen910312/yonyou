<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="detailViewWindow" class="pop_wrap" style="max-height:620px;">
    <section class="group">
        <div class="header_area">
            <div class="btn_right" >
                <dms:access viewId="VIEW-D-11265" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnFix"><spring:message code="sal.btn.offer" /></button> <!-- 상신 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11264" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11263" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnDel"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11262" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnPrint"><spring:message code="sal.btn.print" /></button> <!-- 출력 -->
                </dms:access>
                <button class="btn_m" id="btnPopupExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
            </div>
        </div>
        <form id="groupSalesAppForm" name="groupSalesAppForm" method="POST">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <%-- <col style="width:18%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:22%;"> --%>
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:12%;">
                        <col style="width:12%;">
                        <col style="width:12%;">
                        <col style="width:8%;">
                        <col style="width:14%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.repCustNm" /></span></th> <!-- 대고객명 -->
                            <td colspan="3">
                                <input required type="text" maxlength="35" id="custNm" name="custNm" data-name="<spring:message code="sal.lbl.repCustNm" />" class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.relAddr" /></span></th> <!-- 주소 -->
                            <td colspan="3">
                                <input required type="text" maxlength="60" id="addr" name="addr" class="form_input" data-name="<spring:message code="global.lbl.addr" />" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.contactUserNm" /></span></th> <!-- 연락자 -->
                            <td>
                                <input required type="text" maxlength="10" id="prsnId" name="prsnId" class="form_input" data-name="<spring:message code="global.lbl.contactUserNm" />" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.cellphone" /></span></th> <!-- 핸드폰 -->
                            <td>
                                <input required type="text" id="hpNo" name="hpNo" class="form_input numberic" maxlength="13" data-name="<spring:message code="global.lbl.cellphone" />" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.telNo" /></span></th> <!-- 유선번호 -->
                            <td>
                                <input required type="text" id="telNo" name="telNo" class="form_input numberic" maxlength="13" data-name="<spring:message code="sal.lbl.officeTelNo" />" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.item" /></span></th> <!-- 항목유형 -->
                            <td>
                                <!-- <input type="text" id="atcDstinCd" name="atcDstinCd" data-bind="value:atcDstinCd" class="form_comboBox" data-json-obj="true">  -->
                                <input required type="text" id="atcDstinCd" name="atcDstinCd" class="form_comboBox" data-name="<spring:message code="global.lbl.item" />" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vehicleUse" /></span></th> <!-- 차량용도 -->
                            <td>
                                <input required type="text" maxlength="300" id="carUseTp" name="carUseTp" class="form_input" data-name="<spring:message code="global.lbl.vehicleUse" />"  data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.dlrPrsn" /></span></th> <!-- 딜러항목담당자 -->
                            <td>
                                <input required type="text" maxlength="10" id="prsnDlrCd" name="prsnDlrCd" class="form_input" data-name="<spring:message code="sal.lbl.dlrPrsn" />" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.telNumer" /></span></th> <!-- 연락처 -->
                            <td colspan="3">
                                <input required type="text" id="prsnDlrTelNo" name="prsnDlrTelNo" class="form_input numberic" maxlength="13" data-name="<spring:message code="global.lbl.telNumer" />" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.contractDoc" /></span></th> <!-- 계약문서 -->
                            <td colspan="3">
                                <input required type="text" id="contractFileNm" name="contractFileNm" readonly class="form_input form_readonly" style="width:65%" data-name="<spring:message code="global.lbl.contractDoc" />" />
                                <dms:access viewId="VIEW-D-11261" hasPermission="${dms:getPermissionMask('READ')}">
                                    <span class="btn_file" id="fileSelectContract" onclick="fnMoreFileUpload(this.id)" ><spring:message code="global.lbl.FindFile" /></span>  <!-- 파일찾기 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11260" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="contractFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11259" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="contractFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                </dms:access>
                                <input type="hidden" id="contractFileNo" name="contractFileNo" class="form_input" style="width:5%"  data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.bussLicence" /></span></th> <!-- 사업자등록증 -->
                            <td colspan="3">
                                <input required id="bussLicenceNm" name="bussLicenceNm" type="text" readonly class="form_input form_readonly" style="width:65%" data-name="<spring:message code="sal.lbl.bussLicence" />" />
                                <dms:access viewId="VIEW-D-11258" hasPermission="${dms:getPermissionMask('READ')}">
                                    <span class="btn_file" id="fileSelectBuss" onclick="fnMoreFileUpload(this.id)"><spring:message code="global.lbl.FindFile" /></span> <!-- 파일찾기 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11257" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="bussLicenceDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11256" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="bussLicence" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                </dms:access>
                                <input type="hidden" id="bussLicenceNo" name="bussLicenceNo"  class="form_input" style="width:5%" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.etcFile" /></th> <!-- 기타문서 -->
                            <td colspan="3">
                                <input id="etcFileNm" name="etcFileNm" type="text" readonly class="form_input form_readonly" style="width:65%" data-bind="value:etcFileNm" >
                                <dms:access viewId="VIEW-D-11255" hasPermission="${dms:getPermissionMask('READ')}">
                                    <span class="btn_file" id="fileSelectEtc" onclick="fnMoreFileUpload(this.id)"><spring:message code="global.lbl.FindFile" /></span> <!-- 파일찾기 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11254" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="etcFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11253" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="etcFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                </dms:access>
                                <input type="hidden" id="etcFileNo" name="etcFileNo"  class="form_input" style="width:5%" data-bind="value:etcFileNo" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.addDocument" /></th> <!-- 보충자료 -->
                            <td colspan="3">
                                <input id="addFileNm" name="addFileNm" type="text" readonly class="form_input form_readonly" style="width:65%" data-bind="value:addFileNm" >
                                <dms:access viewId="VIEW-D-11252" hasPermission="${dms:getPermissionMask('READ')}">
                                    <span class="btn_file" id="fileSelectAdd" onclick="fnMoreFileUpload(this.id)"><spring:message code="global.lbl.FindFile" /></span> <!-- 파일찾기 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11251" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="addFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11250" hasPermission="${dms:getPermissionMask('READ')}">
                                    <button type="button" id="addFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                </dms:access>
                                <dms:access viewId="VIEW-D-11249" hasPermission="${dms:getPermissionMask('READ')}">
                                    <%-- <button type="button" id="saveAddFile" class="btn_s" ><spring:message code="sal.btn.offer" /></button> --%> <!-- 저장 -->
                                </dms:access>
                                <input type="hidden" id="addFileNo" name="addFileNo"  class="form_input" style="width:5%" data-bind="value:addFileNo" data-json-obj="true">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="display:none">
                <input type="text" id="reqSeq" name="reqSeq" data-json-obj="true" >
                <input type="text" id="usrId" name="usrId" data-json-obj="true" >
                <input type="text" id="headFileDocId" name="headFileDocId" data-json-obj="true" >
                <input type="text" id="approveCd" name="approveCd" data-json-obj="true" />
                <input type="text" id="dlrCd" name="dlrCd" data-json-obj="true" >
                <input type="text" id="dlrNm" name="dlrNm" >
                <input type="text" id="dlrArea" name="dlrArea" >
                <!--R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 start-->
                <input type="text" id="applicaNum" name="applicaNum" >
                <!--R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 end-->
            </div>
        </form>
        <div class="txt_total" style="position:absolute;">
            <p><spring:message code='global.lbl.applyQty' />&nbsp;:&nbsp;<span id="reqQty" name="reqQty">0</span></p>     <!-- 건수:-->
        </div>
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11248" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnVehAdd"><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11247" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnVehDel"><spring:message code="global.btn.rowDel" /></button> <!-- 차량삭제 -->
                </dms:access>
            </div>
            <!-- <p>Total:<span id="qtyTot">0</span></p> -->
        </div>
        <div class="table_grid">
            <div id="grid2"></div>
        </div>
        <%-- <div class="txt_total">
            <p><spring:message code='global.lbl.applyQty' />&nbsp;:&nbsp;<span id="reqQty" name="reqQty">0</span></p>     <!-- 건수:-->
        </div> --%>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.lbl.evalInfo" /></h2><!-- 심사정보 -->
        </div>
        <div class="table_grid mt10">
            <div id="grid3"></div>
        </div>
    </section>

    <!-- 파일 업로드 페이지 -->
    <c:import url="/WEB-INF/jsp/sal/svo/groupSalesApplication/selectGroupSalesFileUpload.jsp" />
    <!-- 파일 업로드 페이지 -->

    <section id="imageViewWindow" class="pop_wrap" >
        <div class='imgSlider_wrap' >
            <div class='imgSlider_scrollbox' id="fileHtml">
            </div>
        </div>
    </section>

</section>

<script type="text/javascript">

var searchVehiclePopupWin;              //차량조회 팝업.
var searchVehPopWin;

var fileBtn = "";

var dlrCd;
var usrId;
var reqSeq;
var fileDocId;
var gridIndex;

/************* 상태 SELECT BOX  *******************/
var approveCdList = [];
<c:forEach var="obj" items="${approveCdInfo}">
approveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var approveCdArr = dms.data.arrayToMap(approveCdList, function(obj){return obj.cmmCd});
/************* 상태 SELECT BOX  *******************/

/************* 항목 SELECT BOX  *******************/
//2018-11-29 update by lyy 集团销售申请，展示项目类型 start
var atcDstinList = [];
var atcDstinShowList = [];
<c:forEach var="obj" items="${atcDstinInfo}">
    if( "${obj.useYn}" == "Y"){
        atcDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    //if( "${obj.useYn}" == "Y"){
    	atcDstinShowList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    //}
</c:forEach>
var atcDstinArr = dms.data.arrayToMap(atcDstinList, function(obj){return obj.cmmCd});
var atcDstinShwoArr = dms.data.arrayToMap(atcDstinShowList, function(obj){return obj.cmmCd});
//2018-11-29 update by lyy 集团销售申请，展示项目类型 end
/************* 항목 SELECT BOX  *******************/


 //파일 첨부여부
var filUseYnList = [];
<c:forEach var="obj" items="${fileUseYn}">
    if( "${obj.useYn}" == "Y"){
        filUseYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>
var filUseYnArr = dms.data.arrayToMap(filUseYnList, function(obj){return obj.cmmCd});


// 차종
var carLineCdDSList = [];
var carLineCdObj = {};
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdDSList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineCdNm}";
</c:forEach>

// 그리드 모델 콤보 DataSource
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


$(document).ready(function () {

    //파일 첨부여부
    setFileUseYn = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(filUseYnArr[val] != undefined)
            returnVal = filUseYnArr[val].cmmCdNm;
        }else{
            returnVal = filUseYnArr["N"].cmmCdNm;
        }
        return returnVal;
    };

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */
     $("#imageViewWindow").kendoWindow({
         animation:false
         ,draggable:true
         ,modal:true
         ,resizable:true
         ,visible:false
         ,title:"预览"
         ,width:"792px"
         ,close:function(e){
             $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").hide();
         }
     });


     $("#fileViewWindow").kendoWindow({
         animation:false
         ,draggable:true
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"添加文件"
         ,width:"700px"
         ,height:"250px"
     });


    // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e){
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });

    /**
     * 상태 콤보박스
     */
     $("#sApproveCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:approveCdList
        ,optionLabel:" "  // 전체
     });

     /**
      * 항목 콤보박스
      */
      $("#atcDstinCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:atcDstinList
         ,optionLabel:" "  // 전체
      });

     /**
      * 시작 신청일자 (From)
      */
      $("#sApplyDtS").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:fifteenDayBf
      });
      /**
      * 종료 신청일자 (From)
      */
      $("#sApplyDtE").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:sysDate
      });
      /**
       * 시작 심사일자 (From)
       */
       $("#sConfirmDtS").kendoExtMaskedDatePicker({
           format:"<dms:configValue code='dateFormat' />"
          ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
          ,value:""
       });
       /**
        * 종료 심사일자 (From)
        */
        $("#sConfirmDtE").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,value:""
        });

    // 집단판매 차량적용 팝업
    selectGroupSalesPopupWindow  = function(arrInfo){

         searchVehPopWin = dms.window.popup({
             windowId:"searchVehPopWin"    //차량조회팝업.
             ,title:"<spring:message code='sal.lbl.reqCarDetailView' />"             //신청차량 상세보기
             ,height:"400px"
             ,width:"750px"
             ,content:{
                 url:"<c:url value='/sal/svo/groupSalesApplication/selectDetlVehPopMain.do' />"
                 ,data:{
                     "arrInfo":arrInfo
                     ,"type"  :null
                     ,"autoBind":false
                     ,"callbackFunc":function(data){

                     }
                 }
             }
         });
    }

  //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var validator = $("#groupSalesAppForm").kendoExtValidator().data("kendoExtValidator");
            //if(validator.validate() && fnValidationChk()){

               //대고객명
               if ( dms.string.isEmpty($("#custNm").val()) ){
                   dms.notification.warning("<spring:message code='sal.lbl.repCustNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                   $("#custNm").focus();
                   return false;
               }

                dms.window.confirm({
                    message:"<spring:message code='global.btn.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save}' />"
                    ,title :"<spring:message code='global.btn.save' />"
                    ,callback:function(result){
                        if(result){

                            var approveCd = dms.string.isEmpty($("#approveCd").val()) ? "A" : $("#approveCd").val();
                            saveGrpData(approveCd);
                        }else{
                            return false;
                        }
                    }
                });
            //}
        }
    });

    //버튼 - 확정
    $("#btnFix").kendoButton({
        click:function(e) {

            var validator = $("#groupSalesAppForm").kendoExtValidator().data("kendoExtValidator");
            if(validator.validate()  && fnValidationChk() ){

                var grid2 = $("#grid2").data("kendoExtGrid");
                var data = grid2.dataSource.data();

                if(data.length == 0 ){
                    dms.notification.info("<spring:message code='global.lbl.car' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
                    return;
                }

                dms.window.confirm({
                    message:"<spring:message code='sal.btn.offer' var='offer' /><spring:message code='global.info.cnfrmMsg' arguments='${offer}' />"
                    ,title :"<spring:message code='sal.btn.offer' />"
                    ,callback:function(result){
                        if(result){
                            saveGrpData("B");
                        }else{
                            return false;
                        }
                    }
                });
            }
        }
    });

    //저장
    saveGrpData = function(approveCd){

       //신청차량
        var grid2 = $("#grid2").data("kendoExtGrid");
        var data = grid2.dataSource.data();

       /*  if(data.length == 0 ){
            dms.notification.info("<spring:message code='global.lbl.car' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
            return;
        } */


        /* var validator = $("#groupSalesAppForm").kendoExtValidator().data("kendoExtValidator");
        if(validator.validate()){ */

        //$("approveCd").val(approveCd);

        var paramData = $("#groupSalesAppForm").serializeObject($("#groupSalesAppForm").serializeArrayInSelector("[data-json-obj='true']"));
        paramData.approveCd = approveCd;
        paramData.orgApproveCd = $("approveCd").val();
        paramData.custNm = $("#custNm").val();
        paramData.prsnId = $("#prsnId").val();
        paramData.hpNo = $("#hpNo").val();
        paramData.telNo = $("#telNo").val();
        paramData.addr = $("#addr").val();
        paramData.atcDstinCd = $("#atcDstinCd").val();
        paramData.carUseTp = $("#carUseTp").val();
        paramData.prsnDlrCd = $("#prsnDlrCd").val();
        paramData.prsnDlrTelNo = $("#prsnDlrTelNo").val();
        paramData.dlrCd = $("#dlrCd").val();
        //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 start
        paramData.applicaNum = $("#applicaNum").val();
        //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 end

        // form 데이터 및 그리드 변경 데이터 세팅
        var saveData = $.extend(
            {"groupSalesApplicationVO":paramData}
           ,{"vehicleListVO":data}
        );

        $.ajax({
            url:"<c:url value='/sal/svo/groupSalesApplication/multiGroupSalesApplication.do' />"
           ,data:JSON.stringify(saveData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result , textStatus){

               var detailData = result["groupSalesApplicationVO"];
               //console.log(detailData)
               detailInfo(detailData);

               //버튼 설정
               setButtonEnable(approveCd);


               $('#grid').data('kendoExtGrid').dataSource.page(1);
               $('#grid2').data('kendoExtGrid').dataSource.page(1);
               dms.notification.success("<spring:message code='global.info.success' />");

               //$("#detailViewWindow").data("kendoWindow").close();

           },beforeSend:function(xhr){
               dms.loading.show($("#resizableContainer"));
           }
           ,complete:function(xhr,status){
               dms.loading.hide($("#resizableContainer"));
           }
        });
    };

  //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            dms.window.confirm({
                message:"<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />"
                ,title :"<spring:message code='global.btn.confirm' />"
                ,callback:function(result){
                    if(result){
                        var grid = $('#grid').data('kendoExtGrid');
                        var dataItem = grid.dataItem(grid.select());

                        var data ={
                            "dlrCd":$("#dlrCd").val()
                            ,"usrId":$("#usrId").val()
                            ,"reqSeq":$("#reqSeq").val()
                        }
                        //console.log("saveData::"+kendo.stringify(data));
                        $.ajax({
                            url:"<c:url value='/sal/svo/groupSalesApplication/deleteGroupSalesApplication.do' />",
                            data:JSON.stringify(data),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            },
                            success:function(jqXHR, textStatus){
                                fnReSet();

                                grid.dataSource._destroyed = [];
                                grid.dataSource.page(1);

                                $("#detailViewWindow").data("kendoWindow").close();

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
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
            var printReportUrl = "<c:url value='/ReportServer?reportlet=sale/screenRelation/selectGroupOrdRegRpt.cpt'/>"+printParam;
            var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
        }
    });

    //보충자료를 저장한다
    $("#saveAddFile").click(function(e){

        var dlrCd = strDlrCd;
        var usrId = $("#usrId").val();
        var reqSeq = $("#reqSeq").val();
        var addFileNo = $("#addFileNo").val();

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/svo/groupSalesApplication/saveAddFile.do' />"
            ,data:JSON.stringify({"dlrCd":dlrCd, "usrId":usrId, "reqSeq":reqSeq, "addFileNo":addFileNo})
            ,async:false

            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(jqXHR, textStatus) {
                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    });


    //버튼 - 행삭제
    $("#btnRowDel").kendoButton({
       enable:true,
       click:function(e){

           var grid = $("#grid").data("kendoExtGrid");
           var rows = grid.select();

           if(rows.length  == 0 ){
               //삭제할 데이터가 존재하지 않습니다.
               dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
               return false;
           }

           dms.window.confirm({
               message:"确定要删除车辆吗?" // 선택된 차량을 정말 삭제 하시겠습까?
               ,title :"<spring:message code='global.btn.confirm' />"
               ,callback:function(result){
                   if(result){
                       return true;
                   }else{
                       return false;
                   }
               }
           });

           var selectVeh = [];
           rows.each(function(index, row) {
               var data = {
                   "dlrCd":grid.dataItem(rows[index]).dlrCd
                   ,"usrId":grid.dataItem(rows[index]).usrId
                   ,"reqSeq":grid.dataItem(rows[index]).reqSeq
                   ,"reqLowerSeq":grid.dataItem(rows[index]).reqLowerSeq
                }
                selectVeh.push(data);
           });

           $.ajax({
               url:"<c:url value='/sal/svo/groupSalesApplication/deleteGroupSalesVeh.do' />",
               type:'POST',
               dataType:'json',
               contentType:'application/json',
               data:JSON.stringify({"deleteGroupSalesApplicationVehList":selectVeh }),
               error:function(jqXHR,status,error){
                   console.log(jqXHR);
               },
               success:function(data){
                   $('#grid').data('kendoExtGrid').dataSource.page(1);
                   //정상적으로 처리 되였습니다.
                   dms.notification.success("已正常处理");
               }
           });
       }
    });

    //차량검색 팝업.
    $("#btnVehAdd").kendoButton({ // 추가(하단 차량 그리드)
        enable:true,
        click:function(e){

            searchVehiclePopupWin = dms.window.popup({
                windowId:"searchVehiclePopupWin"    //차량조회팝업.
                ,title:"<spring:message code='global.title.vehicleMaster' />"
                ,width:"850px"
                ,height:"400px"
                ,draggable:true
                ,modal:true
                ,content:{
                    //url:"<c:url value='/sal/cmm/selectSearchVehicle.do'/>"
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectVehiclePopup.do' />"
                    ,data:{
                        "dlrCd":dlrCd
                        ,"usrId":usrId
                        ,"reqSeq":reqSeq
                        ,"type"  :null
                        ,"autoBind":false
                        ,"callbackFunc":function(callData){

                            $.each(callData, function(idx, data){

                                if(!isTargetVehicleGrid(data.vinNo)){
                                    var gridReqSeq = dms.string.isEmpty($("#reqSeq").val()) ? "" : $("#reqSeq").val();
                                    //console.log("gridReqSeq:"+gridReqSeq)
                                    $('#grid2').data('kendoExtGrid').dataSource.insert(idx, {
                                         carlineCd   :data.carlineCd
                                        ,carlineNm   :data.carlineCdNm
                                        ,modelCd     :data.modelCd
                                        ,modelNm     :data.modelCdNm
                                        ,ocnCd       :data.ocnCd
                                        ,ocnNm       :data.ocnCdNm
                                        ,extColorCd  :data.extColorCd
                                        ,extColorNm  :data.extColorCdNm
                                        ,intColorCd  :data.intColorCd
                                        ,intColorNm  :data.intColorCdNm
                                        ,vinNo       :data.vinNo
                                        ,msPrc       :data.whPrc
                                        ,dcRate       :data.dcRate
                                        ,aamt        :data.aamt
                                        ,reqSeq      :gridReqSeq
                                        ,reqLowerSeq :""
                                    });
                                }
                            });


                            //정상적으로 반영 되었습니다.
                            //dms.notification.success("<spring:message code='global.info.success'/>");
                            //$('#grid2').data('kendoExtGrid').dataSource.page(1);
                        }
                    }
                }
            });
        }
    });

    //버튼 - 차량삭제
    $("#btnVehDel").kendoButton({
        click:function(e) {

            var grid2 = $("#grid2").data("kendoExtGrid");
            var rows = grid2.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            rows.each(function(index, row) {
                grid2.removeRow(row);
            });
        }
    });


    fnValidationChk = function(){

        var data = $("#grid2").data("kendoExtGrid").dataSource.data();;

     /*
       if( $("#dlrCd").val() == "" || $("#dlrCd").val() == null ){
           return false;
       }

       //대고객명
       if ( dms.string.isEmpty($("#custNm").val()) ){
           dms.notification.warning("<spring:message code='sal.lbl.repCustNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#custNm").focus();
           return false;
       }

       //주소
       if ( dms.string.isEmpty($("#addr").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.addr' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#addr").focus();
           return false;
       }

       //연락인
       if ( dms.string.isEmpty($("#prsnId").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.contactUserNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#prsnId").focus();
           return false;
       }

       //휴대폰번호
       if ( dms.string.isEmpty($("#hpNo").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.cellphone' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#hpNo").focus();
           return false;
       }

       //유선전화번호
       if ( dms.string.isEmpty($("#telNo").val()) ){
           dms.notification.warning("<spring:message code='sal.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#telNo").focus();
           return false;
       }

       //항목
       if ( dms.string.isEmpty($("#atcDstinCd").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.item' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           //$("#atcDstinCd").data("kendoExtDropDownList").focus();
           return false;
       }

       //차량용도
       if ( dms.string.isEmpty($("#carUseTp").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.vehicleUse' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#carUseTp").focus();
           return false;
       }

       //딜러담당자
       if ( dms.string.isEmpty($("#prsnDlrCd").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.dlrUsrNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#prsnDlrCd").focus();
           return false;
       }

       //연락처
       if ( dms.string.isEmpty($("#prsnDlrTelNo").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.telNumer' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#prsnDlrTelNo").focus();
           return false;
       }
        */

       //계약문서 업로드
       if ( dms.string.isEmpty($("#contractFileNm").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.contractDoc' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#contractFileNm").focus();
           return false;
       }

       //사업자등록증 업로드
       if ( dms.string.isEmpty($("#bussLicenceNm").val()) ){
           dms.notification.warning("<spring:message code='sal.lbl.bussLicence' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#bussLicenceNm").focus();
           return false;
       }

       if(data.length == 0 ){
           dms.notification.info("<spring:message code='global.lbl.car' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
           return false;
       }

       return true;
    }


    fnDetlGroupHeader = function(){
        var fileGrid = $('#fileGrid').data('kendoExtGrid');

        if(fileGrid._data.length == 0){
             //집단판매신청 차량정보에(SA_0413T)에 첨부파일 FILE_DOC_ID 삭제 .
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();
            var item = grid.dataItem(rows);

            var data = {
                "reqSeq":reqSeq
                ,"dlrCd":dlrCd
                ,"usrId":usrId
                ,"reqLowerSeq":""
                ,"fileDocId":""
            };

            $.ajax({
                url:"<c:url value='/sal/svo/groupSalesApplication/updateGroupSalesFile.do' />",
                data:JSON.stringify(data),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(jqXHR, textStatus){
                    $("#fileDocNo").val("");
                    //$("#fileDocId").val("");
                    $("#fileViewWindow").data("kendoWindow").close();
                    if( $("#reqSeq").val() > 0 ){
                        $('#grid2').data('kendoExtGrid').dataSource.read();
                    }
                }
            });
        }
    }



    // 추가 시, vehicleItemList2에  데이터가 존재 유무 체크.
    isTargetVehicleGrid = function (vinNo){
         var flag = false;
         var grid2 = $('#grid2').data('kendoExtGrid');
         var rows = grid2.tbody.find("tr");

         rows.each(function(index, row){
             var data = grid2.dataItem(row);

             if(vinNo == data.vinNo){
                 flag = true;
             }
         });
         return flag;
    }


    //팝업 오픈 다건 이미지  ( 이미지 미리보기 )
    imageMultiViewPop = function(reqSeq){

         var win = $("#imageViewWindow").data("kendoWindow");

         $("#fileHtml").html("");
         var grid = $("#grid2").data("kendoExtGrid");
         var selectedItem = grid.dataItem(grid.select());
         var param = {};
         if(reqSeq != 0 ){
             param = {sReqSeq:reqSeq};
         }else{
             var paramVal = "";
             $.each( grid.dataSource._data , function(idx , obj){

                 if( obj.fileDocId != undefined){
                     if(idx == 0){
                         paramVal = obj.fileDocId;
                     }else{
                         paramVal += ","+obj.fileDocId;
                     }
                 }
             });
             param = { sFileDocId:paramVal} ;
         }
         if(reqSeq == "" || reqSeq == "null"){

             dms.notification.warning("<spring:message code='sal.info.notFileNo' />");
         }else {
             //파일정보 가져오기.
             var paramVal = "";
             $.each( grid.dataSource._data , function(idx , obj){

                 if( obj.fileDocId != undefined){
                     if(idx == 0){
                         paramVal = obj.fileDocId;
                     }else{
                         paramVal += ","+obj.fileDocId;
                     }
                 }
             });
             param = { sFileDocId:paramVal} ;
             $.ajax({
                 url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesFile.do' />",
                 data:JSON.stringify(param),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {
                 var content = "";
                 var fileUrl = "";
                 if(result.total != 0){
                     for(i=0;i<result.total;i++){//_contextPath+
                         fileUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+result.data[i].fileDocNo+"&fileNo="+result.data[i].fileNo+"&inline=true";
                         content += "<li>";
                         content += "<img src=\'"+fileUrl+"\' >";
                         content += "</li>";
                     }

                     $("#fileHtml").html("<ul class='img_slider'>" + content + "</ul>");

                     //img_slider
                     var imgSlider = $("ul.img_slider").bxSlider({
                         pager:false,
                         infiniteLoop:false,
                         hideControlOnEnd:true
                     });

                     var sliderSize = $("ul.img_slider>li").size();
                     if(sliderSize < 2){
                         $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").addClass("disabled");
                     }else{
                         $(".bx-controls-direction .bx-prev").addClass("disabled");
                     }
                 }else{
                     $("#fileHtml").html("");
                     dms.notification.warning("<spring:message code='sal.info.notFileNo' />");
                 }

             });

             win.center();
             win.open();
         }
    }

    //팝업 오픈 단건 이미지  ( 이미지 미리보기 )
    imageViewPop = function(fileDocId){

         var win = $("#imageViewWindow").data("kendoWindow");

         $("#fileHtml").html("");
         var grid = $("#grid2").data("kendoExtGrid");
         var selectedItem = grid.dataItem(grid.select());
         var param = {};
         if(fileDocId == "" || fileDocId == "null"){
             dms.notification.warning("<spring:message code='sal.info.notFileNo' />");
         }else {
             //파일정보 가져오기.
             $.ajax({
                 url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesFile.do' />",
                 data:JSON.stringify({sFileDocId:fileDocId}),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {
                 var content = "";
                 var fileUrl = "";
                 var innerHtml = "";
                 if(result.total != 0){
                     for(i=0;i<result.total;i++){//_contextPath+
                         fileUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+result.data[i].fileDocNo+"&fileNo="+result.data[i].fileNo+"&inline=true";
                         content += "<li>";
                         content += "<span class='txt_label bg_blue' style='cursor:pointer' onClick='dms.fileManager.download(\""+result.data[i].fileDocNo+"\", \""+result.data[i].fileNo+"\")' ><spring:message code='global.btn.download' /></span>";
                         content += "<img src=\'"+fileUrl+"\' >";
                         content += "</li>";
                     }

                     $("#fileHtml").html("<ul class='img_slider'>" +content+ "</ul>");

                     //img_slider
                     var imgSlider = $("ul.img_slider").bxSlider({
                         pager:false,
                         infiniteLoop:false,
                         hideControlOnEnd:true
                     });

                     var sliderSize = $("ul.img_slider>li").size();
                     if(sliderSize < 2){
                         $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").addClass("disabled");
                     }else{
                         $(".bx-controls-direction .bx-prev").addClass("disabled");
                     }

                     win.center();
                     win.open();

                 }else{
                     $("#fileHtml").html("");
                     dms.notification.warning("<spring:message code='sal.info.notFileNo' />");
                 }

             });
             /*
             win.center();
             win.open();
             */
         }
    }


    //파일 다운로드
    fileDownload = function (btnId){

        var fileDocNo = $("#headFileDocId").val();
        var fileNo = "";
        if(btnId == "contractFile"){//계약문서
            fileNo = $("#contractFileNo").val();
        }else if(btnId == "bussLicence"){//사업자등록증
            fileNo = $("#bussLicenceNo").val();
        }else if(btnId == "etcFile"){//기타
            fileNo = $("#etcFileNo").val();
        }else if(btnId == "addFile"){//보충자료
            fileNo = $("#addFileNo").val();
        }

        if(fileDocNo == "" || (fileDocNo != "" && fileNo == 0)){
            //TODO[판매] 다국어 처리 필요
            dms.notification.warning("没有添加的文件");
            return;
        }

        dms.fileManager.download(fileDocNo, fileNo);
    }

    //파일 삭제
    fnFileDel = function(btnId){

        if(btnId == "contractFileDel"){//계약문서
            $("#contractFileNm").val("");
            $("#contractFileNo").val(0);

            fnShowBtn("fileSelectContract");
            fnHideBtn("contractFileDel,contractFile");
        }else if(btnId == "bussLicenceDel"){//사업자등록증
            $("#bussLicenceNm").val("");
            $("#bussLicenceNo").val(0);

            fnShowBtn("fileSelectBuss");
            fnHideBtn("bussLicenceDel,bussLicence");
        }else if(btnId == "etcFileDel"){//기타
            $("#etcFileNm").val("");
            $("#etcFileNo").val(0);

            fnShowBtn("fileSelectEtc");
            fnHideBtn("etcFileDel,etcFile");
        }else if(btnId == "addFileDel"){//보충자료


            $("#addFileNm").val("");
            $("#addFileNo").val(0);

            fnShowBtn("fileSelectAdd");
            fnHideBtn("addFileDel,addFile");
        }
    };

    //버튼 숨기기
    fnHideBtn = function (obj){
        var val = obj.split(",");
        $.each(val, function(idx, row){
            var btnId = row;
            $("#"+btnId+"").hide();
        });
    }

    //버튼 보이기
    fnShowBtn = function(obj){
        var val = obj.split(",");
        $.each(val, function(idx, row){
            var btnId = row;
            $("#"+btnId+"").show();
        });
    };

    fnMoreFileUpload = function (id){
        $("#fileBtn").val(id);
        fileBtn = id;
    }

    //팝업 오픈 ( 첨부파일 )
    fileViewPop = function(fileDocNo){

        $("#fileDocNo").val("");
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        if(fileDocNo != undefined){
            $("#fileDocNo").val(fileDocNo);
            $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
        }
        var win = $("#fileViewWindow").data("kendoWindow");
        win.center();
        win.open();
    };


    //버튼 설정
    setButtonEnable = function(approveCd){

        if( approveCd == "A" || approveCd == "D"){//입력
          //계약문서 파일 있을시
            if(dms.string.isNotEmpty($("#contractFileNm").val())){
              //파일찾기 숨기기, 삭제 보여짐.
                $("#fileSelectContract").hide();
                $("#contractFileDel").show();
                $("#contractFile").show();                  //다운로드 보임.
            }else{
                $("#fileSelectContract").show();
                $("#contractFileDel").hide();
                $("#contractFile").hide();
            }

          //사업자등록증 파일 있을시
            if(dms.string.isNotEmpty($("#bussLicenceNm").val())){
                $("#fileSelectBuss").hide();            //파일찾기없음.
                $("#bussLicenceDel").show();            //삭제 보임.
                $("#bussLicence").show();               //다운로드 보임.
            }else{
                $("#fileSelectBuss").show();
                $("#bussLicenceDel").hide();
                $("#bussLicence").hide();
            }

            //기타  파일 있을시
            if(dms.string.isNotEmpty($("#etcFileNm").val())){
                $("#fileSelectEtc").hide();         //파일찾기없음.
                $("#etcFileDel").show();            //삭제 보임.
                $("#etcFile").show();               //다운로드 보임.
            }else{
                $("#fileSelectEtc").show();
                $("#etcFileDel").hide();
                $("#etcFile").hide();
            }

            $("#fileSelectAdd").hide();
            $("#addFileDel").hide();
            $("#addFile").hide();

            $("#btnFix").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);

            $("#btnVehAdd").data("kendoButton").enable(true);
            $("#btnVehDel").data("kendoButton").enable(true);

            $("#custNm").attr("disabled", false);
            $("#prsnId").attr("disabled", false);
            $("#hpNo").attr("disabled", false);
            $("#telNo").attr("disabled", false);
            $("#addr").attr("disabled", false);
            $("#atcDstinCd").data("kendoExtDropDownList").enable(true);
            $("#carUseTp").attr("disabled", false);
            $("#prsnDlrCd").attr("disabled", false);
            $("#prsnDlrTelNo").attr("disabled", false);

        }else if(approveCd == "B"){ //심사중

          //계약문서 파일 있을시
            if(dms.string.isNotEmpty($("#contractFileNm").val())){
              //파일찾기 숨기기, 삭제 보여짐.
                $("#fileSelectContract").hide();
                $("#contractFileDel").hide();
                $("#contractFile").show();
            }else{
                $("#fileSelectContract").hide();
                $("#contractFileDel").hide();
                $("#contractFile").hide();
            }

          //사업자등록증 파일 있을시
            if(dms.string.isNotEmpty($("#bussLicenceNm").val())){
                $("#fileSelectBuss").hide();            //파일찾기없음.
                $("#bussLicenceDel").hide();            //삭제 보임.
                $("#bussLicence").show();               //다운로드 보임.
            }else{
                $("#fileSelectBuss").show();
                $("#bussLicenceDel").hide();
                $("#bussLicence").hide();
            }

            //기타  파일 있을시
            if(dms.string.isNotEmpty($("#etcFileNm").val())){
                $("#fileSelectEtc").hide();         //파일찾기없음.
                $("#etcFileDel").hide();            //삭제 보임.
                $("#etcFile").show();               //다운로드 보임.
            }else{
                $("#fileSelectEtc").hide();
                $("#etcFileDel").hide();
                $("#etcFile").hide();
            }
            $("#fileSelectAdd").hide();
            $("#addFileDel").hide();
            $("#addFile").hide();


            $("#btnFix").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnDel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);

            $("#btnVehAdd").data("kendoButton").enable(false);
            $("#btnVehDel").data("kendoButton").enable(false);

            $("#custNm").attr("disabled", true);
            $("#prsnId").attr("disabled", true);
            $("#hpNo").attr("disabled", true);
            $("#telNo").attr("disabled", true);
            $("#addr").attr("disabled", true);
            $("#atcDstinCd").data("kendoExtDropDownList").enable(false);
            $("#carUseTp").attr("disabled", true);
            $("#prsnDlrCd").attr("disabled", true);
            $("#prsnDlrTelNo").attr("disabled", true);

        }else if(approveCd == "C"   ){ //통과
          //계약문서 파일 있을시
            if(dms.string.isNotEmpty($("#contractFileNm").val())){
              //파일찾기 숨기기, 삭제 보여짐.
                $("#fileSelectContract").hide();
                $("#contractFileDel").hide();
                $("#contractFile").show();
            }else{
                $("#fileSelectContract").hide();
                $("#contractFileDel").hide();
                $("#contractFile").hide();
            }

          //사업자등록증 파일 있을시
            if(dms.string.isNotEmpty($("#bussLicenceNm").val())){
                $("#fileSelectBuss").hide();            //파일찾기없음.
                $("#bussLicenceDel").hide();            //삭제 보임.
                $("#bussLicence").show();               //다운로드 보임.
            }else{
                $("#fileSelectBuss").hide();
                $("#bussLicenceDel").hide();
                $("#bussLicence").hide();
            }

          //기타  파일 있을시
            if(dms.string.isNotEmpty($("#etcFileNm").val())){
                $("#fileSelectEtc").hide();         //파일찾기없음.
                $("#etcFileDel").hide();            //삭제 보임.
                $("#etcFile").show();               //다운로드 보임.
            }else{
                $("#fileSelectEtc").hide();
                $("#etcFileDel").hide();
                $("#etcFile").hide();
            }

           //보충자료

           if(dms.string.isNotEmpty($("#addFileNm").val())){
                $("#fileSelectAdd").hide();         //파일찾기없음.
                $("#addFile").show();
                $("#addFileDel").show();
            }else{

                $("#fileSelectAdd").show();
                $("#addFileDel").hide();
                $("#addFile").hide();

            }

            $("#btnFix").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);

            $("#btnVehAdd").data("kendoButton").enable(false);
            $("#btnVehDel").data("kendoButton").enable(false);

            $("#custNm").attr("disabled", true);
            $("#prsnId").attr("disabled", true);
            $("#hpNo").attr("disabled", true);
            $("#telNo").attr("disabled", true);
            $("#addr").attr("disabled", true);
            $("#atcDstinCd").data("kendoExtDropDownList").enable(false);
            $("#carUseTp").attr("disabled", true);
            $("#prsnDlrCd").attr("disabled", true);
            $("#prsnDlrTelNo").attr("disabled", true);

        /*
        }else if(approveCd == 'D' ){

            //계약문서 파일 있을시
            if(dms.string.isNotEmpty($("#contractFileNm").val())){
              //파일찾기 숨기기, 삭제 보여짐.
                $("#fileSelectContract").hide();
                $("#contractFileDel").hide();
                $("#contractFile").show();
            }else{
                $("#fileSelectContract").hide();
                $("#contractFileDel").hide();
                $("#contractFile").hide();
            }

          //사업자등록증 파일 있을시
            if(dms.string.isNotEmpty($("#bussLicenceNm").val())){
                $("#fileSelectBuss").hide();            //파일찾기없음.
                $("#bussLicenceDel").hide();            //삭제 보임.
                $("#bussLicence").show();               //다운로드 보임.
            }else{
                $("#fileSelectBuss").show();
                $("#bussLicenceDel").hide();
                $("#bussLicence").hide();
            }

          //기타  파일 있을시
            if(dms.string.isNotEmpty($("#etcFileNm").val())){
                $("#fileSelectEtc").hide();         //파일찾기없음.
                $("#etcFileDel").hide();            //삭제 보임.
                $("#etcFile").show();               //다운로드 보임.
            }else{
                $("#fileSelectEtc").hide();
                $("#etcFileDel").hide();
                $("#etcFile").hide();
            }
            $("#fileSelectAdd").hide();
            $("#addFileDel").hide();


            $("#btnFix").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnDel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);

            $("#btnVehAdd").data("kendoButton").enable(false);
            $("#btnVehDel").data("kendoButton").enable(false);

            $("#custNm").attr("disabled", true);
            $("#prsnId").attr("disabled", true);
            $("#hpNo").attr("disabled", true);
            $("#telNo").attr("disabled", true);
            $("#addr").attr("disabled", true);
            $("#atcDstinCd").data("kendoExtDropDownList").enable(false);
            $("#carUseTp").attr("disabled", true);
            $("#prsnDlrCd").attr("disabled", true);
            $("#prsnDlrTelNo").attr("disabled", true);
        */
        }else{
          //파일 관련 버튼
            $("#fileSelectContract").show();
            $("#contractFileDel").hide();
            $("#contractFile").hide();

            $("#fileSelectBuss").show();
            $("#bussLicenceDel").hide();
            $("#bussLicence").hide();

            $("#fileSelectEtc").show();
            $("#etcFileDel").hide();
            $("#etcFile").hide();

            $("#fileSelectAdd").show();
            $("#addFileDel").hide();

            $("#btnFix").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnVehAdd").data("kendoButton").enable(true);
            $("#btnVehDel").data("kendoButton").enable(true);

            $("#btnDel").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);
        }
    };


    //상세조회
    detailSet = function(dataItem){

        var approveCd = dataItem.approveCd;

        console.log("approveCd:"+approveCd);
        console.log("申请号码",dataItem.applyNo);
        //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 start
        var applicaNo = dataItem.applyNo;
         $("#applicaNum").val(dataItem.applyNo);
        //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 end
        fnReSet();
        var detailData = {};

        var params = {
                 "sDlrCd":dataItem.dlrCd
                ,"sUsrId":dataItem.usrId
                ,"sReqSeq":dataItem.reqSeq
                ,"sCallType":"req"
        }

        $.ajax({
            url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSlaesApplicationDetail.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(detailData, textStatus){

                if( detailData != null ){
                    detailInfo(detailData);
                    setButtonEnable(approveCd);
                }
            }
        });
    }

    detailInfo = function(detailData){
        // 2018-11-12 update by weiyingjie 集团销售申请/集团销售审批 在第一个单子里面输入的查询条件，关闭之后再打开第二个的时候，查询条件会一直在 start
   	     //$("#grid2").find("tr.k-filter-row").find('input').val('');
        $("#grid2").find(".k-i-close").click();
   	    //2018-11-12 update by weiyingjie 集团销售申请/集团销售审批 在第一个单子里面输入的查询条件，关闭之后再打开第二个的时候，查询条件会一直在 end
        if( detailData != null ){
              
            $("#reqSeq").val(detailData.reqSeq);
            $("#usrId").val(detailData.usrId);
            $("#dlrCd").val(detailData.dlrCd);

            $("#dlrNm").val(strDlrNm);
            $("#dlrArea").val(strOffNm);

            $("#custNm").val(detailData.custNm);
            $("#prsnId").val(detailData.prsnId);

            $("#addr").val(detailData.addr);

            $("#hpNo").val(detailData.hpNo);
            $("#telNo").val(detailData.telNo);

            $("#atcDstinCd").data("kendoExtDropDownList").value(detailData.atcDstinCd);
            $("#approveCd").val(detailData.approveCd);

            $("#carUseTp").val(detailData.carUseTp);
            $("#prsnDlrCd").val(detailData.prsnDlrCd);
            $("#prsnDlrTelNo").val(detailData.prsnDlrTelNo);

            $("#contractFileNm").val(detailData.contractFileNm);
            $("#bussLicenceNm").val(detailData.bussLicenceFileNm);
            $("#etcFileNm").val(detailData.etcFileNm);
            $("#addFileNm").val(detailData.addFileNm);
            $("#contractFileNo").val(detailData.contractFileNo);
            $("#bussLicenceNo").val(detailData.bussLicenceFileNo);
            $("#etcFileNo").val(detailData.etcFileNo);
            $("#addFileNo").val(detailData.addFileNo);


            fileDocId = detailData.fileDocId;
            $("#headFileDocId").val(fileDocId);
            $('#grid2').data('kendoExtGrid').dataSource.page(1);
            $('#grid3').data('kendoExtGrid').dataSource.page(1);

        }

    }

  //그리드 설정
    $("#grid2").kendoExtGrid({
        gridId:"G-SAL-0721-115209"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectDetlVehPop.do' />"
                    //url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesApplicationDetVeh.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sUsrId"] = $("#usrId").val();
                        params["sReqSeq"] = $("#reqSeq").val();


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                         dlrCd        :{type:"string"}
                        ,usrId        :{type:"string"}
                        ,reqSeq       :{type:"string"}
                        ,reqLowerSeq  :{type:"string"}
                        ,vinNo        :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineCd:{type:"string"}    //차종코드
                        ,carlineNm:{type:"string"}    //차종명
                        ,modelNm:{type:"string"}      //차관명
                        ,ocnCd         :{type:"string"}               //OCN코드
                        ,ocnNm         :{type:"string"}               //OCN명
                        ,extColorCd    :{type:"string"}               //외색코드
                        ,extColorNm:{type:"string"}   //외색명
                        ,intColorCd    :{type:"string"}               //내색코드
                        ,stockVinNo1  :{type:"string"}
                        ,stockVinNo2  :{type:"string"}
                        ,fileDocId    :{type:"string"}
                        ,fileDocCnt    :{type:"string"}
                        ,msPrc        :{type:"number"}
                        ,dcRate        :{type:"number"}
                        ,aamt        :{type:"number"}
                    }
                }
            }
        }
        ,height:250
        ,editable:false
        ,autoBind:false
        ,navigatable:true
        ,sortable:false
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,change:function(e){

            var grid = e.sender;
            var selectRow = this.dataItem(this.select());
            if(selectRow != null){
                var fileDocId = selectRow.fileDocId;
                reqLowerSeq = selectRow.reqLowerSeq ;
                $("#fileDocNo").val(fileDocId);
            }

        }
        ,dataBound:function(e){
            var grid = e.sender;
            $("#reqQty").text(grid._data.length);

            e.sender.select(e.sender.tbody.find("tr")[gridIndex]);
        }
        ,columns:[
             {field:"carlineCd",title:"<spring:message code='global.lbl.carlineCd' />", width:80, attributes:{"class":"ac"}}//차종code
            ,{field:"carlineNm",title:"<spring:message code='global.lbl.carlineNm' />", width:120, attributes:{"class":"ac"}}//차종description
            ,{field:"modelNm",title:"<spring:message code='global.lbl.model' />", width:120, attributes:{"class":"ac"}} //모델description
            ,{field:"ocnCd",title:"<spring:message code='global.lbl.ocnCode' />", width:80, attributes:{"class":"ac"}} //OCNcode
            ,{field:"ocnNm",title:"<spring:message code='global.lbl.ocnNm' />", width:140, attributes:{"class":"ac"}} //OCNdescription
            ,{field:"extColorCd",title:"<spring:message code='global.lbl.extColorCd' />", width:80, attributes:{"class":"ac"}} //외장색code
            ,{field:"extColorNm",title:"<spring:message code='global.lbl.extColorNm' />", width:80, attributes:{"class":"ac"}} //외장색description
            ,{field:"intColorCd",title:"<spring:message code='global.lbl.intColorCd' />", width:80, attributes:{"class":"ac"}} //내장색code
            ,{field:"vinNo",title:"<spring:message code='sal.lbl.carVinNo' />" , width:150, attributes:{"class":"ac"}}         //Vin NO
            ,{field:"msPrc",title:"<spring:message code='sal.lbl.carRetlAmt' />", width:80, attributes:{"class":"ar"}  ,format:"{0:n2}"} //지도가
            ,{field:"dcRate",title:"<spring:message code='sal.lbl.saleRate' />", width:80, attributes:{"class":"ar"},format:"{0:n2}",hidden:true}     //할인율
            ,{field:"aamt",title:"<spring:message code='sal.lbl.receptAmt' />", width:80, attributes:{"class":"ar"},format:"{0:n2}",hidden:true}     //영수증발행금액
            ,{field:"fileDocId",title:"<spring:message code='global.lbl.file'/>" ,width:80, attributes:{"class":"ac"}
                ,template: function(dataItem){
                    var objResult = "";
                    //update by lyy 否决的集团申请也可以添加附件 2018-11-06 start
                    if( $("#approveCd").val() == "A" || $("#approveCd").val() == "D" || $("#approveCd").val() == ""){
                        if(dms.string.isNotEmpty(dataItem.fileDocId)){
                            objResult = "<span class='txt_label bg_blue' style='cursor:hand' onClick='fileViewPop(\""+dataItem.fileDocId+"\")'><spring:message code='sal.lbl.addFile'/></span>";
                        }else{
                            objResult = "<span class='txt_label bg_blue' onClick='fileViewPop()'><spring:message code='sal.lbl.addFile'/></span>"; //파일추가
                        }
                    }else {
                        objResult = "<span class='txt_label bg_gray' ><spring:message code='sal.lbl.addFile'/></span>"; //파일추가
                    }
                  //update by lyy 否决的集团申请也可以添加附件 2018-11-06 end
                    return objResult;
                }
            }//첨부파일
            ,{field:"fileDocCnt",title:"<spring:message code='sal.lbl.fileCnt'/>" ,width:80, attributes:{"class":"ac"}
                ,template: function(dataItem){
                    var objResult = "";
                    if(dataItem.fileDocCnt > 0 ){
                        objResult = dataItem.fileDocCnt;
                    }else{
                        objResult = "0";
                    }
                    return objResult;
                }
            }//첨부파일유무
            ,{field:"reqSeq",title:"<spring:message code='global.btn.preview'/>" ,width:80 ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var objResult = "";
                    if(dms.string.isEmpty(dataItem.reqSeq)){
                        objResult = "<span class='txt_label bg_gray ac'><spring:message code='global.btn.preview'/></span>"; //파일추가
                    }else{
                        objResult = "<span class='txt_label bg_blue ac' onClick='imageViewPop(\""+dataItem.fileDocId+"\")'><spring:message code='global.btn.preview'/></span>";

                    }
                    return objResult;
                }
            }//미리보기
            ,{field:"dlrCd"          ,hidden:true}
            ,{field:"carId"         ,hidden:true}
            ,{field:"modelCd"       ,hidden:true}
            ,{field:"usrId"         ,hidden:true}
            ,{field:"reqLowerSeq"   ,width:60 ,hidden:true}
        ]
     });


    //그리드 3번 (심사정보 그리드)
    $("#grid3").kendoExtGrid({
        gridId:"G-SAL-0721-115210"
        ,dataSource:{
            transport:{
                 read:{
                     url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesApplicationDetJdg.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         /* var grid = $("#grid").data('kendoExtGrid');
                         var selectRow = grid.dataItem(grid.select());
 */
                         var params = {};
                        /*
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         */
                         params["sort"] = options.sort;
                         params["sDlrCd"] = $("#dlrCd").val();
                         params["sUsrId"] = $("#usrId").val();
                         params["sReqSeq"] = $("#reqSeq").val();
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
                          reqNo:{type:"number", hidden:true}  //요청번호
                          ,pevalId:{type:"string"}                 //심사담당자
                          ,evalDt:{type:"date"}                 //심사일자
                          ,evalRsltYn:{type:"string"}           //심사결과
                          ,remark:{type:"string"}                 //심사평가
                      }
                 }
             }
        }
        ,height:100
        ,multiSelectWithCheckbox:false
        ,editable   :false
        ,autoBind:false
        ,navigatable:true
        ,selectable:"row"
        ,pageable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
            {field:"reqNo", hidden:true}       // 요청번호
            ,{field:"pevalId", title:"<spring:message code='global.lbl.peval' />",width:80,attributes:{"class":"ac"}}  // 심사담당자
            ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />",width:60,attributes:{"class":"ac"}             // 심사일자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"evalRsltYn", title:"<spring:message code='global.lbl.evalRslt' />",width:55,attributes:{"class":"ac"}}      // 심사결과
            ,{field:"remark", title:"<spring:message code='global.lbl.evalRemark' />",width:50,attributes:{"class":"al"}}        // 심사평가
        ]
    });

    //버튼 - 엑셀다운로드
    $("#btnPopupExcel").kendoButton({
        click:function(e) {

            dms.ajax.excelExport({
                 "beanName":"groupSalesApplicationPopupService"
                ,"templateFile":"groupSalesApplicationPopup.xlsx"
                ,"fileName":"groupSalesApplicationPopup.xlsx"
                ,"sDlrCd":$("#dlrCd").val()
                ,"sUsrId":$("#usrId").val()
                ,"sReqSeq":$("#reqSeq").val()
            });
        }
    });

});
</script>
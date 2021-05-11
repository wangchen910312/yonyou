<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 수납관리 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11321" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11317" hasPermission="${dms:getPermissionMask('READ')}">
                    <!-- todo 버튼권한 부여 2017.08.30 -->
                    <button id="btnViewPrint" type="button" class="btn_m" disabled><spring:message code='sal.btn.giDoc' /></button>           <!-- 출고증 -->

                    <button type="button" class="btn_m" id="btnReceiveStart" disabled><spring:message code="ser.btn.receiveStart" /></button>  <!--수납시작  -->
                </dms:access>
                <dms:access viewId="VIEW-D-11320" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
                <input type="hidden" id="rcvSubDocNo3">
            </div>
        </div>

        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:17%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.compsDt" /></th><!--  정산일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCompFromDt" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sCompToDt" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.carVinNo" /></th><!--vin  -->
                        <td>
                            <input type="text" id="sVinNo" value="" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.jobContractNo" /></th> <!--해당업무명세번호  -->
                        <td>
                            <input type="text" id="sJobContractNo" value="" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th><!--고객-->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm" class="form_input" >
                                        <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                        <input id="sCustNm" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="sCustNo" readonly class="form_input form_readonly">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.paymentTp" /></th><!--지불여부-->
                        <td>
                            <input id="sPaymentTp" value="" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code="global.lbl.wrkTp" /></th><!--업무유형-->
                        <td>
                            <input id="sJobTp" value="" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.delCheck" /></th> <!-- 삭제건 제외 -->
                        <td><input type="checkbox" id="sDelYn" class="form_check" checked /></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11319" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
            </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="mainGrid" class="grid"></div>
        </div>

        <section class="group mt5">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="sal.title.payInfo" /></h2>      <!-- 정산내역 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11316" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnReceiveCancel" disabled style="display:none;"><spring:message code="ser.btn.receiveCancel" /></button>              <!--수납취소  -->
                        <button type="button" class="btn_s" id="btnRefund" disabled><spring:message code="ser.btn.refund" /></button><!--환불  -->
                    </dms:access>
                </div>
            </div>

            <div class="table_grid">
                <div id="subGrid" class="resizable_grid"></div>
            </div>
        </section>

        <!-- hidden값  -->
        <span style="display:none">
            <!-- 저장 후 선택될 수납문서번호 -->
            <input id="savedFinDocNo" value="" />
        </span>

    </section>
    <!-- //수납관리 -->
</div>

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

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

var subParam = {};

//수납상태 : SAL173
var paymentTpList = [];
<c:forEach var="obj" items="${paymentTpDS}">
    paymentTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 관련업무 : SAL174
var jobTpList = [];
<c:forEach var="obj" items="${jobTpDS}">
    jobTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var payInfoPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 초기화 버튼
    $("#btnReset").kendoButton({
        click:function(e){
            refreshAll();
        }
    });

    $("#btnViewPrint").kendoButton({    // 출고증
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var item = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(item) ){
                var printItemUrl = "<c:url value='/ReportServer?reportlet=sale/selectSaleGiDocPrint.cpt&sDlrCd="+item.dlrCd+"&sContractNo="+item.jobContractNo+"' />";
                open(printItemUrl,"<spring:message code='sal.btn.giDoc' />",'top=0,left=0,width=925,height=600,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    //버튼 - 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e) {

            $("#btnReceiveStart").data("kendoButton").enable(false);
            $("#btnViewPrint").data("kendoButton").enable(false);
            $("#subGrid").data('kendoExtGrid').dataSource.data([]);

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 엑셀 export 버튼
    $("#btnExcelExport").kendoButton({
       click:function(e){
           dms.ajax.excelExport({
               "beanName":"payInfoService"
               ,"templateFile":"PayInfo_Tpl.xlsx"
               ,"fileName":"DownloadExcel.xlsx"
               ,"sCompFromDt":kendo.toString(kendo.parseDate($("#sCompFromDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")
               ,"sCompToDt":kendo.toString(kendo.parseDate($("#sCompToDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")
               ,"sVinNo":$("#sVinNo").val()
               ,"sJobContractNo":$("#sJobContractNo").val()
               ,"sCustNm":$("#sCustNm").val()
               ,"sCustNo":$("#sCustNo").val()
               ,"sPaymentTp":$("#sPaymentTp").data("kendoExtDropDownList").value()
               //,"sPayEmpNo":$("#sPayEmpNo").val()
               ,"sJobTp":$("#sJobTp").data("kendoExtDropDownList").value()
               ,"sDelYn":$("#sDelYn").prop('checked') == true ? "Y":"N"
               ,"sFinDocNo":$("#savedFinDocNo").val()

           });
       }
    });

    // 환불 버튼
   $("#btnRefund").kendoButton({
       click:function(e){
           var sDlrCd = ""
             , sFinDocNo = "";

           var grid = $("#subGrid").data("kendoExtGrid");
           var rows = grid.select();

           var reFundList = []
             , isReturn = false;

           rows.each(function(index, row) {
              var dataItem = grid.dataItem(row);
              if(dms.string.strNvl(dataItem.colTp) != "01"){
                  isReturn = true;
              }

              sDlrCd = dataItem.dlrCd;
              sFinDocNo = dataItem.finDocNo;

              reFundList.push(dataItem);
           });

           if(isReturn){
               // 입금만 환불이 가능합니다.
               dms.notification.info("<spring:message code='sal.info.saveReFundMsg' />");
               return false;
           }
           var param = {"insertList":reFundList};

           if ( dms.string.isNotEmpty(reFundList) ){
               dms.window.confirm({
                   message:"<spring:message code='sal.info.isReFundMsg' />"     // 환불하겠습니까?
                   ,title :"<spring:message code='ser.btn.refund' />"
                   ,callback:function(result){
                       if(result){
                           dms.loading.show();
                           $.ajax({
                               url:"<c:url value='/sal/fin/payInfo/saveReFundPayInfo.do'/>",
                               data:JSON.stringify(param),
                               type:'POST',
                               dataType:'json',
                               contentType:'application/json',
                               async:false,
                               error:function(jqXHR,status,error) {
                                   dms.loading.hide();
                                   if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                   }else{
                                       dms.notification.error(error);
                                   }
                               },
                               success:function(jqXHR, textStatus) {
                                   dms.loading.hide();
                                   refreshAll(sFinDocNo);
                                   $('#mainGrid').data('kendoExtGrid').dataSource.page(1);

                                   subParam = {
                                           "sDlrCd":sDlrCd
                                         , "sFinDocNo":sFinDocNo
                                    };

                                   // 상세정보 Grid 조회
                                   $('#subGrid').data('kendoExtGrid').dataSource.read();

                                   //정상적으로 반영 되었습니다.
                                   dms.notification.success("<spring:message code='global.info.success'/>");
                               }
                           });

                       }else{
                           return false;
                       }
                   }
               });

           }else{
               // {상세정보}을(를) 확인하여 주세요.
               dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
               return;
           }
       }
    });

    // 수납시작 버튼
    $("#btnReceiveStart").kendoButton({
        enable:false
        ,click:function(e){
            viewDetailPopup();
        }
    });

    // 수납취소 버튼
    $("#btnReceiveCancel").kendoButton({
        enable:false
        ,click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var rows = grid.select();
            var selecteItem = grid.dataItem(rows);

            if(rows.length < 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select' />");
                return;
            }

            var saveData = {};
                saveData["finDocNo"] = selecteItem.finDocNo;
                saveData["dlrCd"] = selecteItem.dlrCd;
                saveData["jobTp"] = selecteItem.jobTp;
                saveData["jobContractNo"] = selecteItem.jobContractNo;

            if ( dms.string.isNotEmpty(selecteItem) ){

                dms.window.confirm({
                    message:"<spring:message code='global.info.cancel' />"     // 취소하겠습니까?
                    ,title :"<spring:message code='ser.btn.receiveCancel' />"
                    ,callback:function(result){
                        if(result){
                            $.ajax({
                                url:"<c:url value='/sal/fin/payInfo/cancelPayInfo.do'/>",
                                data:JSON.stringify(saveData),
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                async:false,
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(error);
                                },
                                success:function(jqXHR, textStatus) {
                                    // 상세정보 Grid 조회
                                    $('#subGrid').data('kendoExtGrid').dataSource.read();

                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");
                                }
                            });
                        }else{
                            return false;
                        }
                    }
                });

            }else{
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    // 수납완료 시작일
    $("#sCompFromDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // 수납완료 종료일
    $("#sCompToDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // 지불여부
    $("#sPaymentTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(paymentTpList)
       ,optionLabel:" "
    });

    //관련업무
    $("#sJobTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(jobTpList)
       ,optionLabel:" "
    });

    $("#mainGrid").kendoExtGrid({
        gridId :"G-SAL-0109-133305"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/fin/payInfo/selectPayInfoMainSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 정산일자
                        params["sCompFromDt"] = $("#sCompFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCompToDt"]   = $("#sCompToDt").data("kendoExtMaskedDatePicker").value();
                        // vin no
                        params["sVinNo"] = $("#sVinNo").val();
                        // 계약번호
                        params["sJobContractNo"] = $("#sJobContractNo").val();
                        // 고객
                        params["sCustNm"] = $("#vCustNm").val();
                        params["sCustNo"] = $("#sCustNo").val();
                        // 지불여부
                        params["sPaymentTp"] = $("#sPaymentTp").data("kendoExtDropDownList").value();
                        // 정산인
                        //params["sPayEmpNo"] = $("#sPayEmpNo").val();
                        // 관련업무
                        params["sJobTp"] = $("#sJobTp").data("kendoExtDropDownList").value();
                        // 삭제건 제외
                        params["sDelYn"] = $("#sDelYn").prop('checked') == true ? "Y":"N";
                        // 수납문서번호 조회
                        params["sFinDocNo"] = $("#savedFinDocNo").val();
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"finDocNo",
                    fields :{
                         dlrCd:{type:"string", editable:false}    //딜러코드
                        ,finDocNo:{type:"string"}                 //문서번호
                        ,jobContractNo:{type:"string"}            //계약번호
                        ,vinNo:{type:"string"}                    //vin
                        ,jobTpNm:{type:"string"}                  //관련업무
                        ,payCustNm:{type:"string"}                   //고객명
                        ,realPayAmt:{type:"number"}               //발생금액
                        ,totPayAmt:{type:"number"}
                        ,totDcAmt:{type:"number"}
                        ,recvAmt:{type:"number"}
                        ,overAmt:{type:"number"}
                        ,recpYn:{type:"string"}
                        ,recpYnNm:{type:"string"}
                        ,recpDt:{type:"date"}
                        ,compYn:{type:"string"}
                        ,compYnNm:{type:"string"}
                        ,compDt:{type:"date"}
                        ,saleEmpNm:{type:"string"}
                        ,regDt:{type:"date"}
                        ,updtDt:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                        ,compDtFormat:{type:"date"}
                        ,regDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                            elem.compDtFormat = kendo.parseDate(elem.compDt, "<dms:configValue code='dateFormat' />");
                            elem.regDtFormat  = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
       ,dataBound :function(e) {
           // 저장시에만 수납문서번호가 1회 들어있음.
           var savedFinNo = $("#savedFinDocNo").val();
           if(savedFinNo != ""){
               var rows = e.sender.tbody.children();

               var selectRow
                 , grid = $("#mainGrid").data("kendoExtGrid");

               $.each(rows, function(idx, row){
                   var dataItem = e.sender.dataItem(row);
                   if(dataItem.finDocNo == savedFinNo){
                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                        grid.select(selectRow);

                        $("#btnRefund").data("kendoButton").enable(false);
                        if(!isButtonStat(dataItem)){
                            $("#btnReceiveStart").data("kendoButton").enable(false);
                            $("#btnReceiveCancel").data("kendoButton").enable(false);
                        }else{
                            $("#btnReceiveCancel").data("kendoButton").enable(true);

                            if(dataItem.paymentTp == "01"){
                                $("#btnReceiveStart").data("kendoButton").enable(true);
                            }else{
                                $("#btnReceiveStart").data("kendoButton").enable(false);
                            }
                        }
                   }
               });
           }
           $("#savedFinDocNo").val("");      // 초기화
       }
       ,indvColumnVisible :true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
       ,appendEmptyColumn:false           //빈컬럼 적용. default :false
       ,enableTooltip :false              //Tooltip 적용, default :false
       ,height:285
       ,editable:false
       ,autoBind:true
       ,resizable:true
       ,navigatable:true
       ,selectable:"row"
       ,change:function(e) {
           if(e.sender.dataItem(e.sender.select()) != null
                   && !e.sender.dataItem(e.sender.select()).isNew()){

               var selectedVal = this.dataItem(this.select());

               if ( dms.string.isNotEmpty(selectedVal.finDocNo) ) {
                   $("#btnRefund").data("kendoButton").enable(false);

                   if(!isButtonStat(selectedVal)){
                       $("#btnReceiveStart").data("kendoButton").enable(false);
                       $("#btnReceiveCancel").data("kendoButton").enable(false);
                   }else{
                       $("#btnReceiveCancel").data("kendoButton").enable(true);

                       if(selectedVal.paymentTp == "01"){
                           $("#btnReceiveStart").data("kendoButton").enable(true);
                       }else{
                           $("#btnReceiveStart").data("kendoButton").enable(false);
                       }
                   }

               }

               if(selectedVal != null){
                   subParam = {
                           "sDlrCd":selectedVal.dlrCd
                         , "sFinDocNo":selectedVal.finDocNo
                    };

                   // 상세정보 Grid 조회
                   $('#subGrid').data('kendoExtGrid').dataSource.read();
               }

               if(selectedVal.jobTp != "" && selectedVal.jobTp == "C"){
                   $("#btnViewPrint").data("kendoButton").enable(true);
               }else{
                   $("#btnViewPrint").data("kendoButton").enable(false);
               }
           }
       }
       ,columns :[
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
          ,{field:"rnum",   title:"<spring:message code='par.lbl.rnum' />", width:40, sortable:false, attributes:{"class":"ac"}}//rnum
          ,{field:"finDocNo", title:"<spring:message code='sal.lbl.finDocNo' />", width:140, attributes:{"class":"ac"}} //수납문서번호
          ,{field:"jobContractNo", title:"<spring:message code='sal.lbl.jobContractNo' />", attributes:{"class":"al"}, width:150
              , template:function(item){
                  var str = "";
                  if(item.jobTp==="C"){
                      str += "<a href='#' onclick=\"javascript:fn_contractLink(\'"+ item.jobContractNo +"\');\" style='cursor:pointer'>";
                      str += item.jobContractNo;
                      str += "</a>";
                  }else{str=item.jobContractNo;}
                  return str;
              }
          }   //해당업무명세코드
          ,{field:"jobTpNm", title:"<spring:message code='sal.lbl.jobTpNm' />", attributes:{"class":"ac"}, width:110}   //해당업무명
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"al"}, width:150}   //vinNo
          ,{field:"paymentTpNm", title:"<spring:message code='sal.lbl.paymentTp' />", attributes:{"class":"ac"}, width:100
              ,template:function(dataItem){
                  var str = "";
                  if(dataItem.paymentTp == "01"){
                      str = "<span class='txt_label bg_green'>" + dataItem.paymentTpNm + "</span>";
                  }else if(dataItem.paymentTp == "02"){
                      str = "<span class='txt_label bg_blue'>" + dataItem.paymentTpNm + "</span>";
                  }
                  return str;
              }
          }
          ,{field:"realPayAmt", title:"<spring:message code='sal.lbl.realPayAmts' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}"} //발생금액
          ,{field:"totPayAmt", title:"<spring:message code='sal.lbl.totPayAmt' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}"}  //기결산금액
          ,{field:"totDcAmt", title:"<spring:message code='ser.lbl.dcAmt' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}", hidden:true}       // 할인금액
          ,{field:"recvAmt", title:"<spring:message code='sal.lbl.outstdAmt' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}"} // 미수금액
          ,{field:"overAmt", title:"<spring:message code='sal.lbl.overAmt' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}"} // 초과금액
          ,{field:"compDtFormat", title:"<spring:message code='sal.lbl.compsDt' />", width:140
              , attributes:{"class":"ac tooltip-enabled"}
              , template:"#= dms.string.strNvl(kendo.toString(data.compDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
          }     // 정산완료일시
          ,{field:"saleEmpNm", title:"<spring:message code='sal.lbl.saleEmp' />", attributes:{"class":"al"}, width:100 } //판매사원명
          ,{field:"custNo", title:"<spring:message code='global.lbl.customer' />", width:100, hidden:true}   //고객번호
          ,{field:"payCustNm", title:"<spring:message code='sal.lbl.publsNm' />", width:120}                 //고객명
          ,{field:"recpYnNm", title:"<spring:message code='sal.lbl.recpYn' />", attributes:{"class":"ac"}, width:100} //발행여부
          ,{field:"recpDt", title:"<spring:message code='sal.lbl.recpDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}"} //발행일시
          ,{field:"regDtFormat", title:"<spring:message code='sal.lbl.orderDate' />", width:100
              ,attributes:{"class":"ac tooltip-enabled"}
              ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') #"
          }
       ]
    });

    // 그리드 더블클릭
    $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#mainGrid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());

        if(selectedItem != null){
            if ( dms.string.isNotEmpty(selectedItem.finDocNo) ) {
                if(isButtonStat(selectedItem)){
                    viewDetailPopup();
                }
            }
        }
    });


    $("#subGrid").kendoExtGrid({
        gridId :"G-SAL-0109-180105"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/fin/payInfo/selectPayInfoDetailSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        subParam["sort"] = options.sort;
                        //console.log(subParam);
                        return kendo.stringify(subParam);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"seq",
                    fields :{
                         dlrCd:{type:"string", editable:false}    //딜러코드
                        ,finDocNo:{type:"string"}                 //문서번호
                        ,seq:{type:"number"}
                        ,colTpNm:{type:"string"}
                        ,rctDt:{type:"date"}
                        ,recpYnNm:{type:"string"}
                        ,recpSeq:{type:"string"}
                        ,recpDt:{type:"date"}
                        ,rctTpNm:{type:"string"}
                        ,bankTp:{type:"string"}
                        ,custNm:{type:"string"}
                        ,payAmt:{type:"number"}
                        ,dcAmt:{type:"number"}
                        ,payEmpNm:{type:"string"}
                        ,remark:{type:"string"}
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default :false
       ,appendEmptyColumn:false          //빈컬럼 적용. default :false
       ,enableTooltip :false             //Tooltip 적용, default :false
       ,height:240
       ,editable:false
       ,autoBind:false
       ,pageable:false
       ,sortable:false
       ,filterable:false
       ,change:function(e) {
           if(e.sender.dataItem(e.sender.select()) != null
                   && !e.sender.dataItem(e.sender.select()).isNew()){

               var selectedVal = this.dataItem(this.select());
               if ( dms.string.isNotEmpty(selectedVal.finDocNo) ) {
                   $("#btnRefund").data("kendoButton").enable(true);
               }
               //if(selectedVal.canYn == "Y" || selectedVal.colTp != "01"){
               // this.clearSelection(); return; }
           }

           var that = this;
           var cols = e.sender.tbody.find("tr");
           cols.each(function(idx, row){
               var item = that.dataItem(row);
               if(item.canYn == "Y" || item.colTp != "01"){
                   $(this).find(".grid-checkbox-item").prop("checked", false);
                   $(row).removeClass("k-state-selected");
               }else{
                   if($(this).hasClass("k-state-selected")){
                       $(this).find(".grid-checkbox-item").prop("checked", true);
                   }else{
                       $(this).find(".grid-checkbox-item").prop("checked", false);
                   }
               }
           });
           allCheckRow();

       }
       ,dataBound:function(e) {
           var rows = e.sender.tbody.children();
           $.each(rows, function(idx, row){
               var dataItem = e.sender.dataItem(row);
               if(dataItem.canYn == "Y" || dataItem.colTp != "01"){
                   $(row).css("background-color", "#E0E0E0");
                   $(".grid-checkbox-item", row).each(function(){
                       $(this).prop("disabled", true);
                   });
               }
           });
       }
       ,columns :[
                  {field:"dlrCd", hidden:true}       // 딜러코드
                  ,{field:"finDocNo", hidden:true}
                  ,{field:"seq", hidden:true}
                  ,{field:"rnum", hidden:true}
                  , {
                      _field:"_multiSelectWithCheckbox"
                       ,title:"&nbsp;", width:30, sortable:false, filterable:false, locked:false
                       ,headerAttributes:{"class":"ac"}
                       ,attributes:{"class":"ac"}
                       ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" />'
                       ,headerTemplate :"<input type='checkbox' class='checkAll'/>"
                   }
                  ,{field:"colTpNm", title:"<spring:message code='sal.lbl.receiveStat' />", attributes:{"class":"ac"}, width:80
                      /*
                      ,template:function(dataItem){
                          var str = "";
                          if(dataItem.colTp == "01"){
                              str = "<span class='txt_label bg_blue'>" + dataItem.colTpNm + "</span>";
                          }else if(dataItem.colTp == "02"){
                              str = "<span class='txt_label bg_orange'>" + dataItem.colTpNm + "</span>";
                          }else if(dataItem.colTp == "03"){
                              str = "<span class='txt_label bg_red'>" + dataItem.colTpNm + "</span>";
                          }
                          return str;
                      }
                      */
                  }   //입출금
                  ,{field:"rctDt", title:"<spring:message code='sal.lbl.rcvRegDt' />", attributes:{"class":"ac"}, width:140, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"}        //수납일자
                  ,{field:"recpYnNm", title:"<spring:message code='sal.lbl.recpYnNm' />", attributes:{"class":"ac"}, width:100}    //영수증발행여부
                  ,{field:"recpDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}"}   //영수증발행일
                  ,{field:"recpSeq", title:"<spring:message code='sal.lbl.invoiceNo' />", attributes:{"class":"ac"}, width:80}     //영수증번호
                  ,{field:"rctTpNm", title:"<spring:message code='sal.lbl.payTp' />", attributes:{"class":"ac"}, width:80}         //지불방식
                  ,{field:"bankTpNm", title:"<spring:message code='sal.lbl.bankTp' />", attributes:{"class":"ac"}, width:80}       //은행정보
                  ,{field:"payAmt", title:"<spring:message code='global.lbl.calcAmt' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}"}     //정산금액
                  ,{field:"payEmpNm", title:"<spring:message code='sal.lbl.payEmpNo' />", attributes:{"class":"ac"}, width:100}    //정산인
                  ,{field:"payTpNm", title:"<spring:message code='sal.lbl.payTpNm' />", attributes:{"class":"ac"}, width:100}      //정산유형
                  ,{field:"remark", title:"<spring:message code='sal.lbl.remark' />", attributes:{"class":"al"}, width:300}        //비고
               ]
    });

    $("#subGrid").on("click", ".checkAll", function(e) {
        var grid = $("#subGrid").data("kendoExtGrid")
          , rows = grid.tbody.find("tr")
          , lineDisabled;

        if($(this).is(":checked")){
            rows.each(function(index, row) {
                lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");

                if(!lineDisabled){
                    grid.select($(this));
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                }else{
                    $(this).find(".grid-checkbox-item").prop("checked", false);
                    $(e.currentTarget).closest("tr").removeClass("k-state-selected");
                    $(row).removeClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    /**
     * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
     */
     $("#subGrid").on("click", ".grid-checkbox-item", function(e){
         var grid = $("#subGrid").data("kendoExtGrid");
         var row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");

         if($(this).is(":checked")){
             grid.select(row);
         }else{
             //$(e.currentTarget).closest("tr").removeClass("k-state-selected");
             $(row).removeClass("k-state-selected");
         }
         allCheckRow();
     });


    fnOnfocus = function(id){
        $("#"+ id +" ").select();
    }

});
/******************************************
 * ready () = End =
 ******************************************/

//전체선택
function allCheckRow(){
    var grid = $("#subGrid").data("kendoExtGrid");
    var view = grid.dataSource.view()
      , lineDisabled
      , totLength = 0;

    $.each(view, function(idx, row){
        if(row.canYn != "Y" && row.colTp == "01"){totLength++;}
    });

    if(grid.select().length == totLength){
        $(".checkAll").prop("checked", true);
    }else{
        $(".checkAll").prop("checked", false);
    }
}

 // 팝업오픈
function viewDetailPopup(){
     var grid = $("#mainGrid").data("kendoExtGrid");
     var rows = grid.select();
     var selecteItem = grid.dataItem(rows);

     if (rows.length < 1) {
         //목록을 선택하여 주십시오.
         dms.notification.info("<spring:message code='global.info.required.select'/>");
         return;
     }

     payInfoPopupWindow = dms.window.popup({
         windowId:"payInfoPopup"
         ,title:"<spring:message code='sal.title.payinfoPoupTitle'/>"      // 수납관리
         ,width :950
         ,height:selecteItem.jobTp==="C"?500:440
         ,modal:true
         ,content:{
             url:"<c:url value='/sal/fin/payInfo/selectPayInfoPopup.do'/>"
             ,data:{
                 "type":null
                 ,"autoBind":true
                 //,"selectItem":selecteItem
                 ,"dlrCd":selecteItem.dlrCd
                 ,"finDocNo":selecteItem.finDocNo
                 ,"callbackFunc":function(data){
                     if (data.msg == "save"){

                         //$("#subGrid").data("kendoExtGrid").dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         //dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                  }
             }
         }
     });

 }


 // 조회조건 초기화
refreshAll = function(fincNo){
    //$("#sRctFromDt").data("kendoExtMaskedDatePicker").value();
    //$("#sRctToDt").data("kendoExtMaskedDatePicker").value();
    $("#sVinNo").val("");
    $("#sJobContractNo").val("");
    $("#vCustNm").val("");
    $("#sCustNo").val("");
    $("#sCustNm").val("");
    $("#sPaymentTp").val("");
    $("#sJobTp").val("");
    //$("#sPayEmpNo").val("");

    $("#savedFinDocNo").val(dms.string.strNvl(fincNo));
}

//고객명 event
$("#vCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter event
$("#vCustNm").keyup(function(e){
    if (e.keyCode != 13) {
        cleanCustCheck();
    }
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vCustNm").val()) != dms.string.strNvl($("#sCustNm").val()) ){
        $("#sCustNo").val('');
        $("#sCustNm").val('');
    }
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var responseJson = {};
    if( dms.string.trim($("#vCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vCustNm").val()})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "closeYn":"Y"
                    , "custNm":$("#vCustNm").val()
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sCustNo").val(data[0].custNo);       // 고객코드
                            $("#sCustNm").val(data[0].custNm);       // 고객명
                            $("#vCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

function gridReLosd(){
    $("#mainGrid").data("kendoExtGrid").dataSource._destroyed = [];
    $("#mainGrid").data("kendoExtGrid").dataSource.page(1);

    $('#subGrid').data('kendoExtGrid').dataSource.read();
}

function isButtonStat(data){
    var stat = data.jobStatCd
      , isFlag = true;

    switch(data.jobTp){
        case 'C':
            if(stat == "90" || stat == "91"){
                isFlag = false;
            }
            break;
        case 'G':
            if(stat == "50" || stat == "60"){
                isFlag = false;
            }
            break;
        case 'I':
            if(stat == "90" || stat == "91"){
                isFlag = false;
            }
            break;
        case 'B':
            if(stat == "90" || stat == "91"){
                isFlag = false;
            }
            break;
        default:
            break;
    }

    return isFlag;
}

//계약정보상세 조회
function fn_contractLink(contractNo){

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
      , sContractNo = contractNo;

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

                        //$('#contGrid').data('kendoExtGrid').dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        //dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                 }
            }
        }
    });
}

-->
</script>
<!-- end script -->
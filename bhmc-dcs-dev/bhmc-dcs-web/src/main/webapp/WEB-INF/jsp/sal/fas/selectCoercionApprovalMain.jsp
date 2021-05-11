<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 강제판매승인 -->
<div id="resizableContainer">
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.exceptionDeliveyEval' /></h1>       <!-- 강제판매승인 -->
		<div class="btn_right">
		<!-- 20201224 update by tjx 下载按钮 -->
		<dms:access viewId="VIEW-I-12413" hasPermission="${dms:getPermissionMask('READ')}">
			<button id="btnExcelExport" class="btn_m"><spring:message code="global.btn.excelExport" /></button>    <!-- 下载 -->
		</dms:access>
		<dms:access viewId="VIEW-I-12412" hasPermission="${dms:getPermissionMask('READ')}">
			<button id="btnConfirm" class="btn_m"><spring:message code='global.btn.approval' /></button>    <!-- 승인 -->
		</dms:access>
		<dms:access viewId="VIEW-I-12411" hasPermission="${dms:getPermissionMask('READ')}">
			<button id="btnNonConfirm"  class="btn_m"><spring:message code='sal.btn.reject' /></button>     <!-- 거절 -->
		</dms:access>
		<dms:access viewId="VIEW-I-12410" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>     <!-- 조회 -->
		</dms:access>
		</div>
	</div>
	<div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
		<table>
			<caption></caption>
            <colgroup>
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
                    <th scope="row"><spring:message code='sal.lbl.evalStatus' /></th> <!-- 심사상태 -->
                    <td>
                        <input id="sReqStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th> <!-- 신청일자 -->
                    <td class="bor_none">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRegStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRegEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.approveDt' /></th> <!-- 승인일자 -->
                    <td class="bor_none">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sApproveStratDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sApproveEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th>     <!-- VIN -->
                    <td>
                        <input id="sVinNo" class="form_input" maxlength="17" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.division' /></th>  <!-- 사업부 -->
                    <td>
                        <input id="sDiviCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th>     <!-- 사무소 -->
                    <td>
                        <input id="sOffCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>     <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input" onkeyup="this.value=this.value.toUpperCase()"/>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                </tr>
                <!-- //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 start -->
                <tr>
                	<th scope="row"><spring:message code='sal.lbl.receipYn' /></th>   <!-- 차종 -->
                    <td>
                        <input id="sReceipYn" class="form_comboBox" />
                    </td>
                </tr>
                <!-- //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 end -->
			</tbody>
		</table>
	</div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>

    <section id="fileViewWindow" class="pop_wrap">
        <div class="table_grid mt10">
            <div id="fileGrid"></div>
        </div>
        <!-- 파일업로드 -->
    </section>
</section>
</div>
<!-- //강제판매승인 -->


<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);
var fileDocNo;

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         //현재일자
var oneDay = "${oneDay}";       // 해당월 1일

//예외처리 사유 SAL153:FCE_SALE_REQ_REASON_CD
var reqReasonDSList = [];
var reqReasonObj = {};
<c:forEach var="obj" items="${reqReasonDS}">
    reqReasonDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    reqReasonObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//강제판매승인상태 SAL154
var approveDSList = [];
var approveCdObj = {};
<c:forEach var="obj" items="${approveDS}">
    <c:if test="${obj.cmmCd ne 'E' and obj.cmmCd ne 'S' and obj.cmmCd ne 'C0'}">
        approveDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        approveCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 start
var receipYnCdList = [];
	receipYnCdList.push({receipYnNm:"有", receipYnCd:"Y"});
	receipYnCdList.push({receipYnNm:"无", receipYnCd:"N"});
//20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 end

//사업부
var divisionCdDs = [];
<c:forEach var="obj" items="${sdptCdList}">
    divisionCdDs.push({"diviCd":"${obj.sdptCd}", "diviNm":"${obj.sdptNm}"});
</c:forEach>
var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.cmmCd});

var receiptImagePopupWindow;
var selectSalesAddTaxRptPopupWin;
$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnConfirm").kendoButton({ // 승인
        enable:true,
        click:function(e){
            confirm('Y');
        }
    });

    $("#btnNonConfirm").kendoButton({ // 삭제:불승인
        enable:true,
        click:function(e){
            confirm('N');
        }
    });
    
    //20201224 update by tjx 异常申请审批下载 start
    $("#btnExcelExport").kendoButton({
        click:function(e){
            dms.ajax.excelExport({
            	"beanName"        : "coercionApprovalService"
                ,"templateFile"    : "CoercionApprovalList_Tpl.xlsx"
                ,"fileName"        : "<spring:message code='sal.title.exceptionDeliveyEval' />.xlsx"
                //审批状态	
                ,"sReqStatCd"      : $("#sReqStatCd").data("kendoExtDropDownList").value()
                //申请日期	
                ,"sRegStartDt"     : $("#sRegStartDt").val()
                ,"sRegEndDt"       : $("#sRegEndDt").val()
                //审批日期	
		,"sApproveStratDt" : $("#sApproveStratDt").val()
                ,"sApproveEndDt"   : $("#sApproveEndDt").val()
                //车辆识别码	
                ,"sVinNo"          : $("#sVinNo").val()
                //事业部	
                ,"sDiviCd" 	   : $("#sDiviCd").data("kendoExtDropDownList").value()
                //办事处	
		,"sOffCd"          : $("#sOffCd").data("kendoExtDropDownList").value()
		//经销商代码	
                ,"sDlrCd"          : $("#sDlrCd").val()
                //车种
                ,"sCarlineCd"      : $("#sCarlineCd").data("kendoExtDropDownList").value()
                //是否存在机动车统一发票
                ,"sReceipYn"      : $("#sReceipYn").data("kendoExtDropDownList").value()
            });
        }
    });
  //20201225 update by tjx 异常申请审批下载 end
  
    // 승인 , 불승인
    confirm = function(appr){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "", msg = "";
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();

        if(rows.length  == 0 ){
            dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
            return false;
        }

        rows.each(function(index, row) {
            var row = grid.dataItem(row);

            if( dms.string.strNvl(row.reqStatCd) != "R"){
                isReqStatCd = dms.string.strNvl(row.reqStatCd);
            }

            vo.push({dlrCd:row.dlrCd, vinNo:row.vinNo, vinNo1:row.vinNo1, vinNo2:row.vinNo2, seq:row.seq, contractNo:row.contractNo, ordTp:row.ordTp});
        });

        if(dms.string.isNotEmpty(isReqStatCd)){
            // [불승인 or 승인] 처리 건이 존재합니다.
            dms.notification.warning("["+approveCdObj[isReqStatCd]+"] <spring:message code='sal.info.CoercionApprovChkMsg' />" );
            return ;
        }

        param = {list:vo};

        if(appr == 'Y'){
            saveUrl = "<c:url value='/sal/fas/coercionApproval/confirms.do' />";
            msg = "<spring:message code='global.btn.approval' var='btnApproval' /><spring:message code='global.info.cnfrmMsg' arguments='${btnApproval}' />";
        }else{
            saveUrl = "<c:url value='/sal/fas/coercionApproval/nonConfirms.do' />";
            msg = "<spring:message code='sal.btn.reject' var='btnReject' /><spring:message code='global.info.cnfrmMsg' arguments='${btnReject}' />";
        }

        dms.window.confirm({
            message:msg
            ,title :"<spring:message code='global.lbl.info' />"
            ,callback:function(result){
                if(result){
                    dms.loading.show();
                    $.ajax({
                        url:saveUrl,
                        data:JSON.stringify(param),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.loading.hide();
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {
                            dms.loading.hide();
                            $("#grid").data("kendoExtGrid").dataSource.read();

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

    //사업부
    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm"
       ,dataValueField:"diviCd"
       ,dataSource:divisionCdDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);


           if(dataItem.diviCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
               ,async:false
           });
           $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           //$("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
       }
    });

    // 사무소
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       ,optionLabel:" "   // 전체
    });
    $("#sOffCd").data("kendoExtDropDownList").enable(false);

    // 승인여부
    $("#sReqStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(approveDSList)
       ,optionLabel:" "
       ,index:1
    });

    // 등록일자:시작일
    $("#sRegStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });
    // 등록일자:종료일
    $("#sRegEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 심사일자:시작일
    $("#sApproveStratDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    // 심사일자:종료일
    $("#sApproveEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
    });
  //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 start
	  $("#sReceipYn").kendoExtDropDownList({
	        dataTextField:"receipYnNm"
	       ,dataValueField:"receipYnCd"
	       ,dataSource:receipYnCdList
	       ,optionLabel:" "
	    });
  //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 end
    $("#fileViewWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.fileView' />"     //첨부파일 보기
        ,width:"700px"
        ,height:"250px"
    }).data("kendoWindow");

    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1209-135001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/fas/coercionApproval/selectCoercionApproval.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;


                        //심사상태
                        params["sReqStatCd"] = $("#sReqStatCd").data("kendoExtDropDownList").value();

                        //신청일자
                        params["sRegStartDt"] = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sRegEndDt"] = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();

                        //심사일자
                        params["sApproveStratDt"] = $("#sApproveStratDt").data("kendoExtMaskedDatePicker").value();
                        params["sApproveEndDt"] = $("#sApproveEndDt").data("kendoExtMaskedDatePicker").value();

                        //사업부
                        params["sDiviCd"] = $("#sDiviCd").data("kendoExtDropDownList").value();

                        //판사처
                        params["sOffCd"] = $("#sOffCd").data("kendoExtDropDownList").value();

                        //딜러코드
                        params["sDlrCd"] = $("#sDlrCd").val();

                        //차형
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                        //VIN_NO
                        params["sVinNo"] = $("#sVinNo").val();
		
                      //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 start
                      	params["sReceipYn"] = $("#sReceipYn").data("kendoExtDropDownList").value();
                      //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 end
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                          seq        :{type:"number"}           //일련번호
                        , reqStatCd  :{type:"string"}           //요청상태(승인/불승인 상태 여부)
                        , dlrCd      :{type:"string"}           //딜러코드
                        , dlrNm      :{type:"string"}           //딜러명
                        , sdptNm     :{type:"string"}           //사업부
                        , distOfficeNm:{type:"string"}          //사무소
                        , reqDt      :{type:"date"}             //신청일자
                        , fceSaleReqReasonCd :{type:"string"}   //예외사유
                        , vinNo      :{type:"string"}           //VIN NO
                        , carlineNm  :{type:"string"}           //차종명
                        , modelNm    :{type:"string"}           //차관명
                        , carTaxReceiptNo:{type:"string"}
                        , carTaxReceiptIssDt:{type:"date" }
                        , carTaxTaxpayerIdCd:{type:"string"}
                        , etcTaxReceiptNo:{type:"string"}
                        , etcTaxReceiptIssDt:{type:"date"}
                        , etcTaxTaxpayerIdCd:{type:"string"}
                        , rfidNo     :{type:"string"}           //RFID NO
                        , regUsrId   :{type:"string"}           //성명
                        , ronum      :{type:"string"}           //순번
                        , contractNo :{type:"string"}           //계약번호
                        , ordTp :{type:"string"}           //주문유형
                        , approveDt      :{type:"date"}             //신청일자
                        , carTaxReceiptIssDt:{type:"date"}  //  开票日期、是否有发票的点击查看发票有问题   CRS NO 33 贾明 2019-11-28 
                        , carTaxTaxpayerIdCd:{type:"string"} //  纳税人号展示问题、是否有发票的点击查看发票有问题   CRS NO 33 贾明 2019-11-28 
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
       ,change:function(e) {

           var that = this;
           var rows = this.select();
           $.each(rows, function(idx, row){
               if(that.dataItem(row).reqStatCd != "R"){
                   that.clearSelection(row);
               }
           });

           if(this.select().length != 0){
               var selectedVal = this.dataItem(this.select());

               fileDocNo = selectedVal.fileDocNo;

           }

        }
        ,dataBound:function(e) {

           var rows = e.sender.tbody.children();
           $.each(rows, function(idx, row){
               var dataItem = e.sender.dataItem(row);

               if(dataItem.reqStatCd != "R"){
                   $(row).css("background-color", "#E0E0E0");
                   $(".grid-checkbox-item", row).each(function(){
                       $(this).prop("disabled", true);
                   });
               }
           });
       }
       ,multiSelectWithCheckbox:true
       ,editable:false
       ,pageable:{refresh: true}    //tianjx  出库审批管理 显示分页
       ,autoBind:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
                 {field:"ronum"       , title:"<spring:message code='sal.lbl.numberSeq' />", width:50, attributes:{"class":"ar"}}                                                          // 번호
                ,{field:"reqStatCd", title:"<spring:message code='sal.lbl.evalStatus' />", width:90, attributes:{"class":"al"}, template:"#=dms.string.strNvl(approveCdObj[reqStatCd])#"}  // 심사상태
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}                                      // 딜러코드
                ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:190, attributes:{"class":"al"}}                                     // 딜러명
                ,{field:"sdptNm", title:"<spring:message code='sal.lbl.sdpt' />", width:90, attributes:{"class":"al"}}                                         // 사업부명
                ,{field:"distOfficeNm", title:"<spring:message code='sal.lbl.distOffice' />", width:90, attributes:{"class":"al"}}                             // 판사처명
                ,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />", width:90, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}    // 신청일자
                ,{field:"approveDt", title:"<spring:message code='sal.lbl.confirmDt' />", width:90, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}    // 심사일자
                ,{field:"fceSaleReqReasonCd"
                   ,title:"<spring:message code='sal.excpDeliveryReason' />"
                   ,width:120
                   ,hidden:true
                   ,attributes:{"class":"al"}
                   ,template:"#=reqReasonObj[fceSaleReqReasonCd]#"}                                                                                             // 예외사유
                ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}                                      // vin
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine'/>", width:80, attributes:{"class":"al"}}                                  // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model'/>", width:180, attributes:{"class":"al"}}                                     // 차관
                ,{
                    title: "<spring:message code='sal.lbl.VehicleCombineReceipt' />" //기동차영수증
                    ,headerAttributes:{ "class":"hasBob" }
                    ,columns: [
                           {_field:"carTaxReceiptNoYn", title:"<spring:message code='sal.lbl.receipYn'/>", width:100, attributes:{"class":"ac"}
                               , template:function(dataItem){
                                   if(!dms.string.isEmpty(dataItem.carTaxReceiptNo)){
                                       return "<a href='#' class='btnCarTaxImage' data-uid='"+dataItem.uid+"' ><spring:message code='sal.lbl.yes'/></a>";
                                   }
                                   return "<spring:message code='sal.lbl.none'/>";
                               }
                           } // 영수증유무
                           ,{_field:"carTaxReceiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt'/>", width:100
                               ,attributes:{"class":"ac"}
                               , template:function(dataItem){
                                   if(!dms.string.isEmpty(dataItem.carTaxReceiptIssDt)){
                                       return kendo.toString(dataItem.carTaxReceiptIssDt, '<dms:configValue code='dateFormat' />');  
                                   }
                                   return "<spring:message code='sal.lbl.none'/>";
                               }
                               ,format: "{0:<dms:configValue code='dateFormat' />}"
                           } //  开票日期、纳税人号展示问题、是否有发票的点击查看发票有问题   CRS NO 33 贾明 2019-11-28 
                           ,{_field:"carTaxTaxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo'/>", width:120, attributes:{"class":"al"}
                             , template:function(dataItem){
                                   if(!dms.string.isEmpty(dataItem.carTaxTaxpayerIdCd)){
                                       return kendo.toString(dataItem.carTaxTaxpayerIdCd);  
                                   }
                                   return "<spring:message code='sal.lbl.none'/>";
                               }
                           }     // 开票日期、纳税人号展示问题、是否有发票的点击查看发票有问题   CRS NO 33 贾明 2019-11-28 
                    ]
                }
                ,{
                    title: "<spring:message code='sal.lbl.AddTaxReceipt' />" //증치세영수증
                    ,headerAttributes:{ "class":"hasBob" }
                    ,columns: [
                           {_field:"etcTaxReceiptNoYn", title:"<spring:message code='sal.lbl.receipYn'/>", width:100, attributes:{"class":"ac"}
                               , template:function(dataItem){
                                   if(!dms.string.isEmpty(dataItem.etcTaxReceiptNo)){
                                       //return "<a href='#' class='btnEtcTaxImage' data-uid='"+dataItem.uid+"' ><spring:message code='sal.lbl.yes'/></a>";
                                       return "<spring:message code='sal.lbl.yes'/>";
                                   }
                                   return "<spring:message code='sal.lbl.none'/>";
                               }
                           } // 영수증유무
                           ,{_field:"etcTaxReceiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt'/>", width:100
                               ,attributes:{"class":"ac"}
                               ,format: "{0:<dms:configValue code='dateFormat' />}"
                           }       //영수증일자
                           ,{_field:"etcTaxTaxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo'/>", width:120, attributes:{"class":"al"}}     // 납세자번호
                    ]
                }
                ,{field:"rfidNo", title:"<spring:message code='global.lbl.rfidNo' />", width:100, attributes:{"class":"al"}}                                    // RFID NO
                ,{field:"regUsrId", title:"<spring:message code='global.lbl.custNo' />", width:120, attributes:{"class":"al"}}                                   // 고객번호
       ]
   });

    $("#fileGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation == "read") {
                        var params = {};
                        params["sFileDocNo"] = fileDocNo;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        fileDocNo:{type:"string"}
                        ,fileNo:{type:"number"}
                        ,fileNm:{type:"string"}
                        ,fileSize:{type:"number"}
                    }
                }
            }
        }
       ,autoBind:false
       ,editable:false
       ,height:200
       //,multiSelectWithCheckbox:true
       ,navigatable:false
       ,pageable:false
       ,resizable:false
       ,sortable:false
       ,filterable:false
       ,columns:[
           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}           // 파일명
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"al"}}       // 파일크기
          ,{title:"",width:50,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue'><spring:message code='global.btn.download' /></span>"
           }

       ]
    });

    //그리드 클릭 이벤트.
    $("#fileGrid tbody").on("click", "tr.k-state-selected td", function (e) {
        var row = $(this).closest("tr");
        var colIdx = $("td", row).index(this);

        if(colIdx == 2){
            var fileGrid = $('#fileGrid').data('kendoExtGrid');
            var dataItem = fileGrid.dataItem(fileGrid.select());

            if(dms.string.isNotEmpty(dataItem)){
                dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
            }
        }
    });

    // 기동차영수증 이미지 팝업
    $(document).on("click", ".btnCarTaxImage", function(e){
        receiptImagePopupWindow = dms.window.popup({
            windowId:"receiptImagePopupWindow"
            , title:"<spring:message code='sal.title.ReceiptUpload' />"
            , modal:true
            , draggable:true
            , resizable:false
            , visible:false
            , width:1200
            , height:500
            , content:{
                //url:"<c:url value='/sal/rcp/selectSalesVehicleCombineRptPopup.do'/>"
                url:"<c:url value='/sal/rcp/selectReceiptImagePopup.do'/>"
                , data:{
                    "type":null
                    ,"autoBind":false
                    ,"sVinNo":dms.string.strNvl($("#grid").data("kendoExtGrid").dataSource.getByUid($(this).attr("data-uid")).vinNo)
                    ,"sReceiptNo":dms.string.strNvl($("#grid").data("kendoExtGrid").dataSource.getByUid($(this).attr("data-uid")).carTaxReceiptNo) //CRS 清单  NO 33 dcs出库审批管理 异常申请审批，有机动车统一销售发票相关的几个字段展示 1、车辆对应的发票，只有初审通过状态，没有复核通过的情况，那就以最新审核通过展示；2、有复核通过的发票，那就展示最新复核通过的。贾明 2019-11-28 此处点击查看发要票图片
                    , "sParent":"vehicleCombineReceipt"
                    , "callbackFunc":function(data){}
                }
            }
        });
    });

    // 증치세영수증 이미지 팝업
    $(document).on("click", ".btnEtcTaxImage", function(e){
        selectSalesAddTaxRptPopupWin = dms.window.popup({
            windowId:"selectSalesAddTaxRptPopupWin"
            , title:"<spring:message code='sal.title.ReceiptUpload' />"
            , modal:true
            , draggable:true
            , resizable:false
            , visible:false
            , width:900
            , height:500
            , content:{
                url:"<c:url value='/sal/rcp/selectSalesAddTaxRptPopup.do'/>"
                , data:{
                    "type":null
                    ,"autoBind":false
                    ,"sVinNo":dms.string.strNvl($("#grid").data("kendoExtGrid").dataSource.getByUid($(this).attr("data-uid")).vinNo)
                    , "callbackFunc":function(data){}
                }
            }
        });
    });
});

//팝업 오픈 ( 첨부파일 )
function fileViewPop(){
    $('#fileGrid').data('kendoExtGrid').dataSource.page(1);
    var win = $("#fileViewWindow").data("kendoWindow");
    win.center();
    win.open();
}
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.saleCnclAppr" /></h1><!-- 소매취소심사 -->
        <div class="btn_right">
        
        <!--Q21012900002 出库取消审批增加下载功能 下载Excle JiaMing 2021-2-5  start -->
        <dms:access viewId="VIEW-I-13260" hasPermission="${dms:getPermissionMask('READ')}">
			<button id="btnExcelExport" class="btn_m"><spring:message code="global.btn.excelExport" /></button>    <!-- 下载 -->
		</dms:access>
		<!--Q21012900002 出库取消审批增加下载功能 下载Excle JiaMing 2021-2-5  end -->
		
		<dms:access viewId="VIEW-I-12415" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m" id="btnApprove"><spring:message code="global.btn.approval" /></button><!-- 승인 -->
		</dms:access>
		<dms:access viewId="VIEW-I-12414" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m" id="btnApproveCnl"><spring:message code="sal.btn.reject" /></button><!-- 불승인 -->
		</dms:access>
		<dms:access viewId="VIEW-I-12413" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
		</dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.reqStat' /></span></th><!-- 승인여부 -->
                    <td >
                        <input id="sApproveYn" type="text" class="form_comboBox">
                    </td>

                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th>     <!-- VIN -->
                    <td>
                        <input id="sVinNo" class="form_input" maxlength="17" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th><!-- 신청일자 -->
                    <td>
                        <div class="date_left">
                            <input id="sReqStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sReqEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.approveDt' /></th><!-- 승인일자 -->
                    <td>
                        <div class="date_left">
                            <input id="sApproveStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from" >~</span>
                        </div>
                        <div class="date_right">
                            <input id="sApproveEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                </tr>
                <!--Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 start -->
                <tr>
                	<th scope="row"><spring:message code='sal.lbl.receipYn' /></th>
                    <td>
                        <input id="sReceipYn" class="form_comboBox" />
                    </td>
                </tr>
                <!-- Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 end -->
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
</div>

<!-- script -->
<script>
var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자

//판매취소사유 Array(SAL130)
var cancReasonCdDs = [];
<c:forEach var="obj" items="${cancReasonCdList}">
    cancReasonCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판매취소사유 Map
var cancReasonCdMap = dms.data.arrayToMap(cancReasonCdDs, function(obj){ return obj.cmmCd; });

//심사여부 Array(SAL131)
var approveYnDs = [];
<c:forEach var="obj" items="${approveYnList}">
    approveYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//심사여부 Map
var approveYnMap = dms.data.arrayToMap(approveYnDs, function(obj){ return obj.cmmCd; });


//주문유형(오더유형) Array(SAL138)
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpList}">
  //ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>

//요청상태 Array(SAL154)
var reqStatCdDs = [];
<c:forEach var="obj" items="${reqStatCdList}">
    <c:if test="${obj.cmmCd ne 'E' and obj.cmmCd ne 'S' and obj.cmmCd ne 'C0'}">
        reqStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
//요청상태 Map
var reqStatCdMap = dms.data.arrayToMap(reqStatCdDs, function(obj){ return obj.cmmCd; });

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//당월이월구분 (SAL188)
//var monthTpDs = [];
//<c:forEach var="obj" items="${monthTpList}">
//  monthTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
//</c:forEach>
//var monthTpMap = dms.data.arrayToMap(monthTpDs, function(obj){ return obj.cmmCd; });

//Q21012900003 	出库取消审批列表显示有无发票、发票核验结果。查询条件增加有无发票 start
var receipYnCdList = [];
	//receipYnCdList.push({receipYnNm:"有", receipYnCd:"Y"});
	//receipYnCdList.push({receipYnNm:"无", receipYnCd:"N"});
	
	
	<c:forEach var="obj" items="${receiptYnInfo}">
	     receipYnCdList.push({receipYnNm:"${obj.cmmCdNm}", receipYnCd:"${obj.cmmCd}"});
	</c:forEach>
	
//Q21012900003 	出库取消审批列表显示有无发票、发票核验结果。查询条件增加有无发票 end
var gridParams = {};

//승인불승인저장
save = function(approveYn) {

    var saveData;
    var saveFlag = true;

    var arrSave = [];

    var grid = $("#grid").data("kendoExtGrid");
    var rows = grid.select();

    if(rows.length  == 0 ){
        dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
        return false;
    }else{
        rows.each(function(index, row) {
            var dataItem = grid.dataItem(row);
            var check = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
            if(check){
                arrSave.push(dataItem);
            }
        });
    }

     if(saveFlag){
        var saveData = {}, msg = "";
        saveData = { "approveYn":approveYn
                    ,"updateList":arrSave};


        if(approveYn == "Y"){
            msg = "<spring:message code='global.btn.approval' var='btnApproval' /><spring:message code='global.info.cnfrmMsg' arguments='${btnApproval}' />";
        }else{
            msg = "<spring:message code='sal.btn.reject' var='btnReject' /><spring:message code='global.info.cnfrmMsg' arguments='${btnReject}' />";
        }

        dms.window.confirm({
            message:msg
            ,title :"<spring:message code='global.lbl.info' />"
            ,callback:function(result){
                if(result){
                    dms.loading.show();
                    $.ajax({
                        url:"<c:url value='/sal/dlv/cancDeliveryApprove/approveCancDelivery.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error){
                            dms.loading.hide();
                            $('#grid').data('kendoExtGrid').dataSource.page(1);
                            if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }else{
                                dms.notification.error(error);
                            }
                        },
                        success:function(jqXHR, textStatus){
                            dms.loading.hide();
                            grid.dataSource._destroyed = [];
                            //grid.dataSource.page(1);
                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                            $('#grid').data('kendoExtGrid').dataSource.page(1);
                        }
                    });
                }else{
                    return false;
                }
            }

        });
    }
}

$(document).ready(function() {

    //승인상태
    $("#sApproveYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(reqStatCdDs)
       ,optionLabel:""
       ,change:function(e){
           var dataItem = this.dataItem(e.item);
           if(dataItem.cmmCd == "R"){
               $("#btnApprove").data("kendoButton").enable(true);
               $("#btnApproveCnl").data("kendoButton").enable(true);
               $("#sApproveStartDt").data("kendoExtMaskedDatePicker").value("");
               $("#sApproveEndDt").data("kendoExtMaskedDatePicker").value("");
               $("#sApproveStartDt").data("kendoExtMaskedDatePicker").enable(false);
               $("#sApproveEndDt").data("kendoExtMaskedDatePicker").enable(false);
               $('#grid').data('kendoExtGrid').dataSource.page(1);
           }else{
               $("#btnApprove").data("kendoButton").enable(false);
               $("#btnApproveCnl").data("kendoButton").enable(false);
               $("#sApproveStartDt").data("kendoExtMaskedDatePicker").enable(true);
               $("#sApproveEndDt").data("kendoExtMaskedDatePicker").enable(true);
               $('#grid').data('kendoExtGrid').dataSource.page(1);
           }
       }

    });
    
  //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 start
	  $("#sReceipYn").kendoExtDropDownList({
	        dataTextField:"receipYnNm"
	       ,dataValueField:"receipYnCd"
	       ,dataSource:receipYnCdList
	       ,optionLabel:" "
	    });
  
  //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 end
  
  // Q21012900002 出库取消审批增加下载功能 下载Excle JiaMing 2021-2-5  start
	    $("#btnExcelExport").kendoButton({
	        click:function(e){
	            dms.ajax.excelExport({
	            	 "beanName"        : "cancDeliveryService"
	                ,"templateFile"    : "CancDeliveryList_Tpl.xlsx"
	                ,"fileName"        : "<spring:message code='sal.lbl.saleCnclAppr' />.xlsx"
	                //申请日期
	                ,"sReqStartDt"     : $("#sReqStartDt").val()
	                ,"sReqEndDt"       : $("#sReqEndDt").val()
	                //审批日期	
				   ,"sApproveStartDt" : $("#sApproveStartDt").val()
                   ,"sApproveEndDt"   : $("#sApproveEndDt").val()
                   //车辆识别码	
                   ,"sVinNo" 		   : $("#sVinNo").val()
	               ,"sReceipYn"       : $("#sReceipYn").data("kendoExtDropDownList").value()//是否存在机动车统一发票
	               ,"sApproveYn"      :$("#sApproveYn").data("kendoExtDropDownList").value()
	            });
	        }
	    });
// Q21012900002 出库取消审批增加下载功能 下载Excle JiaMing 2021-2-5  end
    //조회조건 - 신청일자(기간)- START
    $("#sReqStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 신청일자(기간)- END
    $("#sReqEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sReqStartDt").on('change', {from:$("#sReqStartDt"), to:$("#sReqEndDt")}, fnChkSearchDate);
    $("#sReqEndDt").on('change',   {from:$("#sReqStartDt"), to:$("#sReqEndDt")}, fnChkSearchDate);

    //조회조건 - 승인일자(기간)- START
    $("#sApproveStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 승인일자(기간)- END
    $("#sApproveEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sApproveStartDt").on('change', {from:$("#sApproveStartDt"), to:$("#sApproveEndDt")}, fnChkSearchDate);
    $("#sApproveEndDt").on('change',   {from:$("#sApproveStartDt"), to:$("#sApproveEndDt")}, fnChkSearchDate);



    /*************************** 검색 조건 영역 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 승인
    $("#btnApprove").kendoButton({
        click:function(e){
            save("Y");
        }
    });

    //버튼 - 불승인
    $("#btnApproveCnl").kendoButton({
        enable:true,
        click:function(e) {
            save("N");
        }
    });


    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113331"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/cancDelivery/selectCancDelivery.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        if($("#sApproveYn").data("kendoExtDropDownList").value() != ""){
                            gridParams["sApproveYn"] = $("#sApproveYn").data("kendoExtDropDownList").value();
                        }

                        gridParams["recordCountPerPage"] = options.pageSize;
                        gridParams["pageIndex"] = options.page;
                        gridParams["firstIndex"] = options.skip;
                        gridParams["lastIndex"] = options.skip + options.take;
                        gridParams["sort"] = options.sort;

                        //gridParams["sCancReasonCd"] = $("#sCancReasonCd").data("kendoExtDropDownList").value();                // 취소사유
                        gridParams["sReqStartDt"]   = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();           // 신청 - 시작일
                        gridParams["sReqEndDt"]     = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();             // 신청 - 종료일
                        gridParams["sApproveStartDt"]= $("#sApproveStartDt").data("kendoExtMaskedDatePicker").value();      // 승인 - 시작일
                        gridParams["sApproveEndDt"] = $("#sApproveEndDt").data("kendoExtMaskedDatePicker").value();         // 승인 - 종료일

                        gridParams["sVinNo"] = $("#sVinNo").val();
                      //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 start
                      	gridParams["sReceipYn"] = $("#sReceipYn").data("kendoExtDropDownList").value();
                      //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 end
                        return kendo.stringify(gridParams);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"contractNo"
                    ,fields:{
                        contractNo :{type:"string"}
                        ,reqDt     :{type:"date"}
                        ,approveDt :{type:"date"}
                        ,dlrCd     :{type:"string"}
                        ,realDlDt  :{type:"date"}
                        ,ordTp     :{type:"string"}
                        //,custNm    :{type:"string"}
                        ,carlineNm :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,modelCd   :{type:"string"}
                        ,ocnNm     :{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,approveYn :{type:"string"}
                        ,vinNo    :{type:"string"}
                        ,reqStatCd :{type:"string"}
                        ,retlTpCd :{type:"string"}
                        ,cancReasonCd:{type:"string"}
                      //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 start
                        ,cert2nd:{type:"string"}
                        ,cert2ndNm:{type:"string"}
                        ,carTaxReceiptNo:{type:"string"}
                        ,carTaxReceiptIssDt:{type:"date" }
                        ,carTaxTaxpayerIdCd:{type:"string"}
                      //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 end
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        //,autoBind:false
        ,pageable:true
        ,scrollable:true
        ,columns:[
                    {field:"retlTpCd", hidden:true }  // 소매유형코드
                    ,{field:"reqDt",title:"<spring:message code = 'global.lbl.fincReqDt'/>" ,width:80  ,attributes:{"class":"ac"}  //신청일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"reqStatCd",title:"<spring:message code = 'global.lbl.reqStat'/>" ,width:80  ,attributes:{"class":"ac"}  //요청상태
                        ,template:"# if(reqStatCdMap[reqStatCd] != null){# #= reqStatCdMap[reqStatCd].cmmCdNm# #}#"
                     }
                    ,{field:"approveDt"    ,title:"<spring:message code = 'global.lbl.approveDt'/>" ,width:80  ,attributes:{"class":"ac"}  //승인일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"dlrCd"       ,title:"<spring:message code = 'global.lbl.dlrCd'/>"      ,width:80  ,attributes:{"class":"ac"}} //딜러코드
                    ,{field:"realDlDt"    ,title:"<spring:message code = 'global.lbl.giDocRegDt'/>" ,width:80  ,attributes:{"class":"ac"}  //출고일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"ordTp", title:"<spring:message code='global.lbl.orderType' />", width:100,  attributes:{"class":"ac"}, template:"#=dms.string.strNvl(ordTpObj[ordTp])#"}    // 주문유형
                    //,{field:"custNm"       ,title:"<spring:message code = 'global.lbl.custNm'/>"      ,width:100  ,attributes:{"class":"ac"}} //고객명
                    ,{field:"contractNo"       ,title:"<spring:message code = 'global.lbl.contractNo'/>"      ,width:100  ,attributes:{"class":"ac"}} //계약번호
                    
                   //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-4 start
                    ,{field:"carTaxReceiptNo"       ,title:"<spring:message code = 'sal.lbl.receipYn'/>"      ,width:100  ,attributes:{"class":"ac"}
		                          , template:function(dataItem){
		                        	  if(!dms.string.isEmpty(dataItem.carTaxReceiptNo)){
	                                       //return "<a href='#' class='btnCarTaxImage' data-uid='"+dataItem.uid+"' ><spring:message code='sal.lbl.yes'/></a>";
	                                       return "<spring:message code='sal.lbl.yes'/>";
	                                   }
	                                   return "<spring:message code='sal.lbl.none'/>";
		                          }
                    } //是否有发票
                    ,{field:"cert2ndNm"       ,title:"<spring:message code = 'sal.lbl.invoiceVerRes'/>"      ,width:100  ,attributes:{"class":"ac"}} 
                  //Q21012900003 出库取消审批查询条件增加“是否有发票”选项有、无。查询列中增加有无发票、发票核验结果两列，取值 同异常出库申请。 jiaMing 2021-2-5 end
                    ,{field:"carlineNm"     ,title:"<spring:message code = 'global.lbl.carLine'/>"      ,width:100  ,attributes:{"class":"al"}} //차종
                    /*
                    ,{field:"cancReasonCd"    ,title:"<spring:message code = 'global.lbl.cancReasonCd'/>" ,width:100  ,attributes:{"class":"al"}  //취소사유
                        ,template:"# if(cancReasonCdMap[cancReasonCd] != null){# #= cancReasonCdMap[cancReasonCd].cmmCdNm# #}#"
                     }
                    */
                    ,{field:"vinNo"       ,title:"VIN_NO"      ,width:130  ,attributes:{"class":"ac"}} //VIN_NO
                    ,{field:"modelNm"       ,title:"<spring:message code = 'global.lbl.model'/>"        ,width:150  ,attributes:{"class":"al"}} //모델
                    ,{field:"ocnNm"         ,title:"<spring:message code = 'global.lbl.ocn' />"         ,width:120  ,attributes:{"class":"al"}} //OCN
                    ,{field:"extColorNm"    ,title:"<spring:message code = 'global.lbl.extColor'/>"     ,width:100  ,attributes:{"class":"al"}} //외장색
                    ,{field:"intColorNm"    ,title:"<spring:message code = 'global.lbl.intColor'/>"     ,width:100  ,attributes:{"class":"al"}} //내장색

                ]
    });

    $("#sApproveStartDt").data("kendoExtMaskedDatePicker").enable(false);
    $("#sApproveEndDt").data("kendoExtMaskedDatePicker").enable(false);
});

    //조회조건:시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
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
</script>
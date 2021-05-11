<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.menu.Charging' /></h1> <!-- 계약체결관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13312" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnRefresh" type="button" class="btn_m btn_save"><spring:message code='global.btn.applyReq' /></button>       
            </dms:access>
            <dms:access viewId="VIEW-D-13313" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13310" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" type="button" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
            </dms:access>
            <%-- <dms:access viewId="VIEW-D-13311" hasPermission="${dms:getPermissionMask('READ')}">
            </dms:access>
            <dms:access viewId="VIEW-D-10760" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnDelete" type="button" class="btn_m"><spring:message code='sal.btn.contsancel' /></button>                  <!-- 삭제 -->
            </dms:access> --%>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.perName' /></th>      <!-- 车主姓名 -->
                    <td>
                     <input id="sCarlineCd" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.menu.ownerContactTel' /></th>      <!-- 车主电话 -->
                    <td>
                        <input id="sModelCd" class="form_input" />
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='sal.info.documentsState' /></th>        <!-- 单据状态 -->
                    <td>
                        <input id="sOrdTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th>       <!-- 车辆状态 -->
                    <td>
                        <input id="sHpNo" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                	<th scope="row"><spring:message code="global.lbl.reqDt" /></th> <!-- 申请日期 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="insertDateSta" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="insertDateEnd" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                	<th scope="row"><spring:message code="sal.lbl.recpDt" /></th> <!-- 开票日期 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="invoiceDateSta" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="invoiceDateEnd" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                
                    <th scope="row"><spring:message code="global.lbl.giDocRegDt" /></th> <!-- 出库日期 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sSrchStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sSrchEndDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                    <th scope="row"><spring:message code='sal.lbl.carVinNum' /></th> <!-- VIN -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" />
                    </td>
                   <%-- <th scope="row"><spring:message code='sal.lbl.ApplicationNumber' /></th>       <!--申请单编号 -->
                    <td>
                        <input id="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carVinNum' /></th> <!-- VIN -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" />
                    </td>
                    
                    <th scope="row"><spring:message code="sal.lbl.distOffice" /></th> <!-- 办事处 -->
                    <td>
                        <input id="sSaleEmpNo1" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.sdpt' /></th> <!-- 事业部 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td> --%>
                </tr>
            </tbody>
        </table>
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

    <!-- 견적번호 -->
    <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedContractNo" value="" />

    <!-- 판매기회번호 -->
    <input id="saleOpptNo" name="saleOpptNo" />

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

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";
var sysDate = "${sysDate}";
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

// 임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];
var contractTpList = [];    // 집단판매 제외, 직접
<c:forEach var="obj" items="${contractTpDS}">

    <c:if test="${obj.cmmCd ne 'G' and obj.cmmCd ne 'D' }">
        contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 是否安装充电桩下拉选SAL156
var isNeed = [];
<c:forEach var="obj" items="${isNeed}">
	isNeed.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var isNeedShwoArr = dms.data.arrayToMap(isNeed, function(obj){return obj.cmmCd});
// 订单状态
var state = [];
<c:forEach var="obj" items="${state}">
	state.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var stateShwoArr = dms.data.arrayToMap(state, function(obj){return obj.cmmCd});

var carState = [];
<c:forEach var="obj" items="${carState}">
carState.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carStateShwoArr = dms.data.arrayToMap(carState, function(obj){return obj.cmmCd});

var status_arr = [];
<c:forEach var="obj" items="${status}">
status_arr.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var statusShwoArr = dms.data.arrayToMap(status_arr, function(obj){return obj.cmmCd});


// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

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
var beforepopupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {
	 //日期校验
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
	$("#insertDateSta").on('change', {from:$("#insertDateSta"), to:$("#insertDateEnd")}, fnChkSearchDate);
	$("#insertDateEnd").on('change', {from:$("#insertDateSta"), to:$("#insertDateEnd")}, fnChkSearchDate);
    $("#invoiceDateSta").on('change',   {from:$("#invoiceDateSta"), to:$("#invoiceDateEnd")}, fnChkSearchDate);
    $("#invoiceDateEnd").on('change',   {from:$("#invoiceDateSta"), to:$("#invoiceDateEnd")}, fnChkSearchDate);
	 
  	
    //EXCEL 下载
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"chargingPileService" 
                ,"templateFile":"ChargingPile.xlsx"
                ,"fileName":"ChargingPile.xlsx"
                ,"custName":$("#sCarlineCd").val()
                ,"custPhone":$("#sModelCd").val()
                ,"vinNo":$("#sVinNo").val()
                ,"state":$("#sOrdTp").data("kendoExtDropDownList").value()
                ,"carState":$("#sHpNo").data("kendoExtDropDownList").value()
                ,"invoiceDateSta":$("#invoiceDateSta").val().replace(/-/gi, "")
                ,"invoiceDateEnd":$("#invoiceDateEnd").val().replace(/-/gi, "")
                ,"insertDateSta":$("#insertDateSta").val().replace(/-/gi, "")
                ,"insertDateEnd": $("#insertDateEnd").val().replace(/-/gi, "")
                ,"sSrchStartDt":$("#sSrchStartDt").val().replace(/-/gi, "")
                ,"sSrchEndDt": $("#sSrchEndDt").val().replace(/-/gi, "")
            });
        }
    });
	
    //开票
    $("#invoiceDateEnd").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //开票日期
    $("#invoiceDateSta").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    
    //出库日期
    $("#sSrchStartDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //出库日期
    $("#sSrchEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    
  //申请
    $("#insertDateSta").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //申请
    $("#insertDateEnd").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    
    $("#invoiceDateSta").data("kendoExtMaskedDatePicker").value(oneDay);
    $("#invoiceDateEnd").data("kendoExtMaskedDatePicker").value(sysDate);
    $("#sSrchStartDt").data("kendoExtMaskedDatePicker").value(oneDay);
    $("#sSrchEndDt").data("kendoExtMaskedDatePicker").value(sysDate);
    
    // 체결대기
    $("#cntTp01").click(function(){
        $("#cntTp").val("1");
        var grid = $("#contGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
    });
    // 기체결
    $("#cntTp02").click(function(){
        $("#cntTp").val("2");
        var grid = $("#contGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
    });
    $("#cntTp").val("1");
    $("#cntTp01").prop("checked", true);

    // 车辆状态
    $("#sHpNo").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:carState
       ,optionLabel:" "
    });

    // 审核状态
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:state
       ,optionLabel:" "
       ,index:0
    });

    $("#btnRefresh").kendoButton({ // 申请
        click:function(e){
        	 var grid = $("#contGrid").data("kendoExtGrid");
             var rows = grid.select();
             if(rows.length < 1){
             	dms.notification.warning("<spring:message code='sal.info.pleaseSelect' />"); 
             }else{
             var selectedItem = grid.dataItem(grid.select());
             viewDetailPopup(selectedItem);            	 
             }
        }
    });

    $("#btnDelete").kendoButton({ // 삭제
        click:function(e){

            if($("#contGrid").data("kendoExtGrid").select().length < 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                return;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.info.conDeleteMsg' />" /* 确定要作废吗 */
                ,title :"<spring:message code='sal.btn.contsancel' />"
                ,callback:function(result){
                    if(result){

                        var grid = $("#contGrid").data("kendoExtGrid");
                        var rows = grid.select();

                        var cancelList = []        // 계약취소
                          , deleteList = []        // 계약삭제
                          , isError = false;

                        rows.each(function(index, row) {
                            var item = grid.dataItem(row);
                            var stat = Number(item.contractStatCd);

                            if(stat >= 90 ){
                                isError = true;
                            }

                            if(Number(item.contractStatCd) < 20 ){
                                deleteList.push(item);
                            }else{
                                cancelList.push(item);
                            }
                        });

                        if(isError){
                            // 삭제 또는 취소된 계약건은 처리할 수 없습니다.
                            dms.notification.error("<spring:message code='sal.err.contMultiDel'/>");
                            return false;
                        }

                        var param = { "deleteList": deleteList, "cancelList": cancelList}

                        $.ajax({
                            url :"<c:url value='/sal/cnt/contractMnt/deleteContractMnt.do' />"
                            ,data :JSON.stringify(param)
                            ,type :'POST'
                            ,dataType :'json'
                            ,contentType :'application/json'
                            ,async :false
                            ,error :function(jqXHR,status,error) {
                                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }else{
                                    dms.notification.error(error);
                                }
                            }
                            ,success :function(jqXHR, textStatus) {
                                grid.dataSource._destroyed = [];
                                grid.dataSource.page(1);

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

    $("#btnSearch").kendoButton({ //查询按钮
         enable:true,
         click:function(e){
				$('#contGrid').data('kendoExtGrid').dataSource.page(1);	
            
         }
    });


   /** 판매기회 정보 셋팅 **/
   var saleOpptNo = '${saleOpptNo}';       // 판매기회 데이터
   if(saleOpptNo != ""){
       reSearch(saleOpptNo);
       $("#cntTp").val("1");
       $("#cntTp01").prop("checked", true);
       //$("#savedContractNo").val(saleOpptNo);
   }
   /** 판매기회 정보 셋팅 END **/

   if('${orderNo}' != ""){
       $("#cntTp").val("2");
       $("#cntTp02").prop("checked", true);
       reSearch('${orderNo}');
   }else if('${estimateNo}' != ""){
       reSearch('${estimateNo}');
       $("#cntTp").val("1");
       $("#cntTp01").prop("checked", true);
   }

   // 列表加载
    $("#contGrid").kendoExtGrid({
        gridId :"G-SAL-0425-244116"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/dlv/contDeliveryCanc/selectChargingPileList.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        params["installationNo"] = $("#sCustNm").val();
                        params["custName"] = $("#sCarlineCd").val();
                        params["custPhone"] = $("#sModelCd").val();
                        params["vinNo"] = $("#sVinNo").val();
                        params["carState"] = $("#sHpNo").data("kendoExtDropDownList").value();
                        params["state"] = $("#sOrdTp").data("kendoExtDropDownList").value();
                        params["invoiceDateSta"] = $("#invoiceDateSta").val().replace(/-/gi, "");
                        params["invoiceDateEnd"] = $("#invoiceDateEnd").val().replace(/-/gi, "");
                        params["insertDateSta"] = $("#insertDateSta").val().replace(/-/gi, "");
                        params["insertDateEnd"] = $("#insertDateEnd").val().replace(/-/gi, "");
                        params["sSrchStartDt"] = $("#sSrchStartDt").val().replace(/-/gi, "");
                        params["sSrchEndDt"] = $("#sSrchEndDt").val().replace(/-/gi, "");

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
                    	installationNo         :{type :"string", editable:false} //딜러코드
                        ,rnum    :{type :"string"}                 //계약번호
                        ,installationNo    :{type :"string"}                 //계약번호
                        ,isNeed  :{type :"string"}                //그룹계약번호
                        ,installProvince      :{type :"string"}                   //차관명
                        ,installCity      :{type :"string"}                   //차관명
                        ,installArea      :{type :"string"}                   //차관명
                        ,address      :{type :"string"}                   //차관명
                        ,custName      :{type :"string"}                   //차관명
                        ,custPhone    :{type :"string"}                   //모델명
                        ,vinNo      :{type :"string"}                   //OCN코드
                        ,carModel      :{type :"string"}                   //OCN명
                        ,state :{type :"string"}                  //판매사원명
                        ,carModel :{type :"string"}                  
                        ,carState :{type :"string"}                  
                        ,insertDate :{type :"date"}                  //판매사원명
                        ,invoiceDate :{type :"date"}                  //판매사원명
                        ,execDate :{type :"date"}                  //판매사원명
                        ,custSaleDtStr :{type :"string"}                  //판매사원명
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
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
                        //viewDetailPopup();
                    }
                });
                
            }
                var rowsS = this.items();
                $(rowsS).each(function () {
                   var index = $(this).index() + 1;
                   var rowLabel = $(this).find(".row-number");
                   $(rowLabel).html(index);
              });
            $("#savedContractNo").val("");      // 초기화
        }
       ,multiSelectWithCheckbox :true     //멀티선택 적용. default :false
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "80", "100", "200"]
       }
       ,height :434
       ,editable    :false
       ,resizable :true
       ,autoBind :true
       ,selectable :"row"  
       ,navigatable :true
       ,sortable:{mode:"single"}
       ,columns :[
    	   {field: "rnum", title: "<spring:message code='sal.lbl.numberSeq' />",width:40,attributes:{"class":"ac"}}
          ,{field:"installationNo"   ,title:"<spring:message code = 'sal.lbl.ApplicationNumber'/>",width:180 ,attributes:{"class":"ac"}}   //조작일자
          ,{field:"isNeed",title:"<spring:message code = 'sal.lbl.ChargingPile'/>",
        	template:"# if(isNeedShwoArr[isNeed] != null) { # #= isNeedShwoArr[isNeed].cmmCdNm# # }#"
        	,width:100,attributes:{"class":"ac"},filterable:{
                cell:{
                    showOperators:false
                    ,template: function (e) {
                           e.element.kendoExtDropDownList({
                               dataSource:dms.data.cmmCdFilter(isNeed)
                               ,dataTextField:"cmmCdNm"
                               ,dataValueField:"cmmCd"
                               ,valuePrimitive:true
                               ,optionLabel:" "
                           });
                       }
                }
            }}
           ,{field:"custName" ,title:"<spring:message code = 'sal.lbl.perName'/>",width:80,attributes:{"class":"ac"}} //외장색
           ,{field:"custPhone",title:"<spring:message code='sal.menu.ownerContactTel' />",width:120, attributes:{"class":"ac"}}  //내장색code
           ,{field:"vinNo" ,title:"<spring:message code='sal.info.vin' />" ,width:190 ,attributes:{"class":"ac"}}//수량표시
           ,{field:"carModel" ,title:"<spring:message code='global.lbl.ocnNm' />" ,width:130 ,attributes:{"class":"ac"}}//수량표시
           ,{field:"installProvince" ,title:"<spring:message code = 'par.lbl.sung'/>",width:80,attributes:{"class":"ac"}} //외장색
           ,{field:"installCity" ,title:"<spring:message code = 'par.lbl.city'/>",width:80,attributes:{"class":"ac"}} //외장색
           ,{field:"installArea" ,title:"<spring:message code = 'sal.lbl.distNm'/>",width:90,attributes:{"class":"ac"}} //외장색
           ,{field:"address" ,title:"<spring:message code = 'crm.lbl.addrDetlCont'/>",width:190,attributes:{"class":"ac"}} //외장색
           ,{field:"invoiceDate", title:"<spring:message code='sal.lbl.recpDt' />",attributes:{"class":"ac"}, width:110,format:"{0:"+vDtyyyyMMdd+"}"}
           ,{field:"custSaleDtStr", title:"<spring:message code='global.lbl.giDocRegDt' />",attributes:{"class":"ac"}, width:110,format:"{0:"+vDtyyyyMMdd+"}"}
           ,{field:"insertDate", title:"<spring:message code='global.lbl.reqDt'/>",attributes:{"class":"ac"}, width:110,format:"{0:"+vDtyyyyMMdd+"}"}
           
          ,{field:"state",title:"<spring:message code = 'sal.info.documentsState'/>",
        	template:"# if(stateShwoArr[state] != null) { # #= stateShwoArr[state].cmmCdNm# # }#"
          ,width:90,attributes:{"class":"ac"},filterable:{
              cell:{
                  showOperators:false
                  ,template: function (e) {
                         e.element.kendoExtDropDownList({
                             dataSource:dms.data.cmmCdFilter(state)
                             ,dataTextField:"cmmCdNm"
                             ,dataValueField:"cmmCd"
                             ,valuePrimitive:true
                             ,optionLabel:" "
                         });
                     }
              }
          }} //조작유형
          ,{field:"carState",title:"<spring:message code = 'global.lbl.vinSts'/>",
          	template:"# if(carStateShwoArr[carState] != null) { # #= carStateShwoArr[carState].cmmCdNm# # }#"
            ,width:90  ,attributes:{"class":"ac"},filterable:{
                cell:{
                    showOperators:false
                    ,template: function (e) {
                           e.element.kendoExtDropDownList({
                               dataSource:dms.data.cmmCdFilter(carState)
                               ,dataTextField:"cmmCdNm"
                               ,dataValueField:"cmmCd"
                               ,valuePrimitive:true
                               ,optionLabel:" "
                           });
                       }
                }
            }} //조작유형
            ,{field:"status",title:"<spring:message code = 'sal.info.ExecutionStatus'/>",
            	template:"# if(statusShwoArr[status] != null) { # #= statusShwoArr[status].cmmCdNm# # }#"
              ,width:120,attributes:{"class":"ac"},filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(status_arr)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }}
          ,{field:"execDate", title:"<spring:message code='sal.info.ExecutionDate' />",attributes:{"class":"ac"}, width:120,format:"{0:"+vDtyyyyMMdd+"}"}
          ,{field:"company" ,title:"<spring:message code='sal.lbl.serviceProvider' />" ,width:130 ,attributes:{"class":"ac"}}//수량표시
          
       ]
   });

    // 그리드 더블클릭.
   $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#contGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       viewDetailPopup(selectedItem);
   });
    
   var grid = $("#contGrid").data("kendoExtGrid");
   var selectedItem = grid.dataItem(grid.select());
   grid.table.on("click", "tr", selectRow);
   function selectRow() {
	   var row = $(this).closest("tr");
	   dataItem = grid.dataItem(row);
	   console.log(dataItem.state);
	   if(dataItem.state!=01){
		   $('#btnRefresh').kendoButton({
				enable: false
			});
	   }else{
		   $("#btnRefresh").data("kendoButton").enable(true);
		   
	   }
               
   }
    
});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/
// 검색조건
function reSearch(contNo){
    /* if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    } */
    $("#savedContractNo").val(contNo);  // 계약번호
    $("#sContractNo").val("");  // 계약번호
    $("#vContractCustNm").val("");
    $("#sContractCustNo").val("");
    $("#cntTp").val("2");
    $("#cntTp02").prop("checked", true);

    $("#sContractNo").val("");
    $("#sVinNo").val("");
}

// 상세내용 팝업 호출
function viewDetailPopup(data){
    var windowHeight = $(window).innerHeight();
    var vHeight = 0;
    if(windowHeight >= 870){
        vHeight = 790;
    }else if(windowHeight >= 800){
        vHeight = 650;
    }else if(windowHeight >= 580){
        vHeight = 550;
    }else{
        vHeight = 500;
    }

    var sDlrCd = dlrCd
      , sContractNo  = "";

    if(typeof(data) != "undefined"){
    	installationNo = data.installationNo;
        sContractNo  = data.contractNo;
    }
	var installationNo = data.installationNo;
    mainPopupWindow = dms.window.popup({
        windowId:"contractMntPopup"
        ,title:"<spring:message code='sal.menu.Charging' />"      //详情-修改窗口
        //,width :950
        ,width :1200
        ,height:vHeight
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/dlv/contDeliveryCanc/updateChargingPileMain.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"installationNo":installationNo                   // 딜러코드
                ,"callbackFunc":function(data){
                    if (data.msg == "save"){
                        $("#contGrid").data("kendoExtGrid").dataSource.page(1);
                    }
                 }
            }
        }
    });
}


//고객명 event
$("#vContractCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter event
$("#vContractCustNm").keyup(function(e){
    if (e.keyCode != 13) {
        cleanCustCheck();
    }
});

//상하좌우
$(".onKey_down").keydown(function(e){
    e = (e?e:window.event);
    if(e.keyCode == "37" || e.keyCode == "38" || e.keyCode == "39" || e.keyCode == "40"){
        return false;
    }
});

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
        $("#vContractCustNm").val(responseJson.data[0].custNm);      // 고객명
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

 //예약판매 조회
function bf_beforeNoSearchPopup(obj)  {

    beforepopupWindow = dms.window.popup({
        windowId :"beforeNoSearchPopupWin"    // 예약판매 팝업
        ,title :"<spring:message code='sal.lbl.beforeCont'/>"   // 예약판매
        ,content :{
            url :"<c:url value='/sal/cnt/contractMnt/selectContractBeforeSearchPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"sDlrCd":obj["dlrCd"]
                //,"sSaleEmpNo":obj["saleEmpNo"]
                ,"sCustNm":obj["custNm"]
                ,"sCustNo":obj["custNo"]
                //,"sBeforeNo":obj["beforeNo"]
                ,"callbackFunc":function(data){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_beforeNoSearchPopupCallBack(data);
                    }
                    beforepopupWindow.close();
                }
            }
        }
    });
}

//고객조회
function bf_pSearchCustomer(obj, callbackFunc1) {

    popupWindow = dms.window.popup({
        windowId :"customerSearchPopup"
        , title :"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        , content :{
            url :"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data :{
                "autoBind" :dms.string.isEmpty(obj["sIdNm"])?false:true
                , "closeYn":"Y"
                , "custNm" :obj["sIdNm"]
                , "mngScId":obj["sMngScId"]
                , "addrTp" :obj["sAddrTp"]
                , "type"   :null
                , "callbackFunc" :function(data){
                    if(typeof(callbackFunc1) != "undefined"){
                        callbackFunc1(data);
                    }else{
                        if(data.length >= 1) {
                            var windowElement = $("#contractMntPopup");
                            var iframeDomElement = windowElement.children("iframe")[0];
                            var iframeWindowObject = iframeDomElement.contentWindow;
                            iframeWindowObject.bf_customerSet(data);
                        }
                    }
                    //popupWindow.close();
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
                , "sFscCd"   :obj["sFscCd"]
                , "sFscNm"   :obj["sFscNm"]
                , "sOcnCd" :obj["sOcnCd"]
                , "sOcnNm" :obj["sOcnNm"]
                , "sExtColorCd" :obj["sExtColorCd"]
                , "sExtColorNm" :obj["sExtColorNm"]
                , "sIntColorCd" :obj["sIntColorCd"]
                , "sIntColorNm" :obj["sIntColorNm"]
                , "sVinNo" :obj["sVinNo"]
                , "sContractNo":obj["sContractNo"]
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
        , "selectable":"row"
        , "addrDetlUsingYn":"N"
        , width:770
        , height:410
        , modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data :{
                "autoBind" :dms.string.isNotEmpty(obj["sValue"])?true:false
                //, "sZipCd":obj["sZipCd"]
                , "sValue":obj["sValue"]
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

     dms.window.popup({
        windowId:"accessoryItemSearchPopup"
        ,width:700
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            //url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSearchPopup.do'/>"       // 신규 용품
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":obj["dlrCd"]
                , "sCarlineCd" :obj["carlineCd"]
                , "sGoodsCd"   :obj["goodsCd"]
                , "sPkgItemCd" :obj["pkgItemCd"]

                //, "onlyItemTab":"Y"
                ,"callbackFunc":function(data, type){
                    var windowElement = $("#contractMntPopup");
                    var iframeDomElement = windowElement.children("iframe")[0];
                    var iframeWindowObject = iframeDomElement.contentWindow;
                    iframeWindowObject.bf_goodsSearchPopupCallBack(data, type);

                    //popupWindow.close();
                    $("#accessoryItemSearchPopup").data("kendoWindow").close();
                }
            }
        }
    });
}

// 보험 item 추가
function bf_pSearchIncItem(){
    popupWindow = dms.window.popup({
        windowId:"incItemPopup"
        , title:"<spring:message code='sal.title.incJoinInfoMng' />"   // 보험정보등록
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/sal/inc/incJoinInfo/selectIncItemPopup.do' />"
            , data:{
                "autoBind":true
                , "type"  :null
                , "callbackFunc":function(data, num){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_incItemPopupCallBack(data, num);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

// 대행업무 item 추가
function bf_pSearchAapItem(){
    popupWindow = dms.window.popup({
        windowId:"aapItemPopup"
        , title:"<spring:message code='sal.lbl.subServices' />"   // 대행업무
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/sal/aap/aapInfo/selectAapInfoItemPopup.do' />"
            , data:{
                "autoBind":true
                , "type"  :null
                , "callbackFunc":function(data, num){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_aapItemPopupCallBack(data, num);
                    }
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
            url :"<c:url value='/sal/dlv/contDeliveryCanc/updateChargingPileMain.do'/>"
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
</script>
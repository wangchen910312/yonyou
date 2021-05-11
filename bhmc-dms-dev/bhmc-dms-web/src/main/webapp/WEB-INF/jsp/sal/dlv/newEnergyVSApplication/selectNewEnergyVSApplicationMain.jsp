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
        <h1 class="title_basic"><spring:message code='sal.menu.newEnergyApplication' /></h1> <!-- 계약체결관리 -->
        <div class="btn_right">
            <%-- <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button> --%>           <!-- 상세 -->
            <dms:access viewId="VIEW-D-13309" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13308" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnRefresh" type="button" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13307" hasPermission="${dms:getPermissionMask('READ')}">
               <%--  <button id="btnDelete" type="button" class="btn_m"><spring:message code='sal.btn.contsancel' /></button> --%>                  <!-- 삭제 -->
                <button class="btn_m btn_excel" type="button" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
            </dms:access>
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
                <col style="width:15%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.menu.nameOfCarBuyer' /></th>      <!-- 购车人姓名 -->
                    <td>
                        <input id="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.menu.carBuyerTel' /></th>      <!-- 购车人姓名 -->
                    <td>
                        <input id="sHpNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.vinNo' /></th>      <!-- R19072900213 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车架号 贾明  贾明  2019-7-29 start-->
                    <td>
                        <input id="sVinNo" type="text" maxlength="17" class="form_input" style="text-transform:uppercase;"/>
                    </td>  <!-- R19072900213 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车架号 贾明  贾明  2019-7-29 end-->
                </tr>
                <tr>
                    <th scope="row"><spring:message code="crm.lbl.requestDate" /></th>    <!-- 申请日期 -->
                    <!-- <td>
                        <input id="applStartDt" class="form_datepicker" />
                    </td> -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="applStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="applEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.recpDt" /></th>  <!-- 开票日期 -->
                    <!-- <td>
                       <input id="applEndDt" class="form_datepicker" />
                    </td> -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="invoStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="invoEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.menu.carPurHumType" /></th>    <!-- 购车人类型 -->
                    <td>
                        <input id="custTp" class="form_comboBox" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.StrStat" /></th>    <!-- 购车人类型 -->
                    <td>
                        <input id="sStatusNo" class="form_comboBox" />
                    </td>
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

var sysDate = "${sysDate}";
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";


//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";


//客户类型
var custTpList = [];
<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

//状态
var statusNolist = [];
<c:forEach var="obj" items="${statusNolist}">
statusNolist.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var statusNoShwoArr = dms.data.arrayToMap(statusNolist, function(obj){return obj.cmmCd});

//车辆用途
var finalwehicleUseListShwoArr;
var wehicleUseList = [];
var wehicleUseAllList = [];
<c:forEach var="obj" items="${wehicleUseList}">
wehicleUseList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
wehicleUseAllList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var wehicleUseListShwoArr = dms.data.arrayToMap(wehicleUseList, function(obj){return obj.cmmCd});

var wehicleUseFinalList = [];
<c:forEach var="obj" items="${wehicleUseFinalList}">
wehicleUseFinalList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
wehicleUseAllList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var wehicleUseFinalListShwoArr = dms.data.arrayToMap(wehicleUseFinalList, function(obj){return obj.cmmCd});

//购车领域
var carBuyAreaList = [];
<c:forEach var="obj" items="${carBuyAreaList}">
carBuyAreaList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var carBuyAreaListShwoArr = dms.data.arrayToMap(custTpList, function(obj){return obj.cmmCd});

//车型代号
var modelCdList = [];
<c:forEach var="obj" items="${modelCdStrList}">
modelCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var modelCdListShwoArr = dms.data.arrayToMap(modelCdList, function(obj){return obj.cmmCd});

var popupWindow;
var beforepopupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {
	
	//日期校验
	$("#applStartDt").on('change', {from:$("#applStartDt"), to:$("#applEndDt")}, fnChkSearchDate);
	$("#applEndDt").on('change', {from:$("#applStartDt"), to:$("#applEndDt")}, fnChkSearchDate);
    $("#invoStartDt").on('change',   {from:$("#invoStartDt"), to:$("#invoEndDt")}, fnChkSearchDate);
    $("#invoEndDt").on('change',   {from:$("#invoStartDt"), to:$("#invoEndDt")}, fnChkSearchDate);
	//EXCEL 下载
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"NewEnergyVSApplicationService" 
                ,"templateFile":"NewEnergyVSApplication.xlsx"
                ,"fileName":"NewEnergyVSApplication.xlsx"
                ,"sCustNm":$("#sCustNm").val()
                ,"sHpNo":$("#sHpNo").val()
                ,"applStartDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#applStartDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"applEndDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#applEndDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"invoStartDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#invoStartDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"invoEndDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#invoEndDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />")) 
                ,"custTp":$("#custTp").val()
                ,"sStatusNo":$("#sStatusNo").val()
                ,"sVinNo":$("#sVinNo").val()// 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车 贾明 2019-7-29
            });
        }
    });

	//购车人类型
	$("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:custTpList
        , index:0
    });
	//状态
	$("#sStatusNo").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:statusNolist
        , index:0
    });
	//状态下拉选默认选新建
	//$("#sStatusNo").data("kendoExtDropDownList").value("01");
	var datesss = new Date();
    datesss.setDate(1);
    var day = datesss.getDate();
    //申请日期
    $("#applStartDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#applEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#applStartDt").data("kendoExtMaskedDatePicker").value(oneDay);
    $("#applEndDt").data("kendoExtMaskedDatePicker").value(sysDate);
    //开票日期
    $("#invoStartDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#invoEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
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

   


    $("#btnRefresh").kendoButton({ // 신규
        click:function(e){
            viewDetailPopup();
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
                message:"<spring:message code='sal.info.conDeleteMsg' />"
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

    $("#btnSearch").kendoButton({ // 조회
         enable:true,
         click:function(e){

             $('#contGrid').data('kendoExtGrid').dataSource.page(1);
             //fn_btnState();  // 버튼상태
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

   // 메인 그리드
    $("#contGrid").kendoExtGrid({
        gridId :"G-SAL-0424-113378"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplication.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //sDlrCd  custNm  hpNm  applDt  invoDt  carPurHumType  statusNo
                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        // 판매사원
                        //params["custNm"] = $("#sCustNm").data("kendoExtDropDownList").value();
                        //购车人姓名
                        params["custNm"] = $("#sCustNm").val();
                        // 고객명
                        params["hpNo"] = $("#sHpNo").val();
                        //vinNo R19072900213 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车架号 贾明  贾明  2019-7-29 start
                        params["vinNo"] = $("#sVinNo").val();
                        //vinNo R19072900213 张伟丽反馈：dms新能源补贴申请画面，查询条件增加车架号 贾明  贾明  2019-7-29 end
                        //고객
                        params["applStartDt"] = $("#applStartDt").data("kendoExtMaskedDatePicker").value();
                        params["applEndDt"] = $("#applEndDt").data("kendoExtMaskedDatePicker").value();
                        params["invoStartDt"] = $("#invoStartDt").data("kendoExtMaskedDatePicker").value();
                        params["invoEndDt"] = $("#invoEndDt").data("kendoExtMaskedDatePicker").value();
                        // 유형
                        //alert($("#custTp").data("kendoExtDropDownList").value());
                        params["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                        params["statusNo"] = $("#sStatusNo").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    } 
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"newEnergyNo",
                    fields :{
                         //dlrCd  :{type :"string"} //딜러코드
                        custTp :{type :"string"}
                        ,rnums :{type :"int"}
                        ,applicationNo    :{type :"string"}  
                        ,applDt :{type :"date"}              
                        ,auditDt :{type :"date"}  
                        //,custNm         :{type :"string"}
                        ,modelCdStr  :{type :"string"}       
                        ,vinNo   :{type :"string"}           
                        ,carBuyArea  :{type : "String"}      
                        ,wehicleUse     :{type :"string"}    
                        ,carRegNo  :{type :"string"}         
                        ,carRegCity  :{type :"string"}       
                        ,custNm      :{type :"string"}       
                        ,hpNo      :{type :"string"}         
                        ,officeNm    :{type :"string"}       
                        ,pername      :{type :"string"}      
                        ,perphon      :{type :"string"}      
                        ,invoDt :{type :"date"}  
                        ,statusNo :{type :"string"}  
                        ,reason :{type :"string"} 
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,dataBound :function(e) {
            var rows = this.items();
            $(rows).each(function () {
               var index = $(this).index() + 1;
               var rowLabel = $(this).find(".row-number");
               $(rowLabel).html(index);
          });
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
       ,multiSelectWithCheckbox:false
       //,selectable :"row"  
       ,navigatable :true
       ,sortable:{mode:"single"}
       ,columns :[
          //{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          {field:"custTp", title:"fscCd", hidden:true, attributes:{"class":"al"},
        	  template: function (e) {
        		  if(e.custTp=='01'){
        			  finalwehicleUseListShwoArr = wehicleUseFinalListShwoArr;
        		  }else{
        			  finalwehicleUseListShwoArr = wehicleUseListShwoArr;
        		  } 
        	  },  
          }
          ,{field: "rnums", title: "<spring:message code='sal.lbl.numberSeq' />",attributes:{"class":"ac"},width:50} 
          ,{field:"applicationNo", title:"<spring:message code='sal.menu.subsidyApplicationNumber' />", attributes:{"class":"al"}, width:160}               //계약번호
          ,{field:"applDt", title:"<spring:message code='crm.lbl.requestDate' />", width:120,format:"{0:"+vDtyyyyMMdd+"}"}              //계약고객번호
          ,{field:"auditDt", title:"<spring:message code='sal.menu.auditDate' />", width:120,format:"{0:"+vDtyyyyMMdd+"}"}
          ,{field:"modelCd", title:"<spring:message code='sal.menu.vehicleCode' />", attributes:{"class":"al"}, width:100
        	  ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(modelCdList)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
              ,template:"# if(modelCdListShwoArr[modelCd] != null) { # #= modelCdListShwoArr[modelCd].cmmCdNm# # }#", attributes:{"class":"al"} 
        	  }      
          ,{field:"vinNo", title:"<spring:message code='sal.menu.frameNumber' />", attributes:{"class":"ac"}, width:150}      //계약유형
          ,{field:"carBuyArea", title:"<spring:message code='sal.menu.carPurHumType' />", attributes:{"class":"ac"}, width:90
        	  ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(custTpList)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
        	  ,template:"# if(carBuyAreaListShwoArr[carBuyArea] != null) { # #= carBuyAreaListShwoArr[carBuyArea].cmmCdNm# # }#"
          }   //계약상태
          ,{field:"wehicleUse", title:"<spring:message code='global.lbl.vehicleUse' />", attributes:{"class":"ac"}, width:90
        	  ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(wehicleUseAllList)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
        	  ,template:"# if(finalwehicleUseListShwoArr[wehicleUse] != null) { # #= finalwehicleUseListShwoArr[wehicleUse].cmmCdNm# # }#"
          }                   //계약일
          ,{field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />", attributes:{"class":"al"}, width:100}  
          ,{field:"carRegCity", title:"<spring:message code='sal.menu.cardCity' />", attributes:{"class":"al"}, width:100}    
          //,{field:"custNm", title:"fscCd", hidden:true, attributes:{"class":"al"}}           
          ,{field:"custNm", title:"<spring:message code='sal.menu.nameOfOwner' />", attributes:{"class":"al"}, width:90}   
          ,{field:"hpNo", title:"<spring:message code='sal.menu.ownerContactTel' />", attributes:{"class":"al"}, width:110} 
          ,{field:"whEightFieldz", title:"<spring:message code='sal.menu.wheEightFields' />", attributes:{"class":"al"}, width:90}//CSR 111新能源申请流程增加八大领域功能选择项  是否八大领域  贾明 2020-6-19 
          ,{field:"eightFieldz", title:"<spring:message code='sal.lbl.eightFields' />", attributes:{"class":"al"}, width:90}//CSR 111新能源申请流程增加八大领域功能选择项  八大领域 贾明 2020-6-19   
          ,{field:"officeNm", title:"<spring:message code='sal.menu.unitFullName' />", attributes:{"class":"al"}, width:150}     
          ,{field:"pername", title:"<spring:message code='sal.menu.corporateContact' />", attributes:{"class":"al"}, width:90}    
          ,{field:"perphon", title:"<spring:message code='sal.menu.unitContactTele' />", attributes:{"class":"al"}, width:100} 
          ,{field:"invoDt", title:"<spring:message code='sal.lbl.recpDt' />", attributes:{"class":"al"}, width:120,format:"{0:"+vDtyyyyMMdd+"}"}    
          ,{field:"statusNo", title:"<spring:message code='sal.lbl.StrStat' />"
        	  ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:dms.data.cmmCdFilter(statusNolist)
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
        	  ,template:"# if(statusNoShwoArr[statusNo] != null) { # #= statusNoShwoArr[statusNo].cmmCdNm# # }#", attributes:{"class":"al"}, width:80} 
          ,{field:"reason", title:"<spring:message code='sal.menu.reason' />", attributes:{"class":"al"}, width:360} //R19073101727 width 90 改为 360张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注，提交处理 贾明 2019-8-1
          
          ]
   });

    // 그리드 더블클릭.
   $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#contGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       viewDetailPopup(selectedItem);
   });

});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/
// 검색조건


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
    var vinNoBak;
    //R19073101727 贾明 张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1 start
    var statusNoVal = "";
    var reasonVal = "";
    //R19073101727 贾明 张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1 end
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
      , sApplicationNo  = "";

    if(typeof(data) != "undefined"){
        sDlrCd = data.dlrCd;
        sApplicationNo  = data.applicationNo;
        vinNoBak = data.vinNo;
        reasonVal = data.reason;
        statusNoVal = data.statusNo;
    }

    mainPopupWindow = dms.window.popup({
        windowId:"contractMntPopup"
        ,title:"<spring:message code='sal.menu.newEnergyApplication' />"      // 계약관리
        //,width :950
        ,width :1100
        ,height:vHeight
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplicationPopup.do'/>"
            ,data:{
            	//"sDlrCd":sDlrCd                  
                "sApplicationNo":sApplicationNo,
                "vinNoBak" :vinNoBak,
                "sReason" : reasonVal, //R19073101727 贾明 张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1
                "sStatusNo" : statusNoVal, // //R19073101727 贾明 张伟丽反馈：dms 新能源车辆补贴申请画面的审批备注内容显示不全，拖拽显示很不方便 列表里面形式留着，在页面允许的情况下，稍微放宽列表长度，然后双击里面也可以看到审批备注 2019-8-1
                "callbackFunc":function(data){
                    if (data.msg == "save"){
                        /* reSearch(data.cntNo);

                        if( typeof(data.cntTp) != "undefined"){
                            if(data.cntTp == "01"){
                                $("#cntTp").val("1");
                                $("#cntTp01").prop("checked", true);
                            }
                        } */
                        $("#contGrid").data("kendoExtGrid").dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
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
            url :"<c:url value='/sal/cnt/contractRe/selectContractReUsedCarSearchPopup.do'/>"
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
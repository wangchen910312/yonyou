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
        <h1 class="title_basic"><spring:message code='sal.menu.ReviewApplication' /></h1> <!-- 계약체결관리 -->
        <div class="btn_right">
            <%-- <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button> --%>           <!-- 상세 -->
            <dms:access viewId="VIEW-I-13248" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-I-13244" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnRefresh" type="button" class="btn_m"><spring:message code='sal.btn.allEval' /></button>         <!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-I-13245" hasPermission="${dms:getPermissionMask('READ')}">
               <%--  <button id="btnDelete" type="button" class="btn_m"><spring:message code='sal.btn.contsancel' /></button> --%>                  <!-- 삭제 -->
                <button class="btn_m btn_excel" type="button" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:5%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START -->
                    <th scope="row"><spring:message code='sal.lbl.sdpt' /></th><!-- 事业部 -->
                     <td>
                            <input id="sDiviCd" type="text" class="form_comboBox">
                     </td>
                     <!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 END -->
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
                    
                    <th scope="row"><spring:message code='sal.menu.nameOfCarBuyer' /></th>      <!-- 购车人姓名 -->
                    <td>
                        <input id="sCustNm" class="form_input" />
                    </td>
                    
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>      <!-- 经销商代码 -->
                    <td>
                        <input id="dlrCd" class="form_input" />
                    </td>
                </tr>
                <tr>
                   <!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START -->
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!--  办事处 -->
                     <td>
                            <input id="sOffCd" type="text" class="form_comboBox">
                     </td>
                    <!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START -->
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
                    <th scope="row"><spring:message code='sal.menu.carBuyerTel' /></th>      <!-- 购车人电话 -->
                    <td>
                        <input id="sHpNo"  class="form_input" oninput="value=value.replace(/[^\d]/g,'')"/>
                    </td>
                    
                    <th scope="row"><spring:message code='global.lbl.dlrNm' /></th>      <!-- 经销商名称 -->
                    <td>
                        <input id="dlrNm"  class="form_input" />
                    </td>
                </tr>
                <!-- R19081500618张伟丽老师反馈希望DCS新能源车辆补贴申请界面新增查询条件车架号  贾明  2019-8-16 start-->
                <tr>
                   <th scope="row"><spring:message code='sal.lbl.vinNo' /></th>      
                    <td>
                        <input id="sVinNo" type="text" maxlength="17" class="form_input" style="text-transform:uppercase;"/>
                    </td>  
                    <!--  chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  start -->
                     <th scope="row"><spring:message code='sal.lbl.applyRecode' /></th>
                    <td>
                        <label for="sRadioN" class="label_check">
                            <input type="radio" id="sRadioN" name="sRadio" value="LAST" checked class="form_check" onClick="javascript:changedRadio(false);"/>
                            <spring:message code='sal.info.last' />
                        </label> 
                        <label for="sRadioY" class="label_check">
                            <input type="radio" id="sRadioY" name="sRadio" value="ALL" class="form_check" onClick="javascript:changedRadio(true);"/>
                           <spring:message code='sal.info.all' />
                        </label> 
                        <input id="appliRecode" name = "appliRecode" type="hidden" value="LAST"/>
                    </td>
                     <!--  chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  end type="hidden" -->
                     <th scope="row"><spring:message code="sal.menu.carPurHumType" /></th>    <!-- 购车人类型 -->
                    <td>
                        <input id="custTp" class="form_comboBox" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.StrStat" /></th>    <!-- 状态 -->
                    <td>
                        <input id="sStatusNo" class="form_comboBox" />
                    </td>
                    
                </tr>
                <!-- R19081500618张伟丽老师反馈希望DCS新能源车辆补贴申请界面新增查询条件车架号  贾明  2019-8-16 start-->
                
                <!--  CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19  start -->
                <tr>
                    <th scope="row"></th>      
                    <td></td>
                    <th scope="row"><spring:message code="sal.menu.wheEightFields" /></th>    <!--是否为八大领域 -->
                    <td>
                        <input id="sWhEightFields" class="form_comboBox"/>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.eightFields" /></th>    <!-- 八大领域 -->
                    <td>
                        <input id="sEightFields" class="form_comboBox" />
                    </td>
                </tr>
                <!--  CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19  end -->
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
<!--批量审批窗口-->
<section id="evalPopupWindow" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right" >
                    <button class="btn_s" id="btnAllEvalSave"><spring:message code="global.btn.fix" /></button> <!-- 확정 -->
                </div>
            </div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col >
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRslt" /></th> <!-- 심사결과 -->
                            <td>
                                <ul class="tabmenu">
                                    <li id="popupEvalRsltY" class="on"><button type="button"><spring:message code="sal.lbl.approvals" /></button></li> <!-- 일괄심사승인 탭-->
                                    <li id="popupEvalRsltN" ><button type="button"><spring:message code="sal.btn.reject" /></button></li>        <!-- 일괄심사불승인 탭 -->
                                    <input type="hidden" id="popupEvalRsltYn" name="popupEvalRsltYn" value="Y"/>
                                    <input type="hidden" id="ids"/>
                                </ul>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRemark" /></th> <!-- 심사평가 -->
                            <td colspan="3">
                                <textarea id="popupRemark" maxlength="50" name="popupRemark" rows="7" cols="" class="form_textarea" required data-name="<spring:message code="global.lbl.cont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
<!-- #스크립트 영역# -->
<script type="text/javascript">
//chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  start
function changedRadio(flg){
   if(flg){
       $("#sRadioY").prop("checked", true);
       $("#appliRecode").val("ALL");
       //$("#grid").data("kendoExtGrid").dataSource.page(1);
   }else{
       $("#sRadioN").prop("checked", true);
       $("#appliRecode").val("LAST");
       //$("#grid").data("kendoExtGrid").dataSource.page(1);
   }
}
//chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  end

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

// 批量审批通过
$("#popupEvalRsltY").click(function(){

    $(this).siblings("li").removeClass("on");
    $(this).addClass("on");
    $("#popupEvalRsltYn").val("Y");
});
// 批量审批不通过
$("#popupEvalRsltN").click(function(){

    $(this).siblings("li").removeClass("on");
    $(this).addClass("on");
    $("#popupEvalRsltYn").val("N");
});

//购车人类型
var custTpList = [];
<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

var carBuyAreaListShwoArr = dms.data.arrayToMap(custTpList, function(obj){return obj.cmmCd});

//车型代号
var modelCdList = [];
<c:forEach var="obj" items="${modelCdList}">
modelCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

var modelCdListShwoArr = dms.data.arrayToMap(modelCdList, function(obj){return obj.cmmCd});

//状态
var statusNolist = [];
<c:forEach var="obj" items="${statusNolist}">
	if("${obj.cmmCd}"== 01){
		
	}else{
		
		statusNolist.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
	}
</c:forEach>
var statusNoShwoArr = dms.data.arrayToMap(statusNolist, function(obj){return obj.cmmCd});

//CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 start
//八大领域
var eigFieMaList = [];
<c:forEach var="obj" items="${eigFieMaList}">
    eigFieMaList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//是否为八大领域
var wethIsList = [];
<c:forEach var="obj" items="${wethIsList}">
    wethIsList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 end

//车辆用途
var wehicle = [];
var finalwehicleUseListShwoArr;
var wehicleUseList = [];
<c:forEach var="obj" items="${wehicleUseList}">
wehicleUseList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
wehicle.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var wehicleUseListShwoArr = dms.data.arrayToMap(wehicleUseList, function(obj){return obj.cmmCd});

var wehicleUseFinalList = [];
<c:forEach var="obj" items="${wehicleUseFinalList}">
wehicleUseFinalList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
wehicle.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var wehicleUseFinalListShwoArr = dms.data.arrayToMap(wehicleUseFinalList, function(obj){return obj.cmmCd});

/* //购车领域
var carBuyAreaList = [];
<c:forEach var="obj" items="${carBuyAreaList}">
carBuyAreaList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach> */
<!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START -->
//事业部 
var sdptList = [];
<c:forEach var="obj" items="${sdptList}">
    sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach>
<!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 END -->

var popupWindow;
var beforepopupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {
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
	
	//日期校验
	$("#applStartDt").on('change', {from:$("#applStartDt"), to:$("#applEndDt")}, fnChkSearchDate);
	$("#applEndDt").on('change', {from:$("#applStartDt"), to:$("#applEndDt")}, fnChkSearchDate);
    $("#invoStartDt").on('change',   {from:$("#invoStartDt"), to:$("#invoEndDt")}, fnChkSearchDate);
    $("#invoEndDt").on('change',   {from:$("#invoStartDt"), to:$("#invoEndDt")}, fnChkSearchDate);
    
    $("#evalPopupWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.btn.allEval' />"                             //일괄심사
        ,width:"650px"
        ,height:"200px"
        ,open:function(e){
            evalPopOpenYn  = "Y";
        }
        ,close:function(e){
            evalPopOpenYn  = "N";
        }
    }).data("kendoWindow");
    
     <!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START -->
     //事业部
     $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.sdptCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           $.ajax({
               url : "<c:url value='/sal/cmm/selectDealerOffice.do'/>",
               data : JSON.stringify({"sSdptCd":dataItem.sdptCd}),
               type : "POST",
               dataType : "json",
               contentType : "application/json",
               async : false,
               error : function(jqXHR,status,error) {

               },
               success : function(data) {
                   var responseJson = JSON.parse(JSON.stringify(data));
                   $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
                   $("#sOffCd").data("kendoExtDropDownList").enable(true);
               }
           });
        }
    });

    // 办事处
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       //,dataSource:officeList
       ,select:function(e){
           var dataItem = this.dataItem(e.item);

       }
       ,optionLabel:" "   // 전체
       ,enable:false
    });
     <!-- R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 END -->
    
	//EXCEL 下载
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"NewEnergyVSApplicationService" 
                ,"templateFile":"NewEnergyVSApplication.xlsx"
                ,"fileName":"NewEnergyVSApplication.xlsx"
                ,"sCustNm":$("#sCustNm").val()
                ,"sHpNo":$("#sHpNo").val()
                ,"sSistOfficeCd":$("#sSistOfficeCd").val()
                ,"applStart":$("#applStartDt").val().replace(/-/gi, "")
                ,"applEnd":$("#applEndDt").val().replace(/-/gi, "")
                ,"invoStart":$("#invoStartDt").val().replace(/-/gi, "")
                ,"invoEnd": $("#invoEndDt").val().replace(/-/gi, "")
                ,"custTp":$("#custTp").val()
                ,"sStatusNo":$("#sStatusNo").val()
                //chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  start
                 ,"appliRecode":$("#appliRecode").val()
		 //chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  end
                ,"vinNo":$("#sVinNo").val()   //R19081500618张伟丽老师反馈希望DCS新能源车辆补贴申请界面新增查询条件车架号
                //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START
                 ,"sDiviCd"      :$("#sDiviCd").val()
                 ,"sOffCd"       :$("#sOffCd").val()
                 //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 END
                 //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 start
                 ,"sEightFields"   :$("#sEightFields").val()      //八大领域
                 ,"sWhEightFields" :$("#sWhEightFields").val()  //是否为八大领域
                 //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 end
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
	$("#sStatusNo").data("kendoExtDropDownList").value("02");
	
	//CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 start
	  //八大领域
	  $("#sEightFields").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:eigFieMaList
        , index:0
    });
    //是否为八大领域
    $("#sWhEightFields").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:wethIsList
        , index:0
    });
	//CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 end
	
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
        	$("#popupEvalRsltN").removeClass("on");
        	$("#popupEvalRsltY").addClass("on");
        	
        	$("#popupEvalRsltYn").val("Y");
        	$("#popupRemark").val("");
            //viewDetailPopup();
            //获取选中数据拿到主键id循环改变状态
            var grid = $("#contGrid").data("kendoExtGrid");
            var rows = "";
            var team = "";
            var num = 0;
            var aaa = $("input[name='check_a']");
            $("input[name='check_a']").each(function (index , obj) {
            	 var dataItem = grid.dataSource._data;
                if ($(this).is(":checked")) {
                	num++;
                	team =team + "," + dataItem[index].applicationNo;
                }
            });
             if(1 >= num){
            	dms.notification.warning("<spring:message code='sal.info.pleaseSelect' />");
            	//dms.notification.warning("<spring:message code='sal.info.evlAllMsg' />");
            }else{
	            	var win = $("#evalPopupWindow").data("kendoWindow");
	            	win.center();
	          	  	win.open();	
	            	$("#ids").val(team);
            }
        }
    });

     $("#btnAllEvalSave").kendoButton({
         click:function(e) {
        	//异步请求后台批量修改状态
             console.log("主键拼接:"+$("#ids").val());
             console.log("备注信息:"+$("#popupRemark").val());
             console.log("审批结果:"+$("#popupEvalRsltYn").val());
             var param = {"applicationNo":$("#ids").val(),"statusNo":$("#popupEvalRsltYn").val(),"reason":$("#popupRemark").val()};
             //提示框确认审核操作
             dms.window.confirm({
                 message:"<spring:message code='global.btn.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save}' />"
                 ,title :"<spring:message code='global.btn.save' />"
                 ,callback:function(result){
                     if(result){
                    	 $.ajax({
                             url :"<c:url value='/sal/dlv/newEnergyVSApplication/passNewEnergyVSApplication.do' />"
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
                            	 var grid = $("#contGrid").data("kendoExtGrid");
                                 grid.dataSource._destroyed = [];
                                 grid.dataSource.page(1);
                                 var win = $("#evalPopupWindow").data("kendoWindow");
             	          	  	 win.close();	
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
        gridId :"G-SAL-0425-241316"
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
                        params["dlrNm"] =  $("#dlrNm").val();
                        params["dlrCd"] =  $("#dlrCd").val();
                        // 판매사원
                        //params["custNm"] = $("#sCustNm").data("kendoExtDropDownList").value();
                        //购车人姓名
                        params["custNm"] = $("#sCustNm").val();
                        // 고객명
                        params["hpNo"] = $("#sHpNo").val();
                        //고객
                        params["applStart"] = $("#applStartDt").val().replace(/-/gi, "");
                        params["applEnd"] = $("#applEndDt").val().replace(/-/gi, "");
                        params["invoStart"] = $("#invoStartDt").val().replace(/-/gi, "");
                        params["invoEnd"] = $("#invoEndDt").val().replace(/-/gi, "");
                        // 유형
                        //alert($("#custTp").data("kendoExtDropDownList").value());
                        params["custTp"] = $("#custTp").data("kendoExtDropDownList").value();
                        params["statusNo"] = $("#sStatusNo").data("kendoExtDropDownList").value();
                        //R19081500618 张伟丽老师反馈希望DCS新能源车辆补贴申请界面新增查询条件车架号 贾明 2019-8-16 start
                        params["vinNo"] = $("#sVinNo").val();
                         //R19081500618 张伟丽老师反馈希望DCS新能源车辆补贴申请界面新增查询条件车架号 贾明 2019-8-16 end
                         //chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  start
                         params["appliRecode"] = $("#appliRecode").val();
                         //chenming 2019-10-11 在审核画面增加每辆车的最新补贴状态  end
                         //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START
                         params["sDiviCd"]       = $("#sDiviCd").data("kendoExtDropDownList").value();
                         params["sOffCd"]        = $("#sOffCd").data("kendoExtDropDownList").value();
                         //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 END
                        
                        //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 start
                         params["sWhEightFields"]       =   $("#sWhEightFields").data("kendoExtDropDownList").value();
                         params["sEightFields"]         =   $("#sEightFields").data("kendoExtDropDownList").value();
                        //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 end
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
                    	 rnum			:{type :"int"}                 
                        ,applicationNo	:{type :"string"}                 
                        ,custTp 		:{type :"string"}
                        ,applDt			:{type :"date"}               
                        ,auditDt		:{type :"date"}  
                        ,sybStar 		:{type :"string"}
                        ,dlrCd  		:{type :"string"} 
                        ,dlrNm 			:{type :"string"}  
                        ,modelCd  		:{type :"string"}                
                        ,vinNo   		:{type :"string"}                
                        ,carBuyArea  	:{type : "String"}               
                        ,wehicleUse     :{type :"string"}                
                        ,carRegCity  	:{type :"string"}                  
                        ,custNm      	:{type :"string"}                  
                        ,hpNo      		:{type :"string"}                  
                        ,addrDetlCont   :{type :"string"}                   
                        ,officeNm    	:{type :"string"}                  
                        ,pername    	:{type :"string"}                  
                        ,perphon    	:{type :"string"}                
                        ,officeAds    	:{type :"string"}                
                        ,carRegiDt 		:{type :"date"}                   
                        ,invoMn      	:{type :"number"}                 
                        ,invoDt 		:{type :"date"}                   
                        ,statusNo 		:{type :"string"}
                        ,reviewerNm     :{type :"string"}//R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28
                        ,bscStar        :{type :"string"}// Q19112800006张伟丽反馈dcs新能源补贴审批列表和excel在“事业部”后面增加“办事处”(提交查看)  贾明 2019-12-11
                        ,ordTpNm        :{type :"string"}// R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30
                        
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,dataBound :function(e) {
        	 var rows = e.sender.tbody.children();
             $.each(rows, function(idx, row){
                 var row = $(rows[idx]);
                 var dataItem = e.sender.dataItem(row);
                  if(dataItem.statusNo == "02"){
                     e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                 }else{
                     e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                 }
             });
             var rowsS = this.items();
             $(rowsS).each(function () {
                var index = $(this).index() + 1;
                var rowLabel = $(this).find(".row-number");
                $(rowLabel).html(index);
           }); 
        }
      // ,multiSelectWithCheckbox :true     //멀티선택 적용. default :false
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "80", "100", "200"]
       }
       ,height :434
       ,editable:false
       ,resizable :true
       ,autoBind :true
       //,selectable :"row"  
       ,navigatable :true
       ,sortable:{mode:"single"}
       ,columns :[
    	   {title:"", width:40, _field:"_checkAll"
               ,attributes:{"class":"ac"}, _field:"_checkAll"
               ,template:"<input type='checkbox' name = 'check_a' data-uid='#= uid #' class='grid-checkbox-item' />"
               ,headerTemplate:"<input type='checkbox' class='checkAll' />"
          }
    	  ,{field: "rnum", title: "<spring:message code='sal.lbl.numberSeq' />",width:50}
          ,{field:"applicationNo", title:"<spring:message code='sal.menu.subsidyApplicationNumber' />", attributes:{"class":"al"}, width:180}               //계약번호
          ,{field:"custTp", title:"fscCd", hidden:true, attributes:{"class":"al"},
        	  template: function (e) {
        		  if(e.custTp=='01'){
        			  finalwehicleUseListShwoArr = wehicleUseFinalListShwoArr;
        		  }else{
        			  finalwehicleUseListShwoArr = wehicleUseListShwoArr;
        		  } 
        	  },  
          }
          ,{field:"applDt", title:"<spring:message code='crm.lbl.requestDate' />", attributes:{"class":"al"}, width:120,format:"{0:"+vDtyyyyMMdd+"}"}              //계약고객번호
          ,{field:"auditDt", title:"<spring:message code='sal.menu.auditDate' />", attributes:{"class":"al"}, width:120,format:"{0:"+vDtyyyyMMdd+"}"}
          ,{field:"sybStar", title:"<spring:message code='sal.lbl.sdpt' />", width:100}       
          ,{field:"bscStar", title:"<spring:message code='sal.lbl.distOffice' />", width:100} // Q19112800006张伟丽反馈dcs新能源补贴审批列表和excel在“事业部”后面增加“办事处”(提交查看)  贾明 2019-12-11
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100}       
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100}  
          ,{field:"modelCd", title:"<spring:message code='sal.menu.vehicleCode' />", attributes:{"class":"al"},
        	  width:100,filterable:{
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
              }, template:"# if(modelCdListShwoArr[modelCd] != null) { # #= modelCdListShwoArr[modelCd].cmmCdNm# # }#"
        	}
          ,{field:"vinNo", title:"<spring:message code='sal.menu.frameNumber' />", attributes:{"class":"ac"}, width:160}      //계약유형
          ,{field:"ordTpNm", title:"<spring:message code='sal.lbl.ordCd' />", attributes:{"class":"ac"}, width:90}      // R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30
          ,{field:"carBuyArea", title:"<spring:message code='sal.menu.carPurHumType' />", attributes:{"class":"ac"}, width:90,filterable:{
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
          },template:"# if(carBuyAreaListShwoArr[carBuyArea] != null) { # #= carBuyAreaListShwoArr[carBuyArea].cmmCdNm# # }#"
          }   
          ,{field:"wehicleUse", title:"<spring:message code='global.lbl.vehicleUse' />", attributes:{"class":"ac"}, width:90,filterable:{
              cell:{
                  showOperators:false
                  ,template: function (e) {
                         e.element.kendoExtDropDownList({
                             dataSource:dms.data.cmmCdFilter(wehicle)
                             ,dataTextField:"cmmCdNm"
                             ,dataValueField:"cmmCd"
                             ,valuePrimitive:true
                             ,optionLabel:" "
                         });
                     }
              }
          },template:"# if(finalwehicleUseListShwoArr[wehicleUse] != null) { # #= finalwehicleUseListShwoArr[wehicleUse].cmmCdNm# # }#"
          }                 
          ,{field:"carRegCity", title:"<spring:message code='sal.menu.cardCity' />", attributes:{"class":"al"}, width:100}     //차종명
          ,{field:"custNm", title:"fscCd", hidden:true, attributes:{"class":"al"}}            // 차관코드
          ,{field:"custNm", title:"<spring:message code='sal.menu.nameOfOwner' />", attributes:{"class":"al"}, width:90}   //차관명
          ,{field:"hpNo", title:"<spring:message code='sal.menu.ownerContactTel' />", attributes:{"class":"al"}, width:110}    //OCN코드
		  ,{field:"addrDetlCont", title:"<spring:message code='sal.menu.detailAddressOfCarBuyer' />", attributes:{"class":"al"}, width:150}     //OCN명
          ,{field:"officeNm", title:"<spring:message code='sal.menu.unitFullName' />", attributes:{"class":"al"}, width:150}     //OCN명
          ,{field:"pername", title:"<spring:message code='sal.menu.corporateContact' />", attributes:{"class":"al"}, width:80}     //외장색코드
          ,{field:"perphon", title:"<spring:message code='sal.menu.unitContactTele' />", attributes:{"class":"al"}, width:140}    //외장색명
		  ,{field:"officeAds", title:"<spring:message code='sal.menu.detaAddrCarUnit' />", attributes:{"class":"al"}, width:140}    //외장색명
          ,{field:"whEightFieldz", title:"<spring:message code='sal.menu.wheEightFields' />", attributes:{"class":"al"}, width:90}//CSR 111新能源申请流程增加八大领域功能选择项  是否八大领域  贾明 2020-6-19 
          ,{field:"eightFieldz", title:"<spring:message code='sal.lbl.eightFields' />", attributes:{"class":"al"}, width:90}//CSR 111新能源申请流程增加八大领域功能选择项  八大领域 贾明 2020-6-19   
          ,{field:"carRegiDt", title:"<spring:message code='sal.menu.dateIniVehicle' />", width:120,format:"{0:"+vDtyyyyMMdd+"}"}
          ,{field:"invoMn", title:"<spring:message code='sal.lbl.rcptAmt' />", attributes:{"class":"al"}, width:100,format:"{0:n2}"}    //외장색명value=value.replace(/[\u4e00-\u9fa5]/ig,'')
          ,{field:"invoDt", title:"<spring:message code='sal.lbl.recpDt' />", attributes:{"class":"al"}, width:120,format:"{0:"+vDtyyyyMMdd+"}"} 
          ,{field:"statusNo", title:"<spring:message code='sal.lbl.StrStat' />",filterable:{
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
          },template:"# if(statusNoShwoArr[statusNo] != null) { # #= statusNoShwoArr[statusNo].cmmCdNm# # }#", attributes:{"class":"al"}, width:75} //내장색상코드
          ,{field:"reviewerNm", title:"<spring:message code='global.lbl.apprUsrNm' />", attributes:{"class":"al"}, width:90}   //R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28
          ,{field:"reviewerId", title:"reviewerId", hidden:true, attributes:{"class":"al"}, width:90}            // R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28
          ]
   });

    $(".checkAll").on("click" , function(e){
        var grid = $("#contGrid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");
        var uid = $(this).attr("data-uid");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                if( dataItem[index].statusNo == "02"){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
            });
        }
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
        vHeight = 770;
    }else if(windowHeight >= 800){
        vHeight = 625;
    }else if(windowHeight >= 580){
        vHeight = 500;
    }else{
        vHeight = 450;
    }

    var status = "";
    var sDlrCd = dlrCd
      , sApplicationNo  = "";

    if(typeof(data) != "undefined"){
        sDlrCd = data.dlrCd;
        sApplicationNo  = data.applicationNo;
        status = data.statusNo;
    }

    
    mainPopupWindow = dms.window.popup({
        windowId:"contractMntPopup"
        ,title:"<spring:message code='sal.menu.ReviewApplication' />"      // 新能源申请审核窗口
        //,width :950
        ,width :1200
        ,height:vHeight
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplicationPopup.do'/>"
            ,data:{
            	//"sDlrCd":sDlrCd                   // 딜러코드
                "sApplicationNo":sApplicationNo  
                ,"statusNo":status// 딜러명

                ,"callbackFunc":function(data){
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
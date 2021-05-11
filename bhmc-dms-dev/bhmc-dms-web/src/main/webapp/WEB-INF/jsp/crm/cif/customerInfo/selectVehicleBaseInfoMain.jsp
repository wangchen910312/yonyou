<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>


 <div id="resizableContainer">  <!--  查询条件  -->
            <!-- 功能按钮 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.vehicleBaseInfo" /></h1><!-- 车辆基准信息 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-13287" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnVehBraSearch"><spring:message code='global.btn.search' /></button><!-- 查询 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-13286" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_excel" id="btnCtlExcelExport"><spring:message code='global.btn.excelExport' /><!-- 下载Excel--></button>
                    </dms:access>
                   </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnVehBraSearch">
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
                                 <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- 车辆识别码 -->
                                 <td>
                                    <input id="sVinNo" type="text" class="form_input" >
                                 </td>
                                <th scope="row"><spring:message code='global.lbl.carlineNm' /></th><!-- 车种名称 -->
                                <td>
                                   <input id="sCarlineCd" class="form_comboBox">
                                </td>
                               <th scope="row"><spring:message code="global.lbl.carRegNo" /></th> <!-- 车牌号码  -->
                               <td>
                                    <input id="sCarRegNo" name="sCarRegNo" type="text"  class="form_input" data-json-obj="true" />
                               </td>
                               
                               <th scope="row"><spring:message code="sal.lbl.saleDt" /></th><!-- 零售日期 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCustFromSaveDt" name="sCustFromSaveDt"   class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCustToSaveDt" name="sCustToSaveDt"  class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                </td>
                             </tr>
                             <tr>
                                 <th scope="row"><spring:message code="global.lbl.salDlrComp" /></th><!-- 销售特约店 -->
                                   <td>
                                     <input id="sSalesSpeStore" class="form_comboBox">
                                   </td>
                                   
                                   <th scope="row"><spring:message code="par.lbl.brandNm" /></th><!-- 车辆品牌 -->
                                   <td>
                                     <input id="sCarBrandCd" class="form_comboBox">
                                   </td>
                                   
                                   <th scope="row"><spring:message code="ser.lbl.totRunDistVal" /></th><!-- 累计行驶里程 -->
                                   <td>
                                      <input id="sCarRunDistVal" name="sCarRunDistVal" type="text" class="form_input" data-json-obj="true" />
                                   </td>
                                   
                                   <th scope="row"><spring:message code="ser.lbl.wartExpireDt" /></th><!-- 保修结束日期-->
                                 <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sWrrntFromEndDt" name="sWrrntFromEndDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sWrrntToEndDt" name="sWrrntToEndDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                 </td>  
                             </tr>
                             
                             <tr>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 客户编号 -->
                                <td>
                                    <input id="sCustNo" name="sCustNo" type="text" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custTp' /></th><!-- 客户类型 -->
                                <td>
                                    <input id="sCustTp" name="sCustTp" class="form_comboBox" data-json-obj="true">
                                </td>
                                
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th><!-- 潜客/保客 -->
                                <td>
                                    <input type="text" id="sCustCd" name="sCustCd" class="form_comboBox" data-json-obj="true">
                                </td>
                                
                                 <th scope="row">首次维修结算完成时间</th><!--  <spring:message code="sal.lbl.saleDt" />  首次维修的结算完成时间-->
                                 <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sFiirFromCalcDt" name="sFiirFromCalcDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sFiirToCalcDt" name="sFiirToCalcDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                 </td>    
                             </tr> 
                             
                             <tr>
                                 <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 客户名 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" data-json-obj="true">
                                </td>
                                 <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 移动电话 -->
                                <td>
                                    <input type="text" id="sHpNo" name="sHpNo" value="" class="form_input numberic" data-json-obj="true">
                                </td>
                                
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 证件号码  -->
                                <td>
                                    <input id="sSsnCrnNo" name="sSsnCrnNo" type="text" value="" class="form_input"  pattern="[0-9A-Z]" maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row">最近维修结算完成时间</th><!--  <spring:message code="sal.lbl.saleDt" /> 最近维修的结算完成时间-->
                                 <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sLatelyFromCalcDt" name="sLatelyFromCalcDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sLatelyToCalcDt" name="sLatelyToCalcDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                 </td>    
                             </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.blueMbrShip" /></th><!-- 蓝缤会员 -->
                                <td>
                                    <input type="text" id="sBlueMembershipNo" name="sBlueMembershipNo" class="form_comboBox" data-json-obj="true">
                                </td>
                                 <th scope="row"><spring:message code="global.lbl.dlrMbrShip" /></th><!-- 自店会员 -->
                                <td>
                                    <input type="text" id="sDlrMbrYn" name="sDlrMbrYn" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.birthday" /></th><!-- 生日-->
                                 <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sBirthFromDt" name="sBirthFromDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sBirthToDt" name="sBirthToDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                 </td> 
                                 
                                 <th scope="row">本店首保承认时间</th><!-- <spring:message code="global.lbl.birthday" />本店首保承认时间-->
                                 <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sClaimFromConfDt" name="sClaimFromConfDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sClaimToConfDt" name="sClaimToConfDt" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                 </td>     
                                
                            </tr> 
                          
                        </tbody>
                    </table>
                </div>  <!--  查询条件 -->
                 <div class="table_grid mt10">
                    <div id="vehicleBrandGrid" class="resizable_grid"></div>  <!--  数据展示 -->
                </div>              
            </section>
            <!-- //일반 -->
           <div id="excelProgress" class="demo-section k-content mt10">
             <h4>Excel Export</h4>
             <div id="progressBar"></div>
           </div>
        </div>   
        
        <!-- script start  -->
<script type="text/javascript" charset="UTF-8">
//客户类型
  var custTpList = [];
  var custTpMap = [];
 <c:forEach var="obj" items="${custTpList}" >
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
  </c:forEach>
$("#sCustTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:custTpList
       , optionLabel:" "
    });
 
 //潜客户、保客
  var custCdList = [];
  var custCdMap = [];
 <c:forEach var="obj" items="${custCdList}" >
    custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
  </c:forEach>
    
  $("#sCustCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:custCdList
       , optionLabel:" "
    });
    
    //车种
    var carLineCdList = [];
   <c:forEach var="obj" items="${carLineCdInfo}">
     carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
   </c:forEach>

   $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 
       
    });
    
    // 销售特约店
    var searchTpCdList = [];
    <c:forEach var="obj" items="${searchTpCdList}">
        <c:if test="${obj.cmmCd != 'AD'}">
             searchTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
   </c:forEach>
   
    $("#sSalesSpeStore").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:searchTpCdList
        ,optionLabel:" "   // 
    });
    
    // 
    var useYnDsList = [];
    <c:forEach var="obj" items="${useYnDs}">
        useYnDsList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   </c:forEach>
   
   //蓝缤会员（是/否）
   $("#sBlueMembershipNo").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnDsList
        ,optionLabel:" "   // 
   });
   
     //自店会员（是/否）
     $("#sDlrMbrYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnDsList
        ,optionLabel:" "   // 
   });
   //车辆品牌
    var vehBraList = [];
    <c:forEach var="obj" items="${VehBra}">
        vehBraList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   </c:forEach>
   
     $("#sCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:vehBraList
        ,optionLabel:" "   // 
   });
   
   //证件类型
    var mathDocTpMap = [];
    <c:forEach var="obj" items="${mathDocTpList}" >
       mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
     
     //车种名称
     var carlineCdMap = [];
     <c:forEach var="obj" items="${carlineCdList}">
         carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>
    
    //车辆品牌
    changCarBrandCd = function(val){
          var resultVal = "";
       if(dms.string.isNotEmpty(val)){
            if(val=='01'){
                resultVal='BHMC';//代表北京现代
            }else if(val=='02'){
               resultVal='QT';//使用其他
            }
            
       }else if(dms.string.isEmpty(val)){
          resultVal = "";
       }
        return resultVal;
    }
    
    //销售特约店
    changSaleSpeStore = function(val){
         var resultVal = "";
       if(dms.string.isNotEmpty(val)){
            if(val=='OD'){
                resultVal='N';//他店
            }else if(val=='MD'){
               resultVal='Y';//本店
            }
            
       }else if(dms.string.isEmpty(val)){
          resultVal = "";
       }
        return resultVal;
    }
    
    function onChange(e) {
    //console.log("Change event :: value is " + e.value);
   }

 function onComplete(e) {
    //console.log("Complete event :: value is " + e.value);
    //$("#startProgress").text("Restart Progress").removeClass("k-state-disabled");
    hideProgressBar();
  }
   
    showProgressBar = function(){
        $("#excelProgress").slideDown();
    };

    hideProgressBar = function(){
        $("#excelProgress").slideUp();
    };

    
    
     
    

$(document).ready(function() {
     //保修结束日期 from 
    $("#sWrrntFromEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
    //保修结束日期to
    $("#sWrrntToEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
    
       //零售日期 from 
    $("#sCustFromSaveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sCustFromSaveDt}"
        ,change:fnChkDateValue
        
    });
    
     //零售日期 to
    $("#sCustToSaveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sCustToSaveDt}"
        ,change:fnChkDateValue
       
    });
   // console.log("时",$("#sCustToSaveDt").data("kendoExtMaskedDatePicker").value());
    
    //首次维修结算完成时间 from 
    $("#sFiirFromCalcDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
    
    //首次维修结算完成时间 to
    $("#sFiirToCalcDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
     //最近的维修结算完成时间from 
    $("#sLatelyFromCalcDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
    //最近的维修结算完成时间to
    $("#sLatelyToCalcDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
     //本店首保承认时间from 
    $("#sClaimFromConfDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
    //本店首保承认时间to
    $("#sClaimToConfDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
     //生日from 
    $("#sBirthFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
    //生日to
    $("#sBirthToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    
     // Excel Export 상태바
    $("#progressBar").kendoProgressBar({
        min: 0,
        max: 100,
        type: "percent",
        change: onChange,
        complete: onComplete
    });
    
    //导出
    $("#btnCtlExcelExportS").kendoButton({
        click:function(e) {
        
     }
     ,enable:false
     });
     
     hideProgressBar();

      //下载功能
    $("#btnCtlExcelExport").kendoButton({
        click:function(e){
          /**
            if( dms.string.isEmpty($("#sCustFromSaveDt").val()) || dms.string.isEmpty($("#sCustToSaveDt").val()) ){
                dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='saleDt'/><spring:message code='global.info.validation.required' arguments='${saleDt}' />");
                return;
            }
            **/

              var salesSpeStore = $("#sSalesSpeStore").data("kendoExtDropDownList").value();//销售特约店
              var carBrandCdVal = $("#sCarBrandCd").data("kendoExtDropDownList").value();//车辆品牌	
            
            var param = $.extend(
                     {"sCustFromSaveDt"            :$("#sCustFromSaveDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCustToSaveDt"              :$("#sCustToSaveDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sVinNo"                     :$("#sVinNo").val()}
                    ,{"sCarlineCd"                 :$("#sCarlineCd").data("kendoExtDropDownList").value()}
                    ,{"sCarRegNo"                  :$("#sCarRegNo").val()}
                    ,{"sSalesSpeStore"             :changSaleSpeStore(salesSpeStore)}
                    ,{"sCarBrandCd"                :changCarBrandCd(carBrandCdVal)}
                    ,{"sCarRunDistVal"             :$("#sCarRunDistVal").val()}
                    ,{"sWrrntFromEndDt"            :$("#sWrrntFromEndDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sWrrntToEndDt"              :$("#sWrrntToEndDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCustNo"                    :$("#sCustNo").val()}
                    ,{"sCustTp"                    :$("#sCustTp").data("kendoExtDropDownList").value()}
                    ,{"sCustCd"                    :$("#sCustCd").data("kendoExtDropDownList").value()}
                    ,{"sFiirFromCalcDt"            :$("#sFiirFromCalcDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sFiirToCalcDt"              :$("#sFiirToCalcDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sCustNm"                    :$("#sCustNm").val()}
                    ,{"sHpNo"                      :$("#sHpNo").val()}
                    ,{"sSsnCrnNo"                  :$("#sSsnCrnNo").val()}
                    ,{"sLatelyFromCalcDt"          :$("#sLatelyFromCalcDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sLatelyToCalcDt"            :$("#sLatelyToCalcDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sBlueMembershipNo"          :$("#sBlueMembershipNo").data("kendoExtDropDownList").value()}
                    ,{"sDlrMbrYn"                  :$("#sDlrMbrYn").data("kendoExtDropDownList").value()}
                    ,{"sClaimFromConfDt"           :$("#sClaimFromConfDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sClaimToConfDt"             :$("#sClaimToConfDt").data("kendoExtMaskedDatePicker").value()}
                    ,{"sBirthFromDt"               :kendo.toString($("#sBirthFromDt").data("kendoExtMaskedDatePicker").value(),'yyyyMMdd')}
                    ,{"sBirthToDt"                 :kendo.toString($("#sBirthToDt").data("kendoExtMaskedDatePicker").value(),'yyyyMMdd')}
            );

            // 엑셀다운로드 row수 체크
            $.ajax({
                url:"<c:url value='/crm/cif/customerInfo/selectVehicleBaseInfoSearchCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                   //console.log("q",result);
                   var maxRow = 10000;
                   var fileCnt = 0;
                   var downCnt = 0;
                   var totRow = result;
                   
                   fileCnt = Math.ceil(totRow / maxRow);
                   //console.log("maxRow : "+maxRow+", totRow : "+totRow+", fileCnt : "+fileCnt);
                   //,salesSpeStore,carBrandCdVal,sysDtVal
                   callExcelDownload(0, maxRow, maxRow, fileCnt, downCnt);

               }
           });  
        }
       ,enable:false
    
    });
    
    callExcelDownload = function(firstIdx, lastIdx, maxRow, fileCnt, downCnt){
     //,salesSpeStore,carBrandCdVal,sysDtVal
     var birthFromDt    =kendo.toString($("#sBirthFromDt").data("kendoExtMaskedDatePicker").value(),'yyyyMMdd');//$("#sBirthFromDt").val()
     var birthToDt      =kendo.toString($("#sBirthToDt").data("kendoExtMaskedDatePicker").value(),'yyyyMMdd');  //kendo.toString($("#sBirthToDt").val(),'yyyyMMdd')
       var salesSpeStore = $("#sSalesSpeStore").data("kendoExtDropDownList").value();//销售特约店
       var carBrandCdVal = $("#sCarBrandCd").data("kendoExtDropDownList").value();//车辆品牌	
       var sysDateExcelNm = new Date();
       var sysDtVal;
       sysDtVal = sysDateExcelNm.getFullYear()+"-";
       sysDtVal += sysDateExcelNm.getMonth()+1;
       sysDtVal += "-"+sysDateExcelNm.getDate();
       sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();
       //var birthFromDt = $("#sBirthFromDt").data("kendoExtMaskedDatePicker").value();
       //var birthToDt = $("#sBirthToDt").data("kendoExtMaskedDatePicker").value();
       //console.log("q",dms,'e',dms);
       //_"+sysDtVal+"
        dms.ajax.excelProgressExport({
            "beanName"              :"vehicleBaseInfoService"
            ,"templateFile"         :"VehicleBaseinfoList_Tpl.xlsx"
            ,"fileName"             :"<spring:message code='crm.menu.vehicleBaseInfo' />.xlsx"
            ,"sCustFromSaveDt"      :$("#sCustFromSaveDt").val()
            ,"sCustToSaveDt"        :$("#sCustToSaveDt").val()
            ,"sVinNo"               :$("#sVinNo").val()
            ,"sCarlineCd"           :$("#sCarlineCd").data("kendoExtDropDownList").value()
            ,"sCarRegNo"            :$("#sCarRegNo").val()
            ,"sSalesSpeStore"       :changSaleSpeStore(salesSpeStore)
            ,"sCarBrandCd"          :changCarBrandCd(carBrandCdVal)
           ,"sCarRunDistVal"         :$("#sCarRunDistVal").val()
           ,"sWrrntFromEndDt"        :$("#sWrrntFromEndDt").val()
           ,"sWrrntToEndDt"          :$("#sWrrntToEndDt").val()
           ,"sCustNo"                :$("#sCustNo").val()
           ,"sCustTp"                :$("#sCustTp").data("kendoExtDropDownList").value()
           ,"sCustCd"                :$("#sCustCd").data("kendoExtDropDownList").value()
           ,"sFiirFromCalcDt"        :$("#sFiirFromCalcDt").val()
           ,"sFiirToCalcDt"          :$("#sFiirToCalcDt").val()
           ,"sCustNm"                :$("#sCustNm").val()
           ,"sHpNo"                  :$("#sHpNo").val()
           ,"sSsnCrnNo"              :$("#sSsnCrnNo").val()
           ,"sLatelyFromCalcDt"      :$("#sLatelyFromCalcDt").val()
           ,"sLatelyToCalcDt"        :$("#sLatelyToCalcDt").val()
           ,"sBlueMembershipNo"      :$("#sBlueMembershipNo").data("kendoExtDropDownList").value()
           ,"sDlrMbrYn"              :$("#sDlrMbrYn").data("kendoExtDropDownList").value()
           ,"sClaimFromConfDt"       :$("#sClaimFromConfDt").val()
           ,"sClaimToConfDt"         :$("#sClaimToConfDt").val()
           ,"sBirthFromDt"           :  birthFromDt == null ? '' : birthFromDt
           ,"sBirthToDt"             :birthToDt == null ? '' : birthToDt
           ,"firstIndex"           :firstIdx
           ,"lastIndex"            :lastIdx
        }, maxRow, fileCnt, downCnt);
    };
    
    //查询
    $("#btnVehBraSearch").kendoButton({
        click:function(e){
            // console.log("ered点击");
            /**
              if( dms.string.isEmpty($("#sCustFromSaveDt").val()) || dms.string.isEmpty($("#sCustToSaveDt").val()) ){
                dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='saleDt'/><spring:message code='global.info.validation.required' arguments='${saleDt}' />");
                return;
               }
               **/
             $("#btnCtlExcelExport").data("kendoButton").enable(false);
             $("#vehicleBrandGrid").data("kendoExtGrid").dataSource.read();
        }
    });
    
     //列表数据
     $("#vehicleBrandGrid").kendoExtGrid({
         gridId:"G-CRM-0721-115901"
        , dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerInfo/selectVehicleBaseInfoSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"]     = options.pageSize;
                        params["pageIndex"]              = options.page;
                        params["firstIndex"]             = options.skip;
                        params["lastIndex"]              = options.skip + options.take;
                        params["sort"]                   = options.sort;
                        
                        params["sCustFromSaveDt"] = $("#sCustFromSaveDt").data("kendoExtMaskedDatePicker").value();//零售日期
                        params["sCustToSaveDt"] =   $("#sCustToSaveDt").data("kendoExtMaskedDatePicker").value();//零售日期
                        params["sVinNo"] = $("#sVinNo").val();//车辆识别码
                        params["sCarlineCd"] =  $("#sCarlineCd").data("kendoExtDropDownList").value();//车种名称
                        params["sCarRegNo"] = $("#sCarRegNo").val();  // 车牌号码
                        
                        var salesSpeStore = $("#sSalesSpeStore").data("kendoExtDropDownList").value();
                        params["sSalesSpeStore"] =  changSaleSpeStore(salesSpeStore)//销售特约店	
                        
                        var carBrandCdVal = $("#sCarBrandCd").data("kendoExtDropDownList").value();
                        params["sCarBrandCd"] =  changCarBrandCd(carBrandCdVal);//车辆品牌	sCarBrandCd	
                        params["sCarRunDistVal"] = $("#sCarRunDistVal").val(); //累计行驶里程	 sCarRunDistVal
                        params["sWrrntFromEndDt"] = $("#sWrrntFromEndDt").data("kendoExtMaskedDatePicker").value();//保修结束日期  sWrrntFromEndDt  sWrrntToEndDt
                        params["sWrrntToEndDt"] =   $("#sWrrntToEndDt").data("kendoExtMaskedDatePicker").value();//保修结束日期
                        
                        params["sCustNo"] = $("#sCustNo").val();//客户编号 sCustNo
                        params["sCustTp"] =  $("#sCustTp").data("kendoExtDropDownList").value();//客户类型
                        params["sCustCd"] =  $("#sCustCd").data("kendoExtDropDownList").value(); //潜客/保客	sCustCd
                        params["sFiirFromCalcDt"] = $("#sFiirFromCalcDt").data("kendoExtMaskedDatePicker").value();//首次维修结算完成时间
                        params["sFiirToCalcDt"] =   $("#sFiirToCalcDt").data("kendoExtMaskedDatePicker").value();//首次维修结算完成时间
                        
                        params["sCustNm"] = $("#sCustNm").val();//客户名	
                        params["sHpNo"] = $("#sHpNo").val();//移动电话	
                        params["sSsnCrnNo"] = $("#sSsnCrnNo").val();//证件号码	
                        params["sLatelyFromCalcDt"] = $("#sLatelyFromCalcDt").data("kendoExtMaskedDatePicker").value();// 最近维修结算完成时间
                        params["sLatelyToCalcDt"] =   $("#sLatelyToCalcDt").data("kendoExtMaskedDatePicker").value();// 最近维修结算完成时间
                        
                        params["sBlueMembershipNo"] =  $("#sBlueMembershipNo").data("kendoExtDropDownList").value();//蓝缤会员
                        params["sDlrMbrYn"] =  $("#sDlrMbrYn").data("kendoExtDropDownList").value();//自店会员
                        params["sClaimFromConfDt"] = $("#sClaimFromConfDt").data("kendoExtMaskedDatePicker").value();//  本店首保承认时间
                        params["sClaimToConfDt"] =   $("#sClaimToConfDt").data("kendoExtMaskedDatePicker").value();// 本店首保承认时间
                        var birthFromDt = $("#sBirthFromDt").data("kendoExtMaskedDatePicker").value();
                        //console.log("e",kendo.toString(birthFromDt, "yyyyMMdd"));
                        params["sBirthFromDt"] = kendo.toString(birthFromDt, "yyyyMMdd"); //$("#sBirthFromDt").data("kendoExtMaskedDatePicker").value();//生日
                        var birthToDt = $("#sBirthToDt").data("kendoExtMaskedDatePicker").value();
                        params["sBirthToDt"] =  kendo.toString(birthToDt, "yyyyMMdd"); //$("#sBirthToDt").data("kendoExtMaskedDatePicker").value();// 生日
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                , model:{
                    id:"rnum"
                    , fields:{
                        rnum:{type:"number"}
                        , custNo       :{type:"string", editable:false}
                        , custNm       :{type:"string", editable:false}
                        , custTp       :{type:"string", editable:false}
                        , hpNo         :{type:"string", editable:false}
                        , telNo        :{type:"string", editable:false}
                        , sungNm       :{type:"string", editable:false}
                        , cityNm       :{type:"string", editable:false}
                        , distNm       :{type:"string", editable:false}
                        , addrDetlCont :{type:"string", editable:false}
                        , mathDocTp    :{type:"string", editable:false}
                        , ssnCrnNo     :{type:"string", editable:false}
                        , grteStartDt  :{type:"date"}
                        , custSaleDt   :{type:"date"}
                        , wrrntEndDt   :{type:"date"}
                        ,claimConfirmDt   :{type:"date"}
                        ,birthDt          :{type:"string", editable:false}
                        ,firstCalcDt    :{type:"date"}
                        ,latelyCalcDt   :{type:"date"}
                    
                    }
                }
                ,parse:function(d) {
                  
                // console.log("我的值33ee",d);
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                             elem.grteStDtFormat = kendo.parseDate(elem.grteStartDt, "<dms:configValue code='dateFormat' />");
                             elem.custSaleDtFormat = kendo.parseDate(elem.custSaleDt, "<dms:configValue code='dateFormat' />");
                             elem.wrrntEndDtFormat = kendo.parseDate(elem.wrrntEndDt, "<dms:configValue code='dateFormat' />");
                             elem.claimConfirmDtFormat = kendo.parseDate(elem.claimConfirmDt, "<dms:configValue code='dateFormat' />");
                            // elem.birthDtFormat = kendo.parseDate(elem.birthDt, "<dms:configValue code='dateFormat' />");
                             elem.firstCalcDtFormat = kendo.parseDate(elem.firstCalcDt, "<dms:configValue code='dateFormat' />");
                             elem.latelyCalcDtFormat = kendo.parseDate(elem.latelyCalcDt, "<dms:configValue code='dateFormat' />");
                            
                        });
                    }
                    return d;
                }
            }

        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true      //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false         //빈컬럼 적용. default:false
        ,enableTooltip:true              //Tooltip 적용, default:false
        ,multiSelectWithCheckbox:false
        ,navigatable:false
        ,sortable:true
        ,editable:false
        //,selectable:"row"
        ,autoBind:true
        ,dataBound:function (e) {
            var dataItems = e.sender.dataSource.view();
            if ( dataItems.length > 0 ) {
                $("#btnCtlExcelExport").data("kendoButton").enable(true);
            } else {
                $("#btnCtlExcelExport").data("kendoButton").enable(false);
            };
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"} }//序号
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:180}//vin_NO
            //,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:80}//车种名称
            , {field:"carlineCd", title:"<spring:message code='global.lbl.carlineNm' />", width:100, attributes:{"class":"ac"}
                        , sortable:false
                        , template:"#if (carlineCd != null && carlineCdMap[carlineCd] != undefined){# #= carlineCdMap[carlineCd]# #}#"
                    }       //车种名称
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:120}// 车款名称
            ,{field:"enginSerialNo", title:"<spring:message code='sal.lbl.engNo' />", width:120}// 发动机编号
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:100}//车牌号码
            /**
            ,{field:"carBrandCd", title:"<spring:message code='par.lbl.brandNm' />", width:80
                  , template:function(dataItem){
                      var spanObj = "";
                      if('BHMC'==dataItem.carBrandCd){
                           spanObj = "<spring:message code='global.title.dmsShortTitle' />";
                      }else {
                          spanObj = dataItem.carBrandCd;
                      }
                    return spanObj;
                  }
             }//车辆品牌  carBrandNm carBrandCd
             **/
             ,{field:"carBrandNm", title:"<spring:message code='par.lbl.brandNm' />", width:80 }//车辆品牌  carBrandNm carBrandCd
            ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.totRunDistVal' />", width:80, attributes:{"class":"ar"}, sortable:false
                        ,format:"{0:n0}"
               }   //累计行驶里程     
            ,{field:"salesSpeStore", title:"<spring:message code='global.lbl.salDlrComp' />", width:80}//销售特约店  1
            ,{field:"custSaleDtFormat"  , title:"<spring:message code='sal.lbl.saleDt' />", width:100, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (custSaleDtFormat !== null ){# #= kendo.toString(data.custSaleDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
             }//零售日期
             
             ,{field:"grteStDtFormat"  , title:"<spring:message code='global.lbl.grteStartDt' />", width:100, attributes:{"class":"ac"}, sortable:false
                         ,template:"#if (grteStDtFormat !== null ){# #= kendo.toString(data.grteStartDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
             } //grteStartDt 保修开始日期
             ,{field:"wrrntEndDtFormat"  , title:"<spring:message code='ser.lbl.wartExpireDt' />", width:100, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (wrrntEndDtFormat !== null ){# #= kendo.toString(data.wrrntEndDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
             } //wrrntEndDt 保修结束日期
             ,{field:"claimConfirmDtFormat"  , title:"<spring:message code='crm.lbl.shopFirstRecDt' />", width:100, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (claimConfirmDtFormat !== null ){# #= kendo.toString(data.claimConfirmDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
             } //claimConfirmDt 本店首保承认时间
             ,{field:"aveMile", title:"<spring:message code='crm.lbl.averageDailyMileage' />", width:100, attributes:{"class":"ar"}, sortable:false
                       ,format:"{0:n0}" 
              }//平均日行驶里程  
              ,{field:"custNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:140}//客户编号   
              ,{field:"custTp" , title:"<spring:message code='global.lbl.custTp' />", width:80, attributes:{"class":"ac"}, sortable:false
                        , template:"#if (custTp != null && custTpMap[custTp] != undefined){# #= custTpMap[custTp]# #}#"
               }//客户类型 
              ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}//客户名 
              , {field:"sexCd"   , title:"<spring:message code='global.lbl.sex' />", width:30, attributes:{"class":"ac"}
                        ,attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.sexCd == 'M') {
                                spanObj = "<span class='icon_male'></span>";
                            } else if (dataItem.sexCd == 'F') {
                                spanObj = "<span class='icon_female'></span>";
                            }
                            return spanObj;
                        }
                    } // 性别
              ,{field:"birthDt"  , title:"<spring:message code='global.lbl.birthday' />", width:100, attributes:{"class":"ac"} 
              
              } //生日 
              , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:100, attributes:{"class":"ac"}, sortable:false
              , template:"#if (custCd != null && custCdMap[custCd] != undefined){# #= custCdMap[custCd]# #}#"} //潜客/保客
              ,{field:"hpNo", title:"<spring:message code='crm.lbl.corpPurcMngHpno' />", width:120}//移动电话
              ,{field:"mathDocTp"  , title:"<spring:message code='global.lbl.mathDocTp' />", width:120, attributes:{"class":"ac"}, sortable:false
                        , template:"#if (mathDocTp != null && mathDocTpMap[mathDocTp] != undefined){# #= mathDocTpMap[mathDocTp]# #}#" }//证件类型
              ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo' />", width:120}//证件号码
              ,{field:"sungNm", title:"<spring:message code='global.lbl.sung' />", width:100}//省
              ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:80}//市
              ,{field:"distNm", title:"<spring:message code='sal.lbl.dist' />", width:80}//区
              ,{field:"addrDetlCont", title:"<spring:message code='crm.lbl.addrDetlCont' />", width:220}//详细地址
              , {field:"blueMembershipNo"  , title:"<spring:message code='crm.lbl.blueMembershipYn' />", width:60, sortable:false
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dms.string.isNotEmpty(dataItem.blueMembershipNo)) {   //
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 蓝缤会员 BLUE_MEMBERSHIP_NO
                    , {field:"dlrMbrYn"  , title:"<spring:message code='crm.lbl.mbrShipTpYn' />", width:60, sortable:false
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dms.string.isNotEmpty(dataItem.dlrMbrYn)) {   //
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 自店会员
              ,{field:"firstCalcDtFormat"  , title:"<spring:message code='crm.lbl.firstMaintSettlementCompDt' />", width:140, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (firstCalcDtFormat !== null ){# #= kendo.toString(data.firstCalcDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
             } //首次维修的结算完成时间 
             ,{field:"latelyCalcDtFormat"  , title:"<spring:message code='crm.lbl.RecentCompletiMaintenancDt' />", width:140, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (latelyCalcDtFormat !== null ){# #= kendo.toString(data.latelyCalcDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
             } //最近维修的结算完成时间 
            ,{field:"firstRoDocNo", title:"<spring:message code='crm.lbl.firstRoDocNo' />", width:120}//首次维修委托号码
            ,{field:"latelyRoDocNo", title:"<spring:message code='crm.lbl.latelyRoDocNo' />", width:120}//最近维修委托号码
           
        ]
     
     });
    
});

//日期选择
function fnChkDateValue(e){
        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;
            // console.log("我的值",id);
        if(this.value() == null){
            if(id === 'sCustFromSaveDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sCustFromSaveDt").data("kendoExtMaskedDatePicker").value('');
                $("#sCustToSaveDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sCustToSaveDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sCustToSaveDt").data("kendoExtMaskedDatePicker").value('');
                $("#sCustFromSaveDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            } else if(id === 'sWrrntFromEndDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sWrrntFromEndDt").data("kendoExtMaskedDatePicker").value('');
                $("#sWrrntToEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sWrrntToEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sWrrntToEndDt").data("kendoExtMaskedDatePicker").value('');
                $("#sWrrntFromEndDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sFiirFromCalcDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sFiirFromCalcDt").data("kendoExtMaskedDatePicker").value('');
                $("#sFiirToCalcDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sFiirToCalcDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sFiirToCalcDt").data("kendoExtMaskedDatePicker").value('');
                $("#sFiirFromCalcDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sLatelyFromCalcDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sLatelyFromCalcDt").data("kendoExtMaskedDatePicker").value('');
                $("#sLatelyToCalcDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sLatelyToCalcDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sLatelyToCalcDt").data("kendoExtMaskedDatePicker").value('');
                $("#sLatelyFromCalcDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sClaimFromConfDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sClaimFromConfDt").data("kendoExtMaskedDatePicker").value('');
                $("#sClaimToConfDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sClaimToConfDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sClaimToConfDt").data("kendoExtMaskedDatePicker").value('');
                $("#sClaimFromConfDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sBirthFromDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sBirthFromDt").data("kendoExtMaskedDatePicker").value('');
                $("#sBirthToDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sBirthToDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sBirthToDt").data("kendoExtMaskedDatePicker").value('');
                $("#sBirthFromDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sCustFromSaveDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sCustToSaveDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sCustToSaveDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sCustFromSaveDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sWrrntFromEndDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sWrrntToEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sWrrntToEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sWrrntFromEndDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sFiirFromCalcDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sFiirToCalcDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sFiirToCalcDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sFiirFromCalcDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sLatelyFromCalcDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sLatelyToCalcDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sLatelyToCalcDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sLatelyFromCalcDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sClaimFromConfDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sClaimToConfDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sClaimToConfDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sClaimFromConfDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sBirthFromDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sBirthToDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sBirthToDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sBirthFromDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }
</script>
<style>
    #progressBar {
        display: block;
        width: 100%;
        margin-bottom: 10px;
    }
 </style>
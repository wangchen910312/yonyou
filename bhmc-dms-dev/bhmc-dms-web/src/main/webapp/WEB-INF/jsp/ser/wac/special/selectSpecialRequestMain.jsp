<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- PWA리스트 -->
<div id="resizableContainer">
   <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="wac.title.SpecialRequestList" /></h1> <!-- 保修工单确认申请 -->
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-13328" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-13329" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                </div>
            </div>
            
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup id="pwaColGroup">
                        <col style="width:8%;">
                        <col style="width:22%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:15%;">
                        <col style="width:8%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                    	<tr>
                    		<th scope="row"><spring:message code="global.lbl.fosterNo" /></th><!-- 维修委托单号 -->
                            <td>
                                <input type="text" maxlength="17" id="sRoDocNo" class="form_input" style="text-transform:uppercase;"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carNo" /></th><!-- 车牌号 -->
                            <td>
                                <input type="text" maxlength="17" id="sCarRegNo" class="form_input" style="text-transform:uppercase;"/>
                            </td>
                            <th scope="row"><spring:message code="wac.lbl.roDt" /></th><!-- 开单日期 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromRoDt" class="form_datepicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToRoDt" class="form_datepicker ac" />
                                    </div>
                                </div>
                            </td>
                    	</tr>
                        <tr>
                        	<th scope="row"><spring:message code="crm.lbl.evalStatus" /></th><!-- 单据状态 -->
                            <td>
                                <input type="text" id="sReqStatCd" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="wac.lbl.reqDt" /></th><!-- 提报日期 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromReqDt" class="form_datepicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToReqDt" class="form_datepicker ac" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
             <div class="header_area">
            	<h2 class="title_basic"><spring:message code="wac.title.SpecialRequest" /></h2><!-- 保修工单确认申请 -->
             </div>
                <div id="gridMaster" class="grid"></div>
            </div>
        </section>
        <!-- //PWA리스트 -->
    <!-- </div> -->
    <!-- //content_left -->
    <!-- content_right -->
    <form id="pwaRequestForm">
           <!-- PWA 신청 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="wac.title.message" /></h2><!-- 特殊提报信息 -->
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-13330" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button>
                        </dms:access>
                       
                        <dms:access viewId="VIEW-D-13331" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnReq" disabled><spring:message code="global.btn.req" /></button>
                        </dms:access>
                       
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                        	<tr>
                        		<input type="text" id="roDocNo" name="roDocNo" class="form_comboBox" style="display:none" data-json-obj="true" /><!-- 维修委托单号 作为整个主键-->
                        		<th scope="row"><span class="bu_required"><spring:message code="ser.lbl.applyReasonTp" /></span></th><!-- 提报原因分类 -->
                                <!-- <td  class="required_area"> -->
                                <td id="reqReasonTptd" class="readonly_area">
                                    <input type="text" id="reqReasonTp" name="reqReasonTp" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.requestUsr" /></th><!-- 提报人 -->
                                <td class="readonly_area">
                                    <input type="text" id="reqUsrNm" name="reqUsrNm" readOnly class="form_input" data-json-obj="true" value="${sreqUsrNm}"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.requestUsrPost" /></th><!-- 提报人岗位 -->
                                <td class="readonly_area">
                                    <input type="text" id="reqTskNm" name="reqTskNm" readOnly class="form_input" data-json-obj="true" value="${reqTskNm}"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.requestUsrPhoneNo" /></th><!-- 提报人手机号码 -->
                                <td class="readonly_area">
                                    <input type="text" id="reqHpNo" name="reqHpNo" readOnly class="form_input" data-json-obj="true" value="${reqHpNo}"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.hqApproveNm" /></th>
                                <td class="readonly_area">
                                    <input type="text" id="approveUsrNm" name="approveUsrNm" readOnly class="form_input" data-json-obj="true"/><!-- 判定人 -->
                                </td>
                        	</tr>
                        	<tr>
                        		<th scope="row"><span class="bu_required"><spring:message code="global.lbl.regReason" /></span></th><!-- 提报原因 -->
                                <td colspan="10" id="reqReasonDesctd" class="readonly_area">
                                	<textarea required min=2 maxlength="120" id="reqReasonDesc" name="reqReasonDesc" rows="2" cols="" class="form_textarea form_required" data-name="<spring:message code="ser.lbl.errPhenCont" />" data-json-obj="true"></textarea>
                                </td>
                        	</tr>
                            <tr>
                            	<th scope="row"><spring:message code="ser.lbl.rejectReason" /></th><!-- 审核原因 -->
                                <td colspan="10" class="readonly_area">
                                    <textarea maxlength="1300" id="approveDesc" name="approveDesc" rows="2" cols="" readonly class="form_textarea" ></textarea> <!-- 반송사유 -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <div id="tabstrip" class="tab_area">
                <ul>
                    <li class="k-state-active"><spring:message code="ser.lbl.file" /></li>
                </ul>
                <div>
                    <div class="btn_right_absolute">
                        <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 文件上传 -->
                        <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s" disabled><spring:message code="global.btn.fileDelete" /></button>
                    </div>
                    <!-- 文件列表页面 -->
                    <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                   
                </div>
            </div>
            <div style="display:none">
                <input type="text" id="dlrCd" name="dlrCd" data-json-obj="true"/>
            </div>
        </form>
    </div>
</div>
    <!-- //content_right -->

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">

/**
 **************** 코드 데이터 ****************************
 */
//PWA 상태 코드
var qcVal = 1;//区分有没有点击取消提报按钮，1未点击，2为点击过了  为提报按钮隐藏做准备 贾明 2018-11-13
var qcValR =1;//1时隐藏，2为展示 当选中的状态为不承认时，提报按钮设置为隐藏 贾明 2018-11-15
var isDbClice=1;//是否双击 1 不是，2是 贾明 2018-11-15
var pwaDocNoValue = 1;//pwa编号 贾明2018-11-15
var rowRoDocNo;//保存/申请之后显示被选中的那一项
var gridRow = -1;//默认不选
var gridRowTr;//保存/申请之后显示被选中的那一项
//审核状态列表赋值 wangc 2021年3月31日10:24:34
var reqStatCdList = [];
<c:forEach var="obj" items="${reqStatDs}">
    reqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var reqStatMap = dms.data.arrayToMap(reqStatCdList, function(obj){return obj.cmmCd;});

//提报原因类别下拉列表赋值 wangc 2021年3月31日10:24:34
var reqReasonTpList = [];
<c:forEach var="obj" items="${reqReasonTp}">
	reqReasonTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var reqReasonTpMap = dms.data.arrayToMap(reqReasonTpList, function(obj){return obj.cmmCd;});

$(document).ready(function (e){

	//单据状态集合存到列表  wangc 2021年3月31日19:30:37
    setReqStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(reqStatMap[value] != undefined)
            resultVal =  reqStatMap[value].cmmCdNm;
        }
        return resultVal;
    };
    //提报原因分类集合存到列表 wangc 2021年3月31日19:30:43
    setreqReasonTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(reqReasonTpMap[value] != undefined)
            resultVal =  reqReasonTpMap[value].cmmCdNm;
        }
        return resultVal;
    };
	
 
     // ********************** format 格式转换 **********************
     /**开单开始日期 **/
     $("#sFromRoDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sFromRoDt}"
     });

    /**开单结束日期**/
     $("#sToRoDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sToRoDt}"
     });
    
     /**提报开始日期 **/
      $("#sFromReqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:""
     }); 

    /**提报结束日期**/
      $("#sToReqDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:""
     }); 


     /** 提报状态下拉列表 **/
     $("#sReqStatCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:reqStatCdList
         ,optionLabel:" "  // 선택
         ,index:0
         ,valuePrimitive:true
     });
     
     /** 提报原因类别下拉列表 **/
     $("#reqReasonTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:reqReasonTpList
        ,optionLabel:" "  // 선택
        ,index:0
        ,valuePrimitive:true
     });

     //查询操作
     $("#btnSearch").kendoButton({
         click:function(e){
             selectedYn = false;
             gridRow = -1;
             $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
             $("#gridMaster").data("kendoExtGrid").dataSource.page(1);//列表重新加载
             //特殊提报信息清空操作,保存按钮，提报按钮置灰
             $("#roDocNo").val("");//维修委托单号
             $("#reqReasonTp").data("kendoExtDropDownList").value("");//提报原因类别
             $("#reqReasonDesc").val("");//提报原因描述
             $("#fileKeyNm").val("");//保存file的id
             $("#btnSave").data("kendoButton").enable(false);//保存按钮置灰
        	 $("#btnReq").data("kendoButton").enable(false);//提报按钮置灰
        	 $("#reqReasonTptd").addClass("readonly_area");//提报原因分类 置灰
        	 $("#reqReasonDesctd").addClass("readonly_area");//提报原因 置灰
             //文件列表清空
             $("#btnFileAdd").hide();//上传文件隐藏
             $("#btnFileDel").data("kendoButton").enable(false);//删除按钮置灰
        	 var fileGrid = $("#fileGrid").data("kendoExtGrid");//文件列表的加载
        	 fileGrid.dataSource.data([]);
        	 fileGrid.dataSource.read();
         }
     });

     //Excel下载操作
     $("#btnExcelExport").kendoButton({

         click:function(e){

             dms.ajax.excelExport({
                 "beanName"         :"specialRequestService"
                 ,"templateFile"    :"SpecialRequestList_Tpl.xlsx"
                 ,"fileName"        :"<spring:message code='wac.title.SpecialRequestList' />.xlsx"
                 ,"sRoDocNo"		: $("#sRoDocNo").val()//维修委托号
                 ,"sCarRegNo"		: $("#sCarRegNo").val()//车牌号
                 ,"sFromRoDt"		: $("#sFromRoDt").val()//开单开始日期
                 ,"sToRoDt"			: $("#sToRoDt").val()//开单结束日期
                 ,"sReqStatCd"		: $("#sReqStatCd").val()//状态
                 ,"sFromReqDt"		: $("#sFromReqDt").val()//提报开始日期
                 ,"sToReqDt"		: $("#sToReqDt").val()//提报结束日期
             });
         }
     });



     /** 保存 wangc 2021年3月31日17:44:52**/
     $("#btnSave").kendoButton({
         click:function(e){
             sendRequestSave('00');//“00”保存 “01”已申请 “02”审核通过“03”审核拒绝  “04”审核驳回"05"未申请 wangc 2021年3月31日19:28:25
            
         }
     });



     /** 提报  wangc 2021年3月31日17:44:52 **/
     $("#btnReq").kendoButton({
         click:function (e){
        	sendRequestSave('01');//“00”保存 “01”已申请 “02”审核通过“03”审核拒绝  “04”审核驳回"05"未申请 wangc 2021年3月31日19:28:25
         }
     });



    /**保存save和提报apply wangc 2021年3月31日17:44:52**/
    sendRequestSave = function (reqStatCd){
		//判断维修委托单号是否存在，如果不存在，不可以提报和保存
    	if(dms.string.isEmpty($("#roDocNo").val())){
            dms.notification.warning("<spring:message code='global.lbl.fosterNo' var='fosterNo' /><spring:message code='global.info.isNotNull' arguments='${fosterNo}' />");
            return;
        }
		//判断提报原因类别不能为空
    	if(dms.string.isEmpty($("#reqReasonTp").val())){
            dms.notification.warning("<spring:message code='ser.lbl.applyReasonTp' var='applyReasonTp' /><spring:message code='global.info.isNotNull' arguments='${applyReasonTp}' />");
            return;
        }
    	//判断提报原因描述不能为空
    	if(dms.string.isEmpty($("#reqReasonDesc").val())){
            dms.notification.warning("<spring:message code='global.lbl.regReason' var='regReason' /><spring:message code='global.info.isNotNull' arguments='${regReason}' />");
            return;
        }
    	//判断提报原因描述必须包含汉子 申请原因输入文字限定5~20个字，不可以填入纯数字或纯字母或纯数字+纯字母！
    	var reqDesc = $("#reqReasonDesc").val();   
    	if (!/[\u4E00-\u9FA5]/.test(reqDesc)) {
    		dms.notification.warning("<spring:message code='global.err.inputReason' />");
    		return;
    	}else{
    		//申请原因输入文字限定5~20个字 申请原因输入文字限定5~20个字，不可以填入纯数字或纯字母或纯数字+纯字母！
    		if(reqDesc.length>20||reqDesc.length<5){
    			dms.notification.warning("<spring:message code='global.err.inputReason' />");
        		return;
    		}
    	} 
    	   
    	
		//保存提报赋值传参
    	var params =  $.extend(
            {"reqStatCd":reqStatCd}//单据状态
           ,{"roDocNo": $("#roDocNo").val()}//维修委托单号
           ,{"reqReasonTp": $("#reqReasonTp").val()}//提报原因类别
           ,{"reqUsrNm": $("#reqUsrNm").val()}//提报人id
           ,{"reqTskNm": $("#reqTskNm").val()}//提报人岗位
           ,{"reqHpNo": $("#reqHpNo").val()}//提报人手机号
           ,{"approveUsrNm": $("#approveUsrNm").val()}//审核人姓名
           ,{"reqReasonDesc": $("#reqReasonDesc").val()}//提报原因描述
           ,{"approveDesc": $("#approveDesc").val()}//审核原因
           ,{"fileDocNo": $("#fileKeyNm").val()}//保存file的id
        );
		//如果是提报则置灰保存按钮和提报按钮
		if(reqStatCd=="01"){
			 $("#btnSave").data("kendoButton").enable(false);//保存按钮置灰
        	 $("#btnReq").data("kendoButton").enable(false);//提报按钮置灰
        	 $("#reqReasonTptd").addClass("readonly_area");//提报原因分类 置灰
        	 $("#reqReasonDesctd").addClass("readonly_area");//提报原因 置灰
        	 $("#btnFileAdd").hide();//上传文件隐藏
             $("#btnFileDel").data("kendoButton").enable(false);//删除按钮置灰
		}
        $.ajax({
            url:"<c:url value='/ser/wac/special/addSpecialRequest.do' />"
            ,data:JSON.stringify(params)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
               // dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            	 dms.notification.error("保存异常！");
            	 $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                 $("#gridMaster").data("kendoExtGrid").dataSource.page(1);//列表重新加载
            }
            ,success:function(result , textStatus){
            	if(result!=""){
            		dms.notification.warning(result);
            	}else{
            		dms.notification.success("<spring:message code='global.info.success' />");
            	}
                
                rowRoDocNo = $("#roDocNo").val();//返显保存/提报是第几列
                $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                $("#gridMaster").data("kendoExtGrid").dataSource.page(1);//列表重新加载
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
       
    };

     /** 给特殊提报信息赋值  wangc 2021年3月31日17:22:50**/
     setResultDataSetting =  function (result){
    	
    	if(result.reqStatCd!="01"&&result.reqStatCd!="03"&&result.reqStatCd!="02"){
    		 //保存按钮和提报按钮显示出来
    		 $("#btnSave").data("kendoButton").enable(true);
        	 $("#btnReq").data("kendoButton").enable(true);
        	 $("#reqReasonTptd").removeClass("readonly_area");//提报原因分类
        	 $("#reqReasonDesctd").removeClass("readonly_area");//提报原因 
        	 $("#btnFileAdd").show();//上传文件显示
             $("#btnFileDel").data("kendoButton").enable(true);//删除按钮显示
    	}else{
    		 //保存按钮和提报按钮置灰
	   		 $("#btnSave").data("kendoButton").enable(false);
	       	 $("#btnReq").data("kendoButton").enable(false);
	       	 $("#reqReasonTptd").addClass("readonly_area");//提报原因分类 置灰
       	 	 $("#reqReasonDesctd").addClass("readonly_area");//提报原因 置灰
	       	 $("#btnFileAdd").hide();//上传文件隐藏
             $("#btnFileDel").data("kendoButton").enable(false);//删除按钮置灰
    	}
    	
    	 //给下面特殊提报信息赋值
    	 $("#reqReasonDesc").val(result.reqReasonDesc) ;//提报原因
    	 $("#approveDesc").val(result.approveDesc) ;//审核原因
    	 $("#approveUsrNm").val(result.approveUsrNm) ;//判定人
    	 $("#reqReasonTp").data("kendoExtDropDownList").value(result.reqReasonTp);//提报原因分类
    	 $("#roDocNo").val(result.roDocNo);//维修委托单号
    	 if(result.fileDocNo==""||result.fileDocNo==null){
    		 $.ajax({
                 url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType:"json",
                 type:"get",
                 async:false,
                 cache:false,
                 success:function(id) {
                     $("#fileKeyNm").val(id);//给file文件ID赋值
                 }
             });
    	 }else{
    		 $("#fileKeyNm").val(result.fileDocNo);//给文件id赋值
    	 }
    	 
     };

     
     //给特殊提报信息赋值 wangc 2021年3月31日17:24:38 文件的返显
     detailSet = function(data){
    	 var fileGrid = $("#fileGrid").data("kendoExtGrid");//文件列表的加载
    	 setResultDataSetting(data);//给特殊提报信息赋值
    	 fileGrid.dataSource.data([]);
    	 fileGrid.dataSource.read();
     };

     $("#btnFileAdd").hide();//上传文件隐藏
     $("#btnFileDel").data("kendoButton").enable(false);//删除按钮置灰
    // 页面提报单表格加载  wangc 2021年3月31日16:09:21
    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1407-210331"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/special/getSpecialRequest.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         //search的查询条件  wangc 2021年3月31日14:10:55
                         params["sRoDocNo"]     = $("#sRoDocNo").val();//维修委托号
                         params["sCarRegNo"] = $("#sCarRegNo").val();//车牌号
                         params["sFromRoDt"]    = $("#sFromRoDt").data("kendoExtMaskedDatePicker").value();//开单开始日期
                         params["sToRoDt"]      = $("#sToRoDt").data("kendoExtMaskedDatePicker").value();//开单结束日期
                         params["sReqStatCd"]  = $("#sReqStatCd").val();
                         params["sFromReqDt"]    = $("#sFromReqDt").data("kendoExtMaskedDatePicker").value();//提报开始日期
                         params["sToReqDt"]      = $("#sToReqDt").data("kendoExtMaskedDatePicker").value();//提报结束日期
                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,reqStatCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,hqApproveDt:{type:"date" }
                       ,dlrSignReqDt:{type:"date" }
                       ,updtDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:170
        ,filterable:false                
        ,appendEmptyColumn:true
        ,dataBound:function(e) {//表格加载完成之后触发事件dataBound wangc 2021年3月31日15:52:28
        	var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(rowRoDocNo  == selectedVal.roDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);//返显列表框
                } 
            }
        }
        ,change:function (e){
        	 var selectedVal = this.dataItem(this.select());//获取选中的列表数据行数据
        	 gridRow = $("#gridMaster").data("kendoExtGrid").select().index();//获取选中的列
        	 detailSet(selectedVal);//给特殊提报信息赋值 
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               //,{field:"carRegNo",title:"车牌号", width:80,sortable:false, attributes :{"class":"al"} , hidden:true }//车牌号
               
               ,{field:"roDocNo",title:"<spring:message code='global.lbl.fosterNo' />", width:110, attributes :{"class":"al"} }//维修委托单号
               ,{field:"reqStatCd",title:"<spring:message code='crm.lbl.evalStatus' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setReqStatMap(reqStatCd)#"
                   ,editor:function(container, options){
                       $('<input required name="reqStatCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:reqStatCdList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="reqStatCd"></span>').appendTo(container);
                      }
                 }//单据状态
               ,{field:"carRegNo",title:"<spring:message code='global.lbl.carNo' />", width:80,sortable:false, attributes :{"class":"al"}  }//车牌号
               ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />" , width:150 , attributes :{"class":"al"}}//车辆识别码
               ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />" , width:150 , attributes :{"class":"al"}}//车辆所有者名字
               ,{field:"driverNm", title:"<spring:message code='crm.lbl.driver' />" , width:150 , attributes :{"class":"al"}}//送修人姓名
               ,{field:"driverHpNo", title:"<spring:message code='ser.lbl.driverPhoneNo' />" , width:150 , attributes :{"class":"al"}}//送修人手机号
               ,{field:"reqReasonTp",title:"<spring:message code='ser.lbl.applyReasonTp' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setreqReasonTpMap(reqReasonTp)#"
                   ,editor:function(container, options){
                       $('<input required name="reqReasonTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:reqReasonTpList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="reqStatCd"></span>').appendTo(container);
                      }
                 }//提报原因分类
              ,{field:"reqReasonDesc", title:"<spring:message code='global.lbl.regReason' />" , width:100 , attributes :{"class":"al"}}//提报原因
              ,{field:"approveDesc", title:"<spring:message code='ser.lbl.rejectReason' />" , width:100 , attributes :{"class":"al"}}//审核原因
              ,{field:"reqUsrNm", title:"<spring:message code='ser.lbl.requestUsr' />" , width:90 , attributes :{"class":"ar"}}//提报人
              ,{field:"approveUsrNm", title:"<spring:message code='ser.lbl.hqApproveNm' />" , width:80 , attributes :{"class":"ar"}}//判定人
              ,{field:"roDt" , title:"<spring:message code='wac.lbl.roDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//开单日期 -- 维修委托时间
              ,{field:"reqDt" , title:"<spring:message code='wac.lbl.reqDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//提报日期 -- 申请日期
              ,{field:"dlChkDt" , title:"<spring:message code='wac.lbl.dlChkDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//交车确认日期
               ,{field:"fileDocNo", title:"文件id" , width:80 , attributes :{"class":"ar"} , hidden:true}//文件id
             ]
    });

   
    setMainLbrYn = function(){ //ser.lbl.notSelectMainLbrCd
        var grid = $("#gridLabor").data("kendoExtGrid");//.dataSource._data;
        var selectedVal = grid.dataItem(grid.select());

        if(selectedVal.relCauLbrYn == "N"){
            dms.notification.warning("<spring:message code='ser.lbl.notSelectMainLbrCd' />");

            selectedVal.set("cauLbrYn" ,"N");
            return;
        }

        if(selectedVal.cauLbrYn == "Y" ){
            $("#cauOperAtcCd").val(selectedVal.lbrCd);
            $("#cauOperAtcNm").val(selectedVal.lbrNm);
        }else{
            $("#cauOperAtcCd").val("");
            $("#cauOperAtcNm").val("");
        }

        $.each(grid.dataSource._data , function(i , gridData){
            var result = true;
            if($("#cauOperAtcCd").val() == gridData.lbrCd){
                result = false;
                gridData.set("cauLbrYn" , "Y");
            }
            if(result) gridData.set("cauLbrYn" , "N");

        });
        grid.refresh();
    }





  //返显数据显示
    setGridRows = function(grid){

        rowRoDocNo = "";
        gridRow = 0;
        var selectedVal = grid.dataItem(grid.select());
        if(selectedVal != null){
            gridRow = grid.select().index();
            rowRoDocNo = selectedVal.pwaDocNo;
        }
    }


    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });


});



</script>


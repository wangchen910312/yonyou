<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<input type = "hidden" id = "flag09" value="${flag09}"/>
<input type = "hidden" id = "senderNmDefault" value="${senderNmDefault}"/>
<input type = "hidden" id = "senderTelnoDefault" value="${senderTelnoDefault}"/>
<input type = "hidden" id = "senderAddrDefault" value="${senderAddrDefault}"/>

<div id="resizableContainer">
    <div class="content">
   
        <section class="group">
        	 <!--  查询区域信息开始 -->
            <div class="header_area">
                 <h1 class="title_basic"><spring:message code="cmm.menu.invoiceCreate" /></h1>
                <div class="btn_right">
	                <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /></button><!-- 查询 -->
	                <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button><!-- 下载 -->
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
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
                        <col>
                    </colgroup>
                    <tbody>
                       <tr>
                        	<th scope="row"><spring:message code="ser.lbl.settlementStatementNo" /></th><!-- 结算报表编号 -->
                            <td>
                                <input id="invcNo" type="text" class="form_input" />
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.invcDt" /></th><!-- 结算报表年月 -->
                        	<td>
	                            <div class="form_float">
	                                <div class="date_left">
	                                    <input value="" id="sinvcsFromDt" class="form_datepicker ac"><!-- 开始日期-->
	                                    <span class="txt_from">~</span>
	                                </div>
	                                <div class="date_right">
	                                    <input value="" id="sinvcsToDt" class="form_datepicker ac" ><!-- 结束日期-->
	                                </div>
	                            </div>
                        	</td>
                        	<th scope="row"><spring:message code="ser.lbl.InvoiceClaimState" /></th> <!-- 开票状态 -->
                            <td>
                                <input type="text" id="receiptTp" name="receiptTp" class="form_comboBox"  data-json-obj="true" />
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.wcourierStatus" /></th> <!-- 快递状态 -->
                            <td>
                                <input type="text" id="trsfTp" name="trsfTp" class="form_comboBox" data-json-obj="true"  />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--  查询区域信息结束 -->
            <!--  结算单列表按钮开始 -->
 			<div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.wfinalStatementList" /></h2>
                <div class="btn_right">
                     <button type="button" class="btn_m" id="btSave" ><spring:message code="par.btn.save" /></button><!-- 保存 -->
                     <button type="button" class="btn_m" id="btSubmit" ><spring:message code="sal.btn.offer" /></button><!-- 提报 -->
                     <button type="button" class="btn_m" id="btQuitReceive" ><spring:message code="ser.invoice.backtake" /></button><!-- 退票接收 -->
                     <button type="button" class="btn_m" id="btCancel" ><spring:message code="ser.btn.cancel" /></button><!-- 取消 -->
                </div>
            </div>
            <!--  结算单列表按钮结束 -->
            <!--  结算单列表信息开始 -->
            <div class="table_grid mt10">
                 <div id="gridMaster" class="grid"></div>
            </div>
            <!--  结算单列表信息结束 -->
        </section>
        <!-- 发票信息开始 -->
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.InvoiceClaimInfo" /></h2>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12037" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_del btn_s_min5" id="btnSearchDetail"><spring:message code="global.btn.search" /></button>
                        <button type="button" class="btn_s btn_del btn_s_min5" id="btnDetailDel"><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 发票信息列表 -->
            <div class="table_grid">
                <div id="gridDetail" class="grid"></div>
            </div>
        </section>
        <!-- 发票信息结束 -->
        
        <!-- 快递信息开始 -->
        <section class="group">
        	 <!--  查询区域信息开始 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.lbl.express" /></h2>
            </div>
            <div align="right" style="color: red;"><spring:message code="ser.info.sentToTheDesigNatedPlaceBeforeThe15thDay" /></div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                        	<th scope="row"><spring:message code="ser.lbl.trsfNo" /></th><!-- 快递单号 -->
                            <td>
                                <input id="trsfNo" type="text" class="form_input" />
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.trsfCmpCd" /></th><!-- 快递公司 -->
                        	<td id="expsCmpNmtd"><!-- 置灰操作 -->
                                 <input type="text" id="expsCmpNm" name="expsCmpNm" class="form_comboBox" data-json-obj="true" />
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.senderId" /></th> <!-- 寄件人 -->
                            <td>
                                <input id="senderNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.senderPhone" /></th> <!-- 寄件人联系电话 -->
                            <td>
                                <input id="senderTelno" type="text" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <!-- <th scope="row">退票原因</th>退票原因
                            <td id="failMsgtd">置灰操作
                                 <input type="text" id="failMsg" name="failMsg" class="form_comboBox" data-json-obj="true" />
                            </td> -->
                            <th scope="row"><spring:message code="ser.lbl.senderAddr" /></th><!-- 寄件人地址 -->
                            <!-- <td>
                                <input id="senderAddr" type="text" class="form_input" />
                            </td> -->
                            <td colspan="3">
                                <textarea required min=2 maxlength="120" id="senderAddr" name="senderAddr" rows="2" cols="" class="form_textarea form_required" data-name="<spring:message code="ser.lbl.errPhenCont" />" data-json-obj="true"></textarea>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.memo" /></th><!-- 备注 -->
                            <!-- <td>
                                <input id="remark" type="text" class="form_input" />
                            </td> -->
                            <td colspan="3">
                                <textarea required min=2 maxlength="120" id="remark" name="remark" rows="2" cols="" class="form_textarea form_required" data-name="<spring:message code="ser.lbl.errPhenCont" />" data-json-obj="true"></textarea>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </section>
        </div>
    </div>
</div>



<script type="text/javascript">
var rowinvcNo;//默认的结算单号
var gridRow ;//默认不选
var invcClaimTotAmtVal;//默认当前行的结算金额

//发票状态下拉列表赋值 yixd 2021年4月12日11:04:53
var receiptTpDsList = [];
<c:forEach var="obj" items="${receiptTpDs}">
	receiptTpDsList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var receiptTpMap = dms.data.arrayToMap(receiptTpDsList, function(obj){return obj.cmmCd;});

//快递状态下拉列表赋值 yixd 2021年4月12日11:04:53
var trsfTpDsList = [];
<c:forEach var="obj" items="${trsfTpDs}">
	trsfTpDsList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var trsfTpMap = dms.data.arrayToMap(trsfTpDsList, function(obj){return obj.cmmCd;});

//退票原因下拉列表赋值
var failMsgList = [];
<c:forEach var="obj" items="${failMsgDs}">
	failMsgList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var failMsgMap = dms.data.arrayToMap(failMsgList, function(obj){return obj.cmmCd;});

//是否取消下拉列表赋值
var cancelYnList = [];
<c:forEach var="obj" items="${cancelYnDs}">
	cancelYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cancelYnMap = dms.data.arrayToMap(cancelYnList, function(obj){return obj.cmmCd;});

//快递公司列表赋值 EMS和其他
var expsCmpNmList = [];
<c:forEach var="obj" items="${expsCmpNmDs}">
	expsCmpNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var expsCmpNmMap = dms.data.arrayToMap(expsCmpNmList, function(obj){return obj.cmmCd;});


//js初始化方法 yixd 2021年4月12日11:07:22
$(document).ready(function (e){
	
	//发票状态集合存到列表  yixd 2021年4月12日11:21:15
    setreceiptTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(receiptTpMap[value] != undefined)
            resultVal =  receiptTpMap[value].cmmCdNm;
        }
        return resultVal;
    };
    //快递状态集合存到列表 wangc 2021年4月12日13:19:13
    settrsfTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(trsfTpMap[value] != undefined)
            resultVal =  trsfTpMap[value].cmmCdNm;
        }
        return resultVal;
    };
    
  	//取消原因
    setfailMsgMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(failMsgMap[value] != undefined)
            resultVal =  failMsgMap[value].cmmCdNm;
        }
        return resultVal;
    };
    
  	//是否取消
    setcancelYnMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(cancelYnMap[value] != undefined)
            resultVal =  cancelYnMap[value].cmmCdNm;
        }
        return resultVal;
    };
    
  	//快递公司
    setexpsCmpNmMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(expsCmpNmMap[value] != undefined)
            resultVal =  expsCmpNmMap[value].cmmCdNm;
        }
        return resultVal;
    };
    
    
    /**结算报表开始日期 **/
    $("#sinvcsFromDt").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sinvcsFromDt}"
        ,depth:"year"
        ,start:"year"
    });

   /**结算报表结束日期**/
    $("#sinvcsToDt").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sinvcsToDt}"
        ,depth:"year"
        ,start:"year"
    });
   
    /** 发票状态下拉列表 **/
    $("#receiptTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:receiptTpDsList
        ,optionLabel:" " 
        ,index:0
        ,valuePrimitive:true
    });
    
    /** 快递状态下拉列表 **/
    $("#trsfTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:trsfTpDsList
       ,optionLabel:" "  
       ,index:0
       ,valuePrimitive:true
    });
    
    /** 快递公司下拉列表 **/
    $("#expsCmpNm").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:expsCmpNmList
       ,optionLabel:" "  
       ,index:0
       ,valuePrimitive:true
    });

 // 页面结算单表格加载  yixd 2021年4月12日14:12:33
    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1412-2021419"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimlnvoice/selectClaimInvoiceReception.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){
                         // 页面的分页查询以及筛选条件过滤
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         //search的查询条件  yixd 2021年4月12日14:22:12
                         params["sreceiptTp"]    = $("#receiptTp").val();//开票状态
                         params["sinvcNo"]       = $("#invcNo").val();//结算报表单号
                         params["sinvcsFromDt"]  = $("#sinvcsFromDt").data("kendoExtMaskedDatePicker").value();//结算报表开始日期
                         params["sinvcsToDt"]    = $("#sinvcsToDt").data("kendoExtMaskedDatePicker").value();//结算报表结束日期
                         params["strsfTp"]       = $("#trsfTp").val();//快递状态
                        
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
                        rnum:{type:"number" }         	//序号
                       ,invcNo:{type:"string" }   	  	//结算报表编号
                       ,receiptTp:{type:"string" }   	//开票状态
                       ,invcDt:{type:"date" }   		//结算报表年月
                       ,confirmTotAmt:{type:"number" }  //确定金额
                       ,ddctTotAmt:{type:"number" } 	//扣减金额
                       ,invcClaimTotAmt:{type:"number"}		//结算金额
                       ,trsfNo:{type:"string" }   		//快递单号
                       ,expsCmpNm:{type:"string" }		//快递公司
                       ,trsfTp:{type:"string" }			//快递状态
                       ,failMsg:{type:"string" }        //退票原因
                       ,senderNm:{type:"string" }		//寄件人
                       ,senderTelno:{type:"string" }	//联系电话
                       ,senderAddr:{type:"string" }		//寄件人地址
                       ,remark:{type:"string" }		//备注
                       ,cancelYn:{type:"string" }		//是否取消
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
        ,dataBound:function(e) {//表格加载完成之后触发事件dataBound yixd 2021年3月31日15:52:28
        	var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
              e.sender.select(e.sender.tbody.find("tr")[gridRow]);//返显列表框
            }
        }
        ,change:function (e){
        	 var selectedVal = this.dataItem(this.select());//获取选中的列表数据行数据
        	 gridRow = $("#gridMaster").data("kendoExtGrid").select().index();//获取选中的列
        	 rowinvcNo = selectedVal.invcNo;//给结算报表编号赋值
        	 invcClaimTotAmtVal = selectedVal.invcClaimTotAmt;//给结算金额赋值
        	 //切换点击行信息赋值
        	 setResultData(selectedVal);
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"invcNo",title:"<spring:message code='ser.lbl.settlementStatementNo' />", width:110, attributes :{"class":"al"} }//结算报表编号 
               ,{field:"receiptTp",title:"<spring:message code='ser.lbl.InvoiceClaimState' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setreceiptTpMap(receiptTp)#"
                   ,editor:function(container, options){
                       $('<input required name="receiptTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:receiptTpDsList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="receiptTp"></span>').appendTo(container);
                      }
                 }//开票状态
               ,{field:"invcDt" , title:"<spring:message code='ser.lbl.invcDt' />", width:125
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//结算报表年月
               ,{field:"confirmTotAmt",title:"<spring:message code='ser.lbl.invcClaimTotAmt' />", width:110, attributes :{"class":"al"} }//确定金额
               ,{field:"ddctTotAmt",title:"<spring:message code='ser.lbl.deductAmount' />", width:110, attributes :{"class":"al"} }//扣减金额
               ,{field:"invcClaimTotAmt",title:"<spring:message code='ser.lbl.calcAmt' />", width:110, attributes :{"class":"al"} }//结算金额
               ,{field:"trsfNo",title:"<spring:message code='ser.lbl.trsfNo' />", width:110, attributes :{"class":"al"} }//快递单号
               //,{field:"expsCmpNm",title:"快递公司", width:110, attributes :{"class":"al"} }//快递公司
               ,{field:"expsCmpNm",title:"<spring:message code='ser.lbl.trsfCmpCd' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setexpsCmpNmMap(expsCmpNm)#"
                   ,editor:function(container, options){
                       $('<input required name="expsCmpNm" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:expsCmpNmList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="expsCmpNm"></span>').appendTo(container);
                      }
                 }//快递公司
               ,{field:"trsfTp",title:"<spring:message code='ser.lbl.wcourierStatus'/>", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=settrsfTpMap(trsfTp)#"
                   ,editor:function(container, options){
                       $('<input required name="trsfTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:trsfTpDsList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="receiptTp"></span>').appendTo(container);
                      }
                 }//快递状态
               ,{field:"failMsg",title:"<spring:message code='ser.lbl.wrefundReason'/>", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setfailMsgMap(failMsg)#"
                   ,editor:function(container, options){
                       $('<input required name="failMsg" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:failMsgList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="failMsg"></span>').appendTo(container);
                      }
                 }//退票原因
               ,{field:"cancelYn",title:"<spring:message code='ser.lbl.wcancelYn'/>", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setcancelYnMap(cancelYn)#"
                   ,editor:function(container, options){
                       $('<input required name="cancelYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:cancelYnList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="cancelYn"></span>').appendTo(container);
                      }
                 }//是否取消
               ,{field:"failRemark",title:"<spring:message code='ser.lbl.wrefundNote'/>", width:110, attributes :{"class":"al"} }//退票备注
               ,{field:"senderNm",title:"<spring:message code='ser.lbl.senderId'/>", width:110, attributes :{"class":"al"} }//寄件人
               ,{field:"senderTelno",title:"<spring:message code='ser.lbl.senderPhone'/>", width:110, attributes :{"class":"al"} }//联系电话
               ,{field:"senderAddr",title:"<spring:message code='ser.lbl.senderAddr'/>", width:110, attributes :{"class":"al"} }//寄件人地址
               ,{field:"remark",title:"<spring:message code='ser.lbl.memo'/>", width:110, attributes :{"class":"al"} }//
             ]
    });
 
    //页面发票信息表格加载  wangc 2021年4月12日14:12:33
    var receiptCd;//发票cd 删除用
    var receiptNo;//发票no 删除用
    var settlementNo;//结算单号 删除用 
    var searchFlag = '01';
    
    //索赔发票列表加载
    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1608-2021418"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimlnvoice/selectClaimInvoiceDetail.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){
                      // 页面的分页查询以及筛选条件过滤
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] 		  = options.page;
                         params["firstIndex"] 		  = options.skip;
                         params["lastIndex"] 		  = options.skip + options.take;
                         params["sort"] 			  = options.sort;

                         //search的查询条件  yixd 2021年4月12日14:22:12
                         params["settlementNo"]       = rowinvcNo;//结算报表单号
                         params["searchFlag"]       = searchFlag;//01 正常查询不展示删除的  05明细列表右上角查询包括删除的
                         
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
                        rnum:{type:"number" }         	//序号
                       ,receiptCd:{type:"string" }      //发票号
                       ,buyNm:{type:"string" }      	//发票抬头
                       ,taxpayerIdCd:{type:"string" }   //纳税人识别号
                       ,sumAmt:{type:"number" }   		//发票金额
                       ,receiptIssDt:{type:"date" }     //发票日期
                       ,settlementNo:{type:"string" }		    //发票备注
                       ,receiptNo:{type:"string" }		//发票代码
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
        ,dataBound:function(e) {//表格加载完成之后触发事件dataBound yixd 2021年3月31日15:52:28
         	
        	
        }
        ,change:function (e){
            receiptCd = '';
        	receiptNo = '';
			var selectedDetailVal = this.dataItem(this.select());//获取选中的列表数据行数据
			receiptCd = selectedDetailVal.receiptCd;
			receiptNo = selectedDetailVal.receiptNo;
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"receiptCd",title:"<spring:message code='ser.lbl.InvoiceClaimNo' />", width:110, attributes :{"class":"al"} }//发票号
               ,{field:"buyNm",title:"<spring:message code='ser.lbl.InvoiceClaimTitle' />", width:110, attributes :{"class":"al"} }//发票抬头
               ,{field:"taxpayerIdCd",title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:110, attributes :{"class":"al"} }//纳税人识别号
               ,{field:"sumAmt",title:"<spring:message code='ser.lbl.InvoiceClaimAmt' />", width:110, attributes :{"class":"al"} }//发票金额
               ,{field:"receiptIssDt" , title:"<spring:message code='sal.lbl.invoiceDt' />", width:125
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//发票日期
               ,{field:"settlementNo",title:"<spring:message code='ser.lbl.InvoiceClaimRemark' />", width:110, attributes :{"class":"al"} }//发票备注
               ,{field:"receiptNo",hidden:true}//发票代码
             ]
    });
    
    //结算单列表点击之后赋值退票信息
    setResultData = function (result){
    	
    	//保存、提报、退票接收、取消，按钮及画面控制
    	if(result.receiptTp=="02"){//发票状态 已开票
    		//按钮隐藏
            $("#btSave").data("kendoButton").enable(false);//保存
            $("#btSubmit").data("kendoButton").enable(false);  //提报
            $("#btQuitReceive").data("kendoButton").enable(false);//退票接收
            $("#btCancel").data("kendoButton").enable(true);  //取消
            
            $("#trsfNo").attr("readonly",true).addClass("form_readonly");//快递单号
            $("#expsCmpNm").attr("readonly",true).addClass("form_readonly");//快递公司
            $("#expsCmpNmtd").addClass("readonly_area");//快递公司不可编辑
            $("#senderNm").attr("readonly",true).addClass("form_readonly");//寄件人
            $("#senderTelno").attr("readonly",true).addClass("form_readonly");//联系电话
            $("#senderAddr").attr("readonly",true).addClass("form_readonly");//联系人地址
            $("#remark").attr("readonly",true).addClass("form_readonly");//备注
    		
    	}else if(result.receiptTp=="03"){ //发票状态 已退票
    		
    		if(result.trsfTp=="04"){// 快递状态04 退票接收
    			$("#btSave").data("kendoButton").enable(true);//保存
                $("#btSubmit").data("kendoButton").enable(true);  //提报
                $("#btQuitReceive").data("kendoButton").enable(false);//退票接收
                $("#btCancel").data("kendoButton").enable(false);  //取消
                
                $("#trsfNo").attr("readonly",false).removeClass("form_readonly");//快递单号
                $("#expsCmpNm").attr("readonly",false).removeClass("form_readonly");//快递公司
                $("#expsCmpNmtd").removeClass("readonly_area");//快递公司可编辑
                $("#senderNm").attr("readonly",false).removeClass("form_readonly");//寄件人
                $("#senderTelno").attr("readonly",false).removeClass("form_readonly");//联系电话
                $("#senderAddr").attr("readonly",false).removeClass("form_readonly");//联系人地址
                $("#remark").attr("readonly",false).removeClass("form_readonly");//备注
                
    		}else{
    			$("#btSave").data("kendoButton").enable(false);//保存
                $("#btSubmit").data("kendoButton").enable(false);  //提报
                $("#btQuitReceive").data("kendoButton").enable(true);//退票接收
                $("#btCancel").data("kendoButton").enable(false);  //取消
                
                $("#trsfNo").attr("readonly",true).addClass("form_readonly");//快递单号
                $("#expsCmpNm").attr("readonly",true).addClass("form_readonly");//快递公司
                $("#expsCmpNmtd").addClass("readonly_area");//快递公司不可编辑
                $("#senderNm").attr("readonly",true).addClass("form_readonly");//寄件人
                $("#senderTelno").attr("readonly",true).addClass("form_readonly");//联系电话
                $("#senderAddr").attr("readonly",true).addClass("form_readonly");//联系人地址
                $("#remark").attr("readonly",true).addClass("form_readonly");//备注
                
    		}
    		
    	}else{ //发票状态 未开票或空
    		
            $("#btSave").data("kendoButton").enable(true);//保存
            $("#btSubmit").data("kendoButton").enable(true);  //提报
            $("#btQuitReceive").data("kendoButton").enable(false);//退票接收
            $("#btCancel").data("kendoButton").enable(false);  //取消
 
            $("#trsfNo").attr("readonly",false).removeClass("form_readonly");//快递单号
            $("#expsCmpNm").attr("readonly",false).removeClass("form_readonly");//快递公司
            $("#expsCmpNmtd").removeClass("readonly_area");//快递公司可编辑
            $("#senderNm").attr("readonly",false).removeClass("form_readonly");//寄件人
            $("#senderTelno").attr("readonly",false).removeClass("form_readonly");//联系电话
            $("#senderAddr").attr("readonly",false).removeClass("form_readonly");//联系人地址
            $("#remark").attr("readonly",false).removeClass("form_readonly");//备注

           
    	}
    	
    	searchFlag = '01'; //不展示删除的发票
    	$("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.page(1);//发票列表
        
    	//清空退票信息
        $("#trsfNo").val(result.trsfNo);//快递单号
        $("#expsCmpNm").data("kendoExtDropDownList").value(result.expsCmpNm);//快递公司
        $("#senderNm").val(result.senderNm);//寄件人
        $("#senderTelno").val(result.senderTelno);//联系电话
        $("#senderAddr").val(result.senderAddr);//寄件人地址
        $("#remark").val(result.remark);//备注
        
        //如果未保存，则寄件人名称、寄件人联系电话、寄件人地址设置默认值
        if(result.receiptTp==""||result.receiptTp=="null"||result.receiptTp==null){
            $("#senderNm").val($("#senderNmDefault").val());//寄件人
            $("#senderTelno").val($("#senderTelnoDefault").val());//联系电话
            $("#senderAddr").val($("#senderAddrDefault").val());//寄件人地址
        }
        
        
    }
    
    /** 取消 yixd 2021年4月14日14:35:25 **/
    $("#btCancel").kendoButton({
        click:function (e){
        	
        	//9号前可以取消
        	var flag09 = $("#flag09").val();
        	if("Y"== flag09){
        		dms.notification.warning("9号后不可取消");
                return;
        	}else{
        		sendRequest("09");//09取消按钮
        	}
        	
        }
    });
    
    /** 退票接收 yixd 2021年4月14日14:35:25 **/
    $("#btQuitReceive").kendoButton({
        click:function (e){
        	sendRequest("04");//04退票接收
        }
    });
    
    /** 保存 yixd 2021年4月14日14:35:25 **/
    $("#btSave").kendoButton({
        click:function (e){
        	
        	//校验手机号 11位数字
        	var phone = $("#senderTelno").val();
        	
            if(!(/^\d{11}$/.test(phone))){
                dms.notification.warning("手机号码为11位数字，请重填");
                return false; 
            }
            //校验快递单号
            var trsfNo = $("#trsfNo").val();
            var expsCmpNm =  $("#expsCmpNm").val();
            
            if(expsCmpNm=="01"){//如果快递公司是EMS 则校验13位数字
            	if(!(/^\d{13}$/.test(trsfNo))){ 
            		dms.notification.warning("请录入完整、正确的快递信息,快递单号格式为13位数字，请重填");
                    return false; 
                }
            }
        	
        	sendRequest("10");//10保存
        }
    });
    
    /** 提报 yixd 2021年4月14日14:35:25 **/
    $("#btSubmit").kendoButton({
        click:function (e){
        	
        	//9号前可以提报
        	var flag09 = $("#flag09").val();
        	if("Y"== flag09){
        		dms.notification.warning("9号后不可提报");
        	}else{

        		//校验手机号 11位数字
            	var phone = $("#senderTelno").val();
            	
                if(!(/^\d{11}$/.test(phone))){ 
                    dms.notification.warning("手机号码为11位数字，请重填");
                    return false; 
                }
                //校验快递单号
                var trsfNo = $("#trsfNo").val();
                var expsCmpNm =  $("#expsCmpNm").val();
                
                if(expsCmpNm=="01"){//如果快递公司是EMS 则校验13位数字
                	if(!(/^\d{13}$/.test(trsfNo))){ 
                		dms.notification.warning("请录入完整、正确的快递信息,快递单号格式为13位数字，请重填");
                        return false; 
                    }
                }
        		
        		sendRequest("20");//20提报
        	}
        	
        }
    });
    
    //校验手机号
    function checkPhone(){ 
        var phone = $("#senderTelnoDefault").val();
        if(!(/^1(3|4|5|6|7|8|9)d{9}$/.test(phone))){ 
            alert("手机号码为11位数字，请重填");  
            return false; 
        } 
    }
    //校验快递单号
    function checkTrsfNo(){ 
        var trsfNo = $("#trsfNo").val();
        if(!(/^\d{n}$/.test(trsfNo))){ 
            alert("快递单号格式为13位数字，请重填");  
            return false; 
        } 
    }
    
    //取消、退票接收、保存、提报操作
    sendRequest = function (receiptTp){
    	//1、判断结算报表编号是否存在，如果不存在，不可以提报和保存
    	if(dms.string.isEmpty(rowinvcNo)){
            //dms.notification.warning("<spring:message code='global.lbl.fosterNo' var='fosterNo' /><spring:message code='global.info.isNotNull' arguments='${fosterNo}' />");
            return;
        }
    	//2、判断取消、退票接收、保存、提报
    	if("09"== receiptTp){
    		//取消
    		var paramsReceive =  $.extend(
                {"sinvcNo":rowinvcNo}//结算报表编号
               ,{"sreceiptTp":"09"}//取消
            );
    		postUpdateReceiptTp(paramsReceive);//提交信息
    	}else if("04"== receiptTp){
    		//退票接收
    		var paramsReceive =  $.extend(
                {"sinvcNo":rowinvcNo}//结算报表编号
               ,{"sreceiptTp":"04"}//退票接收
            );
    		postUpdateReceiptTp(paramsReceive);//提交信息
    	}else if("10"== receiptTp){
    		//保存
    		if(dms.string.isEmpty($("#failMsg").val())){
                /* dms.notification.warning("退票原因<spring:message code='global.info.isNotNull' arguments='${fosterNo}' />");
                return; */
            }
    		var paramsSave =  $.extend(
                {"sinvcNo":rowinvcNo}//结算报表编号
               ,{"sreceiptTp":"10"}//开票状态--01未开票  10标记为保存按钮
               ,{"strsfTp":"01"}//快递状态--01未邮寄
               ,{"strsfNo":$("#trsfNo").val()}//快递单号
               ,{"sexpsCmpNm":$("#expsCmpNm").val()}//快递公司
               ,{"ssenderNm":$("#senderNm").val()}//寄件人
               ,{"ssenderTelno":$("#senderTelno").val()}//寄件人电话
               ,{"ssenderAddr":$("#senderAddr").val()}//寄件人地址
               ,{"sremark":$("#remark").val()}//备注
            );
    		postUpdateReceiptTp(paramsSave);//提交信息
    	}else if("20"== receiptTp){
    		//提报
    		if(dms.string.isEmpty($("#failMsg").val())){
                /* dms.notification.warning("退票原因<spring:message code='global.info.isNotNull' arguments='${fosterNo}' />");
                return; */
            }
    		var paramsSubmit =  $.extend(
                {"sinvcNo":rowinvcNo}//结算报表编号
               ,{"sreceiptTp":"20"}//开票状态--后台变为02未开票  前台20标记为提报
               ,{"strsfTp":"02"}//快递状态--02已邮寄
               ,{"strsfNo":$("#trsfNo").val()}//快递单号
               ,{"sexpsCmpNm":$("#expsCmpNm").val()}//快递公司
               ,{"ssenderNm":$("#senderNm").val()}//寄件人
               ,{"ssenderTelno":$("#senderTelno").val()}//寄件人电话
               ,{"ssenderAddr":$("#senderAddr").val()}//寄件人地址
               ,{"sremark":$("#remark").val()}//备注
            );
    		postUpdateReceiptTp(paramsSubmit);//提交信息
    	}
    	
    }
    //保存、提报、取消、退票接收
    postUpdateReceiptTp = function(params){
    	$.ajax({
            url:"<c:url value='/ser/wac/claimlnvoice/updateClaimInvoiceReception.do' />"
            ,data:JSON.stringify(params)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
            	 dms.notification.error("保存异常！");//
            	 $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                 $("#gridMaster").data("kendoExtGrid").dataSource.page(1);//列表重新加载
                 searchFlag = '01'; //不展示删除的发票
                 $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
                 $("#gridDetail").data("kendoExtGrid").dataSource.page(1);//列表重新加载
            }
            ,success:function(result){
            	if(result!="success"){
            		dms.notification.warning(result);
            	}else{
            		dms.notification.success("<spring:message code='global.info.success' />");
            		$("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                    $("#gridMaster").data("kendoExtGrid").dataSource.page(1);//列表重新加载
                    searchFlag = '01'; //不展示删除的发票
                    $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
                    $("#gridDetail").data("kendoExtGrid").dataSource.page(1);//列表重新加载
            	}
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    }
    
    
 // 删除发票
 $("#btnDetailDel").kendoButton({
        click:function(e) {
        	
        	//searchFlag = '01'; //不展示删除的发票
            var grid = $("#gridDetail").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

            var paramsDel =  $.extend(
                    {"settlementNo":rowinvcNo}//结算报表编号
                   ,{"receiptCd":receiptCd}   //发票cd
                   ,{"receiptNo":receiptNo}   //发票no
                );
            delInvoiceDetail(paramsDel);
        }
    });
   
  //删除发票方法 
  delInvoiceDetail = function(params){
    	$.ajax({
            url:"<c:url value='/ser/wac/claimlnvoice/delClaimInvoiceDetailReception.do' />"
            ,data:JSON.stringify(params)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
            	 dms.notification.error("删除异常！");
            	 searchFlag = '01'; //不展示删除的发票
                 $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
                 $("#gridDetail").data("kendoExtGrid").dataSource.page(1);//列表重新加载
            }
            ,success:function(result){
            	if(result!="success"){
            		dms.notification.warning(result);
            	}else{
            		dms.notification.success("<spring:message code='global.info.success' />");
            	}
            	searchFlag = '01'; //不展示删除的发票
                $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
                $("#gridDetail").data("kendoExtGrid").dataSource.page(1);//列表重新加载
            }
            ,beforeSend:function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete:function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    }  
    
    
  //查询操作
    $("#btnSearch").kendoButton({
        click:function(e){
        	
        	rowinvcNo = "";//发票信息码为空
            //加载结算单列表和发票列表
            $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
            $("#gridMaster").data("kendoExtGrid").dataSource.read();
            searchFlag = '01'; //不展示删除的发票
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.read();
            //清空退票信息
            $("#trsfNo").val("");//快递单号
            $("#expsCmpNm").data("kendoExtDropDownList").value("");//快递公司
            $("#senderNm").val("");//寄件人
            $("#senderTelno").val("");//联系电话
            $("#senderAddr").val("");//寄件人地址
            $("#remark").val("");//寄件人地址
            
            //相关显示出来
            $("#trsfNo").attr("readonly",false).removeClass("form_readonly");//快递单号可编辑
            $("#expsCmpNm").attr("readonly",false).removeClass("form_readonly");//快递公司可编辑
            $("#expsCmpNmtd").removeClass("readonly_area");//快递公司可编辑
            $("#senderNm").attr("readonly",false).removeClass("form_readonly");//寄件人可编辑
            $("#senderTelno").attr("readonly",false).removeClass("form_readonly");//联系电话可编辑
            $("#senderAddr").attr("readonly",false).removeClass("form_readonly");//寄件人地址可编辑
            $("#remark").attr("readonly",false).removeClass("form_readonly");//寄件人地址可编辑
            
            
        }
    });
  
  //明细查询操作
    $("#btnSearchDetail").kendoButton({
        click:function(e){
        	searchFlag = '05'; //展示删除的发票
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.read();
        }
    });

  //Excel下载操作
    $("#btnExcelExport").kendoButton({
        click:function(e){
        	 dms.ajax.excelExport({
                 "beanName"         :"claimInvoiceReceptionService"
                 ,"templateFile"    :"ClaimInvoiceList_Tpl.xlsx"
                 ,"fileName"        :"索赔发票明细列表.xlsx"
                 ,"sreceiptTp"		: $("#receiptTp").val()//开票状态
                 ,"sinvcNo"			: $("#invcNo").val()//结算报表单号
                 ,"sinvcsFromDt"	: $("#sinvcsFromDt").val()//结算报表开始日期
                 ,"sinvcsToDt"		: $("#sinvcsToDt").val()//结算报表结束日期
                 ,"strsfTp"			: $("#trsfTp").val()//快递状态
             });	
        }
    });
   
	
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
   
        <section class="group">
        	 <!--  查询区域信息开始 -->
            <div class="header_area">
                 <h1 class="title_basic"><spring:message code="ser.title.wclaimInvoiceReceipt" /></h1>
                <div class="btn_right">
   				<dms:access viewId="VIEW-I-13292" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /></button>
       			</dms:access>  <!-- 查询 -->
                <dms:access viewId="VIEW-I-13293" hasPermission="${dms:getPermissionMask('READ')}"> 
                   <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                </dms:access> <!-- 下载 -->
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
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th><!-- 经销商代码 -->
                            <td>
                                <input id="dlrCd" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.dlrNm' /></th><!-- 经销商名称 -->
                            <td>
                                <input id="dlrNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.InvoiceClaimState" /></th> <!-- 开票状态 -->
                            <td>
                                <input type="text" id="receiptTp" name="receiptTp" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            
                        </tr>
                        <tr>
                        	<th scope="row"><spring:message code="ser.lbl.settlementStatementNo" /></th><!-- 结算报表编号 -->
                            <td>
                                <input id="invcNo" type="text" class="form_input" />
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.invcDt" /></th><!-- 结算报表年月? -->
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
               		 <dms:access viewId="VIEW-I-13295" hasPermission="${dms:getPermissionMask('READ')}"> 
                     <button type="button" class="btn_m" id="btnQuit" ><spring:message code="ser.mnu.refund" /></button><!-- 退票 -->
                     </dms:access> 
                     <dms:access viewId="VIEW-I-13294" hasPermission="${dms:getPermissionMask('READ')}"> 
                     <button type="button" class="btn_m" id="btReceive" ><spring:message code="global.lbl.receipt" /></button><!-- 收票 -->
                      </dms:access>
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
            </div>
            <!-- 发票信息列表 -->
            <div class="table_grid">
                <div id="gridDetail" class="grid"></div>
            </div>
        </section>
        <!-- 发票信息结束 -->
        
        <!-- 退票信息开始 -->
        <section class="group">
        	 <!--  查询区域信息开始 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.wpassengerList" /></h2>
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
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.wrefundReason" /></span></th><!-- 退票原因 -->
                            <td id="failMsgtd"><!-- 置灰操作 -->
                                 <input type="text" id="failMsg" name="failMsg" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.wrefundNote" /></th><!-- 退票备注 -->
                            <td>
                                <input id="failRemark" type="text" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                        	<th scope="row"><spring:message code="ser.lbl.trsfNo" /></th><!-- 快递单号 -->
                            <td>
                                <input id="trsfNo" type="text" class="form_input form_readonly" readonly/>
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.trsfCmpCd" /></th><!-- 快递公司 -->
                        	<td class="readonly_area" id="expsCmpNmtd">
                            	<input type="text" id="expsCmpNm" name="expsCmpNm" class="form_comboBox" readonly data-json-obj="true" />
                        	</td>
                        	<th scope="row"><spring:message code="ser.lbl.senderId" /></th> <!-- 寄件人 -->
                            <td>
                                <input id="senderNm" type="text" class="form_input form_readonly" readonly/>
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.telNumber" /></th> <!-- 联系电话 -->
                            <td>
                                <input id="senderTelno" type="text" class="form_input form_readonly" readonly/>
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
var rowinvcNo;//默认的结算单信息，主要是为了接收和退票之后的返显
var gridRow ;//默认不选
//发票状态下拉列表赋值 wangc 2021年4月12日11:04:53
var receiptTpDsList = [];
<c:forEach var="obj" items="${receiptTpDs}">
	receiptTpDsList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var receiptTpMap = dms.data.arrayToMap(receiptTpDsList, function(obj){return obj.cmmCd;});
//快递状态下拉列表赋值 wangc 2021年4月12日11:04:53
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
//快递公司下拉列表赋值
var expsCmpNmList = [];
<c:forEach var="obj" items="${expsCmpNmDs}">
	expsCmpNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var expsCmpNmDsMap = dms.data.arrayToMap(expsCmpNmList, function(obj){return obj.cmmCd;});
//是否取消下拉列表赋值 wangc 2021年4月14日17:22:15
var cancelYnList = [];
<c:forEach var="obj" items="${cancelYnDs}">
	cancelYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cancelYnMap = dms.data.arrayToMap(cancelYnList, function(obj){return obj.cmmCd;});
//js初始化方法 wangc 2021年4月12日11:07:22
$(document).ready(function (e){
	//发票状态集合存到列表  wangc 2021年4月12日11:21:15
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
    setexpsCmpNmDsMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(expsCmpNmDsMap[value] != undefined)
            resultVal =  expsCmpNmDsMap[value].cmmCdNm;
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
       ,optionLabel:" "  // 선택
       ,index:0
       ,valuePrimitive:true
    });

    /** 退票原因下拉列表 **/
    $("#failMsg").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:failMsgList
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
    
 // 页面结算单表格加载  wangc 2021年4月12日14:12:33
    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1412-210412"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimInvoice/selectClaimInvoiceReception.do' />"
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

                         //search的查询条件  wangc 2021年4月12日14:22:12
                         params["sdlrCd"]        = $("#dlrCd").val();//经销商代码
                         params["sdlrNm"]        = $("#dlrNm").val();//经销商名称
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
                       ,dlrCd:{type:"string" }        	//经销商代码
                       ,dlrNm:{type:"string" }        	//经销商名称
                       ,invcNo:{type:"string" }   	  	//结算报表编号
                       ,receiptTp:{type:"string" }   	//开票状态
                       ,recipDt:{type:"date" }     		//收票日期
                       ,fallDt:{type:"date" }     		//退票日期
                       ,invcDt:{type:"date" }   		//结算报表年月
                       ,confirmTotAmt:{type:"number" }  //确定金额
                       ,ddctTotAmt:{type:"number" } 	//扣减金额
                       ,ddctTotAmt:{type:"number"}		//结算金额
                       ,trsfNo:{type:"string" }   		//快递单号
                       ,expsCmpNm:{type:"string" }		//快递公司
                       ,trsfTp:{type:"string" }			//快递状态
                       ,failMsg:{type:"string" }        //退票原因
                       ,senderNm:{type:"string" }		//寄件人
                       ,senderTelno:{type:"string" }	//联系电话
                       ,senderAddr:{type:"string" }		//寄件人地址
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
              e.sender.select(e.sender.tbody.find("tr")[gridRow]);//返显列表框
            }
        }
        ,change:function (e){
        	 var selectedVal = this.dataItem(this.select());//获取选中的列表数据行数据
        	 gridRow = $("#gridMaster").data("kendoExtGrid").select().index();//获取选中的列
        	 rowinvcNo = selectedVal.invcNo;//给结算报表编号赋值，为下一步退票和接收做准备
        	 //给退票信息赋值
        	 setResultData(selectedVal);
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"dlrCd",title:"<spring:message code='global.lbl.dlrCd' />", width:110, attributes :{"class":"al"} }//经销商代码
               ,{field:"dlrNm",title:"<spring:message code='global.lbl.dlrNm' />", width:110, attributes :{"class":"al"} }//经销商名称
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
               ,{field:"recipDt" , title:"<spring:message code='ser.lbl.wrefundDt' />", width:125
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//收票日期
               ,{field:"failDt" , title:"<spring:message code='ser.lbl.wcheckDt' />", width:125
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//退票日期
               ,{field:"invcDt" , title:"<spring:message code='ser.lbl.invcDt' />", width:125
                   , attributes :{"class":"ac"}
                   , format:"{0:yyyy-MM}"
                }//结算报表年月
               ,{field:"confirmTotAmt",title:"<spring:message code='ser.lbl.invcClaimTotAmt' />", width:110, attributes :{"class":"al"} }//确定金额
               ,{field:"ddctTotAmt",title:"<spring:message code='crm.lbl.payBackAmt' />", width:110, attributes :{"class":"al"} }//扣减金额
               ,{field:"invcClaimTotAmt",title:"<spring:message code='ser.lbl.calcAmt' />", width:110, attributes :{"class":"al"} }//结算金额
               ,{field:"trsfNo",title:"<spring:message code='ser.lbl.trsfNo' />", width:110, attributes :{"class":"al"} }//快递单号
               ,{field:"expsCmpNm",title:"<spring:message code='ser.lbl.trsfCmpCd' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setexpsCmpNmDsMap(expsCmpNm)#"
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
               ,{field:"trsfTp",title:"<spring:message code='ser.lbl.wcourierStatus' />", width:80
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
                       $('<span class="k-invalid-msg" data-for="trsfTp"></span>').appendTo(container);
                      }
                 }//快递状态
               ,{field:"failMsg",title:"<spring:message code='ser.lbl.wrefundReason' />", width:80
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
               ,{field:"failRemark",title:"<spring:message code='ser.lbl.wrefundNote' />", width:110, attributes :{"class":"al"} }//退票备注
               ,{field:"senderNm",title:"<spring:message code='ser.lbl.senderId' />", width:110, attributes :{"class":"al"} }//寄件人
               ,{field:"senderTelno",title:"<spring:message code='sal.lbl.telNumber' />", width:110, attributes :{"class":"al"} }//联系电话
               ,{field:"senderAddr",title:"<spring:message code='sal.lbl.wmailingAddress' />", width:110, attributes :{"class":"al"} }//寄件人地址
               ,{field:"cancelYn",title:"<spring:message code='ser.lbl.wcancelYn' />", width:80
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
             ]
    });
 
    //页面发票信息表格加载  wangc 2021年4月12日14:12:33
    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1608-210412"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimInvoice/selectClaimInvoiceDetail.do' />"
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

                         //search的查询条件  wangc 2021年4月12日14:22:12
                         params["settlementNo"]       = rowinvcNo;//结算报表单号
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
                       ,remark:{type:"string" }		    //备注
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
        	
        }
        ,change:function (e){
        	 
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"receiptCd",title:"<spring:message code='ser.lbl.InvoiceClaimNo' />", width:110, attributes :{"class":"al"} }//发票号
               ,{field:"buyNm",title:"<spring:message code='ser.lbl.InvoiceClaimTitle' />", width:110, attributes :{"class":"al"} }//发票抬头
               ,{field:"taxpayerIdCd",title:"<spring:message code='sal.lbl.PinNo' />", width:110, attributes :{"class":"al"} }//纳税人识别号
               ,{field:"sumAmt",title:"<spring:message code='ser.lbl.InvoiceClaimAmt' />", width:110, attributes :{"class":"al"} }//发票金额
               ,{field:"receiptIssDt" , title:"<spring:message code='crm.lbl.invoiceDt' />", width:125
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }//发票日期
               ,{field:"remark",title:"<spring:message code='crm.lbl.remark' />", width:110, attributes :{"class":"al"} }//备注
             ]
    });
    
    //结算单列表点击之后赋值退票信息
    setResultData = function (result){
    	//如果是已经退票了，则退票信息置灰，按钮置灰，否则不用置灰
    	if(result.receiptTp=="03"){
    		//按钮隐藏
            $("#btReceive").data("kendoButton").enable(false);//收票隐藏
            $("#btnQuit").data("kendoButton").enable(false);  //退票隐藏
          
            $("#failMsg").attr("readonly",true).addClass("form_readonly");//退票原因不可编辑
            $("#failMsgtd").addClass("readonly_area");//退票原因不可编辑
            $("#failRemark").attr("readonly",true).addClass("form_readonly");///退票备注不可编辑
            /* $("#trsfNo").attr("readonly",true).addClass("form_readonly");//快递单号不可编辑
            $("#expsCmpNm").attr("readonly",true).addClass("form_readonly");//快递公司不可编辑
            $("#senderNm").attr("readonly",true).addClass("form_readonly");//寄件人不可编辑
            $("#senderTelno").attr("readonly",true).addClass("form_readonly");//联系电话不可编辑 */
    	}else{
    		//按钮显示
            $("#btReceive").data("kendoButton").enable(true);//收票显示
            $("#btnQuit").data("kendoButton").enable(true);  //退票显示
            $("#failMsg").attr("readonly",false).removeClass("form_readonly");;//退票原因可编辑
            $("#failMsgtd").removeClass("readonly_area");//退票原因可编辑
            $("#failRemark").attr("readonly",false).removeClass("form_readonly");///退票备注可编辑
           /*  $("#trsfNo").attr("readonly",false).removeClass("form_readonly");//快递单号可编辑
            $("#expsCmpNm").attr("readonly",false).removeClass("form_readonly");//快递公司可编辑
            $("#senderNm").attr("readonly",false).removeClass("form_readonly");//寄件人可编辑
            $("#senderTelno").attr("readonly",false).removeClass("form_readonly");//联系电话可编辑 */
            
          
           
    	}
    	//加载发票列表
    	$("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.page(1);//发票列表
    	//清空退票信息
        $("#failMsg").data("kendoExtDropDownList").value(result.failMsg);//退票原因
        $("#failRemark").val(result.failRemark);//退票备注
        $("#trsfNo").val(result.trsfNo);//快递单号
        $("#expsCmpNm").data("kendoExtDropDownList").value(result.expsCmpNm);//快递公司
        $("#senderNm").val(result.senderNm);//寄件人
        $("#senderTelno").val(result.senderTelno);//联系电话
        
    }
    
    /** 退票 wangc 2021年4月12日15:57:21**/
    $("#btnQuit").kendoButton({
        click:function(e){
        	sendRequest("03");//收票/退票操作 01：未开票  02：已开票 03：已退票
        }
    });



    /** 收票  wangc 2021年4月12日15:57:25 **/
    $("#btReceive").kendoButton({
        click:function (e){
        	sendRequest("02");//收票/退票操作 01：未开票  02：已开票 03：已退票
        }
    });
    
    //收票/退票操作
    sendRequest = function (receiptTp){
    	//1、判断结算报表编号是否存在，如果不存在，不可以提报和保存
    	if(dms.string.isEmpty(rowinvcNo)){
            dms.notification.warning("<spring:message code='ser.error.selectinvc' />");
            return;
        }
    	//2、判断是收票还是退票
    	if("02"== receiptTp){
    		//收票
    		var paramsReceive =  $.extend(
                {"sinvcNo":rowinvcNo}//结算报表编号
               ,{"sreceiptTp":"02"}//开票状态--02准备收票
            );
    		postUpdateReceiptTp(paramsReceive);//提交信息
    	}else if("03"== receiptTp){
    		//退票
    		if(dms.string.isEmpty($("#failMsg").val())){
                dms.notification.warning("<spring:message code='ser.lbl.wrefundReason' var='wrefundReason' /><spring:message code='global.info.isNotNull' arguments='${wrefundReason}' />");
                return;
            }//退票原因不能为空
    		var paramsQuit =  $.extend(
                {"sinvcNo":rowinvcNo}//结算报表编号
               ,{"sreceiptTp":"03"}//开票状态--03准备退票
               ,{"sfailMsg":$("#failMsg").val()}//退票原因
               ,{"sfailRemark":$("#failRemark").val()}//退票备注
               ,{"strsfNo":$("#trsfNo").val()}//快递单号
               ,{"sexpsCmpNm":$("#expsCmpNm").val()}//快递公司
               ,{"ssenderNm":$("#senderNm").val()}//寄件人
               ,{"ssenderTelno":$("#senderTelno").val()}//联系电话
            );
    		postUpdateReceiptTp(paramsQuit);//提交信息
    	}
    	
    }
    //修改结算单收票/退票状态
    postUpdateReceiptTp = function(params){
    	$.ajax({
            url:"<c:url value='/ser/wac/claimInvoice/updateClaimInvoiceReception.do' />"
            ,data:JSON.stringify(params)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
            	 dms.notification.error("保存异常！");//?
            }
            ,success:function(result){
            	if(result!="success"){
            		dms.notification.warning(result);
            	}else{
            		dms.notification.success("<spring:message code='global.info.success' />");
            	}
                $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
                $("#gridMaster").data("kendoExtGrid").dataSource.page(1);//列表重新加载
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
        	gridRow = -1;
            //加载结算单列表和发票列表
            $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
            $("#gridMaster").data("kendoExtGrid").dataSource.read();
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.read();
            //清空退票信息
            $("#failMsg").data("kendoExtDropDownList").value("");//退票原因
            $("#failRemark").val("");//退票备注
            $("#trsfNo").val("");//快递单号
            $("#expsCmpNm").data("kendoExtDropDownList").value("");//快递公司
            $("#senderNm").val("");//寄件人
            $("#senderTelno").val("");//联系电话
            //相关显示出来
            $("#btReceive").data("kendoButton").enable(true);//收票显示
            $("#btnQuit").data("kendoButton").enable(true);  //退票显示
            $("#failMsg").attr("readonly",false).removeClass("form_readonly");;//退票原因可编辑
            $("#failMsgtd").removeClass("readonly_area");//退票原因可编辑
            $("#failRemark").attr("readonly",false).removeClass("form_readonly");///退票备注可编辑
           /*  $("#trsfNo").attr("readonly",false).removeClass("form_readonly");//快递单号可编辑
            $("#expsCmpNm").attr("readonly",false).removeClass("form_readonly");//快递公司可编辑
            $("#senderNm").attr("readonly",false).removeClass("form_readonly");//寄件人可编辑
            $("#senderTelno").attr("readonly",false).removeClass("form_readonly");//联系电话可编辑 */
        }
    });

    //Excel下载操作  wangc 2021年4月16日09:29:31
    $("#btnExcelExport").kendoButton({
        click:function(e){
        	 dms.ajax.excelExport({
                 "beanName"         :"claimInvoiceReceptionService"
                 ,"templateFile"    :"ClaimInvoiceList_Tpl.xlsx"
                 ,"fileName"        :"<spring:message code='ser.title.wfinalStatementList' />.xlsx"
                 ,"sdlrCd"			: $("#dlrCd").val()//经销商代码
                 ,"sdlrNm"			: $("#dlrNm").val()//经销商名称
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
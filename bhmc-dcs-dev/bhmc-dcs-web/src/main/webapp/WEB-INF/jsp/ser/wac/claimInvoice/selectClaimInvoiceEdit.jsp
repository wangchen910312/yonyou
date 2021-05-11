<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 시승차량 심사 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='ser.title.InvoiceClaimEdit' /></h1> <!-- 索赔发票编辑标题 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-I-13297" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnExcelExport" class="btn_m" type="button"><spring:message code='global.btn.excelDownload' /></button>    <!-- 下载Excel -->
            </dms:access>
            <dms:access viewId="VIEW-I-13298" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search" type="button"><spring:message code='global.btn.search' /></button>          <!-- 查询 -->
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 16%;">
                    <col style="width: 16%;">
                    <col style="width: 10%;">
                    <col style="width: 19%;">
                    <col style="width: 10%;">
                    <col style="width: 17%;">
                    <col style="width: 15%;">
                </colgroup>
                <tbody>
                   <tr>
                        <th scope="row"><spring:message code='global.lbl.dlrCd' /></th><!-- 经销商代码 -->
                        <td>
                            <input id="sDlrCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlrNm' /></th><!-- 经销商名称 -->
                        <td>
                            <input id="sDlrNm" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.InvoiceClaimNo' /></th><!-- 发票号 -->
                        <td>
                            <input id="sReceiptNo" type="text" class="form_input">
                        </td>

                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.claimSettlementNo' /></th><!-- 结算单号 -->
                        <td>
                            <input id="sSettlementNo" class="form_input">
                        </td>
                        <th scope="row"><span><spring:message code="ser.lbl.invcDt" /></span></th> <!-- 报表结算年月 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sInvcStartDt" id="sInvcStartDt"  class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sInvcEndDt" id="sInvcEndDt"  class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.InvoiceClaimState' /></th>    <!-- 开票状态 -->
                        <td>
                            <input id="sReceiptTp" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.InvoiceClaimList' /></h2> <!-- 发票列表列表 标题 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-I-13299" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnSave" class="btn_s" type="button"><spring:message code="global.btn.save" /></button>   <!-- 保存按钮 -->
                </dms:access>
            </div>
        </div>
        <!--发票显示表格-->
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>


    </section>
</div>

<script type="text/javascript">
//获取系统时间
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

// 登录经销商
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";

// 登陆人
var userId = "${userId}";
var userNm = "${userNm}";   //获取当前登录用户

//SEF004   发票状态 invoiceStatusList
var invoiceStatusList = [];
var invoiceStatusObj = {};
<c:forEach var="obj" items="${invoiceStatusList}">
    <c:if test="${obj.cmmCd ne 'A'}">
        invoiceStatusList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        invoiceStatusObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

// 报表结算年月start
$("#sInvcStartDt").kendoExtMaskedDatePicker({
    start:"year"
    ,depth:"year"
    ,format:"yyyy-MM"
    ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
});

// 报表结算年月end
$("#sInvcEndDt").kendoExtMaskedDatePicker({
    start:"year"
    ,depth:"year"
    ,format:"yyyy-MM"
    ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
});

$(document).ready(function() {

    // 查询按钮 日期选择校验
    $("#btnSearch").kendoButton({
        enable:true,
        click:function(e){

            if( !($("#sInvcStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                //判断开始和结束是否都有值
                if($("#sInvcStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //提示：请输入日期
                    dms.notification.warning("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='global.info.validation.required' arguments='${evalDt}' />");
                    return false;
                }else{
                    //将当前结束月+1
                    let endMonth = $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value().getMonth();
                    $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value().setMonth(endMonth + 1);
                }
            }
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //保存按钮：点击保存按钮执行更新发票备注
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("updateList");
            if (grid.cudDataLength == 0) {
                //提示: 没有被修改信息
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            //声明待更新数组
            let claimInvoiceEditMap = {
                updatedList: []
            };
            //取出表格中已被更新的行
            let updated = saveData._updated;
            //汉字校验正则
            let ch_reg = "/[\u4E00-\u9FA5]/g"; //筛选包含汉字的字符
            //为待更新数组存值
            for(let i = 0; i < updated.length; i++){
                updated[i].settlementNo = updated[i].settlementNo.trim();
                //TODO:校验输入的值不能出现汉字
                if(ch_reg.test(updated[i].settlementNo)){
                    //提示: 不能输入中文
                    dms.notification.warning("<spring:message code='ser.info.checkingIfExistsChinese'/>");
                    return;
                }
                //结算单号（索赔结算单信息）的信息编码
                if(updated[i].settlementNo.length > 30){
                    //提示: 备注信息长度过长
                    dms.notification.warning("<spring:message code='ser.info.checkingLengthWithin30'/>");
                    return;
                }
                //创建单个更新对象
                let claimInvoiceEditVO = {
                    settlementNo: updated[i].settlementNo,
                    updtUsrId: userId,
                    receiptNo: updated[i].receiptNo,
                    receiptCd: updated[i].receiptCd,
                    receiptId: updated[i].receiptId,
                    dlrCd: updated[i].dlrCd,
                    invcNo: updated[i].invcNo
                };
                //存入更新数组
                claimInvoiceEditMap.updatedList.push(claimInvoiceEditVO);
            }
            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/wac/claimInvoice/updateClaimInvoiceByInvcNo.do' />"
                    ,data:JSON.stringify(claimInvoiceEditMap)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data, jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        if(data == '1'){
                            //表示更改备注已完成
                            //提示成功信息
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }else if(data == '-1'){
                            //提示失败信息
                            dms.notification.error("<spring:message code='par.err.claimUpdateBillNoMsgResult12Code'/>");
                        }else{
                            //提示哪些发票号没有修改成功
                            dms.notification.warning("<spring:message code='ser.error.InvoiceClaimEditFail'/>\n" + data);
                        }
                    }
                });
            }else{
                //提示错误信息
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });


    // 开票状态下拉框
    $("#sReceiptTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:invoiceStatusList
       ,optionLabel:" "
    });
    //设置默认值 未开票
    $("#sReceiptTp").data("kendoExtDropDownList").value("01");

    //下载excel按钮
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"claimInvoiceEditService"
                ,"templateFile":"ClaimInvoiceEditList_Tpl.xls"
                ,"fileName":"<spring:message code='ser.title.InvoiceClaimEditList'/>.xls"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sDlrNm":$("#sDlrNm").val()
                ,"sReceiptNo":$("#sReceiptNo").val()
                ,"sSettlementNo":$("#sSettlementNo").val()
                ,"sReceiptTp":$("#sReceiptTp").val()
                ,"sInvcStartDt":kendo.toString(kendo.parseDate($("#sInvcStartDt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                ,"sInvcEndDt":kendo.toString(kendo.parseDate($("#sInvcEndDt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
            });
        }
    });


    //  发票列表 表格展示
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1329-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimInvoice/selectClaimInvoiceEdit.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();                  //经销商代码
                        params["sDlrNm"] = $("#sDlrNm").val();                  //经销商名称
                        params["sReceiptNo"] = $("#sReceiptNo").val();          //发票号
                        params["sSettlementNo"] = $("#sSettlementNo").val();   //结算单号
                        params["sReceiptTp"] = $("#sReceiptTp").val();       //开票状态

                        // 报表结算年月
                        params["sInvcStartDt"] = $("#sInvcStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sInvcEndDt"]   = $("#sInvcEndDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"receiptNo",
                    fields:{
                        rnum:{type:"string", editable:false }           //序号
                        ,dlrCd:{type:"string", editable:false }        //经销商代码
                        ,dlrNm:{type:"string", editable:false }          //经销商名称
                        ,settlementNo:{type:"string", editable:true }     //结算单号
                        ,receiptNo :{type:"string", editable:false }      //发票号
                        ,receiptCd :{type:"string", editable:false }      //发票代码
                        ,receiptId :{type:"string", editable:false }     //发票ID
                        ,receiptTp :{type:"string", editable:false }     //开票状态
                        ,buyNm :{type:"string", editable:false }         //发票抬头
                        ,taxpayerIdCd :{type:"string", editable:false } //纳税人识别号
                        ,scanSumAmt:{type:"string", editable:false }    //发票金额
                        ,invcNo:{type:"string", editable:false }    //索赔单编号
                    }
                }
            }
        }

       ,height:730
       ,multiSelectWithCheckbox:false
       ,autoBind   :false
       ,navigatable:false
       ,selectable :"row"
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[

           {field:"rnum", title:"<spring:message code='global.lbl.no' />",width:62,attributes:{ "class":"ac"}}                      // 序号
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:95, attributes:{"class":"ac"}}                // 经销商代码
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />",width:286, attributes:{"class":"al"}}	                // 经销商名称
          ,{field:"settlementNo", title:"<spring:message code='ser.lbl.claimSettlementNo' />", width:193, attributes:{"class":"al"}}  // 结算单号
          ,{field:"receiptNo", title:"<spring:message code='ser.lbl.InvoiceClaimNo' />", width:116, attributes:{"class":"al"}}       // 发票号
          ,{field:"receiptCd", title:"<spring:message code='sal.lbl.ReceiptCd' />", width:193, attributes:{"class":"al"}}       // 发票代码
          ,{field:"receiptTp",title:"<spring:message code='ser.lbl.InvoiceClaimState' />",width:102,attributes:{"class":"ac"}        //开票状态
             ,template:"#= invoiceStatusObj[receiptTp] #"
          }
          ,{field:"buyNm", title:"<spring:message code='ser.lbl.InvoiceClaimTitle' />", width:316, attributes:{"class":"al"}}         // 发票抬头
          ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:237, attributes:{"class":"al"}}        // 纳税人识别号
          ,{field:"scanSumAmt", title:"<spring:message code='ser.lbl.InvoiceClaimAmt' />", width:127, attributes:{"class":"al"}}      // 发票金额
          ,{field:"invcNo", hidden: true}      // 索赔单编号
          ,{field:"receiptId", hidden: true}      // 发票ID

       ]
   });

    //行单击方法，对是否允许编辑进行判断
    $("#grid").on("click", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        //判断当前行数据状态是否为未开票，是则允许编辑，否则不允许编辑
        let isEditabled = selectedItem.receiptTp == "01" ? true : false;
        selectedItem.fields.settlementNo.editable = isEditabled;
    });

});

</script>
<!-- //script -->

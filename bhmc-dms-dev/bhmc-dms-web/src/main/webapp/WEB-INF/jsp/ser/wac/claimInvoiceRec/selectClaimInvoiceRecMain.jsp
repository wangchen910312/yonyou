<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 시승차량 심사 -->
<div id="resizableContainer" class="content">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='ser.title.claimInvoiceProceeds' /></h1> <!-- 索赔发票收款标题 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13341" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search" type="button"><spring:message code='global.btn.search' /></button>          <!-- 查询 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13340" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnExcelExport" class="btn_m" type="button"><spring:message code='global.btn.excelDownload' /></button>    <!-- 下载Excel -->
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:16%;">
                    <col style="width:16%;">
                    <col style="width:16%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.invcNo' /></th><!-- 结算单号 -->
                        <td>
                            <input id="sInvcNo" class="form_input">
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
                        <th scope="row"><spring:message code="ser.lbl.remittanceStatus" /></th>    <!-- 汇款状态 -->
                        <td>
                            <input id="sPaymTp" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.title.settlementList" /></h2> <!-- 结算单列表 标题 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13342" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnRec" class="btn_s" type="button"><spring:message code="ser.btn.proceeds" /></button>   <!-- 收款按钮 -->
                </dms:access>
            </div>
        </div>
        <!--结算单列表 显示表格-->
        <div class="table_grid">
            <div id="settlementGrid" class="resizable_grid"></div>
        </div>

        <!--隐藏框，存放主单信息，用于查询该主单发票信息-->
        <div style="display:none;">
            <input type="text" id="rowDlrCd" name="rowDlrCd" />
            <input type="text" id="rowInvcNo" name="rowInvcNo" />
        </div>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.title.InvoiceClaimInfo" /></h2> <!-- 发票信息列表 标题 -->
        </div>
        <!--结算单列表 显示表格-->
        <div class="table_grid">
            <div id="invoiceGrid" class="resizable_grid"></div>
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
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 登录经销商
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";

// 登陆人
var userId = "${userId}";
var userNm = "${userNm}";   //获取当前登录用户

//SEF006   汇款状态 remittanceStateList
var remittanceStateList = [];
var remittanceStateObj = {};
<c:forEach var="obj" items="${remittanceStateList}">
    <c:if test="${obj.cmmCd ne 'A'}">
        remittanceStateList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        remittanceStateObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

    //搜索按钮恢复 定时器
    function setSearchBtnTimeout(){
        setTimeout(function(){
            //恢复搜索按钮搜索按钮
            $("#btnSearch").attr("disabled",false);
        },3000);
    }

    // 查询按钮 日期选择校验
    $("#btnSearch").kendoButton({
        enable:true,
        click:function(e){
            //进入点击方法，禁用搜索按钮
            $("#btnSearch").attr("disabled",true);
            if( !($("#sInvcStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                //判断开始和结束是否都有值
                if($("#sInvcStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //提示：请输入日期
                    dms.notification.warning("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='global.info.validation.required' arguments='${evalDt}' />");
                    //恢复搜索按钮搜索按钮
                    setSearchBtnTimeout();
                    return false;
                }else{
                    //将当前结束月+1
                    let endMonth = $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value().getMonth();
                    $("#sInvcEndDt").data('kendoExtMaskedDatePicker').value().setMonth(endMonth + 1);
                }
            }
            //索赔单主表分页查询
            $('#settlementGrid').data('kendoExtGrid').dataSource.page(1);
            //恢复搜索按钮搜索按钮
            setSearchBtnTimeout();
        }
    });

    //收款按钮：点击收款按钮执行更新索赔单状态
    $("#btnRec").kendoButton({
        click:function(e) {
            var settlementGrid = $("#settlementGrid").data("kendoExtGrid");
            let selectedItem = settlementGrid.dataItem(settlementGrid.select());
            if(selectedItem == null){
                //提示请选择一行信息
                dms.notification.warning("<spring:message code='sal.info.pleaseSelect'/>");
                return;
            }
            let saveVO = {
                //当前登录用户
                updtUsrId: userId,
                //获取当前索赔单的经销商代码dlrCd、索赔单编号invcNo
                dlrCd: selectedItem.dlrCd,
                invcNo: selectedItem.invcNo
            };
            if (settlementGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/wac/claimInvoiceRec/updateClaimInvoiceRecPaymTp.do' />"
                    ,data:JSON.stringify(saveVO)  //传入所选行对象
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data, jqXHR, textStatus) {
                        settlementGrid.dataSource.page(1);
                        if(data == 'success'){
                            //提示成功信息
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }else if(data == 'fail'){
                            //提示失败信息
                            dms.notification.error("<spring:message code='par.err.claimUpdateBillNoMsgResult12Code'/>");
                        }else if(data == 'processed'){
                            //提示已被收款
                            dms.notification.warning("<spring:message code='ser.info.repeatProceeds'/>");
                        }
                    }
                });
            }else{
                //提示错误信息
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });


    // 收款状态下拉框
    $("#sPaymTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:remittanceStateList
       ,optionLabel:" "
    });
    //设置默认值 未收款
    $("#sPaymTp").data("kendoExtDropDownList").value("01");

    //下载excel按钮
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"claimInvoiceRecService"
                ,"templateFile":"ClaimInvoiceRecList_Tpl.xls"
                ,"fileName":"ClaimInvoiceRecList.xls"
                ,"sInvcNo":$("#sInvcNo").val()
                ,"sPaymTp":$("#sPaymTp").val()
                ,"sInvcStartDt":kendo.toString(kendo.parseDate($("#sInvcStartDt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                ,"sInvcEndDt":kendo.toString(kendo.parseDate($("#sInvcEndDt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
            });
        }
    });


    //  索赔主单列表 表格展示
    $("#settlementGrid").kendoExtGrid({
        gridId:"G-SER-1330-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimInvoiceRec/selectClaimInvoiceRec.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sInvcNo"] = $("#sInvcNo").val();    //结算单号
                        params["sPaymTp"] = $("#sPaymTp").val();   //汇款状态

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
                    id:"invcNo",
                    fields:{
                        rnum:{type:"string", editable:false }               //序号
                        ,dlrCd:{type:"string", editable:false }             //经销商代码
                        ,invcNo:{type:"string", editable:false }             //结算报表号
                        ,paymTp:{type:"string", editable:false }              //汇款状态  01(未汇款),02(已汇款),03(已收款)
                        ,rcvCpltDt :{type:"date", editable:false }        //收款日期
                        ,invcDt :{type:"date", editable:false }           //结算报表年月
                        ,confirmTotAmt :{type:"string", editable:false }   //确定合计金额
                        ,ddctTotAmt :{type:"string", editable:false }       //扣减合计金额
                        ,invcClaimTotAmt :{type:"string", editable:false }  //索赔合计金额（结算金额）
                    }
                }
            }
        }
       ,height:400
       ,multiSelectWithCheckbox:false
       ,autoBind   :false
       ,navigatable:false
       ,selectable :"row"
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[

           {field:"rnum", title:"<spring:message code='global.lbl.no' />",width:30,attributes:{ "class":"ac"}}                          // 序号
          ,{field:"dlrCd", hidden: true}      // 经销商代码
          ,{field:"invcNo", title:"<spring:message code='ser.lbl.invcNo' />", width:150, attributes:{"class":"al"}}                 // 结算单号
          ,{field:"paymTp",title:"<spring:message code='ser.lbl.remittanceStatus' />",width:80,attributes:{"class":"ac"}          //开票状态
             ,template:"#= remittanceStateObj[paymTp] #"
          }
          ,{field:"rcvCpltDt", title:"<spring:message code='ser.lbl.receiveDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
           }               // 收款时间
          ,{field:"invcDt", title:"<spring:message code='ser.lbl.invcDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:yyyy-MM}"
           }                     // 报表结算年月
          ,{field:"confirmTotAmt", title:"<spring:message code='ser.lbl.invcClaimTotAmt' />", width:100, attributes:{"class":"al"}}    // 确定金额
          ,{field:"ddctTotAmt", title:"<spring:message code='ser.lbl.deductionAmt' />", width:100, attributes:{"class":"al"}}           // 扣减金额
          ,{field:"invcClaimTotAmt", title:"<spring:message code='ser.lbl.calcAmt' />", width:100, attributes:{"class":"al"}}           // 结算金额

       ]
   });

    //  发票列表 表格展示
    $("#invoiceGrid").kendoExtGrid({
        gridId:"G-SER-1330-000002"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimInvoiceRec/selectClaimInvoiceRecInSettlement.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#rowDlrCd").val();     //经销商代码
                        params["sInvcNo"] = $("#rowInvcNo").val();     //索赔结算单信息

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
                        rnum:{type:"string", editable:false }            //序号
                        ,receiptNo:{type:"string", editable:false }     //发票号
                        ,buyNm:{type:"string", editable:false }          //发票抬头
                        ,taxpayerIdCd:{type:"string", editable:false }   //纳税人识别号
                        ,scanSumAmt :{type:"string", editable:false }    //发票金额
                        ,regDt :{type:"date", editable:false }            //发票日期
                        ,remark :{type:"string", editable:false }       //备注
                    }
                }
            }
        }
        ,height:460
        ,multiSelectWithCheckbox:false
        ,autoBind   :false
        ,navigatable:false
        ,selectable :"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />",width:30,attributes:{ "class":"ac"}}                      // 序号
            ,{field:"receiptNo", title:"<spring:message code='sal.lbl.ReceiptNo' />", width:100, attributes:{"class":"al"}}       // 发票号
            ,{field:"buyNm", title:"<spring:message code='ser.lbl.InvoiceClaimTitle' />", width:150, attributes:{"class":"al"}}    // 发票抬头
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:100, attributes:{"class":"al"}}   // 纳税人识别号
            ,{field:"scanSumAmt", title:"<spring:message code='sal.lbl.rcptAmt' />", width:100, attributes:{"class":"al"}}          // 发票金额
            ,{field:"regDt", title:"<spring:message code='ser.lbl.invoiceDt' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }             // 发票日期
            ,{field:"remark", title:"<spring:message code='sal.lbl.rcptAmt' />", width:100, attributes:{"class":"al"}}          // 备注
        ]
    });


    //行单击方法，对是否允许收款进行判断
    //并且展示下面的发票列表
    $("#settlementGrid").on("click", "tr.k-state-selected", function (e) {
        var settlementGrid = $("#settlementGrid").data("kendoExtGrid");
        var selectedItem = settlementGrid.dataItem(settlementGrid.select());
        //判断当前行数据状态是否为已汇款，是则允许点击收款，否则不允许点击收款
        let isDisabled = selectedItem.paymTp == "02" ? false : true;
        $("#btnRec").attr("disabled",isDisabled);

        //获取当前索赔单的经销商代码dlrCd、索赔单编号invcNo
        $("#rowDlrCd").val(selectedItem.dlrCd);
        $("#rowInvcNo").val(selectedItem.invcNo);
        //执行查询当前索赔单发票方法
        $('#invoiceGrid').data("kendoExtGrid").dataSource.read();
    });

});

</script>
<!-- //script -->

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
            <h1 class="title_basic"><spring:message code='ser.title.reviewWarrantyOrder' /></h1> <!-- 保修工单确认审核标题 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-I-13271" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnExcelExport" class="btn_m" type="button"><spring:message code='global.btn.excelDownload' /></button>    <!-- 下载Excel -->
            </dms:access>
            <dms:access viewId="VIEW-I-13270" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search" type="button"><spring:message code='global.btn.search' /></button>          <!-- 查询 -->
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 6%;">
                    <col style="width: 9%;">
                    <col style="width: 5%;">
                    <col style="width: 9%;">
                    <col style="width: 6%;">
                    <col style="width: 9%;">
                    <col style="width: 5%;">
                    <col style="width: 12%;">
                    <col style="width: 6%;">
                </colgroup>
                <tbody>
                   <tr>
                        <th scope="row"><spring:message code="cmm.lbl.divi"/></th><!-- 事业部 -->
                        <td>
                            <input id="sDiviCd" name="sDiviCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.distOffice"/></th><!-- 办事处 -->
                        <td>
                            <input id="sOffCd" name="sOffCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlrCd' /></th><!-- 经销商代码 -->
                        <td>
                            <input id="sDlrCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='wac.lbl.roDt' /></th>    <!-- 维修委托日期(原：开单日期) -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRoStartDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRoEndDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.statNm' /></th>    <!-- 状态（原:审核状态） -->
                        <td>
                            <input id="sReqStatCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carNo' /></th>    <!-- 车牌号 -->
                        <td>
                            <input id="sCarRegNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.hqApproveNm' /></th><!-- 判定人 -->
                        <td>
                            <input id="sApproveUsrNm" class="form_input">
                        </td>
                        <th scope="row"><span><spring:message code="sal.menu.auditDate" /></span></th> <!-- 审核日期 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sApproveDtStart" id="sApproveDtStart"  class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sApproveDtEnd" id="sApproveDtEnd"  class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.warrantyOrder' /></h2> <!-- 特殊申请工单列表 标题 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-I-13269" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnApproval" class="btn_m btn_review" type="button"><spring:message code="global.btn.approval" /></button>   <!-- 通过 -->
                </dms:access>
                <dms:access viewId="VIEW-I-13267" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnOverrule" class="btn_m btn_review" type="button" style="margin:0px, 6px"><spring:message code="global.btn.overrule" /></button>   <!-- 驳回 -->
                </dms:access>
                <dms:access viewId="VIEW-I-13268" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnReject" class="btn_m btn_review" type="button"><spring:message code="global.btn.reject" /></button>   <!-- 拒绝 -->
                </dms:access>
            </div>
        </div>
        <!--工单显示表格-->
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>

        <!-- 特殊申请信息 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.reviewInfo'/></h2> <!-- 特殊申请信息 标题 -->
        </div>
        <div class="table_form form_width_40per" role="search" data-btnid="">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 8%;">
                    <col style="width: 9%;">
                    <col style="width: 4%;">
                    <col style="width: 9%;">
                    <col style="width: 5%;">
                    <col style="width: 10%;">
                    <col style="width: 6%;">
                    <col style="width: 13%;">
                    <col style="width: 3%;">
                    <col style="width: 12%;">
                    <col style="width: 9%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.rejectReason' /></th><!-- 审核原因 -->
                        <td colspan="9">
                            <textarea id="approveDesc" min="1" rows="2" maxlength="100" class="form_textarea"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.applyReasonTp' /></th><!-- 申请原因分类 -->
                        <td>
                            <input id="reqReasonTp" class="form_input" disabled>
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.requestUsr' /></th><!-- 申请人 -->
                        <td>
                            <input id="reqUsrNm" class="form_input" disabled>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.requestUsrPost' /></th><!-- 申请人岗位 -->
                        <td>
                            <input id="reqTskNm" class="form_input" disabled>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.requestUsrPhoneNo' /></th><!-- 申请人手机号 -->
                        <td>
                            <input id="reqHpNo" class="form_input" disabled>
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.hqApproveNm' /></th><!-- 判定人 -->
                        <td>
                            <input id="approveUsrNm" class="form_input" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.regReason' /></th><!-- 申请原因 -->
                        <td colspan="9" class="readonly_area">
                            <textarea disabled id="reqReasonDesc" min="1" rows="2" class="form_textarea"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 附件信息 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.attachedFileInfo'/></h2> <!-- 特殊申请信息 标题 -->
        </div>
        <!-- 附件显示表格 -->
        <div id="tabstrip" class="tab_area">
            <div>
                <div class="btn_right_absolute">
                    <span class="btn_file" id="btnFileAdd" hidden disabled><spring:message code="ser.btn.fileUpload" /></span> <!-- 文件上传 -->
                    <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s" hidden disabled><spring:message code="global.btn.fileDelete" /></button>
                </div>
                <!-- 文件列表页面 -->
                <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
            </div>
        </div>

    </section>
</div>
<style>
    .btn_review{
        margin-left: 20px;
        background-position-y: 20px;
        padding-right: 22px;
    }
    .btn_review:hover, .btn_review:active, .btn_review:focus{
        background-position-y: 20px!important;
    }
</style>
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
var userNm = "${userNm}";   //获取当前登录用户（判定人）

// 今天
//var toDay = "${toDay}";
// 每月一号
//var oneDay = toDay.substring(0, 8) + "01";
//var oneDay = "${oneDay}";

//SER600   状态（原:审核状态） approveStatCdList
var approveStatCdList = [];
var approveStatCdObj = {};
<c:forEach var="obj" items="${approveStatCdList}">
    <c:if test="${obj.cmmCd ne 'A'}">
        approveStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        approveStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//SER602   申请原因类别 approveDescList
var approveDescList = [];
var approveDescObj = {};
<c:forEach var="obj" items="${approveDescList}">
    <c:if test="${obj.cmmCd ne 'A'}">
        approveDescList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        approveDescObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//SER031   维修委托类型 (RO类型)
var roTpList = [];
var roTpObj = {};
<c:forEach var="obj" items="${roTpList}">
    <c:if test="${obj.cmmCd ne 'A'}">
        roTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        roTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//事业部
var regionList = [];
<c:forEach var="obj" items="${regionList}">
    regionList.push({"diviCd":"${obj.diviCd}", "diviNm":"${obj.diviNm}"});
</c:forEach>
//办事处
var officeList = [];
<c:forEach var="obj" items="${officeList}">
    officeList.push({"offCd":"${obj.offCd}", "offNm":"${obj.offNm}", "diviCd":"${obj.diviCd}"});
</c:forEach>



$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 查询按钮日期选择校验
        enable:true,
        click:function(e){

            if( !($("#sRoStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sRoEndDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                if($("#sRoStartDt").data('kendoExtMaskedDatePicker').value() == null){
                    //提示：请输入开始日期
                    dms.notification.warning("<spring:message code='cmm.info.awayStartHmMsg'/>");
                    return false;
                }else if($("#sRoEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //提示：请输入结束日期
                    dms.notification.warning("<spring:message code='cmm.info.awayEndHmMsg'/>");
                    return false;
                }
            }

            if( !($("#sApproveDtStart").data('kendoExtMaskedDatePicker').value() == null && $("#sApproveDtEnd").data('kendoExtMaskedDatePicker').value() == null ) ){
                if($("#sApproveDtStart").data('kendoExtMaskedDatePicker').value() == null){
                    //提示：请输入开始日期
                    dms.notification.warning("<spring:message code='cmm.info.awayStartHmMsg'/>");
                    return false;
                }else if($("#sApproveDtEnd").data('kendoExtMaskedDatePicker').value() == null){
                    //提示：请输入结束日期
                    dms.notification.warning("<spring:message code='cmm.info.awayEndHmMsg'/>");
                    return false;
                }
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //通过按钮
    $("#btnApproval").kendoButton({
        enable:true,
        click:function(e){
            //调用公共方法查询当前工单是否被审核
            selectNowOrderIsReviewed("02", "00");
        }
    });

    //驳回按钮
    $("#btnOverrule").kendoButton({
        enable:true,
        click:function(e){
            //调用公共方法查询当前工单是否被审核
            selectNowOrderIsReviewed("04", "02");
        }
    });

    //拒绝按钮
    $("#btnReject").kendoButton({
        enable:true,
        click:function(e){
            //调用公共方法查询当前工单是否被审核
            selectNowOrderIsReviewed("03", "01");
        }
    });


    //传入行对象，执行后台审核方法
    //本方法传入的参数 reqStatCd：表示需要修改SE_1162T表中的单据状态的值
    //               approveStatCd：表示需要添加在SE_1163T表中的审核状态的值
    function selectNowOrderIsReviewed(reqStatCd, approveStatCd){
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());    //获取当前被选中行
        if(selectedItem == null){
            //提示弹窗 请先选择一行数据
            dms.notification.warning("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='ser.error.selectWorkOrderFirst'/>");
            return;
        }else{
            selectedItem.reqStatCd = reqStatCd;         //SE_1162T 单据状态
            selectedItem.approveStatCd = approveStatCd; //SE_1163T 状态（原:审核状态）
        }
        let approveDesc = $("#approveDesc").val().trim();
        if(approveStatCd != "00" && (approveDesc == null || approveDesc.length > 100 || approveDesc.length <= 0)){
            //提示弹窗 长度在100以内
            dms.notification.warning("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='ser.error.checkingLengthWithin100' />");
            return;
        }else if(reqStatCd != "02" && approveStatCd != "00"){
            //只有当前操作不为 通过 时，才会保存审核原因
            selectedItem.approveDesc = approveDesc;        //SE_1163T 审核原因（驳回原因/拒绝原因）
        }
        //取值传入后台，进行更新插入操作
        let warrantyOrder = {
            reqStatCd: selectedItem.reqStatCd,          //SE_1162T 单据状态
            approveStatCd: selectedItem.approveStatCd, //SE_1163T 状态（原:审核状态）
            approveDesc: selectedItem.approveDesc,
            approveUsrId: selectedItem.approveUsrId,
            approveUsrNm: selectedItem.approveUsrNm,
            dlrCd: selectedItem.dlrCd,
            reqNo: selectedItem.reqNo
        };

        //发送请求执行审核操作
        $.ajax({
            url : "<c:url value='/ser/svi/reviewWarrantyOrder/updateReviewWarrantyOrders.do'/>",
            data : JSON.stringify(warrantyOrder),
            type : "POST",
            dataType : "json",
            contentType : "application/json",
            async : false,
            success : function(data) {
                //查看data
                //依据返回值判断当前工单是否审核完成，并刷新页面
                if(data == "success"){
                    dms.notification.success("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='ser.info.reviewSuccess' />");   //审核成功
                }else if(data == "exist"){
                    dms.notification.error("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='ser.info.alreadyReviewed' />"); //审核失败，当前工单在此前已被审核
                }else if(data == "fail"){
                    dms.notification.error("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='ser.info.reviewFail' />"); //数据出现错误，审核失败
                }
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            },
            error : function(jqXHR,status,error) {
            }
        });
    }


    //下载excel按钮
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"reviewWarrantyOrderService"
                ,"templateFile":"ReviewWarrantyOrderList_Tpl.xls"
                ,"fileName":"<spring:message code='ser.title.reviewWarrantyOrderList'/>.xls"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sReqStatCd":$("#sReqStatCd").val()
                ,"sCarRegNo":$("#sCarRegNo").val()
                ,"sApproveUsrNm":$("#sApproveUsrNm").val()
                ,"sRoStartDt":kendo.toString(kendo.parseDate($("#sRoStartDt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                ,"sRoEndDt":kendo.toString(kendo.parseDate($("#sRoEndDt").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                ,"sApproveDtStart":kendo.toString(kendo.parseDate($("#sApproveDtStart").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                ,"sApproveDtEnd":kendo.toString(kendo.parseDate($("#sApproveDtEnd").data("kendoExtMaskedDatePicker").value()),"<dms:configValue code='dateFormat' />")
                ,"sDiviCd"      :$("#sDiviCd").val()
                ,"sOffCd"       :$("#sOffCd").val()
            });
        }
    });


    // 状态（原:审核状态）
    $("#sReqStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:approveStatCdList
       ,optionLabel:" "
    });
    //设置默认值
    $("#sReqStatCd").data("kendoExtDropDownList").value("01");


    // 区域（事业部）查询条件下拉列表
    var diviCd = $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm" ,
        dataValueField:"diviCd",
        dataSource: regionList,
        optionLabel:" ",
        filter:"contains",
        change: function (e) {
            var sDiviCd = $("#sDiviCd").val();
            var list = [];
            if (sDiviCd != null && sDiviCd != ""){ // 判断区域代码是否为空
                officeList.forEach(function (element) {
                    if (element.diviCd == sDiviCd){ // 拿到该区域代码对应的所有办事处
                        list.push(element);
                    }
                })
                // 重新给办事处下拉框list赋值
                $("#sOffCd").data("kendoExtDropDownList").setDataSource(list);
            }else{
                $("#sOffCd").data("kendoExtDropDownList").setDataSource(officeList);
            }
        }
    });

    // 办事处查询条件下拉列表
    var offCd = $("#sOffCd").kendoExtDropDownList({
        dataTextField:"offNm" ,
        dataValueField:"offCd",
        dataSource: officeList,
        optionLabel:" ",
        filter:"contains",
        change: function (e) {
            var list = [];
            var sOffCd = $("#sOffCd").val();
            var sDiviCd = "";
            if (sOffCd != null && sOffCd != ""){ // 判断办事处是否为空
                officeList.forEach(function (element) {
                    if (element.offCd == sOffCd){ // 拿到该办事处对应的区域代码
                        sDiviCd = element.diviCd;
                    }
                })
                //循环找出当前选中的事业部元素
                for(let i = 0; i < regionList.length; i++){
                    if (regionList[i].diviCd == sDiviCd){ // 拿到该区域代码的区域信息，判断是否相等
                        //取出下标 并+1，赋值给事业部下拉框，选中当前办事处所属事业部
                        $("#sDiviCd").data("kendoExtDropDownList").select(i + 1);
                        officeList.forEach(function (element) {
                            if (element.diviCd == sDiviCd){ // 拿到该区域代码对应的所有办事处
                                list.push(element);
                            }
                        })
                        // 重新给办事处下拉框list赋值
                        $("#sOffCd").data("kendoExtDropDownList").setDataSource(list);
                        //循环找出当前选中的办事处元素
                        for(let j = 0; j < officeList.length; j++){
                            if (officeList[i].sOffCd == sOffCd){ // 拿到该区域代码的区域信息，判断是否相等
                                //取出下标 并+1，赋值给办事处下拉框，选中当前办事处所属办事处
                                $("#sOffCd").data("kendoExtDropDownList").select(j + 1);
                                break;
                            }
                        }
                        break;
                    }
                }
            }else{
                $("#sDiviCd").data("kendoExtDropDownList").setDataSource(regionList);
            }
        }
    });

    //      开单日期start
    $("#sRoStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay     //value设置进入页面时的初始值
    });


    //     开单日期end
    $("#sRoEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    /**
     *    审核日期start
     */
    $("#sApproveDtStart").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });
    /**
     *   审核日期end
     */
    $("#sApproveDtEnd").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });


    //  工单表格展示
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1328-034001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/reviewWarrantyOrder/selectReviewWarrantyOrders.do' />"
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
                        params["sReqStatCd"] = $("#sReqStatCd").val();          //状态（原:审核状态）
                        params["sCarRegNo"] = $("#sCarRegNo").val();            //车牌号
                        params["sApproveUsrNm"] = $("#sApproveUsrNm").val();   //判定人姓名

                        // 开单日期
                        params["sRoStartDt"] = $("#sRoStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoEndDt"]   = $("#sRoEndDt").data("kendoExtMaskedDatePicker").value();
                        // 审核日期
                        params["sApproveDtStart"] = $("#sApproveDtStart").data("kendoExtMaskedDatePicker").value();
                        params["sApproveDtEnd"]   = $("#sApproveDtEnd").data("kendoExtMaskedDatePicker").value();

                        params["sDiviCd"]       = $("#sDiviCd").data("kendoExtDropDownList").value();
                        params["sOffCd"]        = $("#sOffCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"reqNo",
                    fields:{
                        rnum:{type:"string"}           //序号
                        ,dlrCd:{type:"string"}        //经销商代码
                        ,dlrNm:{type:"string"}          //经销商名称
                        ,carRegNo:{type:"string"}       //车牌号
                        ,vinNo :{type:"string"}         //车辆识别码
                        ,roDocNo :{type:"string"}      //维修委托号码
                        ,carOwnerNm :{type:"string"}     //车辆所有者
                        ,driverNm :{type:"string"}           //送修人
                        ,driverHpNo:{type:"string"}        //送修人手机号
                        ,roTpStr:{type:"string"}               //维修委托类型
                        ,reqStatCdStr:{type:"string"}       //状态（原:审核状态）
                        ,reqReasonTpStr:{type:"string"}      //申请原因分类
                        ,reqReasonDesc:{type:"string"}     //申请原因
                        ,approveDesc:{type:"string"}     //审核原因
                        ,reqUsrNm:{type:"string"}             //申请人
                        ,approveUsrNm:{type:"string"}         //判定人
                        ,reqDt:{type:"date"}       //申请日期
                        ,roDt:{type:"date"}       //维修委托日期
                        ,dlChkDt:{type:"date"}       //交车确认日期
                        ,approveDt:{type:"date"}       //审核日期(修改为SE_1162T新增的：APPROVE_DT)
                        ,reqStatCd:{type:"string"}          //状态（原:审核状态）(隐藏)
                        ,roTp:{type:"string"}               //维修委托类型(隐藏)
                        ,reqReasonTp:{type:"string"}       //申请原因分类(隐藏)
                        ,reqNo:{type:"string"}       //申请编码（隐藏）
                        ,fileDocNo:{type:"string"}       //附件ID（隐藏）
                    }
                }
            }
        }


       ,height:390
       ,multiSelectWithCheckbox:false
       ,editable   :false
       ,autoBind   :false
       ,navigatable:false
       ,selectable :"row"
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[

           {field:"rnum", title:"<spring:message code='global.lbl.no' />",width:48,attributes:{ "class":"ac"},sortable:false}          // 序号
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:107, attributes:{"class":"ac"}}         // 经销商代码
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />",width:268, attributes:{"class":"al"}}	           // 经销商名称
          ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100, attributes:{"class":"al"}}       // 车牌号
          ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:164, attributes:{"class":"ac"}}            // 车辆识别码
          ,{field:"roDocNo", title:"<spring:message code='global.lbl.fosterNo' />", width:139, attributes:{"class":"ac"}}       // 维修委托号码
          ,{field:"reqStatCdStr",title:"<spring:message code='ser.lbl.statNm' />",width:103,attributes:{"class":"ac"}}         //状态（原:审核状态）
          ,{field:"reqDt",title:"<spring:message code='crm.lbl.requestDt' />",width:191,attributes:{"class":"ac"}       //申请日期
             ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:97, attributes:{"class":"ac"}}       // 车辆所有者
          ,{field:"driverNm", title:"<spring:message code='crm.lbl.driver' />", width:93, attributes:{"class":"ac"}}           // 送修人
          ,{field:"driverHpNo", title:"<spring:message code='ser.lbl.driverPhoneNo' />", width:120, attributes:{"class":"ac"}}       // 送修人手机号
          ,{field:"roTpStr",title:"<spring:message code='global.lbl.fosterTp' />",width:115,attributes:{"class":"ac"}}              //维修委托类型
          ,{field:"reqReasonTpStr",title:"<spring:message code='ser.lbl.applyReasonTp' />",width:114,attributes:{"class":"ac"}} //申请原因分类
          ,{field:"reqReasonDesc", title:"<spring:message code='global.lbl.regReason' />", width:180}                           //申请原因
          ,{field:"approveDesc", title:"<spring:message code='ser.lbl.rejectReason' />", width:180}                             //审核原因
          ,{field:"reqUsrNm", title:"<spring:message code='ser.lbl.requestUsr' />", width:100,attributes:{"class":"ac"}}      //申请人
          ,{field:"approveUsrNm", title:"<spring:message code='ser.lbl.hqApproveNm' />", width:100,attributes:{"class":"ac"}} //判定人
          ,{field:"roDt",title:"<spring:message code='wac.lbl.roDt' />",width:191,attributes:{"class":"ac"}                     //维修委托日期
              ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{field:"dlChkDt",title:"<spring:message code='wac.lbl.dlChkDt' />",width:191,attributes:{"class":"ac"}               //交车确认日期
              ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{field:"approveDt",title:"<spring:message code='sal.menu.auditDate' />",width:191,attributes:{"class":"ac"}              //审核日期(修改为SE_1162T新增的：APPROVE_DT)
              ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
          ,{field:"reqStatCd",hidden:true}  //状态（原:审核状态）(隐藏)
          ,{field:"roTp",hidden:true}  //维修委托类型(隐藏)
          ,{field:"reqReasonTp",hidden:true}  //申请原因分类(隐藏)
          ,{field:"reqNo",hidden:true}  //申请编码(隐藏)
          ,{field:"fileDocNo",hidden:true}  //附件ID(隐藏)

       ]
   });


   //  单击表格行后展示信息在其表格下面的区域中
   $("#grid").on("click", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
        //点击行，添加信息到input框
        $("#reqReasonTp").val(approveDescObj[selectedItem.reqReasonTp]);
        $("#reqUsrNm").val(selectedItem.reqUsrNm);
        $("#reqTskNm").val(selectedItem.reqTskNm);
        $("#reqHpNo").val(selectedItem.reqHpNo);
        $("#reqReasonDesc").val(selectedItem.reqReasonDesc);
        $("#approveDesc").val(selectedItem.approveDesc);
        //如果当前申请单为未审核且不为保存状态，则将下面的审核人改为当前登录人，否则显示原先的审核人
        let approveUsrNm =  selectedItem.reqStatCd == "01" ? selectedItem.approveUsrNm : userNm;
        $("#approveUsrNm").val(approveUsrNm);

        let isDisabled = !(selectedItem.reqStatCd == "01");    //判断当前记录是否被审核过，如果是01(提报)，那就不禁用审核原因
        $("#approveDesc").attr("disabled",isDisabled);   //根据单据状态判断，将审核原因禁用
        $("#btnApproval").attr("disabled",isDisabled);     //根据单据状态判断，将通过按钮禁用
        $("#btnReject").attr("disabled",isDisabled);     //根据单据状态判断，将拒绝按钮禁用
        $("#btnOverrule").attr("disabled",isDisabled);     //根据单据状态判断，将驳回按钮禁用

        //单击行数据，查出文件ID，赋值给隐藏框
        $("#fileKeyNm").val(selectedItem.fileDocNo);
        //执行查询文件
        $("#fileGrid").data('kendoExtGrid').dataSource.page(1);

   });
});

</script>
<!-- //script -->

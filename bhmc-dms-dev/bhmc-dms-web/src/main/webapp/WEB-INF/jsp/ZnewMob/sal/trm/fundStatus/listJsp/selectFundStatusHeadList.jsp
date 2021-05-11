<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- <div id="subListView" style="height:200px; overflow:scroll"></div> -->
<div class="co_group">
    <div class="content_title">
        <span style="font-size: 16px;"><spring:message code='sal.lbl.preAmt' /></span>&nbsp;
        <span style="line-height: 3">
            <input type="text" id = "preAmt" style="width:50%; text-align:right" readonly/>
        </span>
        <div class="title_btn">
            <span class="co_open co_close"><span></span></span>
        </div>
    </div>
    <div class="co_view" style="display:none">
        <div class="formarea" id="formarea" >
            <table class="flist01">
                <caption><spring:message code="global.lbl.basicInfo" /></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="preCash" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="prePrt2Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="prePrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="co_group">
    <div class="content_title">
        <span style="font-size: 16px;"><spring:message code='sal.lbl.depTot' /></span>&nbsp;
        <span style="line-height: 3">
            <input type="text" id = "depositAmt" style="width:50%; text-align:right" readonly/>
        </span>
        <div class="title_btn">
            <span class="co_open co_close"><span></span></span>
        </div>
    </div>
    <div class="co_view" style="display:none">
        <div class="formarea" id="formarea" >
            <table class="flist01">
                <caption><spring:message code="global.lbl.basicInfo" /></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="depositCash" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id=depositPrt2Amt data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="depositPrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prcChgAmt' /><!-- 조정금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="depositProChgAmt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.incnAmt' /><!-- 인센티브 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="depositIncnAmt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="co_group">
    <div class="content_title">
        <span style="font-size: 16px;"><spring:message code='sal.lbl.withTot' /></span>&nbsp;
        <span style="line-height: 3">
            <input type="text" id="withAmt" style="width:50%; text-align:right" readonly/>
        </span>
        <div class="title_btn">
            <span class="co_open co_close"><span></span></span>
        </div>
    </div>
    <div class="co_view" style="display:none">
        <div class="formarea" id="formarea" >
            <table class="flist01">
                <caption><spring:message code="global.lbl.basicInfo" /></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="withCash" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="withPrt2Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="withPrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="co_group">
    <div class="content_title">
        <span style="font-size: 16px;"><spring:message code='sal.lbl.nowAmt' /></span>&nbsp;
        <span style="line-height: 3">
            <input type="text" id="nowAmt" style="width:50%; text-align:right" readonly/>
        </span>
        <div class="title_btn">
            <span class="co_open co_close"><span></span></span>
        </div>
    </div>
    <div class="co_view" style="display:none">
        <div class="formarea" id="formarea" >
            <table class="flist01">
                <caption><spring:message code="global.lbl.basicInfo" /></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.cash' /><!-- 현금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="nowCash" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt2Amt' /><!-- 이방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="nowPrt2Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.prt3Amt' /><!-- 삼방자금 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="nowPrt3Amt" data-json-obj="true" style="text-align:right" readonly/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>

var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/trm/fundStatus/selectFundStatusSearch.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sYy"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyy");
                params["sMm"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "MM");
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    //,pageSize:pageSize
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
             ,fields:{
                rnum:{type:"number"}
            }
        }
    }
    ,change :function(e){
        if(e.items.length !=0){
            var item = e.items[0];
            $("#preCash").val(kendo.toString(item.bfCashBalAmt, 'n2'));
            $("#prePrt2Amt").val(kendo.toString(item.bfPrt2BalAmt, 'n2'));
            $("#prePrt3Amt").val(kendo.toString(item.bfPrt3BalAmt, 'n2'));
            $("#preAmt").val(kendo.toString(item.bfTotBalAmt, 'n2'));

            $("#depositCash").val(kendo.toString(item.cashDpstAmt, 'n2'));
            $("#depositPrt2Amt").val(kendo.toString(item.prt2DpstAmt, 'n2'));
            $("#depositPrt3Amt").val(kendo.toString(item.prt3DpstAmt, 'n2'));
            $("#depositProChgAmt").val(kendo.toString(item.prcChgAmt, 'n2'));
            $("#depositIncnAmt").val(kendo.toString(item.incnAmt, 'n2'));
            $("#depositAmt").val(kendo.toString(item.totDpstAmt, 'n2'));

            $("#withCash").val(kendo.toString(item.wdrwCashAmt, 'n2'));
            $("#withPrt2Amt").val(kendo.toString(item.wdrwPrt2Amt, 'n2'));
            $("#withPrt3Amt").val(kendo.toString(item.wdrwPrt3Amt, 'n2'));
            $("#withAmt").val(kendo.toString(item.wdrwAmt, 'n2'));

            $("#nowCash").val(kendo.toString(item.cashBalAmt, 'n2'));
            $("#nowPrt2Amt").val(kendo.toString(item.prt2BalAmt, 'n2'));
            $("#nowPrt3Amt").val(kendo.toString(item.prt3BalAmt, 'n2'));
            $("#nowAmt").val(kendo.toString(item.totBalAmt, 'n2'));
        }else{

            $("#preCash").val(kendo.toString(0, 'n2'));
            $("#prePrt2Amt").val(kendo.toString(0, 'n2'));
            $("#prePrt3Amt").val(kendo.toString(0, 'n2'));
            $("#preAmt").val(kendo.toString(0, 'n2'));

            $("#depositCash").val(kendo.toString(0, 'n2'));
            $("#depositPrt2Amt").val(kendo.toString(0, 'n2'));
            $("#depositPrt3Amt").val(kendo.toString(0, 'n2'));
            $("#depositProChgAmt").val(kendo.toString(0, 'n2'));
            $("#depositIncnAmt").val(kendo.toString(0, 'n2'));
            $("#depositAmt").val(kendo.toString(0, 'n2'));

            $("#withCash").val(kendo.toString(0, 'n2'));
            $("#withPrt2Amt").val(kendo.toString(0, 'n2'));
            $("#withPrt3Amt").val(kendo.toString(0, 'n2'));
            $("#withAmt").val(kendo.toString(0, 'n2'));

            $("#nowCash").val(kendo.toString(0, 'n2'));
            $("#nowPrt2Amt").val(kendo.toString(0, 'n2'));
            $("#nowPrt3Amt").val(kendo.toString(0, 'n2'));
            $("#nowAmt").val(kendo.toString(0, 'n2'));
        }
    }
});

</script>


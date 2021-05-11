<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="par.menu.advanceReceived" /></h2>
    </div>
    <div class="formarea">
        <table class="flist01">
            <tr>
                <th scope="row" style="width:25%"><spring:message code='par.lbl.acAmt' /><!-- 보증금 --></th>
                <td><input type="text" id = "acAmt" style="text-align: right;" disabled="disabled" /></td>
            </tr>
            <tr>
                <th scope="row" style="width:25%"><spring:message code='par.lbl.calcAmt' /><!-- 공정중 --></th>
                <td><input type="text" id = "calcAmt" style="text-align: right;" disabled="disabled"/></td>
            </tr>
            <tr>
                <th scope="row" style="width:25%"><spring:message code='par.lbl.balAmt' /><!-- 가용금액 --></th>
                <td><input type="text" id = "useAmt" style="text-align: right;" disabled="disabled"/></td>
            </tr>
            <tr>
                <th scope="row" style="width:25%"><spring:message code='par.lbl.suggestAmt' /><!-- 제시금액 --></th>
                <td><input type="text" id = "suggestAmt" style="text-align: right;" disabled="disabled"/></td>
            </tr>
        </table>
    </div>
    <div class="listarea">
        <div class="dlistitem listhead">
            <span style="width:50%" ><spring:message code="par.lbl.finishTime" /><!-- 거래일자--></span>
            <span style="width:50%" ><spring:message code="par.lbl.advanceReceivedActEndDt" /><!-- 거래시간 --></span>
            <span style="width:50%" ><spring:message code="par.lbl.sellType" /><!-- 거래유형 --></span>
            <span style="width:50%" ><spring:message code="par.lbl.totAmtCol" /><!-- 신용 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%">#:preAmtUpdtDt #</span>
    <span style="width:50%">#:preAmtUpdtHm #</span>
    <span style="width:50%">#:changePreAmtTp(preAmtTp)#</span>
    <span style="width:50%">#:kendo.toString(totAmt, 'n2') #</span>
</div>
</script>

<script>
//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"preAmtAddDt",txt:"<spring:message code='par.lbl.finishTime' />",type:""}, //거래일자
               {temp:"s",key:"preAmtAddHm",txt:"<spring:message code='par.lbl.advanceReceivedActEndDt' />",type:""}, //거래시간
               {temp:"s",key:"preAmtTp",txt:"<spring:message code='par.lbl.sellType' />",type:""}, //거래유형
               {temp:"s",key:"totAmt",txt:"<spring:message code='par.lbl.totAmtCol' />",type:"strAmt"}, //신용
               {temp:"s",key:"dpstAmt",txt:"<spring:message code='par.lbl.dpstAmtCol' />",type:"strAmt"}, //차변
               {temp:"s",key:"balAmt",txt:"<spring:message code='global.lbl.balc' />",type:"strAmt"}, //잔액
               {temp:"s",key:"invcNo",txt:"<spring:message code='par.lbl.advanceReceivedNum' />",type:""}, //참고번호
               ];

var viewRow=10;
var pageIndex=0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;//options.skip;
                params["lastIndex"] = pageSize;//options.skip + options.take;

                var sDlrCd = $("#sDlrCd").val() == "" ? "X":$("#sDlrCd").val();
                params["sDlrCd"] = sDlrCd;

                params["sPreAmtTp"] = $("#sPreAmtTp").val();
                params["sImpStartDt"] = chgDate($("#impStartDt").val());
                params["sImpEndDt"] = chgDate($("#impEndDt").val());
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
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
        makeDetailHtml(listData._data,keyMapArr,"#defaultHtml","");

        $.ajax({
            url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoHeaderByKey.do' />"
            ,data:JSON.stringify({ sDlrCd:$("#sDlrCd").val(), sPreAmtTp:$("#sPreAmtTp").val() })
            ,type:"POST"
            ,dataType:"json"
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                if(jqXHR !== null){
                    $("#acAmt").data("kendoExtNumericTextBox").value(jqXHR.dpstAmt);
                    $("#calcAmt").data("kendoExtNumericTextBox").value(jqXHR.calcAmt);
                    $("#useAmt").data("kendoExtNumericTextBox").value(jqXHR.useAmt);
                    $("#suggestAmt").data("kendoExtNumericTextBox").value(jqXHR.lmtAmt);
                }
            }
        });
    }
    ,error:function(e){
        console.log(e);
    }
});

changePreAmtTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = preAmtTpMap[val];
    }
    return returnVal;
};

function listViewClick(dataItem){
    $("#content_list, #content_search").hide();
    $("#content_detail").show();
    $("#header_title span").removeAttr("class");
    if(dataItem != null){
        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");
        $("#preAmtTp").val(changePreAmtTp($("#preAmtTp").val()));
    }

}
</script>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list" class="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='sal.menu.notAssignOrdSearch' /><!-- 미배정오더조회 --></h2>
    </div>

    <div class="co_group">
        <div class="content_title">
            <span style="font-size: 16px;"><spring:message code='sal.lbl.dailyFoundCondition' /></span>&nbsp;
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
                            <th scope="row"><spring:message code="sal.lbl.mortgageBalance" />/<spring:message code="sal.lbl.unMortgageBalance" /></th> <!-- 담보잔액 -->
                            <td class="readonly_area">
                                <input id="mortgageBalance" type="text" style="text-align: right; width:44.5%;" readOnly/>
                                <input id="unMortgageBalance" type="text" style="text-align: right; width:44.5%;" readOnly/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" style="width:30%"><spring:message code='sal.lbl.ordReqTotAmt' /><!-- 오더배정필요한총금액 --></th>
                            <td><input type="text" id = "ordReqTotAmt" style="text-align: right; width:90%;" readOnly/></td>
                        </tr>
                        <tr>
                            <th scope="row" style="width:30%"><spring:message code='sal.lbl.accountBalance' /><!-- 계정잔액 --></th>
                            <td><input type="text" id = "preAmt" style="text-align: right; width:90%;" readOnly/></td>
                        </tr>
                        <tr>
                            <th scope="row" style="width:30%"><spring:message code='sal.lbl.lackAmtAssigne' /><!-- 부족금액 --></th>
                            <td><input type="text" id = "lackAmt" style="text-align: right; width:90%;" readOnly/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%" ><spring:message code="global.lbl.carLine" /><!-- 차종--></span>
            <span style="width:50%" ><spring:message code="sal.lbl.extColor" />/<spring:message code="sal.lbl.intColor" /><!-- 외색/내색 --></span>
            <span style="width:50%" ><spring:message code="global.lbl.ocn" />/<spring:message code="global.lbl.model" /><!-- ocn/차관 --></span>
            <span style="width:50%" ><spring:message code="sal.lbl.guideAmt" /><!-- 지도가격--></span>
            <span style="width:50%" ><spring:message code="sal.lbl.qty" /><!-- 수량 --></span>
            <span style="width:50%" ><spring:message code="sal.lbl.whDcAmt" /><!-- 할인후 금액 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>

    <div class="listarea">
        <div class="dlistitem bgNone" style="text-align: left;">
            <span style="width:20%"><spring:message code='global.lbl.total' />:<!-- 합계 --></span>
            <span style="width:60%" id="totalAmt"></span>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="dlistitem bgNone">
        <span style="width:50%">[#:carlineCd #]#:carlineNm #</span>
        <span style="width:50%">#:extColorNm + " / " + intColorCd #</span>
        <span class="clboth" style="width:50%">#:ocnCd + " / " + modelNm #</span>
        <span style="width:50%">#:kendo.toString(mdpr, 'n2') #</span>
        <span class="clboth" style="width:50%">#:ordpCount #</span>
        <span style="width:50%">#:kendo.toString(aamt, 'n2') #</span>
    </div>
</script>
<script>
var viewRow=100;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = -1;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var aamt = 0;
var ordpCount = 0;

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrder.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {

                var params = {};

                params["sOrdTp"]  = $("#sOrderType").data("kendoExtDropDownList").value();
                params["sCarlineCd"] = $("#sCarLine").data("kendoExtDropDownList").value();
                params["sFscCd"] = $("#sModelNm").data("kendoExtDropDownList").value();
                params["sOcnCd"] = $("#sOcn").data("kendoExtDropDownList").value();
                params["sPaym"] = $("#sMortgageTp").data("kendoExtDropDownList").value();

                var sOrdTp = $("#sOrderType").data("kendoExtDropDownList").value();

                var sOrdStartDt = $("#sOrdStartDt").val().replace(/-/gi,"");
                var sOrdEndDt = $("#sOrdEndDt").val().replace(/-/gi,"");
                var sOrdPrid =  $("#sOrderWeek").data("kendoExtDropDownList").value();

                if(sOrdTp == "N1"){
                    params["sOrdPrid"] = sOrdPrid;
                    params["sOrdStartDtStr"] = "";
                    params["sOrdEndDtStr"] = "";
                }else{
                    params["sOrdPrid"] = "";
                    params["sOrdStartDtStr"] = sOrdStartDt;
                    params["sOrdEndDtStr"] = sOrdEndDt;
                }

                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
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
        for(var i=0; i<listData._view.length; i++){
            aamt += Number(listData._view[i].aamt);
            ordpCount +=Number(listData._view[i].ordpCount);
        }

        $("#ordReqTotAmt").val(kendo.toString(aamt, 'n2'));

        $("#totalAmt").html(this._total + " / " + kendo.toString(aamt, 'n2'));

        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});

changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ordTpCdObj[val];
    }
    return returnVal;
};

$(document).ready(function() {

    // 선수금 잔액 조회
    $.ajax({
        url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPreAmtSearch.do' />"
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(jqXHR, textStatus) {
            console.log("jqXHR",jqXHR);
            $("#preAmt").val(jqXHR.data[0].totBalAmt);
            $("#mortgageBalance").val(jqXHR.data[0].prt3BalAmt);
            $("#unMortgageBalance").val(jqXHR.data[0].prt2BalAmt+jqXHR.data[0].cashBalAmt);

            setTimeout(function(){ getValue();}, 100);
        }
    });
});

function getValue(){

    if(Number($("#ordReqTotAmt").val()) <  Number($("#preAmt").val())){
        $("#lackAmt").val(0);
    }else{
        $("#lackAmt").val( Number($("#preAmt").val()) - Number($("#ordReqTotAmt").val()) );
    }
    $("#preAmt").val(kendo.toString(Number($("#preAmt").val()),'n2'));
    $("#mortgageBalance").val(kendo.toString(Number($("#mortgageBalance").val()),'n2'));
    $("#unMortgageBalance").val(kendo.toString(Number($("#unMortgageBalance").val()),'n2'));
    $("#ordReqTotAmt").val(kendo.toString(Number($("#ordReqTotAmt").val()),'n2'));
    $("#lackAmt").val(kendo.toString(Number($("#lackAmt").val()),'n2'));

}
</script>

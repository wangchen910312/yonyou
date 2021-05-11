<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 부품수령 -->
<div class="co_group">
    <div class="content_title">
        <h2 id="serlblpart"><spring:message code="ser.lbl.part" /><!-- 부품수령 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList3Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.calUnt" /><!-- 계량단위 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.itemQty" /><!-- 부품수량 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.itemUntPrc" /><!-- 부품단가 --></span>
                <span style="width:50%" id="serlblitemAmt"><spring:message code="ser.lbl.itemAmt" /><!-- 부품금액 --></span>
                <span style="width:50%" id="serlbldcAmt"><spring:message code="ser.lbl.dcAmt" /><!-- 할인금액 --></span>
                <span style="width:50%" id="serlblparAmt"><spring:message code="ser.lbl.parAmt" /><!-- 부품비 --></span>
                <span style="width:50%" id="serllblparReadyStatCd"><spring:message code="serl.lbl.parReadyStatCd" /><!-- 부품준비상태 --></span>
                <span style="width:50%" id="parlblparReqStatNm"><spring:message code="par.lbl.parReqStatNm" /><!-- 부품요청상태 --></span>
            </div>
            <div>
                <div id="sublistView3" style="height: 200px; overflow: scroll;"></div>
            </div>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub3"><span></span></div>
        </div>
    </div>
</div>
<!-- 부품수령 -->

<script type="text/x-kendo-template" id="subTemplate3">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(itemCd) #</span>
            <span style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(calcUnitCd) #</span>
            <span style="width:50%">#:trimNull(itemQty) #</span>
            <span style="width:50%">#:trimNull(kendo.toString(itemPrc,'n2')) #</span>
            <span style="width:50%" class="serlblitemAmt">#:trimNull(kendo.toString(itemSaleAmt,'n2')) #</span>
            <span style="width:50%" class="serlbldcAmt">#:trimNull(kendo.toString(dcAmt, 'n2')) #</span>
            <span style="width:50%" class="serlblparAmt">#:trimNull(kendo.toString(itemTotAmt, 'n2')) #</span>
        </div>
</script>

<script type="text/x-kendo-template" id="subTemplate3-a">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(itemCd) #</span>
            <span style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(calcUnitCd) #</span>
            <span style="width:50%">#:trimNull(itemQty) #</span>
            <span style="width:50%">#:trimNull(kendo.toString(itemPrc,'n2')) #</span>
            <span style="width:50%" class="serlbldcAmt">#:trimNull(kendo.toString(dcAmt, 'n2')) #</span>
            <span style="width:50%" class="serlblparAmt">#:trimNull(kendo.toString(itemTotAmt, 'n2')) #</span>
            <span style="width:50%" class="serllblparReadyStatCd">#:trimNull(parResvStatNm) #</span>
        </div>
</script>

<script type="text/x-kendo-template" id="subTemplate3-b">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(itemCd) #</span>
            <span style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(calcUnitCd) #</span>
            <span style="width:50%">#:trimNull(itemQty) #</span>
            <span style="width:50%">#:trimNull(kendo.toString(itemPrc,'n2')) #</span>
            <span style="width:50%" class="serlbldcAmt">#:trimNull(kendo.toString(dcAmt,'n2')) #</span>
            <span style="width:50%" class="serlblparAmt">#:trimNull(kendo.toString(itemTotAmt,'n2')) #</span>
            <span style="width:50%" class="parlblparReqStatNm">#:chgPartRcvCd(itemReqStatCd) #</span>
        </div>
</script>

<script>

var subListData3 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                if("${fromWhere}" == "selectReservationReceiptMain"){//예약접수현황
                    params["sPreFixId"] = "RE";
                    params["sDocNo"] = _sResvDocNo;
                }else if("${fromWhere}" == "selectPartReservationMain"){//부품예약현황
                    params["sPreFixId"] = "PRE";
                    params["sDocNo"] = _parResvDocNo;
                }else if("${fromWhere}" == "selectWorkHistoryMain"){//RO현황
                    params["sPreFixId"] = "RO";
                    params["sDocNo"] = _sRoDocNo;
                }else if("${fromWhere}" == "selectEstimateListMain"){//견적현황
                    params["sPreFixId"] = "ET";
                    params["sDocNo"] = _sEstDocNo;
                }else if("${fromWhere}" == "selectCalculateMain"){//정산현황
                    params["sPreFixId"] = "RO";
                    params["sDocNo"] = _sRoDocNo;
                }
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
        if(e.items.length>0){
            $("#C_lbrDcRate").text("(" + e.items[0].dcRate + "%)");
        }
    }
    ,error:function(e){
        console.log(e);
    }
});
chgPartRcvCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.partRcvCdMap[val].cmmCdNm;
    }
    return returnVal;
};
$(document).ready(function() {
    $("#sublistView3").kendoListView({
        dataSource:subListData3
        ,template: kendo.template($("#"+"${partsTemplate}").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#sublistView3").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#sublistView3").css({"background-image":"none"});
            }
        }
    });
    if("${fromWhere}" == "selectReservationReceiptMain" ){
        $("#serllblparReadyStatCd, #parlblparReqStatNm").hide();
    }else if("${fromWhere}" == "selectPartReservationMain"){
        $("#serlblitemAmt, #parlblparReqStatNm").hide();
        $("#serlblpart").html("<spring:message code='ser.lbl.partsReserveInfo' />");
    }else if("${fromWhere}" == "selectWorkHistoryMain"){
        $("#serlblitemAmt, #serllblparReadyStatCd").hide();
    }else if("${fromWhere}" == "selectEstimateListMain"){
        $("#serllblparReadyStatCd, #parlblparReqStatNm").hide();
    }else if("${fromWhere}" == "selectCalculateMain"){
        $("#serllblparReadyStatCd, #parlblparReqStatNm").hide();
    }
});
</script>
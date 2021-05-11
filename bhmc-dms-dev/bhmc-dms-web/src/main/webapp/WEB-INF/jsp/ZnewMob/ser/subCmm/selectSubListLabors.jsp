<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비항목 -->
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.lbr" /><!-- 정비항목 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList2Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.rpirNm" /><!-- 정비명칭 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.lbrTp" /><!-- 정비유형 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.custLbr" /><!-- 수불공임 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.lbrUntPrc" /><!-- 공임단가 --></span>
                <span style="width:50%" id="serlblconfirmLbrAmt"><spring:message code="ser.lbl.confirmLbrAmt" /><!-- 공임금액 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.dcAmt" /><!-- 할인금액 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.lbrCamt" /><!-- 공임비 --></span>
                <span style="width:50%" id="serlbltecNm"><spring:message code="ser.lbl.tecNm" /><!-- 정비사 --></span>
            </div>
            <div>
                <div id="sublistView2" style="height: 200px; overflow: scroll;"></div>
            </div>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub2"><span></span></div>
        </div>
    </div>
</div>
<script type="text/x-kendo-template" id="subTemplate2">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(lbrCd) #</span>
            <span style="width:50%">#:trimNull(lbrNm) #</span>
            <span style="width:50%">#:trimNull(lbrTpNm) #</span>
            <span style="width:50%">#:trimNull(lbrHm) #</span>
            <span style="width:50%">#:trimNull(lbrPrc) #</span>
            <span style="width:50%">#:trimNull(lbrAmt) #</span>
            <span style="width:50%">#:trimNull(dcAmt) #</span>
            <span style="width:50%">#:trimNull(lbrTotAmt) #</span>
        </div>
</script>

<script type="text/x-kendo-template" id="subTemplate2-a">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(lbrCd) #</span>
            <span style="width:50%">#:trimNull(lbrNm) #</span>
            <span style="width:50%">#:trimNull(lbrTpNm) #</span>
            <span style="width:50%">#:trimNull(lbrHm) #</span>
            <span style="width:50%">#:trimNull(lbrPrc) #</span>
            <span style="width:50%">#:trimNull(dcAmt) #</span>
            <span style="width:50%">#:trimNull(lbrTotAmt) #</span>
            <span style="width:50%">#:trimNull(realTecNm) #</span>
        </div>
</script>

<script>
var subListData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do' />"
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
$(document).ready(function() {
    $("#sublistView2").kendoListView({
        dataSource:subListData2
        ,template: kendo.template($("#"+"${laborsTemplate}").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#sublistView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#sublistView2").css({"background-image":"none"});
            }
        }
    });
    if("${fromWhere}" == "selectWorkHistoryMain" ){
        $("#serlblconfirmLbrAmt").hide();
    }else {
        $("#serlbltecNm").hide();
    }
});
</script>
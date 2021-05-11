<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 고객요청사항 -->
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList1Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
                    <div class="listhead dlistitem">
                        <span style="width:30%"><spring:message code="ser.lbl.custReqCd" /><!-- 의견코드 --></span>
                        <span style="width:70%"><spring:message code="ser.lbl.reqCont" /><!-- 요청내용 --></span>
                    </div>
            <div>
                <div id="sublistView" style="height: 200px; overflow: scroll;"></div>
            </div>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub1"><span></span></div>
        </div>
    </div>
</div>
<!-- 고객요청사항 -->
<script type="text/x-kendo-template" id="subTemplate">
        <div class="dlistitem bgNone">
            <span style="width:30%">#:trimNull(lineNo) #</span>
            <span style="width:70%">#:trimNull(custReqCont) #</span>
        </div>
</script>
<script>
var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                if("${fromWhere}" == "selectReservationReceiptMain"){//예약접수현황
                    params["sPreFixId"] = "RE";
                    params["sJobNo"] = _sResvDocNo;
                }else if("${fromWhere}" == "selectPartReservationMain"){//부품예약현황
                    params["sPreFixId"] = "PRE";
                    params["sJobNo"] = _parResvDocNo;
                }else if("${fromWhere}" == "selectWorkHistoryMain"){//RO현황
                    params["sPreFixId"] = "RO";
                    params["sJobNo"] = _sRoDocNo;
                }else if("${fromWhere}" == "selectEstimateListMain"){//견적현황
                    params["sPreFixId"] = "ET";
                    params["sJobNo"] = _sEstDocNo;
                }else if("${fromWhere}" == "selectCalculateMain"){//정산현황
                    params["sPreFixId"] = "RO";
                    params["sJobNo"] = _sRoDocNo;
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
    /* ,change :function(e){
        rowTotal=this._total;
    } */
    ,error:function(e){
        console.log(e);
    }
});
$(document).ready(function() {
    $("#sublistView").kendoListView({
        dataSource:subListData
        ,template: kendo.template($("#subTemplate").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#sublistView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#sublistView").css({"background-image":"none"});
            }
        }
    });
});
</script>
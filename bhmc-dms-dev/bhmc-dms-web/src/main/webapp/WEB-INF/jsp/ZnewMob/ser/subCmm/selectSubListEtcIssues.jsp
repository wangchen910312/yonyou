<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 기타사항 -->
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.lbl.othDetail" /><!-- 기타사항 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="subList4Btn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="listhead dlistitem">
                <span style="width:33%"><spring:message code="ser.lbl.etcCdTp" /><!-- 기타사항코드 --></span>
                <span style="width:34%"><spring:message code="ser.lbl.etcCdNm" /><!-- 기타사항명칭 --></span>
                <span style="width:33%"><spring:message code="ser.lbl.etcAmt" /><!-- 기타사항금액 --></span>
            </div>
            <div>
                <div id="sublistView4" style="height: 200px; overflow: scroll;"></div>
            </div>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub4"><span></span></div>
        </div>
    </div>
</div>
<!-- 기타사항 -->
<script type="text/x-kendo-template" id="subTemplate4">
    <div class="dlistitem bgNone">
            <span style="width:33%">#:trimNull(etcTpCd) #</span>
            <span style="width:34%">#:trimNull(etcTpNm) #</span>
            <span style="width:33%">#:trimNull(etcReqPrc) #</span>
        </div>
</script>
<script>
var subListData4 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
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
    $("#sublistView4").kendoListView({
        dataSource:subListData4
        ,template: kendo.template($("#subTemplate4").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#sublistView4").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#sublistView4").css({"background-image":"none"});
            }
        }
    });
});
</script>
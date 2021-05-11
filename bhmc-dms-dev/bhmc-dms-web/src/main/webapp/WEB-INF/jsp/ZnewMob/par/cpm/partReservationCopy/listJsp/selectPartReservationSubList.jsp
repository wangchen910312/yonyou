<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="ser.title.itemInfo" /><!-- 부품정보 --></h2>
        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="listhead dlistitem">
                <span style="width:35%"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></span>
                <span style="width:65%"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></span>
                <span class="clboth" style="width:35%"><spring:message code="ser.lbl.itemUntPrc" /><!-- 부품단가 --></span>
                <span style="width:35%"><spring:message code="ser.lbl.qty" /> / <spring:message code="ser.lbl.unitCd" /><!-- 수량/단위 --></span>
                <span style="width:30%"><spring:message code="ser.lbl.preParAmt" /><!-- 예정부품대 --></span>
            </div>
                <div id="subListView" style="height:200px; overflow:scroll"></div>
        </div>
    </div>
</div>

<!-- 결제정보 -->

<script type="text/x-kendo-template" id="subTemplate">
        <div class="dlistitem bgNone">
            <span style="width:35%">#:trimNull(itemCd) #</span>
            <span style="width:65%">#:trimNull(itemNm) #</span>
            <span style="width:35%">#:kendo.toString(itemPrc,'n2') #</span>
            <span style="width:35%">#:trimNull(itemQty) # / #:trimNull(calcUnitCd) #</span>
            <span style="width:30%">#:kendo.toString(itemTotAmt,'n2') #</span>
        </div>
</script>

<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var subListData = new kendo.data.DataSource({
      transport:{
            read:{
                url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
            }
            ,parameterMap:function(options, operation){
                var params = {};
                params["sDocNo"] = $("#parResvDocNo").val();
                params["sPreFixId"] = "PRE";
                return kendo.stringify(params);
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
});

$(document).ready(function(){
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template:kendo.template($("#subTemplate").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });
});

</script>

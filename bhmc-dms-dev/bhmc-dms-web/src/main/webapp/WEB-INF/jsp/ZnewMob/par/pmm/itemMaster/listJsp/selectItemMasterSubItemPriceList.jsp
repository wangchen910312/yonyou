<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="par.title.itemPrc" /><!-- 부품가격--></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnItemPrc"><span>상세내용 보기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listhead dlistitem">
            <span style="width:30%"><spring:message code='par.lbl.movingAvgPrc' /></span>
            <span style="width:30%"><spring:message code='par.lbl.lastGrPrice' /></span>
            <span style="width:40%"><spring:message code='par.lbl.bestSalePriceCost' /></span>
            <span style="width:30%" class="clboth"><spring:message code='par.lbl.basePrice' /></span>
            <span style="width:30%"><spring:message code='par.lbl.salePriceCost01' /></span>
            <span style="width:40%"><spring:message code='par.lbl.salePriceCost02' /></span>
            <span style="width:30%" class="clboth"><spring:message code='par.lbl.salePriceCost03' /></span>
            <span style="width:40%"><spring:message code='par.lbl.salePriceCost04' /></span>
        </div>
        <div>
            <div id="subListView2" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate2">
<div class="dlistitem bgNone">
    <span style="width:30%">#:commaZero(movingAvgPrc) #</span>
    <span style="width:30%">#:commaZero(rectGiPrc) #</span>
    <span style="width:40%">#:commaZero(retlPrc) #</span>
    <span style="width:30%" class="clboth">#:changeBasePriceCalTpMap(stdPrcCd) #</span>
    <span style="width:30%">#:commaZero(retlPrc) #</span>
    <span style="width:40%">#:commaZero(whslPrc) #</span>
    <span style="width:30%" class="clboth">#:commaZero(incPrc) #</span>
    <span style="width:30%">#:commaZero(grtePrc) #</span>
</div>
</script>

<script>
var subListData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sItemCd"] =$("#itemCd").val();
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
    }
    ,error:function(e){
        console.log(e);
    }
});
changeBasePriceCalTpMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = basePriceCalTpMap[val];
    }
    return returnVal;
};


$(document).ready(function() {
    $("#subListView2").kendoListView({
        dataSource:subListData2
        ,template: kendo.template($("#subTemplate2").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView2").css({"background-image":"none"});
            }
        }
    });
});

</script>

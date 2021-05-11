<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="par.title.comItemCd" /><!--통용부번--></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnComItemCd"><span>상세내용 보기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code='par.lbl.comItemCd' /></span>
            <span style="width:50%"><spring:message code='par.lbl.comItemNm' /></span>
            <span style="width:50%" class="clboth"><spring:message code='par.lbl.avlbStockQty' /></span>
            <span style="width:50%"><spring:message code='par.lbl.carLine' /></span>
            <span style="width:50%" class="clboth"><spring:message code='par.lbl.itemDstinCd' /></span>
        </div>
        <div>
            <div id="subListView3" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate3">
    <div class="dlistitem bgNone">
    <span style="width:50%" >#:comItemCd #</span>
    <span style="width:50%" >#:comItemNm #</span>
    <span style="width:50%" class="clboth" >#:commaZero(avlbStockQty) #</span>
    <span style="width:50%" >#:changeCarlineCd(carlineCd) #</span>
    <span style="width:50%" class="clboth" >#:changeItemDstinCd(itemDstinCd) #</span>
</div>
</script>

<script>
var subListData3 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/par/pmm/itemMaster/selectItemMasterSubComItemData.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sItemCd"] = $("#itemCd").val();
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
//1단계부품분류
changeItemDstinCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = itemDstinCdObj[val];
    }
    return returnVal;
}

changeCarlineCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = carlineCdObj[val];
    }
    return returnVal;
}
$(document).ready(function() {
    $("#subListView3").kendoListView({
        dataSource:subListData3
        ,template: kendo.template($("#subTemplate3").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView3").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView3").css({"background-image":"none"});
            }
        }
    });
})
</script>

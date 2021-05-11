<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="par.title.itemDstinCd" /><!-- 부품유형--></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnItemDstinCd"><span>상세내용 보기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code='par.lbl.partItemGrpNm' /><!-- 유형명칭  --></span>
            <span style="width:50%"><spring:message code='par.lbl.itemDstin1st' /><!-- 1단계부품분류 --></span>
            <span style="width:50%" class="clboth"><spring:message code='par.lbl.itemDstin2nd' /><!-- 2단계부품분류--></span>
            <span style="width:50%"><spring:message code='par.lbl.itemDstin3rd' /><!-- 3단계부품분류 --></span>
        </div>
        <div>
            <div id="subListView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</div>
<script type="text/x-kendo-template" id="subTemplate">
<div class="dlistitem bgNone">
    <span style="width:50%" >#:itemGrpNm #</span>
    <span style="width:50%" >#:changeItemDstin1stCdMap(itemDstin1st) #</span>
    <span style="width:50%" class="clboth" >#:changeItemDstin2ndCdMap(itemDstin2nd) #</span>
    <span style="width:50%" >#:changeItemDstin3rdCdMap(itemDstin3rd) #</span>
</div>
</script>

<script>
var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevelsItemGroup.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sItemCd"] = $("#itemCd").val();
                params["sLvlVal"] = "1"
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
changeItemDstin1stCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = itemDstin1stCdMap[val];
    }
    return returnVal;
}

//2단계부품분류
changeItemDstin2ndCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = itemDstin2ndCdMap[val];
    }
    return returnVal;
}

//3단계부품분류
changeItemDstin3rdCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = itemDstin3rdCdMap[val];
    }
    return returnVal;
}
$(document).ready(function() {
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template: kendo.template($("#subTemplate").html())
        ,autoBind: false
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
})
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="crm.menu.satisFaction" /> <spring:message code="global.title.list" /><!-- 만족도조사 목록 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:100%"><spring:message code="crm.lbl.stsfIvstNm" /><!-- 만족도조사명 --></span>
        </div>
        <div>
            <div id="listView" style="height:300px; overflow:scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:100%">#:trimNull(stsfIvstNm) #</span>
</div>
</script>

<script>
var viewRow=10;
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];

stsfIvstGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = stsfIvstNmMap[val].stsfIvstNm;
    }
    return returnVal;
};

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/crm/css/satisFactionManage/selectSatisFactionManagesNew.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation){
            var params = {};
            params["pageIndex"] = pageIndex;
            params["pageSize"] = pageSize;
            params["sStsfIvstNm"] = stsfIvstGrid($("#sSeq_").val());
            return kendo.stringify(params);
        }
    }
    ,batch:true
    ,pageSize:pageSize
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
    ,change:function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
            for(var i=0; i<listData._view.length; i++){
                listData._view[i].rnum=i+1;
            }
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class", "search_open");
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

function listViewClick(dataItem)
{
    customerSearchPopup(dataItem);
}

</script>


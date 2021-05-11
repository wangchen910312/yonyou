<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="listarea">
    <div class="dlistitem listhead">
        <span style="width:50%" ><spring:message code="sal.lbl.date" /><!-- 일자--></span>
        <span style="width:50%" ><spring:message code="sal.lbl.dpstAmtTotDay" /><!-- 입금 --></span>
        <span style="width:50%" ><spring:message code="sal.lbl.wdrwAmtTotDay" /><!-- 출금 --></span>
        <span style="width:50%" ><spring:message code="par.lbl.balAmtCol" /><!-- 잔액 --></span>
    </div>
    <div id="listView" style="height:300px; overflow:scroll"></div>
</div>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%">#:mm #-#:dd #</span>
    <span style="width:50%">#:kendo.toString(totDpstAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(wdrwAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(totBalAmt, 'n2') #</span>
</div>
</script>

<script>
var _listHeight = listHeight();
var pageSize=0; rowTotal=-1; //scrollEvent off
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/trm/fundStatus/selectFundStatusDaySearch.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sYy"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyy");
                params["sMm"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "MM");
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
        rowTotal=-1;
        $.each(e.items,function(idx,obj){
            obj.rnum = (idx+1);
        });
        /* $("#listView").height(_listHeight); */
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
});

function listHeight(){
    var result=0;
    var _contentTitleHeight=0;
    $(".content_title").each(function(index,content){
        _contentTitleHeight+=$(content).outerHeight();
    });
    result =$(window).height()-($("#header").outerHeight()+_contentTitleHeight+$(".listhead").outerHeight()+$(".btnfixed").outerHeight());
    return result;
};

function listViewClick(dataItem)
{
    contentDetail(dataItem);
}
</script>


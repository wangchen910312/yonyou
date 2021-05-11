<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="formarea">
    <table class="flist01">
        <tr>
            <th scope="row" style="width:20%"><spring:message code='par.lbl.itemInnerOutTotQty' /><!-- 총수량 --></th>
            <td style="width:20%;"><input type="text" id = "totQty" style="text-align: right; width:70%;" readOnly/></td>
            <th scope="row" style="width:20%"><spring:message code='ser.lbl.totAmt' /><!-- 총금액 --></th>
            <td><input type="text" id = "totAmt" style="text-align: right; width:100%;" readOnly/></td>
        </tr>
    </table>
</div>

<div class="listarea">
    <div class="dlistitem listhead">
        <span style="width:60%" ><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
        <span style="width:40%" ><spring:message code="sal.lbl.extColor" /><!-- 외색 --></span>
        <span style="width:60%" ><spring:message code="global.lbl.ocnCode" /><!--OCN코드/OCN명 --></span>
        <span style="width:40%" ><spring:message code="global.lbl.assignmentUnit" /><!--배정수량 --></span>
        <span style="width:60%" ><spring:message code="sal.lbl.finalDcAmt" /><!-- 최종공제금액 --></span>
    </div>
    <div id="listView" style="height:300px; overflow:scroll"></div>
</div>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:60%">#:'['+carlineCd+']'+carlineNm #</span>
    <span style="width:40%">#:extColorNm #</span>
    <span style="width:60%">#:'['+ocnCd+']' + ocnNm #</span>
    <span style="width:40%">#: DALO_ALLO_QTY #</span>
    <span style="width:60%">#:kendo.toString(DALO_FINAL_AMT, 'n2') #</span>
</div>
</script>

<script>
var pageSize=0, rowTotal=-1;
var pageIndex=0, viewRow =0;

var totQty = 0;
var totAmt = 0;

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/trm/dayFundStatus/selectDayFundStatusSearch.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {

                var params = {};
                params["sDlrCd"]  = dlrCd;
                params["sYyMmDd"] = $("#sStartDt").val().replace("-","").replace("-","");

                console.log("params:::",params);

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
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");

        $.each(e.items,function(idx,obj){
            obj.rnum = (idx+1);

            if(DALO_ALLO_QTY != null){
                totQty += Number(obj.DALO_ALLO_QTY);
            }

            if(DALO_FINAL_AMT != null){
                totAmt += Number(obj.DALO_FINAL_AMT);
            }

        });

        $("#totQty").val(totQty);
        $("#totAmt").val(kendo.toString(totAmt, 'n2'));
    }
});

function listViewClick(dataItem)
{
    contentDetail(dataItem);
}
</script>


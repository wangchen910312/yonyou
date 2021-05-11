<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content_list -->
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="par.title.invcList" /><!-- Invoice 목록 --></h2>
    </div>

    <div class="listarea">
        <div class="listhead dlistitem" style="padding-right:10px;">
            <span style="width:50%"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></span>
            <span style="width:50%; text-align:right;"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></span>
            <span class="clboth" style="width:35%"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></span>
            <span style="width:35%; text-align:center;"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></span>
            <span style="width:30%; text-align:right;"><spring:message code="par.lbl.bpCd" /><!-- 업체코드 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">#:chgDate2DateTimeStr(invcDt) #</span>
        <span style="width:50%; text-align:right; ">#:trimNull(mobisInvcNo) #</span>
        <span class="clboth" style="width:35%">#:changeInvcTpCd(invcTp) #</span>
        <span style="width:35%; text-align:center;">#:changeInvcStatCd(invcStatCd) #</span>
        <span style="width:30%; text-align:right;">#:changeBpCdMap(bpCd) #</span>
    </div>
</script>

<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/pcm/invc/selectInvcItems.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sInvcTp"] = $("#sInvcTp").val();
                params["sMobisInvcNo"] = $("#sMobisInvcNo").val();
                if($("#sInvcDtFr").val() == ""){
                    params["sInvcDtFr"] = null;
                    params["sInvcDtTo"] = null;
                }else{
                    params["sInvcDtFr"] = chgDate($("#sInvcDtFr").val());
                    params["sInvcDtTo"] = chgDate($("#sInvcDtTo").val());
                }
                params["sBpCd"]=$("#sBpCd").val();
                params["sInvcStatCd"] = $("#sInvcStatCd").val();
                if($("#sRegDtFr").val() == ""){
                    params["sRegDtFr"] = null;
                    params["sRegDtTo"] = null;
                }else{
                    params["sRegDtFr"] = chgDate($("#sRegDtFr").val());
                    params["sRegDtTo"] = chgDate($("#sRegDtTo").val());
                }
                params["sItemDstinCd"]="";
                return kendo.stringify(params);
            }
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
    ,change :function(e){

    }
    ,error:function(e){
        console.log(e);
    }
});

changeInvcTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = invcTpMap[val].cmmCdNm;
    }
    return returnVal;
};

changeInvcStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = invcStatMap[val].cmmCdNm;
    }
    return returnVal;
};

changeBpCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = bpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(e)
{
    contentItemList(e);
}
function initList(){
    tempData=[];
    pageIndex = 0,rowTotal = 0;
    pageSize = viewRow;
}
</script>

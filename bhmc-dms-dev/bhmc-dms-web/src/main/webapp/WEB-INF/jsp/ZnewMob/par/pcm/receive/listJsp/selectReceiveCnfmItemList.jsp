<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="content_itemList" class="content_detail" style="display:none">
    <div class="content_title conttitlePrev">
        <h2><span id="lblInvcDocNo" ></span> <spring:message code="global.lbl.budgetDetlCont" /><!-- 상세내역 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead checkitem">
            <span style="width:50%"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></span>
            <span style="width:50%"><spring:message code="par.lbl.grQty" />(<spring:message code="par.lbl.unit" />)<!-- 입고수량(단위) --></span>
            <span class="clboth" style="width:50%"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
            <span style="width:50%"><spring:message code="global.lbl.statNm" /><!--  상태 --></span>
        </div>
        <div>
            <div id="listView2" style="height: 300px; overflow: scroll;"></div>
        </div>
        <input type="hidden" id="sInvcDocNo" value=""/>
    </div>
    <div class="btnfixed">
        <div class="con_btnarea btncount2">
            <div style="width:20%;"><em style="position:relative;top:8px;font-size:14px;"><spring:message code="mob.lbl.barcode" /><!-- 바코드 --></em></div>
            <div style="width:40%;margin-bottom:10px;" class="al">
                <div class="f_text f_barc"><input type="text" id="barcode" name="barcode" /></div>
            </div>
            <dms:access viewId="VIEW-D-12692" hasPermission="${dms:getPermissionMask('READ')}">
                <div style="width:20%; padding:0 2px;"><span class="btnd1" id="btnBarcodeConfirm"><spring:message code='global.btn.confirm' /><!-- 확인 --></span></div>
            </dms:access>
            <dms:access viewId="VIEW-D-12691" hasPermission="${dms:getPermissionMask('READ')}">
                <div style="width:20%; padding-left:2px;"><span class="btnd1" id="btnBarcodeScan"><spring:message code='mob.lbl.scan' /><!-- 스캔 --></span></div>
            </dms:access>
            <div style="width:50%;"><span class="btnd1" id="btnItemListClose" ><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            <dms:access viewId="VIEW-D-12689" hasPermission="${dms:getPermissionMask('READ')}">
                <div style="width:50%;padding-right:2px;"><span class="btnd1" id="btnFix"><spring:message code='par.lbl.confirm' /><!-- 확정 --></span></div>
            </dms:access>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template2">
<div class="checkitem" onclick="javascript:listViewClick2(listData._view[#:rnum-1 #]);>
            <span style="width:50%; display:none;">#:rnum #</span>
            <span class="check">
                <input name="isSave" type="checkbox" class="f_check" name="check01"/><label for="check01"></label>
            </span>
            <span style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(invcQty) # (#:trimNull(invcUnitCd) #)</span>
            <span name="itemCd" class="clboth" style="width:50%">#:trimNull(itemCd) #</span>
            <span name="invcStatCd" style="width:50%" >#:changeInvcStatCd(invcStatCd) #</span>
            <input name="purcOrdNo" type="hidden" value=#:purcOrdNo # />
        </div>
</script>

<script>
var listData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/pcm/invc/selectReceiveItemByCondition.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sBpCd"] =$("#sBpCd").val();
                params["sMobisInvcNo"] =$("#sMobisInvcNo").val();
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
        lastInventoryData=e.items;

        for(var i=0; i<e.items.length; i++){
            var isSaveVal = "";
            if(saveList != null){
                for(var j=0; j<saveList.length; j++){
                    if(saveList[j].itemCd == e.items[i].itemCd){
                        isSaveVal = "checked";
                    }
                }
            }
        }
        setTimeout(function(){
           $("#barcode").focus();
        }, 200);
    }
    ,error:function(e){
        console.log(e);
    }
});

changeInvcStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal =invcStatMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick2(e)
{
   contentDetail2(e.purcOrdNo, e.itemCd);
}

function sentDataToParent(obj)
{
   getDataFromChild(obj);
}
</script>

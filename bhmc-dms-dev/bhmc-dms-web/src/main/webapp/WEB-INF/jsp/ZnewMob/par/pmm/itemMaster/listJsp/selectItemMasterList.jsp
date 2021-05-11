<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="par.title.itemInfoMgmtList" /><!-- 부품정보관리 목록--></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:30%"><spring:message code="par.lbl.itemCd" /><!-- 품목코드 --></span>
            <span style="width:40%"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></span>
            <span style="width:30%"><spring:message code="par.lbl.abcInd" /><!-- CLASS --></span>
            <span style="width:30%"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></span>
            <span style="width:40%"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></span>
            <span style="width:30%"><spring:message code="par.lbl.carLine" /><!-- 차종 --></span>
            <span class="clboth" style="width:100%"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></span>
            <span class="clboth" style="width:100%"><spring:message code="par.lbl.itemBpNm" /><!-- 업체명칭 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
<div class="dlistitem" id="listContentRow" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
    <span style="width:30%" name="_itemCd" >#:itemCd #</span>
    <span style="width:40%">#:changeItemDstinCd(itemDstinCd) #</span>
    <span style="width:30%">#:trimNull(abcInd) #</span>
    <span style="width:30%">#:changeBpTp(bpTp) #</span>
    <span style="width:40%">#:changeBrandCd(brandCd) #</span>
    <span style="width:30%">#:changeCarlineCd(carlineCd) #</span>
    <span class="clboth" style="width:100%">#:trimNull(itemNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(bpNm) #</span>
</div>
</script>

<script>

var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/par/pmm/itemMaster/selectItemMasterLists.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sItemCd"] = parent.$("#sItemCd").val();
                params["sItemNm"] = parent.$("#sItemNm").val();
                params["sBpTp"] = parent.$("#sBpTp").data("kendoExtDropDownList").value();
                params["sBrandCd"] = parent.$("#sBrandCd").data("kendoExtDropDownList").value();
                params["sBpNm"] = parent.$("#sBpNm").val();
                params["sCarlineCd"] = parent.$("#sCarlineCd").val();
                params["sCarlineCd2"] = parent.$("#sCarlineCd2").val();
                params["sAbcInd"] = parent.$("#sAbcInd").val();
                params["sItemDstinCd"] = parent.$("#sItemDstinCd").val();
                params["sBrandCd"] = parent.$("#sBrandCd").val();
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
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});


/* function removeItem(obj){
    var itemCd = $(obj).parent().parent().find("span[name='_itemCd']").text();
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        if($(item).find("span[name='_itemCd']").text() == itemCd){
             return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx-1]);
    listView.refresh();
} */

//changeBrandCd Func
changeBrandCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.brandCdObj[val];
    }

    if(returnVal == undefined){
        returnVal = "";
    }
    return returnVal;
};
//거래처유형
changeBpTp = function(val){

    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        returnVal = parent.bpTpObj[val];
    }
    return returnVal;
};
//changeCarlineCd Func
changeCarlineCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.carlineCdObj[val] != undefined){
            returnVal = parent.carlineCdObj[val];
        }
    }
    return returnVal;
};
//changeAbcInd Func
changeAbcInd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.abcIndObj[val];
    }
    return returnVal;
};
changeSpyrCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.spyrCdMap[val];
    }
    return returnVal;
};

changeItemDstinCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.itemDstinCdObj[val];
    }
    return returnVal;
};
function listViewClick(dataItem){
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");
    $("#header_title span").removeAttr("class");
    var key=dataItem.itemCd;
    if( key != null && key != 'undefined'){
        $.ajax({
            url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",
            data:JSON.stringify({ sItemCd:key}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
             }
        }).done(function(result) {
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            console.log("result:::",result);
            partsJs.validate.groupObjAllDataSet(result);

            $("#grStrgeCd").val(result.strgeCdList);
            $("#mm3AvgDmndQty").val(kendo.toString(result.mm3AvgDmndQty, 'n2'));
            $("#mm6AvgDmndQty").val(kendo.toString(result.mm6AvgDmndQty, 'n2'));
            $("#mm12AvgDmndQty").val(kendo.toString(result.mm12AvgDmndQty, 'n2'));
            $("#spyrCd").val(bpTpObj[result.bpTp]);
            $("#carlineCd").val(carlineCdObj[result.carlineCd]);


            $("#startDt").val(chgDate2Str(result.startDt));
            $("#endDt").val(chgDate2Str(result.endDt));
            $("#lastGrDt").val(chgDate2Str(result.lastGrDt));
            $("#lastGiDt").val(chgDate2Str(result.lastGiDt));
            $("#renewDt").val(chgDate2Str(result.renewDt));


            (result.endYn == "Y") ? $("#endYn").attr("checked",true):$("#endYn").attr("checked",false);
            (result.oldRplcParCmptYn == "Y") ? $("#oldRplcParCmptYn").attr("checked",true):$("#oldRplcParCmptYn").attr("checked",false);
            (result.newRplcParCmptYn == "Y") ? $("#newRplcParCmptYn").attr("checked",true):$("#newRplcParCmptYn").attr("checked",false);
            (result.stdrdStockCalcYn == "Y") ? $("#stdrdStockCalcYn").attr("checked",true):$("#stdrdStockCalcYn").attr("checked",false);
            (result.purcCqtyCalcYn == "Y") ? $("#purcCqtyCalcYn").attr("checked",true):$("#purcCqtyCalcYn").attr("checked",false);
            (result.nonMovingFlg == "Y") ? $("#nonMovingFlg").attr("checked",true):$("#nonMovingFlg").attr("checked",false);

            $(".content_title > .title_btn > span.co_open").each(function(){
                $(this).parent().parent().next(".co_view").hide();
                $(this).addClass('co_close');
            });

            // 표시여부 초기화
            btnItemDstinCdDisp = true;
            btnItemPrcDisp = true;
            btnComItemCdDisp = true;

            $("#fileDocNo").val(result.fileDocNo);

            $("#fileDocUrl").height(200);
            if( (result.fileDocNo != null) && (result.fileDocNo != "") ){
                $("#fileDocUrl").css({"background-image":"none"});
                $("#fileDocUrl").attr("src", "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + $("#fileDocNo").val() + "&fileNo=" + 1);
            }else{
                /* $("#fileDocUrl").attr("src", "<c:url value='/resources/img/mob/bg_nodata.png' />"); */
                $("#fileDocUrl").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }

            var comboE=$("#content_detail").find("[data-type='combo']");
            for(var i=0; i<comboE.length; i++){
                $(comboE[i]).siblings("span").children().css("background-color","#f0f0f0");
            }
            subListData.read();
            subListData2.read();
            subListData3.read();
        });
    }
}

</script>


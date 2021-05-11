<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list" >
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="par.title.purcOrdList" /><!-- 구매오더 현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></span>
            <span style="width:50%"><spring:message code="par.lbl.spyrCd" /><!-- 공급업체 --></span>

            <span class="clboth" style="width:50%"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></span>
            <span style="width:50%"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></span>

            <span class="clboth" style="width:100%"><spring:message code="par.lbl.ordReqDt" /><!-- 오더등록일 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll"></div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%">#:trimNull(purcOrdNo) #</span>
    <span style="width:50%">#:trimNull(bpNm) #</span>
    <span style="width:50%">#:changePurcOrdTp(purcOrdTp) #</span>
    <span style="width:50%">#:changePurcOrdStat(purcOrdStatCd) #</span>
    <span class="clboth" style="width:50%">#:LchgServerDate2Str(purcRegDt) #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var viewRow=10;
var pageIndex=0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var detailData;
// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;
                // 구매오더 검색조건 코드.
                var sBpCdArr = new Array();
                if($("#sBpCd").val() == ""){
                }else{
                    sBpCdArr[0] = $("#sBpCd").val();
                }

                var sPurcOrdStatArr = new Array();
                if($("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value() == ""){
                    params["sPurcOrdStatLst"] = null;
                }else{
                    sPurcOrdStatArr[0] = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                    params["sPurcOrdStatLst"] = sPurcOrdStatArr;
                }
                params["sBpCdList"]          = sBpCdArr;
                params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                params["sTrsfTp"]            = $("#sTrsfTp").data("kendoExtDropDownList").value();
                params["sTotPurcAmtFr"]        = $("#sTotPurcAmtFr").val().replace(/[^0-9.]+/g, '').replace(".00","");
                params["sTotPurcAmtTo"]        = $("#sTotPurcAmtTo").val().replace(/[^0-9.]+/g, '').replace(".00","");;
                params["sRegUsrId"]          = $("#sRegUsrId").val();

                params["sPurcRegDtFr"]       = chgDate($("#sPurcRegDtFr").val());
                params["sPurcRegDtTo"]       = chgDate($("#sPurcRegDtTo").val());
                params["sPurcOrdStatLst"]    =sPurcOrdStatArr;
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
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        contentList();
    }
});

//구매상태
changePurcOrdStat = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcOrdStatObj[val];
    }
    return returnVal;
};


//오더유형
changePurcOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcOrdTpObj[val];
    }
    return returnVal;
};

LchgServerDate2Str= function(val){
    return chgServerDate2Str(val);
};

function listViewClick(dataItem){
    contentDetail(dataItem);
}

</script>

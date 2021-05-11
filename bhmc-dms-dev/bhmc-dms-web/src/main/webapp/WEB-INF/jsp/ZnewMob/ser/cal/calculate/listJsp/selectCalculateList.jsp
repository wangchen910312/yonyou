<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='ser.menu.calcualateStatus' /><!-- 정산현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
            <span style="width:50%"><spring:message code="global.lbl.calcNo" /><!-- 서비스정산번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.calcWrtrNm" /><!-- 정산조작자 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.calcStat" /><!-- 서비스정산상태 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.calcDt" /><!-- 서비스정산시간 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll;"></div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%">#:trimNull(carRegNo) #</span>
        <span style="width:50%">#:vinNo #</span>
        <span style="width:50%">#:calcDocNo #</span>
        <span style="width:50%">#:regUsrNm #</span>
        <span style="width:50%">#:roTpNm #</span>
        <span style="width:50%">#:changeRoStatCd(calcStatCd) #</span>
        <span style="width:50%">#:regDt #</span>
        <span style="width:50%">#:roDt #</span>
    </div>
</script>


<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var viewRow=10;
var pageIndex=0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/ser/cal/calculate/selectCalculatesList.do' />"
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["firstIndex"] = pageIndex;
              params["lastIndex"] = pageSize;

              params["sCarRegNo"]   = $("#sCarRegNo").val();
              params["sRoTp"]       = $("#sRoTp").data("kendoExtDropDownList").value();
              params["sCalcDocNo"]  = $("#sCalcDocNo").val();
              params["sVinNo"]      = $("#sVinNo").val();
              params["sRegUsrNm"]   = $("#sRegUsrNm").val();
              params["sCalcStatCd"] = $("#sCalcStatCd").data("kendoExtDropDownList").value();
              params["sCalcFromDt"] = chgDate($("#sCalcFromDt").val());
              params["sCalcToDt"]   = chgDate($("#sCalcToDt").val());
              params["sRoFromDt"]   = chgDate($("#sRoFromDt").val());
              params["sRoToDt"]     = chgDate($("#sRoToDt").val());
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
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
      makeDetailHtml(listData._view, keyMapArr, "#defaultHtml", "#hiddenHtml");
  }
});

// RO유형
roTpCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = roTpCdArr[val].cmmCdNm;
     }
     return returnVal;
};

changeRoStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(dataItem){
    //parent.contentDetail(e.dataItem.roDocNo);
    contentDetail(dataItem);
}

</script>
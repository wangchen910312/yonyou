<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.receiveList" /><!-- 수납현황  --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
            <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.calcCompNm" /><!-- 정산완료자 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.payStat" /><!-- 수납등록상태 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.calcEndDt" /><!-- 정산완료시간 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.paidYn" /><!-- 지불완료여부 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll"></div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="listViewClick(listData._view[#:rnum-1 #]);";>
        <span style="width:50%">#:trimNull(carRegNo) #</span>
        <span style="width:50%">#:trimNull(vinNo) #</span>
        <span style="width:50%">#:trimNull(roDocNo) #</span>
        <span style="width:50%">#:trimNull(calcPrsnNm) #</span>
        <span style="width:50%">#:trimNull(roTpNm) #</span>
        <span style="width:50%">#:trimNull(receiveCdGrid(rcvStatCd)) #</span>
        <span style="width:50%">#:trimNull(chgDate2DateTimeStr(calcDt)) #</span>
        <span style="width:50%">#:trimNull(paymYnNm) #</span>
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
          url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveStatus.do' />"
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["firstIndex"] = pageIndex;
              params["lastIndex"] = pageSize;
              params["sRoDocNo"] = $("#sRoDocNo").val();//
              params["sRoTp"] = $("#sRoTp").data("kendoExtDropDownList").value();
              params["sRcvStatCd"] = $("#sRcvStatCd").data("kendoExtDropDownList").value();
              params["sPaymTp"] = $("#sPaymTp").data("kendoExtDropDownList").value();
              params["sPaymPrid"] = $("#sPaymPrid").data("kendoExtDropDownList").value();
              params["sVinNo"] = $("#sVinNo").val();
              params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
              params["sCarRegNo"] = $("#sCarRegNo").val();
              params["sPaymUsrNm"] = $("#sPaymUsrNm").val();
              params["sCalcPrsnNm"] = $("#sCalcPrsnNm").val();
              params["sPaymYn"]     = $("#sPaymYn").data("kendoExtDropDownList").value();

              if($("#sRcvCpltFromDt").val() == "" ){
                  params["sRcvCpltFromDt"] = null;
              }else{
                  params["sRcvCpltFromDt"] = chgDate($("#sRcvCpltFromDt").val());
              }

              if($("#sRcvCpltToDt").val() == "" ){
                  params["sRcvCpltToDt"] = null;
              }else{
                  params["sRcvCpltToDt"] = chgDate($("#sRcvCpltToDt").val());
              }

              params["sSerParDstinCd"] = "SER";
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

//수납 구분
receiveCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = receiveCdMap[val].cmmCdNm;
     }
     return returnVal;
};


function listViewClick(dataItem){
    contentDetail(dataItem);
}

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem">
        <span style="width:50%">#:chgDate2DateTimeStr(regDt) #</span>
        <span style="width:50%">#:changeStrgeCd(strgeCd) #</span>
        <span class="clboth" style="width:50%">#:trimNull(stockDdDocNo) #</span>
        <span style="width:50%">#:trimNull(prsnId) #</span>
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

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;



// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      params["sStrgeCd"] = parent.$("#sStrgeCd").val();
      params["sStockDdDocNo"] = parent.$("#sStockDdDocNo").val();
      params["sPrsnId"] = parent.$("#sPrsnId").val();

      if(parent.$("#search1Area span[name='searchStr']").text() == ""){
          params["sRegDtFr"] = null;
          params["sRegDtTo"] = null;
      }else{
          params["sRegDtFr"] = chgDate(parent.$("#sRegDtFr").val());
          params["sRegDtTo"] = chgDate(parent.$("#sRegDtTo").val());
      }


      $.ajax({
          //url:"<c:url value='/mob/par/stm/investigation/selectInvestigationsPop.do' />"
          url:"<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvLists.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          regDt:row.regDt,
                          strgeCd:row.strgeCd,
                          stockDdDocNo:row.stockDdDocNo,
                          prsnId:row.prsnId,

                          /* hidden */
                          sel1DlrCd:row.dlrCd,
                          sel1RegDt:row.regDt,
                          sel1StrgeCd:row.strgeCd,
                          sel1StockDdDocNo:row.stockDdDocNo,
                          sel1PrsnId:row.prsnId,
                          sel1DocStatCd:row.docStatCd,
                          sel1PltCd:row.pltCd,
                          sel1StockLockYn:row.stockLockYn,
                          sel1ApproveReqDt:row.approveReqDt,
                          sel1EndDt:row.endDt,
                          sel1CancDt:row.cancDt,
                          sel1SignOpnCont:row.signOpnCont,
                          sel1Remark:row.remark

                       });
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  app.hideLoading();
              }
          }
      });
    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(){ return rowTotal; }
  }
});


//입고 창고
changeStrgeCd = function(val){
  var returnVal = "";
  if(val != null && val != ""){
      returnVal = parent.storageObj[val];
  }
  return returnVal;
};



function listViewClick(e)
{
    //parent.contentItemList(e.dataItem.stockDdDocNo);//부품리스트 보기
    parent.saveData.updateList = [];
    parent.saveData.investigationVO = {};
    parent.contentItemListFromList(e.dataItem);//부품리스트 보기
}

//var app = new kendo.mobile.Application();
//var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
var app = setKendoMobApp();
</script>

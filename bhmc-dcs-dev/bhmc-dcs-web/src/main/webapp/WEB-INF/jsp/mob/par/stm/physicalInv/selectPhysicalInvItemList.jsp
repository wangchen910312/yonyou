<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view" id="itemListView" data-before-show="mainViewLoad">
  <ul  data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>



<script type="text/x-kendo-template" id="list-template">
        <div class="checkitem">
            <span class="check">
                <input name="isSave" type="checkbox" class="f_check" name="check01"/><label for="check01"></label>
            </span>
            <span name="itemCd" style="width:50%">#:trimNull(itemCd) #</span>
            <span style="width:50%">#:changeItemStatCd(itemStatCd) #</span>
            <span class="clboth" style="width:50%">#:trimNull(locCd) #</span>
            <span style="width:50%">#:trimNull(bookQty) #(#:trimNull(unitCd) #)</span>

            <input type="hidden" name="itemLstStockDdDocNo" value="#:stockDdDocNo #"/>
            <input type="hidden" name="itemLstStockDdDocLineNo" value="#:stockDdDocLineNo #"/>
            <input type="hidden" name="itemLstStrgeCd" value="#:strgeCd #"/>
            <input type="hidden" name="itemLstStrgeNm" value="#:strgeNm #"/>
            <input type="hidden" name="itemLstLocCd" value="#:locCd #"/>
            <input type="hidden" name="itemLstItemCd" value="#:itemCd #"/>
            <input type="hidden" name="itemLstItemStatCd" value="#:itemStatCd #"/>
            <input type="hidden" name="itemLstItemStatNm" value="#:itemStatNm #"/>
            <input type="hidden" name="itemLstItemNm" value="#:itemNm #"/>
            <input type="hidden" name="itemLstBookQty" value="#:bookQty #"/>
            <input type="hidden" name="itemLstDdQty" value="#:ddQty #"/>
            <input type="hidden" name="itemLstDiffQty" value="#:diffQty #"/>
            <input type="hidden" name="itemLstMovingAvgPrc" value="#:movingAvgPrc #"/>
            <input type="hidden" name="itemLstReasonCont" value="#:reasonCont #"/>

            <input type="hidden" name="itemLstItemDstinCn" value="#:itemDstinCn #"/>
            <input type="hidden" name="itemLstCarlineCd" value="#:carlineCd #"/>
            <input type="hidden" name="itemLstAbcInd" value="#:abcInd #"/>
            <input type="hidden" name="itemLstUnitCd" value="#:unitCd #"/>


        </div>
</script>

<script>


function mainViewLoad(){
    //parent.setCheckItemList();
}

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

      params["sStockDdDocNo"] = parent.$("#selStockDdDocNo").val();

      $.ajax({
          //url:"<c:url value='/mob/par/stm/investigation/selectApproveReqInvestigations.do' />"
          url:"<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemLists.do' />"
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

                      var isSaveVal = "";
                      /*
                      if(parent.saveList != null){
                          for(var i=0; i<parent.saveList.length; i++){
                              if(parent.saveList[i].itemCd == row.itemCd){
                                  isSaveVal = "checked";
                              }
                          }
                      }
                      */
                      if(parent.saveData.updateList != null){
                          for(var i=0; i<parent.saveData.updateList.length; i++){
                              if(parent.saveData.updateList[i].itemCd == row.itemCd){
                                  isSaveVal = "checked";
                              }
                          }
                      }
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          stockDdDocNo:row.stockDdDocNo,
                          stockDdDocLineNo:row.stockDdDocLineNo,
                          strgeCd:row.strgeCd,
                          strgeNm:changeStrgeCd(row.strgeCd),
                          locCd:row.locCd,
                          locNm:changeLocCd(row.locNm),
                          itemCd:row.itemCd,
                          itemStatCd:row.itemStatCd,
                          itemStatNm:changeItemStatCd(row.itemStatCd),
                          itemNm:row.itemNm,
                          bookQty:row.bookQty,
                          ddQty:row.ddQty,
                          diffQty:row.diffQty,
                          movingAvgPrc:row.movingAvgPrc,
                          reasonCont:row.reasonCont,

                          // hidden
                          itemDstinCn:row.itemDstinCd,
                          carlineCd:row.carlineCd,
                          abcInd:row.abcInd,
                          /* lastGrDt:row.lastGrDt, */
                          /* lastGiDt:row.lastGiDt, */
                          unitCd:row.unitCd,

                          isSave:isSaveVal
                      });
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  /*
                  setTimeout(function(){
                      options.success(data);
                  }, 1000);
                  */

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



// 재고상태
changeItemStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.itemStatObj[val];
    }
    return returnVal;
};

//입고 창고
changeStrgeCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.storageObj[val];
    }
    return returnVal;
};

//로케이션
changeLocCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.locationObj[val];
    }
    return returnVal;
};


function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.itemCd);
    parent.contentDetailFromList(e.dataItem);
}

//var app = new kendo.mobile.Application();
var app = setKendoMobApp();
</script>

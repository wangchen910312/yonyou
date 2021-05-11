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
            <span style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(invcQty) # (#:trimNull(invcUnitCd) #)</span>
            <span name="itemCd" class="clboth">#:trimNull(itemCd) #</span>
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

      params["sMobisInvcNo"] = parent.$("#sInvcDocNo").val();

      parent.$("#lblInvcDocNo").text(parent.$("#sInvcDocNo").val());

      $.ajax({
          //url:"<c:url value='/mob/par/pcm/invc/selectReceiveItemByCondition.do' />"
          url:"<c:url value='/mob/par/pcm/receive/selectReceiveCnfmItemLists.do' />"
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
                  //alert(rowTotal);
                  $.each(result.data , function(i , row){
                      rowIndex++;

                      var isSaveVal = "";
                      if(parent.saveList != null){
                          for(var i=0; i<parent.saveList.length; i++){
                              if(parent.saveList[i].itemCd == row.itemCd){
                                  isSaveVal = "checked";
                              }
                          }
                      }
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          itemNm:row.itemNm,
                          itemCd:row.itemCd,
                          invcQty:row.invcQty,
                          invcUnitCd:row.invcUnitCd,
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

function listViewClick(e)
{
    parent.contentDetail(e.dataItem.itemCd);
}

//var app = new kendo.mobile.Application();
//var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
var app = setKendoMobApp();
</script>

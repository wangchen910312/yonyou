<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subLists" data-role="listview" data-source="listData"  data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem bgNone">
    <!--
    <span class="check" name="check">
        <input id="isSave_#:rowData.rnum #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rowData.rnum #"></label>
    </span>
    -->

        <span style="width:50%">#:trimNull(rowData.rpirCd) #</span>
        <span style="width:50%">#:trimNull(rowData.rpirNm) #</span>
        <span style="width:50%">#:progressStatGrid(rowData.wrkStatCd) #</span>
        <span style="width:50%">#:chgDate2DateTimeStr(rowData.wrkStartDt) #</span>
        <span style="width:50%">#:chgDate2DateTimeStr(rowData.wrkEndDt) #</span>
        <span style="width:50%">#:trimNull(rowData.realTecNm) #</span>
        <span style="width:50%">#:paintStatGrid(rowData.paintStatCd) #</span>
        <span style="width:50%">#:pauseStatGrid(rowData.pauseCauCd) #</span>
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

//정비중지 팝업에서 데이터를 가져오기 위한 사용
var selectedItem;

var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      if (rowIndex >= rowTotal){
          return;
      }
      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      params["sDlrCd"] = parent.dlrCd;
      params["sRoDocNo"] = parent.$("#roDocNo").val();
      params["assignYn"] = "Y";
      $.ajax({
          url:"<c:url value='/mob/ser/ro/workAssign/selectWorkAssignSubLists.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("subList_noData", result.total, noDatamsg);
              if (result.data!=null && result.data != "") {
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("subList",4,rowTotal);
              }
              else {
                  app.hideLoading();
                  parent.setSubListHeightNew("subList",4,0);
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

function listViewClick(e){
    selectedItem = e.dataItem.rowData;
    $("div.dlistitem").removeClass("dlist_selected");
    e.item.children().addClass("dlist_selected");
    parent.fnContentProcessDetail(e.dataItem.rowData);

}

progressStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.progressStatMap[val] != null){
            returnVal = parent.progressStatMap[val].cmmCdNm;
        }
    }
    return returnVal;
}

//정비중지 팝업에서 selectedItem의 정보를 가져간다
function getSelectedItem(){

    return selectedItem;
}

//수리상태
rpirStatGrid = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(parent.rpirStatMap[val] != null){
         returnVal = parent.rpirStatMap[val].cmmCdNm;
     }
 }
 return returnVal;
}

//일시정지원인
pauseStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.pauseStatMap[val] != undefined)
        returnVal = parent.pauseStatMap[val].cmmCdNm;
    }
    return returnVal;
};

//페인트상태
paintStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.paintStatMap[val] != undefined)
        returnVal = parent.paintStatMap[val].cmmCdNm;
    }
    return returnVal;
};

var app = setKendoMobAppForNativeScroll();
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul data-role="listview" data-source="listData"  data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<!-- 부품정보 -->

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem bgNone">
            <span style="width:50%">#:etcTpCdGrid(etcTpCd) #</span>
            <span style="width:50%">#:trimNull(etcTpNm) #</span>

            <span class="clboth" style="width:50%">#:trimNull(etcReqCont) #</span>
            <span style="width:50%">#:mob.format.currency(etcReqPrc) #</span>
        </div>
</script>

<script>
var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;


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

      params["sPreFixId"] = "CA";
      params["sJobNo"] = parent.$("#calcDocNo").val();


      $.ajax({
          url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
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

                          etcTpCd:row.etcTpCd,
                          etcTpNm:row.etcTpNm,
                          etcReqCont:row.etcReqCont,
                          etcReqPrc:row.etcReqPrc,
                          preFixId:row.preFixId
                      });
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("subList4",2,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("subList4",2,rowTotal);
              }
              checklistCnt("listarea_noData_sub4",result.total,noDatamsg);
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
}


//기타유형
etcTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.etcTpCdArr[val] != undefined)
        returnVal = parent.etcTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}



var app = setKendoMobAppForNativeScroll();
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData"  data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<!-- 결제정보 -->

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem bgNone">
            <span style="width:35%">#:trimNull(itemCd) #</span>
            <span style="width:65%">#:trimNull(itemNm) #</span>
            <span style="width:35%">#:kendo.toString(itemPrc,'n2') #</span>
            <span style="width:35%">#:trimNull(itemQty) # / #:trimNull(calcUnitCd) #</span>
            <span style="width:30%">#:kendo.toString(itemTotAmt,'n2') #</span>
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

      if (rowIndex >= rowTotal)
      {
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

      params["sDocNo"] = parent.$("#parResvDocNo").val();
      params["sPreFixId"] = "PRE";
      var url = "";

      $.ajax({
          url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
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

                          itemCd:row.itemCd,
                          itemNm:row.itemNm,
                          itemPrc:row.itemPrc,
                          itemQty:row.itemQty,
                          calcUnitCd:row.calcUnitCd,
                          expcItemAmt:row.expcItemAmt,
                          itemTotAmt:row.itemTotAmt,
                          giTp:row.giTp

                      });
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("subList1",3,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("subList1",3,0);
              }
              checklistCnt("listarea_noData_sub1",result.total,noDatamsg);
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


var app = setKendoMobAppForNativeScroll();

</script>

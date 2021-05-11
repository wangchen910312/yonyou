<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<!-- 결제정보 -->

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem bgNone">
            <span style="width:35%">#:trimNull(paymUsrNm) #</span>
            <span style="width:35%">#:receiveCdGrid(rcvStatCd) #</span>
            <span style="width:30%">#:paymTpCdGrid(paymTp) #</span>

            <span class="clboth" style="width:35%">#:mob.format.currency(lbrAmt) #</span>
            <span style="width:35%">#:mob.format.currency(parAmt) #</span>
            <span style="width:30%">#:mob.format.currency(calcAmt) #</span>

            <span class="clboth" style="width:35%">#:paymPridCdGrid(paymPrid) #</span>
            <span style="width:65%">#:paymMthCdGrid(paymMthCd) #</span>

            <span class="clboth" style="width:100%">#:trimNull(paymRemark) #</span>
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
      params["sRcvDocNo"]             = parent.$("#rcvDocNo").val();
      var url = "";
      $.ajax({
          url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveDetails.do' />"
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
                          paymUsrNm:row.paymUsrNm,
                          paymTp:row.paymTp,
                          paymPrid:row.paymPrid,
                          paymAmt:row.paymAmt,
                          rcvAmt:row.rcvAmt,
                          nPayAmt:row.nPayAmt,
                          outstdAmt:row.outstdAmt,
                          receiveDt:row.receiveDt,
                          invoiceNo:row.invoiceNo,
                          receiveBigo:row.receiveBigo,
                          rcvCpltDt:row.rcvCpltDt,
                          rcvStatCd:row.rcvStatCd,
                          paymMthCd:row.paymMthCd,
                          rcptNo:row.rcptNo,
                          rcvRemark:row.rcvRemark,
                          paymRemark:row.paymRemark
                          ,lbrAmt:row.lbrAmt
                          ,parAmt:row.parAmt
                          ,calcAmt:row.calcAmt
                      });
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("subList1",4,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("subList1",4,0);
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


//결제유형
paymTpCdGrid = function(val){
  var returnVal = "";
  if(val != null && val != ""){
      returnVal = parent.paymTpCdArr[val].cmmCdNm;
  }
  return returnVal;
}

// 수납상태
receiveCdGrid = function(val){
  var returnVal = "";
  if(val != null && val != ""){
      returnVal = parent.receiveCdMap[val].cmmCdNm;
  }
  return returnVal;
}

// 지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
}


paymPridCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.paymPridCdArr[val].cmmCdNm;
    }
    return returnVal;
}

function listViewClick(e){
}

var app = setKendoMobAppForNativeScroll();
</script>

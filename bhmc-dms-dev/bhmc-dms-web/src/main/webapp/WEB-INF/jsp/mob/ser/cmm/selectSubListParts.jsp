<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%-- <div data-role="view">
  <ul id="subListView1" name="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="${template}" >
  </ul>
</div>
 --%>
<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="${template}" data-click="listViewClick">
  </ul>
</div>
<script type="text/x-kendo-template" id="list-template1">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rowData.itemCd) #</span>
            <span style="width:50%">#:trimNull(rowData.itemNm) #</span>
            <span style="width:50%">#:trimNull(rowData.calcUnitCd) #</span>
            <span style="width:50%">#:trimNull(rowData.itemQty) #</span>
            <span style="width:50%">#:trimNull(kendo.toString(rowData.itemPrc,'n2')) #</span>
            <span style="width:50%" class="serlblitemAmt">#:trimNull(kendo.toString(rowData.itemSaleAmt,'n2')) #</span>
            <span style="width:50%" class="serlbldcAmt">#:trimNull(kendo.toString(rowData.dcAmt, 'n2')) #</span>
            <span style="width:50%" class="serlblparAmt">#:trimNull(kendo.toString(rowData.itemTotAmt, 'n2')) #</span>
        </div>
</script>

<script type="text/x-kendo-template" id="list-template2">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rowData.itemCd) #</span>
            <span style="width:50%">#:trimNull(rowData.itemNm) #</span>
            <span style="width:50%">#:trimNull(rowData.calcUnitCd) #</span>
            <span style="width:50%">#:trimNull(rowData.itemQty) #</span>
            <span style="width:50%">#:trimNull(kendo.toString(rowData.itemPrc,'n2')) #</span>
            <span style="width:50%" class="serlbldcAmt">#:trimNull(kendo.toString(rowData.dcAmt, 'n2')) #</span>
            <span style="width:50%" class="serlblparAmt">#:trimNull(kendo.toString(rowData.itemTotAmt, 'n2')) #</span>
            <span style="width:50%" class="serllblparReadyStatCd">#:trimNull(rowData.parResvStatNm) #</span>
        </div>
</script>

<script type="text/x-kendo-template" id="list-template3">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rowData.itemCd) #</span>
            <span style="width:50%">#:trimNull(rowData.itemNm) #</span>
            <span style="width:50%">#:trimNull(rowData.calcUnitCd) #</span>
            <span style="width:50%">#:trimNull(rowData.itemQty) #</span>
            <span style="width:50%">#:trimNull(kendo.toString(rowData.itemPrc,'n2')) #</span>
            <span style="width:50%" class="serlbldcAmt">#:trimNull(kendo.toString(rowData.dcAmt,'n2')) #</span>
            <span style="width:50%" class="serlblparAmt">#:trimNull(kendo.toString(rowData.itemTotAmt,'n2')) #</span>
            <span style="width:50%" class="parlblparReqStatNm">#:chgPartRcvCd(rowData.itemReqStatCd) #</span>
        </div>
</script>

<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자.
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

      if("${fromWhere}" == "selectReservationReceiptMain"){//예약접수현황
          params["sPreFixId"] = "RE";
          params["sDocNo"] = parent._sResvDocNo;
          //$("#serllblparReadyStatCd, #parlblreseiveStat").hide();
      }else if("${fromWhere}" == "selectPartReservationMain"){//부품예약현황
          params["sPreFixId"] = "PRE";
          params["sDocNo"] = parent._parResvDocNo;
          //$("#serlblitemAmt, #parlblreseiveStat").hide();
      }else if("${fromWhere}" == "selectWorkHistoryMain"){//RO현황
          params["sPreFixId"] = "RO";
          params["sDocNo"] = parent._sRoDocNo;
          //$("#serlblitemAmt, #serllblparReadyStatCd").hide();
      }else if("${fromWhere}" == "selectEstimateListMain"){//견적현황
          params["sPreFixId"] = "ET";
          params["sDocNo"] = parent._sEstDocNo;
          //$("#serllblparReadyStatCd, #parlblreseiveStat").hide();
      }else if("${fromWhere}" == "selectCalculateMain"){//정산현황
          params["sPreFixId"] = "RO";
          params["sDocNo"] = parent._sRoDocNo;
         // $("#serllblparReadyStatCd, #parlblreseiveStat").hide();
      }

      $.ajax({
          url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_sub3",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                  });
                  parent.$("#C_parDcRate").text("(" + result.data[0].dcRate + "%)");
                  options.success(data);
                  app.hideLoading();
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

chgPartRcvCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.partRcvCdMap[val].cmmCdNm;
    }
    return returnVal;
};

var app = setKendoMobApp();
</script>

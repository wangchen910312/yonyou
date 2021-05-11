<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<!-- 결제정보 -->

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem bgNone">
            <span style="width:33%">#:trimNull(rowData.etcTpCd) #</span>
            <span style="width:34%">#:trimNull(rowData.etcTpNm) #</span>
            <span style="width:33%">#:trimNull(rowData.etcReqPrc) #</span>
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
      
      if("${fromWhere}" == "selectReservationReceiptMain"){//예약접수현황
          params["sPreFixId"] = "RE";
          params["sJobNo"] = parent._sResvDocNo;
      }else if("${fromWhere}" == "selectPartReservationMain"){//부품예약현황
          params["sPreFixId"] = "PRE";
          params["sJobNo"] = parent._parResvDocNo;
      }else if("${fromWhere}" == "selectWorkHistoryMain"){//RO현황
          params["sPreFixId"] = "RO";
          params["sJobNo"] = parent._sRoDocNo;
      }else if("${fromWhere}" == "selectEstimateListMain"){//견적현황
          params["sPreFixId"] = "ET";
          params["sJobNo"] = parent._sEstDocNo;
          /* if( dms.string.isNotEmpty(parent._sLtsModelCd)){
              params["ltsModelCd"] = parent._sLtsModelCd;
          } */
      }else if("${fromWhere}" == "selectCalculateMain"){//정산현황
          params["sPreFixId"] = "RO";
          params["sJobNo"] = parent._sRoDocNo;
      }

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
              checklistCnt("listarea_noData_sub4",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                  });
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

var app = setKendoMobApp();
</script>

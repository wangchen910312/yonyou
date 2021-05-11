<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rcvHistStatNm) #</span>
            <span style="width:50%">#:chgDate2DateTimeStr(rcvCpltDt) #</span>
            <span style="width:50%">#:trimNull(regUsrNm) #</span>
            <span style="width:50%">#:paymMthCdGrid(paymMthCd) #</span>
            <span style="width:50%">#:mob.format.currency(rcvAmt) #</span>
            <span style="width:50%">#:trimNull(rcptNo) #</span>
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

      params["sRcvDocNo"] = parent.$("#rcvDocNo").val();
      params["sRcvSubDocNo"] = parent.$("#rcvSubDocNo").val();
      //params["sPaymTp"]   = parent.$("#paymTp").val();
      params["sPaymTp"] = parent.$("#sPaymTp").data("kendoExtDropDownList").value();

/*       params["sCalcStatCd"]   = "04";
      params["sSerParDstinCd"] = "SER"; */

      $.ajax({
          url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveDetailsHist.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_sub1",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.data.length;//result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          rnum:row.rnum,
                          rcvHistStatNm:row.rcvHistStatNm,
                          paymMthCd:row.paymMthCd,
                          rcvAmt:row.rcvAmt,
                          rcvCpltDt:row.rcvCpltDt,
                          regUsrNm:row.regUsrNm,
                          rcptTp:row.rcptTp,
                          rcptNo:row.rcptNo,
                          rcptDt:row.rcptDt,
                          rcvRemark:row.rcvRemark

                       });
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

//지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
}

//영수증유형
rcptTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.rcptTpCdMap[val] != undefined)
        returnVal = parent.rcptTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};


function listViewClick(e){
    //parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>
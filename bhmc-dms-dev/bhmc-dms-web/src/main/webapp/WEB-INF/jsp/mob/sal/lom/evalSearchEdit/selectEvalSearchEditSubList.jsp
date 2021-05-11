<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem bgNone">
    <span style="width:50%">#:vinNo #</span>
    <span style="width:50%">#:changeDstbSerEvalVal(dstbSerEvalVal) #</span>
    
    <span style="width:50%">#:changeCarIssueHmVal(carIssueHmVal) #</span>
    <span style="width:50%">#:dlrEvalDt #</span>
    
    <span style="width:50%">#:changeDriverStsfVal(driverStsfVal) #</span>
    <span style="width:50%">#:changeCarIssueMassVal(carIssueMassVal) #</span>
    
    <span style="width:50%" class="clboth">#:trimNull(otherCont) #</span>
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

      var params = {};
      params["sVinNo"] = parent.sVinNo;
      
      $.ajax({
          url:"<c:url value='/mob/sal/lom/evalSearchEdit/selectEvalSearchEditSubListSearch.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              console.log(result.data);
              checklistCnt("listarea_noData",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          
                          pageIdx:pageIndex, 
                          rowIdx:rowIndex, 
                          vinNo:row.vinNo, 
                          dstbSerEvalVal:row.dstbSerEvalVal,
                          carIssueHmVal:row.carIssueHmVal, 
                          dlrEvalDt:row.dlrEvalDt, 
                          driverStsfVal:row.driverStsfVal, 
                          carIssueMassVal:row.carIssueMassVal, 
                          otherCont:row.otherCont
                          
                      });
                      //if(rowIndex>11) return false;
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

/* function listViewClick(e)
{
    var dataItem = e.dataItem;
    //parent.contentDetail(e.dataItem.itemCd);
    //parent.contentDetail(e.dataItem);
} */


var app = setKendoMobApp();

changeDstbSerEvalVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.dstbSerEvalArr[val];
    }
    return returnVal;
};

changeCarIssueHmVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.carIssueHmArr[val];
    }
    return returnVal;
};

changeDriverStsfVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.driverStsfArr[val];
    }
    return returnVal;
};

changeCarIssueMassVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.carIssueMassArr[val];
    }
    return returnVal;
};

</script>

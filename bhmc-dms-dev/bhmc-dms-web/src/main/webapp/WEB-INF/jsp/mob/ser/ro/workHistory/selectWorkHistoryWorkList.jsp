<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<div data-role="view">
  <ul data-role="listview" data-source="listData" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem bgNone">
            <span style="width:100%">#:trimNull(rowData.lbrNm) #</span>
            <span class="clboth" style="width:35%">#:trimNull(rowData.lbrCd) #</span>
            <span style="width:35%">#:trimNull(lbrTpCdGrid(rowData.lbrTp)) #</span>
            <span style="width:30%">#:mob.format.currency(rowData.lbrTotAmt, "{0:n0}") #</span>
            <span class="clboth" style="width:35%">#:commaZero(rowData.lbrHm) #</span>
            <span style="width:35%">#:mob.format.currency(rowData.lbrPrc, "{0:n0}") #</span>
            <span style="width:30%">#:dms.format.currency(rowData.dcAmt, "{0:n0}") #</span>
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

      params["sPreFixId"] = "RO";
      params["sDocNo"] = parent.$("#roDocNo").val();

      $.ajax({
          url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_sub2",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      console.log(row);
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                      /*
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          roDocNo:row.roDocNo,
                          roTp:row.roTp,
                          lbrTp:row.lbrTp,
                          lbrCd:row.lbrCd,
                          lbrNm:row.lbrNm,
                          lbrHm:row.lbrHm,
                          lbrPrc:row.lbrPrc,
                          dcAmt:row.dcAmt,
                          lbrTotAmt:row.lbrTotAmt
                      });
                      */
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("workList",3,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("workList",3,0);
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
}

var app = setKendoMobAppForNativeScroll();

//정비유형(수리유형)
lbrTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.lbrTpCdArr[val] != undefined)
        returnVal = parent.lbrTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};
</script>

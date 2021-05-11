<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem">
            <span style="width:40%">#:itemCd #</span>
            <span style="width:60%">#:itemNm #</span>
            <span style="width:40%">#:resvQty #</span>
            <span style="width:30%">#:kendo.toString(itemPrc, 'n2') #</span>
            <span style="width:30%">#:kendo.toString(itemAmt, 'n2') #</span>
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

      var sParGiTp = parent.$("#sSerReceiveType").val();
      if(sParGiTp == "RO" || sParGiTp == ""){
          sParGiTp = "PG01";//RO or IN or Borrow
      }else if(sParGiTp == "BR" ){
          sParGiTp = "PG02";//Borrow
      }

      params["sParGiTp"] = sParGiTp;
      params["sParReqStatCd"] = parent.$("#sPartsInOutStatus").val();
      params["sRoDocNo"] = parent.$("#sInvRoDocNo").val();
      params["sRoStatCd"] = parent.$("#sParGiStatCd").val();
      params["sGiDocReqStartDt"] = chgDate(parent.$("#sGiTimeStartDt").val());
      params["sGiDocReqEndDt"] = chgDate(parent.$("#sGiTimeEndDt").val());
      params["sGiDocNo"] = parent.giDocNo;
      params["sCustNm"] = parent.$("#sVisitNm").val();
      params["sSerPrsnId"] = parent.$("#sParGiMan").val();
      params["sCarNo"] = parent.$("#sCarNo").val();
      params["sVinNo"] = parent.$("#sVin").val();
      params["sReceiveNm"] = parent.$("#sGetPrsnNm").val();

      console.log("params2",params);

      $.ajax({
          url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData2",result.total,noDatamsg);

              if(result.data!=null && result.data != ""){
                  var data = [];

                  if(result.total == result.data.length){
                      rowTotal = result.total;
                  }else{
                      rowTotal = result.data.length;
                  }

                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          rnum:row.rnum,
                          giDocNo:row.giDocNo,
                          roDocNo:row.roDocNo,
                          parReqStatCd:row.parReqStatCd,
                          roTp:row.roTp,
                          itemCd:row.itemCd,
                          itemNm:row.itemNm,
                          pkgItemCd:row.pkgItemCd,
                          resvQty:row.resvQty,
                          avlbStockQty:row.avlbStockQty,
                          totStockQty:row.totStockQty,
                          reqStrgeCd:row.reqStrgeCd,
                          giLocCd:row.giLocCd,
                          itemPrc:row.itemPrc,
                          taxDdctAmt:row.taxDdctAmt,
                          taxAmt:row.taxAmt,
                          itemAmt:row.itemAmt,
                          receiveTime:row.receiveTime,
                          receiveId:row.receiveId,
                          receiveNm:row.receiveNm
                      });
                  });
                  parent.gData = data;
                  if(data.length == 1) {
                      parent.$("#upBtn").data("kendoButton").enable(false);
                      parent.$("#downBtn").data("kendoButton").enable(false);
                  }else {
                      parent.$("#upBtn").data("kendoButton").enable(true);
                      parent.$("#downBtn").data("kendoButton").enable(true);
                  }
                  options.success(data);
                  app.hideLoading();
              }
              else {
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
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>

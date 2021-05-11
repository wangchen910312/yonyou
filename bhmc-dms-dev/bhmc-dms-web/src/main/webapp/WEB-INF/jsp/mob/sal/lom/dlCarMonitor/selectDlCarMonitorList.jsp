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
    <span style="width:50%">#:"[" +trimNull(carlineCd) + "]" + trimNull(carlineNm) #</span>
    <span style="width:50%">#:trimNull(modelNm) #</span>
    <span style="width:50%">#:trimNull(vinNo) #</span>
    <span style="width:50%">#:"[" +trimNull(extColorCd) + "]" + trimNull(extColorNm) #</span>
    <span style="width:50%">#:trimNull(pltGiDt) #</span>
    <span style="width:50%">#:trimNull(exptDate) #</span>
    <span style="width:50%">#:trimNull(trsfLocCd) #</span>
    <span style="width:50%">#:trimNull(dstbCmpNm) #</span>
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
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = null;

      params["sVinNo1"] = parent.$("#sVinNo1").val();

      if(parent.$("#sSrchFrDt").val() == "" /* || parent.$("#search2Area span[name='searchStr']").text() == "" */){
          params["sSrchFrDt"] = null;
      }else{
          params["sSrchFrDt"] = chgDate(parent.$("#sSrchFrDt").val());
      }

      if(parent.$("#sSrchToDt").val() == "" /* || parent.$("#search2Area span[name='searchStr']").text() == "" */){
          params["sSrchToDt"] = null;
      }else{
          params["sSrchToDt"] = chgDate(parent.$("#sSrchToDt").val());
      }

      parent.$("#content_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/sal/lom/dlCarMonitor/selectDlCarMonitorCondition.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      console.log("data row",row);
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex, 
                          rowIdx:rowIndex, 
                          vinNo:row.vinNo, 
                          modelCd:row.modelCd,
                          ocnCd:row.ocnCd, 
                          extColorCd:row.extColorCd,
                          intColorCd:row.intColorCd,
                          dstbCmpNm:row.dstbCmpNm ,
                          tpCarNo:row.tpCarNo,
                          trsfCarNo:row.trsfCarNo, 
                          carRegNo:row.carRegNo,
                          pltGiDt:chgDate2Str(row.pltGiDt), 
                          exptDate:chgDate2Str(row.exptDate),
                          trsfLocCd:row.trsfLocCd, 
                          trsfStatCd:row.trsfStatCd, 
                          preAlrtNtceCont:row.preAlrtNtceCont,
                          driverNm:row.driverNm, 
                          driverTelNo:row.driverTelNo,
                          carlineNm:row.carlineNm,
                          carlineCd:row.carlineCd,
                          modelNm:row.modelNm,
                          ocnNm:row.ocnNm,
                          extColorNm:row.extColorNm,
                          intColorNm:row.intColorNm
                          });
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  //checkResultForChrom(rowIndex);
              }else{
                  app.hideLoading();
                  //checkResultForChrom(0);
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
    //var dataItem = e.dataItem;
    //parent.contentDetail(e.dataItem.itemCd);
    parent.contentDetail(e);
}

var app = setKendoMobApp();

</script>

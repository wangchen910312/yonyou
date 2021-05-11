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
    <span style="width:35%">#:estDt   #</span>
    <span style="width:65%">#:trimNull(estDocNo) #</span>
    <span class="clboth" style="width:35%">#:trimNull(carRegNo) #</span>
    <span style="width:65%">#:trimNull(vinNo) #</span>
    <span class="clboth" style="width:35%">#:trimNull(driverNm) #</span>
    <span style="width:35%">#:getLtsModelNm(ltsModelCd) #</span>
    <span style="width:30%">#:trimNull(totAmt) #</span>
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

          app.hideLoading();
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


      if(parent.$("#sFromDt").val() == "" || parent.$("#search1Area span[name='searchStr']").text() == ""){
          params["sFromDt"] = null;
      }else{
          params["sFromDt"] = chgDate(parent.$("#sFromDt").val());
      }

      if(parent.$("#sToDt").val() == "" || parent.$("#search1Area span[name='searchStr']").text() == ""){
          params["sToDt"] = null;
      }else{
          params["sToDt"] = chgDate(parent.$("#sToDt").val());
      }
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sDriverNm"] = parent.$("#sDriverNm").val();

      $.ajax({
          url:"<c:url value='/mob/ser/est/estimate/selectEstimateListLists.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //mob.notification.error(jqXHR.responseJSON.errors);
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

                          estDt:chgDate2Str(row.estDt),
                          estDocNo:row.estDocNo,
                          carRegNo:row.carRegNo,
                          vinNo:row.vinNo,
                          driverNm:row.driverNm,
                          ltsModelCd:row.ltsModelCd,
                          totAmt:row.totAmt
                          });
                  });
                  options.success(data);
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


changeEstTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.estTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

getLtsModelNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ltsMap[val].cmmCdNm;
    }
    return returnVal;
};


function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

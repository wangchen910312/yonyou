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
    <div class="dlistitem bgNone">
        <span style="width:33%">#:chgOrdStatCdObj(ordStatCd) #</span>
        <span style="width:34%">#:chgDate2Str(pdiDt) #</span>
        <span style="width:33%">#:chgDate2Str(vinDt) #</span>
        <span style="width:33%" class="clboth">#:chgDate2Str(retailDt) #</span>
        <span style="width:34%">#:chgDate2Str(dlrGrDt) #</span>
        <span style="width:33%">#:chgDate2Str(custSaleDt) #</span>
        <span style="width:100%" class="clboth">#:trimNull(vinNo) #</span>
    </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

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
      //params["sort"] = options.sort;

      params["sDlrCd"] = parent.$("#dlrCd").val();
      params["sOrdYyMmDt"] = parent.$("#ordYyMmDt").val();
      params["sOrdPrid"] = parent._ordPrid;
      params["sOrdsTp"] = parent._ordsTp;
      params["sCarlineCd"] = parent.$("#carlineCd").val();
      params["sModelCd"] = parent.$("#modelCd").val();
      params["sOcnCd"] = parent.$("#ocnCd").val();
      params["sExtColorCd"] = parent.$("#extColorCd").val();
      params["sIntColorCd"] = parent.$("#intColorCd").val();

      console.log("params:",params);

      $.ajax({
          url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubs.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData9",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          ordDate:row.ordDate,
                          chrgCd:row.chrgCd,
                          ordSeq:row.ordSeq,
                          vinmVloc:row.vinmVloc,
                          vinNo:row.vinNo,
                          pdiDt:row.pdiDt,
                          vinDt:row.vinDt,
                          retailDt:row.retailDt,
                          dlrGrDt:row.dlrGrDt,
                          custSaleDt:row.custSaleDt,
                          ordTp:row.ordTp,
                          ordStatCd:row.ordStatCd
                          });
                  });

                  options.success(data);

                  app.hideLoading();
                  parent.setSubListHeightNew("detailList",2,rowTotal);
               }else{
                   app.hideLoading();
                   parent.setSubListHeightNew("detailList",2,0);
               }

              checklistCnt("listarea_noData_dt",result.total,noDatamsg);
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
chgOrdTpObj = function(val){
    var returnVal;

    if (val !== null ){
        returnVal = parent.ordTpObj[val];
    }else{
        returnVal = '';
    }
    return returnVal;
}
chgOrdStatCdObj = function(val){
    var returnVal;

    if (val !== null ){
        returnVal = parent.ordStatCdObj[val];
    }else{
        returnVal = '';
    }
    return returnVal;
}
var app = setKendoMobApp();
</script>

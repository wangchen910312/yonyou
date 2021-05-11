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
    <span style="width:60%">#:vinNo #</span>
    <span style="width:40%">#:trimNull(carRegNo) #</span>
    <span style="width:60%" class="clboth">#:modelNm #</span>
    <span style="width:40%">#:carlineNm #</span>
    <span style="width:60%" class="clboth">#:changeCmpCarDstinCd(cmpCarDstinCd) #</span>
    <span style="width:40%">#:usrNm #</span>
    <!--<span style="width:40%">#:modelNm #</span>-->
    <span style="width:60%" class="clboth">#:chgDate2DateTimeStr(useStartDt) #</span>
    <span style="width:40%">#:chgDate2DateTimeStr(useEndDt) #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var oneDay = "${oneDay}"+" 00:00:00";   // 해당월 1일
var lastDay = "${lastDay}"+" 00:00:00"; // 해당월 마지막일자
var toDay = "${toDay}"+" 00:00:00";     // 오늘 일자


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

      params["sVinNo"] = parent.$("#sVinNo").val();
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      //date타입 오류로 임수 주석처리
/*       param.useStartDt = parent.$("#useStartDt").data("kendoDateTimePicker").value();
      param.useEndDt = parent.$("#useEndDt").data("kendoDateTimePicker").value(); */

      //date타입 오류로 임수 주석처리
      if(parent.$("#sUseStartDt").val() == "" || parent.$("#search3Area span[name='searchStr']").text() == ""){
          params["sUseStartDt"] = null;
      }else{
          params["sUseStartDt"] = new Date(parent.$("#sUseStartDt").val().replace("-","/")+" "+changeTimeToZero(parent.$("#sUseStartTime").val()));
      }

      if(parent.$("#sUseEndDt").val() == "" || parent.$("#search3Area span[name='searchStr']").text() == ""){
          params["sUseEndDt"] = null;
      }else{
          params["sUseEndDt"] = new Date(parent.$("#sUseEndDt").val().replace("-","/")+" "+changeTimeToZero(parent.$("#sUseEndTime").val()));
      }
      
      params["sStartDt"]     = parent.$("#sUseStartDt").val();                                         // 사용시작시간
      params["sEndDt"]     = parent.$("#sUseEndDt").val();

      params["sCmpCarDstinCd"] = parent.$("#sCmpCarDstinCd").data("kendoExtDropDownList").value();

      parent.$("#content_list").css("display","block");
      
      $.ajax({
          url:"<c:url value='/mob/sal/cmp/cmpCarRunMng/selectCmpCarRunMng.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
          }
          ,success:function(result) {
              console.log(result);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.data.length;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex,
                          vinNo:row.vinNo, carRegNoOut:row.carRegNoOut, carRegNo:row.carRegNo, carlineCd:row.carlineCd,
                          //carlineNm:row.carlineNm, cmpCarDstinCdOut:row.cmpCarDstinCdOut, cmpCarDstinCd:changeCmpCarDstinCd(row.cmpCarDstinCd),
                          carlineNm:row.carlineNm, cmpCarDstinCdOut:row.cmpCarDstinCd, cmpCarDstinCd:row.cmpCarDstinCd,
                          modelCd:row.modelCd, modelNm:row.modelNm, ocnCd:row.ocnCd, ocnNm:row.ocnNm, usrId:row.usrId,
                          usrNm:row.usrNm, useStartDt:row.useStartDt, useEndDt:row.useEndDt, useStartKmVal:row.useStartKmVal,
                          useEndKmVal:row.useEndKmVal, remark:row.remark, regDt:row.regDt, regUsrId:row.regUsrId});
                  });
                  options.success(data);
                  app.hideLoading();
              }else{
                  app.hideLoading();
              }
              checklistCnt("listarea_noData",result.total,noDatamsg);
          }
      });
    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      //total:function(data) { return data.length; }
      total:function(){ return rowTotal; }
  }
});

changeCmpCarDstinCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.cmpCarDstinCdMap[val];
    }
    return returnVal;
};

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

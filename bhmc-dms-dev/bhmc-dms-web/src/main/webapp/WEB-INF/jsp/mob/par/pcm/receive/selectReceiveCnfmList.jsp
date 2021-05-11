﻿﻿﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem" style="padding-right:10px;">
        <span style="width:50%">#:chgDate2DateTimeStr(invcDt) #</span>
        <span style="width:50%; text-align:right; ">#:trimNull(mobisInvcNo) #</span>
        <span class="clboth" style="width:35%">#:changeInvcTpCd(invcTp) #</span>
        <span style="width:35%; text-align:center;">#:changeInvcStatCd(invcStatCd) #</span>
        <span style="width:30%; text-align:right;">#:changeBpCdMap(bpCd) #</span>
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

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}",
invcTpList          = [],
invcTpObj           = {},
invcStatList        = [],
invcStatObj         = {},
vatCdObj            = {},
minDate = new Date(sevenDtBf),
maxDate = new Date(toDt),
toYY,
toMM,
toDD,
frYY,
frMM,
frDD

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
      params["sort"] = null;


      params["sInvcTp"] = parent.$("#sInvcTp").val();
      params["sMobisInvcNo"] = parent.$("#sMobisInvcNo").val();
      //if(parent.$("#search3Area span[name='searchStr']").text() == ""){
      if(parent.$("#sInvcDtFr").val() == ""){
          params["sInvcDtFr"] = null;
          params["sInvcDtTo"] = null;
      }else{
          params["sInvcDtFr"] = chgDate(parent.$("#sInvcDtFr").val());
          params["sInvcDtTo"] = chgDate(parent.$("#sInvcDtTo").val());
      }

      params["sBpCd"]=parent.$("#sBpCd").val();
      params["sInvcStatCd"] = parent.$("#sInvcStatCd").val();

      //if(parent.$("#search6Area span[name='searchStr']").text() == ""){
      if(parent.$("#sRegDtFr").val() == ""){
          params["sRegDtFr"] = null;
          params["sRegDtTo"] = null;
      }else{
          params["sRegDtFr"] = chgDate(parent.$("#sRegDtFr").val());
          params["sRegDtTo"] = chgDate(parent.$("#sRegDtTo").val());
      }

      params["sItemDstinCd"]="";

      console.log("mob params",params);

      $.ajax({
          //url:"<c:url value='/mob/par/pcm/invc/selectInvcItems.do' />"
          url:"<c:url value='/par/pcm/invc/selectInvcItems.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          invcDt:row.invcDt,
                          mobisInvcNo:row.mobisInvcNo,
                          confirmDt:row.confirmDt,
                          purcOrdNo:row.purcOrdNo,
                          invcDocNo:row.invcDocNo,
                          invcTp:row.invcTp,
                          invcStatCd:row.invcStatCd,
                          regDt:row.regDt,
                          invcDt:row.invcDt,
                          pltCd:row.pltCd,
                          pltNm:row.pltNm,
                          bpCd:row.bpCd,
                          bpNm:row.bpNm,
                          mobisInvcNo:row.mobisInvcNo,
                          vatCd:row.vatCd,
                          purcOrdStatCd:row.purcOrdStatCd,
                          purcOrdNo:row.purcOrdNo,
                          vatAmt:row.vatAmt,
                          invcTotAmt:row.invcTotAmt,
                          arrvDt:row.arrvDt,
                          confirmDt:row.confirmDt,
                          remark:row.remark,
                          ifYn:row.ifYn
                       });
                  });
                  checkResultForChrom(rowIndex);
                  options.success(data);
                  app.hideLoading();
              }else{
                  app.hideLoading();
                  checkResultForChrom(0);
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

changeInvcTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.invcTpMap[val].cmmCdNm;
    }
    return returnVal;
};

changeInvcStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.invcStatMap[val].cmmCdNm;
    }
    return returnVal;
};

changeBpCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.bpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(e)
{
    //parent.contentItemList(e.dataItem.invcDocNo);
    parent.contentItemList(e.dataItem);
}

var app = setKendoMobApp();

</script>

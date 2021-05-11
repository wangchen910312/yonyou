<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul data-role="listview" data-source="listData"  data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<!-- 정비항목 -->

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem">
            <span style="width:30%">#:trimNull(lbrCd) #</span>
            <span style="width:70%">#:trimNull(lbrNm) #</span>

            <span class="clboth" style="width:30%">#:lbrTpCdGrid(lbrTp) #</span>
            <span style="width:35%">#:trimNull(lbrPrc) #</span>
            <span style="width:35%">#:trimNull(lbrPrc) #</span>

            <span class="clboth" style="width:30%">#:trimNull(dcAmt) #</span>
            <span style="width:35%">#:trimNull(expcLbrAmt) #</span>
            <span style="width:35%">#:paymTpCdGrid(paymTp) #</span>

            <span class="clboth" style="width:100%">#:trimNull(paymUsrNm) #</span>
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
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      params["sCalcDocNo"] = parent.$("#calcDocNo").val();

      $.ajax({
          url:"<c:url value='/mob/ser/cal/calculate/selectCalculateLabors.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              mob.notification.error(jqXHR.responseJSON.errors);
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

                          lbrCd:row.lbrCd,
                          lbrNm:row.lbrNm,
                          lbrTp:row.lbrTp,
                          lbrPrc:row.lbrPrc,
                          lbrHm:row.lbrHm,
                          dstbHm:row.dstbHm,
                          dcAmt:row.dcAmt,
                          expcLbrAmt:row.expcLbrAmt,
                          paymTp:row.paymTp,
                          paymUsrNm:row.paymUsrNm
                      });
                  });
                  options.success(data);

                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  parent.setSubListHeight("subList2",rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("subList2",0);
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
    //parent.contentDetail(e.dataItem.itemCd);
}
/*
contactTpArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.contactTpArr[val];
    }
    return returnVal;
}; */


// 정비유형(수리유형)
        lbrTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = parent.lbrTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }




// 결제유형
        paymTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = parent.paymTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();
</script>

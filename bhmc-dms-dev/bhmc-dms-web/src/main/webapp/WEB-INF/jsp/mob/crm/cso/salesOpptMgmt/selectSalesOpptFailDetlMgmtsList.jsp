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
<div class="deleteitem">
    <span style="width:35%">#:regDt   #</span>
    <span style="width:30%">#:failTpCdArrVal(failTpCd) #</span>
    <span style="width:35%">#:failCau1CdArrVal(failCau1Cd) #</span>
    <span class="clboth" style="width:35%">#:failCau2CdArrVal(failCau2Cd) #</span>
    <span style="width:30%">#:brandCdArrVal(failBrandCd) #</span>
    <span style="width:35%">#:failModelCd #</span>
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
      params["sort"] = null;

      params["sSaleOpptNo"] = parent.$("#saleOpptNo").val();

      $.ajax({
          url:"<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptFailDetlMgmts.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;

                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,

                          saleOpptNo:row.saleOpptNo
                          ,failTpCd   :row.failTpCd
                          ,failCau1Cd:row.failCau1Cd
                          ,failCau2Cd:row.failCau2Cd
                          ,failBrandCd:row.failBrandCd
                          ,failModelCd:row.failModelCd
                          ,regDt:row.regDt
                          });
                  });
                  options.success(data);
                  app.hideLoading();
                  //parent.setSubListHeight2("failList",rowTotal, "Y");
                  parent.setSubListHeightNew("failList",2,rowTotal);

                  //mob.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  //parent.setSubListHeight2("failList",0, "N");
                  parent.setSubListHeightNew("failList",2,0);
                  app.hideLoading();
              }
              checklistCnt("failList_noData",result.total,noDatamsg);
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
    //parent.contentDetail(e.dataItem);
}

// 실패유형 DS
failTpCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.failTpCdArr[val];
    }
    return returnVal;
};


// 실패1급원인 DS
failCau1CdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.failCau1CdArr[val];
    }
    return returnVal;
};


//실패2급원인 DS
failCau2CdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.failCau2CdArr[val];
    }
    return returnVal;
};


//등록차량 브랜드 DS
brandCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.brandCdArr[val];
    }
    return returnVal;
};



//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

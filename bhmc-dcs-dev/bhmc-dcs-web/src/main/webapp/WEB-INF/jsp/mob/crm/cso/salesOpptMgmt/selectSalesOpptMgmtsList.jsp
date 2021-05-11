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
    <span style="width:35%">#:custNm   #</span>
    <span style="width:30%">#:trimNull(changeSuccPrbCd(succPrbCd)) #</span>
    <span style="width:35%">#:expcSaleDt #</span>
    <span class="clboth">#:trimNull(modelNm) #</span>
    <span class="clboth" style="width:35%">#:changeSaleOpptStepCd(saleOpptStepCd) #</span>
    <span style="width:30%">#:scId #</span>
    <span style="width:35%">#:trimNull(trsfStatCd) #</span>
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

      params["sCustNm"] = parent.$("#sCustNm").val();
      params["sSaleOpptStepCd"] = parent.$("#sSaleOpptStepCd").val();
      params["sTrsfStatCd"] = parent.$("#sTrsfStatCd").val();
      params["sIntrCarLine"] = parent.$("#sIntrCarLine").val();
      params["sIntrModel"] = parent.$("#sIntrModel").val();
      params["sScId"] = parent.$("#sScId").val();
      params["sStartRegDt"] = new Date( parent.$("#sStartRegDt").val());
      params["sEndRegDt"] = new Date( parent.$("#sEndRegDt").val());

      $.ajax({
          url:"<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptMgmts.do' />"

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

                          custNm:row.custNm,
                          succPrbCd:row.succPrbCd,
                          expcSaleDt:chgDate2Str(row.expcSaleDt),
                          modelNm:row.modelNm,
                          saleOpptStepCd:row.saleOpptStepCd,
                          scId:row.scId,
                          trsfStatCd:row.trsfStatCd,
                          saleOpptNo:row.saleOpptNo
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

function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.roDocNo);
    parent.contentDetail(e.dataItem);
}

//성공확률
changeSuccPrbCd = function(val){
    var returnVal = "";
    if(val != null || val != ""){
        returnVal = parent.succPrbCdObj[val];
    }
    return returnVal;
}


//판매기회단계
changeSaleOpptStepCd = function(val){
    var returnVal = "";
    if(val != null || val != ""){
        returnVal = parent.saleOpptStepCdObj[val];
    }
    return returnVal;
}

var app = setKendoMobApp();
//var app = setKendoMobAppForNativeScroll();
</script>

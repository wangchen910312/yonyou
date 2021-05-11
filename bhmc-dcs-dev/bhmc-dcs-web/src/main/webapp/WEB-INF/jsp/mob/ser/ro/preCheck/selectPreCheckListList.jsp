<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%">#:chgDate2Str(preChkDt) #</span>
    <span style="width:50%">#:trimNull(diagDocNo) #</span>

    <span class="clboth" style="width:50%">#:trimNull(carRegNo) #</span>
    <span style="width:50%">#:trimNull(resvDocNo) #</span>

    <span class="clboth" style="width:50%">#:trimNull(driverNm) #</span>
    <span style="width:50%">#:trimNull(ltsModelCd) #</span>

    <%--<span style="width:65%">#:trimNull(vinNo) #</span>--%>
</div>
</script>


<script>
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

      params["sFromDt"] = chgDate(parent.$("#sFromDt").val());
      params["sToDt"] = chgDate(parent.$("#sToDt").val());
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sDriverNm"] = parent.$("#sDriverNm").val();

      $.ajax({
          url:"<c:url value='/mob/ser/ro/preCheck/selectPreCheckListMains.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
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
                        preChkDt:row.preChkDt,
                        diagDocNo:row.diagDocNo,
                        resvDocNo:row.resvDocNo,
                        carRegNo:row.carRegNo,
                        vinNo:row.vinNo,
                        driverNm:row.driverNm,
                        ltsModelCd:row.ltsModelCd
                      });
                  });
                  options.success(data);
                  app.hideLoading();
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

/*
changeSpyrCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.spyrCdObj[val];
    }
    return returnVal;
};
*/

function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.itemCd);
}

var app = setKendoMobApp();

</script>


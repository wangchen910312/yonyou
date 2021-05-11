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
    <span style="width:100%">#:trimNull(stsfIvstNm) #</span>
    <%--
    <span class="clboth" style="width:50%">#:chgDate2Str(startDt) #</span>
    <span style="width:50%">#:chgDate2Str(endDt) #</span>
    --%>
</div>
</script>


<script>
var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

stsfIvstGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.stsfIvstNmMap[val].stsfIvstNm;
    }
    return returnVal;
}

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

      params["sStsfIvstNm"] = stsfIvstGrid(parent.$("#sSeq_").val());
      //alert(params["sStsfIvstNm"]);

      //params["stsfIvstTpCd"] = "

      $.ajax({
          url:"<c:url value='/mob/crm/css/satisFactionManage/selectSatisFactionManagesNew.do' />"
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

                        stsfIvstNm:row.stsfIvstNm,
                        stsfIvstExpdCd:row.stsfIvstExpdCd,
                        seq:row.seq,

                        //startDt:row.startDt,
                        //endDt:row.endDt
                      });
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
      total:function(){ return rowTotal; }
  }
});


function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>


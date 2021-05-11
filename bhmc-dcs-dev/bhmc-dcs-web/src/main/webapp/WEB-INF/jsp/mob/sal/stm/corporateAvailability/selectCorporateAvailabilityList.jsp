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
    <span style="width:100%">#:zcocn #</span>
    <span style="width:30%"  class="clboth">#:zcextc #</span>
    <span style="width:30%">#:zcintc #</span>
    <span style="width:40%">#:kwmeng #</span>
</div>
</script>

<script>
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

      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      params["sOcnCd"] = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();
      params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value();

      parent.$("#content_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/sal/stm/corporateAvailability/selectCorporateAvailability.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error(jqXHR.statusText);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, zcocn:row.zcocn, zcextc:row.zcextc, zcintc:row.zcintc, kwmeng:kwmeng});
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
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
}

var app = setKendoMobApp();

</script>

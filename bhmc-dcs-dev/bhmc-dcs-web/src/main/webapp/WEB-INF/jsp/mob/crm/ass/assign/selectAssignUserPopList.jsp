<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="checkitem">
    <span class="check">
        <input id="isSave_#:rowIdx #" name="isSaveName" type="checkbox" class="f_check" #:checked #/><label for="isSave_#:rowIdx #"></label>
    </span>
    <span name="usrNm" style="width:50%">#:trimNull(usrNm) #</span>
    <span name="usrId" style="width:50%">#:trimNull(usrId) #</span>
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

      /*
      params["sUsrId"] = parent.$("#sUsrId").val();
      params["sStatCd"] = parent.$("#sStatCd").val();
      */


      $.ajax({
          url:"<c:url value='/mob/crm/ass/assign/selectAssignUserPopLists.do' />"
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

                        var isChecked = "";
                        if(parent.parent.userList.length > 0){
                            for(var j=0; j<parent.parent.userList.length; j++){
                                if(parent.parent.userList[j].usrId == row.usrId){
                                    isChecked = "checked";
                                }
                            }
                        }


                      data.push({
                        pageIdx:pageIndex,
                        rowIdx:rowIndex,
                        usrNm:row.usrNm,
                        usrId:row.usrId,
                        checked:isChecked
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



function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.itemCd);
}

var app = setKendoMobApp();

</script>


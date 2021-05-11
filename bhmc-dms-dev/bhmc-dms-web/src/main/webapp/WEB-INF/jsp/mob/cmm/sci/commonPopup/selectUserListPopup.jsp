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
<div class="dlistitem" id="listContentRow">
    <span style="width:30%">#:usrId #</span>
    <span style="width:40%">#:usrNm #</span>
    <span style="width:30%">#:trimNull(empNo) #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
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
      params["sUsrId"] = parent.$("#sUsrId").val();
      params["sUsrNm"] = parent.$("#sUsrNm").val();
      params["sEmpNo"] = parent.$("#sEmpNo").val();
      params["sDelYn"] = 'N';

      parent.$("#content_pop_list").css("display","block");

      $.ajax({
          url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //dms.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_pop",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          usrId        :row.usrId,
                          usrNm  :row.usrNm,
                          empNo:row.empNo

                      });
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //dms.notification.success("<spring:message code='global.info.success'/>");
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
      total:function(data) { return data.length; }
  }
});

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentCommonDetail(e.dataItem);

    var curRow = e.dataItem.rowIdx - 1;
    $('.dlistitem').each(function(i){
        console.log("i:"+i+"  curRow:"+curRow);
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

var app = setKendoMobApp();

</script>

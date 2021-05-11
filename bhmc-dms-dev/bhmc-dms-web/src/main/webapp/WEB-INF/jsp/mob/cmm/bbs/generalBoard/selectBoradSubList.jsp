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
    <div class="dlistitem bgNone">
        <span style="width:70%"><span style=\"text-decoration:underline;cursor:pointer;\">#=fileNm#</span></span>
        <span style="width:30%; text-align: right;">[#= dms.string.formatFileSize(fileSize) #]</span>
        <span style="display:none;">#=fileDocNo#</span>
        <span style="display:none;">#=fileNo#</span>
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
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["sFileDocNo"] = parent.$("#fileDocNo").val();

      $.ajax({
          url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              console.log("result"+result);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                      $.each(result.data , function(i , row){
                          rowIndex++;
                          data.push({pageIdx:pageIndex,
                              rowIdx:rowIndex,
                              fileData:row.fileData,
                              fileDocNo:row.fileDocNo,
                              fileNm:row.fileNm,
                              fileNo:row.fileNo,
                              fileSize:row.fileSize,
                              fileTp:row.fileTp,
                              regDt:row.regDt,
                              regUsrId:row.regUsrId,
                              rnum:row.rnum,
                              updtDt:row.updtDt,
                              updtUsrId:row.updtUsrId});
                      });

                  options.success(data);
                  app.hideLoading();

                  parent.setSubListHeightNew("detailList",2,rowTotal);
               }else{
                   app.hideLoading();
                   parent.setSubListHeightNew("detailList",2,0);
               }

              checklistCnt("listarea_noData_dt",result.total,noDatamsg);
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
    parent.contentSubDetail(e.dataItem.fileDocNo, e.dataItem.fileNo, e.dataItem.fileNm);
}

var app = setKendoMobApp();
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%">#:'['+rowData.carlineCd+']'+rowData.carlineNm #</span>
    <span style="width:50%">#:rowData.extColorNm #</span>
    <span style="width:50%">#:'['+rowData.ocnCd+']' + rowData.ocnNm #</span>
    <span style="width:50%">#: rowData.DALO_ALLO_QTY #</span>
    <span style="width:50%">#:kendo.toString(rowData.DALO_FINAL_AMT, 'n2') #</span>
</div>
</script>

<script>

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData = new kendo.data.DataSource({
    transport:{
        read:function(options) {

          if (rowIndex >= rowTotal){
              return;
          }
          app.showLoading();
          pageIndex++;

          var params = {};

          if(parent.params != 'undefined'){
              params["sDlrCd"] = parent.params["sDlrCd"];
              params["sYyMmDd"] = parent.params["sYyMmDd"];
          }else{
              params["sDlrCd"] = "";
              params["sYyMmDd"] = "";
          }
          console.log("params:::",params);

          var totQty = 0;
          var totAmt = 0;

          $.ajax({
              url:"<c:url value='/sal/trm/dayFundStatus/selectDayFundStatusSearch.do' />"
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
                          console.log("row:::", row);
                          rowIndex++;
                          data.push({rowData:result.data[i]});

                          if(row.DALO_ALLO_QTY != null){
                              totQty += Number(row.DALO_ALLO_QTY);
                          }

                          if(row.DALO_FINAL_AMT != null){
                              totAmt += Number(row.DALO_FINAL_AMT);
                          }
                      });

                      parent.$("#totQty").val(totQty);
                      parent.$("#totAmt").val(kendo.toString(totAmt, 'n2'));

                      app.hideLoading();
                      options.success(data);

                      /*
                      var mainListHeight = parent.$("#mwrap").height() - parent.$("#content_list .content_title").height() - parent.$("#content_list .listhead").height()*3  - parent.$("#content_list .formarea").height()*2;
                      parent.$("#mainList").height(mainListHeight);
                      */

                      var mainListHeight = parent._windowHeight - parent.$("#header").outerHeight() - parent.$("#content_list .content_title").outerHeight() -  parent.$("#content_list .co_group").outerHeight()*1 -10;
                      parent.$("#mainList").height(mainListHeight-140);
                      parent.$(".listarea").height(mainListHeight-60);

                  }else{
                      parent.$("#totQty").val(0);
                      parent.$("#totAmt").val(kendo.toString(0, 'n2'));
                      app.hideLoading();

                      var mainListHeight = parent._windowHeight - parent.$("#header").outerHeight() - parent.$("#content_list .content_title").outerHeight() -  parent.$("#content_list .co_group").outerHeight()*1 -10;
                      parent.$("#mainList").height(mainListHeight-60);
                      parent.$(".listarea").height(mainListHeight-60);
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
    parent.contentDetail(e.dataItem.rowData);
}

var app = setKendoMobApp();
</script>


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
    <span style="width:50%">#:mm #-#:dd #</span>
    <span style="width:50%">#:kendo.toString(totDpstAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(wdrwAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(totBalAmt, 'n2') #</span>
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

          params["sYy"] = kendo.toString(parent.$("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyy");
          params["sMm"] = kendo.toString(parent.$("#sYyMm").data("kendoExtMaskedDatePicker").value(), "MM");

          $.ajax({
              url:"<c:url value='/sal/trm/fundStatus/selectFundStatusDaySearch.do' />"
              ,data:JSON.stringify(params)
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR, status, error) {
                  app.hideLoading();

                  parent.totDpstAmt = "0";
                  parent.wdrwAmt = "0";
                  parent.totBalAmt = "0";
                  parent.getTotal();
              }
              ,success:function(result) {
                  checklistCnt("listarea_noData",result.data,noDatamsg);
                  if(result.data!=null && result.data != ""){
                      var data = [];

                      var cashDpstAmt = "";
                      var prt2DpstAmt = "";
                      var prt3DpstAmt = "";
                      var prcChgAmt = "";
                      var incnAmt = "";
                      var totDpstAmt = "";

                      var wdrwCashAmt = "";
                      var wdrwPrt2Amt = "";
                      var wdrwPrt3Amt = "";
                      var wdrwAmt = "";

                      rowTotal = result.data.length;
                      $.each(result.data , function(i , row){
                          console.log("row",row);
                          rowIndex++;
                          data.push({
                              mm:row.mm,
                              dd:row.dd,

                              cashDpstAmt:row.cashDpstAmt,
                              prt2DpstAmt:row.prt2DpstAmt,
                              prt3DpstAmt:row.prt3DpstAmt,
                              prcChgAmt:row.prcChgAmt,
                              incnAmt:row.incnAmt,
                              totDpstAmt:row.totDpstAmt,

                              wdrwCashAmt:row.wdrwCashAmt,
                              wdrwPrt2Amt:row.wdrwPrt2Amt,
                              wdrwPrt3Amt:row.wdrwPrt3Amt,
                              wdrwAmt:row.wdrwAmt,

                              cashBalAmt:row.cashBalAmt,
                              prt2BalAmt:row.prt2BalAmt,
                              prt3BalAmt:row.prt3BalAmt,
                              totBalAmt:row.totBalAmt
                          });
                      });

                      app.hideLoading();
                      options.success(data);

                      //parent.$("#listarea_noData").height(400);listhead

                      var mainListHeight = parent._windowHeight - parent.$("#header").outerHeight() - parent.$("#content_list .content_title").outerHeight() -  parent.$("#content_list .co_group").outerHeight()*4 -10;
                      parent.$("#mainList").height(mainListHeight-60);
                      parent.$(".listarea").height(mainListHeight);

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
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>


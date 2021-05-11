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
<div class="dlistitem bgNone">
    <span style="width:50%">#:kendo.toString(bfCashBalAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(bfPrt2BalAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(bfPrt3BalAmt, 'n2') #</span>
    <span style="width:50%">#:kendo.toString(bfTotBalAmt, 'n2') #</span>
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

          console.log("params value",params);

          $.ajax({
              url:"<c:url value='/sal/trm/fundStatus/selectFundStatusSearch.do' />"
              ,data:JSON.stringify(params)
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR, status, error) {
                  app.hideLoading();
              }
              ,success:function(result) {
                  console.log(result);
                  checklistCnt("listarea_noData",result.data,noDatamsg);
                  if(result.data!=null && result.data != ""){
                      var data = [];

                      rowTotal = result.data.length;
                      $.each(result.data , function(i , row){
                          console.log("row ::",row);
                          rowIndex++;
                          data.push({
                              bfCashBalAmt:row.bfCashBalAmt,
                              bfPrt2BalAmt:row.bfPrt2BalAmt,
                              bfPrt3BalAmt:row.bfPrt3BalAmt,
                              bfTotBalAmt:row.bfTotBalAmt,

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

                          parent.$("#preCash").val(kendo.toString(row.bfCashBalAmt, 'n2'));
                          parent.$("#prePrt2Amt").val(kendo.toString(row.bfPrt2BalAmt, 'n2'));
                          parent.$("#prePrt3Amt").val(kendo.toString(row.bfPrt3BalAmt, 'n2'));
                          parent.$("#preAmt").val(kendo.toString(row.bfTotBalAmt, 'n2'));

                          parent.$("#depositCash").val(kendo.toString(row.cashDpstAmt, 'n2'));
                          parent.$("#depositPrt2Amt").val(kendo.toString(row.prt2DpstAmt, 'n2'));
                          parent.$("#depositPrt3Amt").val(kendo.toString(row.prt3DpstAmt, 'n2'));
                          parent.$("#depositProChgAmt").val(kendo.toString(row.prcChgAmt, 'n2'));
                          parent.$("#depositIncnAmt").val(kendo.toString(row.incnAmt, 'n2'));
                          parent.$("#depositAmt").val(kendo.toString(row.totDpstAmt, 'n2'));

                          parent.$("#withCash").val(kendo.toString(row.wdrwCashAmt, 'n2'));
                          parent.$("#withPrt2Amt").val(kendo.toString(row.wdrwPrt2Amt, 'n2'));
                          parent.$("#withPrt3Amt").val(kendo.toString(row.wdrwPrt3Amt, 'n2'));
                          parent.$("#withAmt").val(kendo.toString(row.wdrwAmt, 'n2'));

                          parent.$("#nowCash").val(kendo.toString(row.cashBalAmt, 'n2'));
                          parent.$("#nowPrt2Amt").val(kendo.toString(row.prt2BalAmt, 'n2'));
                          parent.$("#nowPrt3Amt").val(kendo.toString(row.prt3BalAmt, 'n2'));
                          parent.$("#nowAmt").val(kendo.toString(row.totBalAmt, 'n2'));
                      });

                      app.hideLoading();
                      options.success(data);

                  }else{

                      parent.$("#preCash").val(kendo.toString(0, 'n2'));
                      parent.$("#prePrt2Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#prePrt3Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#preAmt").val(kendo.toString(0, 'n2'));

                      parent.$("#depositCash").val(kendo.toString(0, 'n2'));
                      parent.$("#depositPrt2Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#depositPrt3Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#depositProChgAmt").val(kendo.toString(0, 'n2'));
                      parent.$("#depositIncnAmt").val(kendo.toString(0, 'n2'));
                      parent.$("#depositAmt").val(kendo.toString(0, 'n2'));

                      parent.$("#withCash").val(kendo.toString(0, 'n2'));
                      parent.$("#withPrt2Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#withPrt3Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#withAmt").val(kendo.toString(0, 'n2'));

                      parent.$("#nowCash").val(kendo.toString(0, 'n2'));
                      parent.$("#nowPrt2Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#nowPrt3Amt").val(kendo.toString(0, 'n2'));
                      parent.$("#nowAmt").val(kendo.toString(0, 'n2'));

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
    //parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>


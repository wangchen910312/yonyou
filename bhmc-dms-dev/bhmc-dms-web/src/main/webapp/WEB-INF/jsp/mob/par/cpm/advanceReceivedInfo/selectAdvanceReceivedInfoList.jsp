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
    <span style="width:50%">#:preAmtUpdtDt #</span>
    <span style="width:50%">#:preAmtUpdtHm #</span>
    <span style="width:50%">#:changePreAmtTp(preAmtTp)#</span>
    <span style="width:50%">#:kendo.toString(totAmt, 'n2') #</span>
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

          var sDlrCd = parent.$("#sDlrCd").val() == "" ? "X":parent.$("#sDlrCd").val();

          params["sDlrCd"] = sDlrCd;
          params["sPreAmtTp"] = parent.$("#sPreAmtTp").val();
          params["sImpStartDt"] = chgDate(parent.$("#impStartDt").val());
          params["sImpEndDt"] = chgDate(parent.$("#impEndDt").val());

          console.log("params ::",params);

          $.ajax({
              url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do' />"
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
                          rowIndex++;
                          data.push({
                              preAmtUpdtDt:row.preAmtUpdtDt,
                              preAmtUpdtHm:row.preAmtUpdtHm,
                              preAmtTp:row.preAmtTp,
                              totAmt:row.totAmt,
                              dpstAmt:row.dpstAmt,
                              balAmt:row.balAmt,
                              dpstRefNo:row.dpstRefNo
                            });
                      });

                      options.success(data);
                      app.hideLoading();

                      var mainListHeight = parent._windowHeight - parent.$("#header").outerHeight() - parent.$("#content_list .content_title").outerHeight() -  parent.$("#content_list .flist01").outerHeight();
                      parent.$("#mainList").height(mainListHeight-90);
                      parent.$(".listarea").height(mainListHeight-10);

                  }else{
                      app.hideLoading();
                  }
              }
          });

          $.ajax({
              url:"<c:url value='/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoHeaderByKey.do' />"
              ,data:JSON.stringify({ sDlrCd:parent.$("#sDlrCd").val(), sPreAmtTp:parent.$("#sPreAmtTp").val() })
              ,type:"POST"
              ,dataType:"json"
              ,contentType:'application/json'
              ,error:function(jqXHR,status,error){
                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
              }
              ,success:function(jqXHR, textStatus){

                  if(jqXHR !== null){
                      parent.$("#acAmt").data("kendoExtNumericTextBox").value(jqXHR.dpstAmt);
                      parent.$("#calcAmt").data("kendoExtNumericTextBox").value(jqXHR.calcAmt);
                      parent.$("#balAmt").data("kendoExtNumericTextBox").value(jqXHR.useAmt);
                      parent.$("#suggestAmt").data("kendoExtNumericTextBox").value(jqXHR.lmtAmt);
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

changePreAmtTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.preAmtTpMap[val];
    }
    return returnVal;
};

var app = setKendoMobApp();
</script>


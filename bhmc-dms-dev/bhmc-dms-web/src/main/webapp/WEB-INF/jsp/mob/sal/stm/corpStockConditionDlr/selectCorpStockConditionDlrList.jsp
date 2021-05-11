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
    <span style="width:100%">#:modelNm #</span>
    <span style="width:50%">#:carlineNm #</span>
    <span style="width:50%">#:ocnNm #</span>
    <span style="width:50%">#:extColorNm #</span>
    <span style="width:50%">#:intColorNm #</span>
    <span style="display:none">#:totStockQty #</span>
    <span style="display:none">#:ordQty #</span>
    <span style="display:none">#:psntStockQty #</span>
    <span style="display:none">#:retlPrc #</span>
    <span style="display:none">#:dispGradeCd #</span>

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
          
          params["sCarlineCd"] = parent.$("#sCarLine").data("kendoExtDropDownList").value();;
          params["sModelCd"] = "";
          params["sOcnCd"] = "";
          params["sExtColorCd"] = "";
          params["sIntColorCd"] = "";
          
          $.ajax({
              url:"<c:url value='/mob/sal/stm/corpStockConditionDlr/selectCorpStockConditionDlr.do' />"
              ,data:JSON.stringify(params)
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR, status, error) {
                  app.hideLoading();
              }
              ,success:function(result) {
                  console.log(result.data);
                  checklistCnt("listarea_noData",result.total,noDatamsg);
                  if(result.data!=null && result.data != ""){
                      var data = [];
                      rowTotal = result.total;
                      $.each(result.data , function(i , row){
                          rowIndex++;
                          data.push({
                              carlineNm:row.carlineNm,
                              modelNm:row.modelNm,
                              ocnNm:row.ocnNm,
                              extColorNm:row.extColorNm,
                              intColorNm:row.intColorNm,
                              totStockQty:row.totStockQty,
                              ordQty:row.ordQty,
                              psntStockQty:row.psntStockQty,
                              retlPrc:row.retlPrc,
                              dispGradeCd:row.dispGradeCd
                            });
                      });

                      //console.log("list data : ", data);

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
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>


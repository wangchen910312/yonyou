<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>
<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem">
        <span style="width:50%">[#:carlineCd #]#:carlineNm #</span>
        <span style="width:50%">#:vinNo #</span>
        <span style="width:50%">#:ocnCd #/#:modelNm #</span>
        <span style="width:50%">#:extColorNm #/#:intColorCd #</span>
        <span style="width:50%">#:carStatNm #</span>
        <span style="width:50%">#:giDdCnt #(天)</span>
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
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      //재고유형
      params["tStockTp"] = parent.$("#tStockTp").data("kendoExtDropDownList").value();
      params["sVinNo"] = parent.$("#sVinNo").val();
      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      //params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      params["sFscCd"] = parent.$("#sFscCd").data("kendoExtDropDownList").value();
      parent.$("#subTotalSum").text("");

      $.ajax({
          url:"<c:url value='/sal/inv/stockMnt/selectStockMntSearch.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData9",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,

                          carId:row.carId,
                          carlineCd:row.carlineCd,
                          carlineNm:row.carlineNm,
                          cmpCarYn:row.cmpCarYn,
                          modelCd:row.modelCd,
                          modelNm:row.modelNm,
                          carlineNm:row.carlineNm,
                          ocnCd:row.ocnCd,
                          ocnNm:row.ocnNm,
                          extColorCd:row.extColorCd,
                          extColorNm:row.extColorNm,
                          carlineCd:row.carlineCd,
                          intColorCd:row.intColorCd,
                          intColorNm:row.intColorNm,
                          cnt:row.cnt,
                          vinNo:row.vinNo,
                          carStatNm:row.carStatNm,
                          vinmF20010:row.vinmF20010,
                          ordTpNm:row.ordTpNm,
                          ordTp:row.ordTp,
                          strYn:row.strYn,
                          damageCd:row.damageCd,
                          blockYn:row.blockYn,
                          blockSaleAdvNo:row.blockSaleAdvNo,
                          strgeCd:row.strgeCd,
                          locCd:row.locCd,
                          temp2:row.temp2,
                          cmpCarDstinCd:row.cmpCarDstinCd,
                          locNm:row.locNm,
                          bfDamageCd:row.bfDamageCd,
                          bfBlockYn:row.bfBlockYn,
                          bfBlockSaleAdvNo:row.bfBlockSaleAdvNo,
                          bfStrgeCd:row.bfStrgeCd,
                          bfLocCd:row.bfLocCd,
                          bfCmpCarYn:row.bfCmpCarYn,
                          bfCmpCarDstinCd:row.bfCmpCarDstinCd,
                          openYn:row.openYn,
                          retlPrc:row.retlPrc,
                          usedAmtTp:row.usedAmtTp,
                          usedAmtTpNm:row.usedAmtTpNm,
                          bankNm:row.bankNm,
                          pltGiDt:row.pltGiDt,
                          dlrGrDt:row.dlrGrDt,
                          enginModelCd:row.enginModelCd,
                          certNo:row.certNo,
                          carStatCd:row.carStatCd,
                          ownStatCd:row.ownStatCd,
                          mmCnt:row.mmCnt,
                          giDdCnt:row.giDdCnt,
                          grDdCnt:row.grDdCnt,
                          whslPrc:row.whslPrc,
                          contractNo:row.contractNo,
                          dlrCd:row.dlrCd,
                          dlrNm:row.dlrNm,
                          ncarDstinCd:row.ncarDstinCd

                       });
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.$("#subTotalSum").text(rowTotal);

                  //parent.openSearchBtn();
              }else{
                  parent.$(".listarea").height(parent.$(".listarea").height()-parent.$(".btnfixed").height());
                  app.hideLoading();
              }

              parent.openSearchBtn();

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
    parent.contentDetail(e);//재고관리리스트 보기
}

//var app = new kendo.mobile.Application();
//var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
var app = setKendoMobApp();
</script>

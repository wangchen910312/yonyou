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
        <span style="width:35%">#:carlineNm #</span>
        <span style="width:45%">#:extColorNm #/#:intColorNm #</span>
        <span style="width:20%">#:cnt #</span>
        <span style="width:35%"  class="clboth">#:ocnNm #</span>
        <span style="width:65%">#:modelNm #</span>
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
    //화면 최초 로딩시 조회 불가하도록 설정
      if(!parent.searchClickFl){
          return false;
      }
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
      params["sStockTpDS"] = parent.$("#sStockTpDS").data("kendoExtDropDownList").value();
      //회사차여부
      params["sCmpCarYn"] = parent.$("#sCmpCarYn").data("kendoExtDropDownList").value();
      // 회사차구분
      params["sCmpCarDstinCd"] = parent.$("#sCmpCarDstinCd").data("kendoExtDropDownList").value();
      // 창고
      params["sStrgeCd"] = parent.$("#sStrgeCd").data("kendoExtDropDownList").value();
      // 위치
      params["sLocCd"] = parent.$("#sLocCd").data("kendoExtDropDownList").value();
      // vin
      params["sVinNo"] = parent.$("#sVinNo").val();

      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      params["sOcnCd"] = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();
      params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value();


      $.ajax({
          url:"<c:url value='/mob/sal/inv/stockState/selectStockState.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          carlineCd:row.carlineCd,
                          carlineNm:row.carlineNm,
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
                          cnt:row.cnt
                       });
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
    parent.contentDetailList(e.dataItem);//재고관리리스트 보기
}

//var app = new kendo.mobile.Application();
//var app = new kendo.mobile.Application($(document.body),{platform:"android-light"});
var app = setKendoMobApp();
</script>

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
    <span style="width:50%">#:vinNo #</span>
    <span style="width:50%">#:changeCarStatCd(carStatCd) #</span>
    <span class="clboth">#:ocnNm #</span>
    <span style="width:50%" class="clboth">#:extColorNm #/#:intColorNm #</span>
    <span style="width:50%">#:changeStockTp(stockTp) #</span>
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
      //화면 최초 로딩시 조회 불가하도록 설정
      if(!parent.searchClickFl){
          return false;
      }
      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = null;
      params["sVinNo"] = parent.$("#sVinNo").val();
      params["sCarStatCd"] = parent.$("#sCarStatCd").data("kendoExtDropDownList").value();
      params["sOwnStatCd"] = parent.$("#sOwnStatCd").data("kendoExtDropDownList").value();
      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      params["sOcnCd"] = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();
      params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value();

      parent.$("#content_pop_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/sal/cmm/selectVehicleMasterSts.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //dms.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          vinNo        :row.vinNo        ,
                          ncarDstinCd  :row.ncarDstinCd  ,
                          dlrCd        :row.dlrCd        ,
                          carStatCd    :row.carStatCd    ,
                          ownStatCd    :row.ownStatCd    ,
                          carlineCd    :row.carlineCd    ,
                          carlineNm    :row.carlineNm    ,
                          modelCd      :row.modelCd      ,
                          modelNm      :row.modelNm      ,
                          ocnCd        :row.ocnCd        ,
                          ocnNm        :row.ocnNm        ,
                          extColorCd   :row.extColorCd   ,
                          extColorNm   :row.extColorNm   ,
                          intColorCd   :row.intColorCd   ,
                          intColorNm   :row.intColorNm   ,
                          stockTp      :row.stockTp      ,
                          strgeCd      :row.strgeCd      ,
                          locCd        :row.locCd        ,
                          cmpCarYn     :row.cmpCarYn     ,
                          cmpCarDstinCd:row.cmpCarDstinCd

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


changeCarStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.carStatObj[val];
    }
    return returnVal;
};

changeStockTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.stockTpObj[val];
    }
    return returnVal;
};

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentCommonDetail(e.dataItem);

    var curRow = e.dataItem.rowIdx - 1;
    $('.dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

var app = setKendoMobApp();

</script>

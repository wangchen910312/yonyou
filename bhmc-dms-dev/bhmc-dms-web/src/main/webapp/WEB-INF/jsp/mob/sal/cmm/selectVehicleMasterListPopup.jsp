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
<div class="dlistitem bgNone" id="listContentRow">
    <span style="width:50%">#:vinNo #</span>
    <span style="width:50%">#:changeCarStatCd(carStatCd) #</span>
    <span style="width:50%" class="clboth">#:trimNull(ocnNm) #</span>
    <!--<span style="width:50%" >#:changeOwnStatCd(ownStatCd) #</span>-->
    <span style="width:50%" class="clboth">#:trimNull(extColorNm) #/#:trimNull(intColorNm) #</span>
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
      /* if(!parent.searchClickFl){
          return false;
      } */
      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = options.sort;//[{"field":"vinNo","dir":"desc"}];

      /* params["sVinNo"] = parent.$("#sVinNo").val();
      params["sCarStatCd"] = parent.$("#sCarStatCd").data("kendoExtDropDownList").value();
      params["sOwnStatCd"] = parent.$("#sOwnStatCd").data("kendoExtDropDownList").value();
      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      params["sOcnCd"] = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();
      params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value(); */

      params["sDlrCd"] = parent.dlrCd;                                                           // 딜러
      params["sVinNo"] = parent.$("#sVinNo").val();                                              // 빈넘버
      params["sCarStatCd"] = parent.$("#sCarStatCd").data("kendoExtDropDownList").value();          // 차량상태
      params["sOwnStatCd"] = parent.$("#sOwnStatCd").data("kendoExtDropDownList").value();          // 보유상태
      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종
      params["sModelCd"]   = parent.$("#sModelCd").data("kendoExtDropDownList").value();            // 모델
      params["sOcnCd"]     = parent.$("#sOcnCd").data("kendoExtDropDownList").value();              // OCN
      params["sExtColorCd"]= parent.$("#sExtColorCd").data("kendoExtDropDownList").value();         // 외장색
      params["sIntColorCd"]= parent.$("#sIntColorCd").data("kendoExtDropDownList").value();         // 내장색
      params["sCarRegNo"]  = parent.$("#sCarRegNo").val();                                       // 차량번호
      //params["sCmpCarYn"]  = parent.$("#sCmpCarYn").val();                                       // 회사차여부
      params["sCmpCarDstinCd"]= parent.$("#sCmpCarDstinCd").data("kendoExtDropDownList").value();   // 회사차구분 */

      parent.$("#content_pop_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/sal/cmm/selectVehicleMasterSts.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              //console.log(result)
              checklistCnt("listarea_noData_pop",result.total,noDatamsg);
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
                          cmpCarDstinCd:row.cmpCarDstinCd,
                          carRegNo     :row.carRegNo

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
changeOwnStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ownStatObj[val];
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

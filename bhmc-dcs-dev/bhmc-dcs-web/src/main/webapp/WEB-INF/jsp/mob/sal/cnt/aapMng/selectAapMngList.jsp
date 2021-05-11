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
<div class="dlistitem">
    <span style="width:40%">#:changeAapWrkDstinCd(aapWrkDstinCd) #</span>
    <span style="width:30%">#:trimNull(aapEmpNm) #</span>
    <span style="width:30%">#:aapDt #</span>
    <span style="width:40%" class="clboth">#:trimNull(carRegNo) #</span>
    <span style="width:60%">#:vinNo #</span>
    <span style="width:40%" class="clboth">#:cstAmt #</span>
    <span style="width:60%">#:profitAmt #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

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

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = null;

      params["sVinNo"] = parent.$("#sVinNo").val();
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sAapWrkDstinCd"] = parent.$("#sAapWrkDstinCd").data("kendoExtDropDownList").value();
      params["sAapEmpNm"] = parent.$("#sAapEmpNm").val();
      //date타입 오류로 임수 주석처리
      //params["sStartDt"] = parent.$("#sStartDt").data("kendoExtMaskedDatePicker").value();   //일자FROM
      //params["sEndDt"] = parent.$("#sEndDt").data("kendoExtMaskedDatePicker").value();   //일자TO

      params["sStartDt"] = new Date(parent.$("#sStartDt").val());
      params["sEndDt"] = new Date(parent.$("#sEndDt").val());

      parent.$("#content_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/sal/cnt/aapMng/selectAapMng.do' />"
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
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, aapDt:chgDate2Str(row.aapDt), aapWrkDstinCd:row.aapWrkDstinCd,
                          seq:row.seq, vinNo:row.vinNo, carlineCd:row.carlineCd, carlineNm:row.carlineNm,
                          modelCd:row.modelCd, modelNm:row.modelNm, ocnCd:row.ocnCd, ocnNm:row.ocnNm,
                          carRegNo:row.carRegNo, aapEmpNm:row.aapEmpNm, cstAmt:row.cstAmt,
                          profitAmt:row.profitAmt, aapAmt:row.aapAmt});
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

changeAapWrkDstinCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.aapWrkDstinCdObj[val];
    }
    return returnVal;
};

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem">
        <span style="width:50%">#:trimNull(parResvDt) #</span>
        <span style="width:50%">#:trimNull(driverNm) #</span>

        <span class="clboth" style="width:50%">#:trimNull(parResvDocNo) #</span>
        <span style="width:50%">#:trimNull(carRegNo) #</span>
    </div>
</script>

<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

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
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;

      /* params["sCarRegNo"]       = parent.$("#sCarRegNo").val();
      params["sDriverNm"]       = parent.$("#sDriverNm").val();
      params["sCarOwnerNm"]     = parent.$("#sCarOwnerNm").val();
      params["sRegUsrNm"]       = parent.$("#sRegUsrNm").val();
      params["sVinNo"]          = parent.$("#sVinNo").val();
      params["sParResvDocNo"]   = parent.$("#sParResvDocNo").val();
      params["sParResvTp"]      = parent.$("#parResvTp").data("kendoExtDropDownList").value();
      params["sParResvStartDt"] = chgDate(parent.$("#sParResvStartDt").val());
      params["sParResvEndDt"]   = chgDate(parent.$("#sParResvEndDt").val()); */
      params["sCarRegNo"]       = parent.$("#sCarRegNo").val();
      params["sParResvStatCd"]  = parent.$("#sParResvStatCd").data("kendoExtDropDownList").value();
      params["sPartNm"]         = parent.$("#sPartNm").val();
      params["sRegUsrNm"]       = parent.$("#sRegUsrNm").val();
      params["sVinNo"]          = parent.$("#sVinNo").val();
      params["sParResvDocNo"]   = parent.$("#sParResvDocNo").val();
      params["sParResvTp"]      = parent.$("#parResvTp").data("kendoExtDropDownList").value();
      params["sParResvStartDt"] = chgDate(parent.$("#sParResvStartDt").val());
      params["sParResvEndDt"]   = chgDate(parent.$("#sParResvEndDt").val());


      params["sPreFixId"]       = parent.preFixId;




      /* params["sListType"] = "01";
      if(parent.$("#sCarRegNo").val() == ""){
          params["sCarRegNo"] = null;
      }else{
          params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      }
      if(parent.$("#sVinNo").val() == "" ){
          params["sVinNo"] = null;
      }else{
          params["sVinNo"] = parent.$("#sVinNo").val();
      }
      if(parent.$("#sParResvDocNo").val() == "" ){
          params["sParResvDocNo"] = null;
      }else{
          params["sParResvDocNo"] = parent.$("#sParResvDocNo").val();
      } */

      $.ajax({
          url:"<c:url value='/mob/par/pcm/partReservation/selectPartReservations.do' />"
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
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          carRegNo:row.carRegNo,
                          vinNo:row.vinNo,
                          carOwnerNm:row.carOwnerNm,
                          driverNm:row.driverNm,
                          carlineNm:row.carlineNm,
                          modelNm:row.modelNm,
                          runDistVal:row.runDistVal,
                          carRunDistVal:row.carRunDistVal,
                          parResvDocNo:row.parResvDocNo, /* 부품예약번호 */
                          parResvTp:row.parResvTp,
                          regUsrNm:row.regUsrNm,
                          parResvDt:row.parResvDt, /* 부품예약시간 */
                          cancReasonCont:row.cancReasonCont,
                          parResvRemark:row.parResvRemark, /* 부품예약비고 */
                          parAmt:row.parAmt,
                          etcAmt:row.etcAmt,
                          dcAmt:row.dcAmt,
                          sumAmt:row.sumAmt,
                          preAmt:row.preAmt,
                          reqQty:row.reqQty,

                          custRemark:row.custRemark, /* 고객비고 */
                          parResvStatCd:row.parResvStatCd,
                          realOrdDt:chgDate2DateTimeStr(row.realOrdDt), /* 실제주문시간 */
                          scheArryDt:chgDate2DateTimeStr(row.scheArrtDt), /*예정도착시간 */
                          realArryDt:chgDate2DateTimeStr(row.realArrtDt), /*실제도착시간 */
                          arryAlrtDt:chgDate2DateTimeStr(row.arryAlrtDt) /*도착알림시간 */
                       });
                  });
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


changeResvStatCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.resvStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

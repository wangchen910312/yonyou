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
        <span style="width:35%">#:trimNull(parResvDt) #</span>
        <span style="width:65%">#:trimNull(parResvDocNo) #</span>

        <span class="clboth" style="width:35%">#:changeResvStatCdList(parResvStatCd) #</span>
        <span style="width:65%">#:trimNull(vinNo) #</span>

        <span class="clboth" style="width:35%">#:trimNull(driverNm) #</span>
        <span style="width:65%">#:trimNull(carRegNo) #</span>
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

      /*
      var sort = [];
      var sortItem = {};
      sortItem.field = "regDt";
      sortItem.dir = "desc";
      sort.push(sortItem);
      params["sort"] = sort;
      */

      //params["sort"] = [{"field":"regDt","dir":"desc"}];

      params["sListType"] = "01";

      if(parent.$("#sParResvDt").val() == "" || parent.$("#search1Area span[name='searchStr']").text() == ""){
        params["sParResvDt"] = null;
      }else{
        params["sParResvDt"] = chgDate(parent.$("#sParResvDt").val());
      }


      //params["sCarRegNo"] = parent.$("#sCarRegNo").val();//차량번호
      //params["sDriverNm"] = parent.$("#sDriverNm").val();//고객명

      params["sParResvStatCd"] = parent.$("#sParResvStatCd").data("kendoExtDropDownList").value();

      $.ajax({
          url:"<c:url value='/mob/ser/rev/partReservation/selectPartReservations.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors[0]);
              app.hideLoading();
          }
          ,success:function(result) {

              if(result.data!=null && result.data != ""){
                  var data = [];

                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          parResvDocNo:row.parResvDocNo, /* 부품예약번호 */
                          custRemark:row.custRemark, /* 고객비고 */

                          parResvStatCd:row.parResvStatCd,
                          carRegNo:row.carRegNo,
                          vinNo:row.vinNo,
                          driverNm:row.driverNm,

                          parResvDt:row.parResvDt, /* 부품예약시간 */
                          realOrdDt:row.realOrdDt, /* 실제주문시간 */
                          scheArryDt:row.scheArrtDt, /*예정도착시간 */
                          realArryDt:row.realArrtDt, /*실제도착시간 */
                          arryAlrtDt:row.arryAlrtDt, /*도착알림시간 */
                          parResvRemark:row.parResvRemark /* 부품예약비고 */
                       });
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

//listData.sort({ field:"regDt", dir:"desc"});


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

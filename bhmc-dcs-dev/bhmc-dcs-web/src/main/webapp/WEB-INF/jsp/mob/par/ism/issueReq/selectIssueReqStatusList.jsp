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
        <span style="width:50%">#:chgDate2DateTimeStr(regDt) #</span>
        <span style="width:50%">#:trimNull(parReqDocNo) #</span>
        <span class="clboth" style="width:50%">#:trimNull(giDocNo) #</span>
        <span style="width:50%">#:changeGiDocStatCd(giDocStatCd) #</span>
        <span class="clboth" style="width:50%">#:trimNull(custCd) #</span>
        <span style="width:50%">#:trimNull(carNo) #</span>
    </div>
</script>


<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

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

      params["sort"] = [{"field":"regDt","dir":"desc"}];


      params["sParGiTp"] = parent.$("#sParGiTp").val();                  // 위탁서유형
      params["sParReqDocNo"] = parent.$("#sParReqDocNo").val();          // 위탁서번호

      params["sReqStartDt"] = chgDate(parent.$("#sReqStartDt").val());          // 등록일자
      params["sReqEndDt"] = chgDate(parent.$("#sReqEndDt").val());          // 등록일자

      params["sCustNm"] = parent.$("#sCustNm").val();                   // 고객명
      params["sCarNo"] = parent.$("#sCarNo").val();                     // 차량번호
      params["sSerPrsnId"] = parent.$("#sSerPrsnId").val();             // 서비스담당자ID
      //params["sGiDocNo"] = parent.$("#sGiDocNo").val();                 // 출고문서번호 (todo:IssueReqSearchVO vo없음 --- web쪽 반영이후 적용가능)



      /*
      params["sMobisInvcNo"] = parent.$("#sMobisInvcNo").val();

      if(parent.$("#sInvcDt").val() == "" || parent.$("#search2").text() == ""){
          params["sInvcDt"] = null;
      }else{
          params["sInvcDt"] = parent.$("#sInvcDt").val();
      }
      */


      $.ajax({
          url:"<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusLists.do' />"
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
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd, // 딜러코드
                          parReqDocNo:row.parReqDocNo, // 부품요청문서번호 -> 위탁서번호 --
                          parGiTp:row.parGiTp, // 부품출고유형
                          parReqStatCd:row.parReqStatCd, // 부품요청상태코드
                          cancYn:row.cancYn, // 취소여부
                          roDocNo:row.roDocNo, // RO문서번호
                          resvDocNo:row.resvDocNo, // 예약문서번호
                          pltCd:row.pltCd, // 센터코드
                          serPrsnId:row.serPrsnId, // 서비스담당자ID
                          custCd:row.custCd, // 고객코드
                          custNm:row.custNm, // 고객명 --
                          vinNo:row.vinNo, // 차대번호
                          carNo:row.carNo, // 차량번호 --
                          regUsrId:row.regUsrId, // 등록자ID
                          regDt:row.regDt, // 등록일자 -> 출고등록일자 --
                          updtUsrId:row.updtUsrId, // 수정자ID
                          updtDt:row.updtDt, // 수정일자
                          giDocNo:row.giDocNo, // 출고문서번호 --
                          //giDocTp:row.giDocTp, // 출고문서유형 --
                          giDocStatCd:row.giDocStatCd // 출고문서상태코드
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


changeGiDocStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.giDocStatCdObj[val];
    }
    return returnVal;
};


function listViewClick(e)
{

    parent.$("#selParReqDocNo").val(e.dataItem.parReqDocNo);
    parent.$("#selCustCd").val(e.dataItem.custCd);
    parent.$("#selCustNm").val(e.dataItem.custNm);
    parent.$("#selVinNo").val(e.dataItem.vinNo);
    parent.$("#selCarNo").val(e.dataItem.carNo);

    parent.$("#selGiDocNo").val(e.dataItem.giDocNo);
    parent.$("#selRoDocNo").val(e.dataItem.roDocNo);

    //parent.contentItemList(e.dataItem.parReqDocNo);//부품리스트 보기


    parent.contentItemListFromList(e.dataItem);
}

var app = setKendoMobApp();

</script>

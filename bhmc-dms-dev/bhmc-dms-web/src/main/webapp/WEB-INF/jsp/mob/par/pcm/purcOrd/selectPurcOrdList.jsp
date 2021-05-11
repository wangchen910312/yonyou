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
    <span style="width:50%">#:trimNull(purcOrdNo) #</span>
    <span style="width:50%">#:trimNull(bpNm) #</span>

    <span style="width:50%">#:changePurcOrdTp(purcOrdTp) #</span>
    <span style="width:50%">#:changePurcOrdStat(purcOrdStatCd) #</span>

    <span class="clboth" style="width:50%">#:LchgServerDate2Str(purcRegDt) #</span>
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
var detailData;
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
      params["sort"] = null;


      // 구매오더 검색조건 코드.
      var sBpCdArr = new Array();
      if(parent.$("#sBpCd").val() == ""){
      }else{
          sBpCdArr[0] = parent.$("#sBpCd").val();
      }

      var sPurcOrdStatArr = new Array();
      if(parent.$("#sPurcOrdStatCd").data("kendoExtMobileMultiSelectDropDownList").value() == ""){
          params["sPurcOrdStatLst"] = null;
      }else{
          sPurcOrdStatArr[0] = parent.$("#sPurcOrdStatCd").data("kendoExtMobileMultiSelectDropDownList").value();

          params["sPurcOrdStatLst"] = sPurcOrdStatArr;
      }
      params["sBpCdList"]          = sBpCdArr;
      params["sPurcOrdNo"]         = parent.$("#sPurcOrdNo").val();
      params["sPurcOrdTp"]         = parent.$("#sPurcOrdTp").data("kendoExtDropDownList").value();
      params["sTrsfTp"]            = parent.$("#sTrsfTp").data("kendoExtDropDownList").value();
      params["sTotPurcAmtFr"]        = parent.$("#sTotPurcAmtFr").val().replace(/[^0-9.]+/g, '').replace(".00","");
      params["sTotPurcAmtTo"]        = parent.$("#sTotPurcAmtTo").val().replace(/[^0-9.]+/g, '').replace(".00","");;
      params["sRegUsrId"]          = parent.$("#sRegUsrId").val();

      params["sPurcRegDtFr"]       = chgDate(parent.$("#sPurcRegDtFr").val());
      params["sPurcRegDtTo"]       = chgDate(parent.$("#sPurcRegDtTo").val());
      params["sPurcOrdStatLst"]    =sPurcOrdStatArr;

      console.log("params",params);


      $.ajax({
          url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
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
                      console.log("mob row",row);
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          purcOrdStatCd:row.purcOrdStatCd,
                          purcOrdTp:row.purcOrdTp,
                          purcRegDt:row.purcRegDt,
                          purcOrdNo:row.purcOrdNo,
                          bpCd:row.bpCd,
                          bpNm:row.bpNm,

                          confirmParCnt:row.confirmParCnt,
                          confirmParQty:row.confirmParQty,
                          totPurcAmt:row.totPurcAmt,
                          purcRegDt:row.purcRegDt,
                          boParCnt:row.boParCnt,
                          boParQty:row.boParQty,
                          purcItemStatCd:row.purcItemStatCd,
                          regUsrNm:row.regUsrNm
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

//구매상태
changePurcOrdStat = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.purcOrdStatObj[val];
    }
    return returnVal;
};


//오더유형
changePurcOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.purcOrdTpObj[val];
    }
    return returnVal;
};

LchgServerDate2Str= function(val){
    return parent.chgServerDate2Str(val);
};

/* function listViewClick(e){
    parent.contentDetail(e.dataItem.purcOrdNo);
} */

function listViewClick(e){
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>

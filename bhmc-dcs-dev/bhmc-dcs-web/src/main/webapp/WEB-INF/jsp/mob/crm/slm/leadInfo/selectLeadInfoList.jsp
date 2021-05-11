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
        <span style="width:30%">#:trimNull(custNm) #</span>
        <span style="width:35%">#:trimNull(hpNo) #</span>
        <span style="width:35%">#:changeStatCd(statCd) #</span>
        <span class="clboth" style="width:30%">#:changeLeadSrcCd(leadSrcCd) #</span>
        <span style="width:35%">#:trimNull(bhmcYn) #</span>
        <span style="width:35%">#:trimNull(prsnNm) #</span>
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

      params["sLeadSrcCd"] = parent.$("#sLeadSrcCd").val();//리드출처
      params["sCustNm"] = parent.$("#sCustNm").val();// 고객명
      params["sStatCd"] = parent.$("#sStatCd").val();// 상태
      params["sBhmcYn"] = parent.$("#sBhmcYn").val();// BHMC여부
      params["sPrsnId"] = parent.$("#sPrsnId").val();// 판매고문


      if(parent.$("#sAllocDtFrom").val() == "" || parent.$("#search6Area span[name='searchStr']").text() == ""){
          params["sAllocDtFrom"] = null;
      }else{
          params["sAllocDtFrom"] = chgDate(parent.$("#sAllocDtFrom").val());
      }

      if(parent.$("#sAllocDtTo").val() == "" || parent.$("#search6Area span[name='searchStr']").text() == ""){
          params["sAllocDtTo"] = null;
      }else{
          params["sAllocDtTo"] = chgDate(parent.$("#sAllocDtTo").val());
      }


      /*
      // form 데이터 (todo:현재 검색조건이 쿼리에 없음 LeadInfoDAO_SqlMap.xml - selectLeadInfoByCondition)
      var param = {};
      //param["sLeadNo"] = $("#leadNo").val();
      param["sLeadTp"] = "COMMON";  // COMMON:일반리드, IDCC:IDCC리드
      */

      $.ajax({
          url:"<c:url value='/mob/crm/slm/leadInfo/selectLeads.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              mob.notification.error(jqXHR.responseJSON.errors);
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

                          leadNo:row.leadNo,
                          leadTp:row.leadTp,
                          custNo:row.custNo,
                          custNm:row.custNm,
                          custTp:row.custTp,
                          officeTelNo:row.officeTelNo,

                          hpNo:row.hpNo,
                          telNo:row.telNo,
                          leadSrcCd:row.leadSrcCd,
                          leadSrcDtl:row.leadSrcDtl,
                          bhmcYn:row.bhmcYn,
                          prsnNm:row.prsnNm,
                          regUsrNm:row.regUsrNm,
                          statCd:row.statCd,
                          ddlnDt:row.ddlnDt,
                          opptChgDt:row.opptChgDt,
                          regDt:row.regDt,
                          allocDt:row.allocDt,
                          delayYn:row.delayYn,
                          remark:row.remark
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



changeStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.statMap[val];
    }
    return returnVal;
};


changeLeadSrcCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.leadSrcMap[val];
    }
    return returnVal;
};

/*
test = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = "style='color:red;'";
    }
    returnVal = "style=color:red;";
    return returnVal;
};
*/


function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

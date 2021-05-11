<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul
  data-role="listview"
  data-source="listData"

  data-template="list-template"
  data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem bgNone">
            <span style="width:50%">#:trimNull(rpirCd) #</span>
            <span style="width:50%">#:trimNull(rpirNm) #</span>
            <span style="width:50%">#:allocStatCdChange(allocStatCd) #</span>
            <span style="width:50%">#:chgDate2DateTimeStr(allocStartDt) #</span>
            <span style="width:50%">#:chgDate2DateTimeStr(allocEndDt) #</span>
            <span style="width:50%">#:trimNull(realTecNm) #</span>
            <span style="width:50%">#:trimNull(allocHm) #</span>
            <span style="width:50%">#:trimNull(saNm) #</span>
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
      params["sort"] = null;

      params["sRoDocNo"] = parent.$("#roDocNo").val();

      $.ajax({
          url:"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_sub1",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;

                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          rpirCd:row.rpirCd,
                          rpirNm:row.rpirNm,
                          rpirTp:row.rpirTp,
                          rpipDstinCd:row.rpipDstinCd,
                          planHm:row.planHm,
                          bayNm:row.bayNm,

                          wkgrpCd:row.wkgrpCd,
                          wkgrpNm:row.wkgrpNm,

                          realTecId:row.realTecId,
                          realTecNm:row.realTecNm,
                          wrkEndDt:row.wrkEndDt,
                          allocEndDt:row.allocEndDt,
                          allocHm:row.allocHm,
                          allocStatCd:row.allocStatCd,
                          allocStartDt:row.allocStartDt,
                          allocEndDt:row.allocEndDt,
                          saNm:row.saNm
                      });
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("subList",4,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("subList",4,0);
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

function listViewClick(e){
}

rpirStatChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.rpirStatMap[val].cmmCdNm;
    }
    return returnVal;
}

allocStatCdChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.allocStatCdMap[val].cmmCdNm;
    }
    return returnVal;
}

var app = setKendoMobAppForNativeScroll();

</script>
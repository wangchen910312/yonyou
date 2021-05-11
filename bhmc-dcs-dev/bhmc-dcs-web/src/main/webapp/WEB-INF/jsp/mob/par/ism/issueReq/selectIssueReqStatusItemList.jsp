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
        <div class="checkitem">
            <span class="check">
                <input type="checkbox" class="f_check" name="isSave" #:isSave # /><label for="check01"></label>
            </span>
            <span name="itemCd" style="width:50%">#:trimNull(itemCd) #</span>
            <span style="width:50%">#:trimNull(resvQty) #(#:trimNull(unitCd) #)</span>
            <span class="clboth" style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(giLocCd) #</span>
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
      params["sort"] = null;

      //params["sParReqDocNo"] = parent.$("#sParReqDocNo").val();
      params["sParReqDocNo"] = parent.$("#selParReqDocNo").val();

      //parent.$("#lblInvcDocNo").text(parent.$("#sInvcDocNo").val());

      $.ajax({
          url:"<c:url value='/mob/par/ism/issueReq/selectIssueReqStatusItemLists.do' />"

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

                      var isSaveVal = "";
                      if(parent.saveList != null){
                          for(var i=0; i<parent.saveList.length; i++){
                              if(parent.saveList[i].itemCd == row.itemCd){
                                  isSaveVal = "checked";
                              }
                          }
                      }

                      // 부품출고유형이 '02'(이미출고확정)일 때 출고확정 대상 아이템 리스트에서 제외처리로 변경
                      if(row.parReqStatCd != "02"){

                          data.push({
                              pageIdx:pageIndex,
                              rowIdx:rowIndex,
                              dlrCd:row.dlrCd,
                              itemNm:row.itemNm,
                              itemCd:row.itemCd,
                              giLocCd:row.giLocCd,
                              parReqDocNo:row.parReqDocNo,
                              parReqStatCd:row.parReqStatCd,
                              parReqDocLineNo:row.parReqDocLineNo,
                              resvQty:row.resvQty,
                              unitCd:row.unitCd,
                              reqQty:row.reqQty,
                              isSave:isSaveVal//,
                              //checkDisable:checkDisableVal
                              // jhlim todo --- 출고수량
                          });
                      }else{
                          rowTotal --;
                      }
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
    parent.contentDetail(e.dataItem.itemCd);
}

var app = setKendoMobApp();
</script>

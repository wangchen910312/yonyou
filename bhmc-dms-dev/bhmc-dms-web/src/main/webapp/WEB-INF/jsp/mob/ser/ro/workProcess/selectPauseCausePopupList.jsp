<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="listview" name="listview" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem bgNone">
    <span style="width:30%">#:trimNull(lbrCd) #</span>
    <span style="width:70%">#:trimNull(lbrNm) #</span>

    <span class="clboth" style="width:30%">#:trimNull(lbrTp) #</span>
    <span style="width:70%">#:trimNull(lbrHm) #</span>
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
      params["sRoDocNo"] = parent.$("#roDocNo").val();
      params["sRpipCd"]  = parent.$("#rpirCd").val();
      params["assignYn"]  = "Y";

      $.ajax({
          url:"<c:url value='/ser/ro/workPause/selectWorkPauses.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
            /* checklistCnt("listarea_noData", result.total, noDatamsg); */
              if (result.data != null && result.data != "") {
                  var data = [];
                  rowTotal = result.total;

                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,

                          lbrTp:parent.lbrTpCdGrid(row.lbrTp),
                          lbrCd:row.lbrCd,
                          lbrNm:row.lbrNm,
                          lbrHm:row.lbrHm
                      });
                  });
                  options.success(data);
                  app.hideLoading();
              }
              else {
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

//클릭이벤트
function listViewClick(e){
    $("div.dlistitem").removeClass("dlist_selected");
    e.item.children().addClass("dlist_selected");
    parent.setSelectedItem(e.dataItem);
}

//추가
function addItemList(data){
    var rowTotal=1;
    var listview = $("#listview").data("kendoMobileListView");
    var eqSign = false;

    $.each(listview.dataSource.data(), function(index,value){
        rowTotal++;
        if(value.lbrCd==data.lbrCd){
            eqSign = true;
        }
    }
    );

    if(eqSign){
        return;
    }else{
        listview.dataSource.insert({
            lbrCd  :data.lbrCd
            ,lbrNm   :data.lbrNm
            ,lbrTp   :data.lbrTp
            ,lbrHm  :data.lbrHm
        });

        parent.setSubListHeightNew("mainList_list",4,rowTotal);
        listview.refresh();
    }

    //저장
    //parent.confirmOpen(confirmMsgSave,'parent.saveAddressList',y,n);
    //parent.saveAddressList();
}

function delItemList(data){
    var listview = $("#listview").data("kendoMobileListView");
    listview.dataSource.remove(data);
    listview.refresh();
}



var app = setKendoMobApp();

</script>
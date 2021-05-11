<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%" name="_itemCd" >#:trimNull(itemCd) #</span>
    <span style="width:50%">#:changeItemDstinCd(itemDstinCd) #</span>
    <span class="clboth" style="width:50%">#:trimNull(itemNm) #</span>
    <span style="width:50%">#:changeSpyrCd(spyrCd) #</span>
    <%--
    <span class="delete" id="deleteItem" >
        <span class="btn_del" name="deleteItem1" onclick="removeItem(this);">삭제</span>
    </span>
    --%>


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

      params["sItemCd"] = parent.$("#sItemCd").val();
      params["sItemNm"] = parent.$("#sItemNm").val();
      params["sSpyrCd"] = parent.$("#sSpyrCd").val();
      params["sItemDstinCd"] = parent.$("#sItemDstinCd").val();

      $.ajax({
          url:"<c:url value='/mob/par/pmm/itemMaster/selectItemMasterLists.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, dlrCd:row.dlrCd, itemCd:row.itemCd, itemNm:row.itemNm, spyrCd:row.spyrCd, itemDstinCd:row.itemDstinCd});
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



function removeItem(obj){
    var itemCd = $(obj).parent().parent().find("span[name='_itemCd']").text();
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        console.log($(item).find("span[name='_itemCd']").text());
        if($(item).find("span[name='_itemCd']").text() == itemCd){
             return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx-1]);
    //listView.remove([listData.data()[idx-1]]);
    //listView.dataSource.read();
    listView.refresh();
}


changeSpyrCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.spyrCdObj[val];
    }
    return returnVal;
};

changeItemDstinCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.itemDstinCdObj[val];
    }
    return returnVal;
};

function listViewClick(e)
{
    parent.contentDetail(e.dataItem.itemCd);
}

var app = setKendoMobApp();

</script>


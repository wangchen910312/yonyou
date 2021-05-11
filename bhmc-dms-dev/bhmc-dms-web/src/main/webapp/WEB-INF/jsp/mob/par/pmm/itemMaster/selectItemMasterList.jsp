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
<!-- jhg -->
<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:30%" name="_itemCd" >#:itemCd #</span>
    <span style="width:40%">#:changeItemDstinCd(itemDstinCd) #</span>
    <span style="width:30%">#:trimNull(abcInd) #</span>
    <span style="width:30%">#:changeBpTp(bpTp) #</span>
    <span style="width:40%">#:changeBrandCd(brandCd) #</span>
    <span style="width:30%">#:changeCarlineCd(carlineCd) #</span>
    <span class="clboth" style="width:100%">#:trimNull(itemNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(bpNm) #</span>


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


          params["sItemCd"] = parent.$("#sItemCd").val();
          params["sItemNm"] = parent.$("#sItemNm").val();
          params["sBpTp"] = parent.$("#sBpTp").data("kendoExtDropDownList").value();

          params["sBrandCd"] = parent.$("#sBrandCd").data("kendoExtDropDownList").value();
          params["sBpNm"] = parent.$("#sBpNm").val();
          params["sCarlineCd"] = parent.$("#sCarlineCd").val();
          params["sCarlineCd2"] = parent.$("#sCarlineCd2").val();
          params["sAbcInd"] = parent.$("#sAbcInd").val();
          params["sItemDstinCd"] = parent.$("#sItemDstinCd").val();
          params["sBrandCd"] = parent.$("#sBrandCd").val();

          /*params["sItemCd"] = parent.$("#sItemCd").val();
          params["sItemNm"] = parent.$("#sItemNm").val();
          params["sSpyrCd"] = parent.$("#sSpyrCd").val();
          params["sItemDstinCd"] = parent.$("#sItemDstinCd").val();
          params["sBrandCd"] = parent.$("#sBrandCd").val();

          if(parent.$("#sRegDt").val() == ""){
              params["sRegDt"] = null;
          }else{
              params["sRegDt"] = chgDate(parent.$("#sRegDt").val());
          }
          params["sCarlineCd"] = parent.$("#sCarlineCd").val();
          params["sCarlineCd2"] = parent.$("#sCarlineCd2").val();*/

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
                            itemCd:row.itemCd,
                            itemNm:row.itemNm,
                            spyrCd:row.spyrCd,
                            itemDstinCd:row.itemDstinCd,
                            bpTp:row.bpTp,
                            brandCd:row.brandCd,
                            bpNm:row.bpNm,
                            carlineCd:row.carlineCd,
                            modelCd:row.modelCd,
                            abcInd:row.abcInd
                            });
                      });

                      //console.log("list data : ", data);

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
        if($(item).find("span[name='_itemCd']").text() == itemCd){
             return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx-1]);
    listView.refresh();
}

//changeBrandCd Func
changeBrandCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.brandCdObj[val];
    }

    if(returnVal == undefined){
        returnVal = "";
    }
    return returnVal;
};
//거래처유형
changeBpTp = function(val){

    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        returnVal = parent.bpTpObj[val];
    }
    return returnVal;
};
//changeCarlineCd Func
changeCarlineCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.carlineCdObj[val] != undefined){
            returnVal = parent.carlineCdObj[val];
        }
    }
    return returnVal;
};
//changeAbcInd Func
changeAbcInd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.abcIndObj[val];
    }
    return returnVal;
};
changeSpyrCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.spyrCdMap[val];
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


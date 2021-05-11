<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view" id="itemListView" data-before-show="mainViewLoad">
  <ul  data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>



<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem">
            <span style="width:70%">#:vinNo #</span>
            <span style="width:30%">#:changeStockTpObj(stockTp) #</span>
            <span style="width:40%" class="clboth">#:cmpCarYn#/#:changeCmpCarDstinCdObj(cmpCarDstinCd) #</span>
            <span style="width:30%">#:changeStrgeCdObj(strgeCd) #</span>
            <span style="width:30%">#:bf_selectLoc(locCd, locNm) #</span>
        </div>
</script>

<script>


function mainViewLoad(){
    //parent.setCheckItemList();
}


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

      params["sCarlineCd"] = parent.mainSelObj.carlineCd;
      params["sModelCd"] = parent.mainSelObj.modelCd;
      params["sOcnCd"] = parent.mainSelObj.ocnCd;
      params["sExtColorCd"] = parent.mainSelObj.extColorCd;
      params["sIntColorCd"] = parent.mainSelObj.intColorCd;

      $.ajax({
          url:"<c:url value='/mob/sal/inv/stockState/selectStockStateSub.do' />"

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
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  //alert(rowTotal);
                  $.each(result.data , function(i , row){
                      rowIndex++;

                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          vinNo         :row.vinNo,
                          ncarDstinCd   :row.ncarDstinCd,
                          stockTp       :row.stockTp,
                          cmpCarYn      :row.cmpCarYn,
                          cmpCarDstinCd :row.cmpCarDstinCd,
                          strgeCd       :row.strgeCd,
                          locCd         :row.locCd,
                          locNm         :row.locNm,
                          bfStockTp     :row.bfStockTp,
                          bfCmpCarYn    :row.bfCmpCarYn,
                          bfCmpCarDstinCd:row.bfCmpCarDstinCd,
                          bfStrgeCd     :row.bfStrgeCd,
                          bfLocCd       :row.bfLocCd,
                          carlineCd     :row.carlineCd,
                          carlineNm     :row.carlineNm,
                          modelCd       :row.modelCd,
                          modelNm       :row.modelNm,
                          ocnCd         :row.ocnCd,
                          ocnNm         :row.ocnNm,
                          extColorCd    :row.extColorCd,
                          extColorNm    :row.extColorNm,
                          intColorCd    :row.intColorCd,
                          intColorNm    :row.intColorNm,
                          carStatCd     :row.carStatCd,
                          ownStatCd     :row.ownStatCd,
                          ordTp         :row.ordTp,
                          enginModelCd  :row.enginModelCd,
                          certNo        :row.certNo,
                          grDt          :chgDate2Str(row.grDt),
                          dlrCd         :row.dlrCd
                      });
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  /*
                  setTimeout(function(){
                      options.success(data);
                  }, 1000);
                  */

                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  parent.setSubListHeight("detailList",rowTotal);
                  parent.$("#content_DetailList").show();
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("detailList",0);
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
    parent.contentDetail(e.dataItem);
}
//차량상태
changeCarStatCdObj = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.carStatCdObj[val];
    }
    return returnVal;
};
//보유상태
changeOwnStatCdObj = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ownStatCdObj[val];
    }
    return returnVal;
};
//재고유형
changeStockTpObj = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.stockTpObj[val] != undefined)
            returnVal = parent.stockTpObj[val];

    }

    return returnVal;
};

//회사차구분
changeCmpCarDstinCdObj = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.cmpCarDstinCdObj[val] != undefined)
            returnVal = parent.cmpCarDstinCdObj[val];
    }
    return returnVal;

};


//창고
changeStrgeCdObj = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.strgeCdObj[val] != undefined)
            returnVal = parent.strgeCdObj[val];
    }
    return returnVal;

};

//위치 templeate 정의
bf_selectLoc = function(locCd, locNm){
    if(locNm != ""){
        return locNm;
    }
    if(locCd == ""){

        return "";
    }
    var returnVal = "";
    if(parent.locCdObj[locCd] != undefined)
        returnVal = parent.locCdObj[locCd];
    return returnVal;
};



var app = setKendoMobApp();
</script>

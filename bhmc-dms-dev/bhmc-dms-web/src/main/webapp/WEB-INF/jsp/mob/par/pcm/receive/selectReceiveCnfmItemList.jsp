﻿﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div class="checkitem">
            <span class="check">
                <input name="isSave" type="checkbox" class="f_check" name="check01"/><label for="check01"></label>
            </span>
            <span style="width:50%">#:trimNull(itemNm) #</span>
            <span style="width:50%">#:trimNull(invcQty) # (#:trimNull(invcUnitCd) #)</span>
            <span name="itemCd" class="clboth" style="width:50%">#:trimNull(itemCd) #</span>
            <span name="invcStatCd" style="width:50%" >#:changeInvcStatCd(invcStatCd) #</span>
            <input name="purcOrdNo" type="hidden" value=#:purcOrdNo # />
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

      //params["sInvcDocNo"] = parent.$("#sInvcDocNo").val();
      params["sBpCd"] = parent.$("#sBpCd").val();
      //params["sMobisInvcNo"] = parent.$("#mobisInvcNo").val();
      params["sMobisInvcNo"] = parent.$("#sMobisInvcNo").val();
      console.log("sMobisInvcNo="+parent.$("#sMobisInvcNo").val());


      $.ajax({
          //url:"<c:url value='/par/pcm/invc/selectInvcItemByKey.do' />"
          url:"<c:url value='/par/pcm/invc/selectReceiveItemByCondition.do' />"
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
                  rowTotal = result.data.length;
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
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          itemNm:row.itemNm,
                          itemCd:row.itemCd,
                          invcQty:row.invcQty,
                          invcUnitCd:row.invcUnitCd,
                          isSave:isSaveVal,

                          itemCd:row.itemCd,
                          itemNm:row.itemNm,
                          grQty:row.grQty,
                          invcStatCd:row.invcStatCd,
                          purcRegDt:row.purcRegDt,
                          purcOrdNo:row.purcOrdNo,
                          purcOrdLineNo:row.purcOrdLineNo,
                          purcOrdLineDetlNo:row.purcOrdLineDetlNo,
                          mobisInvcNo:row.mobisInvcNo,
                          mobisInvcLineNo:row.mobisInvcLineNo,
                          invcDocNo:row.invcDocNo,
                          invcDocLineNo:row.invcDocLineNo,
                          invcQty:row.invcQty,
                          purcQty:row.purcQty,
                          reqCont:row.reqCont,
                          grStrgeCd:row.grStrgeCd,
                          grStrgeNm:row.grStrgeNm,
                          grLocCd:row.grLocCd,
                          grLocNm:row.grLocNm,
                          invcPrc:row.invcPrc,
                          taxDdctPrc:row.taxDdctPrc,
                          invcAmt:row.invcAmt,
                          invcTotAmt:row.invcTotAmt,
                          invcTargetQty:row.invcTargetQty,
                          taxAmt:row.taxAmt,
                          dlPdcCd:row.dlPdcCd,
                          bpCd:row.bpCd,

                          bpTp:row.bpTp,
                          invcTp:row.invcTp,
                          arrvDt:row.arrvDt

                          // 0927 added
                          ,boxNo : row.boxNo
                          ,bmpOrdNo : row.bmpOrdNo
                          ,ordRegUsrId : row.ordRegUsrId
                          ,invcDt : row.invcDt
                          ,purcOrdTp : row.purcOrdTp
                          ,dcRate : row.dcRate

                      });
                  });
                  options.success(data);
                  sentDataToParent(data);
                  app.hideLoading();
                  setTimeout(function(){
                      parent.$("#barcode").focus();
                  }, 200);

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

changeInvcStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.invcStatMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(e)
{
    //parent.contentDetail2(e.dataItem.itemCd);
    //parent.saveList=[];
    parent.contentDetail2(e.dataItem.purcOrdNo, e.dataItem.itemCd);
    //parent.contentDetail3(e.dataItem.itemCd);
}

function sentDataToParent(obj)
{
    parent.getDataFromChild(obj);
}

var app = setKendoMobApp();
</script>

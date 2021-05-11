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
    <span style="width:50%">#:'['+carlineCd+']'##:carlineNm #</span>
    <span style="width:50%">#:extColorNm + "/" + intColorCd #</span>

    <span style="width:50%" class="clboth">#:ocnCd + "/" + modelNm #</span>
    <span style="width:50%">#:changeOrdTp(ordTp) #</span>

    <span style="width:50%" class="clboth">#:chgDate2Str(pdiDt) #</span>
    <span style="width:50%">#:trimNull(emont) #</span>

    <span style="width:50%" class="clboth">#:changeOrdStatCd(ordStatCd) #</span>
    <span style="width:50%">#:trimNull(kendo.toString(aamt, 'n2')) #</span>
</div>
</script>

<script>

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

          var srchTp = parent.$('input:radio[name=sRadio]:checked').val();

          //주문유형
          //params["sOrdTp"] = parent.$("#sOrderType").val();
          params["sOrdTpList"] = parent.$("#sOrderType").data("kendoExtMobileMultiSelectDropDownList").value();

          //주문상태
          params["sOrdStatCd"] = parent.$("#sOrdStat").val();

          if(srchTp == 'Y'){
           // 주문일자
              params["sOrdStartDtstr"] = parent.$("#sOrdStartDt").val().replace(/-/gi, "");
              params["sOrdEndDtstr"] = parent.$("#sOrdEndDt").val().replace(/-/gi, "");
          }else{
           // 심사평가월
              params["sConfirmDt"] = parent.$("#sEvalConfMth").val().replace(/-/gi, "");
          }

          // 차종
          params["sCarlineCd"] = parent.$("#sCarLine").val();
          // 모델
          params["sModelCd"] = parent.$("#hiddenFscCode").val();
          // OCN
          params["sOcnCd"] = parent.$("#sOcn").val();

          console.log("params",params);

          $.ajax({
              url:"<c:url value='/sal/orc/dlrOrderSearch/selectDlrOrderSearchs.do' />"
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
                      var count = 0;

                      rowTotal = result.total;
                      $.each(result.data , function(i , row){
                          console.log("row:::", row);
                          rowIndex++;
                          data.push({

                              pdiDt:row.pdiDt,
                              ordTp:row.ordTp,
                              carlineNm:row.carlineNm,
                              carlineCd:row.carlineCd,
                              ocnCd:row.ocnCd,
                              ocnNm:row.ocnNm,
                              extColorCd:row.extColorCd,
                              extColorNm:row.extColorNm,
                              intColorNm:row.intColorNm,
                              intColorCd:row.intColorCd,
                              mdpr:row.mdpr,
                              ordSeq:row.ordSeq,
                              modelNm:row.modelNm,
                              ordQty:row.ordQty,
                              ordStatCd:row.ordStatCd,
                              ordDate:row.ordDate,
                              chrgCd:row.chrgCd,
                              ordNo:row.ordNo,
                              vinmVloc:row.vinmVloc,
                              emont:row.emont,
                              vinDt:row.vinDt,
                              retailDt:row.retailDt,
                              dlrGrDt:row.dlrGrDt,
                              custSaleDt:row.custSaleDt,
                              vinNo:row.vinNo,
                              dcRate:row.dcRate,
                              damt:row.damt,
                              dcAmt:row.dcAmt,
                              misSetDt:row.misSetDt,
                              tranSetDt:row.tranSetDt,
                              aamt:row.aamt
                            });

                          count += row.ordQty;
                      });

                      parent.$("#totalSum").html(count)

                      options.success(data);
                      app.hideLoading();
                  }else{
                      parent.$("#totalSum").html(0)
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
    parent.contentDetail(e.dataItem);
}

changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ordTpObj[val];
    }
    return returnVal;
};

changeOrdStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ordStatCdObj[val];
    }
    return returnVal;
};

var app = setKendoMobApp();
</script>


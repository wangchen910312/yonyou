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
    <span style="width:34%">#:trimNull(contractNo) #</span>
    <span style="width:33%">#:trimNull(chgDate2Str(contractDt)) #</span>
    <span style="width:33%">#:trimNull(custNm) #</span>
    <span style="width:34%">#:trimNull("[" + carlineCd + "]" + carlineNm) #</span>
    <span style="width:33%">#:trimNull(fscNm) #</span>
    <span style="width:33%">#:getColor(extColorNm, intColorCd) #</span>
    <span style="width:100%">#:trimNull(contractStatNm) #</span>
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

          // 딜러코드
          params["sDlrCd"] = parent.dlrCd;
          // 판매사원
          params["sSaleEmpNo"] = parent.$("#sSalPrsnNm").data("kendoExtDropDownList").value();
          // 고객명
          params["sContractCustNm"] = parent.$("#sCustomerNm").val();
          //고객
          params["sContractCustNo"] = parent.$("#sCustomerId").val();
          // 계약상태
          params["sContractStatCd"] = parent.$("#sContractStat").data("kendoExtDropDownList").value();
          // 계약일자
          params["sStartContractDt"] = chgDate(parent.$("#sCtrStartDt").val());
          params["sEndContractDt"]   = chgDate(parent.$("#sCtrEndDt").val());
          // vin no
          params["sVinNo"] = parent.$("#sVinNum").val().toUpperCase();

          params["sContractNo"] = parent.$("#sContractNo").val();

          console.log("params:::",params);

          $.ajax({
              url:"<c:url value='/sal/cnt/contractProgress/selectContractProgressSearch.do' />"
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
                          rowIndex++;
                          console.log("row",row);
                          data.push({
                              contractNo:row.contractNo,
                              contractDt:row.contractDt,
                              custNm:row.custNm,
                              carlineNm:row.carlineNm,
                              modelNm:row.modelNm,
                              extColorNm:row.extColorNm,
                              intColorNm:row.intColorNm,
                              intColorCd:row.intColorCd,

                              dlrCd:row.dlrCd,
                              contractNo:row.contractNo,
                              carlineCd:row.carlineCd,

                              fscNm:row.fscNm,
                              fscCd:row.fscCd,

                              contractStatNm:row.contractStatNm

                            });

                          count = count + 1;
                      });

                      parent.$("#totalSum").html(count)

                      app.hideLoading();
                      options.success(data);

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


getColor = function(extColor, intColor){
    var returnVal = "";

    if(extColor != null && intColor != null){
        returnVal = extColor + "/" + intColor;
    }else{
        returnVal = "";
    }


    return returnVal;
};

getFsc = function(fscNm, fscCd){
    var returnVal = "";

    if(fscNm == " " || fscCd == " "){
        returnVal = "";
    }else{
        returnVal = "[" + fscCd + "]" + fscNm;
    }


    return returnVal;
};


function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();
</script>


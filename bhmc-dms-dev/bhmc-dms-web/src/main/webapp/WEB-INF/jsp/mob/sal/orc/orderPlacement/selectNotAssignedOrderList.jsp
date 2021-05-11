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
<div class="dlistitem bgNone">
    <span style="width:50%">[#:carlineCd #]#:carlineNm #</span>
    <span style="width:50%">#:extColorNm + " / " + intColorCd #</span>
    <span class="clboth" style="width:50%">#:ocnCd + " / " + modelNm #</span>
    <span style="width:50%">#:kendo.toString(mdpr, 'n2') #</span>
    <span class="clboth" style="width:50%">#:ordpCount #</span>
    <span style="width:50%">#:kendo.toString(aamt, 'n2') #</span>

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

          params["sOrdTp"]  = parent.$("#sOrderType").data("kendoExtDropDownList").value();
          params["sCarlineCd"]      = parent.$("#sCarLine").data("kendoExtDropDownList").value();
          params["sFscCd"] = parent.$("#sModelNm").data("kendoExtDropDownList").value();
          params["sOcnCd"] = parent.$("#sOcn").data("kendoExtDropDownList").value();
          params["sPaym"] = parent.$("#sMortgageTp").data("kendoExtDropDownList").value();

          var sOrdTp = parent.$("#sOrderType").data("kendoExtDropDownList").value();

          var sOrdStartDt = parent.$("#sOrdStartDt").val().replace(/-/gi,"");
          var sOrdEndDt = parent.$("#sOrdEndDt").val().replace(/-/gi,"");
          var sOrdPrid =  parent.$("#sOrderWeek").data("kendoExtDropDownList").value();

          if(sOrdTp == "N1"){
              params["sOrdPrid"] = sOrdPrid;
              params["sOrdStartDtStr"] = "";
              params["sOrdEndDtStr"] = "";
          }else{
              params["sOrdPrid"] = "";
              params["sOrdStartDtStr"] = sOrdStartDt;
              params["sOrdEndDtStr"] = sOrdEndDt;
          }




          console.log("mobile params",params);

          $.ajax({
              url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrder.do' />"
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
                      var aamt = 0;
                      var ordpCount = 0;

                      rowTotal = result.total;
                      $.each(result.data , function(i , row){
                          console.log("row:::",row);
                          rowIndex++;
                          data.push({
                              ordpCndy:row.ordpCndy,
                              sord:row.sord,
                              carlineCd:row.carlineCd,
                              carlineNm:row.carlineNm,
                              modelNm:row.modelNm,
                              extColorNm:row.extColorNm,
                              intColorNm:row.intColorNm,
                              mdpr:row.mdpr,
                              adjp:row.adjp,
                              aftMdpr:row.aftMdpr,
                              carlineCd:row.carlineCd,
                              chrgCd:row.chrgCd,
                              extColorCd:row.extColorCd,
                              inno:row.inno,
                              intColorCd:row.intColorCd,
                              modelCd:row.modelCd,
                              needsAmt:row.needsAmt,
                              ocnCd:row.ocnCd,
                              ocnNm:row.ocnNm,
                              ordpCount:row.ordpCount,
                              ordpExno:row.ordpExno,
                              ordpVapr:row.ordpVapr,
                              regDt:row.regDt,
                              regUsrId:row.regUsrId,
                              rnum:row.rnum,
                              saleRgstUsr:row.saleRgstUsr,
                              salesNo:row.salesNo,
                              updtDt:row.updtDt,
                              updtUsrId:row.updtUsrId,
                              damt:row.damt,
                              aamt:row.aamt,
                              aamt2:row.aamt,
                              paym:row.paym
                            });
                          if(row.aamt != null){
                              aamt += Number(row.aamt);
                          }

                          if(row.ordpCount != null){
                              ordpCount += Number(row.ordpCount);
                          }
                      });

                      parent.$("#ordReqTotAmt").val(aamt);

                      parent.$("#totalAmt").html(ordpCount + " / " + kendo.toString(aamt, 'n2'));
                      //parent.$("#totalSum").html(kendo.toString(aamt, 'n2'));
                      //parent.$("#div").html("/");

                      options.success(data);
                      app.hideLoading();

                      // 선수금 잔액 조회
                      $.ajax({
                          url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPreAmtSearch.do' />"
                          ,type:'POST'
                          ,dataType:'json'
                          ,contentType:'application/json'
                          ,error:function(jqXHR, status, error) {
                              dms.notification.error(jqXHR.responseJSON.errors);
                          }
                          ,success:function(jqXHR, textStatus) {
                              console.log("jqXHR",jqXHR);
                              parent.$("#preAmt").val(jqXHR.data[0].totBalAmt);
                              parent.$("#mortgageBalance").val(jqXHR.data[0].prt3BalAmt);
                              parent.$("#unMortgageBalance").val(jqXHR.data[0].prt2BalAmt+jqXHR.data[0].cashBalAmt);

                              setTimeout(function(){ getValue();}, 100);
                              //parent.$("#mortgageBalance").data("kendoExtNumericTextBox").value(jqXHR.data[0].prt3BalAmt);
                              //parent.$("#unMortgageBalance").data("kendoExtNumericTextBox").value(jqXHR.data[0].prt2BalAmt+jqXHR.data[0].cashBalAmt);

                          }
                      });
                      /*
                      var mainListHeight = parent.$("#mwrap").height() - parent.$("#content_list .content_title").height() - parent.$("#content_list .listhead").height()*5 - parent.$(".btnfixed").height() - parent.$("#content_list .formarea").height();
                      parent.$("#mainList").height(mainListHeight);

                      parent.$("#listarea").height(100);
                      */
                      var mainListHeight = parent._windowHeight - parent.$("#header").outerHeight() - parent.$("#content_list .content_title").outerHeight() -  parent.$("#content_list .co_group").outerHeight()*1 -10;
                      parent.$("#mainList").height(mainListHeight-120);
                      parent.$(".listarea").height(mainListHeight-45);

                  }else{
                      app.hideLoading();

                      parent.$("#ordReqTotAmt").val(kendo.toString(0,'n2'));
                      parent.$("#lackAmt").val(kendo.toString(0,'n2'));

                      // 선수금 잔액 조회
                      $.ajax({
                          url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPreAmtSearch.do' />"
                          ,type:'POST'
                          ,dataType:'json'
                          ,contentType:'application/json'
                          ,error:function(jqXHR, status, error) {
                              dms.notification.error(jqXHR.responseJSON.errors);
                          }
                          ,success:function(jqXHR, textStatus) {
                              console.log("jqXHR",jqXHR);
                              parent.$("#preAmt").val(jqXHR.data[0].totBalAmt);
                              parent.$("#preAmt").val(kendo.toString(Number(parent.$("#preAmt").val()),'n2'));
                              parent.$("#mortgageBalance").val(jqXHR.data[0].prt3BalAmt);
                              parent.$("#mortgageBalance").val(kendo.toString(Number(parent.$("#mortgageBalance").val()),'n2'));
                              parent.$("#unMortgageBalance").val(jqXHR.data[0].prt2BalAmt+jqXHR.data[0].cashBalAmt);
                              parent.$("#unMortgageBalance").val(kendo.toString(Number(parent.$("#unMortgageBalance").val()),'n2'));
                          }
                      });

                      parent.$("#totalAmt").html(kendo.toString(0, 'n2') + "/" + kendo.toString(0, 'n2') );
                      //parent.$("#totalSum").html(kendo.toString(0, 'n2'));
                      //parent.$("#div").html("/");
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

/* function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
} */

changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ordTpCdObj[val];
    }
    return returnVal;
};


function getValue(){

    if(Number(parent.$("#ordReqTotAmt").val()) <  Number(parent.$("#preAmt").val())){
        parent.$("#lackAmt").val(0);
        //parent.$("#lackAmt").val(Number(parent.$("#ordReqTotAmt").val()) - Number(parent.$("#preAmt").val()));
    }else{
        parent.$("#lackAmt").val( Number(parent.$("#preAmt").val()) - Number(parent.$("#ordReqTotAmt").val()) );
    }
    parent.$("#preAmt").val(kendo.toString(Number(parent.$("#preAmt").val()),'n2'));
    parent.$("#mortgageBalance").val(kendo.toString(Number(parent.$("#mortgageBalance").val()),'n2'));
    parent.$("#unMortgageBalance").val(kendo.toString(Number(parent.$("#unMortgageBalance").val()),'n2'));
    parent.$("#ordReqTotAmt").val(kendo.toString(Number(parent.$("#ordReqTotAmt").val()),'n2'));
    parent.$("#lackAmt").val(kendo.toString(Number(parent.$("#lackAmt").val()),'n2'));

}

var app = setKendoMobApp();
</script>


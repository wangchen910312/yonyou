<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="custSearchList" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem" id="listContentRow">
    <span style="width:60%">#:trimNull(vinNo)#</span><!-- VIN -->
    <span style="width:40%">#:bf_selectlockNm(data)#</span><!-- 종류 -->
    <span style="width:30%" class="clboth">#:dms.string.strNvl(chgCarStatObj(carStatCd))#</span><!--차량상태 -->
    <span style="width:30%">#:trimNull(dms.format.currency(msPrc))#</span><!-- 지도가 -->
    <span style="width:40%">#:trimNull(mmCnt)#</span><!-- 재고월령 -->
    <span style="width:30%" class="clboth">#:trimNull(carlineNm)#</span><!-- 차종 -->
    <span style="width:70%">#:trimNull(modelNm)#</span><!-- 차관 -->
</div>
</script>
<!-- <span style="width:50%">#:trimNull(ocnNm)#</span>OCN
     <span style="width:50%" class="clboth">#:trimNull(extColorNm)#</span>와장색
    <span style="width:50%">#:trimNull(intColorNm)#</span>내장색  -->

<script>
//시스템 날짜 정보 가져오기.
/* var chgBuyYnMap ={};

chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />"; */
var sysDate = new Date("<c:out value='${sysDate}' />");
var membershipStan = "<c:out value='${policy}' />";

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

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = null;

      params["sDlrCd"]      = parent.$("#sDlrCd").val();
      params["sCarlineCd"]  = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      params["sModelCd"]    = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      params["sOcnCd"]      = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();
      params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value();
      //params["sVinNo1"]     = $("#sVinNo1").val().toUpperCase();
      //params["sVinNo2"]     = $("#sVinNo2").val();
      params["sVinNo"]      = parent.$("#sVinNo").val();

      parent.$("#content_pop_list").css("display","block");

      $.ajax({
          url:"<c:url value='/sal/cnt/contractRe/selectContractReVinNoSearch.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_pop",result.total,noDatamsg);

              if(result.data!=null){
                      //if(rowIndex>11) return false;

                  options.success(result.data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");

                  app.hideLoading();
                  //dms.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  app.hideLoading();
              }
          }
          /* ,dataBound:function(e) {
              var gridDataSource = result.data;
              parent.$("#btnSelect").click();
          } */
      });
    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(data) { return data.length; }
  }
});


changeCustTp = function(val){

    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.custTpMap[val];
    }
    return returnVal;
};



function listViewClick(e)
{
    var dataItem = e.dataItem;
    //mob.loading.show();
    var curRow = e.dataItem.rowIdx - 1;
    $('.dlistitem').each(function(i){
        //$('#listContentRow .dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });

    parent.contentCommonDetail(dataItem);
    parent.$("#btnSelect").click();

}

chgCarStatObj = function(val){
    var returnVal = "";

    if(val != null && val != ""){
        if(parent.carStatObj != undefined)
        returnVal = parent.carStatObj[val];
    }
    return returnVal;
}

chgSexCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.sexCdMap != undefined)
        returnVal = parent.sexCdMap[val];
    }
    return returnVal;
}

//Lock종류
function bf_selectlockNm(obj){
    var str = "";

    //재고
    if(dms.string.strNvl(obj.blockYn) == "Y"
       || dms.string.strNvl(obj.blockSaleAdvNo) != ""){
        str += "<spring:message code='sal.lbl.stock' />";
    }
    //손상
    if(dms.string.strNvl(obj.damageCd) == "01"){
        str += str.length>0 ? ", <spring:message code='global.lbl.damageStock' />" : "<spring:message code='global.lbl.damageStock' />";
    }
    //계약
    if(dms.string.strNvl(obj.ownStatCd) == "A"
       || dms.string.strNvl(obj.expAprYn) == "Y"
    ){
        str += str.length>0 ? ", <spring:message code='global.lbl.contract' />" : "<spring:message code='global.lbl.contract' />"
    }
    return str;
}


var app = setKendoMobApp();

</script>

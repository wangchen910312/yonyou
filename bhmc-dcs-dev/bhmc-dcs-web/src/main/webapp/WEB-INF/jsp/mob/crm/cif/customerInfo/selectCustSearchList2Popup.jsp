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
<div class="dlistitem" id="listContentRow">
    <span style="width:20%">#:vinNo #</span>
    <span style="width:20%">#:carRegNo #</span>
    <span style="width:20%">#:carOwnerNm #</span>
    <span style="width:20%">#:carOwnerTelNo #</span>
    <span style="width:20%">#:carOwnerHpNo #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
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

      var parentUrl = parent.document.location.href;
      if(parentUrl.indexOf("/mob/crm/cif/customerInfo/selectCustomerInfoMain.do") > -1){

          params["sVinNo"] = parent.$("#csVinNo").val();
          params["sCarNo"] = parent.$("#csCarNo").val();
          params["sCustNm"] = parent.$("#csCustNm").val();

      }else{
          params["sVinNo"] = parent.$("#sVinNo").val();
          params["sCarNo"] = parent.$("#sCarNo").val();
          params["sCustNm"] = parent.$("#sCustNm").val();
      }


      parent.$("#content_pop_list2").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //dms.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex
                          ,rowIdx           :rowIndex
                          ,dlrCd            :row.dlrCd
                          ,carId            :row.carId
                          ,vinNo            :row.vinNo
                          ,vinNo1           :row.vinNo1
                          ,vinNo2           :row.vinNo2
                          ,carlineCd        :row.carlineCd
                          ,modelCd          :row.modelCd
                          ,modelNm          :row.modelNm
                          ,ocnCd            :row.ocnCd
                          ,extColorCd       :row.extColorCd
                          ,extColorNm       :row.extColorNm
                          ,carStatCd        :row.carStatCd
                          ,ownStatCd        :row.ownStatCd
                          ,carDstinCd       :row.carDstinCd
                          ,grDt             :row.grDt
                          ,carRegNo         :row.carRegNo
                          ,grteStartDt      :row.grteStartDt
                          ,grteEndDt        :row.grteEndDt
                          ,grteStdCd        :row.grteStdCd
                          ,delYn            :row.delYn
                          ,carRegDt         :row.carRegDt
                          ,corpCarDstinCd   :row.corpCarDstinCd
                          ,mcarCd           :row.mcarCd
                          ,pltGiDt          :row.pltGiDt
                          ,makerCd          :row.makerCd
                          ,enginNo          :row.enginNo
                          ,signOffDt        :row.signOffDt
                          ,cmpCd            :row.cmpCd
                          ,custSaleDt       :row.custSaleDt
                          ,custSaleCancDt   :row.custSaleCancDt
                          ,statCd           :row.statCd
                          ,carNm            :row.carNm
                          ,cmpCarYn         :row.cmpCarYn
                          ,cmpCarDstinCd    :row.cmpCarDstinCd
                          ,carRunDistVal    :row.carRunDistVal
                          ,tecId            :row.tecId
                          ,carBrandCd       :row.carBrandCd
                          ,carBrandNm       :row.carBrandNm
                          ,driverId         :row.driverId
                          ,driverNm         :row.driverNm
                          ,ssnCrnNo         :row.ssnCrnNo
                          ,mathDocTp        :row.mathDocTp
                          ,driverTelNo      :row.driverTelNo
                          ,driverHpNo       :row.driverHpNo
                          ,driverZipCd      :row.driverZipCd
                          ,driverAddr       :row.driverAddr
                          ,driverMailNm     :row.driverMailNm
                          ,prefContactMthCd :row.prefContactMthCd
                          ,prefContactTimeCd:row.prefContactTimeCd
                          ,carOwnerId       :row.carOwnerId
                          ,carOwnerNm       :row.carOwnerNm
                          ,carOwnerTelNo    :row.carOwnerTelNo
                          ,carOwnerHpNo     :row.carOwnerHpNo
                          ,carOwnerZipCd    :row.carOwnerZipCd
                          ,carOwnerAddr     :row.carOwnerAddr
                          ,carOwnerMailNm   :row.carOwnerMailNm
                          ,incNo            :row.incNo
                          ,befIncNo         :row.befIncNo
                          ,incCorpCd        :row.incCorpCd
                          ,incCarNo         :row.incCarNo
                          ,incCarNoRegDt    :row.incCarNoRegDt
                          ,incEndDt         :row.incEndDt
                          ,ltsModelCd       :row.ltsModelCd
                          ,ltsModelNm       :row.ltsModelNm
                          ,custNo           :row.custNo
                          ,salPrsnNm        :row.salPrsnNm
                          ,samPoEndDt       :row.samPoEndDt
                          ,scheChkDt        :row.scheChkDt
                          ,ordDlrCd         :row.ordDlrCd
                          ,scheChkDist      :row.scheChkDist
                          ,carIfNm          :row.carIfNm
                          ,orgCd            :row.orgCd
                          ,carChar          :row.carChar
                          ,chaDrivDis       :row.chaDrivDis
                          ,custTag          :row.custTag
                          ,custTp           :row.custTp
                          ,bmMembNo         :row.bmMembNo
                          ,membNo           :row.membNo
                          ,cotcEndDt        :row.cotcEndDt
                          ,txtLbrDcRate     :row.txtLbrDcRate
                          ,txtParDcRate     :row.txtParDcRate
                          ,preBalAmt        :row.preBalAmt
                          ,preBalBalc       :row.preBalBalc
                          ,custLvl          :row.custLvl
                          ,preFixId         :row.preFixId
                          ,pdiYn            :row.pdiYn
                          ,carOwnerSeq      :row.carOwnerSeq
                          ,driverSeq        :row.driverSeq
                      });
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //dms.notification.success("<spring:message code='global.info.success'/>");
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
      total:function(data) { return data.length; }
  }
});


function listViewClick(e)
{
    var dataItem = e.dataItem;
    var parentUrl = parent.document.location.href;
    if(parentUrl.indexOf("/mob/crm/cif/customerInfo/selectCustomerInfoMain.do") > -1){

        parent.contentDetail(e.dataItem);

    }else{
        parent.contentCommonDetail2(e.dataItem);

        var curRow = e.dataItem.rowIdx - 1;
        $('.dlistitem').each(function(i){
            if(i == curRow){
                $(this).addClass("liston"); // 리스트 선택시 class추가
            } else {
                $(this).removeClass("liston"); // 리스트  해제시 class제거
            }
        });
    }
}

var app = setKendoMobApp();

</script>

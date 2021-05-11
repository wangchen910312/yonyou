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
    <span style="width:40%">#:custNm #(#:changeCustTp(custTp)#)</span>
    <span style="width:60%">#:custNo #</span>
    <span style="width:40%"  class="clboth">#:trimNull(hpNo) #</span>
    <span style="width:30%">#:trimNull(telNo) #</span>
    <span style="width:30%">#:bhmcYn #</span>
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
          params["sCustNm"] = parent.$("#psCustNm").val();
          params["sCustTp"] = parent.$("#psCustTp").data("kendoExtDropDownList").value();
          params["sHpNo"] = parent.$("#psHpNo").val();
          params["sSexCd"] = parent.$("#psSexCd").data("kendoExtDropDownList").value();
          params["sTelNo"] = parent.$("#psTelNo").val();
          if (parent.$("#psBhmcYn").prop("checked")){
              params["sBhmcYn"] = "Y";
          }

          params["sRegDtFrom"] = new Date(parent.$("#psRegDtFrom").val());
          params["sRegDtTo"] = new Date(parent.$("#psRegDtTo").val());

      }else{
          params["sCustNm"]               =  parent.$("#custNm").val();
          params["sCustTp"]               =  parent.$("#custTp").data("kendoExtDropDownList").value("");;
          params["sHpNo"]                 =  parent.$("#hpNo").val();
          params["sSexCd"]                =  parent.$("#sexCd").data("kendoExtDropDownList").value("");;
          params["sTelNo"]                =  parent.$("#telNo").val();
          if (parent.$("#bhmcYn").prop("checked")){
              params["sBhmcYn"] = "Y";
          }
          params["sRegDtFrom"]            =  new Date(parent.$("#regDtFrom").val());
          params["sRegDtTo"]              =  new Date(parent.$("#regDtTo").val());
      }

      parent.$("#content_pop_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/crm/cif/customerInfo/customerListSearch.do' />"
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
                          , rowIdx:rowIndex
                          , dlrCd:row.dlrCd , pltCd:row.pltCd
                          , custNo:row.custNo , custNm:row.custNm , custCd:row.custCd , ssnCrnNo:row.ssnCrnNo
                          , custTp:row.custTp , mngScId:row.mngScId , mngScNm:row.mngScNm , saleScId:row.saleScId
                          , mngTecId:row.mngTecId , mngTecNm:row.mngTecNm , emailNm:row.emailNm , emailDomainNm:row.emailDomainNm
                          , wechatId:row.wechatId , qqId:row.qqId , facebookId:row.facebookId
                          , twitterId:row.twitterId , prefCommMthCd:row.prefCommMthCd , prefCommNo:row.prefCommNo
                          , prefContactMthCd:row.prefContactMthCd , prefContactTimeCd:row.prefContactTimeCd
                          , blueMemberCd:row.blueMemberCd , telNo:row.telNo , hpNo:row.hpNo , zipCd:row.zipCd
                          , sungCd:row.sungCd , sungNm:row.sungNm , cityCd:row.cityCd , cityNm:row.cityNm
                          , regionCd:row.regionCd , distNm:row.distNm , addr1:row.addr1 , addr2:row.addr2
                          , addrDetlCont:row.addrDetlCont , jobCd:row.jobCd , jobDetlCd:row.jobDetlCd , officeNm:row.officeNm
                          , deptNm:row.deptNm , psitNm:row.psitNm , officeTelNo:row.officeTelNo
                          , officeFaxNo:row.officeFaxNo , officeZipCd:row.officeZipCd , officeSungCd:row.officeSungCd
                          , officeCityCd:row.officeCityCd , officeRegionCd:row.officeRegionCd , officeAddr1:row.officeAddr1
                          , officeAddr2:row.officeAddr2 , bizcondCd:row.bizcondCd , bizcondNm:row.bizcondNm
                          , biztpNm:row.biztpNm , ownRgstSsnNo:row.ownRgstSsnNo , ownRgstNm:row.ownRgstNm
                          , cmpTp:row.cmpTp , cmpScaleCont:row.cmpScaleCont , mathDocTp:row.mathDocTp , idCardNo:row.idCardNo
                          , drivingNo:row.drivingNo , officeNo:row.officeNo , otherNo:row.otherNo
                          , idZipCd:row.idZipCd , idSungCd:row.idSungCd , idCityCd:row.idCityCd , idRegionCd:row.idRegionCd
                          , idAddr1:row.idAddr1 , idAddr2:row.idAddr2 , dmPlaceCd:row.dmPlaceCd , dmNm:row.dmNm
                          , smsReceiveYn:row.smsReceiveYn , telReceiveYn:row.telReceiveYn , dmDeceiveYn:row.dmDeceiveYn
                          , emailReceiveYn:row.emailReceiveYn , faxReceiveYn:row.faxReceiveYn
                          , dmReturnYn:row.dmReturnYn , emailReturnYn:row.emailReturnYn , giYn:row.giYn , disuseYn:row.disuseYn
                          , vipYn:row.vipYn , disuseCd:row.disuseCd , corpRegNo:row.corpRegNo
                          , custGradeCd:row.custGradeCd , custSerMngGradeCd:row.custSerMngGradeCd , mngTp:row.mngTp
                          , mngTpChgDt:row.mngTpChgDt , custHoldTp:row.custHoldTp , custHoldTpDtl:row.custHoldTpDtl
                          , custHoldDt:row.custHoldDt , sexCd:row.sexCd , birthDt:row.birthDt , marryDt:row.marryDt
                          , marryCd:row.marryCd , intrCarlineNm1:row.intrCarlineNm1 , intrCarlineNm2:row.intrCarlineNm2
                          , hobbyCd:row.hobbyCd , otherHobbyNm:row.otherHobbyNm , ocmpIntrCarlineNm:row.ocmpIntrCarlineNm
                          , befMngScId:row.befMngScId , eventNo:row.eventNo , pcontactNm:row.pcontactNm
                          , pcontactCustNo:row.pcontactCustNo , perInfoAgreeYn:row.perInfoAgreeYn
                          , perInfoUseYn:row.perInfoUseYn , nameChkYn:row.nameChkYn , invoiceEmailNm:row.invoiceEmailNm
                          , acCareerCd:row.acCareerCd , incomeLvlCd:row.incomeLvlCd , ageCd:row.ageCd , familyCnt:row.familyCnt
                          , driverTp:row.driverTp , introCnt:row.introCnt , purcReasonCd:row.purcReasonCd
                          , regCarBrandCd:row.regCarBrandCd , regCarBrandModelCd:row.regCarBrandModelCd
                          , befOwnerSellChnCd:row.befOwnerSellChnCd , befOwnerHoldPrid:row.befOwnerHoldPrid
                          , carPurcClassCd:row.carPurcClassCd , pintroTp:row.pintroTp , pintroNm:row.pintroNm
                          , emailDomainCd:row.emailDomainCd , compareCarBrandCd:row.compareCarBrandCd
                          , compareCarModelCd:row.compareCarModelCd , purcBefCarBrandCd:row.purcBefCarBrandCd
                          , purcBefCarModelCd:row.purcBefCarModelCd , mergeYn:row.mergeYn , delYn:row.delYn
                          , bhmcYn:row.bhmcYn , siebelRowId:row.siebelRowId , regUsrId:row.regUsrId , regUsrNm:row.regUsrNm
                          , regDt:row.regDt , updtUsrId:row.updtUsrId , updtDt:row.updtDt , itemCd:row.itemCd
                          , itemNm:row.itemNm , pconTp:row.pconTp , certiNum:row.certiNum , pageMode:row.pageMode
                          , regionCdRead:row.regionCdRead , officeRegionCdRead:row.officeRegionCdRead
                          , idRegionCdRead:row.idRegionCdRead , marryYn:row.marryYn , avgCarChgCd:row.avgCarChgCd
                          , groupTxt:row.groupTxt , tagTxt:row.tagTxt , dmReceiveYn:row.dmReceiveYn , oldCustNm:row.oldCustNm
                          , oldHpNo:row.oldHpNo , oldMathDocTp:row.oldMathDocTp , oldSsnCrnNo:row.oldSsnCrnNo
                          , passportNo:row.passportNo , custRelSeq:row.custRelSeq , hpNoInvldYn:row.hpNoInvldYn
                          , hpNoAddImposYn:row.hpNoAddImposYn , buyCnt:row.buyCnt , chgBuyYn:row.chgBuyYn
                          , purcCarBrandCd:row.purcCarBrandCd , purcCarModelNm:row.purcCarModelNm , ageDtl:row.ageDtl
                          , chinaZodiacSignCd:row.chinaZodiacSignCd , zodiacSignCd:row.zodiacSignCd , bloodTp:row.bloodTp
                          , childrenCnt:row.childrenCnt , dutyCd:row.dutyCd , commandTp:row.commandTp
                          , docId:row.docId , preVsitDt:row.preVsitDt , preActiveDt:row.preActiveDt , preTdrvDt:row.preTdrvDt
                          , saleOpptStepCd:row.saleOpptStepCd , groupDS:row.groupDS , tagDS:row.tagDS
                          , hobbyDS:row.hobbyDS , custInfoDS:row.custInfoDS , addressDS:row.addressDS , bhmcYnC:row.bhmcYnC
                          , custTpC:row.custTpC , custNmC:row.custNmC , custNoC:row.custNoC , custCdC:row.custCdC
                          , mathDocTpC:row.mathDocTpC , ssnCrnNoC:row.ssnCrnNoC , mngScIdC:row.mngScIdC
                          , mngTecIdC:row.mngTecIdC , custHoldTpC:row.custHoldTpC , custHoldTpDtlC:row.custHoldTpDtlC
                          , officeTelNoC:row.officeTelNoC , officeFaxNoC:row.officeFaxNoC , emailNmC:row.emailNmC
                          , bizcondCdC:row.bizcondCdC , cmpScaleContC:row.cmpScaleContC , cmpTpC:row.cmpTpC
                          , siebelRowIdC:row.siebelRowIdC , addrFull:row.addrFull

                      });
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  parent.setMainListHeight();
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

    var parentUrl = parent.document.location.href;
    if(parentUrl.indexOf("/mob/crm/cif/customerInfo/selectCustomerInfoMain.do") > -1){
        //고객정보관리 메뉴에서 호출시와 구분

        parent.contentDetail(e.dataItem);

    }else{

        parent.contentCommonDetail(e.dataItem);

        var curRow = e.dataItem.rowIdx - 1;
        $('.dlistitem').each(function(i){
            //$('#listContentRow .dlistitem').each(function(i){

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

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:55%">#:selectContractStatCdList(trimNull(contractStatCd)) #</span>
    <span style="width:45%">#:chgServerDate2Str(goodsContractDt) #</span>
    <span class="clboth" style="width:55%">#:selectGoodsTpList(trimNull(goodsTp)) #</span>
    <span style="width:45%">#:trimNull(carlineNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(goodsContractNo) #</span>
    <span class="clboth" style="width:100%">#:trimNull(goodsNm) #</span>
    <span class="clboth" style="width:55%">#:trimNull(goodsCnt) #</span>
    <span style="width:45%">#:trimNull(saleContractNo) #</span>
    <span class="clboth" style="width:55%">#:trimNull(vinNo) #</span>
    <span style="width:45%">#:trimNull(telNo) #</span>
    <span class="clboth" style="width:55%">#:trimNull(carRegNo) #</span>
    <span style="width:45%">#:chgServerDate2Str(expcGiEndDt) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var data = [];
// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSales.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {

              var params = {};

              params["recordCountPerPage"] = options.pageSize;
              params["pageIndex"] = options.page;
              params["firstIndex"] = options.skip;
              params["lastIndex"] = options.skip + options.take;
              params["sort"] = options.sort;

              params["sDlrCd"] = parent.$("#dlrCd").val();
              params["sContractCustNo"]  = parent.$("#custNo").val();

              return kendo.stringify(params);

          }
      }
  }
  ,batch:true
  ,pageSize:pageSize
  ,serverPaging:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"rnum"
          ,fields:{
              rnum:{type:"string", validation:{required:true}, editable:false}
              ,contractStatCd:{type:"string", validation:{required:true}, editable:false}           //용품상태
              ,goodsContractDt:{type:"date", validation:{required:true}, editable:false}            //오더일자
              ,goodsTp:{type:"string", validation:{required:true}, editable:false}                  //용품업무유형
              ,contractCustNm:{type:"string", validation:{required:false}, editable:false}           //고객명
              ,carlineNm:{type:"string", validation:{required:true}, editable:false}                //차종
              ,goodsContractNo:{type:"string", validation:{required:true}, editable:false}          //용품판매문서번호
              ,goodsNm:{type:"string", validation:{required:true}, editable:false}                  //용품명칭
              ,goodsCnt:{type:"number", validation:{required:true}, editable:false}                 //용품수
              ,saleContractNo:{type:"string", validation:{required:true}, editable:false}           //계약번호
              ,vinNo:{type:"string", validation:{required:true}, editable:false}                    //VIN
              ,telNo:{type:"string", validation:{required:true}, editable:false}                    //전화번호
              ,carRegNo:{type:"string", validation:{required:true}, editable:false}                 //차량번호
              ,expcGiEndDt:{type:"date", validation:{required:true}, editable:false}                //예정출고일자
              ,updtDtStr:{type:"string", validation:{required:false}, editable:false}                  //수정일시


              /* ,goodsTp:{type:"string", validation:{required:true}, editable:false}            //업무유형
              ,contractCustNm:{type:"string", validation:{required:true}, editable:false}    //고객명
              ,carlineCd:{type:"string", validation:{required:true}, editable:false}          //차종
              ,goodsContractNo:{type:"string", validation:{required:true}, editable:false}    //용품계약번호
              ,goodsNm:{type:"string", validation:{required:true}, editable:false}            //용품명칭
              ,goodsCnt:{type:"number", validation:{required:true}, editable:false}           //용품수
              ,saleContractNo:{type:"string", validation:{required:true}, editable:false}    //계약번호
              ,telNo:{type:"string", validation:{required:true}, editable:false}              //고객전화번호
              ,vinNo:{type:"string", validation:{required:true}, editable:false}              //vinNo
              ,goodsContractDt:{type:"date", validation:{required:true}, editable:false}      //오더일자
              ,updtDtStr:{ type:"string", validation:{required:true}, editable:false} */
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("blueMbrShipList", rTotal, "Y");
          parent.setSubListHeightNew("accessoryList",4,rTotal);
      }else{
          //parent.setSubListHeight2("blueMbrShipList", 0, "Y");
          parent.setSubListHeightNew("accessoryList",4,0);
      }
      }, 200);

      checklistCnt("accessoryList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

selectGoodsTpList = function(goodsTp) {
    var goodsTpNm = "";
    if(!dms.string.isEmpty(parent.goodsTpMap[goodsTp])){
        goodsTpNm = parent.goodsTpMap[goodsTp];
    }
    return goodsTpNm;
}

selectContractStatCdList = function(contractStatCd) {
    var contractStatCdNm = "";
    if(!dms.string.isEmpty(parent.contractStatCdMap[contractStatCd])){
        contractStatCdNm = parent.contractStatCdMap[contractStatCd];
    }
    return contractStatCdNm;
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

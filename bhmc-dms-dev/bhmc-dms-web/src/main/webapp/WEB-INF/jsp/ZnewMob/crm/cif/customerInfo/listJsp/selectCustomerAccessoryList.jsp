<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='sal.title.accessoryCondition' /><!-- 용품정보 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnAccessorySearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="deleteitem listhead">
            <span style="width:50%"><spring:message code='sal.lbl.goodStat'/><!-- 용품주문상태 --></span>
            <span style="width:50%"><spring:message code='sal.lbl.orderDate' /><!-- 오더일자 --></span>
            <span class="clboth" style="width:50%"><spring:message code='sal.lbl.goodsTp' /><!-- 용품업무유형 --></span>
            <span style="width:50%"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
            <span class="clboth" style="width:100%"><spring:message code='sal.lbl.goodsContractNo' /><!-- 용품판매문서번호 --></span>
            <span class="clboth" style="width:100%"><spring:message code='sal.lbl.goodsNm' /><!-- 용품명칭 --></span>
            <span class="clboth" style="width:50%"><spring:message code='sal.lbl.goodsCnt' /><!-- 용품수 --></span>
            <span style="width:50%"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></span>
            <span class="clboth" style="width:50%"><spring:message code='sal.lbl.carVinNo' /><!-- VIN NO --></span>
            <span style="width:50%"><spring:message code='sal.lbl.telNo' /><!-- 전화번호 --></span>
            <span class="clboth" style="width:50%"><spring:message code='global.lbl.carNo' /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code='sal.lbl.expcGiEndDt' /><!-- 예정출고일자 --></span>
        </div>
        <div>
            <div id="subListView12" style="height:200px; overflow:scroll;"></div>
        </div>

    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate12">
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

var data = [];
// datasource below is customized for demo purposes.
var subListData12 = new kendo.data.DataSource({
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
              params["sDlrCd"] = $("#dlrCd").val();
              params["sContractCustNo"]  = $("#custNo").val();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
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
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView12").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("accessoryList",4,rTotal);
      }else{
          setSubListHeightNew("accessoryList",4,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

selectGoodsTpList = function(goodsTp) {
    var goodsTpNm = "";
    if(!dms.string.isEmpty(goodsTpMap[goodsTp])){
        goodsTpNm = goodsTpMap[goodsTp];
    }
    return goodsTpNm;
};

selectContractStatCdList = function(contractStatCd) {
    var contractStatCdNm = "";
    if(!dms.string.isEmpty(contractStatCdMap[contractStatCd])){
        contractStatCdNm = contractStatCdMap[contractStatCd];
    }
    return contractStatCdNm;
};

$(document).ready(function(){
    $("#subListView12").kendoListView({
        dataSource:subListData12
        ,template:kendo.template($("#subTemplate12").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView12").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView12").css({"background-image":"none"});
            }
        }
    });
});

</script>

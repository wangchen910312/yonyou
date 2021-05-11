<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="par.title.purcOrdInfo" /><!-- 구매오더 등록정보 --></h2>
    </div>
    <div class="co_view">
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:30%"><spring:message code='par.lbl.itemCd'/><!-- 부품번호 --></span>
            <span style="width:70%"><spring:message code='par.lbl.itemNm'/><!-- 부품명 --></span>

            <span class="clboth" style="width:30%"><spring:message code='par.lbl.purcQty'/><!-- 구매수량 --></span>
            <span style="width:50%"><spring:message code='par.lbl.purcPriceAddTax' /><!-- 구매단가(세금포함) --></span>

            <span style="width:20%"><spring:message code='global.lbl.total' /><!-- 합계 --></span>
        </div>
        <div id="subListView" style="height:200px; overflow:scroll;"></div>
    </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
<div class="dlistitem" onclick="subListViewClick(subListData._view[#:rnum-1 #]);">
    <span style="width:30%">#:trimNull(itemCd) #</span>
    <span style="width:70%">#:trimNull(itemNm) #</span>

    <span style="width:30%">#:trimNull(purcQty) #</span>
    <span style="width:50%">#:trimNull(kendo.toString(purcPrc,'n2')) #</span>

    <span style="width:20%">#:trimNull(kendo.toString(getTotalPriceOfItem(purcQty,purcPrc), 'n2')) #</span>
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

var detailData;
var subViewRow = 10;
var subPageIndex=0, subPageSize = subViewRow, subRowTotal = 0;
var subTempData=[];
// datasource below is customized for demo purposes.
var subListData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do' />"
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["firstIndex"]              = subPageIndex;
              params["lastIndex"]         = subPageSize;
              params["sBpCd"]              = selectedBpCd;
              params["sPurcOrdNo"]         = selectedPurcOrdNoFromOrdList;
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  //,pageSize:pageSize
  ,change :function(e){
      subRowTotal=this._total;
      if(subRowTotal == 0){
          subTempData=[];
          subListData._view=subTempData;
      }else{
          subTempData.push.apply(subTempData, this._data);
          subListData._view=subTempData;
      }
  }
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"seq"
           ,fields:{
              rnum:{type:"number"}
          }
      }
  }
});

getTotalPriceOfItem = function(qty, prc){
    var totalPrice=0.00;
    totalPrice = parseFloat(qty)*parseFloat(prc);
    return totalPrice;
};

function subListViewClick(dataItem){
    subTempData=[];
    subPageIndex = 0,subRowTotal = 0;
    subPageSize = subViewRow;
    moveStatusDetail(dataItem);
}

$(document).ready(function(){
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template:kendo.template($("#subTemplate").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });

    $("#subListView").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && subRowTotal>subPageSize){
            subPageSize+=subViewRow;
            subPageIndex+=subViewRow;
            $(this).data('kendoListView').dataSource.read();
        }
    });
});
</script>

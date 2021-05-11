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
<div class="dlistitem">
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

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;
var detailData;
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
      params["sort"] = null;

      params["sBpCd"]              = parent.$("#sBpCd").val();
      params["sPurcOrdNo"]         = parent.selectedPurcOrdNoFromOrdList;

      if( parent.selectedPurcOrdNoFromOrdList != null && parent.selectedPurcOrdNoFromOrdList != 'undefined'){
          $.ajax({
            url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do' />",
            data:JSON.stringify(params),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            },
            success:function(result) {
                checklistCnt("listarea_noData",result.total,noDatamsg);
                if(result.data!=null && result.data != ""){
                    var data = [];
                    rowTotal = result.total;
                    $.each(result.data , function(i , row){
                        rowIndex++;
                        data.push({
                            pageIdx:pageIndex,
                            rowIdx:rowIndex,
                            purcOrdTp:row.purcOrdTp,      //오더유형
                            purcOrdNo:row.purcOrdNo,      //오더번호
                            bmpOrdNo:row.bmpOrdNo,       //BMP오더번호
                            bpNm:row.bpNm,           //업체
                            itemNm:row.itemNm,         //품명
                            itemCd:row.itemCd,         //부품번호
                            purcQty:row.purcQty,        //신청구매수량
                            confirmQty:row.confirmQty,     //확정구매수량
                            purcPrc:row.purcPrc,        //단가(세금포함)
                            editCd:row.editCd,         //편수코드
                            boQty:row.boQty,          //BO수량
                            odrAlcQt:row.odrAlcQt,       //할당수량
                            odrOpicQt:row.odrOpicQt,      //피킹중수량
                            odrOpacQt:row.odrOpacQt,      //포장중수량
                            odrPakdQt:row.odrPakdQt,      //포장완료수량
                            odrInvQt:row.odrInvQt,       //인보이스수량
                            mobisInvcNo:row.mobisInvcNo,    //송장번호
                            boxNo:row.boxNo,          //BOX번호
                            trsfTp:row.trsfTp,         //운송유형
                            trsfUsrId:row.trsfUsrId,      //운송인
                            invcDt:row.invcDt,         //발송일자
                            arrvDt:row.arrvDt,         //도착예정일자
                            purcOrdLineNo:row.purcOrdLineNo,  //구매오더라인번호
                            purcPgssCd:row.purcPgssCd      //상태
                         });
                    });
                    options.success(data);
                    app.hideLoading();
                    //parent.setSubListHeightNew("subList1",3,rowTotal);
                }else{
                    app.hideLoading();
                    //parent.setSubListHeightNew("subList1",3,0);
                }
            }
        });


     }

    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(){ return rowTotal; }
  }
});

getTotalPriceOfItem = function(qty, prc){
    var totalPrice=0.00;
    totalPrice = parseFloat(qty)*parseFloat(prc);
    return totalPrice;
};

/* function listViewClick(e){
    parent.contentDetail(e.dataItem.purcOrdNo);
} */

function listViewClick(e){
    var Item = e.dataItem;
    parent.moveStatusDetail(Item);
}

var app = setKendoMobApp();
</script>

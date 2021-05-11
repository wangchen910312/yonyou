<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 페이징 없는 리스트 -->

<div data-role="view">
<!-- <a data-role="button" data-click="searchBayNo">aaa</a> -->
  <ul id="listView" data-role="listview" data-source="listData"
    <%-- data-endless-scroll="true" --%>
    data-template="list-template"
    data-header-template="header-template"
    data-type = "group"
    data-fixed-headers="true"
    data-click="listViewClick"
    data-style="inset">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:70%">#:trimNull(resvDocNo) #</span>
    <span style="width:30%">#:changeResvStatCd(resvStatCd) #</span>

    <span class="clboth" style="width:35%">#:trimNull(bayNo) #</span>
    <span style="width:35%">#:trimNull(driverNm) #</span>
    <span style="width:30%">#:trimNull(carRegNo) #</span>

    <span class="clboth" style="width:35%">#:chgDate2Str(resvDt) #</span>
    <span style="width:35%">#:chgDate2TimeStr(resvDt) #</span>
    <span style="width:30%">#:resvReptStatCdGrid(resvReptStatCd)   #</span>

    <%--<span style="width:30%">#:trimNull(carNm) #</span>--%>
</div>
</script>

<script type="text/x-kendo-template" id="header-template">
    #:value #
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

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      /*
      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;
      */
      pageIndex++;


      loadData(options);

    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(){ return rowTotal; }
  },
  group:{field:"groupedResvDt"}
});


function loadData(options){

    var params = {};
    /*
    params["recordCountPerPage"] = pageSize;
    params["pageIndex"] = pageIndex;
    params["firstIndex"] = (pageIndex - 1) * pageSize;
    params["lastIndex"] = pageIndex * pageSize;
    */
    params["sort"] = null;
    //params["sort"] = [{"field":"resvDt","dir":"desc"}];  쿼리에 정렬코드 없음 reservationReceiptDAO.selectReservationReceiptByCondition

    params["sDriverNm"] = parent.$("#sDriverNm").val();
    params["sCarRegNo"] = parent.$("#sCarRegNo").val();

    params["sResvStatCd"] = parent.$("#sResvStatCd").data("kendoExtDropDownList").value();


    params["sBayNo"] = parent.$("#sBayNo").val();

    // 임시
    //params["sResvDocNo"] = parent.$("#sResvDocNo").val();
    //alert( params["sResvDocNo"]);

    if(parent.$("#sResvFromDt").val() == "" || parent.$("#search5Area span[name='searchStr']").text() == ""){
        params["sResvFromDt"] = null;
    }else{
        params["sResvFromDt"] = chgDate(parent.$("#sResvFromDt").val());
    }


    if(parent.$("#sResvToDt").val() == "" || parent.$("#search5Area span[name='searchStr']").text() == ""){
        params["sResvToDt"] = null;
    }else{
        params["sResvToDt"] = chgDate(parent.$("#sResvToDt").val());
    }


    $.ajax({
        url:"<c:url value='/mob/ser/rev/reservationReceipt/selectReservationReceipts.do' />"

        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            //mob.notification.error(jqXHR.responseJSON.errors);
            alert('error');
            app.hideLoading();
        }
        ,success:function(result) {
            if(result.data!=null && result.data != ""){
                var data = [];
                rowTotal = result.total;

                $.each(result.data , function(i , row){
                    rowIndex++;
                    data.push({
                        pageIdx:pageIndex,
                        rowIdx:rowIndex,
                        dlrCd:row.dlrCd,
                        resvDocNo:row.resvDocNo,
                        resvStatCd:row.resvStatCd,
                        resvTp:row.resvTp,
                        resvDt:row.resvDt,
                        serResvStartDt:row.serResvStartDt,
                        bayNo:row.bayNo,
                        driverNm:row.driverNm,
                        carRegNo:row.carRegNo,
                        carNm:row.carNm,

                        serResvEndDt:row.serResvEndDt,
                        noResvTp:row.noResvTp,
                        resvReptStatCd:row.resvReptStatCd,
                        groupedResvDt:changeGroupDate(row.resvDt)
                    });
                });

                options.success(data);

                app.hideLoading();
                return data;
                //mob.notification.success("<spring:message code='global.info.success'/>");
            }else{
                app.hideLoading();
                var data = [];
                options.success(data);
                return data;
            }
        }
    });
}

function changeGroupDate(obj){
    var result = "";
    if(obj != null && obj != ""){
        result = obj.substring(5,7)+"-"+obj.substring(8,10);
        //result = obj.substring(5,7);
    }else{
        result = "";
    }
    return result;
}


changeResvStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.resvStatCdObj[val];
    }
    return returnVal;
};

changeResvTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.resvTpCdObj[val];
    }
    return returnVal;
};



// 예약접수상태
    resvReptStatCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.resvReptStatCdArr[val].cmmCdNm;
        }
        return returnVal;
    }



function listViewClick(e){
}

function searchBayNo(bayNo){
    parent.$("#sBayNo").val(bayNo);

    $("#listView").data("kendoMobileListView").dataSource.data([]);
    $("#listView").data("kendoMobileListView").dataSource.read();
    $("#listView").data("kendoMobileListView").refresh();
}

var app = setKendoMobApp();

</script>

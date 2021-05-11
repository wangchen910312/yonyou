<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 페이징 없는 리스트 -->

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%">#:trimNull(rowData.carRegNo) #</span>
    <span style="width:50%">#:trimNull(rowData.vinNo) #</span>

    <span class="clboth" style="width:50%">#:trimNull(rowData.resvDocNo) #</span>
    <span style="width:50%">#:trimNull(rowData.regUsrNm) #</span>

    <span class="clboth" style="width:50%">#:trimNull(changeResvTpCd(rowData.resvTp)) #</span>
    <span style="width:50%">#:trimNull(changeResvStatCd(rowData.resvStatCd)) #</span>

    <span class="clboth" class="clboth" style="width:50%">#:trimNull(chgDate2DateTimeStr(rowData.serResvStartDt)) #</span>
    <span style="width:50%">#:trimNull(chgDate2DateTimeStr(rowData.resvDt)) #</span>
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
var tot = 0;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {
      pageIndex++;
      loadData(options);
    }
  },
  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(){ return rowTotal; }
  },
  //group:{field:"groupedResvDt", dir:"desc"}
  group:{field:"serResvStartDt", dir:"desc"}
});


function loadData(options){
    var params = {};

    params["sDlrCd"]       = "${dlrCd}";
    params["sCarRegNo"]    = parent.$("#sCarRegNo").val();
    //params["sCarOwnerNm"]  = parent.$("#sCarOwnerNm").val();
    params["sPreFixId"]    = "RE";

    params["sort"] = options.sort;
    params["sListType"] = '01';
    params["sRegUsrNm"] = parent.$("#sRegUsrNm").val();
    params["sResvTp"] = parent.$("#sResvTp").data("kendoExtDropDownList").value();
    params["sVinNo"] = parent.$("#sVinNo").val();
    params["sResvDocNo"] = parent.$("#sResvDocNo").val();
    params["sResvStatCd"] = parent.$("#sResvStatCd").data("kendoExtDropDownList").value();
    //params["sBayNo"] = parent.$("#sBayNo").val();
    //params["sBayNm"] = parent.$("#sBayNm").val();
    if(parent.$("#sResvFromDt").val() == "" ){
        params["sResvFromDt"] = null;
    }else{
        params["sResvFromDt"] = chgDate(parent.$("#sResvFromDt").val());
    }
    if(parent.$("#sResvToDt").val() == ""){
        params["sResvToDt"] = null;
    }else{
        params["sResvToDt"] = chgDate(parent.$("#sResvToDt").val());
    }

    if(parent.$("#sSerResvStartFromDt").val() == "" ){
        params["sSerResvStartFromDt"] = null;
    }else{
        params["sSerResvStartFromDt"] = chgDate(parent.$("#sSerResvStartFromDt").val());
    }
    if(parent.$("#sSerResvStartToDt").val() == ""){
        params["sSerResvStartToDt"] = null;
    }else{
        params["sSerResvStartToDt"] = chgDate(parent.$("#sSerResvStartToDt").val());
    }

    console.log("mob params",params);



    $.ajax({
        url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptsList.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            app.hideLoading();
        }
        ,success:function(result) {
            if(result.data!=null && result.data != ""){
                var data = [];
                rowTotal = result.total;
                tot = result.total;
                $.each(result.data , function(i , row){
                    rowIndex++;
                    data.push({rowData:result.data[i]});
                });
                checklistCnt("listarea_noData",tot,noDatamsg);
                parent.makeDetailHtml(result.data, parent.keyMapArr, "#defaultHtml", "#hiddenHtml");
                options.success(data);
                app.hideLoading();
                //return data;
            }else{
                tot = 0;
                app.hideLoading();
                checklistCnt("listarea_noData",tot,noDatamsg);
                var data = [];
                //options.success(data);
                //return data;
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
    parent.contentDetail(e.dataItem.rowData);
}
function searchBayNo(bayNo, bayNm){
    parent.$("#sBayNo").val(bayNo);
    parent.$("#sBayNm").val(bayNm);
    $("#listView").data("kendoMobileListView").dataSource.data([]);
    $("#listView").data("kendoMobileListView").dataSource.read();
    $("#listView").data("kendoMobileListView").refresh();
}

var app = setKendoMobApp();
</script>

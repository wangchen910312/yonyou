<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" id="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="checkitem" id="listContentRow">
    <span class="check">
        <input id="isSave_#:rowIdx #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rowIdx #"></label>
    </span>
    <span style="width:60%;">#:vehicleCd # (#:rowIdx #)</span>
    <span style="width:40%;">#:insertDate #</span>
    <input type="hidden" name="barcodeNo" value="#:trimNull(barcodeNo) #" />
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData = new kendo.data.DataSource({
    transport:{
      read:function(options) {
      }
    },
    pageSize:pageSize,
    serverPaging:false,
    schema:{
        total:function(){ return rowTotal; }
    }
});





function getItemList(resultList){

    var data = [];
    var ListView1 = $("#listview").data("kendoMobileListView");
    var rowCount = resultList.data.length;
    $.each(resultList.data , function(i , row){
        ListView1.dataSource.insert({
            rowIdx:rowCount,
            createDate:row.CREATE_DATE,
            insertDate:row.INSERT_DATE,
            vehicleCd:row.VEHICLE_CD,
            //barcodeNo:row.BARCODE
            barcodeNo:row.VEHICLE_CD
        });
        rowCount --;
    });
    ListView1.refresh();
}


function resetDataSource(){
    var ListView1 = $("#listview").data("kendoMobileListView");
    ListView1.dataSource.data([]);
}
$(document).ready(function() {
        //데이터 취득 그리드 생성후 데이터 조회를 위하여 timeout 설정
    setTimeout(function(){
              parent.getItemListInit(true);
      },200);

});


function trimNull(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = val;
    }
    return returnVal;
}

function listViewClick(e)
{
    //parent.contentDetailList(e.dataItem);//재고관리리스트 보기
}

var app = setKendoMobApp();

</script>

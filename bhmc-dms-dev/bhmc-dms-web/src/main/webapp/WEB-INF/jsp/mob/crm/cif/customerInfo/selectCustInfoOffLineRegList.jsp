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
<div class="dlistitem bgNone" id="listContentRow">
    <span style="width:50%">#:custNm #</span>
    <span style="width:50%">#:regDate #</span>
    <span style="width:50%" class="clboth">#:custHp #</span>
    <span style="width:50%">#:custSourceTxt #</span>
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

   // var data = [];
   /*  var result = JSON.parse(resultList);
    var ListView1 = $("#listview").data("kendoMobileListView");
    $.each(result , function(i , row){
        ListView1.dataSource.insert({
            custNm:row.CUST_NM,
            regDate:row.CREATE_DATE,
            custHp:row.CUST_HP,
            custSourceTxt:changeCustSource(row.CAMPAIN_CD)
        });
    });
    ListView1.refresh(); */
    
    var result = JSON.parse(resultList);
    var ListView1 = $("#listview").data("kendoMobileListView");
    var rowCount = result.data.length;
    
    if(rowCount > 0){
        $.each(result.data , function(i , row){
            ListView1.dataSource.insert({
                rowIdx:rowCount,
                custNm:row.CUST_NM,
                regDate:row.CREATE_DATE,
                custHp:row.CUST_HP,
                custSourceTxt:changeCustSource(row.CAMPAIN_CD)
            });
            rowCount --;
        });
    } else {
        checklistCnt("listarea_noData",rowCount,noDatamsg);
    }
    ListView1.refresh();
}

/* function addItemList(custNm, custHp, custSourceTxt, custSourceVal){

    var ListView1 = $("#listview").data("kendoMobileListView");
    var curDate = new Date();
    ListView1.dataSource.insert({
        custNm:custNm,
        regDate:chgServerDate2Str(curDate),
        custHp:custHp,
        custSourceTxt:changeCustSource(custSourceVal)
    });
    //ToDo 오프라인 native연동 테스트 필요
    //document.location='bhmccp://SAVE?TABLE_NM=Cust_info&return_func=returnFnc&CUST_NM='+custNm+'&CUST_HP='+custHp+'&CAMPAIN_CD='+custSource;
    ListView1.refresh();

} */

changeCustSource = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.custSourceObj[val];
    }
    return returnVal;
}

$(document).ready(function() {
    setTimeout(function(){
        parent.selectItemList(); //데이터 취득 그리드 생성후 데이터 조회를 위하여 timeout 설정
        //ToDo 오프라인 native연동 테스트 필요
        //네이티브 연동테스트 사용
        //테스트 결과 네이티브에서는 return함수를 메인jsp에서 사용함
        //적용시 수정 필요
        
                 
      },200);

});

function listViewClick(e)
{
    //parent.contentDetailList(e.dataItem);//재고관리리스트 보기
}

var app = setKendoMobApp();

</script>

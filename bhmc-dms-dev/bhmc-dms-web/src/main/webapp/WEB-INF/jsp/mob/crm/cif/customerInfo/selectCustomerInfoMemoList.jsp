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
    <span style="width:30%">#:trimNull(rnum) #</span>
    <span style="width:35%">#:memoTpChg(memoTp) #</span>
    <span style="width:35%">#:trimNull(shareYn) #</span>
    <span class="clboth" style="width:30%">#:trimNull(usrNm) #</span>
    <span style="width:65%">#:chgDateFormat(regDt) #</span>
    <span class="clboth" style="width:100%">#:trimNull(memoCont) #</span>
    <span class="delete">
        <span class="btn_del" onclick="javascript:removeItem(this);" #:delVisi(this) #>삭제</span>
    </span>
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
          url:"<c:url value='/mob/crm/cif/customerInfo/selectCustomerMemo.do' />"
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
              params["sCustNo"] = parent.$("#custNo").val();
              params["sMngScId"] = parent.$("#mngScId").val();

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
                 rnum:{type:"number" , editable:false}
               , memoTp:{type:"string", validation:{required:true} , editable:true}
               , memoCont:{type:"string", validation:{required:true} , editable:true}
               , shareYn:{type:"string", editable:true}
               , regDt:{type:"date", editable:false}         // 등록일
               , custNo:{type:"string", editable:false}
               , dlrCd:{type:"string", editable:false}
               , updtDt:{type:"date", editable:false}         // 수정일
               , usrNm:{type:"string", editable:false}
               , regUsrId:{type:"string", editable:false}
           }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("memoList", rTotal, "Y");
          parent.setSubListHeightNew("memoList",2,rTotal);
      }else{
          //parent.setSubListHeight2("memoList", 0, "Y");
          parent.setSubListHeightNew("memoList",2,0);
      }
      }, 200);

      checklistCnt("memoList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//유형
memoTpChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.memoTpMap[val];
    }
    return returnVal;
}

delVisi = function(obj){
   // var grid          = $("#memoGrid").data("kendoExtGrid");
  /*
    var mngScId = $("#mngScId").val();

    var grid          = $("#memoGrid").data("kendoExtGrid")
    , rows          = grid.tbody.find("tr");

    rows.each(function(index, row) {
        var gridData = grid.dataSource.at(index);
        console.log("------");
        console.log(gridData);
        console.log(gridData.regUsrId);
        console.log("------");
        console.log(row);

        if (mngScId != gridData.regUsrId) {
          $("input.grid-checkbox-item", row).prop("disabled", true);
          $("input.shareYn", row).prop("disabled", true);
          $("table", "#memoGrid").removeClass('k-selectable');
        } else {
          $("table", "#memoGrid").addClass('k-selectable');
        }
    });

    */

}

//추가
function addItemSubList1(data){
console.log(data);
    var subListView1 = $("#subListView1").data("kendoMobileListView");

    subListView1.dataSource.insert({
        "memoTp"            :data.memoTp
        , "memoCont"        :data.memoCont
        , "shareYn"         :data.shareYn
        , "custNo"          :parent.$("#custNo").val()            // 고객번호
        , "rnum"            :data.rnum
        ,"usrNm":""
        ,"regDt"            :chgDate(data.regDt)
    });

    subListView1.refresh();

    //저장
    parent.confirmOpen(confirmMsgSave,'parent.saveMemoList',y,n);
}

//삭제
function removeItem(obj){

    var uid = $(obj).parent().parent().parent().attr("data-uid");

    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        //console.log(        item);
        //console.log(        $(item).attr("data-uid") == uid);

        if($(item).attr("data-uid") == uid){
            return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    listData.remove(listData.data()[idx]);
    listView.refresh();

    //저장
    parent.confirmOpen(confirmMsgSave,'parent.saveMemoList',y,n);
}

chgDateFormat = function(val){
    console.log(val);
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm')
    }else{
        returnVal = '';
    }
    return returnVal;
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

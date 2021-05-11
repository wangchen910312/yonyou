<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData"  data-template="list-template" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:45%" >#:changeCarlineCd(carlineCd)   #</span>
    <span style="width:20%">#:flagYn#  </span>
    <span class="clboth" name="_itemCd" >#:modelCd #</span>
    <span class="delete" id="deleteItem">
        <span class="btn_del" name="deleteItem1" onclick="javascript:removeItem(this);"  #:delVisi(this) #>삭제</span>
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
          url:"<c:url value='/mob/crm/cso/salesOpptMgmt/selectCarLineInfo.do' />"
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

              params["sRefTableNm"] = "CR_0201T";
              params["sRefKeyNm"] = parent.$("#saleOpptNo").val();

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
          id:"seq",
          fields:{
              seq           :{type:"string"}
              ,rnum          :{type:"number" , editable:false}
              ,carlineCd     :{type:"string"}
              ,carlineNm     :{type:"string"}
              ,modelCd       :{type:"string"}
              ,modelNm       :{type:"string"}
              ,extColorCd    :{type:"string"}
              ,extColorNm    :{type:"string"}
              ,intColorCd    :{type:"string"}
              ,intColorNm    :{type:"string"}
              ,flagYn        :{type:"string", editable:true}
              ,regDt         :{type:"date"}
              ,updtDt        :{type:"date"}
          }
      }
  },
  change:function(e) {

       var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
          if(rTotal > 0){
              //parent.setSubListHeight2("intrList", rTotal, "N");
              parent.setSubListHeightNew("intrList",2,rTotal);
          }else{
              //parent.setSubListHeight2("intrList", 0, "N");
              parent.setSubListHeightNew("intrList",2,0);
          }
      }, 200);

      checklistCnt("intrList_noData",rTotal,noDatamsg);
    }
});

//관심차종
changeCarlineCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        //returnVal = parent.carLineCdObj[val].cmmCdNm;
        returnVal = parent.carLineCdObj[val];
    }
    return returnVal;
}

//삭제버튼 style 적용
delVisi = function(obj){
    var result = "";
    var saleOpptStepCd = parent.$("#saleOpptStepCd").val();

    if( saleOpptStepCd == "07" || saleOpptStepCd == "01"  || saleOpptStepCd == "06"  || saleOpptStepCd == "08" ){
        result = "style=display:none;";
    }

    return result;
}

//추가
function addItemSubList1(carlineCd, flagYn, modelCd){

    var subListView1 = $("#subListView1").data("kendoMobileListView");

    subListView1.dataSource.insert({
        carlineCd:carlineCd
        ,flagYn:flagYn
        ,modelCd:modelCd
        ,refTableNm:"CR_0201T"
    });

    subListView1.refresh();

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
    //listView.refresh();
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

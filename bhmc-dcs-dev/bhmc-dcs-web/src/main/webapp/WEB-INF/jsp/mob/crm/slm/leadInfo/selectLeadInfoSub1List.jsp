<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="sub1ListData"  data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
        <div class="deleteitem">
            <span style="width:50%">#:changeCarlineCd(carlineCd) #</span>
            <span style="width:50%">#:flagYn #</span>
            <span class="clboth" style="width:100%" name="_itemCd">#:modelCd #</span>
            <span class="delete" id="deleteItem">
                <span class="btn_del" name="deleteItem1" onclick="javascript:removeItem(this);"  #:delVisi(this) #>삭제</span>
            </span>
        </div>
</script>

<script>

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var showYn = "N";

var data = [];

var sub1ListData = new kendo.data.DataSource({

  transport:{
      read:{
          url:"<c:url value='/mob/crm/cmm/carLineInfo/selectCarLineInfo.do' />"
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

              params["sRefTableNm"]           = "CR_0202T";
              params["sRefKeyNm"]             = parent.$("#leadNo").val();

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
              seq:{type:"number"}
              ,carlineCd:{type:"string", validation:{required:true}}
              ,carlineNm:{type:"string", validation:{required:true}}
              ,modelCd:{type:"string", validation:{required:true}}
              //,modelNm:{type:"string", validation:{required:true}}
              ,flagYn:{type:"string", validation:{required:true}}
              ,refTableNm:{type:"string", validation:{required:true}}
              ,refKeyNm:{type:"string", validation:{required:true}}
              ,regDt:{type:"date"}
              ,updtDt:{type:"date"}
          }
      }
  },
  change:function(e) {

    var rTotal = 0;
    rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
    setTimeout(function(){
    if(rTotal > 0){
        parent.setSubListHeight2("subList1", rTotal, showYn);
    }else{
        parent.setSubListHeight2("subList1", 0, showYn);
    }
    }, 200);

  }

});




function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.itemCd);
}


changeCarlineCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        //returnVal = parent.carLineCdObj[val].cmmCdNm;
        returnVal = parent.carLineCdObj[val];
    }
    return returnVal;
}

function addItemSubList1(carlineCd, modelCd, flagYn){
    var subListView1 = $("#subListView1").data("kendoMobileListView");

   subListView1.dataSource.insert({
        carlineCd:carlineCd
        ,flagYn:flagYn
        ,modelCd:modelCd
        ,refTableNm:"CR_0202T"
    });

    showYn = "Y";
    subListView1.refresh();
}


function removeItem(obj){
    var itemCd = $(obj).parent().parent().find("span[name='_itemCd']").text();
    var idx = 0;
    $(obj).parent().parent().parent().parent().find("li").each(function(index, item){
        //console.log($(item).find("span[name='_itemCd']").text());
        if($(item).find("span[name='_itemCd']").text() == itemCd){
             return false;
        }
        idx++;
    })
    var listView = $("#subListView1").data("kendoMobileListView");
    sub1ListData.remove(sub1ListData.data()[idx-1]);
    showYn = "Y";
    listView.refresh();
}


delVisi = function(obj){
    var result = "";
    return result;
}

function resetSubList1(){
    var subListView1 = $("#subListView1").data("kendoMobileListView");
    subListView1.dataSource.data([]);
}

$(document).ready(function() {
    showYn = "N";

});

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();


</script>

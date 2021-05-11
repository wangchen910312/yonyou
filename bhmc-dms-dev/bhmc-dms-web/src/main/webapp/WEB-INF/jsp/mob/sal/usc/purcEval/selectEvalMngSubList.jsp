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
<div class="deleteitem bgNone">
    <span style="width:50%" onclick="javascript:onclickSubList(this);">#:chgDate2Str(regDt) #</span>
    <span style="width:50%" onclick="javascript:onclickSubList(this);">#:changeAuctCd(auctCd) #</span>
    <span style="width:50%" class="clboth" onclick="javascript:onclickSubList(this);">#:trimNull(auctPlaceNm) #</span>
    <span style="width:50%" onclick="javascript:onclickSubList(this);">#:trimNull(auctAmt) #</span>
    <%-- <span style="width:50%" class="clboth" onclick="javascript:onclickSubList(this);">#:trimNull(goodsDetlCont) #</span> --%>
    <span style="width:50%" onclick="javascript:onclickSubList(this);">#:changeCarDlYnMap(carDlYn) #</span>
    <span style="width:50%" class="clboth" onclick="javascript:onclickSubList(this);">#:chgDate2Str(scheConfirmDt) #</span>
    <span style="width:100%" class="clboth" onclick="javascript:onclickSubList(this);">#:trimNull(remark) #</span>
    <span class="delete" id="deleteItem">
        <span class="btn_del" name="deleteItem1" onclick="javascript:removeItem(this);return false;"  #:delVisi(this) #>삭제</span>
    </span>
    <input type="hidden" name="seq" value="#:seq #"/>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var showYn = "N";

var data = [];
// datasource below is customized for demo purposes.

var listData = new kendo.data.DataSource({
      transport:{
          read:{
              url:"<c:url value='/mob/sal/usc/purcEval/selectAuctInfo.do' />"
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

                  params["sDlrCd"] = parent.sDlrCd;
                  params["sPurcNo"] = parent.sPurcNo;

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
              id:"auctPk"
              ,fields:{
                   dlrCd  :{type:"string"}
                  ,purcNo :{type:"string"}
                  ,seq:{type:"string"}
                  ,auctCd :{type:"string"}
                  ,auctPlaceNm:{type:"string"}
                  ,auctAmt :{type:"string"}
                  ,goodsDetlCont    :{type:"string"}
                  ,carDlYn :{type:"string"}
                  ,scheConfirmDt      :{type:"date"}
                  ,remark:{type:"string"}
                  ,regDt  :{type:"date"}
                  ,updtDt:{type:"date"}
              }
          }
      },
      change:function(e) {

          var rTotal = 0;
          rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
          setTimeout(function(){
              if(rTotal > 0){
                 //parent.setSubListHeight2("subList", rTotal, showYn);
                 parent.setSubListHeightNew("subList",5,rTotal);
              }else{
                 //parent.setSubListHeight2("subList", 0, showYn);
                 parent.setSubListHeightNew("subList",5,0);
              }
              checklistCnt("listarea_noData_dt",rTotal,noDatamsg);

              if(parent.$("#purcStatCd").val()=='01'
              || parent.$("#purcStatCd").val()=='03'
              || parent.$("#purcStatCd").val()=='04'
              || parent.$("#purcStatCd").val()=='05' ){
                    $("#deleteItem").hide();
              }

          }, 200);

      },
      error:function(e){
          parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
      }
});

//매입상태
changeAuctCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.auctCdMap[val].cmmCdNm;
    }
    return returnVal;
}

changeCarDlYnMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.carDlYnMap[val].cmmCdNm;
    }
    return returnVal;
}
function listViewClick(e)
{
    //var dataItem = e.dataItem;
    //parent.contentDetail(e.dataItem.itemCd);
    //parent.contentDetail(e.dataItem);
}
var dataUid = "";
function saveItemSubList(){
    var subListView1 = $("#subListView1").data("kendoMobileListView");

    if(parent.addModiFl == "I") {
       subListView1.dataSource.insert(
           { regDt:new Date(parent.toDay),
               dlrCd:parent.$("#dlrCd").val(),
               purcNo:parent.$("#purcNo").val(),
               seq:"",
               auctCd:parent.$("#auctCd").val(),
               auctPlaceNm:parent.$("#auctPlaceNm").val(),
               auctAmt:parent.$("#auctAmt").val(),
               goodsDetlCont:parent.$("#goodsDetlCont").val(),
               carDlYn:parent.$("#carDlYn").val(),
               scheConfirmDt:new Date(parent.$("#scheConfirmDt").val()),
               remark:parent.$("#remark").val()
               }
        );

    } else {  //수정시
        //현재 수정 선택 한 데이터의 위치
        var rowNum = listData.getByUid(dataUid).rnum;
        var updModel = subListView1.dataSource.at(rowNum-1);

        updModel.set("regDt" , parent.toDay);
        updModel.set("dlrCd" , parent.$("#dlrCd").val());
        updModel.set("purcNo" , parent.$("#purcNo").val());
        updModel.set("seq" , parent.$("#seq").val());
        updModel.set("auctCd" , parent.$("#auctCd").val());
        updModel.set("auctPlaceNm" , parent.$("#auctPlaceNm").val());
        updModel.set("auctAmt" , parent.$("#auctAmt").val());
        updModel.set("goodsDetlCont" , parent.$("#goodsDetlCont").val());
        updModel.set("carDlYn" , parent.$("#carDlYn").val());
        updModel.set("scheConfirmDt" , new Date(parent.$("#scheConfirmDt").val()));
        updModel.set("remark" , parent.$("#remark").val());
    }
    showYn = "Y";
    subListView1.refresh();
    parent.doSaveSubList();
}

function removeItem(obj){
    /* var itemCd = $(obj).parent().parent().find("span[name='_itemCd']").text();
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
    */
    var model = listData.getByUid($(obj).parent().parent().parent().attr(("data-uid")));
    listData.remove(model);
    showYn = "Y";
    var subListView1 = $("#subListView1").data("kendoMobileListView");
    subListView1.refresh();
    parent.doSaveSubList();
}

function onclickSubList(obj){
    //var model = listData.getByUid($(obj).parent().parent().attr(("data-uid")));
    dataUid = $(obj).parent().parent().attr("data-uid") ;
    var model = listData.getByUid(dataUid);
    parent.contentSubDetail(model);
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
    showYn = "Y";

});


var app = setKendoMobAppForNativeScroll();
//var app = setKendoMobApp();

</script>
